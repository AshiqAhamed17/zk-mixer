# zk-mixer
 A privacy-preserving zkSNARK-based mixer built with Noir for educational exploration of zero-knowledge cryptography.
---

## Description

This project is a minimal implementation of a **Zero-Knowledge Mixer**, built with [Noir](https://noir-lang.org/) and [Barretenberg](https://github.com/AztecProtocol/barretenberg). The goal is to **learn and demonstrate how mixers work** using zkSNARKs — where users can deposit and later withdraw assets *without linking identities*.

It simulates how protocols like Tornado Cash achieve unlinkability through:
- Commitments (e.g., Poseidon hash of secrets)
- Nullifiers (to prevent double-spending)
- Merkle Trees (to validate deposits)
- zk Proofs (to verify knowledge without revealing secrets)