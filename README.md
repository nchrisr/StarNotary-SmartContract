# **PROJECT: Decentralized Star Notary Service Project** 
A DAapp that provides a web front-end to create and lookup stars. It is an implementation of an ERC-721 non-fungible token.

### **Contract Address:**
https://rinkeby.etherscan.io/address/0x511D5342BbbfbbB61Fa393f0cDe74F31ac082845 

### **Token Info**

- ERC-721 Token Name: **StarToken**

- ERC-721 Token Symbol: **STR**


### **To Run the application** 
1. Clean the frontend 
```bash
cd app
# install all modules listed as dependencies in package.json
npm install
```


2. Start Truffle by running
```bash
# For starting the development console
truffle develop
# truffle console

# For compiling the contract, inside the development console, run:
compile

# For migrating the contract to the locally running Ethereum network, inside the development console
migrate --reset

# For running unit tests the contract, inside the development console, run:
test
```

3. **Frontend** - Once you are ready to start your frontend, run the following from the app folder:
```bash
cd app
npm run dev
```

### **Dependencies**
1. **Node and NPM** installed - NPM is distributed with [Node.js](https://www.npmjs.com/get-npm)
```bash
# Check Node version
node -v
# Check NPM version
npm -v
```


2. **Truffle v5.4.96** - A development framework for Ethereum. 
```bash
# Install
npm install -g truffle
# Specify a particular version
npm install -g truffle@5.X.X
# Verify the version
truffle version
```

3. **Truffle/hdwallet-provider: 1.5.1** 
```bash
# See version
npm list @truffle/hdwallet-provider

# Install
npm install @truffle/hdwallet-provider
``` 

4. **Openzeppelin/contracts** 
```bash
cd app
# See version 
npm list @openzeppelin/contracts

# npm install 
npm install @openzeppelin/contracts
```
5. **Metamask: 10.2.0** - To update Metamask just delete your Metamask extension and install it again.


6. [Ganache](https://www.trufflesuite.com/ganache)

7. **Other mandatory packages**:
```bash
cd app
# install packages
npm install webpack-dev-server -g
npm install web3
```


---



