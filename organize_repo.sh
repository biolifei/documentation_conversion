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
classnumeric-1-1xyz-matrix.md	xyzMatrix.md
classnumeric-1-1xyz-vector.md	xyzVector.md
classutility-1-1pointer-1-1access-ptr.md	access-pointers.md
classutility-1-1pointer-1-1owning-ptr.md        owning-pointers.md
classutility-1-1pointer-1-1-reference-count.md	ReferenceCount.md
classutility-1-1pointer-1-1-reference-count-m-i.md	ReferenceCountMI.md
classutility-1-1vector0.md	vector0.md
classutility-1-1vector1.md	vector1.md
classutility-1-1vector-l.md	vectorL.md
namespacerosetta-1-1chemical.md			namespace-core-chemical.md
namespacerosetta-1-1conformation-1-1idealization.md	namespace-core-conformation-idealization.md
namespacerosetta-1-1conformation.md		namespace-core-conformation.md
namespacerosetta-1-1io-1-1pdb.md		namespace-core-io-pdb.md
namespacerosetta-1-1scoring.md			namespace-core-scoring.md
namespaceutility-1-1factory.md			namespace-utility-factory.md
namespaceutility-1-1io.md			namespace-utility-io.md
namespaceutility-1-1keys.md			namespace-utility-keys.md
namespaceutility-1-1options.md			namespace-utility-options.md
utility-library.md				namespace-utility.md
numeric-library.md				namespace-numeric.md
objexx-f-c-l-library.md				namespace-objexxFCL.md
next-generation-k-i-c.md	next-generation-KIC.md
py-m-o-l-server.md		pymol-server.md
rosetta-d-n-a.md		rosetta-dna.md
r-n-a-protein-changes.md	RNA-protein-changes.md
u-b-q-conjugated.md		ubq-conjugated.md
v-i-p-app.md			vip-app.md
HEREDOC

#These get names based on the directory hierarchy, use globbing to move
mv *-2doc-2numeric-2xyz-matrix-8dox-example.md xyzMatrix-example.md
mv *-2doc-2numeric-2xyz-vector-8dox-example.md xyzVector-example.md

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
app-fragment-picker.md \
fragment-picking-old.md \
hbs-design.md \
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
RNA-protein-changes.md \
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
access-pointers.md \
directory-core-fragments.md \
doxygen-tips.md \
hbonds.md \
mini-overview.md \
mover-test.md \
namespace-core-chemical.md \
namespace-core-conformation-idealization.md \
namespace-core-conformation.md \
namespace-core-io-pdb.md \
namespace-core-scoring.md \
namespace-utility-factory.md \
namespace-utility-io.md \
namespace-utility-keys.md \
namespace-utility-options.md \
namespace-utility.md \
namespace-numeric.md \
namespace-objexxFCL.md \
new-energy-method.md \
owning-pointers.md \
owning-pointer-usage-guidlines.md \
ReferenceCount.md \
ReferenceCountMI.md \
resfile-reader.md \
rosetta-tests.md \
rosetta-library-structure.md \
run-unit-test.md \
scientific-test.md \
src-index-page.md \
test.md \
tracer.md \
u-tracer.md \
vector0.md \
vector1.md \
vectorL.md \
writing-an-app.md \
xyzMatrix-example.md \
xyzMatrix.md \
xyzVector-example.md \
xyzVector.md \
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
## Does not correspond to reality
classrosetta-1-1conformation-1-1-amino-acid.md \
## Does not correspond to reality
classrosetta-1-1conformation-1-1-tetrad.md \
## Does not correspond to reality
classrosetta-1-1conformation-1-1-torsion-angle.md \
## Basically Empty
classrosetta-1-1io-1-1pdb-1-1-p-d-b-reader.md \
directory-template-page.md \
## Redundant, this version is in pilot
dna-interface-design.md \
examples.md \
## Redundant, this version is in pilot
flex-pep-docking.md \
index.md \
namespaces.md \
namespacenumeric.md \
namespacecore-1-1kinematics.md \
namespace-objexx-f-c-l.md \
namespacerosetta.md \
namespacetesting.md \
namespaceutility.md \
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

