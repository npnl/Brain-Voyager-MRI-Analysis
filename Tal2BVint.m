function[BV_INT_X, BV_INT_Y, BV_INT_Z] = Tal2BVint(TAL_X, TAL_Y, TAL_Z)

%% Marleen Schippers & Luca Nanetti & Leonardo Cerliani
%  February 19, 2007
%
% Converts Talairach coordinates to 
%   BrainVoyager QX INTERNAL coordinates.
%
%  Comments: m.b.schippers@med.umcg.nl

%% Calculate the coordinates
BV_SYS_X = 128 - TAL_X;
BV_SYS_Y = 128 - TAL_Y;
BV_SYS_Z = 128 - TAL_Z;

%% Convert BV_SYS to BV_INT
%  The same can be achieved by: 
%    [BV_INT_X, BV_INT_Y, BV_INT_Z] = BVsys2BVint(BV_SYS_X, BV_SYS_Y, BV_SYS_Z);
BV_INT_X = BV_SYS_Y;
BV_INT_Y = BV_SYS_Z;
BV_INT_Z = BV_SYS_X;