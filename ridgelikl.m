function M = ridgelikl(I,nangs,scales)

% nangs = 16;
angle = 0:180/nangs:180-180/nangs;

[nr,nc] = size(I);
nconvs = length(scales)*length(angle);
D = zeros(nr,nc,nconvs);

count = 0;
for a = angle
    count = count+1;
    [mr,~] = smorlet(2,scales,a,1);
    C = conv2(I,mr,'same');
%     C = C.*(C > 0);
    D(:,:,count) = C;
end
M = normalize(max(D,[],3));

end