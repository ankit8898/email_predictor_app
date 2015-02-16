'use strict';

describe('Service: prediction', function () {

  // load the service's module
  beforeEach(module('webAppEmailPredictorApp'));

  // instantiate service
  var prediction;
  beforeEach(inject(function (_prediction_) {
    prediction = _prediction_;
  }));

  it('should do something', function () {
    expect(!!prediction).toBe(true);
  });

});
