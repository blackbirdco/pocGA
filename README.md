== README

This is the proof of concept for google analytics use for blackbird.

We know GA allows you to track visitors one by one but we wanted to
know whether it was possible to scope the different users by community
or not.



GA allows you to define customs dimensions to had to a User, which
we did. Once that dimension is defined, simply copy and paste the
generated javascript to wherever you want (we put it in the application
layout).
Don't forget to use ga(set,...) before ga(send, event) to be sure your
custom dimension value will be sent to the GA api.

That's it for the frontend. Take a rest, grab a beer and enjoy the
satifaction of such a hard work done.

Backend part:

Well, first of all, you need to be logged in with google, that is to say
you have to send your OAuth2 token to the GA reporting api.

Successfuly logged in? Well play! That was the tricky part!

Now, you may want to query the api as enjoying a successful login doesn't
last forever (or you boss might have asked you to stop partying for nothing).
In order to forge queries to send to the GA api, user this:

http://ga-dev-tools.appspot.com/explorer/

And simply copy/paste the resulting code.

You're done with setting up the GA for your website! Now, take a breath,
have a nap, your daily work is over.