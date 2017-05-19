function log_like = checkEllen
  y = evalin( 'base', 'gmmModelEllen' );
  x = evalin( 'base', 'testing_features' );
  [~,log_like] = posterior(y,x);
end