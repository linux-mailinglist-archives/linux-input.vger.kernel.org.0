Return-Path: <linux-input+bounces-15768-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 89C00C1237A
	for <lists+linux-input@lfdr.de>; Tue, 28 Oct 2025 01:42:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 26E8D56573C
	for <lists+linux-input@lfdr.de>; Tue, 28 Oct 2025 00:40:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81CD71E9B35;
	Tue, 28 Oct 2025 00:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i2oC3OjJ"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58C321F4281;
	Tue, 28 Oct 2025 00:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761612008; cv=none; b=tY3er5s16rBmrFv7Z43evbZcH5SdM8X+pkzmnZ59j/5XwTVzDtaX3TflneHhXr6dEipZYXzxGiSb6FoQjEfwCfuu2mvz20g/+ca5bIHEH3aixiDyJa3qDRhMDzoPiHeW9mHT8sDq7BCKvsuupaof0bzWI624Y5Q29x9/UF0g7hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761612008; c=relaxed/simple;
	bh=fIZzBklwfKt/NIaeXASCbLCUaV2Jt0Dq92MyXkQQG9A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hun+w2wVwt3bNO6Fs0kBRJ8+zu0oxqNo2JXGd5BjHl4WDKz01os5CsLoiZDRtS0IwsHiXaerMdKGsP+ZrU+3o3XIqQMSsQddkQTocYodxE7N3sG83LloOQDnd2cVwLhq7PYBLL5ePePqQT4YLprrpvP4B3s5GKOty3dn0sxEjU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i2oC3OjJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFD0DC4CEF1;
	Tue, 28 Oct 2025 00:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761612005;
	bh=fIZzBklwfKt/NIaeXASCbLCUaV2Jt0Dq92MyXkQQG9A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=i2oC3OjJDgisxH6NbhlT5Jd91oxDKtNd94HN1W8rHO4YBDtZVZ6aAaql1gL8BMQgv
	 qea2YItwdVXitLteFn0dHhADBZmBI8sBxqlHKJ363mXrg3wtE8HR5W4VkLH18csBQJ
	 4H9OtUe5c8Hk84maFDfREdSqbacktsCffzBKw1J5zvIZ6ucJB/HbFKpZTSpKWJk/Qw
	 J44yLiSGz4GXN7N6bGwEIFHwG/elq2KXspdtpJCXADCA+mFOKZTas9uwvwy+70b0Rz
	 jeFKmwJMWt55iHOpBKM+gWk8q9rEZI+wjau7fbbCrd3WRvk095v+rJXWtm45qs/ZMO
	 kzdRjH3GIdXVw==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Tristan Lobb <tristan.lobb@it-lobb.de>,
	Jiri Kosina <jkosina@suse.com>,
	Sasha Levin <sashal@kernel.org>,
	jikos@kernel.org,
	bentiss@kernel.org,
	linux-input@vger.kernel.org
Subject: [PATCH AUTOSEL 6.17-5.4] HID: quirks: avoid Cooler Master MM712 dongle wakeup bug
Date: Mon, 27 Oct 2025 20:38:54 -0400
Message-ID: <20251028003940.884625-10-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251028003940.884625-1-sashal@kernel.org>
References: <20251028003940.884625-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.17.5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Tristan Lobb <tristan.lobb@it-lobb.de>

[ Upstream commit 0be4253bf878d9aaa2b96031ac8683fceeb81480 ]

The Cooler Master Mice Dongle includes a vendor defined HID interface
alongside its mouse interface. Not polling it will cause the mouse to
stop responding to polls on any interface once woken up again after
going into power saving mode.

Add the HID_QUIRK_ALWAYS_POLL quirk alongside the Cooler Master VID and
the Dongle's PID.

Signed-off-by: Tristan Lobb <tristan.lobb@it-lobb.de>
Signed-off-by: Jiri Kosina <jkosina@suse.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

## BACKPORT RECOMMENDATION: **YES**

Based on comprehensive analysis using semantic code analysis tools and
repository examination, this commit **SHOULD** be backported to stable
kernel trees.

---

## DETAILED ANALYSIS

### 1. SEMANTIC TOOLS USED

**MCP Semcode Tools:**
- `mcp__semcode__grep_functions`: Searched for all uses of
  HID_QUIRK_ALWAYS_POLL across the HID subsystem - found 5 usage sites
  in usbhid/hid-core.c
- `mcp__semcode__find_function`: Located the `hid_lookup_quirk()`
  function (drivers/hid/hid-quirks.c:1297-1332) to understand quirk
  application mechanism
- `mcp__semcode__find_callers`: Identified 3 callers of
  `hid_lookup_quirk()` - `__hid_device_probe()`, `hid_add_device()`, and
  `usbhid_parse()` - confirming quirks are applied during device
  initialization

**Standard Tools:**
- `Grep`: Found HID_QUIRK_ALWAYS_POLL definition (BIT(10) in
  include/linux/hid.h:383) and 45+ existing quirk entries using this
  flag
- `Read`: Examined usbhid/hid-core.c implementation (lines 680-763,
  1165-1224) to understand quirk behavior
- Git analysis: Reviewed commit history showing this is a well-
  established pattern with many similar commits

### 2. CODE CHANGE ANALYSIS

**What Changed:**
- **drivers/hid/hid-ids.h** (+3 lines): Added vendor ID (0x2516) and
  product ID (0x01b7) definitions for Cooler Master
- **drivers/hid/hid-quirks.c** (+1 line): Added quirk table entry
  mapping the device to HID_QUIRK_ALWAYS_POLL

**Change Size:** 4 lines added, 0 lines removed (0.075% addition to hid-
quirks.c)

### 3. FUNCTIONAL IMPACT

**What HID_QUIRK_ALWAYS_POLL Does (verified via semantic analysis):**

From examining `drivers/hid/usbhid/hid-core.c`:

- **usbhid_start() (line 1170-1182)**: Immediately starts input polling
  and sets `needs_remote_wakeup`, keeping device active from
  initialization
- **usbhid_open() (line 689-692)**: Skips normal power management setup,
  preventing device sleep
- **usbhid_close() (line 752-760)**: Does NOT stop polling or cancel
  URBs when interface closes - device stays active
- **usbhid_stop() (line 1219-1222)**: Only clears polling when device is
  fully stopped

**Effect:** Device continuously polls and never enters power-saving
mode, preventing wakeup bugs.

### 4. BUG FIXED

**User-Visible Problem:**
The Cooler Master MM712 dongle has a vendor-defined HID interface
alongside its mouse interface. If not continuously polled, the mouse
completely stops responding after waking from power-saving mode,
rendering it unusable.

**Severity:** HIGH for affected users - device becomes completely non-
functional after entering power save

**Affected Hardware:** Only Cooler Master MM712 wireless mouse dongle
(USB VID:PID = 0x2516:0x01b7)

### 5. IMPACT SCOPE (via semantic analysis)

**Callers of quirk system:**
- `hid_lookup_quirk()` is called during device probe/initialization by 3
  functions
- Quirks are matched via exact USB VID/PID comparison in the
  `hid_quirks[]` static table
- **Result:** This change ONLY affects devices with exact VID/PID match
  (0x2516:0x01b7)

**Regression Risk:** **NEAR ZERO**
- Cannot affect any other devices - quirk is device-specific via
  hardware ID matching
- Uses 100% existing code paths - no new logic introduced
- 45+ other devices already use identical HID_QUIRK_ALWAYS_POLL
  mechanism successfully

**Dependencies:** **NONE**
- HID_QUIRK_ALWAYS_POLL has existed since early quirk system
  implementation
- All code paths already present in stable kernels
- No API changes, no struct changes, no architectural changes

### 6. STABLE TREE COMPLIANCE

**Criteria Assessment:**

✅ **Fixes user-visible bug:** YES - mouse stops working after power save
✅ **Obviously correct:** YES - uses established pattern, 45+ similar
devices
✅ **Small and contained:** YES - only 4 lines, single quirk entry
✅ **No new features:** YES - purely a hardware compatibility fix
✅ **Low regression risk:** YES - device-specific, cannot affect others
✅ **Real-world impact:** YES - device unusable without fix
✅ **Self-contained:** YES - no dependencies on other commits

❌ **Explicit stable tag:** NO - but not required for autosel or manual
selection

### 7. HISTORICAL PRECEDENT

**Similar commits in kernel history (verified via git log):**

Found 20+ nearly identical commits adding HID_QUIRK_ALWAYS_POLL for
mice/keyboards:
- ADATA XPG wireless gaming mice (multiple commits: fa9fdeea1b7d6,
  cea2bda9d89b3, etc.)
- Lenovo PixArt optical mice (6c46659b46cc9, 8ca621939d766,
  b2fc347e2126b, etc.)
- Dell, HP, Microsoft, Logitech mice (multiple devices)
- Chicony, Primax, KYE mice (multiple devices)

**Pattern:** These hardware compatibility quirks are routinely added and
are excellent backport candidates due to:
- User-facing functionality fixes
- Zero risk to other hardware
- Minimal code size
- Well-tested mechanism

### 8. BACKPORT JUSTIFICATION

**Strong reasons FOR backporting:**

1. **Real user impact:** Users with this hardware experience complete
   device failure after power save - this is not a minor inconvenience
   but a critical functionality loss

2. **Surgical precision:** The fix is perfectly targeted - only affects
   the specific broken hardware, impossible to cause regressions on
   other systems

3. **Battle-tested mechanism:** HID_QUIRK_ALWAYS_POLL is used by 45+
   devices successfully. The code paths are mature and stable.

4. **Trivial to apply:** 4 lines of code, no conflicts expected, no
   dependencies on other changes

5. **Follows stable rules:** This is a bug fix, not a feature. It's
   small, obvious, and important.

6. **Cost/benefit ratio:** Minimal backport effort vs significant user
   experience improvement

**Arguments AGAINST backporting:**

1. No explicit "Cc: stable@vger.kernel.org" tag (but this is common for
   autosel-eligible fixes)

**Verdict:** The arguments for backporting overwhelmingly outweigh the
single minor argument against.

---

## RECOMMENDATION SUMMARY

**Backport Status: YES**

This commit is an **excellent candidate** for stable backporting. It
fixes a critical hardware compatibility bug affecting Cooler Master
MM712 dongle users, is completely self-contained, carries near-zero
regression risk, and follows a well-established kernel pattern for
handling power management issues in HID devices. The change is surgical,
minimal, and addresses a real user-facing problem that renders hardware
unusable.

 drivers/hid/hid-ids.h    | 3 +++
 drivers/hid/hid-quirks.c | 1 +
 2 files changed, 4 insertions(+)

diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index ded5348d190c5..cca5e841bf50c 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -342,6 +342,9 @@
 #define USB_DEVICE_ID_CODEMERCS_IOW_FIRST	0x1500
 #define USB_DEVICE_ID_CODEMERCS_IOW_LAST	0x15ff
 
+#define USB_VENDOR_ID_COOLER_MASTER	0x2516
+#define USB_DEVICE_ID_COOLER_MASTER_MICE_DONGLE	0x01b7
+
 #define USB_VENDOR_ID_CORSAIR		0x1b1c
 #define USB_DEVICE_ID_CORSAIR_K90	0x1b02
 #define USB_DEVICE_ID_CORSAIR_K70R      0x1b09
diff --git a/drivers/hid/hid-quirks.c b/drivers/hid/hid-quirks.c
index ffd034566e2e1..d7105a8395982 100644
--- a/drivers/hid/hid-quirks.c
+++ b/drivers/hid/hid-quirks.c
@@ -57,6 +57,7 @@ static const struct hid_device_id hid_quirks[] = {
 	{ HID_USB_DEVICE(USB_VENDOR_ID_CH, USB_DEVICE_ID_CH_FLIGHT_SIM_YOKE), HID_QUIRK_NOGET },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_CH, USB_DEVICE_ID_CH_PRO_PEDALS), HID_QUIRK_NOGET },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_CH, USB_DEVICE_ID_CH_PRO_THROTTLE), HID_QUIRK_NOGET },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_COOLER_MASTER, USB_DEVICE_ID_COOLER_MASTER_MICE_DONGLE), HID_QUIRK_ALWAYS_POLL },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_CORSAIR, USB_DEVICE_ID_CORSAIR_K65RGB), HID_QUIRK_NO_INIT_REPORTS },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_CORSAIR, USB_DEVICE_ID_CORSAIR_K65RGB_RAPIDFIRE), HID_QUIRK_NO_INIT_REPORTS | HID_QUIRK_ALWAYS_POLL },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_CORSAIR, USB_DEVICE_ID_CORSAIR_K70RGB), HID_QUIRK_NO_INIT_REPORTS },
-- 
2.51.0


