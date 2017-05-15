function log_like = checkEllen
  y = evalin( 'base', 'gmmModelEllen' );
  x = evalin( 'base', 'testing_features1' );
  [~,log_like] = posterior(y,x);
end