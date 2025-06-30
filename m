Return-Path: <linux-input+bounces-13262-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 61743AEE93A
	for <lists+linux-input@lfdr.de>; Mon, 30 Jun 2025 23:03:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C8CDF16319D
	for <lists+linux-input@lfdr.de>; Mon, 30 Jun 2025 21:03:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2126723B60F;
	Mon, 30 Jun 2025 21:02:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M1l6aq2C"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB9CE21FF54;
	Mon, 30 Jun 2025 21:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751317339; cv=none; b=rKOglpBgutB/EAChf4iusxjwQ3dd5m2JFoOuMGVXO0dssYLluc5rByNdlIKjKYL88ha0wcyBT8JI8dykuZrpLsHGK4BBGPL9zC+gDGD6J8i+O6h1Zdvt0YOeQEcFhiaE7Wa49+O2xq63ErPil84gyuHI2/Vr8guokken3a3jW2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751317339; c=relaxed/simple;
	bh=Pteb8WO49RhPI3z4r4LGQMVUd/FJWOL7xjfwJ4cEK7Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NgGuJndGM9B9mT7nRGlVAoqZFNSbPyqGLiLwgAXVoTkA8wcn+vECr6Ug5PwGNkw2BdW/8Jz8s/8zzG+ttquhZer/hDPGgxB9ASgr7NNJsj1mwWu4DrqGD9vSCc5kwwIPn3wd3xDXw6FJeOYKPRQXYml1aJEYH8H5wL6ZuswgZ14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M1l6aq2C; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0166C4CEE3;
	Mon, 30 Jun 2025 21:02:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751317338;
	bh=Pteb8WO49RhPI3z4r4LGQMVUd/FJWOL7xjfwJ4cEK7Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=M1l6aq2CSBt/6oVK1gYUXLYEFIRcLDMxQI9MV9CoWj7QVbGwkgoGyQZSH7cQZBoia
	 mTLZpaZWFZQVgNBEuWek2wrOWKiCQUg6MHPTXrgs2gWbwn2Uxyryf3+NxnTaLJQsLy
	 d7OFiVJ/qjoinU+9TSmOnFsTWSbCzmeoikIMKdzBVB89opw7gto52xtykvyGQHR/6o
	 4/9EbAGaqMsc2sfckmEcsLU+dJiGQDiMeyEt3d8p8pc+csGaHQWNvaGnAj4zqEnmU5
	 7asKhRn8K8HXjzgsF4z5zlQ0HgkSLgDxXlsJ3D4GV/2fKlrf76krM0Ti8EJ6RU4WAL
	 7bHSPuUwLWdgA==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: "Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>,
	Jiri Kosina <jkosina@suse.com>,
	Sasha Levin <sashal@kernel.org>,
	jikos@kernel.org,
	bentiss@kernel.org,
	linux-input@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 6/6] HID: quirks: Add quirk for 2 Chicony Electronics HP 5MP Cameras
Date: Mon, 30 Jun 2025 17:02:03 -0400
Message-Id: <20250630210203.1359628-6-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250630210203.1359628-1-sashal@kernel.org>
References: <20250630210203.1359628-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.10.239
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
index 981ff6b233a40..8bfa90e37ea17 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -278,6 +278,8 @@
 #define USB_DEVICE_ID_ASUS_AK1D		0x1125
 #define USB_DEVICE_ID_CHICONY_TOSHIBA_WT10A	0x1408
 #define USB_DEVICE_ID_CHICONY_ACER_SWITCH12	0x1421
+#define USB_DEVICE_ID_CHICONY_HP_5MP_CAMERA	0xb824
+#define USB_DEVICE_ID_CHICONY_HP_5MP_CAMERA2	0xb82c
 
 #define USB_VENDOR_ID_CHUNGHWAT		0x2247
 #define USB_DEVICE_ID_CHUNGHWAT_MULTITOUCH	0x0001
diff --git a/drivers/hid/hid-quirks.c b/drivers/hid/hid-quirks.c
index 423d18a77b9e8..9c1c65612adb7 100644
--- a/drivers/hid/hid-quirks.c
+++ b/drivers/hid/hid-quirks.c
@@ -726,6 +726,8 @@ static const struct hid_device_id hid_ignore_list[] = {
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


