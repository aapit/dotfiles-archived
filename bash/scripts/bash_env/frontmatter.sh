#!/bin/bash
date=$(date +%Y%m%d)
/bin/cat <<EOF
---
created: $date
author: David
---

EOF
