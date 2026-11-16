const { chromium } = require("playwright");
const assert = require("node:assert/strict");
(async () => {
  const browser = await chromium.launch({
    executablePath: process.env.CHROME_BIN || "/usr/bin/google-chrome-stable",
    args: ["--no-sandbox"],
  });
  const context = await browser.newContext({
    viewport: { width: 1440, height: 1000 },
    permissions: ["clipboard-read", "clipboard-write"],
  });
  const page = await context.newPage();
  page.setDefaultTimeout(6000);
  let errors = [];
  page.on("pageerror", (e) => errors.push(e.message));
  const base =
    process.env.RAWFEED_BROWSER_URL || "http://127.0.0.1:4175/preview";
  await page.goto(base + "/");
  await page.waitForTimeout(1000);
  assert(
    await page.locator('#rf-menu a[href="/preview/pixels/"]').count(),
  );
  assert(await page.locator('#rf-menu a[href="/preview/pub/"]').count());
  await page.locator('[data-rf="settings"]').first().click();
  await page.locator('[data-theme-choice="light"]').click();
  assert.equal(await page.locator("html").getAttribute("data-theme"), "light");
  await page.locator('[data-setting="scan"]').click();
  assert(await page.locator("html.scan").count());
  await page.locator("#rf-settings [data-close]").click();
  await page.reload();
  await page.waitForTimeout(400);
  assert.equal(await page.locator("html").getAttribute("data-theme"), "light");
  assert(await page.locator("html.scan").count());
  await page.locator('[data-language="pt"]').click();
  assert.equal(
    await page.locator('[data-ui="settings"]').first().innerText(),
    "Configurações",
  );
  await page.locator('.tbar [data-rf="menu"]').click();
  await page.keyboard.press("Escape");
  await page.locator("#content").focus();
  await page.keyboard.press("ArrowDown");
  assert(await page.locator("#content .item.is-sel").count());
  await page.goto(base + '/');
  await page.locator('#rf-home-search').fill('jekyll');
  await page.waitForTimeout(500);
  assert(await page.locator('#rf-home-results a').count());
  assert.equal(await page.locator('#rf-search').count(),0);
  await page.goto(base + '/blog/');
  assert.equal(await page.locator('#blog-search__input').count(),0);
  await page.keyboard.press('m');
  assert(await page.locator('#rf-menu').evaluate(el=>el.open));
  assert.equal(await page.locator('#rf-menu .is-sel').count(),0);
  assert.equal(await page.locator('#rf-menu a:focus').count(),0);
  await page.keyboard.press('Escape');
  await page.goto(base + '/resume/');
  await page.keyboard.press('m');
  assert(await page.locator('#rf-menu').evaluate(el=>el.open));
  assert.equal(await page.locator('#rf-menu .is-sel').count(),0);
  await page.keyboard.press('ArrowDown');
  assert.equal(await page.locator('#rf-menu .item.is-sel').count(),1);
  await page.keyboard.press('Escape');
  const searchIndex = await (await page.request.get(base+'/assets/json/site_search.json')).json();
  assert(searchIndex.every(entry=>!entry.url.includes('/blog/tags/')));
  await page.goto(base + "/blog/content-styles-and-codeblocks/");
  await page.waitForTimeout(1000);
  assert(await page.locator(".tab-btn").count());
  await page.locator(".tab-btn").last().click();
  assert(await page.locator("details").count());
  await page.locator(".copy-btn").first().click();
  assert(
    (await page.evaluate(() => navigator.clipboard.readText())).length > 0,
  );
  const toc = page.locator("#auto-toc a");
  assert(await toc.count());
  await toc.last().evaluate((a) => a.click());
  await page.waitForTimeout(700);
  assert(await page.locator("#content").evaluate((el) => el.scrollTop > 0));
  console.log("markdown, copy and TOC passed");
  await page.goto(base + "/donate/");
  const qr = page.locator(".clickable-qr");
  if (await qr.count()) {
    await qr.first().click();
    await page.waitForTimeout(350);
    assert(await page.locator("#qrModal[open]").count());
    await page.keyboard.press("Escape");
  }
  console.log("donations passed");
  await page.goto(base + "/resume/");
  await page.emulateMedia({ media: "print" });
  assert.equal(
    await page.locator(".win").evaluate((el) => getComputedStyle(el).position),
    "static",
  );
  await page.pdf({ path: "/tmp/rawfeed-qa/resume.pdf" });
  await page.emulateMedia({ media: "screen" });
  console.log("print passed");
  assert(await page.locator('.rf-resume-grid').evaluate(el=>el.clientWidth>innerWidth*.85));
  const resumeTitles = page.locator('.rf-resume-grid .section-title');
  await page.locator('.brand').focus();
  await page.keyboard.press('ArrowDown');
  assert(await resumeTitles.first().evaluate(el=>el.classList.contains('is-sel')));
  await page.keyboard.press('ArrowUp');
  assert(await resumeTitles.last().evaluate(el=>el.classList.contains('is-sel')));

  await page.goto(base + '/');
  await page.waitForTimeout(300);
  await page.locator('.fbar [data-rf="settings"]').click();
  await page.locator('[data-effect="replay"]').click();
  assert(await page.locator('#rf-boot').isVisible());
  await page.waitForTimeout(1000);
  await page.locator('.fbar [data-rf="terminal"]').click();
  assert.equal(await page.locator('#rf-terminal').evaluate(el=>getComputedStyle(el).padding),'0px');
  assert.equal(await page.locator('#rf-terminal .terminal-header button').count(), 0);
  await page.keyboard.press('Escape');
  assert(!(await page.locator('#rf-terminal').evaluate(el=>el.open)));
  for (const width of [360, 390, 760, 1440, 1900]) {
    await page.setViewportSize({ width, height: 900 });
    for (const route of [
      "/",
      "/blog/",
      "/resume/",
      "/contact/",
      "/pixels/",
      "/pub/",
      "/any-page/",
    ]) {
      await page.goto(base + route);
      assert(await page.locator('#content').evaluate(el=>el.clientWidth>innerWidth*.85),route+' content width '+width);
      assert.equal(
        await page.evaluate(
          () => document.documentElement.scrollWidth > innerWidth,
        ),
        false,
        route + " overflow " + width,
      );
    }
  }
  console.log("responsive passed");
  console.log("JS errors", errors);
  assert.deepEqual(errors, []);
  await browser.close();
})().catch((e) => {
  console.error(e);
  process.exit(1);
});
