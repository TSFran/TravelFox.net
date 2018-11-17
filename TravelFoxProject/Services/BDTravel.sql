USE master
IF EXISTS(SELECT * FROM sys.databases WHERE name='TravelFox')
DROP DATABASE TravelFox

CREATE DATABASE TravelFox

USE TravelFox