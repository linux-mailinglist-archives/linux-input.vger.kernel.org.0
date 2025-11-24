Return-Path: <linux-input+bounces-16304-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 61EACC7F59E
	for <lists+linux-input@lfdr.de>; Mon, 24 Nov 2025 09:08:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 241E23A6DA2
	for <lists+linux-input@lfdr.de>; Mon, 24 Nov 2025 08:08:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F18822EC0B4;
	Mon, 24 Nov 2025 08:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ki+6MLtF"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C57492EB847;
	Mon, 24 Nov 2025 08:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763971641; cv=none; b=ujmIx5m29K912cdrg0uDeoZkBLxr56327WbJaYypQpI8IZDYytr+WsCJygFL/56tzNDO9rUcR3S9pojbR7pKZXACK3CkyLh1XvyN7/ZBgdCkXDPOLvZdDYjf2LJE1Z7y0xgfN8v7j9JJSz5ysUDIDtvFg2Fj9ENcVHQp4KswSsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763971641; c=relaxed/simple;
	bh=3xxP7o/kKlOD2Di1va/vgkNB/Im1EkQapLn1PCi4NDE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KMg1T5axABb1w2nIpZB64wGoc326XGlFroIFnpIsy3mv1jMDgNbaBh/cyGlBBkFKyLqbsZ4+8xJXFoMGtdAOmVwbPJBJQbz3rzEv0PMmJJxzDRF8+TwHe9R27C85b0DUWHF2/UxqK4j/Tf99+NVPsm1DwGVPFnmZzA12dfc/LxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ki+6MLtF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB460C116D0;
	Mon, 24 Nov 2025 08:07:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763971641;
	bh=3xxP7o/kKlOD2Di1va/vgkNB/Im1EkQapLn1PCi4NDE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ki+6MLtFY7LL0/EX9QSB5gaI/HaIdat6NNteYl+rKSXrvA7HlniobQn32+3AN5Gyy
	 Aei3gN7wy9EfveGenr8yOMxLfpJrFGtPtQUmAJH0XLW0XSHrJai5ARZfx1BhV21yM9
	 paAs1bnmmezelXwlgxFQBYzYonq9Cm8dAS/+jwtFmgUi92wPaQm0V2pvs6n+/gEczJ
	 LunbRC1jq22ROBtf7emNYRIBFqfYel9shQDH4JJpNG5Fyo3RQLR4Pz+mgssqTWqY+R
	 nHNVYs8W5/nCU6ooEc1aXZV1iy8SyuucFjsTEP7JhdElhC2WD3bSAKEzEvHdx2bvn/
	 ArGx+50ySFjiw==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: April Grimoire <april@aprilg.moe>,
	Jiri Kosina <jkosina@suse.com>,
	Sasha Levin <sashal@kernel.org>,
	jikos@kernel.org,
	bentiss@kernel.org,
	linux-input@vger.kernel.org
Subject: [PATCH AUTOSEL 6.17-6.1] HID: apple: Add SONiX AK870 PRO to non_apple_keyboards quirk list
Date: Mon, 24 Nov 2025 03:06:34 -0500
Message-ID: <20251124080644.3871678-20-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251124080644.3871678-1-sashal@kernel.org>
References: <20251124080644.3871678-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.17.8
Content-Transfer-Encoding: 8bit

From: April Grimoire <april@aprilg.moe>

[ Upstream commit 743c81cdc98fd4fef62a89eb70efff994112c2d9 ]

SONiX AK870 PRO keyboard pretends to be an apple keyboard by VID:PID,
rendering function keys not treated properly. Despite being a
SONiX USB DEVICE, it uses a different name, so adding it to the list.

Signed-off-by: April Grimoire <april@aprilg.moe>
Signed-off-by: Jiri Kosina <jkosina@suse.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

## Comprehensive Analysis

### 1. Commit Message Analysis
The commit "HID: apple: Add SONiX AK870 PRO to non_apple_keyboards quirk
list" addresses a specific hardware compatibility issue. The SONiX AK870
PRO keyboard incorrectly identifies itself using Apple's Vendor ID (VID)
and Product ID (PID). This causes the `hid-apple` driver to mistakenly
apply Apple-specific function key behavior (where F1-F12 act as
media/special keys by default, requiring the Fn key to access standard
F-key functions).

The commit has no "Cc: stable" tag or "Fixes:" tag, but clearly
describes a hardware quirk fix.

### 2. Deep Code Research & Mechanism
The change modifies `drivers/hid/hid-apple.c` by adding a single entry
to the `non_apple_keyboards` array.

**The Mechanism:**
The `hid-apple` driver contains a function
`apple_is_non_apple_keyboard()` which iterates through the
`non_apple_keyboards` list:

```c
static const struct apple_non_apple_keyboard non_apple_keyboards[] = {
        { "SONiX USB DEVICE" },
        { "SONiX AK870 PRO" }, /* Added by this commit */
    /* ... other existing entries like Keychron, GANSS ... */
};

static bool apple_is_non_apple_keyboard(struct hid_device *hdev)
{
        /* ... iterates array and checks strncmp(hdev->name, ...) ... */
}
```

When a device matches an entry in this list, the driver sets the
`APPLE_IS_NON_APPLE` quirk. This flag fundamentally alters how the
driver processes input, specifically preventing the swapping of function
keys and Option/Command keys that is typical for genuine Apple hardware.

**Code Context:**
This infrastructure was introduced specifically to handle the growing
number of mechanical keyboards that use Apple's protocols/IDs for
compatibility but have PC physical layouts. The commit adds one string
literal to this existing, stable lookup table.

### 3. Feature vs. Bug Fix Classification
While technically "adding" a device ID string, this falls squarely under
the **Quirks and Workarounds** exception in the stable kernel rules.
- **The Bug:** Users of this specific keyboard currently experience
  broken function key behavior (F1-F12 do not work as expected for a PC
  layout).
- **The Fix:** A hardware-specific quirk that restores correct
  functionality.

### 4. Risk and Impact Assessment
- **Impact:** High for owners of this device (restores usability). Zero
  for everyone else.
- **Regression Risk:** **Negligible.** The change is a string addition
  to a static array. The logic uses `strncmp` against the device name.
  It is physically impossible for this change to affect any device that
  does not report its name starting with "SONiX AK870 PRO".
- **Mainline Status:** The commit was merged recently (late October
  2025). The pattern is well-established and has been used for other
  keyboards (e.g., Keychron, Hailuck) without incident.

### 5. Stable Kernel Rules Compliance
- **Fixes a real bug?** Yes, function key behavior is incorrect without
  it.
- **No new features?** Yes, it simply enables correct existing driver
  behavior for this hardware.
- **Small and contained?** Yes, one line of code.
- **Valid Exception?** Yes, explicitly allowed under "Hardware-specific
  quirks for broken/buggy devices."

### Conclusion
This is a textbook candidate for a stable backport. It fixes a user-
visible hardware regression (incorrect key mapping) using a low-risk,
established quirk mechanism. The lack of a "Cc: stable" tag is likely an
oversight common with trivial hardware ID additions, but it fully
qualifies under stable maintenance rules.

**YES**

 drivers/hid/hid-apple.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hid/hid-apple.c b/drivers/hid/hid-apple.c
index 61404d7a43ee1..57da4f86a9fa7 100644
--- a/drivers/hid/hid-apple.c
+++ b/drivers/hid/hid-apple.c
@@ -355,6 +355,7 @@ static const struct apple_key_translation swapped_fn_leftctrl_keys[] = {
 
 static const struct apple_non_apple_keyboard non_apple_keyboards[] = {
 	{ "SONiX USB DEVICE" },
+	{ "SONiX AK870 PRO" },
 	{ "Keychron" },
 	{ "AONE" },
 	{ "GANSS" },
-- 
2.51.0


