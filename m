Return-Path: <linux-input+bounces-12580-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D650AC3FAA
	for <lists+linux-input@lfdr.de>; Mon, 26 May 2025 14:54:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 603C1168EC8
	for <lists+linux-input@lfdr.de>; Mon, 26 May 2025 12:53:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B099520C47C;
	Mon, 26 May 2025 12:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="l46yFBnn"
X-Original-To: linux-input@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96FE120E00B;
	Mon, 26 May 2025 12:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748263923; cv=none; b=f/OfINEQq5tVbAL5lKYUW/4ovR4hDeEyH59HL7Z+X8YVvNYOQG3QqShPtji4TUiLy0Kiha9o0fXV8RYY2d9c+s5F/onemHEb2al5SvnQgR3Uve9t0wiVYRlwggptQjSRicic/iWgD2y0Eaq6PP0BTFfen9/SUjM3VhoXYoj6+sk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748263923; c=relaxed/simple;
	bh=JvQh6aj3Ce0+yFvN7nZBemOofzaizmNEnnMazorHETw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m6FWTQWL6AugMnQhbYTy7f7kUXaAkthqSTT2fEVGg2B2Z992VNxvJB31mJl+bv3f6rsgJxQQxt1EC9q4x+PcvaBBV7LXfCrs2VBxhzPhuXMT5efCML9FI+5eMZxO+fz068H7BluAXXUlDz10vJAVT6YhBS+8t4FwZub47qx7hC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=l46yFBnn; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1748263919;
	bh=JvQh6aj3Ce0+yFvN7nZBemOofzaizmNEnnMazorHETw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=l46yFBnnlwsP7a5h1aArNZAJyYmTEb5QNq+jLezIwnSPcH1mJbmQhhieNGJYYJ6nQ
	 hbJhaK+TTEaqcyIcmqWcDdbx2BZ4etnavT3V3kgD63NHw3W81EYnp5CQQu5AlLMAwT
	 Z1dLFQXHjxoCZVXovMk9eXlUu1oehSgg6nr0OpmWbqDal386ciiHMev05m3R3rJYVr
	 SThFIcAaTd7LQXFNtYa2MqPk9F5r7R835UboiVuR4QZihxlx/hu+HEFijcVRbMXYXv
	 lBM4MG2p7JU6S9ionvpQauGfTWgTnypYpUpeug9GnwDagBpOVIpUrq7SmohnMsV3Rz
	 GPMgnlj+tgagw==
Received: from localhost (unknown [82.76.59.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id A42DC17E36C0;
	Mon, 26 May 2025 14:51:59 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Mon, 26 May 2025 15:51:32 +0300
Subject: [PATCH 09/11] HID: playstation: Rename DualSense input report
 status field
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250526-dualsense-hid-jack-v1-9-a65fee4a60cc@collabora.com>
References: <20250526-dualsense-hid-jack-v1-0-a65fee4a60cc@collabora.com>
In-Reply-To: <20250526-dualsense-hid-jack-v1-0-a65fee4a60cc@collabora.com>
To: Roderick Colenbrander <roderick.colenbrander@sony.com>, 
 Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
 Henrik Rydberg <rydberg@bitmath.org>
Cc: kernel@collabora.com, linux-input@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2

The name of the 'status' member of struct dualsense_input_report is too
generic, since it is only used to provide battery data.

In preparation to support handling additional (non-battery) status
information and avoid ambiguity, rename the field to status_battery.
For consistency, also rename the related DS_STATUS_* bitfield macros.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/hid/hid-playstation.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/hid/hid-playstation.c b/drivers/hid/hid-playstation.c
index 937b14679c8b17c5d3d245eae1cc4e0e56dadb71..b7777d3230b2fe277a4a2217ef6b1eff9cfad182 100644
--- a/drivers/hid/hid-playstation.c
+++ b/drivers/hid/hid-playstation.c
@@ -112,10 +112,10 @@ struct ps_led_info {
 #define DS_BUTTONS2_TOUCHPAD	BIT(1)
 #define DS_BUTTONS2_MIC_MUTE	BIT(2)
 
-/* Status field of DualSense input report. */
-#define DS_STATUS_BATTERY_CAPACITY	GENMASK(3, 0)
-#define DS_STATUS_CHARGING		GENMASK(7, 4)
-#define DS_STATUS_CHARGING_SHIFT	4
+/* Battery status field of DualSense input report. */
+#define DS_STATUS_BATTERY_CAPACITY		GENMASK(3, 0)
+#define DS_STATUS_BATTERY_CHARGING		GENMASK(7, 4)
+#define DS_STATUS_BATTERY_CHARGING_SHIFT	4
 
 /* Feature version from DualSense Firmware Info report. */
 #define DS_FEATURE_VERSION_MINOR		GENMASK(7, 0)
@@ -236,7 +236,7 @@ struct dualsense_input_report {
 	struct dualsense_touch_point points[2];
 
 	u8 reserved3[12];
-	u8 status;
+	u8 status_battery;
 	u8 reserved4[10];
 } __packed;
 /* Common input report size shared equals the size of the USB report minus 1 byte for ReportID. */
@@ -1462,8 +1462,9 @@ static int dualsense_parse_report(struct ps_device *ps_dev, struct hid_report *r
 	input_report_key(ds->touchpad, BTN_LEFT, ds_report->buttons[2] & DS_BUTTONS2_TOUCHPAD);
 	input_sync(ds->touchpad);
 
-	battery_data = ds_report->status & DS_STATUS_BATTERY_CAPACITY;
-	charging_status = (ds_report->status & DS_STATUS_CHARGING) >> DS_STATUS_CHARGING_SHIFT;
+	battery_data = ds_report->status_battery & DS_STATUS_BATTERY_CAPACITY;
+	charging_status = ds_report->status_battery & DS_STATUS_BATTERY_CHARGING;
+	charging_status >>= DS_STATUS_BATTERY_CHARGING_SHIFT;
 
 	switch (charging_status) {
 	case 0x0:

-- 
2.49.0


