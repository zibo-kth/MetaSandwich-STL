function Ve_STL = stl(tau)
%STL Backward-compatible wrapper for sound transmission loss.
%
% Historically this repository provided `fun_stl(tau)` but the code lived in
% `stl.m` with a mismatched function name, which breaks in Octave.
%
% Preferred API:
%   fun_stl(tau)
%
% Backward-compatible API:
%   stl(tau)

Ve_STL = fun_stl(tau);

end
