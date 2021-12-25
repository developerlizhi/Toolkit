#!/bin/sh
#!/bin/bash
REPO_PATH=$MAVEN_HOME"/repository"
echo "清理{.lastUpdated}文件"
find $REPO_PATH -name  "*.lastUpdated" | xargs rm -fr
echo "清理完成"