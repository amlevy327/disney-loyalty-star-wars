# disney-loyalty-star-wars

## Overivew
### Why?
The frustration: True fans unrewarded.
Fans invest in streaming, merch, and parks.
No cross-platform rewards.
Dedication deserves acknowledgment!
### How?
Leverage blockchain's transparent ledger.
Progress etched in tamper-proof code.
Digital tokens with real & digital rewards.
### What?
Unique contract per promo.
Structure and mapping to monitor progress.
NFT auto minted at completion.

### Step by step:
1. Disney create a promo and deploys the smart contract.
2. Loyal fan registers their wallet that is connected to their Disney centralized account.
3. Disney updates wallet status after each promo criteria (for this example: watch movies, buy merch, visit park).
4. When all promo criteria hit, NFT minted and transfered to loyal fan!
5. Optional: NFT triggers free physical merch shipment to loyal fan or unlocks other physical or digital perks!

## Play around yourself!

### Mumbai testnet smart contracts:
- StarWarsPromo: [0x2FAaCAA1D7bB2106744B6eAD26623310098277d0](https://mumbai.polygonscan.com/address/0x2FAaCAA1D7bB2106744B6eAD26623310098277d0)

### How to interact through PolygonScan
1. Obtain Mumbai MATIC. [FAUCET](https://faucet.polygon.technology/).
2. Register wallet. Use #2 registerWallet. Inputs: wallet_ = your wallet. [WRITE CONTRACT](https://mumbai.polygonscan.com/address/0x2FAaCAA1D7bB2106744B6eAD26623310098277d0#writeContract).
3. Update bought merch. Use #7 updateBoughtMerch. [WRITE CONTRACT](https://mumbai.polygonscan.com/address/0x2FAaCAA1D7bB2106744B6eAD26623310098277d0#writeContract).
4. Update visited galaxys edge. Use #8 updateVisitedGalaxysEdge.[WRITE CONTRACT](https://mumbai.polygonscan.com/address/0x2FAaCAA1D7bB2106744B6eAD26623310098277d0#writeContract).
5. Update watched movies. Use #9 updateWatchedMovies. [WRITE CONTRACT](https://mumbai.polygonscan.com/address/0x2FAaCAA1D7bB2106744B6eAD26623310098277d0#writeContract).
6. Verify received promo NFT!
- Option 1: Click "View Transaction". Check "Tokens Transferred" field.
- Option 2: Read #1 balanceOf. Should return value of 1. [READ CONTRACT](https://mumbai.polygonscan.com/address/0x2FAaCAA1D7bB2106744B6eAD26623310098277d0#readContract). 