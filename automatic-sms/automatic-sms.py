# /usr/bin/env python

""" [Text Messages] A collection of pre-written messages to be sent 
out to people I care about. """

PRE_WRITTEN_SMS = [
    "Good Morning Sunshine <3",
    "Can't stop thinking about you, XOXO",
    "Looking forward our date tonight :-*"
]

""" Using a SMS API and gateway to send our SMS out, here with
Twilio """

from twilio.rest import Client
import schedule
import random
import time

RECEIVER_NUMBER = "+47XXXXXXXX"
TWILIO_NUMBER = "+18013412886"


def send_sms(message):
    # Find these values at https://twilio.com/user/account
    account_sid = "AC50d1fc7c1bbe07d28508645106fda381"
    auth_token = "63bce06a76db1b093eff410f17f92165"

    client = Client(account_sid, auth_token)

    client.api.account.messages.create(
        to= RECEIVER_NUMBER,
        from_= TWILIO_NUMBER,
        body=message
    )

""" Scheduling Fuction so we can sleep in while the SMS 
is being sent"""
todays_message = PRE_WRITTEN_SMS[random.randint(0, len(PRE_WRITTEN_SMS) -1)]
schedule.every().day.at("06:00").do(
    send_sms, todays_message
)

schedule.every().day.at("12:58").do(
    send_sms, todays_message
)

while True:
    schedule.run_pending()
    time.sleep(1)





