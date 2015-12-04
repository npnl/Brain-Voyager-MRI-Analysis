function[vtc_xyz_mat] = xxMVPA_Tal2Matlab(tal_xyz_mat, vtcres)

%% Marleen Schippers & Luca Nanetti & Leonardo Cerliani
%  Feburary 19, 2007
%
%  Converts Talairach coordinates to 
%   Array Indices when a VTC is read into Matlab
%
%  Comments: m.b.schippers@med.umcg.nl

%% BrainVoyager QX Initialisations

start_xyz = ones(size(tal_xyz_mat,1),1) * [57 52 59];

bv_sys_xyz = 128 - tal_xyz_mat;

bv_int_xyz = bv_sys_xyz(:,[2,3,1]);

vtc_xyz_mat = floor((bv_int_xyz - start_xyz)/vtcres)+1;

vtc_xyz_mat = unique(vtc_xyz_mat,'rows');

