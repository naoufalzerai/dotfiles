import datetime
import time
import subprocess

URL = 'https://www.youtube.com/watch?v=wcnQftTVk9U'
quality = 'best' # 720p, 480p, 240p 


def job_function():
    now = datetime.datetime.now()
    outputfile = str(now.year)+'-'+str(now.month)+'-'+str(now.day)+'-'+str(now.hour)+str(now.minute)+'.ts'
    
    command='streamlink ' + URL + ' '+ quality + ' --hls-start-offset 01:00:00 --hls-duration 01:00:00 -o ' + outputfile
    subprocess.call(command, shell=True)
    time.sleep(20)

job_function()
