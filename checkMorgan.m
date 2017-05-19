function log_like = checkMorgan
  y = evalin( 'base', 'gmmModelMorgan' );
  x = evalin( 'base', 'testing_features' );
  [~,log_like] = posterior(y,x);
end