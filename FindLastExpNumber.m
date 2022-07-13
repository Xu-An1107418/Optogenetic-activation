function [LastExpNumber] = FindLastExpNumber(AnimalFolder)
% This function is looking for the last experiment's folder on the f: drive
% If no any ratxxxx folder this comes back with rat0000 otherwise this
% come back that folder name which contains the highest number
	curpwd = pwd;

    % The DefDir is 0 if the def_objects folder is missing, 1 otherwise
    LastExpNumber = 'eeg_exp000.mat';
    % Change the current path to AnimalFolder
    cd(AnimalFolder);
    % The DirList structure contains the all files' and folders' data of
    % the f: drive
    DirList = dir;
    % Search that folder name which contains the biggest number
    for n=3:size(DirList)
        % Select that names which contains the rat string on the first
        % three positions
        if numel(DirList(n).name) < 14
            continue;
        end
        if strncmp(DirList(n).name, 'eeg_exp', 7)
            % The MATLAB gives back a vector of zeros and ones when
            % comparing the value of two string. If there is minimum
            % one 1 in the vector the relation is true. The max() gives
            % back the maximum element of the result vector and if it 1
            % the comparison is true
            if max(DirList(n).name > LastExpNumber) == 1
                LastExpNumber = DirList(n).name;
            end
        end
    end
    cd (curpwd);
end
