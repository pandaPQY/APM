clear;close all
nf=128;
%
fid=fopen('newposition.dat');
newposition=fread(fid,'real*4');
fclose(fid);
%
newposition=reshape(newposition,3,nf,nf,nf);
%
fid=fopen('cube_fine.dat');
den=fread(fid,'real*4');
den=reshape(den,nf,nf,nf);
fclose(fid);

figure(116);imagesc(reshape(mean(den(:,:,1),3),nf,nf)');axis xy square;caxis([1 20])
%figure(114);imagesc(fftshift(reshape(mean(den(:,:,1),3),nf,nf))');axis xy square;colormap(hot);colorbar
%figure(115);imagesc(circshift(reshape(mean(den(:,:,1),3),nf,nf),nf/4,nf/4)');axis xy square
colormap(hot);colorbar
hold on
%
for jp=1:2:nf
    plot(reshape(newposition(1,:,jp,1),nf,1)',reshape(newposition(2,:,jp,1),nf,1)','Color',[0.5 0.5 0.5])
    axis xy square; hold on;
end

for ip=1:2:nf
    plot(reshape(newposition(1,ip,:,1),nf,1)',reshape(newposition(2,ip,:,1),nf,1)','Color',[0.5 0.5 0.5])
    hold on;
end

newposition(:,1,1,1)

%


return