Return-Path: <linux-input+bounces-9527-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EEA4AA1C377
	for <lists+linux-input@lfdr.de>; Sat, 25 Jan 2025 13:55:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3824C164519
	for <lists+linux-input@lfdr.de>; Sat, 25 Jan 2025 12:55:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6622E20898C;
	Sat, 25 Jan 2025 12:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SLfWIoUO"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B6EC208988;
	Sat, 25 Jan 2025 12:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737809715; cv=none; b=i8/vr++lWdnS0EOOxtu4NMyEsKPwetCnnVxrF70bpwnjuU17InRu2dB0heKsRPNWWg29s3tk/l7xbenFNUU6WQ6yTh47YKRkcvZWvCW/qtbo8E90gPw0cVKA7wS/2yXAk3X38eS8j/ZHiA+aSbXdYcFVQDmaXC7I6LlHli0VfjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737809715; c=relaxed/simple;
	bh=K0eZ2ATSBpOzziwXP0DWdhA7E+MAtlufjDmC2e8p14s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Qd+xxeokFBwVCcvt3xzVy82Gce5rZcq8bgg9qaCYnI/knyEzQWyGZcc5efkn5/z+ry/1ouSl1T+arxS8LcJg9rF8C9+K8T44ALZMVDWrVw3gfxMq3GVGOJg7OlHimfWP8YUKVToEhe6Az4aMyWLIE2pcz2o6QbVO+XCns22/TQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SLfWIoUO; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-542678284e3so514801e87.1;
        Sat, 25 Jan 2025 04:55:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737809711; x=1738414511; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Miz/p4/HPjb8+Jftb/H0T03+Avc1QDs38j+F9izqAXs=;
        b=SLfWIoUOqTxfWDc55fVyIAQRPOnvsqL42brgozN8vyt2mtDXL4+1l0u2mi+IufL2nM
         pIgSBvJ7ix2IZeV6gDXZHCj0Ao+2bnzjZaJCtXUi/McjsyiJN3Dq68YdCmA60/LqVejE
         Md4kxp+EAibYPadyqbCdW9H2IBHpzt7FMeINdrfYFwEzEJSZ2EUTvTjumGEZzkLhIklX
         /eu1apxnNKt9Fp6SrvDxgGu/oq3KrVcwE9gK9kAx2hRUhLUCvPVwh9ztiWdB4Kj0dgvD
         ns7viYYBeooZjHDsf+HFYQFeqAT7dDterJyHPv3yCnELz1QN4psNlo/08dxnrQvZEH4P
         BNww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737809711; x=1738414511;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Miz/p4/HPjb8+Jftb/H0T03+Avc1QDs38j+F9izqAXs=;
        b=jMF4SVeLSvFFuEuBNXAgSY60MRr8Hhc0yQf40OY/I8MhAytK/MmFk1GyDCY7WzJw97
         1V0szKcwMyyhRJKvE7LM5rgNXMrDe2iK0xRmfKPP5XJNYpj151Ypi8CNNmD+WE3nG+cH
         j/9GMpZud4uQh+Cuhhb77BX2Rv2n3ftk//89rP2Wb31sOwazuuY+U6S3Sz/pSoRWDi9J
         AwEf5qsV2n8RV5wCKu87j/T+g2exJGOs1zDHKueqdF3K6954HPvoqgZ0SFQTPkMmYueW
         kl/w78QnyfgALgD4Is5DyWP9TY0k94f7Ngjveryn2NExShMT8BP4wmDVRiXo5Bcx0FUV
         shxg==
X-Forwarded-Encrypted: i=1; AJvYcCV4g075FZ3Tt53gTsSf0ADoXrpAHqd0qJ/HOxk8GShLyCrFQ2Yut37zw4svuBDEI+oflIo4y0ryUeqpRQ==@vger.kernel.org, AJvYcCX0Xrv0JEsFRouf4qWqaieGBw8kRsYOnBOpWQv5HLDy8WhK8chFCA0T0vZfMAinb9tscI3PrP6aCTQ8@vger.kernel.org
X-Gm-Message-State: AOJu0YxpM3/rF9mKIbPdvUyVu8nb1omwacFrgzJNE+3j5OcMFBRc0zCT
	bhSn22Tambhg7Rf0wWIhMc6fMz/VI4lVi3B3uSIDUEjCynj7zZZN
X-Gm-Gg: ASbGncuVuH/jo5uFTJTKNvvBAtkftqH6Yko1RTTNdXC3PlsRPE6GiMsIcBqq4JP30RV
	qis6XLrJhXO65nNIn7YpatS+zgcxV3pAPwhJLBVpa5GURxah1OaMZ/B0nZHcEvbfDbbJxTTUANJ
	kOLDS8Cm7pdtyOa9atfg79uM/nXZTCiGKa3reI9VvtntjEOwxkBKe7dQCjS3ulGeAW906F/+Yyr
	h9SF6uAkmR47X+n3xaESACqVj9RN5B6bCw+VzkQLiJfYA3Is/01znV1HdWwwmXt5vFx88fkwVPI
	vY08Eq2t1Qli6pbl4mnUO2dkAced+E4o6xRYkdFVu7FTDMAtSXM=
X-Google-Smtp-Source: AGHT+IHY0wrTexNvOgHIbkqIbV3fwVx5ZnRCzrGj661ws7mxyM3ITZUJj9u/qxd350Y2TeRdPHSoNQ==
X-Received: by 2002:a2e:b88e:0:b0:302:3356:54e2 with SMTP id 38308e7fff4ca-30758803088mr21490761fa.10.1737809711161;
        Sat, 25 Jan 2025 04:55:11 -0800 (PST)
Received: from laptok.lan (89-64-31-140.dynamic.chello.pl. [89.64.31.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3076bc1981esm6960701fa.75.2025.01.25.04.55.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jan 2025 04:55:10 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: anssi.hannula@gmail.com,
	oleg@makarenk.ooo,
	linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v6 13/17] HID: pidff: Completely rework and fix pidff_reset function
Date: Sat, 25 Jan 2025 13:54:35 +0100
Message-ID: <20250125125439.1428460-14-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250125125439.1428460-1-tomasz.pakula.oficjalny@gmail.com>
References: <20250125125439.1428460-1-tomasz.pakula.oficjalny@gmail.com>
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
and Any selection in form of bitmask as from USB Hid Usage Tables 1.5
subsection 3.4.2.1

Added pidff_send_device_control which handles  usage flag check which
decides whethr DEVOCE_CONTROL should be handled as "One selection of a
set" or "Any selection of a set".

Reset was triggered once, on device initialization. Now, it's triggered
every time when uploading an effect to an empty device (no currently
stored effects), tracked by pidff->effect_count variable.

Co-developed-by: Makarenko Oleg <oleg@makarenk.ooo>
Signed-off-by: Makarenko Oleg <oleg@makarenk.ooo>
Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
---
 drivers/hid/usbhid/hid-pidff.c | 139 +++++++++++++++++++++------------
 1 file changed, 90 insertions(+), 49 deletions(-)

diff --git a/drivers/hid/usbhid/hid-pidff.c b/drivers/hid/usbhid/hid-pidff.c
index e6224e797dc6..689bf516ec55 100644
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
@@ -490,9 +492,84 @@ static int pidff_needs_set_ramp(struct ff_effect *effect, struct ff_effect *old)
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
+			tmp = pidff_device_control[i];
+			tmp = pidff->control_id[tmp];
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
@@ -501,6 +578,9 @@ static int pidff_request_effect_upload(struct pidff_device *pidff, int efnum)
 {
 	int j;
 
+	if (!pidff->effect_count)
+		pidff_reset(pidff);
+
 	pidff->create_new_effect_type->value[0] = efnum;
 	hid_hw_request(pidff->hid, pidff->reports[PID_CREATE_NEW_EFFECT],
 			HID_REQ_SET_REPORT);
@@ -520,6 +600,8 @@ static int pidff_request_effect_upload(struct pidff_device *pidff, int efnum)
 			hid_dbg(pidff->hid, "device reported free memory: %d bytes\n",
 				 pidff->block_load[PID_RAM_POOL_AVAILABLE].value ?
 				 pidff->block_load[PID_RAM_POOL_AVAILABLE].value[0] : -1);
+
+			pidff->effect_count++;
 			return 0;
 		}
 		if (pidff->block_load_status->value[0] ==
@@ -568,12 +650,16 @@ static int pidff_playback(struct input_dev *dev, int effect_id, int value)
 
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
@@ -1211,50 +1297,6 @@ static int pidff_init_fields(struct pidff_device *pidff, struct input_dev *dev)
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
@@ -1320,6 +1362,7 @@ int hid_pidff_init_with_quirks(struct hid_device *hid, __u32 initial_quirks)
 
 	pidff->hid = hid;
 	pidff->quirks = initial_quirks;
+	pidff->effect_count = 0;
 
 	hid_device_io_start(hid);
 
@@ -1336,8 +1379,6 @@ int hid_pidff_init_with_quirks(struct hid_device *hid, __u32 initial_quirks)
 	if (error)
 		goto fail;
 
-	pidff_reset(pidff);
-
 	if (test_bit(FF_GAIN, dev->ffbit)) {
 		pidff_set(&pidff->device_gain[PID_DEVICE_GAIN_FIELD], 0xffff);
 		hid_hw_request(hid, pidff->reports[PID_DEVICE_GAIN],
-- 
2.48.1


