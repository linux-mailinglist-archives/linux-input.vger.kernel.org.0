Return-Path: <linux-input+bounces-9618-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EEE58A225C5
	for <lists+linux-input@lfdr.de>; Wed, 29 Jan 2025 22:30:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 446711672A6
	for <lists+linux-input@lfdr.de>; Wed, 29 Jan 2025 21:30:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE64B1E98F3;
	Wed, 29 Jan 2025 21:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T8JK+4QD"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A99E01E8847;
	Wed, 29 Jan 2025 21:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738186202; cv=none; b=aLFgI5wxtD2a8zM5l8Bv8rgLN9C+/VJ89BDXn4ywWo9/WKIqTBkXg0mBRnExzWV6dzPd2lap694YbcYd2a3OPszeND6JXKNyhPD+cnrLQvd2mm5X5cqANpJStrN/Eb3IfD1c9dLlv5GSOkfoqjpqe41yiphu6Swu+aP72+nqCMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738186202; c=relaxed/simple;
	bh=sbJW1sK/3rVHF21xcyAObiLk/zuUC7xMTo3oRuKRRzc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=p+xG2A3VujApKKUZFWCWwpHCM8BYfqiz3pNr/4bA31Sl7Gfnoe4s+a6rJ1CUkOboiIKgsHRptcVN9hI8+0zPCnQfmQ2YOBBh+SvF9e9i/7PKcZFb3zzYU6dZ52t8ohNU8vcFlMQjI8sLYnttztd0YbhmWafYUnuIT+EYfPypxXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T8JK+4QD; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-53e384d00f4so17554e87.1;
        Wed, 29 Jan 2025 13:30:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738186199; x=1738790999; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VCZldrUp2eoDRDCRmc8u1acPaDa0SUPYKuTn2MkbFJg=;
        b=T8JK+4QDcjYh55OsZfn9IdyZq7JusqaFxaHBsqAc5g03hkxCRzIRa8dPp00IVhOZGm
         2MfKNLJUi5VJffbF4J3yteE3lXoVTFYYzpSxpdl4aKbE4RnWnFEZtp/milzO71QTtoGW
         TIpX5a7TtczjCFzjCGFDbfvap5779qoaeBLzs7pX6YBMo+SnL1NxBXN0XuDyQ+1Pg+Z5
         dN6JVn1nj7EbiQ6lUQtFphp6wTmwep71215ayM5Unkqcrgv/brDesQ/iwbrhjD3/U3o/
         jaRHtlry1vBLBxL782zcTAxttOOhXcEEY6Ty+RvRv6CSgKkF82KTcxfa2gAbAaNPO1PB
         VOBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738186199; x=1738790999;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VCZldrUp2eoDRDCRmc8u1acPaDa0SUPYKuTn2MkbFJg=;
        b=B4wgZA9JJCxz0LWAdv213LKPeWQQbOnzmwcOWHaFgXiXxc4AeNC1udh/qYDsGHlQET
         uNTM3dExKLmuShgHNZDt+U3jeWRfuE7dr6mbHJxOcO/Cn+B1H/0TS6kC9WAcApXyxJTV
         vFmGpNYZigH2mZRj/BkGgGaga1spQB9rawpzs7VfVUxQlmb2bYJOoDXz4EVz1kq/RXc+
         NOZbxTqEwonbA8ZwRiUDlzCnO1unEXgSvNM7qW7Mn/a/sZ7BMfUOfiu6Net5BCRjOMQX
         OQ/T9PYEW6RT1zIyjWuWasFVLqq2jLH81eDMH/geJ8HlQZGc/TR5e4Pa6Cfu8eUW45z7
         Ww+w==
X-Forwarded-Encrypted: i=1; AJvYcCWMrDzRBf1yubbhnvFBvk6EwTaqiANj0nXEOc6Uuv5xl4yUjz5768m+X52OdTEPZBN9Vv5m9aYDHfOBVw==@vger.kernel.org, AJvYcCWrUP2vS5pi4sOU5VOw78n2T+PsGV1+yxXDVOQjVOuLj2XLLonpl+cKO4fbW6ZjIrnxnHV/OABOO0nY@vger.kernel.org
X-Gm-Message-State: AOJu0YyINhzI1j8jgeLUdYv6+mxmlnBigCMDiiTQSB6UFdCQWMgmt1Gu
	yfldh3YHQj0hbcu9oLhZaX8kcVuyhGRmTkZwQebUGSIOXYmgj3AW
X-Gm-Gg: ASbGncuzfAHdp1fz9ox58YkRATQG3+rXdTiYZMqO6fC6N5dyboIaX4Fk9fqk8wgsp/c
	VE1ib7hrr8ExP4X8FErNg+PYSwtP7JDHJpftMhtc+BmZNPapX1IEXzv2+z06yGXQREE52CInbcb
	rLDFrSvyasnNk/BreSpvXlrNnNlTmSySF0EA2QzKlZDij15UT4pdrLPMdNAi4gc4b4uCXhUYB9+
	xGTKApv1ijjzNCQayLuxmAzUtNDEqKrdsMbfQMHOCBTcJ9QULqqpPV68vSqFm5a1z/p8c7o9dOW
	WpU2QzV/zHrOCahCgV9uqBUeP5fDwe4i2tOuZfxSsIrcuHyhB8DAuBMjDW5ctQ==
X-Google-Smtp-Source: AGHT+IG7BSRxf7Vy+7XjdJbwLV0+pdLhuHbNbYtUFHDzgAFFcdSsnaU24IsOHaaXBQ4csmmYfw17gQ==
X-Received: by 2002:a05:6512:b97:b0:53f:8c46:42c8 with SMTP id 2adb3069b0e04-543e4c3a323mr534986e87.13.1738186198458;
        Wed, 29 Jan 2025 13:29:58 -0800 (PST)
Received: from laptok.lan (89-64-31-140.dynamic.chello.pl. [89.64.31.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543c83799c0sm2100778e87.190.2025.01.29.13.29.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 13:29:57 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: anssi.hannula@gmail.com,
	oleg@makarenk.ooo,
	linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v8 13/21] HID: pidff: Completely rework and fix pidff_reset function
Date: Wed, 29 Jan 2025 22:29:27 +0100
Message-ID: <20250129212935.780998-14-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250129212935.780998-1-tomasz.pakula.oficjalny@gmail.com>
References: <20250129212935.780998-1-tomasz.pakula.oficjalny@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Previously, it was assumed that DEVICE_CONTROL usage is always an array
but a lot of devices implements it as a bitmask variable. This led to
the pidff_reset function not working and causing errors in such cases.

Selectors can come in three types. One selection of a set, N selections
and Any selection in form of bitmask as from USB Hid Usage Tables v1.5,
subsection 3.4.2.1

Added pidff_send_device_control which handles usage flag check which
decides whether DEVICE_CONTROL should be handled as "One selection of a
set" or "Any selection of a set".

Reset was triggered once, on device initialization. Now, it's triggered
every time when uploading an effect to an empty device (no currently
stored effects), tracked by pidff->effect_count variable.

Co-developed-by: Makarenko Oleg <oleg@makarenk.ooo>
Signed-off-by: Makarenko Oleg <oleg@makarenk.ooo>
Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
Reviewed-by: Michał Kopeć <michal@nozomi.space>
Tested-by: Cristóferson Bueno <cbueno81@gmail.com>
---
 drivers/hid/usbhid/hid-pidff.c | 138 +++++++++++++++++++++------------
 1 file changed, 89 insertions(+), 49 deletions(-)

diff --git a/drivers/hid/usbhid/hid-pidff.c b/drivers/hid/usbhid/hid-pidff.c
index e6224e797dc6..7db63d686c62 100644
--- a/drivers/hid/usbhid/hid-pidff.c
+++ b/drivers/hid/usbhid/hid-pidff.c
@@ -109,9 +109,10 @@ static const u8 pidff_pool[] = { 0x80, 0x83, 0xa9 };
 /* Special field key tables used to put special field keys into arrays */
 
 #define PID_ENABLE_ACTUATORS	0
-#define PID_STOP_ALL_EFFECTS	1
-#define PID_RESET		2
-static const u8 pidff_device_control[] = { 0x97, 0x99, 0x9a };
+#define PID_DISABLE_ACTUATORS	1
+#define PID_STOP_ALL_EFFECTS	2
+#define PID_RESET		3
+static const u8 pidff_device_control[] = { 0x97, 0x98, 0x99, 0x9a };
 
 #define PID_CONSTANT	0
 #define PID_RAMP	1
@@ -190,6 +191,7 @@ struct pidff_device {
 	int pid_id[PID_EFFECTS_MAX];
 
 	u32 quirks;
+	u8 effect_count;
 };
 
 /*
@@ -490,9 +492,83 @@ static int pidff_needs_set_ramp(struct ff_effect *effect, struct ff_effect *old)
 	       effect->u.ramp.end_level != old->u.ramp.end_level;
 }
 
+/*
+ * Clear device control report
+ */
+static void pidff_send_device_control(struct pidff_device *pidff, int field)
+{
+	int i, tmp;
+	int field_index = pidff->control_id[field];
+
+	/* Detect if the field is a bitmask variable or an array */
+	if (pidff->device_control->flags & HID_MAIN_ITEM_VARIABLE) {
+		hid_dbg(pidff->hid, "DEVICE_CONTROL is a bitmask\n");
+		/* Clear current bitmask */
+		for(i = 0; i < sizeof(pidff_device_control); i++) {
+			tmp = pidff->control_id[i];
+			pidff->device_control->value[tmp] = 0;
+		}
+		pidff->device_control->value[field_index - 1] = 1;
+	} else {
+		hid_dbg(pidff->hid, "DEVICE_CONTROL is an array\n");
+		pidff->device_control->value[0] = field_index;
+	}
+
+	hid_hw_request(pidff->hid, pidff->reports[PID_DEVICE_CONTROL], HID_REQ_SET_REPORT);
+	hid_hw_wait(pidff->hid);
+}
+
+/*
+ * Modify actuators state
+ */
+static void pidff_modify_actuators_state(struct pidff_device *pidff, bool enable)
+{
+	hid_dbg(pidff->hid, "%s actuators\n", enable ? "Enable" : "Disable");
+	pidff_send_device_control(pidff,
+		enable ? PID_ENABLE_ACTUATORS : PID_DISABLE_ACTUATORS);
+}
+
+/*
+ * Reset the device, stop all effects, enable actuators
+ * Refetch pool report
+ */
+static void pidff_reset(struct pidff_device *pidff)
+{
+	int i = 0;
+
+	/* We reset twice as sometimes hid_wait_io isn't waiting long enough */
+	pidff_send_device_control(pidff, PID_RESET);
+	pidff_send_device_control(pidff, PID_RESET);
+	pidff->effect_count = 0;
+
+	pidff_send_device_control(pidff, PID_STOP_ALL_EFFECTS);
+	pidff_modify_actuators_state(pidff, 1);
+
+	/* pool report is sometimes messed up, refetch it */
+	hid_hw_request(pidff->hid, pidff->reports[PID_POOL], HID_REQ_GET_REPORT);
+	hid_hw_wait(pidff->hid);
+
+	if (pidff->pool[PID_SIMULTANEOUS_MAX].value) {
+		while (pidff->pool[PID_SIMULTANEOUS_MAX].value[0] < 2) {
+			if (i++ > 20) {
+				hid_warn(pidff->hid,
+					 "device reports %d simultaneous effects\n",
+					 pidff->pool[PID_SIMULTANEOUS_MAX].value[0]);
+				break;
+			}
+			hid_dbg(pidff->hid, "pid_pool requested again\n");
+			hid_hw_request(pidff->hid, pidff->reports[PID_POOL],
+					  HID_REQ_GET_REPORT);
+			hid_hw_wait(pidff->hid);
+		}
+	}
+}
+
 /*
  * Send a request for effect upload to the device
  *
+ * Reset and enable actuators if no effects were present on the device
+ *
  * Returns 0 if device reported success, -ENOSPC if the device reported memory
  * is full. Upon unknown response the function will retry for 60 times, if
  * still unsuccessful -EIO is returned.
@@ -501,6 +577,9 @@ static int pidff_request_effect_upload(struct pidff_device *pidff, int efnum)
 {
 	int j;
 
+	if (!pidff->effect_count)
+		pidff_reset(pidff);
+
 	pidff->create_new_effect_type->value[0] = efnum;
 	hid_hw_request(pidff->hid, pidff->reports[PID_CREATE_NEW_EFFECT],
 			HID_REQ_SET_REPORT);
@@ -520,6 +599,8 @@ static int pidff_request_effect_upload(struct pidff_device *pidff, int efnum)
 			hid_dbg(pidff->hid, "device reported free memory: %d bytes\n",
 				 pidff->block_load[PID_RAM_POOL_AVAILABLE].value ?
 				 pidff->block_load[PID_RAM_POOL_AVAILABLE].value[0] : -1);
+
+			pidff->effect_count++;
 			return 0;
 		}
 		if (pidff->block_load_status->value[0] ==
@@ -568,12 +649,16 @@ static int pidff_playback(struct input_dev *dev, int effect_id, int value)
 
 /*
  * Erase effect with PID id
+ * Decrease the device effect counter
  */
 static void pidff_erase_pid(struct pidff_device *pidff, int pid_id)
 {
 	pidff->block_free[PID_EFFECT_BLOCK_INDEX].value[0] = pid_id;
 	hid_hw_request(pidff->hid, pidff->reports[PID_BLOCK_FREE],
 			HID_REQ_SET_REPORT);
+
+	if (pidff->effect_count > 0)
+		pidff->effect_count--;
 }
 
 /*
@@ -1211,50 +1296,6 @@ static int pidff_init_fields(struct pidff_device *pidff, struct input_dev *dev)
 	return 0;
 }
 
-/*
- * Reset the device
- */
-static void pidff_reset(struct pidff_device *pidff)
-{
-	struct hid_device *hid = pidff->hid;
-	int i = 0;
-
-	pidff->device_control->value[0] = pidff->control_id[PID_RESET];
-	/* We reset twice as sometimes hid_wait_io isn't waiting long enough */
-	hid_hw_request(hid, pidff->reports[PID_DEVICE_CONTROL], HID_REQ_SET_REPORT);
-	hid_hw_wait(hid);
-	hid_hw_request(hid, pidff->reports[PID_DEVICE_CONTROL], HID_REQ_SET_REPORT);
-	hid_hw_wait(hid);
-
-	pidff->device_control->value[0] = pidff->control_id[PID_STOP_ALL_EFFECTS];
-	hid_hw_request(hid, pidff->reports[PID_DEVICE_CONTROL], HID_REQ_SET_REPORT);
-	hid_hw_wait(hid);
-
-	pidff->device_control->value[0] =
-		pidff->control_id[PID_ENABLE_ACTUATORS];
-	hid_hw_request(hid, pidff->reports[PID_DEVICE_CONTROL], HID_REQ_SET_REPORT);
-	hid_hw_wait(hid);
-
-	/* pool report is sometimes messed up, refetch it */
-	hid_hw_request(hid, pidff->reports[PID_POOL], HID_REQ_GET_REPORT);
-	hid_hw_wait(hid);
-
-	if (pidff->pool[PID_SIMULTANEOUS_MAX].value) {
-		while (pidff->pool[PID_SIMULTANEOUS_MAX].value[0] < 2) {
-			if (i++ > 20) {
-				hid_warn(pidff->hid,
-					 "device reports %d simultaneous effects\n",
-					 pidff->pool[PID_SIMULTANEOUS_MAX].value[0]);
-				break;
-			}
-			hid_dbg(pidff->hid, "pid_pool requested again\n");
-			hid_hw_request(hid, pidff->reports[PID_POOL],
-					  HID_REQ_GET_REPORT);
-			hid_hw_wait(hid);
-		}
-	}
-}
-
 /*
  * Test if autocenter modification is using the supported method
  */
@@ -1320,6 +1361,7 @@ int hid_pidff_init_with_quirks(struct hid_device *hid, __u32 initial_quirks)
 
 	pidff->hid = hid;
 	pidff->quirks = initial_quirks;
+	pidff->effect_count = 0;
 
 	hid_device_io_start(hid);
 
@@ -1336,8 +1378,6 @@ int hid_pidff_init_with_quirks(struct hid_device *hid, __u32 initial_quirks)
 	if (error)
 		goto fail;
 
-	pidff_reset(pidff);
-
 	if (test_bit(FF_GAIN, dev->ffbit)) {
 		pidff_set(&pidff->device_gain[PID_DEVICE_GAIN_FIELD], 0xffff);
 		hid_hw_request(hid, pidff->reports[PID_DEVICE_GAIN],
-- 
2.48.1


