function[BV_INT_X, BV_INT_Y, BV_INT_Z] = BVsys2BVint(BV_SYS_X, BV_SYS_Y, BV_SYS_Z)

%% Marleen Schippers & Luca Nanetti & Leonardo Cerliani
%  February 19, 2007
%
%  Converts BrainVoyager QX SYSTEM coordinates to 
%   BrainVoyager QX INTERNAL coordinates.
%
%  Comments: m.b.schippers@med.umcg.nl

%% 'Calculate' the coordinates
BV_INT_X = BV_SYS_Y;
BV_INT_Y = BV_SYS_Z;
BV_INT_Z = BV_SYS_X;
