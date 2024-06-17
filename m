Return-Path: <linux-input+bounces-4389-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 87E8C90B0C8
	for <lists+linux-input@lfdr.de>; Mon, 17 Jun 2024 16:03:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2DCFC1F23A38
	for <lists+linux-input@lfdr.de>; Mon, 17 Jun 2024 14:03:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8475B18D0B4;
	Mon, 17 Jun 2024 13:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AUKLxZqY"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B34D18D0B0;
	Mon, 17 Jun 2024 13:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718630757; cv=none; b=kbowroamVKJw6N0+Jey5nBow/qLqh+0jdXCy9wFHlColUB4wI8e7aqd+90kHqqi7BTIHsda7HoeUWv3d7LxtwZHYaoftBY6yF10bQQUK+tYlZIlXm02YrrkqykhFO3m8FrIUurGVZKoDwgtOP9tTRVx7dvz3PkiOR0OyFOWlFHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718630757; c=relaxed/simple;
	bh=vYfswvJzrtsRWRx3NsAYResCsxzDI1JtjJfaKrt5xvc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Nm5qWJYKSAPhHVi+wDQgCr7esORd+Hl94Zz3uvDQ+OdmnVFuMMcEaZO56y3NrogI9koRnEDI+tCeBxak9d4l2sF5m1Ngg/w8+XZMRe9/XrWFbxvFcMc1NjiLAAEcL3SZpyM8eGLl928LuCoPtcnujN45/2HRu9ONXqxvhgD+HGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AUKLxZqY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 565DBC4AF49;
	Mon, 17 Jun 2024 13:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718630757;
	bh=vYfswvJzrtsRWRx3NsAYResCsxzDI1JtjJfaKrt5xvc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AUKLxZqYcEYI437FNDy6de+KR/Ph3iDh/34dxNyLCDMLAVcTv10Y8JfTFAZk+c+Se
	 no4J+g+Kd2uF2IIe87ANmvuNrFIFqajHF4SkCoRbFTw7pX4LKzPKwGN0o/LF7uZWmB
	 TDSkjmcjdS5VQdIrV8ktUT9knRdKeKKvCa46RVXhpxaPGShZRDBOY396yxYTgK9ZDj
	 1JIP6kesIhvvV9WqKGrDB6m+lL/6YMZSUsS7vTX3Lan885PfFNADvY10Y2pjXYwoa8
	 P1r2KWuFTXjQ8cu2RC+wxKWUjoFv6rqFojBFldPLWYOkvJxd45RN4oHst0J2BFzORt
	 NzreT0xpuB3aQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Louis Dalibard <ontake@ontake.dev>,
	Jiri Kosina <jkosina@suse.com>,
	Sasha Levin <sashal@kernel.org>,
	jikos@kernel.org,
	bentiss@kernel.org,
	linux-input@vger.kernel.org
Subject: [PATCH AUTOSEL 6.1 29/29] HID: Ignore battery for ELAN touchscreens 2F2C and 4116
Date: Mon, 17 Jun 2024 09:24:33 -0400
Message-ID: <20240617132456.2588952-29-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240617132456.2588952-1-sashal@kernel.org>
References: <20240617132456.2588952-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.94
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
index 405d88b08908d..4b8c1d18c21e0 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -417,6 +417,8 @@
 #define I2C_DEVICE_ID_HP_SPECTRE_X360_13_AW0020NG  0x29DF
 #define I2C_DEVICE_ID_ASUS_TP420IA_TOUCHSCREEN 0x2BC8
 #define I2C_DEVICE_ID_ASUS_GV301RA_TOUCHSCREEN 0x2C82
+#define I2C_DEVICE_ID_ASUS_UX3402_TOUCHSCREEN 0x2F2C
+#define I2C_DEVICE_ID_ASUS_UX6404_TOUCHSCREEN 0x4116
 #define USB_DEVICE_ID_ASUS_UX550VE_TOUCHSCREEN	0x2544
 #define USB_DEVICE_ID_ASUS_UX550_TOUCHSCREEN	0x2706
 #define I2C_DEVICE_ID_SURFACE_GO_TOUCHSCREEN	0x261A
diff --git a/drivers/hid/hid-input.c b/drivers/hid/hid-input.c
index 4ba5df3c1e039..b0091819fd58a 100644
--- a/drivers/hid/hid-input.c
+++ b/drivers/hid/hid-input.c
@@ -374,6 +374,10 @@ static const struct hid_device_id hid_battery_quirks[] = {
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


