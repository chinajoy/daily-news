@echo off
chcp 65001 >nul
setlocal

cd /d "E:\aidesign\daily-news"

:: 检查是否有变更
set "HAS_CHANGES=0"

git diff --quiet HEAD
git diff --quiet --cached

:: 如果工作区有未跟踪或修改的文件，git diff 会返回非0
:: 检查未跟踪文件
for /f "delims=" %%a in ('git status --porcelain') do (
    set "HAS_CHANGES=1"
)

if "%HAS_CHANGES%"=="0" (
    echo %date% %time% - 无变更，跳过推送 >> auto-push.log
    goto :eof
)

:: 添加所有变更
git add .

:: 提交
git commit -m "auto: daily news update %date%"

:: 推送到 GitHub
set HTTP_PROXY=http://127.0.0.1:7897
set HTTPS_PROXY=http://127.0.0.1:7897
git push origin master

if %errorlevel%==0 (
    echo %date% %time% - 推送成功 >> auto-push.log
) else (
    echo %date% %time% - 推送失败，请检查网络和代理 >> auto-push.log
)

goto :eof
