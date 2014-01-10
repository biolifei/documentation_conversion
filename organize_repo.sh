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

#Gollum prefers dashes to underscores. Convert per preference. Also, eliminate multiple underscores.
FILES=$(find . -name '*_*')
for f in $FILES; do
	old_name=`echo ${f} | cut -d'/' -f2`
	new_name=`echo ${old_name} | sed s/__*/-/g`
	echo "renaming ${old_name} to ${new_name}"
	mv ${old_name} ${new_name}
done

#Manual renaming.
while read old_name new_name ; do
  mv $old_name $new_name
done << HEREDOC
anchored-p-d-b-creator.md	anchored-pdb-creator.md
antibody-assemble-c-d-rs.md	antibody-assemble-CDRs.md
antibody-model-c-d-r-h3.md	antibody-model-CDR-H3.md
next-generation-k-i-c.md	next-generation-KIC.md
py-m-o-l-server.md		pymol-server.md
rosetta-d-n-a.md		rosetta-dna.md
u-b-q-conjugated.md		ubq-conjugated.md
v-i-p-app.md			vip-app.md
HEREDOC

#Rename using scons to build documentation
mv using-scons.md Build-Documentation.md


mkdir application_documentation
app_pages=(\
abinitio-relax.md \
anchor-finder.md \
anchored-design.md \
anchored-pdb-creator.md \
antibody-assemble-CDRs.md \
antibody-mode-camelid.md \
antibody-model-CDR-H3.md \
antibody-protocol.md \
antibody-python-script.md \
app-dock-design.md \
backrub.md \
beta-strand-homodimer-design.md \
build-peptide.md \
ca-to-allatom.md \
cluster.md \
commands-collection.md \
ddg-monomer.md \
density-map-scoring.md \
dna-interface-design.md \
docking-prepack-protocol.md \
docking-protocol.md \
doug-dock-design-min-mod2-cal-cal.md \
enzyme-design-deprecated.md \
enzyme-design.md \
erraser.md \
extract-atomtree-diffs.md \
fixbb-with-hpatch.md \
fixbb.md \
flex-pep-dock.md \
floppy-tail.md \
fold-and-dock.md \
fragment-picker.md \
fragment-picking-old.md \
hbs-design.md \
hotspot-hash.md \
hshash-utils.md \
interface-analyzer.md \
ligand-dock.md \
loopmodel-ccd.md \
loopmodel-kinematic.md \
loopmodel.md \
loops-from-density.md \
make-rot-lib.md \
make-symmdef-file.md \
make-symmdef-file-denovo.md \
match.md \
membrane-abinitio.md \
metalloprotein-abrelax.md \
minirosetta-comparative-modeling.md \
minirosetta.md \
mpi-msd.md \
mr-protocols.md \
multistate-design-ga.md \
next-generation-KIC.md \
oop-design.md \
opt-e-parallel-doc.md \
pepspec.md \
pmut-scan-parallel.md \
prepare-template-for-mr.md \
pymol-server.md \
relax.md \
remodel.md \
residue-energy-breakdown.md \
rna-assembly.md \
rna-denovo.md \
rna-design.md \
rna-thread.md \
rosetta-dna.md \
score-commands.md \
sequence-recovery.md \
sequence-tolerance.md \
supercharge.md \
swa-protein-long-loop.md \
swa-protein-main.md \
swa-rna-loop.md \
sym-dock.md \
ubq-conjugated.md \
unfolded-state-energy-calculator.md \
vip-app.md \
zinc-heterodimer-design.md \
)
for f in "${app_pages[@]}"; do
	mv ${f} application_documentation/
done

mkdir rosetta_basics
basics_pages=(\
atomtree-overview.md \
constraint-file.md \
foldtree-overview.md \
full-options-list.md \
jd2.md \
match-cstfile-format.md \
minimization-overview.md \
movemap-file.md \
packer-task.md \
preparing-ligands.md \
preparing-structures.md \
prepare-pdb-for-rosetta-with-relax.md \
robust.md \
resfiles.md \
r-n-a-protein-changes.md \
sqlite3-interface.md \
symmetry.md \
)
for f in "${basics_pages[@]}"; do
	mv ${f} rosetta_basics/
done

mkdir build_documentation
build_pages=(\
Build-Documentation.md
)
for f in "${build_pages[@]}"; do
	mv ${f} build_documentation/
done

mkdir development_documentation
development_pages=(\
rosetta-tests.md \
)
for f in "${development_pages[@]}"; do
	mv ${f} development_documentation/
done

mkdir pilot
pilot_pages=(\
hotspot-hash.md \
hshash-utils.md \
multi-residue-ligand-dock.md \
multistate-design-ga.md \
)
for f in "${pilot_pages[@]}"; do
	mv ${f} pilot/
done

mkdir junk
junk_pages=(\
annotated.md \
classes.md \
directory-template-page.md \
## Redundant, this version is in pilot
dna_interface_design.md \
examples.md \
## Redundant, this version is in pilot
flex-pep-docking.md \
index.md \
pages.md \
pilot-apps-info.md \
template-index-page.md \
using-subversion.md \
)
for f in "${junk_pages[@]}"; do
	mv ${f} junk/
done

mkdir uncategorized
mv *.md uncategorized

