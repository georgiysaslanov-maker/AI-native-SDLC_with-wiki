@echo off
rem Double-click: two-way sync of the knowledge base with GitHub.
powershell.exe -NoProfile -ExecutionPolicy Bypass -File "%~dp0scripts\sync.ps1" %*
