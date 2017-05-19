%Load GMMModels into workspace
load('GMMs.mat')

[test,fs]=audioread('test.wav');
%clean and ready test sound sample
% y = resample(x,1,2);

testing_data = removesound('test.wav');
testing_features  = melcepst(testing_data, fs);   
     
%identify speaker
speaker = testspeaker;
disp ('Found that Speaker: "' + x + '"');

%default speaker data
speaker_bio = 'hello my name is ' + speaker ;
speaker_image = 'http://www.boomerslife.org/barack_obama-2.jpg';

%connect to DB
% javaaddpath('/Users/BrittneySamuels/Downloads/mysql-connector-java-5.1.42/mysql-connector-java-5.1.42-bin.jar')
% conn = database('find_that_speaker_DB','root','password','com.mysql.jdbc.Driver','jdbc:mysql://localhost/find_that_speaker_DB')

% if(x == "Obama")
%   query = 'SELECT person_name, bio From person WHERE person_id = "p0001"';
%   data = fetch(conn,query);
%   name = data{1};
%   bio = data{2};
%   end
% if (x == "Ellen")
%   query = 'SELECT person_name, bio From person WHERE person_id = "p0002"';
%   data = fetch(conn,query);
%   name = data{1};
%   bio = data{2};
%   end
%
% if (x == "Kevin")
%   query = 'SELECT person_name, bio From person WHERE person_id = "p0004"';
%   data = fetch(conn,query);
%   name = data{1};
%   bio = data{2};
%   end
%   
% if (x == "Emma")
%   query = 'SELECT person_name, bio From person WHERE person_id = "p0003"';
%   data = fetch(conn,query);
%   name = data{1};
%   bio = data{2};
%   end
%   
% if (x == "Morgan")
%   query = 'SELECT person_name, bio From person WHERE person_id = "p0005"';
%   data = fetch(conn,query);
%   name = data{1};
%   bio = data{2};
%   end

%contatenate the speaker information in one variable
speaker = strcat(speaker,'|',speaker_bio,'|',speaker_image);
disp(speaker);

%open file for speaker data
fileID = fopen('speaker.txt','w');
%write speaker data to file
fwrite(fileID,speaker);
%close speaker file
fclose(fileID);