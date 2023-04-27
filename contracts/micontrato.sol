// SPDX-License-Identifier: MIT
pragma solidity 0.6.0;

contract Erc20Basic {
    
    // Variables públicas del token
    string public constant name = "BitCoin";
    string public constant symbol = "BTC";
    uint8 public constant decimals = 18;

    // Crea un mapeo con la cantidad de tokens que cada cuenta posee
    mapping(address => uint) balances;
    
    // Suministro total del token
    uint256 totalSupply_ = 1000000000000000000000;
    
    // Inicializa el token asignando todo el suministro total al creador del contrato
    constructor() public {
        balances[msg.sender] = totalSupply_;
    }
    
    // Función para obtener el suministro total del token
    function totalSupply() public view returns(uint256) {
        return totalSupply_;
    }
        
    // Función para obtener el saldo de una cuenta
    function balanceOf(address account) public view returns(uint256) {
        return balances[account];
    }
        
    // Función para transferir tokens
    function transfer(address recipient, uint256 amount) public returns(bool) {
        // Comprueba que el remitente tenga suficientes tokens para transferir
        require(amount <= balances[msg.sender]);
        // Resta la cantidad de tokens del remitente
        balances[msg.sender] = balances[msg.sender]-amount;
        // Agrega la cantidad de tokens al destinatario
        balances[recipient] = balances[recipient]+amount;
        // Registra la transferencia de tokens
        return true;    
    }
    
}
