Return-Path: <linux-input+bounces-4383-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3737E90AF99
	for <lists+linux-input@lfdr.de>; Mon, 17 Jun 2024 15:39:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B4F54293CE0
	for <lists+linux-input@lfdr.de>; Mon, 17 Jun 2024 13:39:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3972E1B4C40;
	Mon, 17 Jun 2024 13:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D8M6F+k7"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10F2C1B4C3C;
	Mon, 17 Jun 2024 13:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718630550; cv=none; b=F6Lgr+Kst7w/VCRN4XTajiEuPfFFb3UIG9+DWkZqxQa1HIVYag06O5Xr7+biWAllmxNX4jAjUGh6NPM6Bzix/U7nXe8KmSI94ukpOCpknACFgyi2iUI3vZXEQ4g3QdQR2sMl6lzk4MR1swWgRPDLSfOQdPZO9cSCE8yb7KkoYy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718630550; c=relaxed/simple;
	bh=WU/ecu/cqXf8TbX521ocAfNCVNpp0ahcPYQQV8HphKA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rzRKDtkT00rys8vBly3kM0WF2eeYQ0rX5Z9Kcq3RWe+3HraTaQZ6INVJ3CGk44y5wyBdztwpRyupJmYuNutXZdhxFXL5tLnT0nOtnu0t0IeP37IJjLXTJlI/zbyHgg5zgD2HrOr9GPdS3ECKYA4WUOrISzQWrf7ZMrqX7JVsK0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D8M6F+k7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06FD5C2BD10;
	Mon, 17 Jun 2024 13:22:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718630549;
	bh=WU/ecu/cqXf8TbX521ocAfNCVNpp0ahcPYQQV8HphKA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=D8M6F+k7UmvXSsZE+ar/JIQFeEb2ZbroeS8DkTVWUuAz39gTWuQ00bz5xIB+b2+2t
	 iZ0kGc2qY7iZ5so8IzBWo1LRWg0fSp6tYEI429SGtENDOd8HE7NFvzVDxOU4iDYOX3
	 /sXn/NZoPgr0wE0ogcHmcZiIaLR/WSzxvGsyovuPbDVLa4gePpDJH+QTpZHD20JQhM
	 f2Yc4fBUPBq6VYpCAeJrFID40Ix1ZKA+qnoj1rWdeeXt9ZQFuptUquJstB14AghMXo
	 WCh032mm9wouNOfOLr9UkgALY0HFzylLZevzzikqlP3e0HMS2kXRP9mpugmQRWZUUn
	 DtsYOUps5erMA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Louis Dalibard <ontake@ontake.dev>,
	Jiri Kosina <jkosina@suse.com>,
	Sasha Levin <sashal@kernel.org>,
	jikos@kernel.org,
	bentiss@kernel.org,
	linux-input@vger.kernel.org
Subject: [PATCH AUTOSEL 6.9 44/44] HID: Ignore battery for ELAN touchscreens 2F2C and 4116
Date: Mon, 17 Jun 2024 09:19:57 -0400
Message-ID: <20240617132046.2587008-44-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240617132046.2587008-1-sashal@kernel.org>
References: <20240617132046.2587008-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.9.5
Content-Transfer-Encoding: 8bit

From: Louis Dalibard <ontake@ontake.dev>

[ Upstream commit a3a5a37efba11b7cf1a86abe7bccfbcdb521764e ]

At least ASUS Zenbook 14 (2023) and ASUS Zenbook 14 Pro (2023) are affected.

The touchscreen reports a battery status of 0% and jumps to 1% when a
stylus is used.

The device ID was added and the battery ignore quirk was enabled for it.

[jkosina@suse.com: reformatted changelog a bit]
Signed-off-by: Louis Dalibard <ontake@ontake.dev>
Signed-off-by: Jiri Kosina <jkosina@suse.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/hid/hid-ids.h   | 2 ++
 drivers/hid/hid-input.c | 4 ++++
 2 files changed, 6 insertions(+)

diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index 8376fb5e2d0b4..005239dbd7f18 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -421,6 +421,8 @@
 #define I2C_DEVICE_ID_HP_SPECTRE_X360_13_AW0020NG  0x29DF
 #define I2C_DEVICE_ID_ASUS_TP420IA_TOUCHSCREEN 0x2BC8
 #define I2C_DEVICE_ID_ASUS_GV301RA_TOUCHSCREEN 0x2C82
+#define I2C_DEVICE_ID_ASUS_UX3402_TOUCHSCREEN 0x2F2C
+#define I2C_DEVICE_ID_ASUS_UX6404_TOUCHSCREEN 0x4116
 #define USB_DEVICE_ID_ASUS_UX550VE_TOUCHSCREEN	0x2544
 #define USB_DEVICE_ID_ASUS_UX550_TOUCHSCREEN	0x2706
 #define I2C_DEVICE_ID_SURFACE_GO_TOUCHSCREEN	0x261A
diff --git a/drivers/hid/hid-input.c b/drivers/hid/hid-input.c
index 8bb16e9b94aa5..c9094a4f281e9 100644
--- a/drivers/hid/hid-input.c
+++ b/drivers/hid/hid-input.c
@@ -377,6 +377,10 @@ static const struct hid_device_id hid_battery_quirks[] = {
 	  HID_BATTERY_QUIRK_IGNORE },
 	{ HID_I2C_DEVICE(USB_VENDOR_ID_ELAN, I2C_DEVICE_ID_ASUS_GV301RA_TOUCHSCREEN),
 	  HID_BATTERY_QUIRK_IGNORE },
+	{ HID_I2C_DEVICE(USB_VENDOR_ID_ELAN, I2C_DEVICE_ID_ASUS_UX3402_TOUCHSCREEN),
+	  HID_BATTERY_QUIRK_IGNORE },
+	{ HID_I2C_DEVICE(USB_VENDOR_ID_ELAN, I2C_DEVICE_ID_ASUS_UX6404_TOUCHSCREEN),
+	  HID_BATTERY_QUIRK_IGNORE },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_ELAN, USB_DEVICE_ID_ASUS_UX550_TOUCHSCREEN),
 	  HID_BATTERY_QUIRK_IGNORE },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_ELAN, USB_DEVICE_ID_ASUS_UX550VE_TOUCHSCREEN),
-- 
2.43.0


