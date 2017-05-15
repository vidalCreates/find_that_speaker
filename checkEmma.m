function log_like = checkEmma
  y = evalin( 'base', 'gmmModelEmma' );
  x = evalin( 'base', 'testing_features1' );
  [~,log_like] = posterior(y,x);
end