from brownie import accounts, config, BlackJack


def deploy_gambling():
    account = accounts[0]
    bj = BlackJack.deploy({"from": account})
    bj.make_deck()
    print(bj.retrieve())


def main():
    print("hello")
    deploy_gambling()
