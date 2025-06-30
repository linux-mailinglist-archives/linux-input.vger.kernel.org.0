Return-Path: <linux-input+bounces-13247-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F4118AEE8CE
	for <lists+linux-input@lfdr.de>; Mon, 30 Jun 2025 22:59:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 17E8D17F848
	for <lists+linux-input@lfdr.de>; Mon, 30 Jun 2025 20:59:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 625D425FA0A;
	Mon, 30 Jun 2025 20:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="juqPVMCS"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37B551885A5;
	Mon, 30 Jun 2025 20:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751317171; cv=none; b=OntmC7IrCwgNm7hEez1bt8Z1TU9NR6VjLVGNJ60/rJyq71qFZXM9ymLE7oBCggZKgKNCtgnS/qOZ2irzVKGYHmetclhvp8djwZjI0u1oiHzkCVRsVb1cyUL/+qNBB+Np6+miUweVihnLvoRQPtFwemdi6k3sNVLskLLfYZ0t8RE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751317171; c=relaxed/simple;
	bh=I/kb4yEDAoUEAgWFO+/yMFZuXdBE2wv8ND3t1YSKcZ4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Uf4smLcs7OQ4hp+lPl5ugkowOEnoDO7ECWwHjj1zh8zCGHVRCqI10GuoV8nSmgSj5RbasYzsvf6YTi0OSvsXKTWZPUNln197mq6qfDeS9Ch7krwdj6aF5G9tgxd6BbvceGX9/83AJexLk8p86HPZmun7eRxpgrw7Qb7Og1sy2R4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=juqPVMCS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06763C4CEEB;
	Mon, 30 Jun 2025 20:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751317171;
	bh=I/kb4yEDAoUEAgWFO+/yMFZuXdBE2wv8ND3t1YSKcZ4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=juqPVMCSBYwRW24adnIElbI4cki/FOn8+UV5LHNLezZrxDQzZe58wfAwP94/+n1FJ
	 PFzt9k/TJBBt9xBwfyZ+L/aEG0SrLUBSwQf0Lw6ujMTaBf7VAkVAm7+ANc/FGpeFs9
	 en7vXxrljOoAqRUZFHeS6qW2TsLUGnDA0s1abPR2WouYsCaOIkvRO0mOl/VaQfUEMo
	 httYMN0wcQ7CcLu1+a61njPhjvlXScpVFLIs7vNDdmdswDdWKdORq5iEXVRRpKIw4N
	 F1XI9G61EV1QBBjWuuaPp8RLdc5rwZInuT4uidEtgIrVii8qzh/BxGFc6RjMINXTCC
	 JtwVpbmJO2OyQ==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: "Daniel J. Ogorchock" <djogorchock@gmail.com>,
	Silvan Jegen <s.jegen@gmail.com>,
	Jiri Kosina <jkosina@suse.com>,
	Sasha Levin <sashal@kernel.org>,
	jikos@kernel.org,
	bentiss@kernel.org,
	linux-input@vger.kernel.org
Subject: [PATCH AUTOSEL 6.15 23/23] HID: nintendo: avoid bluetooth suspend/resume stalls
Date: Mon, 30 Jun 2025 16:44:28 -0400
Message-Id: <20250630204429.1357695-23-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250630204429.1357695-1-sashal@kernel.org>
References: <20250630204429.1357695-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.15.4
Content-Transfer-Encoding: 8bit

From: "Daniel J. Ogorchock" <djogorchock@gmail.com>

[ Upstream commit 4a0381080397e77792a5168069f174d3e56175ff ]

Ensure we don't stall or panic the kernel when using bluetooth-connected
controllers. This was reported as an issue on android devices using
kernel 6.6 due to the resume hook which had been added for usb joycons.

First, set a new state value to JOYCON_CTLR_STATE_SUSPENDED in a
newly-added nintendo_hid_suspend. This makes sure we will not stall out
the kernel waiting for input reports during led classdev suspend. The
stalls could happen if connectivity is unreliable or lost to the
controller prior to suspend.

Second, since we lose connectivity during suspend, do not try
joycon_init() for bluetooth controllers in the nintendo_hid_resume path.

Tested via multiple suspend/resume flows when using the controller both
in USB and bluetooth modes.

Signed-off-by: Daniel J. Ogorchock <djogorchock@gmail.com>
Reviewed-by: Silvan Jegen <s.jegen@gmail.com>
Signed-off-by: Jiri Kosina <jkosina@suse.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

**YES**

This commit should be backported to stable kernel trees. Here's the
extensive analysis:

## Bug Severity and Impact

The commit fixes a serious bug that causes **kernel stalls or panics
during suspend/resume** when using Bluetooth-connected Nintendo
controllers. This was specifically reported on Android devices running
kernel 6.6, indicating real-world user impact. Kernel stalls/panics
during suspend/resume are critical issues that can lead to data loss and
poor user experience.

## Root Cause Analysis

Looking at the code changes and the `joycon_enforce_subcmd_rate()`
function at lines 825-854:

```c
do {
    joycon_wait_for_input_report(ctlr);
    // ... other code ...
} while ((consecutive_valid_deltas < JC_SUBCMD_VALID_DELTA_REQ ||
          subcmd_delta < JC_SUBCMD_RATE_LIMITER_MS(ctlr)) &&
         ctlr->ctlr_state == JOYCON_CTLR_STATE_READ &&
         attempts < JC_SUBCMD_RATE_MAX_ATTEMPTS);
```

This function contains a blocking loop that waits for input reports. If
a Bluetooth controller loses connectivity before suspend, this loop
could continue indefinitely (up to max attempts), causing the suspend
process to stall.

## Fix Analysis

The fix is elegant and minimal:

1. **New SUSPENDED state**: Adds `JOYCON_CTLR_STATE_SUSPENDED` to
   prevent blocking operations during suspend
2. **Suspend handler**: Sets the controller state to SUSPENDED, which
   breaks the blocking loop in `joycon_enforce_subcmd_rate()` since it
   checks for `ctlr_state == JOYCON_CTLR_STATE_READ`
3. **Resume handler modification**:
   - For Bluetooth controllers: Simply resets state to READ without
     reinitializing (since BT connection is lost anyway)
   - For USB controllers: Maintains existing behavior with
     `joycon_init()`

## Backport Suitability

1. **Small and contained**: The changes are minimal - adding one enum
   value, one suspend function, and modifying the resume logic
2. **No architectural changes**: Pure bug fix with no feature additions
3. **Low regression risk**: Changes only affect suspend/resume paths for
   this specific driver
4. **Similar to accepted backports**:
   - Similar Commit #2 (backported) fixed USB controller resume issues
   - Similar Commit #4 (backported) fixed a null pointer dereference

## Stable Tree Compliance

The fix meets all stable kernel criteria:
- Fixes a real bug affecting users (kernel stalls/panics)
- Minimal change scope
- No new features or APIs
- Confined to a single driver subsystem
- Clear problem and solution

The fact that this was reported on production Android devices using
kernel 6.6 further emphasizes the need for backporting to ensure stable
kernel users don't experience these suspend/resume failures.

 drivers/hid/hid-nintendo.c | 38 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 36 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/hid-nintendo.c b/drivers/hid/hid-nintendo.c
index 839d5bcd72b1e..fb4985988615b 100644
--- a/drivers/hid/hid-nintendo.c
+++ b/drivers/hid/hid-nintendo.c
@@ -308,6 +308,7 @@ enum joycon_ctlr_state {
 	JOYCON_CTLR_STATE_INIT,
 	JOYCON_CTLR_STATE_READ,
 	JOYCON_CTLR_STATE_REMOVED,
+	JOYCON_CTLR_STATE_SUSPENDED,
 };
 
 /* Controller type received as part of device info */
@@ -2750,14 +2751,46 @@ static void nintendo_hid_remove(struct hid_device *hdev)
 
 static int nintendo_hid_resume(struct hid_device *hdev)
 {
-	int ret = joycon_init(hdev);
+	struct joycon_ctlr *ctlr = hid_get_drvdata(hdev);
+	int ret;
+
+	hid_dbg(hdev, "resume\n");
+	if (!joycon_using_usb(ctlr)) {
+		hid_dbg(hdev, "no-op resume for bt ctlr\n");
+		ctlr->ctlr_state = JOYCON_CTLR_STATE_READ;
+		return 0;
+	}
 
+	ret = joycon_init(hdev);
 	if (ret)
-		hid_err(hdev, "Failed to restore controller after resume");
+		hid_err(hdev,
+			"Failed to restore controller after resume: %d\n",
+			ret);
+	else
+		ctlr->ctlr_state = JOYCON_CTLR_STATE_READ;
 
 	return ret;
 }
 
+static int nintendo_hid_suspend(struct hid_device *hdev, pm_message_t message)
+{
+	struct joycon_ctlr *ctlr = hid_get_drvdata(hdev);
+
+	hid_dbg(hdev, "suspend: %d\n", message.event);
+	/*
+	 * Avoid any blocking loops in suspend/resume transitions.
+	 *
+	 * joycon_enforce_subcmd_rate() can result in repeated retries if for
+	 * whatever reason the controller stops providing input reports.
+	 *
+	 * This has been observed with bluetooth controllers which lose
+	 * connectivity prior to suspend (but not long enough to result in
+	 * complete disconnection).
+	 */
+	ctlr->ctlr_state = JOYCON_CTLR_STATE_SUSPENDED;
+	return 0;
+}
+
 #endif
 
 static const struct hid_device_id nintendo_hid_devices[] = {
@@ -2796,6 +2829,7 @@ static struct hid_driver nintendo_hid_driver = {
 
 #ifdef CONFIG_PM
 	.resume		= nintendo_hid_resume,
+	.suspend	= nintendo_hid_suspend,
 #endif
 };
 static int __init nintendo_init(void)
-- 
2.39.5


