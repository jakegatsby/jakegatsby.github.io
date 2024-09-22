import os
from pathlib import Path

import markdown

IMAGE_SUFFIXES = [
  ".jpg",
  ".jpeg",
]

def on_config(config):
  global BASEDIR
  BASEDIR = Path(config["docs_dir"])


def is_display(page):
	return Path(page.url).parent.name == "displays"


def is_artifact(page):
	return Path(page.url).parent.name == "artifacts"
	
	
# FIXME return url, title, parent display
def get_artifacts(page):
  artifacts = []
  for artifact_dir in (BASEDIR / Path(page.url) / "artifacts").glob("*"):
    index_data = (artifact_dir / "index.md").read_text(encoding="utf-8")
    md = markdown.Markdown(extensions=['meta'])
    md.convert(index_data)
    title = md.Meta["title"][0]
    url = str(artifact_dir).replace(str(BASEDIR), "") + "/"
    artifacts.append({
      "title": title,
      "url": url
    })
    
  print("XXXXXXXXXXXXXXXXXXX", artifacts)
  return artifacts


def images(page):	
  return [p.name for p in (BASEDIR / page.url).glob("*") if p.suffix in IMAGE_SUFFIXES]


def on_env(env, config, files):
  env.filters["images"] = images
  env.filters["is_display"] = is_display
  env.filters["is_artifact"] = is_artifact
  env.filters["get_artifacts"] = get_artifacts
  return env
