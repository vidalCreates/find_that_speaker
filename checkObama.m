function log_like = checkObama
  y = evalin( 'base', 'gmmModelObama' );
  x = evalin( 'base', 'testing_features' );
  [~,log_like] = posterior(y,x);
end