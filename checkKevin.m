function log_like = checkKevin
  y = evalin( 'base', 'gmmModelKevin' );
  x = evalin( 'base', 'testing_features' );
  [~,log_like] = posterior(y,x);
end