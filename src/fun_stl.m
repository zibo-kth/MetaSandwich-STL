function Ve_STL = fun_stl(tau)
%%% Return the sound transmission loss for a given transmission coefficient tau.
%%%
%%% NOTE (CI/Octave compatibility):
%%% In MATLAB/Octave, the primary function name should match the filename.
%%% The original implementation lived in stl.m, which breaks `fun_stl(...)`.
%%% This file restores the standard naming.

Ve_STL = -10*log10(tau);

end
