#include <stdlib.h>
#include <stdio.h>
#include <syslog.h>
#include <errno.h>
#include <string.h>

int main(int argc, char **argv) {
    openlog("writer-app", 0, LOG_USER);
    syslog(LOG_INFO, "Starting writer program");

    if (argc != 3) {
        syslog(LOG_ERR, "Invalid number of arguments, expected 2, given %d", argc - 1);
        exit(1);
    }

    char *writefile = argv[1];
    char *writetext = argv[2];

    FILE *file = fopen(writefile, "w");
    if (file == NULL) {
        syslog(LOG_ERR, "Failed to open file with error code %d: %s", errno, strerror(errno));
        exit(1);
    }

    syslog(LOG_DEBUG, "Writing <%s> to <%s>", writetext, writefile);
    int writecode = fprintf(file, "%s\n", writetext);

    if (writecode < 0) {
        syslog(LOG_ERR, "Failed to write to file with error code %d", writecode);
        exit(1);
    }

    syslog(LOG_ERR, "Successfully writing text to file");

    return 0;
}