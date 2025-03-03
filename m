Return-Path: <linux-input+bounces-10504-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D6685A4CC4A
	for <lists+linux-input@lfdr.de>; Mon,  3 Mar 2025 20:55:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CADDD18952F0
	for <lists+linux-input@lfdr.de>; Mon,  3 Mar 2025 19:55:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A70223026F;
	Mon,  3 Mar 2025 19:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dx1PDWkp"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DBF62147F3
	for <linux-input@vger.kernel.org>; Mon,  3 Mar 2025 19:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741031725; cv=none; b=BXJEjMlwtYMCN+LALhCABv/mBwxexq0oCovHr6T3Pr62JlN1qBKLDkKPlLCkPpWlBNnyB6txUjCGe1NLPCRFMJqfTX59chZjN/DMIqWCX0DX3zcEPMQiHjYD1KadlfH0kYNX3pAA0HCbYXQKGMLpr3pRzyP52EwNPbsNo+m2tDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741031725; c=relaxed/simple;
	bh=K0XF4IDEAopopEg3oBWnRukLEhuIP0jCMc/ch7Ubntg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dxrQB3OaaabmNww5FNFof0KudTtPhZl4bqATx9wGT2ywLlYm1UYYc+mrIopQ7oVThzSpHwMKIiw/Idv6Uhqx5cl++f2WtcGHuhoeC8dzZRTZC31/t2+PX8yzu0O4j6hrCAvU5VdZOWWsfnuiiyyFhXx688Hd7iOTBoH0ImAkm44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dx1PDWkp; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2ff087762bbso2197782a91.3
        for <linux-input@vger.kernel.org>; Mon, 03 Mar 2025 11:55:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741031722; x=1741636522; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=z9/3Qf8G3oAhDCyChzxo/CjM1Q6i+95G5IHL+6pXN28=;
        b=Dx1PDWkpAYGZaAyAYoXE4TDhaZladcoGrmginthFTGWjpHa9Tbunzdmx5XqSX7dAWo
         Wzs9y2+W9Ksyd/mwdcmPbSQoroBZ70G6gQ3lig+1AjucCJcVFMRy8EiAkfXsic8q8Tol
         T2b/tJQJX+39ZyR8pIuzCZTlkdb+dhjINL2byfVl6p8fHFk8lQEjsmQfBPPbIY6g2GjT
         8davbzk5B6VRKehuA/SQ7TKMSygdEf+xkyCbK59Ha7gD5WKgFFnPf2idjGre9JAwwbDq
         QkzbFlL5g2A25WxFrPicePWgT10O0w/LaFdljnAZSOp7oaO1nWV458dT6KWjwhjCjm5Z
         QamA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741031722; x=1741636522;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z9/3Qf8G3oAhDCyChzxo/CjM1Q6i+95G5IHL+6pXN28=;
        b=NJcK5qdzsHIw8i3UdGYsu0m1VaFGtszVUQUa5woCh5RH1uaChjk/HjnrarSqAhZsjk
         ahRhlYSuoUuB0iXDmYRahfwOE9O3Hrnun28sCBIdu1oLD0tJua8Gx5zW8yDqCsU3CVds
         dPdayj/mv9RKMfwAPRgK8VfIQ/DjmaLdanyvo4gUnhdEpGDqfOwRTfSeniJRSNPbhF8V
         KdRBfjF+k1g3JiMNOaUfRuXNjP76Erl/EBWVugagr4E5nRzE6VUmz0EaP3sD42Kh+JiY
         Hch6RHS59b8KS999mVA6OzaXJyx51bfl/INCXyhONtSQ/qzgtrU4j49BkocH068gAq3s
         xDRw==
X-Gm-Message-State: AOJu0YxNSuRC35WAudpfH0H2MT/GtgrpNX8BIgemhvD3Zmo0emsbMS98
	0CPeUhR6vk4k1Kh3wK1TTd0GqAFvRcPdTWqEAUXjStdVYlxo31RM6kj9Hw==
X-Gm-Gg: ASbGncsCkKnm5hvG2LKSn1FxTMh3mVUhZHHiNZHybfVQOz2d7pgsBxjZ6JgStUdknrO
	vG5HCcDLdGYDDbmKO/yhv6/2+sOIlS7ICJHQoU01DlAH5av1wRBU1sh6pyRZi6UvhaqEb0VcECc
	et8Ji+LIyQ72BHNoXTZJUIakBFbPZHZKLLRMwm/06iwAGPCsoZZ/Tz2Id26B1Y4z3uyZ8liPmv5
	CX2+YRkFbJZ+vPPojq3/hHd/1GlDSKTcnT8sR4vyeLudQWs3JMffABNBWiFayhqPn9JCzCwJNDt
	hUpmeiBBblKD4bw6cYhHECJyeHohC6m8/xTWelb3nUs7MxAQ3ydtlQYCBHRJ6Q==
X-Google-Smtp-Source: AGHT+IGy/OMNGUKw8euUO/WHXX7ehvhiNyQkoBljYnWHxsP43o0EL1KgrOaDYvhV6Mtd4X08RbnfvQ==
X-Received: by 2002:a17:90b:1ccd:b0:2f9:bcd8:da33 with SMTP id 98e67ed59e1d1-2febab78d7amr20300212a91.21.1741031721612;
        Mon, 03 Mar 2025 11:55:21 -0800 (PST)
Received: from localhost.localdomain ([97.115.213.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fea6753137sm9400865a91.6.2025.03.03.11.55.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 11:55:20 -0800 (PST)
From: "Gerecke, Jason" <killertofu@gmail.com>
X-Google-Original-From: "Gerecke, Jason" <jason.gerecke@wacom.com>
To: linux-input@vger.kernel.org,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	Jiri Kosina <jikos@kernel.org>
Cc: Ping Cheng <pinglinux@gmail.com>,
	Erin Skomra <skomra@gmail.com>,
	Joshua Dickens <Joshua@Joshua-Dickens.com>,
	"Tobita, Tatsunosuke" <tatsunosuke.tobita@wacom.com>,
	Jason Gerecke <jason.gerecke@wacom.com>
Subject: [PATCH] wacom: Remove static WACOM_PKGLEN_MAX limit
Date: Mon,  3 Mar 2025 11:55:18 -0800
Message-ID: <20250303195518.8326-1-jason.gerecke@wacom.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jason Gerecke <jason.gerecke@wacom.com>

Rather than memcpy every packet that we receive from HID into our own
local fixed-size array, we can just access the data directly through
the original pointer. While we're at it, remove the few other places
that assume a fixed maximum packet size and make them dynamic (in
particular: temporary buffers created by the wacom_wac_queue_flush and
wacom_intuos_bt_process_data functions; and the pen_fifo FIFO).

To ensure pen_fifo allocation has access to the maximum used packet
length, this commit also moves the function call to occur a little
later in the probe process.

Signed-off-by: Jason Gerecke <jason.gerecke@wacom.com>
---
 drivers/hid/wacom_sys.c | 35 +++++++++++++++++++++--------------
 drivers/hid/wacom_wac.c |  8 ++++----
 drivers/hid/wacom_wac.h |  7 ++-----
 3 files changed, 27 insertions(+), 23 deletions(-)

diff --git a/drivers/hid/wacom_sys.c b/drivers/hid/wacom_sys.c
index 8125383932ec7..97393a3083cae 100644
--- a/drivers/hid/wacom_sys.c
+++ b/drivers/hid/wacom_sys.c
@@ -69,16 +69,27 @@ static void wacom_wac_queue_flush(struct hid_device *hdev,
 				  struct kfifo_rec_ptr_2 *fifo)
 {
 	while (!kfifo_is_empty(fifo)) {
-		u8 buf[WACOM_PKGLEN_MAX];
-		int size;
+		int size = kfifo_peek_len(fifo);
+		u8 *buf = kzalloc(size, GFP_KERNEL);
+		unsigned int count;
 		int err;
 
-		size = kfifo_out(fifo, buf, sizeof(buf));
+		count = kfifo_out(fifo, buf, size);
+		if (count != size) {
+			// Hard to say what is the "right" action in this
+			// circumstance. Skipping the entry and continuing
+			// to flush seems reasonable enough, however.
+			hid_warn(hdev, "%s: removed fifo entry with unexpected size\n",
+				 __func__);
+			continue;
+		}
 		err = hid_report_raw_event(hdev, HID_INPUT_REPORT, buf, size, false);
 		if (err) {
 			hid_warn(hdev, "%s: unable to flush event due to error %d\n",
 				 __func__, err);
 		}
+
+		kfree(buf);
 	}
 }
 
@@ -158,13 +169,10 @@ static int wacom_raw_event(struct hid_device *hdev, struct hid_report *report,
 	if (wacom->wacom_wac.features.type == BOOTLOADER)
 		return 0;
 
-	if (size > WACOM_PKGLEN_MAX)
-		return 1;
-
 	if (wacom_wac_pen_serial_enforce(hdev, report, raw_data, size))
 		return -1;
 
-	memcpy(wacom->wacom_wac.data, raw_data, size);
+	wacom->wacom_wac.data = raw_data;
 
 	wacom_wac_irq(&wacom->wacom_wac, size);
 
@@ -1286,6 +1294,7 @@ static void wacom_devm_kfifo_release(struct device *dev, void *res)
 static int wacom_devm_kfifo_alloc(struct wacom *wacom)
 {
 	struct wacom_wac *wacom_wac = &wacom->wacom_wac;
+	int fifo_size = min(PAGE_SIZE, 10 * wacom_wac->features.pktlen);
 	struct kfifo_rec_ptr_2 *pen_fifo;
 	int error;
 
@@ -1296,7 +1305,7 @@ static int wacom_devm_kfifo_alloc(struct wacom *wacom)
 	if (!pen_fifo)
 		return -ENOMEM;
 
-	error = kfifo_alloc(pen_fifo, WACOM_PKGLEN_MAX, GFP_KERNEL);
+	error = kfifo_alloc(pen_fifo, fifo_size, GFP_KERNEL);
 	if (error) {
 		devres_free(pen_fifo);
 		return error;
@@ -2352,12 +2361,14 @@ static int wacom_parse_and_register(struct wacom *wacom, bool wireless)
 	unsigned int connect_mask = HID_CONNECT_HIDRAW;
 
 	features->pktlen = wacom_compute_pktlen(hdev);
-	if (features->pktlen > WACOM_PKGLEN_MAX)
-		return -EINVAL;
 
 	if (!devres_open_group(&hdev->dev, wacom, GFP_KERNEL))
 		return -ENOMEM;
 
+	error = wacom_devm_kfifo_alloc(wacom);
+	if (error)
+		goto fail;
+
 	wacom->resources = true;
 
 	error = wacom_allocate_inputs(wacom);
@@ -2821,10 +2832,6 @@ static int wacom_probe(struct hid_device *hdev,
 	if (features->check_for_hid_type && features->hid_type != hdev->type)
 		return -ENODEV;
 
-	error = wacom_devm_kfifo_alloc(wacom);
-	if (error)
-		return error;
-
 	wacom_wac->hid_data.inputmode = -1;
 	wacom_wac->mode_report = -1;
 
diff --git a/drivers/hid/wacom_wac.c b/drivers/hid/wacom_wac.c
index b60bfafc6a8fb..5107a676e24fc 100644
--- a/drivers/hid/wacom_wac.c
+++ b/drivers/hid/wacom_wac.c
@@ -1201,12 +1201,10 @@ static void wacom_intuos_bt_process_data(struct wacom_wac *wacom,
 
 static int wacom_intuos_bt_irq(struct wacom_wac *wacom, size_t len)
 {
-	unsigned char data[WACOM_PKGLEN_MAX];
+	u8 *data = kmemdup(wacom->data, len, GFP_KERNEL);
 	int i = 1;
 	unsigned power_raw, battery_capacity, bat_charging, ps_connected;
 
-	memcpy(data, wacom->data, len);
-
 	switch (data[0]) {
 	case 0x04:
 		wacom_intuos_bt_process_data(wacom, data + i);
@@ -1230,8 +1228,10 @@ static int wacom_intuos_bt_irq(struct wacom_wac *wacom, size_t len)
 		dev_dbg(wacom->pen_input->dev.parent,
 				"Unknown report: %d,%d size:%zu\n",
 				data[0], data[1], len);
-		return 0;
+		break;
 	}
+
+	kfree(data);
 	return 0;
 }
 
diff --git a/drivers/hid/wacom_wac.h b/drivers/hid/wacom_wac.h
index 0c3c6a6aaae95..02327de63841a 100644
--- a/drivers/hid/wacom_wac.h
+++ b/drivers/hid/wacom_wac.h
@@ -7,9 +7,6 @@
 #include <linux/hid.h>
 #include <linux/kfifo.h>
 
-/* maximum packet length for USB/BT devices */
-#define WACOM_PKGLEN_MAX	361
-
 #define WACOM_NAME_MAX		64
 #define WACOM_MAX_REMOTES	5
 #define WACOM_STATUS_UNKNOWN	255
@@ -277,7 +274,7 @@ struct wacom_features {
 	unsigned touch_max;
 	int oVid;
 	int oPid;
-	int pktlen;
+	unsigned int pktlen;
 	bool check_for_hid_type;
 	int hid_type;
 };
@@ -341,7 +338,7 @@ struct wacom_wac {
 	char pen_name[WACOM_NAME_MAX];
 	char touch_name[WACOM_NAME_MAX];
 	char pad_name[WACOM_NAME_MAX];
-	unsigned char data[WACOM_PKGLEN_MAX];
+	u8 *data;
 	int tool[2];
 	int id[2];
 	__u64 serial[2];
-- 
2.48.1


