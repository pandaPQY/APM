clear;close all
nf=256;
thick=16;
fid=fopen('newposition.dat');
newposition=fread(fid,'real*4');
fclose(fid);

newposition=reshape(newposition,3,nf,nf,nf);
%
fid=fopen('cube_ffine.dat');
den=fread(fid,'real*4');
den=reshape(den,nf,nf,nf);
fclose(fid);

figure(101);imagesc(mean(den(:,:,1:16),3)');axis xy square
colormap(hot);colorbar
hold on
%
for jp=1:2:nf
    plot(reshape(mean(newposition(1,:,jp,1:thick),4),nf,1)',reshape(mean(newposition(2,:,jp,1:16),4),nf,1)','Color',[0.5 0.5 0.5])
    axis xy square; hold on;
end

for ip=1:2:nf
    plot(reshape(mean(newposition(1,ip,:,1:thick),4),nf,1)',reshape(mean(newposition(2,ip,:,1:16),4),nf,1)','Color',[0.5 0.5 0.5])
    hold on;
end

newposition(:,1,1,1)



return
