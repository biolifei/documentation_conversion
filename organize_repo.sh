#!/usr/bin/env sh

cd markdown

#Rename files starting with an underscore
FILES=$(find . -name '_*')
for f in $FILES; do
	old_name=`echo ${f} | cut -d'/' -f2`
	new_name=`echo ${old_name} | sed s/^_//`
	echo "renaming ${old_name} to ${new_name}"
	mv ${old_name} ${new_name}
done


mkdir application_documentation
app_pages=(\
abinitio_relax.md \
anchor_finder.md \
anchored_design.md \
anchored_p_d_b_creator.md \
antibody_assemble__c_d_rs.md \
antibody_mode_camelid.md \
antibody_model__c_d_r__h3.md \
antibody_protocol.md \
antibody_python_script.md \
app_dock_design.md \
backrub.md \
beta_strand_homodimer_design.md \
build_peptide.md \
cluster.md \
commands_collection.md \
ddg_monomer.md \
density_map_scoring.md \
dna_interface_design.md \
dock_design.md \
docking_prepack_protocol.md \
docking_protocol.md \
doug_dock_design_min_mod2_cal_cal.md \
enzyme_design_deprecated.md \
enzyme_design.md \
erraser.md \
extract_atomtree_diffs.md \
fixbb_with_hpatch.md \
fixbb.md \
flex_pep_dock.md \
flex_pep_docking.md \
floppy_tail.md \
fold_and_dock.md \
fragment_picker.md \
fragment_picking_old.md \
hbs_design.md \
hotspot_hash.md \
interface_analyzer.md \
ligand_dock.md \
loopmodel_ccd.md \
loopmodel_kinematic.md \
loopmodel.md \
loops_from_density.md \
make_symmdef_file.md \
make_symmdef_file_denovo.md \
match.md \
membrane_abinitio.md \
metalloprotein_abrelax.md \
minirosetta_comparative_modeling.md \
minirosetta.md \
mpi_msd.md \
multistate_design_ga.md \
next_generation__k_i_c.md \
oop_design.md \
pepspec.md \
pilot_apps_info.md \
pmut_scan_parallel.md \
py_m_o_l_server.md \
relax.md \
remodel.md \
residue_energy_breakdown.md \
rna_assembly.md \
rna_denovo.md \
rna_design.md \
rosetta_scripts \
score_commands.md \
sequence_recovery.md \
sequence_tolerance.md \
supercharge.md \
swa_protein_long_loop.md \
swa_protein_main.md \
swa_rna_loop.md \
sym_dock.md \
u_b_q_conjugated.md \
unfolded_state_energy_calculator.md \
v_i_p_app.md \
zinc_heterodimer_design.md \
)
for f in "${app_pages[@]}"; do
	mv ${f} application_documentation/
done

mkdir rosetta_basics
basics_pages=(\
atomtree_overview.md \
constraint_file.md \
foldtree_overview.md \
jd2.md \
match_cstfile_format.md \
movemap_file.md \
packer__task.md \
preparing_ligands.md \
preparing_structure.md \
prepare_pdb_for_rosetta_with_relax.md \
robust.md \
resfiles.md \
resfile_read.md \
symmetry.md \
writing_an_app.md \
)
for f in "${basics_pages[@]}"; do
	mv ${f} rosetta_basics/
done

mkdir build_documentation
build_pages=(\
using_scons.md
)
for f in "${build_pages[@]}"; do
	mv ${f} build_documentation/
done

mkdir uncategorized
mv *.md uncategorized

