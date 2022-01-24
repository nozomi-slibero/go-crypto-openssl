// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

//go:build linux && !android
// +build linux,!android

package openssl

import (
	"testing"
)

// Just tests that we can create an HMAC instance.
// Previously would cause panic because of incorrect
// stack allocation of opaque OpenSSL type.
func TestNewHMAC(t *testing.T) {
	mac := NewHMAC(NewSHA256, nil)
	mac.Write([]byte("foo"))
	t.Logf("%x\n", mac.Sum(nil))
}