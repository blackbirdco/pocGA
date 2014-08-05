//= require jquery
//= require jquery_ujs
//= require raphael
//= require morris

function importGA() {
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
    (i[r].q=i[r].q||[]).push(arguments)
    },i[r].l=1*new Date();a=s.createElement(o),
      m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
        })(window,document,'script','//www.google-analytics.com/analytics.js','ga');
}

function loadAnalyticDriver(driver) {
  if (driver.toLowerCase() == 'ga' || /google_?analytics?/i.test(driver)) {
    importGA();
    return true;
  }

  // add new analytics driver here

  return false;
}

function analyticCreate(uaToken, additionalParameters) {
  // see https://developers.google.com/analytics/devguides/collection/analyticsjs/field-reference#create
  // for more information on possible additional parameters
  if (typeof additionalParameters === 'undefined') { additionalParameters = 'auto' };

  ga('create', uaToken, additionalParameters);
  return true;
}

// this can also be done in analyticCreate, this is a convenience method
function analyticSetUserId(userId) {
  ga('set', 'userId', userId);
  return true;
}

function analyticSetDimension(dimension, value) {
  if ( /^dimension[1-9][0-9]*]/i.test(dimension) ) {
    ga('set', dimension.toLowerCase(), value);
    return true;
  } else {
    console.log(dimension + " is not a valid dimension name");
    console.log("It must match 'dimensionY' with Y in [1..20]");
    return false;
  }
}

function analyticSetMetric(metric, value) {
  if ( /^metric[1-9][0-9]*]/i.test(metric) ) {
    ga('set', metric.toLowerCase(), value);
    return true;
  } else {
    console.log(metric + " is not a valid metric name");
    console.log("It must match 'metricY' with Y in [1..20]");
    return false;
  }
}

function analyticSendPageview(pageViewed, additionalParameters) {
  // see https://developers.google.com/analytics/devguides/collection/analyticsjs/pages#overriding
  // for more information on possible additional parameters
  if (typeof additionalParameters === 'undefined') {
    ga('send', 'pageview');
    return true;
  } else {
    ga('send', 'pageview', additionalParameters);
    return true;
  }
}

// see https://developers.google.com/analytics/devguides/collection/analyticsjs/field-reference#events
function analyticSendEventTracking(parameters) {
  ga('send', 'event', parameters);
  return true;
}

// generic functions
// see https://developers.google.com/analytics/devguides/collection/analyticsjs/field-reference
// for possible fields
function analyticSet(field, value) {
  ga('set', field, value);
  return true;
}

function analyticSend(field, value) {
  ga('send', field, value);
  return true;
}
