// author: William C. Canin
import { build as esbuild } from 'esbuild';
import { promises as fs } from 'fs';
import { glob } from 'glob';
import { minify as htmlMinify } from 'html-minifier-terser';
import kleur from 'kleur';

const buildDir = '_site';

// Minifies all JavaScript files in the build directory
async function minifyJavaScript() {
  console.log(kleur.yellow('Minifying JavaScript files...'));
  try {
    const jsFiles = await glob(`${buildDir}/assets/js/**/*.js`);
    if (jsFiles.length === 0) {
      console.log(kleur.gray('No JavaScript files found to minify.'));
      return;
    }

    await esbuild({
      entryPoints: jsFiles,
      outdir: `${buildDir}/assets/js`,
      minify: true,
      allowOverwrite: true,
      bundle: false, // Minify files individually
    });

    console.log(kleur.green('JavaScript minified successfully!'));
  } catch (error) {
    console.error(kleur.red('Error minifying JavaScript:'), error);
    throw error; // Propagate the error to stop the script
  }
}

// Minifies all HTML files in the build directory
async function minifyHtml() {
  console.log(kleur.yellow('Minifying HTML files...'));
  try {
    const htmlFiles = await glob(`${buildDir}/**/*.html`);
    if (htmlFiles.length === 0) {
      console.log(kleur.gray('No HTML files found to minify.'));
      return;
    }

    const minifyPromises = htmlFiles.map(async (file) => {
      const content = await fs.readFile(file, 'utf8');
      const minifiedContent = await htmlMinify(content, {
        collapseWhitespace: true,
        removeComments: true,
        minifyCSS: true,
        minifyJS: true,
      });
      await fs.writeFile(file, minifiedContent);
    });

    await Promise.all(minifyPromises);
    console.log(kleur.green('Minified HTML successfully!'));
  } catch (error) {
    console.error(kleur.red('Error minifying HTML:'), error);
    throw error;
  }
}

// Main function that orchestrates the minify
async function main() {
  console.log(kleur.cyan('Starting minify process...'));
  try {
    // Perform minification in parallel
    await Promise.all([
      minifyJavaScript(),
      minifyHtml()
    ]);
    console.log(kleur.bold().bgGreen('\n Minify completed successfully!\n'));
  } catch (error) {
    console.error(kleur.bold().bgRed('\n An error occurred during minify.\n'), error.shortMessage || error);
    process.exit(1); // Terminates the process with an error code (1)
  }
}

main();
