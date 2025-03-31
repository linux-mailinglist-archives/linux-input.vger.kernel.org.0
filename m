Return-Path: <linux-input+bounces-11424-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FD30A76A76
	for <lists+linux-input@lfdr.de>; Mon, 31 Mar 2025 17:31:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A75E13B6432
	for <lists+linux-input@lfdr.de>; Mon, 31 Mar 2025 15:21:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB08F2417EE;
	Mon, 31 Mar 2025 14:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WmDBsWZ/"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B016A221737;
	Mon, 31 Mar 2025 14:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743432982; cv=none; b=ZE8VAjr12KczlRDTroQk/6JU4NMRDYBYxC7MyQSlqiJL8XUPv+HD2u44XcTEkwa+SMspebgM7k4vkRNYz3Rn+6DHTkFA9Xte44fwUT+K97lkzEJdF9JN2cVADWdSYfoKATjEP0CbQT19xG7theiaXqbhsNwS1WdCfPFlXNA1dSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743432982; c=relaxed/simple;
	bh=jBPWRBfB9xZhzpz+X2lRsK4GqtsNkbj/hUN+V/Do9sA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Lq7qeFcLqG6GBVDAoG8Zsb4+auxwumZ1YxiwN5zcl0sVpEY+O3Pdg2d9kxCiKRB1WB7B6VygtyxbDLGVdZhslV6MYeaDpG14VeBxLpsBU3CBSdC9rEH3Qeg2kbFq6+Yb7Ed5ZfaCKHdQiWzeHjuVF4PTErJ9xZMcszP0bZjfpv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WmDBsWZ/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 320ABC4CEE3;
	Mon, 31 Mar 2025 14:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743432982;
	bh=jBPWRBfB9xZhzpz+X2lRsK4GqtsNkbj/hUN+V/Do9sA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WmDBsWZ/GI8BfP7rW08xr3VE5kRpCAclb/OLLi9PZXXRpjyIyn4VgkTYQa7R5yDlC
	 RQbFSl0Ck1bWG6nvdgVqHRctubSGYvumuc96CD6QgvSRQbFQEk1Ez/V645Dq+Mttd7
	 pkHnFmGkWDNfk1e+6dsWX2N54snjPMy70F7AQzpSdBjxvxoIffldFWENqktIvjhWbo
	 mlV91U00ANfrIHDViUwi8iq0ejK771AN8H6QVV/3Bkw3Ts9WlPX6FZvFPVdrnFyIwF
	 /K72ccU5afuI5ncjKYVY7yx5JiJXDZauLUwfgqUkK+3UQ9B/+jFeBZHvNgbPBx8XCj
	 Vues/NOdCtYaQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>,
	=?UTF-8?q?Micha=C5=82=20Kope=C4=87?= <michal@nozomi.space>,
	Paul Dino Jones <paul@spacefreak18.xyz>,
	=?UTF-8?q?Crist=C3=B3ferson=20Bueno?= <cbueno81@gmail.com>,
	Jiri Kosina <jkosina@suse.com>,
	Sasha Levin <sashal@kernel.org>,
	oleg@makarenk.ooo,
	jikos@kernel.org,
	bentiss@kernel.org,
	linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH AUTOSEL 6.6 10/19] HID: pidff: Add PERIODIC_SINE_ONLY quirk
Date: Mon, 31 Mar 2025 10:55:51 -0400
Message-Id: <20250331145601.1705784-10-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250331145601.1705784-1-sashal@kernel.org>
References: <20250331145601.1705784-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.85
Content-Transfer-Encoding: 8bit

From: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>

[ Upstream commit abdbf8764f4962af2a910abb3a213ecf304a73d3 ]

Some devices only support SINE periodic effect although they advertise
support for all PERIODIC effect in their HID descriptor. Some just do
nothing when trying to play such an effect (upload goes fine), some express
undefined behavior like turning to one side.

This quirk forces all the periodic effects to be uploaded as SINE. This is
acceptable as all these effects are similar in nature and are mostly used as
rumble. SINE is the most popular with others seldom used (especially SAW_UP
and SAW_DOWN).

Fixes periodic effects for PXN and LITE STAR wheels

Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
Reviewed-by: Michał Kopeć <michal@nozomi.space>
Reviewed-by: Paul Dino Jones <paul@spacefreak18.xyz>
Tested-by: Cristóferson Bueno <cbueno81@gmail.com>
Signed-off-by: Jiri Kosina <jkosina@suse.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/hid/hid-universal-pidff.c | 15 ++++++++++-----
 drivers/hid/usbhid/hid-pidff.c    |  3 +++
 include/linux/hid.h               |  1 +
 3 files changed, 14 insertions(+), 5 deletions(-)

diff --git a/drivers/hid/hid-universal-pidff.c b/drivers/hid/hid-universal-pidff.c
index 55aad2e4ac1b8..7ef5ab9146b1c 100644
--- a/drivers/hid/hid-universal-pidff.c
+++ b/drivers/hid/hid-universal-pidff.c
@@ -168,11 +168,16 @@ static const struct hid_device_id universal_pidff_devices[] = {
 	{ HID_USB_DEVICE(USB_VENDOR_ID_FFBEAST, USB_DEVICE_ID_FFBEAST_JOYSTICK), },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_FFBEAST, USB_DEVICE_ID_FFBEAST_RUDDER), },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_FFBEAST, USB_DEVICE_ID_FFBEAST_WHEEL) },
-	{ HID_USB_DEVICE(USB_VENDOR_ID_LITE_STAR, USB_DEVICE_ID_PXN_V10) },
-	{ HID_USB_DEVICE(USB_VENDOR_ID_LITE_STAR, USB_DEVICE_ID_PXN_V12) },
-	{ HID_USB_DEVICE(USB_VENDOR_ID_LITE_STAR, USB_DEVICE_ID_PXN_V12_LITE) },
-	{ HID_USB_DEVICE(USB_VENDOR_ID_LITE_STAR, USB_DEVICE_ID_PXN_V12_LITE_2) },
-	{ HID_USB_DEVICE(USB_VENDOR_ID_LITE_STAR, USB_DEVICE_LITE_STAR_GT987_FF) },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_LITE_STAR, USB_DEVICE_ID_PXN_V10),
+		.driver_data = HID_PIDFF_QUIRK_PERIODIC_SINE_ONLY },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_LITE_STAR, USB_DEVICE_ID_PXN_V12),
+		.driver_data = HID_PIDFF_QUIRK_PERIODIC_SINE_ONLY },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_LITE_STAR, USB_DEVICE_ID_PXN_V12_LITE),
+		.driver_data = HID_PIDFF_QUIRK_PERIODIC_SINE_ONLY },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_LITE_STAR, USB_DEVICE_ID_PXN_V12_LITE_2),
+		.driver_data = HID_PIDFF_QUIRK_PERIODIC_SINE_ONLY },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_LITE_STAR, USB_DEVICE_LITE_STAR_GT987_FF),
+		.driver_data = HID_PIDFF_QUIRK_PERIODIC_SINE_ONLY },
 	{ }
 };
 MODULE_DEVICE_TABLE(hid, universal_pidff_devices);
diff --git a/drivers/hid/usbhid/hid-pidff.c b/drivers/hid/usbhid/hid-pidff.c
index a37cf852a2836..4c94d8cbac43a 100644
--- a/drivers/hid/usbhid/hid-pidff.c
+++ b/drivers/hid/usbhid/hid-pidff.c
@@ -637,6 +637,9 @@ static int pidff_upload_effect(struct input_dev *dev, struct ff_effect *effect,
 				return -EINVAL;
 			}
 
+			if (pidff->quirks & HID_PIDFF_QUIRK_PERIODIC_SINE_ONLY)
+				type_id = PID_SINE;
+
 			error = pidff_request_effect_upload(pidff,
 					pidff->type_id[type_id]);
 			if (error)
diff --git a/include/linux/hid.h b/include/linux/hid.h
index e3a55fd4e9fc4..38e161a827bde 100644
--- a/include/linux/hid.h
+++ b/include/linux/hid.h
@@ -1225,6 +1225,7 @@ int hid_pidff_init_with_quirks(struct hid_device *hid, __u32 initial_quirks);
 #define HID_PIDFF_QUIRK_MISSING_PBO		BIT(1)
 #define HID_PIDFF_QUIRK_PERMISSIVE_CONTROL	BIT(2)
 #define HID_PIDFF_QUIRK_FIX_WHEEL_DIRECTION	BIT(3)
+#define HID_PIDFF_QUIRK_PERIODIC_SINE_ONLY	BIT(4)
 
 #define dbg_hid(fmt, ...) pr_debug("%s: " fmt, __FILE__, ##__VA_ARGS__)
 
-- 
2.39.5


