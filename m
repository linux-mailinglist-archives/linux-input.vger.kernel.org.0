Return-Path: <linux-input+bounces-13025-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F3A9AE71DD
	for <lists+linux-input@lfdr.de>; Tue, 24 Jun 2025 23:59:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C95981BC348F
	for <lists+linux-input@lfdr.de>; Tue, 24 Jun 2025 21:59:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B1BB25CC47;
	Tue, 24 Jun 2025 21:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="VsPLH/VH"
X-Original-To: linux-input@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7447525C833;
	Tue, 24 Jun 2025 21:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750802277; cv=none; b=XIn1/VSV9Kng4QGFjjnqskPQDUwmRoeSucle4tRx52Mvrlsh+p2YupXdG0bGaRiis2zIB+P3QwvX1LTtnV6s69BmGsBSsbsh5F8hFT6R385MSNSfNEbqScJVjVTC+uNTGb/CRYcgbVKZARo5feTuC5UYmX0uISbFmWEQt3ZPnnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750802277; c=relaxed/simple;
	bh=+Nq8QvxiiM0z/jCFD7dd5apxwTE/d/R9ARpw1ox214o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kvwevN/g3UiboIRTiWFoN0INcECPI6ic2n2OZ4sE11xgJ/xnRGv6RDZzR5R1OBwJcZNhsTH9vAcLBV2YnOEc1WdyXu7TfhI60lomSu3gtRAFFC4Ah6S/hQrkZDrs5l2hUK7NjeO2ugrtDkcdOxqV2OJ4Z1UpXNbhQ8it9mL8GuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=VsPLH/VH; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1750802273;
	bh=+Nq8QvxiiM0z/jCFD7dd5apxwTE/d/R9ARpw1ox214o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=VsPLH/VHYwMk6hc+i2rbG2bRKzBg+u7pNwb6Hd7iGswuS5P/UxkwxvtcsT2/E9yo5
	 u8wLeZhQ9RBjdU/PZkddh6ki+LdSznHWAKAtCARIlhwrqBN0HRN0CVkhNuSelQJO3O
	 mqKmzcfxqCZSkaSgPB6tleyiSL2TNOo1xc8dfEINQZRVUxAgO5l9pKvK08w+oYXSRr
	 dNSUYk6RRQXcFQSYkbqsBSy3bkRfxi0lEVEmalaSO1tebvlAsX33s0VufiytagcigD
	 rhJAGRT3YKe+NIK32BXKP8nAsPpL92jCC7X71fwPppxAwsoDmgkhIjGPEddTYiI5E1
	 5ZIrFSDO0lV+g==
Received: from localhost (unknown [212.93.144.165])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id 83D4917E0CE6;
	Tue, 24 Jun 2025 23:57:53 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Wed, 25 Jun 2025 00:56:53 +0300
Subject: [PATCH v2 09/11] HID: playstation: Redefine DualSense input report
 status field
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-dualsense-hid-jack-v2-9-596c0db14128@collabora.com>
References: <20250625-dualsense-hid-jack-v2-0-596c0db14128@collabora.com>
In-Reply-To: <20250625-dualsense-hid-jack-v2-0-596c0db14128@collabora.com>
To: Roderick Colenbrander <roderick.colenbrander@sony.com>, 
 Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
 Henrik Rydberg <rydberg@bitmath.org>
Cc: kernel@collabora.com, linux-input@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2

The 'status' member of struct dualsense_input_report is currently used
to store just the battery data, despite the fact that hardware is
capable to report two extra bytes of status information.

In preparation to make use of some of the additional data, redefine the
field type as a 3-byte array.

Moreover, to preserve consistency with the related DS_STATUS[0..2]_*
registers in datasheet, rename DS_STATUS_* bitfield macros accordingly.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/hid/hid-playstation.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/hid/hid-playstation.c b/drivers/hid/hid-playstation.c
index 6e3132418f2ef88f49d7ea55eb1f52ddf53680c1..f523ca989a2f1d085a460c4e05db00599d19492d 100644
--- a/drivers/hid/hid-playstation.c
+++ b/drivers/hid/hid-playstation.c
@@ -112,9 +112,9 @@ struct ps_led_info {
 #define DS_BUTTONS2_TOUCHPAD	BIT(1)
 #define DS_BUTTONS2_MIC_MUTE	BIT(2)
 
-/* Status field of DualSense input report. */
-#define DS_STATUS_BATTERY_CAPACITY		GENMASK(3, 0)
-#define DS_STATUS_CHARGING			GENMASK(7, 4)
+/* Battery status field of DualSense input report. */
+#define DS_STATUS0_BATTERY_CAPACITY		GENMASK(3, 0)
+#define DS_STATUS0_CHARGING			GENMASK(7, 4)
 
 /* Feature version from DualSense Firmware Info report. */
 #define DS_FEATURE_VERSION_MINOR		GENMASK(7, 0)
@@ -235,8 +235,8 @@ struct dualsense_input_report {
 	struct dualsense_touch_point points[2];
 
 	u8 reserved3[12];
-	u8 status;
-	u8 reserved4[10];
+	u8 status[3];
+	u8 reserved4[8];
 } __packed;
 /* Common input report size shared equals the size of the USB report minus 1 byte for ReportID. */
 static_assert(sizeof(struct dualsense_input_report) == DS_INPUT_REPORT_USB_SIZE - 1);
@@ -1461,8 +1461,8 @@ static int dualsense_parse_report(struct ps_device *ps_dev, struct hid_report *r
 	input_report_key(ds->touchpad, BTN_LEFT, ds_report->buttons[2] & DS_BUTTONS2_TOUCHPAD);
 	input_sync(ds->touchpad);
 
-	battery_data = FIELD_GET(DS_STATUS_BATTERY_CAPACITY, ds_report->status);
-	charging_status = FIELD_GET(DS_STATUS_CHARGING, ds_report->status);
+	battery_data = FIELD_GET(DS_STATUS0_BATTERY_CAPACITY, ds_report->status[0]);
+	charging_status = FIELD_GET(DS_STATUS0_CHARGING, ds_report->status[0]);
 
 	switch (charging_status) {
 	case 0x0:

-- 
2.49.0


