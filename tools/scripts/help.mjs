// author: William C. Canin
import fs from 'fs';
import kleur from 'kleur';
import path from 'path';
import { fileURLToPath } from 'url';

// Recreate functionality to get package.json
const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);
const packageJsonPath = path.resolve(__dirname, '..', '..', 'package.json');
const packageJson = JSON.parse(fs.readFileSync(packageJsonPath, 'utf8'));

function showMenu() {
  const projectName = packageJson.name;
  const projectVersion = packageJson.version;
  const projectDescription = packageJson.description;

  const menuText = `
  ${kleur.cyan(projectName)} - v${projectVersion}
  ${kleur.green('-------------------------------------------------------------')}
  ${kleur.cyan(projectDescription)}

  Use ${kleur.white('npm run <command>')} to perform a task.

  ${kleur.underline('Commands:')}              ${kleur.underline('Description:')}

  install ------------------ Install '${projectName}' dependencies
  build -------------------- Compile the website
  serve -------------------- Create a website preview server
  create:draft ------------- Create a draft for a post
  create:page -------------- Create a page
  create:pixel ------------- Create a post for pixel
  create:resume ------------ Create the resume page (CV)
  post:draft --------------- Opens a selector to move drafts to posting
  home:about --------------- Set the home page as the about page
  home:blog ---------------- Set the home page as the weblog page
  blog:disable ------------- Disables the Blog, leaving only the pages
  blog:enable -------------- Enable the Blog
  pixels:disable ----------- Disables the Pixels, leaving only the pages
  pixels:enable ------------ Enable the Pixels
  clean:cache -------------- Remove cache Jekyll
  clean:all ---------------- Remove ALL dependencies and builds from the website
  publish:gem -------------- Publish the gem on ${kleur.underline('https://rubygems.org')} ${kleur.yellow('[for developer]')}
  generate:gem ------------- Create gem '${projectName}' ${kleur.yellow('[for developer]')}
  help --------------------- Print this menu

  ${kleur.gray(`© ${projectName} 2025 - https://rawfeed.github.io`)}
  `;

  console.log(menuText);
}

showMenu();
