Return-Path: <linux-input+bounces-4418-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A9B7590CD2D
	for <lists+linux-input@lfdr.de>; Tue, 18 Jun 2024 15:07:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BAA87283956
	for <lists+linux-input@lfdr.de>; Tue, 18 Jun 2024 13:07:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1E1E1AB91E;
	Tue, 18 Jun 2024 12:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mGL7EvW/"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 784281AB8ED;
	Tue, 18 Jun 2024 12:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718714479; cv=none; b=qPLA4cPW3RawIKNUvWO1GjX1efMAXqbyjabqL5GwFFiR+fm5ff20Ph5Izi/rHfQb7LxQQomaEurXhbLqz51J6lgeImu8qKQULLYE6JGun4U+/k4qFIGXBMeW7ctfeSHiG8i47TH4EmFP7l5n5t21PGFY23VePqNXtBCGA7vhNW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718714479; c=relaxed/simple;
	bh=vYfswvJzrtsRWRx3NsAYResCsxzDI1JtjJfaKrt5xvc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Bk90vop7X3GZK7cBG2tjm5DPUwU6cPpCVYG3A6CDa+QC+klxMVLBLuKYTAg1dC7YC4ZPyuoK5j7V7qaUNXpaUJ1bvQJSr6W1lLxPojxqi6VSqAfyB3DalJmKYK+D8Ho3qt/ofL0Eg5ztJbJjHiV9kUZkarmwAG+B8/XpFFbZq/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mGL7EvW/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F724C4AF1D;
	Tue, 18 Jun 2024 12:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718714479;
	bh=vYfswvJzrtsRWRx3NsAYResCsxzDI1JtjJfaKrt5xvc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mGL7EvW/cXy+gblvvE+TjfTTiGuw/c4aHMbjRNgAp9D78giiy4rs1t6DhWGpjsDo9
	 eyAaNLSTG8f7vO6uyYebUcJHtTYwGcBW5zkqcKlLeQBaoIzfvHMJBnjFnD0DzFi6fL
	 jFMRf+lG/Az39uiepP3BxZpSLpto9+yw/Fc0HMzezY3cXyHC4A8IRErEwqItsXRLxA
	 jmXqmCQg8vOcjZy2bxevxsXHFnKPyhJLnMmmHFzlymO1GIlHiOh9vUg3CvORCl29g1
	 xZF9fJl+g1dD4Q7Js1zEbpOYNsIdpw3MPzTaC5lxaCHQbyz7ebbP61KpaORHzLCejQ
	 PcvUzSqYu6uGA==
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
Date: Tue, 18 Jun 2024 08:39:55 -0400
Message-ID: <20240618124018.3303162-29-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240618124018.3303162-1-sashal@kernel.org>
References: <20240618124018.3303162-1-sashal@kernel.org>
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


