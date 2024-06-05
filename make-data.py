#!/usr/bin/env python3

import json
import sys
from pathlib import Path

base_path = Path(sys.argv[1])

data = {}

with (base_path / "title.txt").open() as f:
  for line in f:
    line = line.strip()
    if not line:
      continue
    data["title"] = line
    break

with (base_path / "description.txt").open() as f:
  data["description"] = f.read().strip()


data["images"] = [f"/{i}" for i in base_path.glob("*.jpeg")]


with (base_path / "data.json").open("w") as f:
  json.dump(data, f)
