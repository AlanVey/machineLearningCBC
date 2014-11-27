function [y] = testCBR(CBR, x)
  y = zeros(length(x), 1);
  for (i = 1 : length(x))
    attr = x(:,i)';
    Case = struct('AU', find(attr), 'solution', 0, 'typicality', 1);
    BestMatch = retrieve(CBR, Case);
    SolvedCase = reuse(BestMatch, Case);
    y(i) = SolvedCase.solution;
    CBR = retain(CBR, SolvedCase);
  end
end

