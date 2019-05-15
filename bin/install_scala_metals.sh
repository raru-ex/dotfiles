#!/bin/zsh

echo "[INFO] start set up Metals"

if !(type /usr/local/bin/coursier > /dev/null 2>&1); then
  echo "[INFO] install coursier"
  /usr/bin/curl -L -o /usr/local/bin/coursier https://git.io/coursier
  chmod +x /usr/local/bin/coursier
fi

if [ -e ~/..config/coc ]; then
  mkdir -p ~/.config/coc/extensions
fi

echo "[INFO] execute coursier for metals"
/usr/local/bin/coursier bootstrap \
  --java-opt -Xss4m \
  --java-opt -Xms100m \
  --java-opt -Dmetals.client=coc.nvim \
  --java-opt -Dmetals.sbt-script=/usr/local/bin/sbt \
  org.scalameta:metals_2.12:0.5.2\
  -r bintray:scalacenter/releases \
  -r sonatype:snapshots \
  -o /usr/local/bin/metals-vim -f

echo "[INFO] Finished"
