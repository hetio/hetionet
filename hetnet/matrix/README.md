## Files

+ [`hetionet-v1.0.hetmat.zip`](hetionet-v1.0.hetmat.zip) is a HetMat archive, which provides a directory and file-naming structure for storing hetnets on disk tailored towards matrix operations.

## HetMat format

The HetMat format contains directories for `nodes` and `edges`, and includes a `metagraph.json` file in the root directory.
`metagraph.json` uses the JSON format [available](../json) from this repository.
The full contents of `hetionet-v1.0.hetmat.zip` are as follows (produced using the [`tree`](https://en.wikipedia.org/wiki/Tree_(command)) command):

```
hetionet-v1.0.hetmat
├── edges
│   ├── AdG.sparse.npz
│   ├── AeG.sparse.npz
│   ├── AuG.sparse.npz
│   ├── CbG.sparse.npz
│   ├── CcSE.sparse.npz
│   ├── CdG.sparse.npz
│   ├── CpD.sparse.npz
│   ├── CrC.sparse.npz
│   ├── CtD.sparse.npz
│   ├── CuG.sparse.npz
│   ├── DaG.sparse.npz
│   ├── DdG.sparse.npz
│   ├── DlA.sparse.npz
│   ├── DpS.sparse.npz
│   ├── DrD.sparse.npz
│   ├── DuG.sparse.npz
│   ├── GcG.sparse.npz
│   ├── GiG.sparse.npz
│   ├── GpBP.sparse.npz
│   ├── GpCC.sparse.npz
│   ├── GpMF.sparse.npz
│   ├── GpPW.sparse.npz
│   ├── Gr>G.sparse.npz
│   └── PCiC.sparse.npz
├── metagraph.json
└── nodes
    ├── Anatomy.tsv
    ├── Biological Process.tsv
    ├── Cellular Component.tsv
    ├── Compound.tsv
    ├── Disease.tsv
    ├── Gene.tsv
    ├── Molecular Function.tsv
    ├── Pathway.tsv
    ├── Pharmacologic Class.tsv
    ├── Side Effect.tsv
    └── Symptom.tsv
```
