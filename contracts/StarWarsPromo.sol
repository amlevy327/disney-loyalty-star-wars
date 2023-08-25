// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.18;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract StarWarsPromo is ERC721Enumerable  {
  using Counters for Counters.Counter;
  Counters.Counter private _nextTokenId;

  struct WalletStatus {
    address wallet;
    bool exists;
    bool watchedMovies; // watch Episodes I-IX on Disney+
    bool boughtMerch; // buy T-shirt
    bool visitedGalaxysEdge; // buy ticket and visit park in Holleywood Studios
  }
  mapping(address => WalletStatus) private _walletStatus;

  event WalletRegistered(address wallet);
  event WalletStatusUpdate(address wallet, bool watchedMovies, bool boughtMerch, bool visitedGalaxysEdge);
  event PromoMint(address wallet, uint256 tokenId);

  constructor(
    string memory name_,
    string memory symbol_
  ) ERC721(name_, symbol_)
  {
    // start at token id = 1
    _nextTokenId.increment();
  }

  /**
  ////////////////////////////////////////////////////
  // External Functions 
  ///////////////////////////////////////////////////
  */

  // Register wallet for promo. Called by user or by Disney. If Disney, need access control.
  function registerWallet(address wallet_) external {
    _walletStatus[wallet_] = WalletStatus({
      wallet: wallet_,
      exists: true,
      watchedMovies: false,
      boughtMerch: false,
      visitedGalaxysEdge: false
    });

    emit WalletRegistered(wallet_);
  }

  // Update status after movies watched on streaming service. Called by Disney. Need access control.
  function updateWatchedMovies(address wallet_) external {
    require(_walletStatus[wallet_].exists, 'WALLET_NOT_REGISTERED');

    _walletStatus[wallet_].watchedMovies = true;
    emit WalletStatusUpdate(wallet_, _walletStatus[wallet_].watchedMovies, _walletStatus[wallet_].boughtMerch, _walletStatus[wallet_].visitedGalaxysEdge);
    
    _checkPromoStatus(wallet_);
  }

  // Update status after merch bought.. Called by Disney. Need access control.
  function updateBoughtMerch(address wallet_) external {
    require(_walletStatus[wallet_].exists, 'WALLET_NOT_REGISTERED');

    _walletStatus[wallet_].boughtMerch = true;
    emit WalletStatusUpdate(wallet_, _walletStatus[wallet_].watchedMovies, _walletStatus[wallet_].boughtMerch, _walletStatus[wallet_].visitedGalaxysEdge);
    
    _checkPromoStatus(wallet_);
  }

  // Update status after park visited. Called by Disney. Need access control.
  function updateVisitedGalaxysEdge(address wallet_) external {
    require(_walletStatus[wallet_].exists, 'WALLET_NOT_REGISTERED');

    _walletStatus[wallet_].visitedGalaxysEdge = true;
    emit WalletStatusUpdate(wallet_, _walletStatus[wallet_].watchedMovies, _walletStatus[wallet_].boughtMerch, _walletStatus[wallet_].visitedGalaxysEdge);
    
    _checkPromoStatus(wallet_);
  }

  /**
  ////////////////////////////////////////////////////
  // Internal Functions 
  ///////////////////////////////////////////////////
  */

  function _checkPromoStatus(address wallet_) internal {
    if (_walletStatus[wallet_].watchedMovies && _walletStatus[wallet_].boughtMerch && _walletStatus[wallet_].visitedGalaxysEdge) {
      uint256 tokenId = _nextTokenId.current();
      _mint(wallet_, tokenId);
      _nextTokenId.increment();

      emit PromoMint(wallet_, tokenId);
    }
  }

  /**
  ////////////////////////////////////////////////////
  // View only functions
  ///////////////////////////////////////////////////
  */

  function getWalletStatus(address wallet) external view returns (WalletStatus memory walletStatus){
    require(_walletStatus[wallet].exists, 'WALLET_NOT_REGISTERED');
    return _walletStatus[wallet];
  }
}