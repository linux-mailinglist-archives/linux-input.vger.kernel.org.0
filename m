Return-Path: <linux-input+bounces-9661-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 301BCA248B7
	for <lists+linux-input@lfdr.de>; Sat,  1 Feb 2025 12:40:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A7B5B188528F
	for <lists+linux-input@lfdr.de>; Sat,  1 Feb 2025 11:40:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74B3A1B4148;
	Sat,  1 Feb 2025 11:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AwNj82wH"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9158617BB21;
	Sat,  1 Feb 2025 11:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738409975; cv=none; b=m1a3qp5qmcDbnR2sCoa0oYBT5SQE7CxZpy5ucQ6O3wr0rfqffJ5FS4V0AI4TAob8LonAc4gY7oOO82jgLWBWDaSs5p+qOZb+KHwu7enDGZe49BZ25r1hGF0uUQeDxUGAO7L3HyxLeZ4vxQdUH09qbjFl7LUuFqDr/KoIQ/kyPVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738409975; c=relaxed/simple;
	bh=KUbe290IwuT/cmVxsMAZQOm2xA71iE/9jpIUXmu++tE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qtn68xGWuMKITh5QwsfuOzIoZbrAyCKvOG1CLOzfD+OM9PacKxFH3aHLKMA/RgoinnpFy5LMwniKpXnSdxGOopKk+NXEFDVCeH+ZqPBaPyiSEniyNHBn6nabJYO4u9vDoQemzWVM4MwWbqvFgCFlQjisZaGkT6KlalMLqs/jmlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AwNj82wH; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5dbf5fb2c39so468935a12.2;
        Sat, 01 Feb 2025 03:39:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738409972; x=1739014772; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/aO7Jt0OWFF3kuqbR27PymoniiVFsHtxWxUnhNXR6Kk=;
        b=AwNj82wHovValArDwz+By6NM2SVMiFuWu1QRDIwhyLf5uHtxMQz3OBLBRViWWyiXjO
         ziTScyvR6CgmgAPpzhvCaNOWthwHBgmVr1Dp+S7GOK6sf/LLQCWlAZKPu+QFcQuOTE5d
         MUB3nG5FVETo5tCMcma7d5Ay7SOlxOnPCjVwX9NptbgPh4KCzKQRyFzThq54jH3+MXZ2
         wC5GcxRUJ0FtPKiUkX2PwelxpwNxoIuCz3KEyIe+txoK5rpRKnYEdLV9TUnuviVshkNy
         3NLKQlR1g0jY3olEUjxjY2TJar6wuU+n/Q+UoBypuIQyBfTPAEscQvp22bhe37P4U8Na
         ULGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738409972; x=1739014772;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/aO7Jt0OWFF3kuqbR27PymoniiVFsHtxWxUnhNXR6Kk=;
        b=cjgBLX7+PmJhapfRXgwO0S9S13bqCFVMAPoP7AjwCpGZQNTEphPIMXzxm1V/E9QU6t
         nFPJW565i5EOWSg+/fkyyEjPwM6qkkKgUKCqfxmKRij4iydN/rw7Mhk9U17lddNdIWsy
         UvFnmkwZkHKQ4/sPNsOZrZKg5w/RJL6kI3FEM8QJCBsoF803Og+O61yoJGnLPDAVt9FY
         EA5Px+tH1Y/gyzpoRbQfaSY6cOpWuFkTqE1lMMy9E1IDmralCQn0+iD8KxuoFXCUhQon
         BjQnXTX/4dzMnWyNZLaWfRHvHjzucxWwlQrZAhbvumFyHxRPArT5ZJTnkYD6KWW3nZFK
         pVUA==
X-Forwarded-Encrypted: i=1; AJvYcCV3WnzpHreoRYS2/6WmV8VTVGtuhRefdqGnhSBfa9JW4QGoPnVwWckF5PzZvLeCg9THF4MDLAKeKoOL@vger.kernel.org, AJvYcCW7NHqbLEu6JUn54S1pV6lpsMBIDesT/j1ICqLF5GUFMmEAqn04RlMubKCd+dQV6va3tmJSN2kRWmblWA==@vger.kernel.org
X-Gm-Message-State: AOJu0YybyLo+7N1MzHHiGnUpNjKE+uUbldAg0+WCZSU/LTiOHlssN9yr
	nStSpv3JwCO0OWIz9cqQWdG4K1wahCSrNPj93W/+ip99i1dLWPUa
X-Gm-Gg: ASbGncvaCFCG1vtPfFkTtecH7oJAn6r7dW+WVMG2Ieu3N9w3X5jwaEYi2IZpUfpTCaK
	veg2owIVibC1/x+rK7lWUymsG39LILhGh8c5W5vc8HKDzRPiPXKuiHQvJF9zNz90WBgPPd4D01z
	5n/XSaJnSOT6IcBuXtQY9LckpTeikk9Ler+YA9TIr6GZsD1wZE8bSYyCM7xivpN0utay3MbnxXc
	SeqpEwr0j4jraVeJICdSmxn06b1h7sh3wgfUtJlkZnQoj+vuZWljx/9EbBFNilxlNGAzrbjp0iS
	+f7PDPt8BVKKvDbtjxQO/sapR4U/E/3Z8b6rL+PxkHjePIxQyMgqj3CMaOjkTw==
X-Google-Smtp-Source: AGHT+IEYtEhKMXeAB82OEVbxoPoYBXLhLLv0aziuelI8CflDd8lXKZSKxoVvEu5CfdWhI/ysSLo6Eg==
X-Received: by 2002:a05:6402:51c8:b0:5dc:8845:6a00 with SMTP id 4fb4d7f45d1cf-5dc88456b7dmr1998379a12.8.1738409971717;
        Sat, 01 Feb 2025 03:39:31 -0800 (PST)
Received: from laptok.lan (89-64-31-140.dynamic.chello.pl. [89.64.31.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dc723e9fa7sm4304577a12.20.2025.02.01.03.39.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Feb 2025 03:39:31 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: anssi.hannula@gmail.com,
	oleg@makarenk.ooo,
	linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v9 19/22] HID: pidff: Move all hid-pidff definitions to a dedicated header
Date: Sat,  1 Feb 2025 12:39:03 +0100
Message-ID: <20250201113906.769162-20-tomasz.pakula.oficjalny@gmail.com>
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

Do not clutter hid includes with stuff not needed outside of
the kernel.

Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
Reviewed-by: Michał Kopeć <michal@nozomi.space>
Reviewed-by: Paul Dino Jones <paul@spacefreak18.xyz>
Tested-by: Paul Dino Jones <paul@spacefreak18.xyz>
Tested-by: Cristóferson Bueno <cbueno81@gmail.com>
Tested-by: Pablo Cisneros <patchkez@protonmail.com>
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
index ac6f940abd90..a8eaa77e80be 100644
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


