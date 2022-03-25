function [p,s] = computePrices(delta_noprice,mc,alpha,OWN)

notEye = abs(eye-1);

p=mc;
diff=100;
iter = 0;
while diff>0.005 && iter<100

    iter = iter+1;
    
    expDelta = exp(delta_noprice + alpha*p);
    sumExp = replat(sum(expDelta),1,length(mc));
    s = expDelta ./ (1 + sumExp);
    dsdp = -alpha* (s * s');
    dsdp = dsdp.*notEye + diag(alpha*s.*s);

    markup = - (OWN.*dsdp)\s;
    pnew = mc + markup;
    diff = max(abs(p-pnew));
    p=pnew;
end

expDelta = exp(delta_noprice + alpha*p);
sumExp = replat(sum(expDelta),1,length(mc));
s = expDelta ./ (1 + sumExp);

end