Return-Path: <linux-input+bounces-9518-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A0F4BA1C364
	for <lists+linux-input@lfdr.de>; Sat, 25 Jan 2025 13:55:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 346903A49BA
	for <lists+linux-input@lfdr.de>; Sat, 25 Jan 2025 12:55:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6741A208984;
	Sat, 25 Jan 2025 12:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SEFQizv7"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 748221E505;
	Sat, 25 Jan 2025 12:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737809694; cv=none; b=a6Ed/N3gNPeSkvpSqdukw/bjpiCaFFLzXlnfRQKC5h7UVGOMLki8WDOLafr0QPDDBQZR3fm+6+bPU5HOCewoBI0g5GVG4WCQ0HaNg6j2pvaIQezpuSCQmq6uQ9sFCd6Ih3AeKy7Eyn8lY76i+HJHdrQqIhkaLz5ZNmylZIi2q3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737809694; c=relaxed/simple;
	bh=r2HpBPQDjRrVyhEvSIOGQAE936KzKNRVsJ73B7MzFOw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IBAbRiU/TT3I5Jwn/LAUneoyOL/C818iAxy4LEZlq/Thx5BL5v6rBAmABzALCeBH93FlObakrprO4pvT0lvODtZAKn4w/yRResmBDsi3S8SG1qGHtq1s2Pf9LDCDR5UANN3FcEFexeGvzmobPn0OPYFfuqoLKPZ00DhZN9Lw9nI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SEFQizv7; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-3021ab1f26cso2006761fa.0;
        Sat, 25 Jan 2025 04:54:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737809690; x=1738414490; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CQvhEKzM5pHRizGyFJEW6UlDPPbtCBt3Q8hUG+OtEJw=;
        b=SEFQizv7/u0k2AEkvTjtzZINtd+GkqrPd2kVrnAI2aGlRdOe3dc3u9c0Kx94J4dpZZ
         eswIa8KvFV2Ff3X8Z3cXRyYrGWCU3sH8b01l9hGVfNX9mutEM85EiC+Zmd4MGqLk1xP+
         X1msIyNU/5e0Z1Ov/yqfiqUXVwbQ1G9e910spNHy68YnK6D9GVkexMv/n8d9CG4CumOH
         lLBsBsRR/PapUN3382vRMOakkD8S0toWr3DqjATCmTurNGMAf3PIssWzadps6msKobuJ
         3Z4pVQolF6uX6bC20nzwVFVYwEl/k4olKf5HY/qsfzWQ6SL/0QhA+3UqsGxnHkWRTQKO
         fX0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737809690; x=1738414490;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CQvhEKzM5pHRizGyFJEW6UlDPPbtCBt3Q8hUG+OtEJw=;
        b=agQN/TJ77u1r9WM0NXYhS82i4QfBbeXrlGhqni6/uVh4KBozdKzRQIcgKIvbZuIcOj
         v5aMWy8rEwPV/kYPYKREBOwWkWmf+xCM8gDy5ZEEPbPcjr3OjwffOHacFqR2YY2pVTg2
         24pZoiYs5qSzZ23cT4/A1ZnZ9Lyk/P5kJ8EZrGA1yL9SSPrumxhLFuI+y4INUvFFTb1B
         qX8kCc4YlNlhpKYmv6buU3bdg3Y+A3kNx8Ioab/Da8qrlH++Xe3q0IOVcE/WZlCwVIPY
         tV9ys35oIqVHVIFWFuwhn4FqdLeFMrX/g01vvrjzSO1Cd5Kbi7TjUWjUX2BkZGKzGCsc
         tR/w==
X-Forwarded-Encrypted: i=1; AJvYcCW5gt/rg3m+8haxlTO/zcRZ93qDphfEwLUxY5WNsPtEb7FIhImWwPoaPAZN9wd5vdRtQMQTIYyROKAE@vger.kernel.org, AJvYcCWtRUhqT6O22efbEm4lZHXe3gdey8saxyOsgfKUULFA34yHVRXU59JMJ5TQGZuE2IPhlvUTG378BMakjg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/a65TuOjBVp2qqkxUKlFYxUPNfk52XVOG5mXhxV3QVRvN0cVA
	7l5hn0XOoQXk3zNQof4q9fuJoWLehT26SCIL7qzkV0ie0rgbYiiK
X-Gm-Gg: ASbGncuilaESF4NWAF8kh6TJ6WzcJtC3f1/p0dhejQq7wPXL+w0azPXZGGeDrY1X7MO
	w4slRJEA9AVMF7eRsBa9DO9/tGiGMyzA4MaMBLjWnSuUPmD6iDhQGi6xk1a/PpogKV/dmBoProi
	+QulsnrGXQGUljV+Qo5mgVBt5/sN/xndNQAJeYjLFCYgRnkluA9Vv+Dyw5Q1dK+EMKPe0VcZiNn
	8WsMS3P7Ot82KG2vRr5XRRCdlp0gDYKuK9mtcNE/YAXg/Xqo0tZQpn7D5pmyQIbw8VtV0AEC6E1
	3bhHo3bwhKYtcl6eEmUCswAvIe4vLCaX+rkx9RcwxWR2dLlwZeE=
X-Google-Smtp-Source: AGHT+IFxXxWLTmJMl3yyw9GfhOmcN9rLTyjr0bqwbqqJw6IW3o16bLH704e3BwXHv5sTBGhrTxXdfw==
X-Received: by 2002:a05:651c:501:b0:302:2bd8:2685 with SMTP id 38308e7fff4ca-3072cb3cf6dmr42950671fa.8.1737809690406;
        Sat, 25 Jan 2025 04:54:50 -0800 (PST)
Received: from laptok.lan (89-64-31-140.dynamic.chello.pl. [89.64.31.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3076bc1981esm6960701fa.75.2025.01.25.04.54.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jan 2025 04:54:49 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: anssi.hannula@gmail.com,
	oleg@makarenk.ooo,
	linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v6 04/17] HID: pidff: Add MISSING_DELAY quirk and its detection
Date: Sat, 25 Jan 2025 13:54:26 +0100
Message-ID: <20250125125439.1428460-5-tomasz.pakula.oficjalny@gmail.com>
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

A lot of devices do not include this field, and it's seldom used in force
feedback implementations. I tested about three dozen applications and
none of them make use of the delay.

This fixes initialization of a lot of PID wheels like Cammus, VRS, FFBeast

This change has no effect on fully compliant devices

Co-developed-by: Makarenko Oleg <oleg@makarenk.ooo>
Signed-off-by: Makarenko Oleg <oleg@makarenk.ooo>
Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
---
 drivers/hid/usbhid/hid-pidff.c | 33 ++++++++++++++++++++++++++++-----
 include/linux/hid.h            |  3 +++
 2 files changed, 31 insertions(+), 5 deletions(-)

diff --git a/drivers/hid/usbhid/hid-pidff.c b/drivers/hid/usbhid/hid-pidff.c
index 488e6a6a14a6..e2e431dec936 100644
--- a/drivers/hid/usbhid/hid-pidff.c
+++ b/drivers/hid/usbhid/hid-pidff.c
@@ -184,6 +184,8 @@ struct pidff_device {
 	int operation_id[sizeof(pidff_effect_operation_status)];
 
 	int pid_id[PID_EFFECTS_MAX];
+
+	u32 quirks;
 };
 
 /*
@@ -338,7 +340,10 @@ static void pidff_set_effect_report(struct pidff_device *pidff,
 	pidff->effect_direction->value[0] =
 		pidff_rescale(effect->direction, 0xffff,
 				pidff->effect_direction);
-	pidff->set_effect[PID_START_DELAY].value[0] = effect->replay.delay;
+
+	/* Omit setting delay field if it's missing */
+	if (!(pidff->quirks & HID_PIDFF_QUIRK_MISSING_DELAY))
+		pidff->set_effect[PID_START_DELAY].value[0] = effect->replay.delay;
 
 	hid_hw_request(pidff->hid, pidff->reports[PID_SET_EFFECT],
 			HID_REQ_SET_REPORT);
@@ -761,7 +766,10 @@ static void pidff_autocenter(struct pidff_device *pidff, u16 magnitude)
 	pidff->set_effect[PID_TRIGGER_REPEAT_INT].value[0] = 0;
 	pidff_set(&pidff->set_effect[PID_GAIN], magnitude);
 	pidff->set_effect[PID_DIRECTION_ENABLE].value[0] = 1;
-	pidff->set_effect[PID_START_DELAY].value[0] = 0;
+
+	/* Omit setting delay field if it's missing */
+	if (!(pidff->quirks & HID_PIDFF_QUIRK_MISSING_DELAY))
+		pidff->set_effect[PID_START_DELAY].value[0] = 0;
 
 	hid_hw_request(pidff->hid, pidff->reports[PID_SET_EFFECT],
 			HID_REQ_SET_REPORT);
@@ -784,6 +792,7 @@ static int pidff_find_fields(struct pidff_usage *usage, const u8 *table,
 			     struct hid_report *report, int count, int strict)
 {
 	int i, j, k, found;
+	int return_value = 0;
 
 	for (k = 0; k < count; k++) {
 		found = 0;
@@ -808,12 +817,17 @@ static int pidff_find_fields(struct pidff_usage *usage, const u8 *table,
 			if (found)
 				break;
 		}
-		if (!found && strict) {
+		if (!found && table[k] == pidff_set_effect[PID_START_DELAY]) {
+			pr_debug("Delay field not found, but that's OK\n");
+			pr_debug("Setting MISSING_DELAY quirk\n");
+			return_value |= HID_PIDFF_QUIRK_MISSING_DELAY;
+		}
+		else if (!found && strict) {
 			pr_debug("failed to locate %d\n", k);
 			return -1;
 		}
 	}
-	return 0;
+	return return_value;
 }
 
 /*
@@ -1088,11 +1102,19 @@ static int pidff_find_effects(struct pidff_device *pidff,
 static int pidff_init_fields(struct pidff_device *pidff, struct input_dev *dev)
 {
 	int envelope_ok = 0;
+	int status = 0;
 
-	if (PIDFF_FIND_FIELDS(set_effect, PID_SET_EFFECT, 1)) {
+	/* Save info about the device not having the DELAY ffb field. */
+	status = PIDFF_FIND_FIELDS(set_effect, PID_SET_EFFECT, 1);
+	if (status == -1) {
 		hid_err(pidff->hid, "unknown set_effect report layout\n");
 		return -ENODEV;
 	}
+	pidff->quirks |= status;
+
+	if (status & HID_PIDFF_QUIRK_MISSING_DELAY)
+		hid_dbg(pidff->hid, "Adding MISSING_DELAY quirk\n");
+
 
 	PIDFF_FIND_FIELDS(block_load, PID_BLOCK_LOAD, 0);
 	if (!pidff->block_load[PID_EFFECT_BLOCK_INDEX].value) {
@@ -1336,6 +1358,7 @@ int hid_pidff_init(struct hid_device *hid)
 	ff->playback = pidff_playback;
 
 	hid_info(dev, "Force feedback for USB HID PID devices by Anssi Hannula <anssi.hannula@gmail.com>\n");
+	hid_dbg(dev, "Active quirks mask: 0x%x\n", pidff->quirks);
 
 	hid_device_io_stop(hid);
 
diff --git a/include/linux/hid.h b/include/linux/hid.h
index d11e9c9a5f15..94ad5a510639 100644
--- a/include/linux/hid.h
+++ b/include/linux/hid.h
@@ -1227,6 +1227,9 @@ int hid_pidff_init(struct hid_device *hid);
 #define hid_pidff_init NULL
 #endif
 
+/* HID PIDFF quirks */
+#define HID_PIDFF_QUIRK_MISSING_DELAY	BIT(0)
+
 #define dbg_hid(fmt, ...) pr_debug("%s: " fmt, __FILE__, ##__VA_ARGS__)
 
 #define hid_err(hid, fmt, ...)				\
-- 
2.48.1


