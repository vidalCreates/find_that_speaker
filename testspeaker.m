function resultname = testspeaker
    max = 0;
    if (checkEmma > max)
        max = checkEmma;
        resultname = "Emma Watson";
        disp ("Emma : " + max);
    end
  
%     if (checkKevin < max)
%         max = checkKevin;
%         resultname = "Kevin Hart";
%         disp ("Kevin : " +max);
%     end

    if (checkMorgan < max)
        max = checkMorgan;
        resultname = "Morgan Freeman";
        disp ("Morgan : " +max);
    end
    if(checkObama < max)
        max = checkObama;
        resultname = "Barack Obama";
        disp ("Obama : " +max);
    end
    if (checkEllen < max)
        max = checkEllen;
        resultname = "Ellen DeGeneres";
        disp ("Ellen : " +max);
    end
end