from brownie import accounts, network, config


def get_account():
    if network.show_active() == 'development':
        return accounts[0]
    elif network.show_active() == 'rinkeby':
        return accounts.add(config["wallets"]["from_key"])
