devenv-scrum-reporting
===============

Early development environment for the scrum reporting tool

## About

This development environment is designed to be easy to use, and function very similarly to a server environment.

Requirements:
 - Vagrant < 1.4
 - Virtualbox < 4.3.20
 - git

## TL;DR

Inside the project folder, simply run `vagrant up`.

Services can be accessed on:
 - http://172.16.42.66:5000
 - http://172.16.42.66:5001

## Update Apps

sudo puppet apply ~/backend.pp

## Restart apps

sudo systemctl restart lr-scrum-reporting-backend.service
sudo systemctl restart lr-scrum-reporting-frontend.service

## Apps
### [Scrum Report API:](https://github.com/LandRegistry/scrum-reporting-prototype)

`localhost:5001`
- **GET** `/scrum/`

### [Scrum Report Frontend:](https://github.com/LandRegistry/scrum-reporting-prototype)

`localhost:5002`
- **GET** `/scrum/`
- **GET** `/scrum/<team>/<sprint number>`
- **POST** `/scrum/`

## Notes
The development environment relies on [Vagrant](https://www.vagrantup.com/).
Currently only Virtualbox is supported as a provider.

For further information on managing Vagrant you can read the [official documentation](https://docs.vagrantup.com/v2/).

##How to query the postgres database with PSQL

Login to the centos virtual machine.  Switch to root with:

```
sudo -i
```

login to the system of record database with this:

```
psql -U workingregister workingregister
```
