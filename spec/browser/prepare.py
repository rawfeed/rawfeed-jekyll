from pathlib import Path
import subprocess,shutil,sys
root=Path(__file__).resolve().parents[2]; dest=Path(sys.argv[1]).resolve();dest.mkdir(parents=True,exist_ok=True)
files=subprocess.check_output(['git','ls-files','--cached','--others','--exclude-standard','-z'],cwd=root).decode().split('\0')
for name in files:
 if name and (root/name).is_file():
  target=dest/name;target.parent.mkdir(parents=True,exist_ok=True);shutil.copy2(root/name,target)
p=dest/'_config.yml';s=p.read_text().replace('baseurl: ""','baseurl: "/preview"').replace('per_page: 50','per_page: 1').replace('published: false','published: true');p.write_text(s)
# Cover the publication listing without adding user content to the actual checkout.
(dest/'pub').mkdir(exist_ok=True);(dest/'pub'/'example.txt').write_text('QA fixture')

p=dest/'_data/screen/head.yml';s=p.read_text().replace('    apps_script:\n      url:','    apps_script:\n      url: https://example.test/contact').replace('    recaptcha:\n      pubkey:','    recaptcha:\n      pubkey: qa-key');p.write_text(s)

# Provide an explicit listing page: the UI fixture does not exercise the directory generator.
(dest/'pub'/'index.html').write_text('---\nlayout: pub\ntitle: Publications\npermalink: /pub/\ndirectory_contents:\n  - name: example.txt\n    type: file\n    url: /pub/example.txt\n    size: 10\n---\n')
