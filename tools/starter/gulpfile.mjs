// author: William C. Canin
import { deleteAsync } from "del";
import fs from 'fs';
import gulp from "gulp";
import htmlmin from "gulp-htmlmin";
import uglify from "gulp-uglify";
import kleur from 'kleur';
import path from 'path';
import { fileURLToPath } from 'url';

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);
const packageJsonPath = path.resolve(__dirname, 'package.json');
const packageJson = JSON.parse(fs.readFileSync(packageJsonPath, 'utf8'));

// menu
export function menu() {
  const projectName = packageJson.name;
  const projectVersion = packageJson.version;
  const projectDescription = packageJson.description;

  const menuText = `
  ${kleur.cyan(projectName)} - v${projectVersion}
  ${kleur.green('-------------------------------------------------------------')}
  ${kleur.cyan(projectDescription)}

  npm run [command]

  ${kleur.underline('Commands:')}              ${kleur.underline('Description:')}

  install    ----------- Install '${projectName}' dependencies
  build      ----------- Compile the website
  serve      ----------- Create a website preview server
  draft      ----------- Create a draft for a post
  posts      ----------- Opens a selector to move drafts to posting
  page       ----------- Create a page
  resume     ----------- Create the resume page (CV)
  home:about ----------- Set the home page as the about page
  home:blog  ----------- Set the home page as the weblog page
  blog:disable ----------- Disables the Blog, leaving only the pages
  blog:enable  ----------- Enable the Blog
  clean      ----------- Remove ALL dependencies and builds from the website
  help       ----------- Print this menu
  `;

  console.log(menuText);
  return Promise.resolve();
}


// clean
export function clean() {
  const objs = [
    "node_modules",
    ".bundle-cache",
    ".jekyll-cache",
    "package-lock.json",
    "Gemfile.lock",
    "_site",
  ];
  return deleteAsync(objs);
}

// minify js
export function javascripts() {
  return gulp
    .src("_site/assets/js/**/*.js")
    .pipe(uglify())
    .pipe(gulp.dest("_site/assets/js"));
}

// minify html
export function html_minify() {
  return gulp
    .src("_site/**/*.html")
    .pipe(htmlmin({ collapseWhitespace: true, removeComments: true }))
    .pipe(gulp.dest("_site"));
}

// tasks
export const build = gulp.series(
  gulp.parallel(html_minify, javascripts)
);
export default build;
