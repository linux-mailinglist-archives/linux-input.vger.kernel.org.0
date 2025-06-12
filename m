Return-Path: <linux-input+bounces-12826-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 05A5BAD66D5
	for <lists+linux-input@lfdr.de>; Thu, 12 Jun 2025 06:35:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A984717C9DB
	for <lists+linux-input@lfdr.de>; Thu, 12 Jun 2025 04:35:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39B761A0BC5;
	Thu, 12 Jun 2025 04:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kYn1Q7zf"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DFD810E5;
	Thu, 12 Jun 2025 04:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749702922; cv=none; b=YJrG8HK5+WOjj+oS9Xocd64rQq+GJQgYPAqutrKcKwT16V/dwTa7wP0HDL+XJB7LZz9LfiaoNoJYgfdDjxtBT6FWtb8HgWWdaeAJRadUdPAXUUwLghgRcpwvMp11en2aMxbL3s0OcD/SvNYuiTo1usM3VZqRTIiJmD/vq5C+50E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749702922; c=relaxed/simple;
	bh=vssVQBjL0Rs9oRPDRaeMF/R5T/XxSj9wYf3tfnC1f40=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HhiFdLj0HMxDi6IouhxKgI5ID0P4xye/HfrPIHKhmgo5Yk49l8e3iCJHnYX+ulEBMer/ea6G6L+fOqYTeDqMaL6/rqvn4mmKcNsfeUs+6Dv5BExQhZRiZTCkCMv94nCP+DymLZa5ltpN1DuRBaSs8Vy2TXVhCE7DgtFhFOOqYBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kYn1Q7zf; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-747fc77ba9eso563865b3a.0;
        Wed, 11 Jun 2025 21:35:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749702920; x=1750307720; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2LTYlPXcswQifh1L6r+1AMoFw8yfMLNRvZBIcjX/kZY=;
        b=kYn1Q7zfnkpk55A/K3EQlNe64KMChFqdom9BqwZjBFImZ4eJBztFIyqLj1AQp0qhmS
         ch0KmBXqkeoCGA22+BDqV5VmrBIetDb2qMl7rJLtEfdOomq0bmsHzUT9so5bzjw+eSyF
         Vfxl2xg9XQ8X8oybLqzLHw+jxFbktpLoj6Jd0SKbQJAhh7tDNTunDCohDM8+6OAuM5jQ
         +JtcApu1YcxQKfTKcak34dgcZuALcaEt2B1av5FITMHjyOXolB0xWNWO8Z7/1RNdLUHC
         8AHxueYkWPe6U+l3hSvKq+tmDh5r8QzStvk5GNg83VQkDW+dIK1enQd7SUPcqefypSDj
         MLoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749702920; x=1750307720;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2LTYlPXcswQifh1L6r+1AMoFw8yfMLNRvZBIcjX/kZY=;
        b=ddQuR6OY5NlcR7yvmMe+im8qDhVBm2qbfn4YoiyxKS394Pl2GRF1QAp9rs3YSt01bx
         LqMY2T7MN4VAfkIP6w9Bdngv9ztqOxdP4o9RqL1jobfizv7eckDb0+dbtcsIp7IJl3HD
         kFV2G0PqBR/9e4L65AQZJ95onLkeZKYmkr1Zwi8/tvg56/OI0kiLJkE0xXZPaJivE7jV
         4pdZ00b4UERbusCuM2GQq03oJSymkjoycQVVgzebdPz7G5vMVGZ2FOisXv56+EZa4AaG
         A5OjgT9WdDDkabVx+p10+jZn+fO0ReH0tW+KBXTo1gAyQ5qX6P6/CdXrS1rVIoDm6xTe
         5jIw==
X-Forwarded-Encrypted: i=1; AJvYcCWeJEcl6UhQPsWG/FLO+o5aTDEJDpEo/FN32boOpMla8w9FDdogKS+cEk2ecEYUBW5nUfyQIAGjBSrZzQ==@vger.kernel.org, AJvYcCX1G2qa2PglILj0ltEbBPPh6XmA5E77+ypzs5JdJ64Z0C+qOdn6iIIlGv5UbiZFpz0wPrH/rUfYE1w3ix0q@vger.kernel.org
X-Gm-Message-State: AOJu0YwpSH0ytoz4ZM5pIchSvaAJ0KT/7ZAEkaR279LqZBHgu+uUf+Kf
	nCxH7c6fNXm27okTb1pvhRZY4kCumMJAUbLcQYuQSb6EvzD37GmmoxXE
X-Gm-Gg: ASbGncuu5WQftmHUm483FHsRq8BsztNmWn0GuM4qdX7LWfaZr8AP9+sYjKAUfrlkd2x
	QrDvUi7hY/g5tczEhc37KR9SH3JoZbU69MSEevFgr72trg3CXljFAeW2MTQmyfD93u+GYFj+lHM
	vd7dWt3S5yTJ6euUKFZ7ovrJX6J0Gj/wtHy0SCd2uBxnOePg0Jtz2Ha+mFx4ZkqMswi5tpPD1tb
	6IcXe5baXd07YSi/V8qLf9op8ozPNkmXS6il79lzIUSizyWxLzC8LQ88WrxkufaDmxLP9/AgqPn
	hSxkPaQGpckXZc+cD9h0P+PwZyayozmL5D7tf8ND4JamTkysnLrlVc9YypC5po+c5s4505lzWYg
	gvgk=
X-Google-Smtp-Source: AGHT+IFqQImbpVK0p1Xg7cyVw8V61IEQSCSw/YIvPBB5tC71tIfkBN5X5RXScVCfr6IhsaHB5rmiFA==
X-Received: by 2002:a05:6a21:1519:b0:216:1fc7:5d51 with SMTP id adf61e73a8af0-21f86747eecmr9757182637.37.1749702919848;
        Wed, 11 Jun 2025 21:35:19 -0700 (PDT)
Received: from niyarin-go.flets-east.jp ([240b:10:ade1:3900:ac26:2c0c:eb3c:1f8b])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2fd6488bcasm335287a12.78.2025.06.11.21.35.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 21:35:19 -0700 (PDT)
From: Akira Inoue <niyarium@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: Akira Inoue <niyarium@gmail.com>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] HID: lenovo: Add support for ThinkPad X1 Tablet Thin Keyboard Gen2
Date: Thu, 12 Jun 2025 13:34:38 +0900
Message-ID: <20250612043439.1914003-1-niyarium@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add "Thinkpad X1 Tablet Gen 2 Keyboard" PID to hid-lenovo driver to fix trackpoint not working issue.

Signed-off-by: Akira Inoue <niyarium@gmail.com>
---
 drivers/hid/hid-ids.h        | 1 +
 drivers/hid/hid-lenovo.c     | 8 ++++++++
 drivers/hid/hid-multitouch.c | 8 +++++++-
 3 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index e3fb4e2fe..cc82ca192 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -819,6 +819,7 @@
 #define USB_DEVICE_ID_LENOVO_TPPRODOCK	0x6067
 #define USB_DEVICE_ID_LENOVO_X1_COVER	0x6085
 #define USB_DEVICE_ID_LENOVO_X1_TAB	0x60a3
+#define USB_DEVICE_ID_LENOVO_X1_TAB2	0x60a4
 #define USB_DEVICE_ID_LENOVO_X1_TAB3	0x60b5
 #define USB_DEVICE_ID_LENOVO_X12_TAB	0x60fe
 #define USB_DEVICE_ID_LENOVO_X12_TAB2	0x61ae
diff --git a/drivers/hid/hid-lenovo.c b/drivers/hid/hid-lenovo.c
index af29ba840..f4a6c506e 100644
--- a/drivers/hid/hid-lenovo.c
+++ b/drivers/hid/hid-lenovo.c
@@ -492,6 +492,7 @@ static int lenovo_input_mapping(struct hid_device *hdev,
 	case USB_DEVICE_ID_LENOVO_X12_TAB:
 	case USB_DEVICE_ID_LENOVO_X12_TAB2:
 	case USB_DEVICE_ID_LENOVO_X1_TAB:
+	case USB_DEVICE_ID_LENOVO_X1_TAB2:
 	case USB_DEVICE_ID_LENOVO_X1_TAB3:
 		return lenovo_input_mapping_x1_tab_kbd(hdev, hi, field, usage, bit, max);
 	default:
@@ -605,6 +606,7 @@ static ssize_t attr_fn_lock_store(struct device *dev,
 	case USB_DEVICE_ID_LENOVO_X12_TAB2:
 	case USB_DEVICE_ID_LENOVO_TP10UBKBD:
 	case USB_DEVICE_ID_LENOVO_X1_TAB:
+	case USB_DEVICE_ID_LENOVO_X1_TAB2:
 	case USB_DEVICE_ID_LENOVO_X1_TAB3:
 		ret = lenovo_led_set_tp10ubkbd(hdev, TP10UBKBD_FN_LOCK_LED, value);
 		if (ret)
@@ -861,6 +863,7 @@ static int lenovo_event(struct hid_device *hdev, struct hid_field *field,
 	case USB_DEVICE_ID_LENOVO_X12_TAB2:
 	case USB_DEVICE_ID_LENOVO_TP10UBKBD:
 	case USB_DEVICE_ID_LENOVO_X1_TAB:
+	case USB_DEVICE_ID_LENOVO_X1_TAB2:
 	case USB_DEVICE_ID_LENOVO_X1_TAB3:
 		return lenovo_event_tp10ubkbd(hdev, field, usage, value);
 	default:
@@ -1144,6 +1147,7 @@ static int lenovo_led_brightness_set(struct led_classdev *led_cdev,
 	case USB_DEVICE_ID_LENOVO_X12_TAB2:
 	case USB_DEVICE_ID_LENOVO_TP10UBKBD:
 	case USB_DEVICE_ID_LENOVO_X1_TAB:
+	case USB_DEVICE_ID_LENOVO_X1_TAB2:
 	case USB_DEVICE_ID_LENOVO_X1_TAB3:
 		ret = lenovo_led_set_tp10ubkbd(hdev, tp10ubkbd_led[led_nr], value);
 		break;
@@ -1384,6 +1388,7 @@ static int lenovo_probe(struct hid_device *hdev,
 	case USB_DEVICE_ID_LENOVO_X12_TAB2:
 	case USB_DEVICE_ID_LENOVO_TP10UBKBD:
 	case USB_DEVICE_ID_LENOVO_X1_TAB:
+	case USB_DEVICE_ID_LENOVO_X1_TAB2:
 	case USB_DEVICE_ID_LENOVO_X1_TAB3:
 		ret = lenovo_probe_tp10ubkbd(hdev);
 		break;
@@ -1473,6 +1478,7 @@ static void lenovo_remove(struct hid_device *hdev)
 	case USB_DEVICE_ID_LENOVO_X12_TAB2:
 	case USB_DEVICE_ID_LENOVO_TP10UBKBD:
 	case USB_DEVICE_ID_LENOVO_X1_TAB:
+	case USB_DEVICE_ID_LENOVO_X1_TAB2:
 	case USB_DEVICE_ID_LENOVO_X1_TAB3:
 		lenovo_remove_tp10ubkbd(hdev);
 		break;
@@ -1523,6 +1529,8 @@ static const struct hid_device_id lenovo_devices[] = {
 	 */
 	{ HID_DEVICE(BUS_USB, HID_GROUP_GENERIC,
 		     USB_VENDOR_ID_LENOVO, USB_DEVICE_ID_LENOVO_X1_TAB) },
+	{ HID_DEVICE(BUS_USB, HID_GROUP_GENERIC,
+		     USB_VENDOR_ID_LENOVO, USB_DEVICE_ID_LENOVO_X1_TAB2) },
 	{ HID_DEVICE(BUS_USB, HID_GROUP_GENERIC,
 		     USB_VENDOR_ID_LENOVO, USB_DEVICE_ID_LENOVO_X1_TAB3) },
 	{ HID_DEVICE(BUS_USB, HID_GROUP_GENERIC,
diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
index b41001e02..a1c54ffe0 100644
--- a/drivers/hid/hid-multitouch.c
+++ b/drivers/hid/hid-multitouch.c
@@ -2132,12 +2132,18 @@ static const struct hid_device_id mt_devices[] = {
 		HID_DEVICE(BUS_I2C, HID_GROUP_GENERIC,
 			USB_VENDOR_ID_LG, I2C_DEVICE_ID_LG_7010) },
 
-	/* Lenovo X1 TAB Gen 2 */
+	/* Lenovo X1 TAB Gen 1 */
 	{ .driver_data = MT_CLS_WIN_8_FORCE_MULTI_INPUT,
 		HID_DEVICE(BUS_USB, HID_GROUP_MULTITOUCH_WIN_8,
 			   USB_VENDOR_ID_LENOVO,
 			   USB_DEVICE_ID_LENOVO_X1_TAB) },
 
+	/* Lenovo X1 TAB Gen 2 */
+	{ .driver_data = MT_CLS_WIN_8_FORCE_MULTI_INPUT,
+		HID_DEVICE(BUS_USB, HID_GROUP_MULTITOUCH_WIN_8,
+			   USB_VENDOR_ID_LENOVO,
+			   USB_DEVICE_ID_LENOVO_X1_TAB2) },
+
 	/* Lenovo X1 TAB Gen 3 */
 	{ .driver_data = MT_CLS_WIN_8_FORCE_MULTI_INPUT,
 		HID_DEVICE(BUS_USB, HID_GROUP_MULTITOUCH_WIN_8,
-- 
2.43.0


