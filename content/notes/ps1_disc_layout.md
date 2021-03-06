+++
title = "PS1 Disc Layout"
author = ["Marcus Crane"]
lastmod = 2020-08-07T15:35:17+12:00
tags = ["ps1", "gaming", "cd", "iso"]
draft = false
hidedate = true
+++

The Playstation 1 uses CD-ROMs with the [XA extension](https://en.wikipedia.org/wiki/CD-ROM#CD-ROM%5FXA%5Fextension).

If you open a PS1 ISO within a hex editor, you'll want to scroll down to `offset 37656`


## Why do PS1 discs start at offset 37656? {#why-do-ps1-discs-start-at-offset-37656}

Within a normal CD (or ISO), it will have a header offset size of `2048`.

It seems a little arbitrary but you can read the table of contents by multiplying the header offset by 16.

For a normal CD, this would be `2048 * 16 = 32768`

In the case of PS1 discs, the header offset size is `2352` for reasons I don't understand so they start at `2352 * 16 = 37632`

Lastly, and somewhat arbitrarily, you'll want to jump forward by an additional `24` bytes in order to come to the starting point of `37565 points`


## What does a table of contents look like? {#what-does-a-table-of-contents-look-like}

Using `Digimon World 2003` as an example, here's a table of what exists within the table of contents

| Number of bytes | ASCII contents of section                                                                                                        | Notes                                                       |
|-----------------|----------------------------------------------------------------------------------------------------------------------------------|-------------------------------------------------------------|
| 1               | \x01                                                                                                                             | Volume descriptor code. 1 means "Primary Volume Descriptor" |
| 5               | CD001                                                                                                                            | This is always set to "CD001"                               |
| 1               | \x01                                                                                                                             | Volume descriptor version (0x01)                            |
| 1               | \x00                                                                                                                             | This segment is unused                                      |
| 32              | PLAYSTATION                                                                                                                      | This identifies the system that can act upon the disc       |
| 32              | DMW3                                                                                                                             | The disc identifier. DMW3 means Digimon World 2003          |
| 8               | \x00 (repeating 8 times)                                                                                                         | This segment is unused                                      |
| 8               | \x88}\x04\x00\x00\x04}\x88                                                                                                       | The number of logical blocks the volume is recorded on      |
| 32              | \x00 (repeating 32 times)                                                                                                        | This segment is unused                                      |
| 4               | \x01\x00\x00\x01                                                                                                                 | Volume set size                                             |
| 4               | \x01\x00\x00\x01                                                                                                                 | Volume sequence number                                      |
| 4               | \x00\x08\x08\x00                                                                                                                 | Logical block size                                          |
| 8               | D:\x05\x00\x00\x00\x00\x05D                                                                                                      | Path table size                                             |
| 4               | \x12\x00\x00\x00                                                                                                                 | Location of Type L table                                    |
| 4               | \x13\x00\x00\x00                                                                                                                 | Optional L-Type table                                       |
| 4               | \x00\x00\x00\x14                                                                                                                 | Location of Type M table                                    |
| 4               | \x00\x00\x00\x15                                                                                                                 | Optional M-Type table                                       |
| 34              | "\x00\x16\x00\x00\x00\x00\x00\x00\x16\x00\x08\x00\x00\x00\x00\x08\x00\x02\n\x01\x00\x00\x00$\x02\x00\x00\x01\x00\x00\x01\x01\x00 | Directory entry for the root directory                      |
| 128             | <blank>                                                                                                                          | Volume set identifier                                       |
| 128             | BANDAI                                                                                                                           | Publisher identifier. Bandai are the publishers of Digimon  |
| 128             | BANDAI                                                                                                                           | Data preparer identifier                                    |
| 128             | PLAYSTATION                                                                                                                      | Application identifier                                      |
| 38              | BANDAI                                                                                                                           | Copyright file identifier                                   |
| 36              | <blank>                                                                                                                          | Abstract info                                               |
| 37              | <blank>                                                                                                                          | Bibliographic info                                          |
| 17              | 2002100100000000$                                                                                                                | Volume creation date. Ironically it was released in 2002    |
| 17              | 0000000000000000\x00                                                                                                             | Volume modification date                                    |
| 17              | 0000000000000000\x00                                                                                                             | Volume expiration date                                      |
| 1               | 0                                                                                                                                | Records and path table version                              |
| 1               | 0                                                                                                                                | This segment is unused                                      |
