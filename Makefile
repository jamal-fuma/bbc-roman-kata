JSTESTDRIVER_HOME := `pwd`
JSTESTDRIVER_JAR :=  JsTestDriver-1.3.4.b.jar
.PHONY: start_server stop_server clean pidfile help
.SUFFIXES: .js .coffee

all: build check
build: lib/roman.js lib-tests/test_suite.js

lib/roman.js : src/roman.coffee
lib-tests/test_suite.js : src-tests/test_suite.coffee

lib/%.js : src/%.coffee
	coffee --compile -p $< > $@

lib-tests/%.js : src-tests/%.coffee
	coffee --compile -p $< > $@

clean:
	rm -fv lib/*.js lib-tests/*.js

pidfile:
	rm -f pidfile
	java -jar "${JSTESTDRIVER_HOME}/jars/${JSTESTDRIVER_JAR}" --port 4224 & echo "$$!" > pidfile

start_server: pidfile
	# need to give java time to scrape it's flabby backside off the disc
	sleep 1
	echo 3
	sleep 1
	echo 2
	sleep 1
	echo 1
	open "http://localhost:4224/capture"

stop_server:
	kill `cat pidfile` || true
	rm -f pidfile

check-all: clean all stop_server start_server check
	java -jar "${JSTESTDRIVER_HOME}/jars/${JSTESTDRIVER_JAR}" --tests all

check: build
	java -jar "${JSTESTDRIVER_HOME}/jars/${JSTESTDRIVER_JAR}" --tests all
help:
	@ printf "Supported Targets:\n\t%s\n\t%s\n\t%s\n\t%s\n\t%s\n\t%s\n" start_server stop_server clean check check-all help
