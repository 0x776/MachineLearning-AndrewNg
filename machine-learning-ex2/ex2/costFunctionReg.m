function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta

hy = sigmoid(X * theta);

y_one = -y .* log(hy);
one = ones(size(y));
y_zero = (one - y) .* log(one - hy);
J = sum(y_one - y_zero) / m;
theta_j = theta([2:length(theta)],:);
J = J + sum(theta_j .^ 2) * lambda / 2 / m;

grad(1) = sum(hy - y) / m;
for i=2:length(theta),
    grad(i) = (X')(i,:) * (hy - y) / m + lambda * theta(i) / m;
end;
% =============================================================

end
