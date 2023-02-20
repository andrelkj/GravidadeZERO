*** Settings ***
Documentation       Base Test

Library             Browser
Library             Collections
Library             factories/Users.py
Resource            actions/AuthActions.robot
Resource            actions/SignupActions.robot
Resource            actions/GeekActions.robot
Resource            Database.robot
Resource            Helpers.robot
Resource            actions/_SharedActions.robot


*** Variables ***
${BASE_URL}     https://geeks-web-andre.fly.dev


*** Keywords ***
Start Session
    New Browser    chromium    headless=false    slowMo=00:00:00.4
    New Page    ${BASE_URL}

Finish Session
    Take Screenshot    fullPage=true
