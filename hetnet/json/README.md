## Files

+ `hetionet-v1.0.json.bz2` is a bzip2-compressed JSON text file containing the top-level objects described below.

+ `hetionet-v1.0-metagraph.json` is a JSON text file containing only the objects describing the type graph (called a metagraph or network schema). These are `metanode_kinds`, `metaedge_tuples`, and `kind_to_abbrev`.

## JSON hetnet format

The JSON format has the following top-level objects:

+ `metanode_kinds`: an array of node types.  Example:
```json
"metanode_kinds": [
  "Gene",
  "Molecular Function"
]
```

+ `metaedge_tuples`: an array of edge types. Each edge type is represented as an array with positional values corresponding to the source node type, target edge type, edge type, and directionality.  Example:
```json
"metaedge_tuples": [
  [
    "Gene",
    "Gene",
    "regulates",
    "forward"
  ],
  [
    "Gene",
    "Molecular Function",
    "participates",
    "both"
  ]
]
```

+ `kind_to_abbrev`: an object mapping node and edge types to their abbreviations. Note that we include this abbreviation mapping, but consider an optional component to the JSON format. Example:
```json
"kind_to_abbrev": {
  "Molecular Function": "MF",
  "Gene": "G",
  "participates": "p"
}
```

+ `nodes`: an array of nodes. Each node is represented as an object with pairs for the node type (`kind`), identifier, name, and properties (`data`). Node identifiers are guaranteed to be unique within each node type.  Example:
```json
"nodes": [
  {
    "kind": "Molecular Function",
    "identifier": "GO:0031753",
    "name": "endothelial differentiation G-protein coupled receptor binding",
    "data": {
      "source": "Gene Ontology",
      "license": "CC BY 4.0",
      "url": "http://purl.obolibrary.org/obo/GO_0031753"
    }
  },
  {
    "kind": "Gene",
    "identifier": 5345,
    "name": "SERPINF2",
    "data": {
      "description": "serpin peptidase inhibitor, clade F (alpha-2 antiplasmin, pigment epithelium derived factor), member 2",
      "source": "Entrez Gene",
      "license": "CC0 1.0",
      "url": "http://identifiers.org/ncbigene/5345",
      "chromosome": "17"
    }
  }
]
```

+ `edges`: an array of edges. Each edge is represented as an object with pairs for the source node (`source_id`), target node (`target_id`), edge type (`kind`), directionality, and propertier (`data`). Example:
```json
"edges": [
  {
    "source_id": [
      "Gene",
      2160
    ],
    "target_id": [
      "Molecular Function",
      "GO:0008201"
    ],
    "kind": "participates",
    "direction": "both",
    "data": {
      "source": "NCBI gene2go",
      "license": "CC BY 4.0",
      "unbiased": false
    }
  },
  {
    "source_id": [
      "Compound",
      "DB01106"
    ],
    "target_id": [
      "Gene",
      4931
    ],
    "kind": "downregulates",
    "direction": "both",
    "data": {
      "source": "LINCS L1000",
      "z_score": -4.156,
      "method": "measured",
      "unbiased": true
    }
  }
]
```
