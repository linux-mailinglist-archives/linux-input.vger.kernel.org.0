Return-Path: <linux-input+bounces-9549-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E5E89A1C578
	for <lists+linux-input@lfdr.de>; Sat, 25 Jan 2025 23:26:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 651A13A8B98
	for <lists+linux-input@lfdr.de>; Sat, 25 Jan 2025 22:26:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A3DF2080C6;
	Sat, 25 Jan 2025 22:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fb75JMvn"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56B412066E2;
	Sat, 25 Jan 2025 22:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737843952; cv=none; b=g7ChCn//QqCBHNT+Lz9YU0b9bVRFexSsV3ZJLpYRUx++uMDaZ1Egs9TrJne9ImuSNvEDJXhZe0mb2mwElx4nGVZ6iA9hQCD55UTatNPgliX7MhXoi7QIJ0VTxLmVVU0HXqBVF1s/44+YV2iavnevYysEStLS/d0FOOL7Wc+YdG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737843952; c=relaxed/simple;
	bh=qxd9mWeHk06PwUuhqRFs8xF2iGsgst6bNefZ/BWNDQE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Q1LqAv7C2+EFFXWiZoCqyBkTeUnut5bG8EErYPSZouFsIrrxKba68S0Q1rFAKu4K4geK+N7u9Io6LKKX+FUCiECpuRaDOk5rmuvbQcdA1UfmR2buqe9L08/Z1TFlzqM0pKVoMaQBwAdCAVG1hQN/RFgpFV0+e9o6E+SS4H4xP9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fb75JMvn; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5d3e5c225aaso687854a12.3;
        Sat, 25 Jan 2025 14:25:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737843949; x=1738448749; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nnbFZzECsexvmY3/x8I8GG9kNQnLCxxOnzANN8WXTnI=;
        b=fb75JMvnyUyXlgdcmSAydHLFRQdRey4CqT0f5sRuvCSW88DTb+pi2N9N6yDuO0eYFT
         KZbKRIGL2JsVOEVOgzZtPhVOMWOQlNrxiwhfhCqZ2MS2IRZEiyiA4rzw5BXk2ArlEAac
         rXoKMKw1d+566QslWRVJm+uDsyo0Mn6khLlsvMMywk3tRRN7N+2gJLiccwLTwtqutxdD
         MEAEMq6VarFsPKBh+sZ3QGSvgdhTD9ZNbtlNd+XtY3OapPwREt/wB3bjfci3HmOFuKky
         DUUZGLNyIe6GY98Yf6VwGtaA2LkT8UvRMcDURTTVJOJrZI6AoKZ5Qcjfc83SA4DwN+qR
         XQFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737843949; x=1738448749;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nnbFZzECsexvmY3/x8I8GG9kNQnLCxxOnzANN8WXTnI=;
        b=Vsq7amGb4kVpQRRNtaPlNmk5nfRPgA60n9vStW1MzJerFaANnx6gpkT2NsBcW35VpB
         8Zrzgrjjaeo/pAxc+ezmGQ208XabO40KzUF7zOEYwEvSkLoL4rsGvvQvzbAkuyigpwtq
         ZpwfjI9IZ/e9phlcIFzI1wB0By+gwfXheKNhMyWO404f4EAqH6duHAv9fYzR9oIzm2qd
         ftZ8Dclele+gwr2GX1jwDeBuCgrLOa+OSXOJggZTbQEWVpDgaa+O06wfn4ak76TqA5rV
         7bjEYyyTgy/1DGRtkcrMr7tUjizBXSV+v5kSTT/l+Arn7ZvGESlyF4aX5f28CQ9HB/Yr
         8HiA==
X-Forwarded-Encrypted: i=1; AJvYcCVQJn16uX+f9WjzCLk6iBbza+vDlnBYC2DYo5cjTab3ufPHnpulSinttfUTyEAb8+JoVCh8TGx5pLfMeg==@vger.kernel.org, AJvYcCXrye/5gRGnTmsct3DdoQiWnwAs94E/qIsFHwcEp9WYPKXkKKOcWIVefi2XPreHhbSa1y1ZbLLPY5An@vger.kernel.org
X-Gm-Message-State: AOJu0YwScbipwEZrN0LFsB4+lX+AbCPLvZsxQruclBJfoJJ4CR1g0Cd8
	PtFfbItLPG60cPIzaLgbpyJou4W6geen4xPKspTjNNvhao1ZlPW7
X-Gm-Gg: ASbGnctpihyLXyhg0oCmD0ZvtMme9GQeXveqlHZl6h+TBNglvcbqIWYgVG4FWSu287Z
	BTJ1/gY2oAuk1nT74p6XMoHqFNPlmjUzObbBP7h3L5ocYZeEvv0dswUNruOFweL+LNVc1PpvpNa
	xDDr9zxF/XULzvZdE4760sg/dyIokrM7r5uuVFG+vYcK0ZP47//8+JpMRIJm1JQXibpJckX8RDZ
	G//CW5Md08fkONnVriTc8yg4HmpCBzZCFt1v77jwvezszT6dbN+9Yf3AbNOcSlmwx4oeSHj3xc/
	Z7CbT81HDhOrGyEG7imjK4hX9Ck9ZO5R4adqpOL3z4dgJY0kYYo=
X-Google-Smtp-Source: AGHT+IGZWR1nAQGCcTHx2RxRSTF+ih8MJP3R3AcwdNMaTyv7EFmuLxQg5x/JqxHSMVS8ZrXqkNQQEA==
X-Received: by 2002:a17:907:d0b:b0:a9a:2afc:e4ef with SMTP id a640c23a62f3a-ab38b2cecccmr1377418866b.7.1737843948421;
        Sat, 25 Jan 2025 14:25:48 -0800 (PST)
Received: from laptok.lan (89-64-31-140.dynamic.chello.pl. [89.64.31.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab68f1ef7besm136540166b.62.2025.01.25.14.25.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jan 2025 14:25:48 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: anssi.hannula@gmail.com,
	oleg@makarenk.ooo,
	linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v7 13/17] HID: pidff: Completely rework and fix pidff_reset function
Date: Sat, 25 Jan 2025 23:25:26 +0100
Message-ID: <20250125222530.45944-14-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250125222530.45944-1-tomasz.pakula.oficjalny@gmail.com>
References: <20250125222530.45944-1-tomasz.pakula.oficjalny@gmail.com>
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


