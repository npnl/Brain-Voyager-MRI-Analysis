function[BV_SYS_X, BV_SYS_Y, BV_SYS_Z] = Tal2BVsys(TAL_X, TAL_Y, TAL_Z)

%% Marleen Schippers & Luca Nanetti & Leonardo Cerliani
%  February 19, 2007
%
% Converts Talairach coordinates to 
%   BrainVoyager QX SYSTEM coordinates.
%
%  Comments: m.b.schippers@med.umcg.nl

%% Calculate the coordinates
BV_SYS_X = 128 - TAL_X;
BV_SYS_Y = 128 - TAL_Y;
BV_SYS_Z = 128 - TAL_Z;