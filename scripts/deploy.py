
from scripts.tools import get_account
from brownie import Mustard
import json


contract_data = {"mustardContract": "", "network": "Localhost 8545", "chainId": "1337", "chainIdHex": "0x539", "rpc": "http://localhost:8545"}


def deploy():
    account = get_account()
    mustard = Mustard.deploy({"from": account})
    contract_data["mustardContract"] = mustard.address
    save_data()



def save_data():
    with open(
        "./frontend/mustard/components/config.json", "w"
    ) as outfile:
        json.dump(contract_data, outfile)
    main_contract_compiled = json.load(open("./build/contracts/Mustard.json"))
    with open(
        "./frontend/mustard/components/compiledContract.json", "w"
    ) as outfile:
        json.dump(main_contract_compiled, outfile)


def main():
    deploy()