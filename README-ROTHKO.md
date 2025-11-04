# Rothko Patch Branch

This branch contains minimal, repository-local patches needed by the Rothko project.

Do not commit build artifacts or large binaries. Keep diffs small and focused.

Update flow:
1. Add upstream remote if missing (example):
   git remote add upstream <upstream-url>
2. Update upstream and rebase patches:
   git fetch upstream
   git checkout rothko-*-patches
   git rebase upstream/master || upstream/main
3. Push to fork:
   git push -u fork HEAD
4. In the main repo:
   git add <submodule-path> && git commit -m "chore(vendors): bump <name>"
