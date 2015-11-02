Understanding Databases
===

Data persistence
---
In the context of storing data, persistence refers to the data surviving even after the process that created it has ended. Specifically, this data needs to be written on non-volatile storage for long term use.

Session vs file-system vs database persistence
---
### Session
By and large, data created during a session (either during a web-session or a OS session) does not persist after the session has ended.

### File System
Generally file systems are persistent as the OS commits file changes to the hard-drive(non-volatile) storage.
