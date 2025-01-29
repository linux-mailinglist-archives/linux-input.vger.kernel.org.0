Return-Path: <linux-input+bounces-9624-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 05069A225D4
	for <lists+linux-input@lfdr.de>; Wed, 29 Jan 2025 22:31:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4935918877D4
	for <lists+linux-input@lfdr.de>; Wed, 29 Jan 2025 21:31:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 175C31E9B3D;
	Wed, 29 Jan 2025 21:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PprMpKxH"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DE8D1E9B2D;
	Wed, 29 Jan 2025 21:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738186211; cv=none; b=WiRn4nutA0Z7jd2BiaekkkTDgA9AAsJAyylyhcHyNG7rTdI1aqqLXUa3vriGksOTglaznwKZSOeu1veqKFYdFJmrEoQ9lAVQW/k8mHe2Ll0X72qXpEBPOH3U/asO+QHmEmSKcF6y3indC8ZajHuVDI5H7DvupSmDLICWK9yDTuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738186211; c=relaxed/simple;
	bh=y+8obkH0Eh3qwcw6Ctfs3SOHHpJV0mlLo6ifH1G2Llw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Fd9WDMod2ZlhiaLWLRDQ3Zqw1z7O8UTCkTppFQzsQTg9BX0k2Ijg8obOEAbwxCXSnAI0iWvma2W4UM5v4EyxoQKRjAWOuX/xVV17EmgjuMZlCPM6+MvIRXfECL2e9IqNtikrIRK69TS2ajRsJCwBFEsHZcYIF3GgoQCXG/ENFFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PprMpKxH; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-543e070cda6so14363e87.0;
        Wed, 29 Jan 2025 13:30:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738186207; x=1738791007; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yn5bRuRnrkNODA7opmd+9v1bidfHpg4rBmpMcyOxkZM=;
        b=PprMpKxHTieosJKvGJHdQVxElSy0C1fQFZbXsE77moY8Zstmt28+7VMZgrdEv8HhqW
         FheXzk+hbJ8zwvx7x1lv5f9GmkTNO8UGRaIBCNYTkZkZVAttTmAANDZEvwPoB6P6V5OT
         ckLpxBZmr6E3NdYQ5CfgDVFWjJdHwowWF7eSF5RVJJ49PhbY1gzXDKku+WNn6qQ9GWZo
         QjVs5x2HedhMs+WvJPx0zYy7JgYHoTyNMvFhCBi0brL1sJLThIOOjFmmQ4DnD0C7lpnm
         28clEvWyIJwyKvnFkQ143Tr7s6ggG3TX9/M0KUIv7cYh0jMYD//8ZaQUE8lhrCIktydW
         wabQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738186207; x=1738791007;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Yn5bRuRnrkNODA7opmd+9v1bidfHpg4rBmpMcyOxkZM=;
        b=Z44hQ2wGpCsfzs4/jytA/jw9WRTMcJhx1bmEjSZchP9DjSGmPqMZiO9Zr09Um2gNUA
         UsbO2+4/Jcgd+zZV8Xk7TfshRZ2w1z9MeCLM4KRoD6Y03Xp+yRQNsjub44nOCz08UaBo
         mR3mA+6mrOnmVX1PLVB77OEh6HCCAP1jLUEvd04DTba2zGQIsOvJObOoP9p33MtoiJIX
         qprRNXoKMF+h06kJkgmJh/c0xCRxiDefM7P1Q+FJmCRD9gX6jnhsmcrQqQZKG/D04eF5
         f9nsMeLQW9229IzpHX3eJ24i/yjuOXfczsjGrM6br4YjGNZuj0hLSzJmliCpYKg/5v9d
         ussA==
X-Forwarded-Encrypted: i=1; AJvYcCVC/jilANzFsV2sqd0WYsrFUlxIJFV95ATVGm2yd2LRg6tCkq8EzbSKFet8pPZ8Y9EccVqwoU4lTf+d@vger.kernel.org, AJvYcCVGdBnGNjsCCdr0cocpuy7lcJ3s6skcMnzRgsP9MG0SF3h0G1xxSKv0seWETUsTVRyoTzHp8yEcqC+ziQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2f2yKiNmSN8uDYI1OtIb1zZ4IzbSgbPvhnWcntbmwvc+wFI1l
	CvZOUwkrCIqkrl1WH6hxWOXaIJlsZz4J40r+Ts4ZeO5PzJEuikso
X-Gm-Gg: ASbGncsqJo6tBdTjxDajRfCQTbLz7DS+Qp9t1M5INNlFoOkOQhMRUdaKeHK7mydtr81
	10lK4rxlzybsAN8gIDkDHjnQE1gnNfK9S/G3c3CNSIiWiLHGlgsoJDdnC/XjMoYPzzQYrrI9bBb
	awlyaOGtrzGEf4vQoFUypRtEl96lUunlCRVl3IYhmdhU2KaK7uUTj7HAFlgw0Ltp1WJXqLy8zgu
	aQMsE+w9/jKmRSp8uUM7VVMAILys7R7obPL6KABOVfyUqMAFB74bc09GSnFou9ovV83u+RZKvKh
	x6iJO1Gv4tZQ6zD8JQixeIV4JeuSvUMcrqn4zMCwSyXWnMhzOCNTqTAfv3ifeg==
X-Google-Smtp-Source: AGHT+IGEqLfNs4DpRAc5NOgxBx/SzHZXLyUHnCgN8XSrtCUliqkGF+pf5p3hGUbc6A8BG8WVQ9Cc/g==
X-Received: by 2002:ac2:4f01:0:b0:542:9807:97b3 with SMTP id 2adb3069b0e04-543ea3f844dmr94016e87.4.1738186207293;
        Wed, 29 Jan 2025 13:30:07 -0800 (PST)
Received: from laptok.lan (89-64-31-140.dynamic.chello.pl. [89.64.31.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543c83799c0sm2100778e87.190.2025.01.29.13.30.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 13:30:06 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: anssi.hannula@gmail.com,
	oleg@makarenk.ooo,
	linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v8 19/21] HID: pidff: Move all hid-pidff definitions to a dedicated header
Date: Wed, 29 Jan 2025 22:29:33 +0100
Message-ID: <20250129212935.780998-20-tomasz.pakula.oficjalny@gmail.com>
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

Do not clutter hid includes with stuff not needed outside of
the kernel.

Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
Reviewed-by: Michał Kopeć <michal@nozomi.space>
Tested-by: Cristóferson Bueno <cbueno81@gmail.com>
---
 drivers/hid/hid-universal-pidff.c |  3 ++-
 drivers/hid/usbhid/hid-core.c     |  1 +
 drivers/hid/usbhid/hid-pidff.c    |  3 ++-
 drivers/hid/usbhid/hid-pidff.h    | 33 +++++++++++++++++++++++++++++++
 include/linux/hid.h               | 15 --------------
 5 files changed, 38 insertions(+), 17 deletions(-)
 create mode 100644 drivers/hid/usbhid/hid-pidff.h

diff --git a/drivers/hid/hid-universal-pidff.c b/drivers/hid/hid-universal-pidff.c
index 7ef5ab9146b1..1b713b741d19 100644
--- a/drivers/hid/hid-universal-pidff.c
+++ b/drivers/hid/hid-universal-pidff.c
@@ -13,6 +13,7 @@
 #include <linux/module.h>
 #include <linux/input-event-codes.h>
 #include "hid-ids.h"
+#include "usbhid/hid-pidff.h"
 
 #define JOY_RANGE (BTN_DEAD - BTN_JOYSTICK + 1)
 
@@ -89,7 +90,7 @@ static int universal_pidff_probe(struct hid_device *hdev,
 	}
 
 	/* Check if HID_PID support is enabled */
-	int (*init_function)(struct hid_device *, __u32);
+	int (*init_function)(struct hid_device *, u32);
 	init_function = hid_pidff_init_with_quirks;
 
 	if (!init_function) {
diff --git a/drivers/hid/usbhid/hid-core.c b/drivers/hid/usbhid/hid-core.c
index a6eb6fe6130d..44c2351b870f 100644
--- a/drivers/hid/usbhid/hid-core.c
+++ b/drivers/hid/usbhid/hid-core.c
@@ -35,6 +35,7 @@
 #include <linux/hid-debug.h>
 #include <linux/hidraw.h>
 #include "usbhid.h"
+#include "hid-pidff.h"
 
 /*
  * Version Information
diff --git a/drivers/hid/usbhid/hid-pidff.c b/drivers/hid/usbhid/hid-pidff.c
index b791e37e564c..cb044a239ab5 100644
--- a/drivers/hid/usbhid/hid-pidff.c
+++ b/drivers/hid/usbhid/hid-pidff.c
@@ -12,6 +12,7 @@
 
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
+#include "hid-pidff.h"
 #include <linux/input.h>
 #include <linux/slab.h>
 #include <linux/usb.h>
@@ -1383,7 +1384,7 @@ static int pidff_check_autocenter(struct pidff_device *pidff,
  * Check if the device is PID and initialize it
  * Set initial quirks
  */
-int hid_pidff_init_with_quirks(struct hid_device *hid, __u32 initial_quirks)
+int hid_pidff_init_with_quirks(struct hid_device *hid, u32 initial_quirks)
 {
 	struct pidff_device *pidff;
 	struct hid_input *hidinput = list_entry(hid->inputs.next,
diff --git a/drivers/hid/usbhid/hid-pidff.h b/drivers/hid/usbhid/hid-pidff.h
new file mode 100644
index 000000000000..dda571e0a5bd
--- /dev/null
+++ b/drivers/hid/usbhid/hid-pidff.h
@@ -0,0 +1,33 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+#ifndef __HID_PIDFF_H
+#define __HID_PIDFF_H
+
+#include <linux/hid.h>
+
+/* HID PIDFF quirks */
+
+/* Delay field (0xA7) missing. Skip it during set effect report upload */
+#define HID_PIDFF_QUIRK_MISSING_DELAY		BIT(0)
+
+/* Missing Paramter block offset (0x23). Skip it during SET_CONDITION
+   report upload */
+#define HID_PIDFF_QUIRK_MISSING_PBO		BIT(1)
+
+/* Initialise device control field even if logical_minimum != 1 */
+#define HID_PIDFF_QUIRK_PERMISSIVE_CONTROL	BIT(2)
+
+/* Use fixed 0x4000 direction during SET_EFFECT report upload */
+#define HID_PIDFF_QUIRK_FIX_WHEEL_DIRECTION	BIT(3)
+
+/* Force all periodic effects to be uploaded as SINE */
+#define HID_PIDFF_QUIRK_PERIODIC_SINE_ONLY	BIT(4)
+
+#ifdef CONFIG_HID_PID
+int hid_pidff_init(struct hid_device *hid);
+int hid_pidff_init_with_quirks(struct hid_device *hid, u32 initial_quirks);
+#else
+#define hid_pidff_init NULL
+#define hid_pidff_init_with_quirks NULL
+#endif
+
+#endif
diff --git a/include/linux/hid.h b/include/linux/hid.h
index c6beb01ab00c..6d09b1763652 100644
--- a/include/linux/hid.h
+++ b/include/linux/hid.h
@@ -1221,21 +1221,6 @@ unsigned long hid_lookup_quirk(const struct hid_device *hdev);
 int hid_quirks_init(char **quirks_param, __u16 bus, int count);
 void hid_quirks_exit(__u16 bus);
 
-#ifdef CONFIG_HID_PID
-int hid_pidff_init(struct hid_device *hid);
-int hid_pidff_init_with_quirks(struct hid_device *hid, __u32 initial_quirks);
-#else
-#define hid_pidff_init NULL
-#define hid_pidff_init_with_quirks NULL
-#endif
-
-/* HID PIDFF quirks */
-#define HID_PIDFF_QUIRK_MISSING_DELAY		BIT(0)
-#define HID_PIDFF_QUIRK_MISSING_PBO		BIT(1)
-#define HID_PIDFF_QUIRK_PERMISSIVE_CONTROL	BIT(2)
-#define HID_PIDFF_QUIRK_FIX_WHEEL_DIRECTION	BIT(3)
-#define HID_PIDFF_QUIRK_PERIODIC_SINE_ONLY	BIT(4)
-
 #define dbg_hid(fmt, ...) pr_debug("%s: " fmt, __FILE__, ##__VA_ARGS__)
 
 #define hid_err(hid, fmt, ...)				\
-- 
2.48.1


