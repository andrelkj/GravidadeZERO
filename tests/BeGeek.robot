*** Settings ***
Documentation       BeGeek Test Suite

Resource            ../resources/Base.robot

Test Setup          Start Section
Test Teardown       Finish Section


*** Test Cases ***
Be a Geek
    # Given that I have a common user
    ${user}    Factory User Be Geek

    # And I log in the plataform Getgeeks
    Do Login    ${user}

    # When submitting the form to become a Geek (service provider)
    Go To Geek Form

    Fill Geek Form    ${user}[geek_profile]
    Sleep    10

    # Then I should see the success message


*** Keywords ***
Go To Geek Form
    Click    css=a[href="/be-geek"] >> text=Seja um Geek

    Wait For Elements State    css=.be-geek-form    visible    5

Fill Geek Form
    [Arguments]    ${geek_profile}

    Fill Text    id=whatsapp    ${geek_profile}[whats]
    Fill Text    id=desc    ${geek_profile}[desc]

    Select Options By    id=printer_repair    text    ${geek_profile}[printer_repair]
    Select Options By    id=work    text    ${geek_profile}[work]
