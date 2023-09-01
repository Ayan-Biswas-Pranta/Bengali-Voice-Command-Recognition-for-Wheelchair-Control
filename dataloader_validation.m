function cell = dataloader_validation()
p = dir('validation');
N = numel(p);
cell = {'Filename','data','Fs','Label'};
index = 2;

for i = 3:numel(p)
    temp_dir = "validation\"+p(i).name;
    temp_obj = dir(temp_dir+"\*.wav");
    Nf = numel(temp_obj);
    for j = 1:Nf
        name_temp = temp_obj(j).name;
        [y_temp  Fs_temp] = audioread(temp_dir+"\"+name_temp);
   
        %labeling
        Label_temp = 0;
        if(name_temp(1:4)=='bame')
            Label_temp = 1;
        elseif (name_temp(1:4)=='dane')
            Label_temp = 2;
        elseif (name_temp(1:7)=='pichone')
            Label_temp = 3;
        elseif (name_temp(1:6)=='shamne')
            Label_temp = 4;
        elseif (name_temp(1:5)=='thamo')
            Label_temp = 5;
        else Label_temp = 6;
        end
                                    
        cell(index,:) = {temp_obj(j).name, y_temp, Fs_temp, Label_temp};
        index = index+1;
   end
end

end