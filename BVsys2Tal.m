function[TAL_X, TAL_Y, TAL_Z] = BVsys2Tal(BV_SYS_X, BV_SYS_Y, BV_SYS_Z)

%% Marleen Schippers & Luca Nanetti & Leonardo Cerliani
%  February 19, 2007
%
% Converts BrainVoyager QX SYSTEM coordinates to 
%   Talairach coordinates.
%
%  Comments: m.b.schippers@med.umcg.nl

%% Calculate the coordinates
TAL_X = 128 - BV_SYS_X;
TAL_Y = 128 - BV_SYS_Y;
TAL_Z = 128 - BV_SYS_Z;