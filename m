Return-Path: <linux-input+bounces-12719-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B25F5ACE96E
	for <lists+linux-input@lfdr.de>; Thu,  5 Jun 2025 07:49:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BF87A175FCB
	for <lists+linux-input@lfdr.de>; Thu,  5 Jun 2025 05:49:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAABA1F3B87;
	Thu,  5 Jun 2025 05:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k1EqaB4k"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E29EB1F3BB5;
	Thu,  5 Jun 2025 05:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749102563; cv=none; b=ic6BzMf9GsQRQb3VTk/1gn6lCmbxP71JAGjg6PEcnsUMSzYryhnS0y+Em9M/sAe1THF1RuZbJLr1YJZW/BniLHWHFTE4fI3ortAPpIN8DJ9Lk/EaH8u10KGXQlZyb3D3RfoUtgvVuhgZcAgXbPj0pMGaXDP2aXdqtgYHMgsZBro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749102563; c=relaxed/simple;
	bh=m4sa9bpZeA3ds/CtKaGscIrzehuzKVvelhDKImsmP7g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kbbTKL2cl/YP+k8cXf7InhsFhNtyiL7fgdxIaxNxY/hQBjNXp0eGOZJdMBwjVWjRXlE4V+Eaj4HvuxzpKW4Ra4F17lahE5bNl/StZD+IdEe8R5HAd7tM3hbkZUd5VSQDX2EsIWM7Q7Yo2J2wz0vBU/08EzSzFOIGhINLwK6FgsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k1EqaB4k; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-23539a1a421so5454335ad.0;
        Wed, 04 Jun 2025 22:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749102561; x=1749707361; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=laac/GWoKvUwDoyUkvZTbZqLusR59noavj+WhN9y2a0=;
        b=k1EqaB4kCCo94lLimign5KrU3YSYajLy8Wx32eKvD6Y4dc0BZ6bLVypyMXFr+/t8hr
         U+Ewkp/Tt++zoIS+qRL1xFM8IgbfC3mKRnUR1GOg8+diQxWiIKA+LT2jUap7hDWQkFLA
         xLhuYHCVeZy75o7YJM12t5ysXVR4M/F/Kqi/R1O8OTwtfZCLqcvcbNGeIkBINerMAV4V
         0bUz1lUUsXP64NNQMf8ZOclGkZfbw8ZtZrhpyB8VaDG7y2XwNKHzxApgdowLtsRlzj/N
         nRDjFg1pRDnk6nXgGE4t8AbSQ2knvIrjEd5dmC17Le3KHOnhD2389cWskX4Gbb80wxfX
         nmLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749102561; x=1749707361;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=laac/GWoKvUwDoyUkvZTbZqLusR59noavj+WhN9y2a0=;
        b=CQdXBzXVZLK4e1HewIPU3+j7/FsH2bBQEtbvy0jsYRlJtgw3IxHVmlty15YeVnH7hq
         XrQbI1EpznAZDqu+dB/PDS2QMhDZKoUb3BSws0vcNhtOKmzB5El/n7guA4Dd04Yfekxp
         PGCxsdHbELK/xUnOhCJOPXwZcjtiq7WIzzTMLCqEZZSHuWcOHipEL+vJIjH3Uz2uM22G
         2awU6esAmcRgwQtxJ/7+5WPF6DRt/o6bYsPhqeuO3Db+oXvfe5RPEEfxkff3s9ZkdXxI
         z7l8NY5GKO5JNXc25rtJzjoZReBUhRg5lb0sP+ZcYMhaSj0IyI4KYGldVU1/yesOjx+1
         MTaA==
X-Forwarded-Encrypted: i=1; AJvYcCVC7sw4BN4rIx6lencrJQ7ty9NUOY32/YHadz+dzhcVazhFNtMDDO9Z0aUjmGCIRPYdG70PcCJDMyH4pIXb@vger.kernel.org, AJvYcCVMiTn1B6J8r5opgSG3j4beaKGro+HRUEREJYXcn9oos/wqTs+Tt0YgMj6jNGlaqi68P7/yLnp2s3/P@vger.kernel.org, AJvYcCXC8+n5+yjVZcf88upj9bS218apd5yJU3bb0ZQmDCXPa1+1F3aZ6lQhFwnjAE9+8MOffMyn3oI2qOMQGKM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyAwiiPbsO0mkInpfsOLg8AAY9EOgDywJjhbNkcPzVETW0SjRy+
	XDn4xMAoCUbRt0wy7r0MQsTrlGKvVCnMgf7b+2z3hrA8x8f/aEK4DvtX
X-Gm-Gg: ASbGncsCgnS+GOzxfmBEOl6fuskUdOZruNkMczSyxc6wsl0le9kk+lS7FcI0kcdaIBK
	nzZ7IBcR/cN0RfRcSvDm4s8mg7hCkNTyHv7OpUUKw0RUzk603lLGuh4hIRvuzHy6g8zjemH19PM
	wjfVSRK6lxx4svsq81YpeNWgS9sS/01KZV0aLWLzMnKSJvP7gN5DH7pm3B6384Z/adPO9l8vFGG
	33Y089iY6rmVFNtbsl/fF+OhR1OXL8hnNty5XwEEp+UtnXJ/KCtmNU4XF+3RjbftyUYpsA3g1uf
	1UmvWKMWbB8an+M10cHIw4zlhGJOcVQnHq4crSnN4VdsE5eE5A==
X-Google-Smtp-Source: AGHT+IF5isU5NIhwA4Aj0ZXD4nEhfrGMdbMlSa8wlvQ5q5fh5MhMD7r/wYOfWqLrZY6N3Ubzs55xFg==
X-Received: by 2002:a17:903:8cc:b0:234:c549:d9f1 with SMTP id d9443c01a7336-235e11ff06bmr76674105ad.47.1749102560966;
        Wed, 04 Jun 2025 22:49:20 -0700 (PDT)
Received: from nuvole.. ([144.202.86.13])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-313318e6a53sm425550a91.3.2025.06.04.22.49.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 22:49:20 -0700 (PDT)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Kees Cook <kees@kernel.org>,
	Dan Williams <dan.j.williams@intel.com>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
	Dionna Amalie Glaze <dionnaglaze@google.com>,
	Yury Norov <yury.norov@gmail.com>,
	Filipe Manana <fdmanana@suse.com>,
	Len Brown <len.brown@intel.com>,
	Eric Biggers <ebiggers@google.com>,
	pengdonglin <pengdonglin@xiaomi.com>,
	Luo Jie <quic_luoj@quicinc.com>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: Charles Wang <charles.goodix@gmail.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Pengyu Luo <mitltlatltl@gmail.com>
Subject: [PATCH 2/2] input: touchscreen: goodix_berlin: Add stylus support
Date: Thu,  5 Jun 2025 13:48:55 +0800
Message-ID: <20250605054855.403487-2-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250605054855.403487-1-mitltlatltl@gmail.com>
References: <20250605054855.403487-1-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for stylus events in the Goodix Berlin touchscreen driver.

This patch introduces a new input device dedicated to stylus reporting,
allowing precise handling of stylus-specific data such as pressure,
tilt, and side buttons. The implementation distinguishes between touch
and stylus events and ensures that the appropriate input device reports
each event.

Key changes include:
- New event type tracking to differentiate between finger and stylus input.
- A new `struct goodix_berlin_stylus` to represent stylus data layout.
- Support for stylus pressure, tilt (X/Y), and button states (BTN_STYLUS, BTN_STYLUS2).
- Switching between input devices when changing from touch to stylus events.
- Internal handling to suppress the downstream's dropped first packet behavior.

**Known issue:**
Stylus key reporting follows the downstream implementation([1-2]).
However, on the GXTS7986 device, when BTN_STYLUS2 is continuously
held, the event stream occasionally includes 4 unexpected BTN_STYLUS
presses. This leads to intermittent and incorrect toggling of the
BTN_STYLUS, despite it not being physically pressed.

[1]: https://github.com/goodix/goodix_ts_berlin/blob/master/goodix_berlin_driver/goodix_brl_hw.c#L1165
[2]: https://github.com/goodix/goodix_ts_berlin/blob/master/goodix_berlin_driver/goodix_ts_core.c#L1157

Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
 .../input/touchscreen/goodix_berlin_core.c    | 248 ++++++++++++++++--
 1 file changed, 230 insertions(+), 18 deletions(-)

diff --git a/drivers/input/touchscreen/goodix_berlin_core.c b/drivers/input/touchscreen/goodix_berlin_core.c
index 02a1d9a46..9118071e3 100644
--- a/drivers/input/touchscreen/goodix_berlin_core.c
+++ b/drivers/input/touchscreen/goodix_berlin_core.c
@@ -18,7 +18,6 @@
  * - ESD Management
  * - Firmware update/flashing
  * - "Config" update/flashing
- * - Stylus Events
  * - Gesture Events
  * - Support for revision B
  */
@@ -28,6 +27,7 @@
 #include <linux/input.h>
 #include <linux/input/mt.h>
 #include <linux/input/touchscreen.h>
+#include <linux/of.h>
 #include <linux/property.h>
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
@@ -50,6 +50,8 @@
 #define GOODIX_BERLIN_POINT_TYPE_STYLUS_HOVER	1
 #define GOODIX_BERLIN_POINT_TYPE_STYLUS		3
 
+#define GOODIX_BERLIN_STYLUS_MAX_TILT		90
+
 #define GOODIX_BERLIN_TOUCH_ID_MASK		GENMASK(7, 4)
 
 #define GOODIX_BERLIN_DEV_CONFIRM_VAL		0xAA
@@ -59,6 +61,11 @@
 
 #define GOODIX_BERLIN_CHECKSUM_SIZE		sizeof(u16)
 
+/* BIT(3) is unused */
+#define GOODIX_BERLIN_STYLUS_BTN_MASK		GENMASK(3, 1)
+static unsigned int stylus_btn[] = {BTN_STYLUS, BTN_STYLUS2};
+#define GOODIX_BERLIN_MAX_STYLUS_BTN		ARRAY_SIZE(stylus_btn)
+
 struct goodix_berlin_fw_version {
 	u8 rom_pid[6];
 	u8 rom_vid[3];
@@ -144,11 +151,24 @@ struct goodix_berlin_touch {
 };
 #define GOODIX_BERLIN_TOUCH_SIZE	sizeof(struct goodix_berlin_touch)
 
+struct goodix_berlin_stylus {
+	u8 status;
+	u8 reserved;
+	__le16 x;
+	__le16 y;
+	__le16 p;
+	__le16 x_angle;
+	__le16 y_angle;
+	u8 reserved2[4];
+};
+#define GOODIX_BERLIN_STYLUS_SIZE	sizeof(struct goodix_berlin_stylus)
+
 struct goodix_berlin_header {
 	u8 status;
 	u8 reserved1;
 	u8 request_type;
-	u8 reserved2[3];
+	u8 stylus_btn;
+	u8 reserved2[2];
 	__le16 checksum;
 };
 #define GOODIX_BERLIN_HEADER_SIZE	sizeof(struct goodix_berlin_header)
@@ -160,6 +180,12 @@ struct goodix_berlin_event {
 		GOODIX_BERLIN_CHECKSUM_SIZE];
 };
 
+enum goodix_berlin_event_type {
+	EVENT_NONE,
+	EVENT_STYLUS,
+	EVENT_TOUCH
+};
+
 struct goodix_berlin_core {
 	struct device *dev;
 	struct regmap *regmap;
@@ -169,6 +195,7 @@ struct goodix_berlin_core {
 	struct touchscreen_properties props;
 	struct goodix_berlin_fw_version fw_version;
 	struct input_dev *input_dev;
+	struct input_dev *stylus_dev;
 	int irq;
 
 	/* Runtime parameters extracted from IC_INFO buffer  */
@@ -177,6 +204,9 @@ struct goodix_berlin_core {
 	const struct goodix_berlin_ic_data *ic_data;
 
 	struct goodix_berlin_event event;
+
+	enum goodix_berlin_event_type last_event;
+	enum goodix_berlin_event_type cur_event;
 };
 
 static bool goodix_berlin_checksum_valid(const u8 *data, int size)
@@ -432,24 +462,53 @@ static int goodix_berlin_get_remaining_contacts(struct goodix_berlin_core *cd,
 	return 0;
 }
 
-static void goodix_berlin_report_state(struct goodix_berlin_core *cd, int n)
+static void goodix_berlin_stylus_report(struct goodix_berlin_core *cd,
+					u8 btn_pressed)
+{
+	struct goodix_berlin_stylus *s =
+			(struct goodix_berlin_stylus *)cd->event.data;
+
+	struct input_dev *dev = cd->stylus_dev;
+	s8 tilt_x, tilt_y;
+	int i;
+
+	if (!dev)
+		return;
+
+	tilt_x = (s8)(le16_to_cpu(s->x_angle) / 100);
+	tilt_y = (s8)(le16_to_cpu(s->y_angle) / 100);
+
+	input_report_key(dev, BTN_TOUCH, 1);
+	input_report_key(dev, BTN_TOOL_PEN, 1);
+	input_report_abs(dev, ABS_X, le16_to_cpu(s->x));
+	input_report_abs(dev, ABS_Y, le16_to_cpu(s->y));
+	input_report_abs(dev, ABS_PRESSURE, le16_to_cpu(s->p));
+	input_report_abs(dev, ABS_DISTANCE, !le16_to_cpu(s->p));
+	input_report_abs(dev, ABS_TILT_X, tilt_x);
+	input_report_abs(dev, ABS_TILT_Y, tilt_y);
+
+	dev_dbg(&dev->dev, "stylus: x: %d, y: %d, pressure: %d, tilt_x: %d tilt_y: %d, btn: %d",
+		le16_to_cpu(s->x), le16_to_cpu(s->y), le16_to_cpu(s->p), tilt_x,
+		tilt_y, btn_pressed);
+
+	for (i = 0; i < GOODIX_BERLIN_MAX_STYLUS_BTN; i++)
+		input_report_key(dev, stylus_btn[i],
+				 !!(btn_pressed & (1 << i)));
+
+	input_sync(dev);
+}
+
+static void goodix_berlin_mt_report(struct goodix_berlin_core *cd, int n)
 {
 	struct goodix_berlin_touch *touch_data =
 			(struct goodix_berlin_touch *)cd->event.data;
 	struct goodix_berlin_touch *t;
 	int i;
-	u8 type, id;
+	u8 id;
 
 	for (i = 0; i < n; i++) {
 		t = &touch_data[i];
 
-		type = FIELD_GET(GOODIX_BERLIN_POINT_TYPE_MASK, t->status);
-		if (type == GOODIX_BERLIN_POINT_TYPE_STYLUS ||
-		    type == GOODIX_BERLIN_POINT_TYPE_STYLUS_HOVER) {
-			dev_warn_once(cd->dev, "Stylus event type not handled\n");
-			continue;
-		}
-
 		id = FIELD_GET(GOODIX_BERLIN_TOUCH_ID_MASK, t->status);
 		if (id >= GOODIX_BERLIN_MAX_TOUCH) {
 			dev_warn_ratelimited(cd->dev, "invalid finger id %d\n", id);
@@ -470,10 +529,95 @@ static void goodix_berlin_report_state(struct goodix_berlin_core *cd, int n)
 	input_sync(cd->input_dev);
 }
 
+static void goodix_berlin_device_switch(struct goodix_berlin_core *cd)
+{
+	int i;
+
+	switch (cd->last_event) {
+	case EVENT_STYLUS:
+		input_report_key(cd->stylus_dev, BTN_TOUCH, 0);
+		input_report_key(cd->stylus_dev, BTN_TOOL_PEN, 0);
+		input_sync(cd->stylus_dev);
+		break;
+	case EVENT_TOUCH:
+		for (i = 0; i < GOODIX_BERLIN_MAX_TOUCH; i++) {
+			input_mt_slot(cd->input_dev, i);
+			input_mt_report_slot_state(cd->input_dev,
+						   MT_TOOL_FINGER, false);
+		}
+		input_report_key(cd->input_dev, BTN_TOUCH, 0);
+		input_sync(cd->input_dev);
+		break;
+	default:
+		dev_warn(cd->dev, "%s: unsupported event code %d\n",
+			 __func__, cd->cur_event);
+	}
+}
+
+static void goodix_berlin_report_state(struct goodix_berlin_core *cd,
+				       u8 btn_pressed, int n)
+{
+	/*
+	 * When switching devices, the downstream code drops the first event
+	 * from the new device and instead reports a touch-up event. Retaining
+	 * and handling that initial event appears to be harmless.
+	 */
+	if (cd->last_event != EVENT_NONE && cd->last_event != cd->cur_event)
+		goodix_berlin_device_switch(cd);
+
+	switch (cd->cur_event) {
+	case EVENT_STYLUS:
+		goodix_berlin_stylus_report(cd, btn_pressed);
+		break;
+	case EVENT_TOUCH:
+		goodix_berlin_mt_report(cd, n);
+		break;
+	default:
+		dev_warn(cd->dev, "%s: unsupported event code %d\n",
+			 __func__, cd->cur_event);
+	}
+}
+
+static inline void goodix_berlin_event_update(struct goodix_berlin_core *cd)
+{
+	struct goodix_berlin_touch *touch_data =
+			(struct goodix_berlin_touch *)cd->event.data;
+
+	u8 type;
+
+	/*
+	 * According to the downstream code, the type of the first contact
+	 * point determines the type for the entire event sequence. In the
+	 * stylus case, there is typically only one contact point.
+	 */
+	cd->last_event = cd->cur_event;
+	type = FIELD_GET(GOODIX_BERLIN_POINT_TYPE_MASK, touch_data->status);
+	if (type == GOODIX_BERLIN_POINT_TYPE_STYLUS ||
+	    type == GOODIX_BERLIN_POINT_TYPE_STYLUS_HOVER)
+		cd->cur_event = EVENT_STYLUS;
+	else
+		cd->cur_event = EVENT_TOUCH;
+}
+
+static inline int goodix_berlin_event_len(struct goodix_berlin_core *cd, int n)
+{
+	switch (cd->cur_event) {
+	case EVENT_STYLUS:
+		return GOODIX_BERLIN_STYLUS_SIZE + GOODIX_BERLIN_CHECKSUM_SIZE;
+	case EVENT_TOUCH:
+		return n * GOODIX_BERLIN_TOUCH_SIZE +
+		       GOODIX_BERLIN_CHECKSUM_SIZE;
+	default:
+		dev_warn(cd->dev, "%s: unsupported event code %d\n",
+			 __func__, cd->cur_event);
+		return 0;
+	}
+}
+
 static void goodix_berlin_touch_handler(struct goodix_berlin_core *cd)
 {
-	u8 touch_num;
-	int error;
+	u8 touch_num, btn_pressed;
+	int error, len;
 
 	touch_num = FIELD_GET(GOODIX_BERLIN_TOUCH_COUNT_MASK,
 			      cd->event.hdr.request_type);
@@ -490,8 +634,9 @@ static void goodix_berlin_touch_handler(struct goodix_berlin_core *cd)
 	}
 
 	if (touch_num) {
-		int len = touch_num * GOODIX_BERLIN_TOUCH_SIZE +
-			  GOODIX_BERLIN_CHECKSUM_SIZE;
+		goodix_berlin_event_update(cd);
+		len = goodix_berlin_event_len(cd, touch_num);
+
 		if (!goodix_berlin_checksum_valid(cd->event.data, len)) {
 			dev_err(cd->dev, "touch data checksum error: %*ph\n",
 				len, cd->event.data);
@@ -499,7 +644,10 @@ static void goodix_berlin_touch_handler(struct goodix_berlin_core *cd)
 		}
 	}
 
-	goodix_berlin_report_state(cd, touch_num);
+	btn_pressed = FIELD_GET(GOODIX_BERLIN_STYLUS_BTN_MASK,
+				cd->event.hdr.stylus_btn);
+
+	goodix_berlin_report_state(cd, btn_pressed, touch_num);
 }
 
 static int goodix_berlin_request_handle_reset(struct goodix_berlin_core *cd)
@@ -519,9 +667,9 @@ static irqreturn_t goodix_berlin_irq(int irq, void *data)
 	int error;
 
 	/*
-	 * First, read buffer with space for 2 touch events:
+	 * First, read buffer with space for 2 touch events / 1 stylus event:
 	 * - GOODIX_BERLIN_HEADER_SIZE = 8 bytes
-	 * - GOODIX_BERLIN_TOUCH_SIZE * 2 = 16 bytes
+	 * - GOODIX_BERLIN_TOUCH_SIZE * 2 = GOODIX_BERLIN_STYLUS_SIZE = 16 bytes
 	 * - GOODIX_BERLIN_CHECKLSUM_SIZE = 2 bytes
 	 * For a total of 26 bytes.
 	 *
@@ -532,6 +680,12 @@ static irqreturn_t goodix_berlin_irq(int irq, void *data)
 	 * - bytes 24-25: Checksum
 	 * - bytes 18-25: Unused 8 bytes
 	 *
+	 * If only a stylus is reported
+	 * - bytes 0-7:   Header (GOODIX_BERLIN_HEADER_SIZE)
+	 * - bytes 8-19:  Stylus Data
+	 * - bytes 20-23: Unused 4 bytes
+	 * - bytes 24-25: Checksum
+	 *
 	 * If 2 fingers are reported, we would have read the exact needed
 	 * amount of data and checksum would be at the end of the buffer:
 	 * - bytes 0-7:   Header (GOODIX_BERLIN_HEADER_SIZE)
@@ -601,6 +755,58 @@ static irqreturn_t goodix_berlin_irq(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
+static int goodix_berlin_stylus_dev_config(struct goodix_berlin_core *cd,
+					   const struct input_id *id)
+{
+	struct device_node *np = cd->dev->of_node;
+	struct input_dev *stylus_dev;
+	int i, width, height, pressure;
+
+	if (!of_property_read_bool(np, "goodix,stylus-enable"))
+		return 0;
+
+	if (of_property_read_u32(np, "goodix,physical-x", &width))
+		width = cd->props.max_x / 10;
+
+	if (of_property_read_u32(np, "goodix,physical-y", &height))
+		height = cd->props.max_y / 10;
+
+	if (of_property_read_u32(np, "goodix,stylus-pressure-level", &pressure))
+		pressure = 4096;
+
+	stylus_dev = devm_input_allocate_device(cd->dev);
+	if (!stylus_dev)
+		return -ENOMEM;
+
+	cd->stylus_dev = stylus_dev;
+	input_set_drvdata(stylus_dev, cd);
+
+	stylus_dev->name = "Goodix Berlin Stylus";
+	stylus_dev->phys = "input/stylus";
+	stylus_dev->id = *id;
+
+	input_set_capability(stylus_dev, EV_KEY, BTN_TOUCH);
+	input_set_capability(stylus_dev, EV_KEY, BTN_TOOL_PEN);
+	for (i = 0; i < GOODIX_BERLIN_MAX_STYLUS_BTN; i++)
+		input_set_capability(stylus_dev, EV_KEY, stylus_btn[i]);
+	__set_bit(INPUT_PROP_DIRECT, stylus_dev->propbit);
+
+	input_set_abs_params(stylus_dev, ABS_X, 0, cd->props.max_x, 0, 0);
+	input_set_abs_params(stylus_dev, ABS_Y, 0, cd->props.max_y, 0, 0);
+	input_abs_set_res(stylus_dev, ABS_X, cd->props.max_x / width);
+	input_abs_set_res(stylus_dev, ABS_Y, cd->props.max_y / height);
+	input_set_abs_params(stylus_dev, ABS_PRESSURE, 0, pressure - 1, 0, 0);
+	input_set_abs_params(stylus_dev, ABS_DISTANCE, 0, 255, 0, 0);
+	input_set_abs_params(stylus_dev, ABS_TILT_X,
+			     -GOODIX_BERLIN_STYLUS_MAX_TILT,
+			     GOODIX_BERLIN_STYLUS_MAX_TILT, 0, 0);
+	input_set_abs_params(stylus_dev, ABS_TILT_Y,
+			     -GOODIX_BERLIN_STYLUS_MAX_TILT,
+			     GOODIX_BERLIN_STYLUS_MAX_TILT, 0, 0);
+
+	return input_register_device(stylus_dev);
+}
+
 static int goodix_berlin_input_dev_config(struct goodix_berlin_core *cd,
 					  const struct input_id *id)
 {
@@ -780,6 +986,12 @@ int goodix_berlin_probe(struct device *dev, int irq, const struct input_id *id,
 		return error;
 	}
 
+	error = goodix_berlin_stylus_dev_config(cd, id);
+	if (error) {
+		dev_err(dev, "failed set stylus device");
+		return error;
+	}
+
 	error = devm_request_threaded_irq(dev, cd->irq, NULL, goodix_berlin_irq,
 					  IRQF_ONESHOT, "goodix-berlin", cd);
 	if (error) {
-- 
2.49.0


