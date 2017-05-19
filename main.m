%Load GMMModels into workspace
load('GMMs.mat')

[test,fs]=audioread('test.wav');
%clean and ready test sound sample
% y = resample(x,1,2);

testing_data = removesound('test.wav');
%testing_data = audioread('test.wav');
testing_features  = melcepst(testing_data, fs);   

%identify speaker
speaker = testspeaker;
disp ('Found that Speaker: "' + speaker + '"');

%connect to DB
javaaddpath('C:\Users\amc12\Downloads\mysql-connector-java-5.1.42\mysql-connector-java-5.1.42\mysql-connector-java-5.1.42-bin.jar')
conn = database('find_that_speaker_DB','root','password','com.mysql.jdbc.Driver','jdbc:mysql://localhost/find_that_speaker_DB')

if(speaker == "Barack Obama")
  query = 'SELECT person_name, bio, image From person WHERE person_id = "p0001"';
  data = fetch(conn,query);
  speaker_bio = data{2};
  speaker_image = data{3};
elseif (speaker == "Ellen DeGeneres")
  query = 'SELECT person_name, bio, image From person WHERE person_id = "p0002"';
  data = fetch(conn,query);
  speaker_bio = data{2};
  speaker_image = data{3};
elseif (speaker == "Kevin Hart")
  query = 'SELECT person_name, bio, image From person WHERE person_id = "p0004"';
  data = fetch(conn,query);
  speaker_bio = data{2};
  speaker_image = data{3};
elseif (speaker == "Emma Watson")
  query = 'SELECT person_name, bio, image From person WHERE person_id = "p0003"';
  data = fetch(conn,query);
  speaker_bio = data{2};
  speaker_image = data{3};
elseif (speaker == "Morgan Freeman")
  query = 'SELECT person_name, bio, image From person WHERE person_id = "p0005"';
  data = fetch(conn,query);
  speaker_bio = data{2};
  speaker_image = data{3};
end

%contatenate the speaker information in one variable
speaker = strcat(speaker,'|',speaker_bio,'|',speaker_image);
disp(speaker);

%open file for speaker data
fileID = fopen('speaker.txt','w');
%write speaker data to file
fwrite(fileID,speaker);
%close speaker file
fclose(fileID);