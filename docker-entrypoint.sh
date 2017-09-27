#!/usr/bin/env bash
Xvfb :99 & export DISPLAY=:99
java -Dclientlocation=alpha -Dregion=alpha -Dchat=false -cp /home/perf.jar org.junit.runner.JUnitCore SimpleChatTest
tail -f /dev/null
