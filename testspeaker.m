function resultname = testspeaker
  max = 0;
  if (checkEmma > max)
    max = checkEmma;
    resultname = "Emma";
    disp ("Emma : " + max);
  end
  if (checkKevin < max)
    max = checkKevin;
    resultname = "Kevin";
    disp ("Kevin : " +max);
  end
  if (checkMorgan < max)
    max = checkMorgan;
    resultname = "Morgan";
    disp ("Morgan : " +max);
  end
  if(checkObama < max)
    max = checkObama;
    resultname = "Obama";
    disp ("Obama : " +max);
  end
  if (checkEllen < max)
    max = checkEllen;
    resultname = "Ellen";
    disp ("Ellen : " +max);
  end
end