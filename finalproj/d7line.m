function TextLine = d7line(TextArray2D)
% MATLAB course for biology students - Class demonstration
% convert 2D text TextArray to 1D array TextLine.
TextLine = TextArray2D';
TextLine = TextLine(:)';
TextLine = strtrim(TextLine); % remove pre and trailing blanks
