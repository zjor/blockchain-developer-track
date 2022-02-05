from brownie import DepositContract, network
from scripts.utils import get_account


def deploy_contract():
    return DepositContract.deploy({"from": get_account()})


def get_balance():
    contract = DepositContract[-1]
    return contract.getBalance({"from": get_account()})


def main():
    deploy_contract()
    print(f"Balance: {get_balance()}")
