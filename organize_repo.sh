#!/usr/bin/env sh

cd markdown

#Manual renaming.
while read old_name new_name ; do
  echo "manually renaming ${old_name}.md to ${new_name}.md"
  mv ${old_name}.md ${new_name}.md
done < ../renamed_pages.txt

#These get names based on the directory hierarchy, use globbing to move
mv *_2doc_2numeric_2xyz_matrix_8dox-example.md xyzMatrix-example.md
mv *_2doc_2numeric_2xyz_vector_8dox-example.md xyzVector-example.md

#Rename files starting with an underscore
FILES=$(find . -name '_*')
for f in $FILES; do
	old_name=`echo ${f} | cut -d'/' -f2`
	new_name=`echo ${old_name} | sed s/^_//`
	echo "renaming ${old_name} to ${new_name}"
	mv ${old_name} ${new_name}
done

#Gollum prefers dashes to underscores. Convert per preference. Also, eliminate multiple underscores.
# Parenthesis also muck up things.
FILES=$(find . -name '*_*')
for f in $FILES; do
	old_name=`echo "${f}" | cut -d'/' -f2`
	new_name=`echo "${old_name}" | sed -e s/__*/-/g -e s/\(//g -e s/\)//g`
	echo "renaming ${old_name} to ${new_name}"
	mv ${old_name} ${new_name}
done

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
rosettaremodel.md \
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
Remodel.md \
)
for f in "${app_pages[@]}"; do
	mv ${f} application_documentation/
done

mkdir scripting_documentation
scripting_pages=(\
RosettaScripts.md \
RosettaScripts-Documentation.md \
Movers-RosettaScripts.md \
Filters-RosettaScripts.md \
TaskOperations-RosettaScripts.md \
MetropolisHastings-Documentation.md \
MetropolisHastingsMover.md \
SimulatedAnnealing-MetropolisHastings.md \
Tempering-MetropolisHastings.md \
RosettaScripts-database-connection-options.md \
FeaturesExtracting.md \
FeaturesTutorials.md \
FeaturesTutorialRunSciBench.md \
FeaturesTutotiralRunFeaturesAnalysis.md \
FeaturesTutorialSQLBasics.md \
FeaturesTutorialRBasics.md \
FeaturesTutorialGGplots2Basics.md \
FeaturesTutorialPlotScript.md \
FeaturesTutorialPlotTuning.md \
FeaturesRScripts.md \
FeaturesSettingUpR.md \
FeatureReporters.md \
FeaturesSchemaGeneration.md \
Features-schema.md \
FeaturesDatabaseSchema.md \
MetaFeaturesReporters.md \
ChemicalFeaturesReporters.md \
OneBodyFeaturesReporters.md \
TwoBodyFeaturesReporters.md \
MultiBodyFeaturesReporters.md \
MultiStructureFeaturesReporters.md \
EnergyFunctionFeaturesReporters.md \
ExperimentalFeaturesReporters.md \
FeaturesScientificBenchmark.md \
RotamerRecoveryScientificBenchmark.md \
PyRosetta-Toolkit.md \
)
for f in "${scripting_pages[@]}"; do
	mv ${f} scripting_documentation/
done

mkdir rosetta_basics
basics_pages=(\
atomtree-overview.md \
constraint-file.md \
database-support.md \
foldtree-overview.md \
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
Database-IO.md \
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
UTracer.md \
vector0.md \
vector1.md \
vectorL.md \
writing-an-app.md \
xyzMatrix-example.md \
xyzMatrix.md \
xyzVector-example.md \
xyzVector.md \
RosettaScripts-Developer-Guide.md \
RosettaScripts-Guidelines-for-writing-new-movers-and-filters.md \
)
for f in "${development_pages[@]}"; do
	mv ${f} development_documentation/
done

mkdir internal_documentation
internal_pages=(\
app-name.md \
template-app-documenation-page.md \
reviewertemplate.md \
a-guide-to-developing-in-rosetta.md \
before-commit-check.md \
hotspot-hash.md \
hshash-utils.md \
multi-residue-ligand-dock.md \
multistate-design-ga.md \
)
for f in "${internal_pages[@]}"; do
	mv ${f} internal_documentation/
done

mkdir junk
#Read each line of deleted_pages.txt file into array
IFS=$'\n' read -d '' -r -a junk_pages < ../deleted_pages.txt

for f in "${junk_pages[@]}"; do
	markdown_name=`echo ${f}.md | sed -e 's/_/-/g' -e 's/^-*//'`
	mv ${markdown_name} junk/
done

#Because we're going to be using directly generated one, rather than the doxygen converted one.
#Additionally, we don't want to kill any links, like we would if we listed it in deleted_pages.txt
mv full-options-list.md  junk/

mkdir -p images

IFS=$'\n' read -d '' -r -a doxy_images < ../doxy_images.txt
for f in "${doxy_images[@]}"; do
	if [ -e "../html/${f}" ]; then
 		cp "../html/${f}" images/
	elif [ -e "../doc/images/${f}" ]; then
		cp "../doc/images/${f}" images/
	else
		echo "WARNING: Image ${f} requensed but not found"
	fi
done

mkdir uncategorized
mv *.md uncategorized
