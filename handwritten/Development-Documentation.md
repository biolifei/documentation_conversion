
##Developing for Rosetta

- [[Rosetta overview|mini-overview]]
- [[Doxygen tips]] - How to work with Rosetta's in-code documentation.
- [[Writing an app]] - How to write your own Rosetta-based application.

##Organization overview.
- [[Rosetta library structure]] - Overview of how the Rosetta library is structured.
- [[src index page]] - Overview of the src directory.

- [[namespacenumeric]]
- [[namespacecore-1-1kinematics]]
- [[namespace-objexx-f-c-l]]
- [[namespacerosetta-1-1chemical]]
- [[namespacerosetta-1-1conformation-1-1idealization]]
- [[namespacerosetta-1-1conformation]]
- [[namespacerosetta-1-1io-1-1pdb]]
- [[namespacerosetta-1-1scoring]]
- [[namespacerosetta]]
- [[namespaces]]
- [[namespacetesting]]
- [[namespaceutility-1-1factory]]
- [[namespaceutility-1-1io]]
- [[namespaceutility-1-1keys]]
- [[namespaceutility-1-1options]]
- [[namespaceutility]]
- [[utility-library]]
- [[numeric-library]]
- [[objexx-f-c-l-library]]

##Rosetta style guidelines

- [[Owning pointer usage guidlines]] - Working with Rosetta's smart pointer system.

##Using particular classes - Some of this documention may be out of date.

- [[Owning pointers]] - Rosetta's shared-ownership intrusive reference counted smart pointer.
    * [[Access pointers]] - An "owning pointer" which doesn't take ownership.
    * [[ReferenceCount]] - How owning pointers are implemented.
    * [[ReferenceCountMI]] - ReferenceCount for multiple inheritance.
- [[Vector1]] - Rosetta's 1-based indexing vector class.
    * [[Vector0]] - A 0-based indexing version of vector1.
    * [[VectorL]] - The generalized L-based indexing vector, from which vector1 and vector0 are derived.
- [[Tracer]] - Using the tracer output class.

- [[Hbonds]] - Dealing with the Hbond energy terms.
- [[Directory-core-fragments]] - Using the classed located in src/core/fragments/

- [[xyzVector]] - A vector specialized for Cartesian coordinate use.
    * [[xyzVector example]]
- [[xyzMatrix]] - A 3x3 matrix class specialized for Cartesian coordinate use.
    * [[xyzMatrix example]]

##How to extend Rosetta

- [[New energy method]] - How to add a new energy term.
- [[Resfile reader]] - How to extend the resfile reader.

##Testing changes

- [[Rosetta tests]] - A guide to running and writing tests for Rosetta
- [[Run unit test]] - How to run the unit tests.
- [[Write unit test|test]] - Writing unit tests.
- [[U Tracer]] - How to use the UTracer tool in writing unit tests
- [[Mover test]] - How to write a unit test for a mover.  
- [[Scientific test]] - How to create and run scientific tests

##Internal development guides

- [[A guide to developing in Rosetta]] - Overview for developing in RosettaCommons.  
- [[Before commit check]] - Things to check before committing.  
- [[app-name]] - Application documentation page template.
    * [[template-app-documenation-page]] - Another application documentation template
- [[reviewertemplate]] -- How to review documentation.  



