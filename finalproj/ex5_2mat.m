function new_array = ex5_2mat(array)
%A function to increase a matrix
%The input is some 2D array. The output is the same matrix, with one row and one column added to it.
%The added row is the last row in the matrix, And the added column is the last column in the matrix.
last_row=array(end,:);
new_array=[array;last_row];
last_column=new_array(:,end);
new_array=[new_array,last_column];
end

