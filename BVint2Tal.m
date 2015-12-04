function[TAL_X, TAL_Y, TAL_Z] = BVint2Tal(BV_INT_X, BV_INT_Y, BV_INT_Z)

%% Marleen Schippers & Luca Nanetti & Leonardo Cerliani
%  February 19, 2007
%
% Converts BrainVoyager QX INTERNAL coordinates to 
%   Talairach coordinates.
%
%  Comments: m.b.schippers@med.umcg.nl

%% Convert BV_INT to BV_SYS
%  The same can be achieved by:
%    [BV_SYS_X, BV_SYS_Y, BV_SYS_Z] = BVint2BVsys(BV_INT_X, BV_INT_Y, BV_INT_Z);
BV_SYS_X = BV_INT_Z;
BV_SYS_Y = BV_INT_X;
BV_SYS_Z = BV_INT_Y;

%% Calculate the coordinates
TAL_X = 128 - BV_SYS_X;
TAL_Y = 128 - BV_SYS_Y;
TAL_Z = 128 - BV_SYS_Z;