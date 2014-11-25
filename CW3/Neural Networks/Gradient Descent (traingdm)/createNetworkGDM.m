function [net] = createNetworkGDM(layerSize, numLayers, valPc, lr, mc, x, y)
  hiddenSizes(1:numLayers) = layerSize;
  net = feedforwardnet(hiddenSizes, 'traingdm');
  
  net.divideFcn = 'divideind';
  net.divideParam.trainInd = 1 : floor(length(x) - (length(x) * valPc));
  net.divideParam.valInd = ceil(length(x) - (length(x) * valPc)) : length(x);
  net.divideParam.testInd = length(x);
  
  net.trainParam.lr = lr;
  net.trainParam.mc = mc;
  
  net = configure(net, x, y);
  [net, ~] = train(net, x, y);
end