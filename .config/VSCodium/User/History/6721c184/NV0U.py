import datetime
import time
import subprocess

URL = 'https://cooptalis.udemy.com/e87409d6-6ccc-4af7-aadb-aebf5c941cc1'
quality = 'best' # 720p, 480p, 240p 


def job_function():
    now = datetime.datetime.now()
    outputfile = str(now.year)+'-'+str(now.month)+'-'+str(now.day)+'-'+str(now.hour)+str(now.minute)+'.ts'
    
    command='streamlink ' + URL + ' '+ quality + ' --hls-start-offset 01:00:00 --hls-duration 01:00:00 -o ' + outputfile
    subprocess.call(command, shell=True)
    time.sleep(20)

job_function()
