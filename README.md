## README

This is the proof of concept for google analytics use for blackbird.

We know GA allows you to track visitors one by one but we wanted to
know whether it was possible to scope the different users by community
or not.



GA allows you to define customs dimensions to add to a User, which
we did. Once that dimension is defined, simply copy and paste the
generated javascript to wherever you want (we put it in the application
layout).
Don't forget to use ga(set,...) before ga(send, event) to be sure your
custom dimension value is sent to the GA api.

That's it for the frontend. Take a rest, grab a beer and enjoy the
satifaction of such a hard work done.

Backend part:

Well, first of all, you need to be logged in with google, that is to say
you have to send your OAuth2 token to the GA reporting api.

Successfuly logged in? Well play! That was the tricky part!

Now, you may want to query the api as enjoying a successful login doesn't
last forever (or you boss might have asked you to stop partying for nothing).
In order to forge queries to send to the GA api, use this:

http://ga-dev-tools.appspot.com/explorer/

And simply copy/paste the resulting code.

You're done with setting up the GA for your website! Now, take a breath,
have a nap, your daily work is over.

### JS

The file app/assets/javascripts/application.js defines some convenience methods
to use google analytics in javascript.
Note that GA must be loaded in every pages in it uses (or preferably in application.html.erb),
which can be done using `loadAnalyticDriver('ga')`. A tracker must then be created using
`analyticCreate.analyticCreate('UA-XXX')`. See application.html.erb for an example on how to
use the functions.


### Legato

To use Legato, simply follow the doc using the Service Accounts part for OAuth2 authentification
towards google.

Legato is pretty strait forward to use, but here are some tricks:

First of all, instead using user = "", or user.profiles,etc... use:
service_account_user, which is a helper method declared in legato_helpers.

If you've got a Legato class named Exit, profile.exit will fetch all data concerning whatever is
declared in this class. But here is a drawback from using Legato: profile.exit will be an instance
of Legato Query which is basically an Array of OpenStruct. When you render a json directly from that
you will have the following output:

[table=>{key=>value, key => value}, table=>{key=>value, key => value}]

We want something like: [{key=>value, key => value}, {key=>value, key => value}]
To achieve this, simply use the GoogleAnalyticsSerializer