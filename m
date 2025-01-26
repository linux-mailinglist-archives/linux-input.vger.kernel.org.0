Return-Path: <linux-input+bounces-9560-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D4DE8A1CAD9
	for <lists+linux-input@lfdr.de>; Sun, 26 Jan 2025 16:34:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B4E8E16BF3D
	for <lists+linux-input@lfdr.de>; Sun, 26 Jan 2025 15:30:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A52320A5FD;
	Sun, 26 Jan 2025 15:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RficdVuJ"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EBDC20A5F7;
	Sun, 26 Jan 2025 15:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737903741; cv=none; b=HnD7x4jzEaRqsntFla20smg1SBFVEixI7rGBFmTyJWSt3zA+bom4ZuMz++nuBqXN8j2dgsxJyShhrFJqsXkg2gn1MEAR4Mfk2h6R41oVlmIrm2OrXg/0TX9JkNKNpTZiR34sJM0AqTOtNibfkvwVTZYfXqQ03Xw+aGFeDd1m6VQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737903741; c=relaxed/simple;
	bh=BgkFshUpKX9IO04DXhQAA91+AN5nl9Dj85GOB2S4Zh4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sbeua0VOPVtMAEWvO+/ikFCitVWqAe082tx4huif/UKhAfFclmTtosOfjl+BVYojCaYO8stl6QaBoR0/EsAN3g4Bi49gnQ6iHhaBNyOARrumS/xRZiNtaIP1BO8Z4811O1xQl0teKD8nnBQEPoYw4oFS9lw1LDqP6qdF6Ndeums=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RficdVuJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EEA3C4CEE2;
	Sun, 26 Jan 2025 15:02:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737903740;
	bh=BgkFshUpKX9IO04DXhQAA91+AN5nl9Dj85GOB2S4Zh4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RficdVuJjj22fE8lvFuPTMtLSAu38RmjFXPBd1axMNNF8PXhPi1yefwfVS/34cTlJ
	 ZQQE6COhSt8s76kfQJleKvGUyjwwZFQcKME5bNhn4eWqmNE7N4Q7FBs+U0cjBK0nYg
	 bddF8lqAldc32OzgaoUxCpLDJgNABFx6U/zYrjNEJaaeuVgAMv8kBznYq30z+C13r7
	 jJBaLQrTau0hzAMDFb5LYktAFlwNHzOKjenbfTBryc+FP060uxWG4UKUWxJPOFFVHN
	 GVMskeH/cIdpz/YLKmDOw5pr7t88CyUH5/quozoyJ/iqRywVWmpg9f7Ca8F7Kxjqhd
	 j1fi+2NTu3nxw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Jiri Kosina <jkosina@suse.com>,
	=?UTF-8?q?Ulrich=20M=C3=BCller?= <ulm@gentoo.org>,
	WangYuli <wangyuli@uniontech.com>,
	Sasha Levin <sashal@kernel.org>,
	jikos@kernel.org,
	bentiss@kernel.org,
	linux-input@vger.kernel.org
Subject: [PATCH AUTOSEL 6.12 05/29] Revert "HID: multitouch: Add support for lenovo Y9000P Touchpad"
Date: Sun, 26 Jan 2025 10:01:46 -0500
Message-Id: <20250126150210.955385-5-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250126150210.955385-1-sashal@kernel.org>
References: <20250126150210.955385-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.11
Content-Transfer-Encoding: 8bit

From: Jiri Kosina <jkosina@suse.com>

[ Upstream commit 3d88ba86ba6f35a0467f25a88c38aa5639190d04 ]

This reverts commit 251efae73bd46b097deec4f9986d926813aed744.

Quoting Wang Yuli:

	"The 27C6:01E0 touchpad doesn't require the workaround and applying it
	would actually break functionality.

	The initial report came from a BBS forum, but we suspect the
	information provided by the forum user may be incorrect which could
	happen sometimes. [1]

	Further investigation showed that the Lenovo Y9000P 2024 doesn't even
	use a Goodix touchpad. [2]

	For the broader issue of 27c6:01e0 being unusable on some devices, it
	just need to address it with a libinput quirk.

	In conclusion, we should revert this commit, which is the best
	solution."

Reported-by: Ulrich Müller <ulm@gentoo.org>
Reported-by: WangYuli <wangyuli@uniontech.com>
Link: https://lore.kernel.org/all/uikt4wwpw@gentoo.org/
Signed-off-by: Jiri Kosina <jkosina@suse.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/hid/hid-ids.h        | 1 -
 drivers/hid/hid-multitouch.c | 8 ++------
 2 files changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index 0f23be98c56e2..ceb3b1a72e235 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -506,7 +506,6 @@
 #define USB_DEVICE_ID_GENERAL_TOUCH_WIN8_PIT_E100 0xe100
 
 #define I2C_VENDOR_ID_GOODIX		0x27c6
-#define I2C_DEVICE_ID_GOODIX_01E0	0x01e0
 #define I2C_DEVICE_ID_GOODIX_01E8	0x01e8
 #define I2C_DEVICE_ID_GOODIX_01E9	0x01e9
 #define I2C_DEVICE_ID_GOODIX_01F0	0x01f0
diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
index e936019d21fec..d1b7ccfb3e051 100644
--- a/drivers/hid/hid-multitouch.c
+++ b/drivers/hid/hid-multitouch.c
@@ -1452,8 +1452,7 @@ static const __u8 *mt_report_fixup(struct hid_device *hdev, __u8 *rdesc,
 {
 	if (hdev->vendor == I2C_VENDOR_ID_GOODIX &&
 	    (hdev->product == I2C_DEVICE_ID_GOODIX_01E8 ||
-	     hdev->product == I2C_DEVICE_ID_GOODIX_01E9 ||
-		 hdev->product == I2C_DEVICE_ID_GOODIX_01E0)) {
+	     hdev->product == I2C_DEVICE_ID_GOODIX_01E9)) {
 		if (rdesc[607] == 0x15) {
 			rdesc[607] = 0x25;
 			dev_info(
@@ -2079,10 +2078,7 @@ static const struct hid_device_id mt_devices[] = {
 		     I2C_DEVICE_ID_GOODIX_01E8) },
 	{ .driver_data = MT_CLS_WIN_8_FORCE_MULTI_INPUT_NSMU,
 	  HID_DEVICE(BUS_I2C, HID_GROUP_ANY, I2C_VENDOR_ID_GOODIX,
-		     I2C_DEVICE_ID_GOODIX_01E9) },
-	{ .driver_data = MT_CLS_WIN_8_FORCE_MULTI_INPUT_NSMU,
-	  HID_DEVICE(BUS_I2C, HID_GROUP_ANY, I2C_VENDOR_ID_GOODIX,
-		     I2C_DEVICE_ID_GOODIX_01E0) },
+		     I2C_DEVICE_ID_GOODIX_01E8) },
 
 	/* GoodTouch panels */
 	{ .driver_data = MT_CLS_NSMU,
-- 
2.39.5


