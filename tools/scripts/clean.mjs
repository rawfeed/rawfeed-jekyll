// author: William C. Canin
import { deleteAsync } from "del";
import kleur from 'kleur';

const jekyllCachePaths = [
  ".jekyll-metadata",
  ".jekyll-cache",
  "_site",
];

const pathsToDelete = [
  "node_modules",
  ".bundle-cache",
  "package-lock.json",
  "Gemfile.lock",
  ".jekyll-metadata",
  ".jekyll-cache",
  "_site",
];

async function cleanJekyllCache() {
  console.log(kleur.yellow('Cleaning Jekyll cache...'));
  try {
    const deletedPaths = await deleteAsync(jekyllCachePaths);
    if (deletedPaths.length > 0) {
      console.log(kleur.green('Items successfully removed:'));
      deletedPaths.forEach(path => console.log(kleur.gray(`  - ${path}`)));
    } else {
      console.log(kleur.gray('No items to clean.'));
    }
  } catch (error) {
    console.error(kleur.red('Error trying to clean project:'), error);
    process.exit(1);
  }
}

async function cleanProject() {
  console.log(kleur.yellow('Cleaning up project directories and files...'));
  try {
    const deletedPaths = await deleteAsync(pathsToDelete);
    if (deletedPaths.length > 0) {
      console.log(kleur.green('Items successfully removed:'));
      deletedPaths.forEach(path => console.log(kleur.gray(`  - ${path}`)));
    } else {
      console.log(kleur.gray('No items to clean.'));
    }
  } catch (error) {
    console.error(kleur.red('Error trying to clean project:'), error);
    process.exit(1);
  }
}

const args = process.argv.slice(2);

if (args.includes('--cache')) {
  await cleanJekyllCache();
} else if (args.includes('--all')) {
  await cleanProject();
} else {
  console.log(kleur.red('Missing argument.'));
  console.log(kleur.yellow('Use one of:'));
  console.log(kleur.gray('  --all   → clean full project'));
  console.log(kleur.gray('  --cache → clean only Jekyll cache'));
  process.exit(1);
}
