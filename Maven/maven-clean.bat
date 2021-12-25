@echo off
set REPO_PATH=%$MAVEN_HOME%\repository
echo 清理{.lastUpdated}文件
del /s %REPO_PATH%\*.lastUpdated
echo 清理完成
pause