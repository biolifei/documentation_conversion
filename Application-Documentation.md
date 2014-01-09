Below is a list of the currently released applications containing developer documentation. Click on an application to
see a more detailed description of the purpose and for detailed examples. If a released application is missing, please
file a bug in our [issue tracker](http://bugs.rosettacommons.org).

**Table of Contents** 

- [[Scripting interfaces to Rosetta functionality|Application Documentation#Scripting-interfaces-to-Rosetta-functionality]]
- [Structure Predition](#Structure-Prediction)
- [Docking](#Docking)
- [Design](#Design)
- [Analysis](#Analysis)
- [Utilities](#Utilities)
- [Other](#Other)

##Scripting interfaces to Rosetta functionality
- [[RosettaScripts]]: An XML-based scripting interface
- [[PyRosetta]]: Python wrappings for Rosetta

##Structure Prediction
While most of these applications focus on prediction, many have options which will also allow design.

- [[Ab initio modeling|abinitio_relax]] - Predict 3-dimensional structures of proteins from their amino acid sequences.  
    * [[Membrane ab inito|membrane_abinitio]] - Ab initio for membrane proteins.  
    * [[Metalloprotein ab initio|metalloprotein_abrelax]] - Ab inito modeling of metalloproteins.  

- [[Comparative modeling|minirosetta_comparative_modeling]] - Build structural models of proteins using one or more known structures as templates for modeling.  

- [[Fold-and-dock|fold_and_dock]] - Predict 3-dimentional structures of symetric homooligomers.  

- [[Molecular replacement protocols|mr_protocols]] - Use Rosetta to build models for use in X-ray crystrallography molecular replacement.  
    * [[Prepare template for MR|prepare_template_for_mr]] - Setup script for molecular replacement protocols.  

- [[Relax]] - "Locally" optimize structures, including assigning sidechain positions.  
- [[Backrub]] - Create backbone ensembles using small, local backbone changes.  

- [[FloppyTail|floppy_tail]] - Predict structures of long, flexible N-terminal or C-terminal regions.  

###Loop Modeling
-  [[Loop modeling|loopmodel]]
-  [[CCD loop modeling|loopmodel_ccd]] - Sample loop conformations using fragments and the CCD closure algorithm.
-  [[Kinematic loop modeling|loopmodel_kinematic]] - Sample loop conformations using the kinematic closure algorithm.
-  [[Next-generation KIC|next_generation_KIC.md]] - A newer version of loop modeling with kinematic closure.
-  [[Stepwise assembly of protein loops|swa_protein_main]] - Generate three-dimensional de novo models of protein segments without surrounding sidechains.  
    * [[Stepwise assembly of long loops|swa_protein_long_loop]] - For loops greater than 4-5 residues.  

###RNA
-  [[Rna denovo|rna_denovo]] - Predict 3-dimensional structures of RNA from their nucleotide sequence.
-  [[RNA loop modeling|swa_rna_loop]] - Build RNA loops using deterministic stepwise assembly.
-  [[RNA assembly with experimental constraints|rna_assembly]] - Predict 3-dimensional structures of large RNAs with the help of experimental constraints
-  [[ERRASER]] - Refine an RNA structure given electron density constraints.  

##Docking
###Protein-Protein Docking
- [[Protein-Protein docking|docking_protocol]] (RosettaDock) - Determine the structures of protein-protein complexes by using rigid body perturbations.  
    * [[Docking prepack protocol|docking_prepack_protocol]] - Prepare structures for protein-protein docking.  

- [[Symmetric docking|sym_dock]] - Determine the structure of symmetric homooligomers.  

- [[Chemically conjugated docking|ubq_docking]] - Determine the structures of ubiquitin conjugated proteins.  
 
###Antibody Docking
- [[Antibody protocol|antibody_protocol]] (RosettaAntibody3) - Overview of the antibody modeling protocol.  
    * [[Antibody Python script|antibody_python_script]] - The setup script.  
    * [[Grafting CDR loops|antibody_assemble_cdrs]] - Graft antibody CDR templates on the framework template to create a rough antibody model.  
    * [[Modeling CDR H3|antibody_model_CDR_H3]] - Determine antibody structures by combining VL-VH docking and H3 loop modeling.

- [[Camelid antibody docking|antibody_mode_camelid]] - Dock camelid antibodies to their antigens.

###Ligand Docking
- [[Ligand docking|ligand_dock]] (RosettaLigand) - Determine the structure of protien-small molecule complexes.  
   * [[Extract atomtree diffs|extract_atomtree_diffs]] - Extract structures from the AtomTreeDiff file format.  

###Peptide Docking
- [[Flexible peptide docking|flex_pep_dock]] - Dock a flexible peptide to a protein.
   * [[flex_pep_docking]] - draft documentation?

##Design
- [[Fixed backbone design|fixbb]] - Optimize sidechain-rotamer placement and identity on fixed backbones.  
   * [[Fixbb with hpatch|fixbb_with_hpatch]] - Fixed backbone design with a penalty for hydrophobic surface patches.  

- [[Void Indentification and Packing|vip_app]] (RosettaVIP) - Identify and fill cavities in a protein.
- [[Point mutation scan|pmut_scan_parallel]] - Identifiy stabilizing point mutants.  

- [[Protein-protein design|app_dock_design]] - Protein-protein interaction design with RosettaScripts.  
 
- [[Match]] - Place a small molecule into a protein pocket so it satisfies given geometric constraints.  
- [[Enzyme Design|enzyme_design]] - Design a protein around a small molecule, with catalytic constraints.  
    * [[enzyme_design_deprecated]] - draft documentation?  

- [[RosettaRemodel|remodel]] - Redesign backbone and sequence of protein loops and secondary structure elements. 

- [[Pepspec]] - Evaluate and design peptide-protein interactions.  

- [[Rosetta DNA|rosetta_dna]] (RosettaDNA) - Design and modle protein interactions to DNA.  
    *[[DNA inteface design|dna_interface_design]] (RosettaDNA) - Design and modle protein interactions to DNA.  

- [[RNA design|rna_design]] - Optimize RNA sequence for fixed backbones.  

- [[Hydrogen bond surrogate design|hbs_design]] - Design stabilized alpha helical binders.
- [[OOP design|oop_design]] - Design proteins with oligooxopiperazine residues.  

- [[Multistate design|mpi_msd]] - Optimize proteins for multiple desired and undesired contexts.
    * [[DNA interface multistate design|multistate_design_ga]] - An earlier version tailored to DNA interfaces.  

- [[Sequence tolerance|sequence_tolerance]] - Optimize proteins for library applications (e.g. phage or yeast display).  

- [[Anchored design|anchored_design]] - Design interfaces using an "anchor" of known interactions.  
    * [[Anchored pdb creator|anchored_pdb_creator]] - Prepare starting files for AnchoredDesign.  
    * [[Anchor finder|anchor_finder]] - Find interactions which can serve as "anchors" for AnchoredDesign.  

- [[Supercharge]] - Reengineer proteins for high net surface charges, to counter aggregation.  

- [[Zinc heterodimer design|zinc_heterodimer_design]] - Design zinc-mediated heterodimers.  

- [[Beta strand homodimer|beta_strand_homodimer_design]] - Finding proteins with surface exposed beta-strands, then design a homodimers that will form via that beta-strand.  

- [[DougsDockDesignMinimize|doug_dock_design_min_mod2_cal_cal]] - Redesign the protein/peptide interface of Calpain and a fragment of its inhibitory peptide calpastatin.

##Analysis

- [[Score|score_commands]] - Determine the calculate Rosetta energy for structures.
- [[Residue energy breakdown|residue_energy_breakdown]] - Decompose scores into intra-residue and residue pair interactions.

- [[Score structures with electron density|density_map_scoring]]

- [[ddG monomer|ddg_monomer]] - Predict the change in stability (the ddG) of a monomeric protein induced by a point mutation. 

- [[Interface analyzer|interface_analyzer]] - Calculate metrics evaluating interfaces.  

##Utilities

These applications serve mainly to support other Rosetta applications, or to assist in setting up or analyzing Rosetta runs.

- [[Fragment picker|fragment_picker]] - Pick fragments to be used in conjunction with other fragment-aware Rosetta applications.  
    * [[Old fragment picker|fragment_picking_old]] - The older version of the fragment picker.  

- [[Cluster]] - Cluster structures by structural similarity.  

- [[PyMol server|pymol_server]] - Observe what a running Rosetta program is doing by using PyMol.

- [[Build peptide|build_peptide]] - Build extended peptides or protein structures from sequences.  

- [[CA to all-atom|ca_to_allatom]] - Build fullatom models from C-alpha-only traces.  

- [[Create symmetry definition|make_symmdef_file_denovo]] - Create Rosetta symmetry definition files for a point group.  
    * [[Create symmetry definition from structure|make_symmdef_file]] - Create Rosetta symmetry definition files from template PDBs.  

- Non-canonical amino acids
    * [[Make rotamer library|make_rot_lib]] - Generate rotamer libraries for non-canonical amino acids.  
    * [[Unfolded energy state calculator|unfolded_state_energy_calculator]] - Determine the baseline energy of non-canonical amino acids in the unfolded state.  

- [[Loops from density|loops_from_density]] - Create Rosetta loop files for regions of a protein with poor local fit to electron density.  

- [[Sequence recovery|sequence_recovery]] - Calculate the mutations and native recovery from Rosetta design runs.

## Other

- [[Collection of example commandlines|commands_collection]]

- [[minirosetta]] - The "minirosetta" boinc wrapper application.


$$$$$$$$$$$$$$$$$

- [[hotspot_hash]]
- [[hshash_utils]]
- [[pilot apps info]]

Was documented, documentation disappeared.

- [[Idealization|app_idealization]] - Generate structures with ideal Rosetta bond lengths and angles that are as close as possible to the input structures.  

- [[Commands for working with silent files|app_silentfile]]  


