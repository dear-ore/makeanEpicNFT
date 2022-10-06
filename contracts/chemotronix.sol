//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract chemotronix {

	struct company {
		string companyName;
		string cacRegistrationNumber;
		address officeAddress;
	}

	enum status {
		registered,
		unregistered
	}

	company[] public companies;
	status public companyStatus;

	//bool public registered; 
	event successfullyRegistered (string message);

	function registerCompany(string memory _companyName,  string memory _cacRegistrationNumber, address _companyAddress) public {
		company memory Company = (_companyName, _cacRegistrationNumber, _companyAddress);
		companies.push(Company);
		companyStatus = status.registered;
	}


	function checkRegistration() view public returns(status) {
		return companyStatus;
	}
	
	bool _registered = registered;

}