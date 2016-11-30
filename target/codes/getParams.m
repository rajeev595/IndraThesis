function params = getParams(Xt,ed,iter,exact,dictsize)
    params.data = Xt;
    params.Edata = ed;
    params.iternum = iter;
    params.exact = exact;
% Checking if size of dictionary is greater than dimension of data    
    if(size(Xt,2) < dictsize)
        params.dictsize = size(Xt,2);
    else 
        params.dictsize = dictsize;
    end    
end