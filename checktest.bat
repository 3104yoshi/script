@ This bat file is for comparing .\out\out*.txt with .\ans\ans*.txt
@echo off
setlocal enabledelayedexpansion
set out_=.\out\out
set ans_=.\ans\ans
set extension=.txt
for /l %%i in (0,1,10) do (
  set y=%%i
  set out_file=!out_!!y!!extension!
  set ans_file=!ans_!!y!!extension!
  fc !out_file! !ans_file! /b
  if !ERRORLEVEL! == 0 (
    echo %%i
    echo OK!
  ) else (
    echo %%i
    echo NG!
  )
)
endlocal
