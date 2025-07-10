// SPDX-License-Identifier: MIT
pragma solidity ^0.8.29;

contract Mixer {
    IVerifier public immutable i_verifier;
    uint256 public constant DENOMINATION = 0.001 ether;
    mapping(bytes32 => bool) public s_commitments;

    ////////// ERRORS ///////////
    error Mixer_CommitmentAlreadyAdded(bytes32 commitment);
    error Mixer_DepositAmountNotCorrect(uint256 amountSent, uint256 amountExpected);
    constructor(IVerifier _verifier) {
        i_verifier = _verifier;
    }

    /**
     * @dev Deposit funds into the contract. The caller must send (for ETH) or approve (for ERC20) value equal to or `denomination` of this instance.
     * @param _commitment the note commitment, which is Poseidon(nullifier + secret)
     */
    function deposit(bytes32 _commitment) external payable {
        if(s_commitments[_commitment]) {
            revert Mixer_CommitmentAlreadyAdded(_commitment);
        }

        if(msg.value != DENOMINATION) {
            revert Mixer_DepositAmountNotCorrect(msg.value, DENOMINATION);
        }

        s_commitments[_commitment] = true;

    }


    /**
     * @dev Withdraw a deposit from the contract. `proof` is a zkSNARK proof data, and input is an array of circuit public inputs
     * `input` array consists of:
     *   - merkle root of all deposits in the contract
     *   - hash of unique deposit nullifier to prevent double spends
     *   - the recipient of funds
     *   - optional fee that goes to the transaction sender (usually a relay)
     */
    function withdraw(bytes calldata _proof) external {

    }
}