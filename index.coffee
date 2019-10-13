#Refresh time (default: 10 seconds)
refreshFrequency: '2s'

#Body Style
#Helvetica Neue, Arial
style: """
  color: #fff
  font-family: 'Nunito', sans-serif;

  .container
   margin-top:43%
   height:800px
   width:800px
   font-weight: lighter
   font-smoothing: antialiased
   text-align:center
   margin-left:58%
   text-shadow:2px 6px 0px rgba(255,222,222,1);

  .time
   font-size: 14em
   font-weight:700
   text-align:center

  .half
   font-size:0.4em
   margin-left: -3%

  .hour
   margin-right:1%
   color:#fff

  .min
   margin-left:-6%
   color:#fff

"""

#Render function
render: -> """
<link href="https://fonts.googleapis.com/css?family=Nunito:700&display=swap" rel="stylesheet">
  <div class="container">
  <div class="time">
  <span class="hour"></span>:
  <span class="min"></span>
  <span class="half"></span>
  </div>
  </div>

"""

  #Update function
update: (output, domEl) ->

  #Options: (true/false)
  showAmPm = false;
  showName = true;
  militaryTime = false; #Military Time = 24 hour time

  #Creating a new Date object
  date = new Date()
  hour = date.getHours()
  minutes = date.getMinutes()

  #Quick and dirty fix for single digit minutes
  minutes = "0"+ minutes if minutes < 10

  #AM/PM String logic
  if hour < 12
    half = "AM"
  else
    half = "PM"

  #0 Hour fix
  hour = 12 if hour == 0;

  #24 - 12 Hour conversion
  hour = hour%12 if hour > 12 && !militaryTime

  #Add zero in front for single digit hours
  hour = "0" + hour if hour < 10

  #DOM manipulation
  $(domEl).find('.hour').text("#{hour}")
  $(domEl).find('.min').text("#{minutes}")
  $(domEl).find('.half').text("#{half}") if showAmPm && !militaryTime
