Return-Path: <linux-input+bounces-13250-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 22665AEE8F3
	for <lists+linux-input@lfdr.de>; Mon, 30 Jun 2025 23:01:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 11E853E1198
	for <lists+linux-input@lfdr.de>; Mon, 30 Jun 2025 21:00:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87F8228C03B;
	Mon, 30 Jun 2025 21:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XZrrItNd"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B7B52629D;
	Mon, 30 Jun 2025 21:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751317233; cv=none; b=LR26kRNrBQmtHYLqaqQtTqq0o4aEQ0csJgxk3pGT8IZxMbfPx8IeuUgf6QwqFB/AuiWAEPUVqjjwxlaIgUH92V/+kwPvxFp6hltiTO/0z3yTnabdBCV14Ao/+mf5WmOWcn8pDBvcgV0xvhgcnzLtY6jd52zj2TDBFmXWu2fa5F0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751317233; c=relaxed/simple;
	bh=B97IWGxg/JQU5FE4d7xL/AfOWZdAnB4L1dQtpswmkIc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=VIhSe05ZNz1FpPqd+IdnjBtODPizFsneriME2UXYm5k/Y7nyoGUyungOrKgUk+zlqaeFmUmy6Mo4AyTUwhGUTFQyw80PvGNveLBLSAnsq7UsCHrslb3DIthMvuXCeRfgMor/NNHjKLhqS3g5zQ8zyM/54Bvmi44TfztCEYOLLYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XZrrItNd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A982C4CEEF;
	Mon, 30 Jun 2025 21:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751317233;
	bh=B97IWGxg/JQU5FE4d7xL/AfOWZdAnB4L1dQtpswmkIc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XZrrItNdNJGlW2MQm4oTYYZRAE17eExYhOxHgiWYCPEjPWvU1N7A7Wb38DWosx0de
	 arU0xpIYwLRMNftUT9p8tPVnlRrbHxIfUCcnNYkXNwLl3YS9JSJVdbNQjJTdms5fRm
	 BdQ8FNSuSB8SaYJ7YAjg2ot8HSwAU6HXyepwp6gn3FCrt/D/wuupmB5s3DCvrlCb7X
	 WzkxFR4IZ4acnnhlFqtJVxyi+JqmngJkCSkdATbTOEa6hXdKrdxxuTrx0zOZY8Ymvc
	 HaUv/3P1n73kJIJ0BqLB29ewxLFEb4u1yYDjZO/j4iwEPobXmn8Ds+Z09e6o80bM6F
	 rbdvZxrjNuIxQ==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: "Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>,
	Jiri Kosina <jkosina@suse.com>,
	Sasha Levin <sashal@kernel.org>,
	jikos@kernel.org,
	bentiss@kernel.org,
	linux-input@vger.kernel.org
Subject: [PATCH AUTOSEL 6.12 20/21] HID: quirks: Add quirk for 2 Chicony Electronics HP 5MP Cameras
Date: Mon, 30 Jun 2025 16:45:35 -0400
Message-Id: <20250630204536.1358327-20-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250630204536.1358327-1-sashal@kernel.org>
References: <20250630204536.1358327-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.35
Content-Transfer-Encoding: 8bit

From: "Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>

[ Upstream commit 54bae4c17c11688339eb73a04fd24203bb6e7494 ]

The Chicony Electronics HP 5MP Cameras (USB ID 04F2:B824 & 04F2:B82C)
report a HID sensor interface that is not actually implemented.
Attempting to access this non-functional sensor via iio_info causes
system hangs as runtime PM tries to wake up an unresponsive sensor.

Add these 2 devices to the HID ignore list since the sensor interface is
non-functional by design and should not be exposed to userspace.

Signed-off-by: Chia-Lin Kao (AceLan) <acelan.kao@canonical.com>
Signed-off-by: Jiri Kosina <jkosina@suse.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

**YES**

This commit should be backported to stable kernel trees. Here's my
extensive analysis:

## Key Characteristics of This Commit:

1. **Fixes a Critical User-Facing Bug**: The commit addresses system
   hangs that occur when userspace attempts to access non-functional HID
   sensor interfaces through iio_info. This is a serious usability issue
   that can make the system unresponsive.

2. **Minimal and Contained Changes**: The patch only adds two device IDs
   to existing infrastructure:
   - In `drivers/hid/hid-ids.h`: Added
     `USB_DEVICE_ID_CHICONY_HP_5MP_CAMERA` (0xb824) and
     `USB_DEVICE_ID_CHICONY_HP_5MP_CAMERA2` (0xb82c)
   - In `drivers/hid/hid-quirks.c`: Added these two devices to the
     `hid_ignore_list[]` array

3. **Zero Risk of Regression**: The changes only affect the specific USB
   devices (04F2:B824 and 04F2:B82C). No existing functionality is
   modified, and no code logic is changed.

## Comparison with Similar Commits:

This commit is nearly identical to **Similar Commit #1** (which was
backported), where a QUANTA HP 5MP Camera (0408:5473) was added to the
ignore list for the exact same reason - non-functional sensor causing
system hangs. Both commits:
- Target HP 5MP cameras with non-functional sensors
- Use the same fix approach (adding to HID ignore list)
- Prevent system hangs when accessing the sensor

## Alignment with Stable Kernel Rules:

The commit perfectly aligns with stable tree criteria:
- **Fixes a real bug**: System hangs are critical issues
- **Already in Linus' tree**: Signed-off by Jiri Kosina (HID maintainer)
- **Small change**: Only 4 lines of actual code changes
- **Obviously correct**: Simply adding device IDs to an ignore list
- **No new features**: Pure bugfix
- **Hardware-specific**: Only affects users with these specific cameras

## Historical Precedent:

Looking at the provided similar commits:
- 4 out of 5 hardware quirk commits were backported (80% backport rate)
- All commits fixing system hangs or device disconnections were
  backported
- The only non-backported commit (#4) involved architectural changes to
  enum handling

This commit follows the exact pattern of successfully backported
hardware quirks, making it an excellent candidate for stable inclusion.

 drivers/hid/hid-ids.h    | 2 ++
 drivers/hid/hid-quirks.c | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index de6bab6a7394b..b472140421f5a 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -311,6 +311,8 @@
 #define USB_DEVICE_ID_ASUS_AK1D		0x1125
 #define USB_DEVICE_ID_CHICONY_TOSHIBA_WT10A	0x1408
 #define USB_DEVICE_ID_CHICONY_ACER_SWITCH12	0x1421
+#define USB_DEVICE_ID_CHICONY_HP_5MP_CAMERA	0xb824
+#define USB_DEVICE_ID_CHICONY_HP_5MP_CAMERA2	0xb82c
 
 #define USB_VENDOR_ID_CHUNGHWAT		0x2247
 #define USB_DEVICE_ID_CHUNGHWAT_MULTITOUCH	0x0001
diff --git a/drivers/hid/hid-quirks.c b/drivers/hid/hid-quirks.c
index e4d80307b898c..80372342c176a 100644
--- a/drivers/hid/hid-quirks.c
+++ b/drivers/hid/hid-quirks.c
@@ -747,6 +747,8 @@ static const struct hid_device_id hid_ignore_list[] = {
 	{ HID_USB_DEVICE(USB_VENDOR_ID_AVERMEDIA, USB_DEVICE_ID_AVER_FM_MR800) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_AXENTIA, USB_DEVICE_ID_AXENTIA_FM_RADIO) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_BERKSHIRE, USB_DEVICE_ID_BERKSHIRE_PCWD) },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_CHICONY, USB_DEVICE_ID_CHICONY_HP_5MP_CAMERA) },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_CHICONY, USB_DEVICE_ID_CHICONY_HP_5MP_CAMERA2) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_CIDC, 0x0103) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_CYGNAL, USB_DEVICE_ID_CYGNAL_RADIO_SI470X) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_CYGNAL, USB_DEVICE_ID_CYGNAL_RADIO_SI4713) },
-- 
2.39.5


