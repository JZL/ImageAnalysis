function clippingPlane = showPlaneDots(C1, xs, ys, zs, z)
%This function can be used to make a clipping plane for a slice of a 3D
%image.
%
%   clippingPlane = makeplane2(C1,z,x1,y1,z1,r,flip)
%
%Author: William Colgan
%Date: 6/2/17
%Contact: colgan.william@gmail.com
[x,y] = size(C1);
clippingPlane = double(zeros(x,y));
for s = 1:1:3
    for i = 1:x
        for j = 1:y
            if(z == zs(s) && abs(xs(s)*x-i)<2 && abs(ys(s)*y-j)<2)
                clippingPlane(i,j) = 1;
            end
        end
    end
end