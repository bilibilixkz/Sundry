::[Bat To Exe Converter]
::
::fBE1pAF6MU+EWHreyHIiJxxGTQnCGmK2A6Ygv6XB5vq79VdTUfo6GA==
::YAwzoRdxOk+EWAnk
::fBw5plQjdG8=
::YAwzuBVtJxjWCl3EqQJgSA==
::ZR4luwNxJguZRRnk
::Yhs/ulQjdF+5
::cxAkpRVqdFKZSTk=
::cBs/ulQjdF25
::ZR41oxFsdFKZSDk=
::eBoioBt6dFKZSDk=
::cRo6pxp7LAbNWATEpSI=
::egkzugNsPRvcWATEpSI=
::dAsiuh18IRvcCxnZtBJQ
::cRYluBh/LU+EWAnk
::YxY4rhs+aU+IeA==
::cxY6rQJ7JhzQF1fEqQJhZksaHErTbws=
::ZQ05rAF9IBncCkqN+0xwdVsFAlTMbCXrVdU=
::ZQ05rAF9IAHYFVzEqQIqIQtSRQiHXA==
::eg0/rx1wNQPfEVWB+kM9LVsJDGQ=
::fBEirQZwNQPfEVWB+kM9LVsJDGQ=
::cRolqwZ3JBvQF1fEqQJnMlVRVAHCbjr0VuNc6uno6u7n
::dhA7uBVwLU+EWDk=
::YQ03rBFzNR3SWATElA==
::dhAmsQZ3MwfNWATElA==
::ZQ0/vhVqMQ3MEVWAtB9wSA==
::Zg8zqx1/OA3MEVWAtB9wSA==
::dhA7pRFwIByZRRme/VI2IRdRAgGaOSv4NpQowNTPwNahi2E4FoI=
::Zh4grVQjdCeDJE2B51YMMhJESg2OOQs=
::YB416Ek+ZG8=
::
::
::978f952a14a936cc963da21a135fa983
@echo off
cd %1
for /f "delims=" %%f in ('dir /b /a-d-h-s') do "%appdata%\7z.exe" a %%f.gz %%f