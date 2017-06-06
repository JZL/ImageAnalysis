function clippingPlane = makeplane3(C1, xs, ys, zs ,flip, z)
%This function can be used to make a clipping plane for a 3D image
%
%   clippingPlane = makeplane3(C1,x1,y1,z1,r,flip)
%
%Author: William Colgan
%Date: 6/2/17
%Contact: colgan.william@gmail.com
[x,y] = size(C1);
clippingPlane = double(ones(x,y))*.5;
% see http://www.math.cornell.edu/~froh/231f08e1a.pdf
allPoints = [xs*x; ys*y; zs];
% sub1 = a(:, 1) - a(:, 2)
% sub2 = a(:, 3) - a(:, 2)
coeffs = cross(allPoints(:, 1) - allPoints(:, 2), allPoints(:, 3) - allPoints(:, 2));
r = sum(coeffs .*allPoints(:, 1));
x1 = coeffs(1);
y1 = coeffs(2);
z1 = coeffs(3);
for i = 1:x
    for j = 1:y
        for k = 1:z
            if flip == 1
                if(i*x1+j*y1+k*z1>r)
                    clippingPlane(i,j,k) = 1;
                end
            else
                if(i*x1+j*y1+k*z1<r)
                    clippingPlane(i,j,k) = 1;
                end
            end
        end
    end
end
end