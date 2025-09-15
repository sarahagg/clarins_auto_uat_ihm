*** Settings ***
Documentation       all the keywords needed to navigate on the Home Page

Resource            ..${/}Common${/}a_import_all_common_SFCC.resource

*** Keywords ***
Go To Reward Page
    log   1111111111111111
    hover    ${headerMenu_login_button}
    log   22222222222222222
    ###Click    ${headerMenu_my_rewards_button}
Choose A Reward
    log  333333333
    click    ${rewardPage_first_reward_of_500_points}
