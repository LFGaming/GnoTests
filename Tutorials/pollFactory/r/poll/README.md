# How to use

## Making a poll:
```bash
gnokey maketx call --pkgpath "gno.land/r/poll" --func "NewPoll" --args "<POLLID>" --args "Testing polls" --args "123456" --gas-fee 10000000ugnot --gas-wanted 80000000 --broadcast --chainid dev --remote localhost:26657 KEYNAME
```

## How to Vote:
```bash
gnokey maketx call --pkgpath "gno.land/r/poll" --func "Vote" --args "<POLLID>" --args "true" --gas-fee 10000000ugnot --gas-wanted 80000000 --broadcast --chainid dev --remote localhost:26657 KEYNAME
```