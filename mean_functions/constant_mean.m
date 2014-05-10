% CONSTANT_MEAN constant mean function.
%
% This provides a GPML-compatible mean function implementing a
% cosntant mean function:
%
%   \mu(x) = c.
%
% This can be used as a drop-in replacement for meanConst.
%
% This implementation supports an extended GPML syntax that allows
% calculating the Hessian of \mu with respect to any pair of
% hyperparameters. The syntax is:
%
%   dK2_didj = constant_mean(hyperparameters, x, z, i, j);
%
% where dK2_didj is \partial^2 \mu / \partial \theta_i \partial \theta_j,
% and the Hessian is evaluated at x.
%
% These Hessians can be used to ultimately compute the Hessian of the
% GP training likelihood (see, for example, exact_inference.m).
%
% The hyperparameter is:
%
%   hyperparameter = [ c ].
%
% See also MEANFUNCTIONS.

% Copyright (c) Roman Garnett, 2014

function result = constant_mean(hyperparameter, x, ~, ~)

  % report number of hyperparameters
  if (nargin <= 1)
    result = '1';
    return;
  end

  n = size(x, 1);

  % evaluate prior mean
  if (nargin == 2)
    result = hyperparameter * ones(n, 1);

  % evaluate derivative with respect to hyperparameter
  elseif (nargin == 3)
    result = ones(n, 1);

  % evaluate second derivative with respect to hyperparameter
  else
    result = zeros(n, 1);
  end

end