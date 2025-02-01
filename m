Return-Path: <linux-input+bounces-9655-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 571EFA248AB
	for <lists+linux-input@lfdr.de>; Sat,  1 Feb 2025 12:40:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C4BCF18860C8
	for <lists+linux-input@lfdr.de>; Sat,  1 Feb 2025 11:40:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00CE31741D2;
	Sat,  1 Feb 2025 11:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cMzyK+fm"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E069F1ADC61;
	Sat,  1 Feb 2025 11:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738409967; cv=none; b=Awrw8n3NDiaS3VQ3I5hXDCRvpdleS9sJ457bNDHrSsVUlO6oED2g0Hj4iYpwJkb1LL3hrUN79dH/egKH173yUPXCxb+1R7Fu5ML/PTrlPjdoxlB3QdJ4M9i/WZwdhry7MMBbaPb5T2kboXsdGfpM/eq1gsN2yBVe2O8iZa0CgwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738409967; c=relaxed/simple;
	bh=8LFuFtIC1/vLQVJjA69tBl8fDDkaiVeYj9ro2JZL3lQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=orF84QTZtLSiXVqU69q3h3+igtOqYc0Qg5FXMb5Cbs/vNuuqm9RP/Gdf3Ukp2uUanMHOz1cKx/bpfveoirZRzVthH5402lV268UI16fAICy49ZuTQ3U+sw6rIvfJusKMeBq31zVsxYqLk2SupEeZg7jhKoGk+H+BXTFV1mP4ok8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cMzyK+fm; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5d3cfa1da14so435383a12.1;
        Sat, 01 Feb 2025 03:39:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738409964; x=1739014764; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y7HG0bNZuTLljq+7ywXHveK2FMv+kcD7yErDOYAErzU=;
        b=cMzyK+fmWElUg9DVq1zGn803QvI5K7AA0UXir5peDxw+V1FNsgqtE4Q+3PMqB/l0An
         03lfIFjaQGujNHZiQnR/TgPan8DuMpHNbqRpt5tgqxgikkdpPHjv0bF+n6ctdsm/1bz4
         P3PgBuVABvb4U8xwciSSL2tGC6Kc91P8qspoY1sNnV1a96kWZHRE4eOprtwuCh82T9qL
         AHP/fs8BfhshVkVw3U9kpczsbGRKjzFjNyWrmXukyu2pxknk84tdJrlPu3argiZ1JHue
         azekge+Rfu4GXWk9CpgIqPBZeRZJZ6erKzcTwsXv0qP8irDenHhI8kLsOQiLp7VZzzvW
         SnXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738409964; x=1739014764;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y7HG0bNZuTLljq+7ywXHveK2FMv+kcD7yErDOYAErzU=;
        b=izpwJlojYoEpgiBq01URyAYAYLoaokL2sIdniuYBGupfQz/YTazKJuRsbGhSloxcRx
         Flj7sSpEfsTEepzol7yAz4Q4hzQbesMpgnqBbHMnEe/e7NgNKHlXBU/1MDH557IVyGLA
         TXTVxUHgkeXYsuI3O5gHoTLu1mNPSCGYmLh3xWdQMqJyla5rqJJC/oGXilTt23dFhlGw
         A0Beggry+eidfjHDfEiYzYske5k5e6qvwJ+no+KJPHdSPIeMu4LL+ZbIafGjiyf2tT9n
         x/vSVu/Qpo6FXAiUZliUaT2iIjJM8QimuR5t+sG3y3lUzAELWO5NjfZhqsZUy4+JhAlz
         mPzw==
X-Forwarded-Encrypted: i=1; AJvYcCVAqC01jId2qNQYKuNjBWFoswXoC38xSdm8Tf64eddsJoE1YNyXdNOVKlKF1+4LvHNLTWepvAffPx92@vger.kernel.org, AJvYcCWACHoEo+lJwBVy335EvhCV24Dv6twtiNlxTHnmpV0tah90wA2Ffx6/6HdfGfciICFo3riJoNbB7zcM+g==@vger.kernel.org
X-Gm-Message-State: AOJu0YySbLIkBwwBr6gdDdMe7KpBX3Y6PQQX6SjeJUEtrSZhUTQs5aD5
	PvClHofz7fDYsL05sNTkNSdqrcn+0TUPjMzW5tiS+9SUAL0CblNCz29TDQ==
X-Gm-Gg: ASbGnctmZTscUSSc3YzVQXogKOzfhg4Dg4elyYjoXV2oRB3FClXxw/kf+5NHwAOxWhG
	LBzF8IGc8RntuGYAIE6ZwvIgdQofi49/n/z9EpFW8T3xoCfH83CI32l31nULE3NEpOKrSAdCoiS
	ZnvQf/PL+Vz++U6oa17V/bept335nH9ch5u3e7knUL/OAHQjd0H91Fhk0lL+ukKBoSBWAti1IKl
	p1llTAmwDB+TBH9XJSjsy7BJTXgwZ9SRWv2ZrtGaUsCHFN1h+Qj8JBFcOx2ATXX+/UO9fiiCuoP
	Jf9nO9NQM7JvpG1bTOpqd4HYL/RsTaAZ00rKHMZpEdfuYRzNORyc17yAZeIQ4w==
X-Google-Smtp-Source: AGHT+IHvi7XIGqpdsAWUGSGuuM4HHXLCWLfOlCuVBzFo+7FHjgKJVs7PyYFvmriuM8vL2C/9d+lcPw==
X-Received: by 2002:a05:6402:4287:b0:5d0:bf79:e925 with SMTP id 4fb4d7f45d1cf-5dc5efec149mr6290271a12.6.1738409964066;
        Sat, 01 Feb 2025 03:39:24 -0800 (PST)
Received: from laptok.lan (89-64-31-140.dynamic.chello.pl. [89.64.31.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dc723e9fa7sm4304577a12.20.2025.02.01.03.39.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Feb 2025 03:39:23 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: anssi.hannula@gmail.com,
	oleg@makarenk.ooo,
	linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v9 13/22] HID: pidff: Completely rework and fix pidff_reset function
Date: Sat,  1 Feb 2025 12:38:57 +0100
Message-ID: <20250201113906.769162-14-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250201113906.769162-1-tomasz.pakula.oficjalny@gmail.com>
References: <20250201113906.769162-1-tomasz.pakula.oficjalny@gmail.com>
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
Reviewed-by: Paul Dino Jones <paul@spacefreak18.xyz>
Tested-by: Paul Dino Jones <paul@spacefreak18.xyz>
Tested-by: Cristóferson Bueno <cbueno81@gmail.com>
Tested-by: Pablo Cisneros <patchkez@protonmail.com>
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


