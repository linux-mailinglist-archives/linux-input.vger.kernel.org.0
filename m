Return-Path: <linux-input+bounces-11175-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E303A6EF60
	for <lists+linux-input@lfdr.de>; Tue, 25 Mar 2025 12:12:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AE815188AEFE
	for <lists+linux-input@lfdr.de>; Tue, 25 Mar 2025 11:09:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 040A02571CD;
	Tue, 25 Mar 2025 11:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Huoc6BXr"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74D862566EE;
	Tue, 25 Mar 2025 11:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742900904; cv=none; b=UtlPDsJGf/Y2yvG1RRE9iDAsLs6r86Jxi678f20KYcAdJqeDxJaf577A/aT7+8lYzabYBGPsfa0WBpnQ1xxIpV1EIuKDmAf1/+3j5tdJalyjZmjfWmpszechYZUbbQKxn5mjYWytPVwvqcHu/qWY6RUj9OQfmbGlGJQBqe4AMPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742900904; c=relaxed/simple;
	bh=LyZ7Ds1GgfPH7txnaX5X2SHpowwbn5FMPsKuuSF1ER4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TmCHODXnvIZ9ubiikaGzIFJmOlrzV6rCjbP6ITO0ktIiRvCHBvWbdQCNtrh+13kqq4iQQHyKxf3n8vJysAyCrXBUWZY8jSn6CnvEjmNOJQ3IKONu55KfTLOu6jP5ZLChB3J+vS1+nGYGT9kOpKh+W34svfu6Yvt4ZPKLNTtQelg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Huoc6BXr; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2240b4de12bso36319535ad.2;
        Tue, 25 Mar 2025 04:08:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742900903; x=1743505703; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2gkQtA6BSk/mRKzla3JHVlyl9UsPkc1mDthDlBu+rnk=;
        b=Huoc6BXr8IBgckIteEyUYX4gu8UEebt7N/xZMmoDekix1f3oouKfJg5NSTkI8AShNT
         bIVoQHfDDcdz/jlbQnLYtDPzhrRrozQjjnkDB+u39+u+EGypdjaU49SdyTcL35RD2cGD
         ynOGN9SQ6zYnMbTmnaySfjasOn/B9P+nH4UdX/mWkLDvMfeArTuD+1TTMGywLQpZjo3q
         hXZrEchDCHSrkduy0t4ZVSfK7rndSCDRLPfpuUX5Q0ML5JYSY1phldVj1CM3n/CqyXDN
         M+25ZNwcUKWCcOklQLMn7ILV3lW0xis60lAtW/gLDc1lEALyw51CHFqCM6rl+EBBhi3L
         bAxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742900903; x=1743505703;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2gkQtA6BSk/mRKzla3JHVlyl9UsPkc1mDthDlBu+rnk=;
        b=a3W6xnYqduKKrEV3UgDv+ygTZ11NWBCmmcmED/p/Qnw6DwAmx6EzqQWdnqnrwrf7IM
         bsR0GIKgjhpJnv2DZqr1b+ZOP1ZmpkgE7+MnmPoy1dSh5ajAZSkrsdiEPepVjfYuzXBU
         giPSgsJDDsLTGYeQDLc9HiDlmFdYdsZME7G3IQQvURoQEFVwQHmO6y0VOmalwCCIkj5f
         u+DWILx/NUWgpWCPciM8eeM0Da7f/XJy2NlyObq2cq7gJp99IgTRkLxhmm4EaZdy0wj+
         h5ahOUq6T+ZDwmtOfnU+OM4JOtm9iWw9PSo1LJl+p+UlTGz2wrKhB2lnYTByhmoeUSk8
         Mttg==
X-Forwarded-Encrypted: i=1; AJvYcCWt7Wf7CKvk+XBDNt+b2crq2ionuYLxcFKgUr4wQkGYSEvuM1vum9cZlXMm44LM8bKO8nouad9uXFVUg2yp@vger.kernel.org, AJvYcCXpE2enKSHGDgjvTiS0xQvM3QJJM3OWZg+ImYd85hjOuvZyqwWgvehV/ZD5njgI++yQAIwfolwwKW4C8w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwD956Hd+OQtT3d2Y3GyNoqvLbpJ3Pxdpj0MaG+YF586xNnWsBG
	M4id9MMN/lG6fSEeqBOxJ8OsKqi4uXzzgu7Vp2FndMqFOf8duRmGuaIA6Mu0SFA=
X-Gm-Gg: ASbGnctHL3WHfdXE9aRp6I7crosyHvlmeUosyOVFAxMV4SZJ4Em21IBQlITSquAisag
	oOgbT1pghgaqefjETTfp+C1o4cq5zPSY2OK/1cIx9FyLF+jxKiO2kA5F+rUqzGrXSQbfQlDWCT+
	AOJ01G1MLTEQIgrVgM7kKkXmlinu4d0U2gBOkVyvxpZ5h4qx5cldyv4d+dBQxtfRBF9kkrE4f4H
	7xo+9GW4ySPFaUaaEOtiLjiYghQDtxlsyKl4Bf7zkJcUVZXsRd6j27delNeXrxYmiEJOeMTcNPQ
	MOjTGIB89Q2sQo3yW0vjwNCDPDaBgXaum6Om4WAmqf980WowLZvFgA1VpxErUB+DKEXUGdptCBW
	GoYlavvSbS7s8fR7BOxkSzuYuOqG2tQi5988+OTSQXdgOHA==
X-Google-Smtp-Source: AGHT+IGa9t3IskA+J5tIjYqnIplK5sNodQOqUyNl7PVOst5jRQcbIW5LxLkL3kvVXHugMBvVHuxNWg==
X-Received: by 2002:a17:902:cf07:b0:224:1234:5a3b with SMTP id d9443c01a7336-22780e31515mr248484255ad.51.1742900902551;
        Tue, 25 Mar 2025 04:08:22 -0700 (PDT)
Received: from codespaces-3dd663.dxrpqgqhlb3ehogrxrezr215ye.rx.internal.cloudapp.net ([20.192.21.54])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739061592b9sm9787667b3a.152.2025.03.25.04.08.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Mar 2025 04:08:22 -0700 (PDT)
From: Aditya Garg <adityagarg1208@gmail.com>
X-Google-Original-From: Aditya Garg <gargaditya08@live.com>
To: jikos@kernel.org,
	jkosina@suse.com,
	bentiss@kernel.org,
	benjamin.tissoires@redhat.com
Cc: g.sokol99@g-sokol.info,
	linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org,
	gargaditya08@live.com
Subject: [PATCH v3 5/5] HID: apple: Add Apple Magic Keyboard A3119 USB-C support
Date: Tue, 25 Mar 2025 11:05:27 +0000
Message-ID: <20250325110754.28359-6-gargaditya08@live.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250325110754.28359-1-gargaditya08@live.com>
References: <20250325110754.28359-1-gargaditya08@live.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add Apple Magic Keyboard 2024 with Touch ID and Numeric Keypad device ID
(05ac:0322) to those recognized by the hid-apple driver. Keyboard is
otherwise compatible with the existing implementation for its earlier
2021 model.

Signed-off-by: Aditya Garg <gargaditya08@live.com>
---
 drivers/hid/hid-apple.c | 5 +++++
 drivers/hid/hid-ids.h   | 1 +
 2 files changed, 6 insertions(+)

diff --git a/drivers/hid/hid-apple.c b/drivers/hid/hid-apple.c
index e95a54113..0524893f7 100644
--- a/drivers/hid/hid-apple.c
+++ b/drivers/hid/hid-apple.c
@@ -486,6 +486,7 @@ static int hidinput_apple_event(struct hid_device *hid, struct input_dev *input,
 		case USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_NUMPAD_2021:
 		case USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2024:
 		case USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_FINGERPRINT_2024:
+		case USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_NUMPAD_2024:
 			table = magic_keyboard_2021_and_2024_fn_keys;
 			break;
 		case USB_DEVICE_ID_APPLE_WELLSPRINGT2_J132:
@@ -1182,6 +1183,10 @@ static const struct hid_device_id apple_devices[] = {
 		.driver_data = APPLE_HAS_FN | APPLE_ISO_TILDE_QUIRK | APPLE_RDESC_BATTERY },
 	{ HID_BLUETOOTH_DEVICE(BT_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_FINGERPRINT_2024),
 		.driver_data = APPLE_HAS_FN | APPLE_ISO_TILDE_QUIRK },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_NUMPAD_2024),
+		.driver_data = APPLE_HAS_FN | APPLE_ISO_TILDE_QUIRK | APPLE_RDESC_BATTERY },
+	{ HID_BLUETOOTH_DEVICE(BT_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_NUMPAD_2024),
+		.driver_data = APPLE_HAS_FN | APPLE_ISO_TILDE_QUIRK },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_TOUCHBAR_BACKLIGHT),
 		.driver_data = APPLE_MAGIC_BACKLIGHT },
 
diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index 7f2976639..88925cb13 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -167,6 +167,7 @@
 #define USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_NUMPAD_2021   0x029f
 #define USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2024   0x0320
 #define USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_FINGERPRINT_2024   0x0321
+#define USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_NUMPAD_2024   0x0322
 #define USB_DEVICE_ID_APPLE_WELLSPRING8_ANSI	0x0290
 #define USB_DEVICE_ID_APPLE_WELLSPRING8_ISO	0x0291
 #define USB_DEVICE_ID_APPLE_WELLSPRING8_JIS	0x0292
-- 
2.49.0


