Return-Path: <linux-input+bounces-16983-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BB1DD13816
	for <lists+linux-input@lfdr.de>; Mon, 12 Jan 2026 16:11:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A97AE3170D2E
	for <lists+linux-input@lfdr.de>; Mon, 12 Jan 2026 15:00:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 556EF2DE6FB;
	Mon, 12 Jan 2026 14:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BJA4UV8b"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FD0C2E7F21;
	Mon, 12 Jan 2026 14:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768229956; cv=none; b=mXNRk5Qc59ir4sVz/eI1EqXYD2Cp00MOsIpyRZs5hspoLXr2OBXlRzjN4Qu2gfThN7MSKifF4xcmFqqpN2F2klidhsL99Vd/GaI7ZKZyT1VWgKldyEUS0W+w00CDWfpaX2FjuTnCP9dXHdlc1v+3grDl3GkAIF8A/ZQ2SmztiGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768229956; c=relaxed/simple;
	bh=5ufUitVWNFfrfch+BR7/BeFVooBFCM2j9ey14uZ+3cw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rSQE0RiZ2myDMuAdUfMsLtcGv9NBzTZ0nsiPiqNRr6pMEF9kQRVVhn+KTMLSEVzl1Rn1fxkIUwGgcz/XQ1XlleyvCxlxXbpYbAhIB0qmSx7FeCQmcmEIrQTPKFSNu3h05/W4NemgkE/zMatPhVivCVqNL7nwiZoMeWDOwis3oBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BJA4UV8b; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B52BC2BC9E;
	Mon, 12 Jan 2026 14:59:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768229955;
	bh=5ufUitVWNFfrfch+BR7/BeFVooBFCM2j9ey14uZ+3cw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BJA4UV8bcYbzijqb/RX3DMB7sIgqbu+An6OSBDqd5qKSWnTYIMBszGEOZY/loyvQP
	 XC0T45d37VYsjkrk7ximvLFjiWKOI8roDNNqIJrDSpIvvlnHrfBV3ownDMLNLl6vkT
	 sfSrvBB5HKZyAFPWwH4k+3M0gm/BMXaFBKVNluZj2aB43QMyQw3JTZMhQVJTGv0sem
	 5Pd3DWK9ApUT3IvEdjEDlV79JaF1+X46LNUb8BhKb02HETtBL2gOsADzoNHgI/0rM4
	 yQyPOTf7NdDXEDNzF9+WL9j0+2BuEXCDm94Op2Fas/LHMct5PMti+MGKWaryszUghh
	 YK52IxNSFueyA==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: =?UTF-8?q?Rodrigo=20Lugathe=20da=20Concei=C3=A7=C3=A3o=20Alves?= <lugathe2@gmail.com>,
	Terry Junge <linuxhid@cosmicgizmosystems.com>,
	Jiri Kosina <jkosina@suse.com>,
	Sasha Levin <sashal@kernel.org>,
	jikos@kernel.org,
	bentiss@kernel.org,
	linux-input@vger.kernel.org
Subject: [PATCH AUTOSEL 6.18-5.10] HID: Apply quirk HID_QUIRK_ALWAYS_POLL to Edifier QR30 (2d99:a101)
Date: Mon, 12 Jan 2026 09:58:21 -0500
Message-ID: <20260112145840.724774-20-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260112145840.724774-1-sashal@kernel.org>
References: <20260112145840.724774-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.18.5
Content-Transfer-Encoding: 8bit

From: Rodrigo Lugathe da Conceição Alves <lugathe2@gmail.com>

[ Upstream commit 85a866809333cd2bf8ddac93d9a3e3ba8e4f807d ]

The USB speaker has a bug that causes it to reboot when changing the
brightness using the physical knob.

Add a new vendor and product ID entry in hid-ids.h, and register
the corresponding device in hid-quirks.c with the required quirk.

Signed-off-by: Rodrigo Lugathe da Conceição Alves <lugathe2@gmail.com>
Reviewed-by: Terry Junge <linuxhid@cosmicgizmosystems.com>
Signed-off-by: Jiri Kosina <jkosina@suse.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

## Analysis of Commit: HID: Apply quirk HID_QUIRK_ALWAYS_POLL to Edifier
QR30

### 1. COMMIT MESSAGE ANALYSIS

The commit message clearly states:
- **Problem:** USB speaker has a bug causing it to reboot when changing
  brightness using the physical knob
- **Solution:** Apply `HID_QUIRK_ALWAYS_POLL` quirk to this device
- Has "Reviewed-by:" and "Signed-off-by:" from the HID maintainer (Jiri
  Kosina)

### 2. CODE CHANGE ANALYSIS

The changes are minimal and straightforward:

**hid-ids.h:** Adds 2 new defines
```c
#define USB_VENDOR_ID_EDIFIER      0x2d99
#define USB_DEVICE_ID_EDIFIER_QR30 0xa101
```

**hid-quirks.c:** Adds 1 entry to the quirks table
```c
{ HID_USB_DEVICE(USB_VENDOR_ID_EDIFIER, USB_DEVICE_ID_EDIFIER_QR30),
HID_QUIRK_ALWAYS_POLL },
```

The `HID_QUIRK_ALWAYS_POLL` quirk is well-established and used by dozens
of other devices in this same file (Corsair, Dell, Elan, HP, etc.). It
forces continuous polling which prevents certain hardware misbehaviors.

### 3. CLASSIFICATION

This falls into the **"QUIRKS and WORKAROUNDS" exception category** that
is explicitly allowed in stable:
- Hardware-specific quirk for a buggy/non-compliant device
- Uses existing, well-tested quirk infrastructure
- Pattern matches many other similar entries already in stable trees

### 4. SCOPE AND RISK ASSESSMENT

- **Lines changed:** 3 lines added (2 defines + 1 quirk entry)
- **Files touched:** 2 (hid-ids.h, hid-quirks.c)
- **Risk level:** Extremely low
- **Blast radius:** Only affects users with this specific Edifier QR30
  device
- **Regression potential:** Zero for other devices - the quirk entry is
  device-specific by USB vendor/product ID

### 5. USER IMPACT

- **Severity:** Device rebooting is a significant user-visible bug
- **Affected users:** Anyone with an Edifier QR30 USB speaker
- **Fix quality:** Complete fix for the reported issue

### 6. STABILITY INDICATORS

- Reviewed by Terry Junge (HID reviewer)
- Signed off by Jiri Kosina (HID subsystem maintainer)
- The `HID_QUIRK_ALWAYS_POLL` mechanism is mature and stable

### 7. DEPENDENCY CHECK

- No dependencies on other commits
- The quirk infrastructure exists in all stable trees
- The change is self-contained

### Summary

This is a textbook example of a stable-worthy commit:
1. **Fixes a real bug:** Device rebooting when using physical controls
2. **Small and surgical:** Only 3 lines, no logic changes
3. **Uses existing infrastructure:** `HID_QUIRK_ALWAYS_POLL` is well-
   established
4. **Device-specific:** Only affects this one USB speaker model
5. **Zero regression risk:** Cannot affect other devices
6. **Falls into explicit exception:** Device ID + quirk additions are
   explicitly allowed in stable

This matches the pattern of hundreds of similar HID quirk entries that
have been backported to stable kernels. The fix is trivial, low-risk,
and solves a real user-facing problem.

**YES**

 drivers/hid/hid-ids.h    | 3 +++
 drivers/hid/hid-quirks.c | 1 +
 2 files changed, 4 insertions(+)

diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index 3a22129fb7075..bec913a005a5d 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -439,6 +439,9 @@
 #define USB_DEVICE_ID_DWAV_EGALAX_MULTITOUCH_A001	0xa001
 #define USB_DEVICE_ID_DWAV_EGALAX_MULTITOUCH_C002	0xc002
 
+#define USB_VENDOR_ID_EDIFIER		0x2d99
+#define USB_DEVICE_ID_EDIFIER_QR30	0xa101	/* EDIFIER Hal0 2.0 SE */
+
 #define USB_VENDOR_ID_ELAN		0x04f3
 #define USB_DEVICE_ID_TOSHIBA_CLICK_L9W	0x0401
 #define USB_DEVICE_ID_HP_X2		0x074d
diff --git a/drivers/hid/hid-quirks.c b/drivers/hid/hid-quirks.c
index 3cf7971d49743..d6e42125d9189 100644
--- a/drivers/hid/hid-quirks.c
+++ b/drivers/hid/hid-quirks.c
@@ -81,6 +81,7 @@ static const struct hid_device_id hid_quirks[] = {
 	{ HID_USB_DEVICE(USB_VENDOR_ID_DRAGONRISE, USB_DEVICE_ID_DRAGONRISE_PS3), HID_QUIRK_MULTI_INPUT },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_DRAGONRISE, USB_DEVICE_ID_DRAGONRISE_WIIU), HID_QUIRK_MULTI_INPUT },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_DWAV, USB_DEVICE_ID_EGALAX_TOUCHCONTROLLER), HID_QUIRK_MULTI_INPUT | HID_QUIRK_NOGET },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_EDIFIER, USB_DEVICE_ID_EDIFIER_QR30), HID_QUIRK_ALWAYS_POLL },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_ELAN, HID_ANY_ID), HID_QUIRK_ALWAYS_POLL },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_ELO, USB_DEVICE_ID_ELO_TS2700), HID_QUIRK_NOGET },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_EMS, USB_DEVICE_ID_EMS_TRIO_LINKER_PLUS_II), HID_QUIRK_MULTI_INPUT },
-- 
2.51.0


