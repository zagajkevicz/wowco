
#!/usr/bin/env bash
set -euo pipefail
# Simple backup with daily rotation (keeps 7 days)
# Usage: ./09_backup.sh /path/to/source /path/to/backup_dir

src="${1:-.}"
dest="${2:-./backups}"
stamp="$(date +%F)"
mkdir -p "$dest"
tar czf "$dest/backup-$stamp.tgz" -C "$src" .
# keep last 7
ls -1t "$dest"/backup-*.tgz | tail -n +8 | xargs -r rm -f
echo "Backup created at $dest/backup-$stamp.tgz"
