willsworldhack
==============

A last minute lame attempt to stop me feeling guilty for not doing something for WillsworldHack

This is a very poor hack together - I was going to create a plays sentiment analysis tool but work commitments meant I was unable.
In twenty or thirty mintues, with a little thought and a few apis and quick hack, I produced a class which gave a teleprompter sentiment analysis line by line

I was going to wrap the original project as a sinatra app, that displayed Shakespeare's play and the characters within them provided statisticsand sentiment analysis but ended up just dropping a hack class in there and not using the sinatra
app. 

So this is just a single ruby class, to run just make sure plays.rb and plays.json exists in same folder then 

ruby plays.rb "Richard III" for instance

or any other play name from the json file 

Outputs to console only - coloured lines negative sentiment = red , positive sentiment = green,  neutral = yellow 

requires colorize gem. 


See video hacks.m4v or http://www.youtube.com/watch?v=pGZZ1Fq-xAY&feature=youtu.be
