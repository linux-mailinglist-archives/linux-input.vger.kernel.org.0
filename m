Return-Path: <linux-input+bounces-16302-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CC97C7F55E
	for <lists+linux-input@lfdr.de>; Mon, 24 Nov 2025 09:07:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 8785534752E
	for <lists+linux-input@lfdr.de>; Mon, 24 Nov 2025 08:07:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 622272E7F20;
	Mon, 24 Nov 2025 08:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c5TBwTgt"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 373D62EC558;
	Mon, 24 Nov 2025 08:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763971622; cv=none; b=unH/Xhn3THc320pmnDKHJ1Jm/PamS5mCZ/w8rdjHfds1zjXKy2j93wT1EH1ZjdPungmMD/KTirfQjIiKFcDZ/6w6b8LpvWHPjNHrDCF0nuaauhnAizxpMzuRHcwghJPzk5KnJl/IUjizwlqcZMTszBfRNpUlP4bmJJ4vqOghK/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763971622; c=relaxed/simple;
	bh=wWn2fFkvfS2BW05C4j4Nqd4FyTvffI/Pm38CGFFsLg0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=juTT14UFwe74kSsc7EoLMwu/vAubgVohMW7/JeVARD0eGNqWVKKBtmKERnKwjxfJX66sgGLGuEnSiAqPLUZMQjUtKK0YULZgNiN7ySH/EjQgZxD7I1qfcetr8TlxHeaI5zHJeCk7Y2IUA2ZZSZScPoSNLrAeUtehJbAxOCDO0Hc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c5TBwTgt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4D00C16AAE;
	Mon, 24 Nov 2025 08:07:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763971621;
	bh=wWn2fFkvfS2BW05C4j4Nqd4FyTvffI/Pm38CGFFsLg0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=c5TBwTgt5XIHMsVjsjtNCk5d9DA5e16vUcFE3LKovjCElil6J+NoZSKNjAuAM8TZt
	 452+79dc+EzJ3k28Wzt9DxBoqj0sX06t40KhQbxmD0XG0bVTDHlg0NAinqJqEMLIqJ
	 4Bbd0QVKltP1B56ZTxosS+j1jZovbxzTwfh1GZDYqeO0CraHUXHsiTIqU5+tUDD+QS
	 w5BeM/ID/ZHEShMVbimbtRpLTUP3OeUCM4ko/AL+UIAX0SZIO5UXaVHrQodDP8k6FJ
	 t0UXndJQf5NjaieKt7YDG5eILXBH2+ihlFztizf/izP0xlMB7tw6ic4MMTihNDlKPt
	 5A/25AsUmSK7Q==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: "Mario Limonciello (AMD)" <superm1@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Andr=C3=A9=20Barata?= <andretiagob@protonmail.com>,
	Jiri Kosina <jkosina@suse.com>,
	Sasha Levin <sashal@kernel.org>,
	jikos@kernel.org,
	bentiss@kernel.org,
	linux-input@vger.kernel.org
Subject: [PATCH AUTOSEL 6.17-6.6] HID: hid-input: Extend Elan ignore battery quirk to USB
Date: Mon, 24 Nov 2025 03:06:23 -0500
Message-ID: <20251124080644.3871678-9-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251124080644.3871678-1-sashal@kernel.org>
References: <20251124080644.3871678-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.17.8
Content-Transfer-Encoding: 8bit

From: "Mario Limonciello (AMD)" <superm1@kernel.org>

[ Upstream commit 534ca75e8e3b713514b3f2da85dab96831cf5b2a ]

USB Elan devices have the same problem as the I2C ones with a fake
battery device showing up.

Reviewed-by: Hans de Goede <hansg@kernel.org>
Reported-by: André Barata <andretiagob@protonmail.com>
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=220722
Signed-off-by: Mario Limonciello (AMD) <superm1@kernel.org>
Signed-off-by: Jiri Kosina <jkosina@suse.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

## Comprehensive Analysis

### 1. Commit Message Analysis
The commit "HID: hid-input: Extend Elan ignore battery quirk to USB"
addresses a specific hardware compatibility issue where Elan USB
touchscreens incorrectly report a battery device to the OS.
- **Problem:** Users see a non-existent or "fake" battery in their
  system tray/power settings, which can cause confusion and interfere
  with power management logic.
- **Context:** The message notes that "USB Elan devices have the same
  problem as the I2C ones," referencing a known issue.
- **References:** It links to a specific bug report (Bugzilla #220722)
  and has a `Reviewed-by` tag from the subsystem maintainer (Hans de
  Goede).

### 2. Deep Code Research
- **Code Change:** The patch modifies `drivers/hid/hid-input.c` by
  adding a single line to the `hid_battery_quirks` table:
  ```c
  { HID_USB_DEVICE(USB_VENDOR_ID_ELAN, HID_ANY_ID),
  HID_BATTERY_QUIRK_IGNORE },
  ```
- **Historical Context:** This change mirrors commit `bcc31692a1d1e`
  (August 2024), which applied the same `HID_ANY_ID` catch-all quirk for
  **I2C** Elan devices. That previous commit was successfully backported
  to stable trees.
- **Mechanism:** The `hid-input` driver checks connected devices against
  the `hid_battery_quirks` table. When a match is found with
  `HID_BATTERY_QUIRK_IGNORE`, the function `hidinput_setup_battery()`
  returns early, preventing the creation of the bogus power supply
  device in `/sys/class/power_supply/`.
- **Precedent:** The file already contains specific quirks for some Elan
  USB devices (e.g., ASUS UX550). This commit generalizes the fix to all
  Elan USB devices, cleaning up the approach.

### 3. Stable Kernel Rules Assessment
- **Fixes a Real Bug:** Yes. It prevents the kernel from exposing false
  hardware information to userspace.
- **Quirks and Workarounds Exception:** This falls strictly under the
  "QUIRKS and WORKAROUNDS" exception category allowed in stable kernels
  ("Hardware-specific quirks for broken/buggy devices").
- **Small and Contained:** The change is surgical—one line of code added
  to a static array. It has no logic complexity or dependencies.
- **Regression Risk:** Extremely Low. It simply disables battery
  reporting for a specific vendor's input devices. Since the battery
  reporting is known to be broken (always 0% or 1%), ignoring it
  restores correct behavior.
- **Mainline Status:** Reviewed by maintainers and tested by the
  reporter.

### 4. Conclusion
This commit is an ideal candidate for backporting. It is a one-line
hardware quirk that fixes a user-visible annoyance (fake battery
devices). It follows a pattern already established and backported for
I2C devices, ensuring consistency across different bus types for the
same hardware vendor.

**YES**

 drivers/hid/hid-input.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/hid-input.c b/drivers/hid/hid-input.c
index 2c743e35c1d33..bc7de9ef45ecd 100644
--- a/drivers/hid/hid-input.c
+++ b/drivers/hid/hid-input.c
@@ -386,10 +386,11 @@ static const struct hid_device_id hid_battery_quirks[] = {
 	{ HID_I2C_DEVICE(USB_VENDOR_ID_ELAN, I2C_DEVICE_ID_CHROMEBOOK_TROGDOR_POMPOM),
 	  HID_BATTERY_QUIRK_AVOID_QUERY },
 	/*
-	 * Elan I2C-HID touchscreens seem to all report a non present battery,
-	 * set HID_BATTERY_QUIRK_IGNORE for all Elan I2C-HID devices.
+	 * Elan HID touchscreens seem to all report a non present battery,
+	 * set HID_BATTERY_QUIRK_IGNORE for all Elan I2C and USB HID devices.
 	 */
 	{ HID_I2C_DEVICE(USB_VENDOR_ID_ELAN, HID_ANY_ID), HID_BATTERY_QUIRK_IGNORE },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_ELAN, HID_ANY_ID), HID_BATTERY_QUIRK_IGNORE },
 	{}
 };
 
-- 
2.51.0


