@echo off

REM Create necessary folders
if not exist "bin" mkdir "bin"

REM Compilation
echo Compiling common classes for communication protocols
javac -d bin src/edu/rit/swen755/communication/*.java 
jar cf bin/communication.jar -C bin edu/rit/swen755/communication
echo JAR for communication protocols generated & echo.

echo Compiling client code
javac -cp bin/communication.jar -d bin src/edu/rit/swen755/client/*.java 
jar cf bin/client.jar -C bin edu/rit/swen755/client 
echo JAR for client generated & echo.


echo Compiling judge code (server)
javac -cp bin/communication.jar -d bin src/edu/rit/swen755/judge/*.java 
jar cf bin/judge.jar -C bin edu/rit/swen755/judge
echo JAR for judge generated & echo.


echo Compiling fault monitor code 
javac -cp bin/communication.jar -d bin src/edu/rit/swen755/faultmonitor/*.java 
jar cf bin/faultmonitor.jar -C bin edu/rit/swen755/faultmonitor
echo JAR for fault monitor generated & echo.

echo DONE Compilation! Cleaning *.class files
RD /S /Q "bin/edu"


REM Execution
echo Starting Client
start javaw -cp bin/communication.jar;bin/client.jar edu/rit/swen755/client/MainFrame

echo Starting Monitor
start javaw -cp bin/communication.jar;bin/faultmonitor.jar;lib/sqlite-jdbc-3.8.11.2.jar edu/rit/swen755/faultmonitor/MonitorMain

