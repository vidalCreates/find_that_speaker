    %Get sample from phone.
      echotcpip('on',12000);
      t = tcpip('0.0.0.0',10001,'NetworkRole','server','Timeout',15);
       set(t,'InputBufferSize',3000);
      disp(t);
      fopen(t);
      
      A = fscanf(t);
      disp(A); 
%       fprintf(t,'Beyonce');
%       
%       fclose(t);
%       echotcpip('off');


    fs = 48000;
    %Load GMMModels
%     gmmModelObama = load('gmmModelObama');
%     gmmModelDoraine = load ('gmmModelDoraine');
%     gmmModelKevin = load ('gmmModelKevin');
%     gmmModelLisa = load ('gmmModelLisa');
%     gmmModelNeville = load ('gmmModelNeville');
    
    %clean and ready test sound sample
    testing_data = removesound(A);
    testing_features1  = melcepst(testing_data, fs);
    
%   identify speaker
    x = testspeaker;
    disp (x);

% connect to DB
    %javaaddpath('/Users/BrittneySamuels/Downloads/mysql-connector-java-5.1.42/mysql-connector-java-5.1.42-bin.jar')
    %conn = database('find_that_speaker_DB','root','password','com.mysql.jdbc.Driver','jdbc:mysql://localhost/find_that_speaker_DB')

  if(x == "Obama")
    query = 'SELECT person_name, bio From person WHERE person_id = "p0001"';
    data = fetch(conn,query);
    name = data{1};
    bio = data{2};
  end
  if (x == "Ellen")
    query = 'SELECT person_name, bio From person WHERE person_id = "p0002"';
    data = fetch(conn,query);
    name = data{1};
    bio = data{2};
  end

  if (x == "Kevin")
    query = 'SELECT person_name, bio From person WHERE person_id = "p0004"';
    data = fetch(conn,query);
    name = data{1};
    bio = data{2};
  end
  if (x == "Emma")
    query = 'SELECT person_name, bio From person WHERE person_id = "p0003"';
    data = fetch(conn,query);
    name = data{1};
    bio = data{2};
  end
  if (x == "Morgan")
    query = 'SELECT person_name, bio From person WHERE person_id = "p0005"';
    data = fetch(conn,query);
    name = data{1};
    bio = data{2};
  end
  
  %send back to phone

  fprintf(t,name);
  fprintf(t,bio);

  fclose(t);
  echotcpip('off');