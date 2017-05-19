function log_like = checkEmma
  y = evalin( 'base', 'gmmModelEmma' );
  x = evalin( 'base', 'testing_features' );
  [~,log_like] = posterior(y,x);
end