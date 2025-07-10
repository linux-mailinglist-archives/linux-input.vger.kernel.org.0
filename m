Return-Path: <linux-input+bounces-13461-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D2FE6B00128
	for <lists+linux-input@lfdr.de>; Thu, 10 Jul 2025 14:04:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CC87C7BCDFB
	for <lists+linux-input@lfdr.de>; Thu, 10 Jul 2025 11:58:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D0EE26B085;
	Thu, 10 Jul 2025 11:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VWUePCBB"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E2D424DD1B;
	Thu, 10 Jul 2025 11:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752148737; cv=none; b=oYBsoP0+ZZaC9c8iCf8EJDfWvaULYvKMlOWKKd3eFxX8sx5ZRGLYGAnM1YRTlvXrc5lEVvfB9dlEKv2u1hfZm1MGFpB8yKH3Rl8YeDLBJznHqoMD/WyqzMTiSozAWSs0IJGyK9JrCH4stydJGeFigHumjdm+SCbleckAvxNDq7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752148737; c=relaxed/simple;
	bh=5d6+cGB7AD5jTJGkLZMBX1UYVDPQT6OtsTorEQrUkjk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NPOfECGAlEcTfaqGOF9WRDIWRPSAEofBjJLuq/bXWOz9aQyfB43CHD5bCA0sLA/H9KgbWvgS+ph3Db6dZeQFuqnH9wpNm/MTPdLRhiXPtPHjhdkMw/OMqD/nEwg83wNn0IMsZTWjYVEHGYhYfcbIs8z7hB8aZ5wBBokYhkrFGVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VWUePCBB; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-b31e0ead80eso793722a12.0;
        Thu, 10 Jul 2025 04:58:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752148735; x=1752753535; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hINQvQll1nQh6dNWR+VH7z/9Rzj53yLIH9OcHDqPxJo=;
        b=VWUePCBBGKloR5VsJ/B+i6P0E0s3vwKi0OwqmMpMYgahpxIHcsm6oyvgnOpb/vyTmM
         oyEzEKNa0Siyeq3lz18hz0qVnoJojm7ClRI0JXF4TIG3ntFsml5c7uaW8KhUSp16Q4ll
         Hfpa/ta0+JhvBbAwnYIycGYZdB0/qz6qJekGeBWV0YRXiGO8dTcAxTUnjry83N+4h+7c
         o48N2q+6erof6NneclAj6ZZZ100BcHBNH1T+eUFLkxZ50sMgPygSuj4lbQSgmYe0WGxD
         cjw/2xZzUUcVGZH3vl6JOKDV0EHmY42hUSBwW6g7PbsoDgKG1/yc6DNlENOSwbAkxcVd
         68Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752148735; x=1752753535;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hINQvQll1nQh6dNWR+VH7z/9Rzj53yLIH9OcHDqPxJo=;
        b=NbsaeD8z6d3/Cwfa74exzabt9GhrlLIwWqXP1OTFOMYxqNHaRnUy7godrErBywGRql
         ID1XaNpMhd9o88asrYGe2eg4YBriZkekvuO4HL2VUChzh9gYIWOIuv+umo+Qdylr9e4B
         8wdZnT7Yener9cySr7csinBJzQdkQ+ZNBWEXZn6HPpzDb9m45k8B49gR2/2l9OC/OvwR
         YMUFBRMZNGjXQWXHQ8+nsG1YkoOzliweD2/qKkyIBrmORUxtWB+dEbox0AG9AX9lrbGB
         gWWtHZ7STCDtSxI9vML+9TvDwTwgQRYv3m2lf35usYbLny+6PnCABsf1GMIAeN0dy2Vf
         eGSQ==
X-Forwarded-Encrypted: i=1; AJvYcCVpO2lr9vx9iShTwF96f4yWiYDDrBRGzxKhIBBfj85VSHrY41zcO3GVYLSeJ+FbXFt6KiaaXitTsnIS@vger.kernel.org, AJvYcCWHX/czgziw9itykSEq0r0ZrFuvWADWCQOsTOdtqIZQxfmzaaj86yHKo5WrnLNZnS1VF+bKqqpNLSecac8=@vger.kernel.org, AJvYcCWiObCdPMdLqGXSRt5TYYPX0doqm3R+vswDq5O7YYMdh+xIiqdP02HCyr0yuOqL62ccqcYf3uXUeBB0Qodc@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1pzG91sp9toFB/srXnr9qb5F4B0TzSvA67ZlAUKzhj2eIQPrO
	Je8HsflNPNwGiBTzK49v59rPEiZPvR/25u+xHig2+8qOajkrD7PxMsvw
X-Gm-Gg: ASbGncsXWtzUu/NPycFniyi7pSeTNDDgBCsdHXQalpeid3y1f7+BI0t5fI3ElR7Uy9U
	HHx97jtqgOEdF0PpCJGr7C2HfK/K6slrhaY0JXX0UHZTH/KtipHl86jKudiKJtxPk6PKZtjO8Zx
	Gikjx5D1UxrnmIPMt3Ksl/6+chzm3Do5N32hLf0KUJ8rUTe5NNViJ5WTTeYTRoFf12T6EsNlwfE
	2QFSNumDN/0fnBKRnGkWlFhbkUm//SKycNkuTMEeqtPZDjAM056Vv5gzlLUmc0EPAKTzy0phuGe
	8Lpqou3vvKgaUMFiy5vdVQOTKabE1KDZ0YCZgoKxKl6P7iAgkm4+Hejk1of7ivc=
X-Google-Smtp-Source: AGHT+IHGYgjDVq1/eXtFbxAxKuS0szFlayI4U0sU8I+dc9gSvxv1VEAXwksKt9r1rqd7SLjemeywCA==
X-Received: by 2002:a17:903:3203:b0:235:f298:cbbe with SMTP id d9443c01a7336-23ddb1b5d8dmr115777995ad.12.1752148735112;
        Thu, 10 Jul 2025 04:58:55 -0700 (PDT)
Received: from nuvole.lan ([144.202.86.13])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de4284732sm18510685ad.10.2025.07.10.04.58.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 04:58:54 -0700 (PDT)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
	Len Brown <len.brown@intel.com>,
	Ingo Molnar <mingo@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Luke Jones <luke@ljones.dev>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Eric Biggers <ebiggers@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: Charles Wang <charles.goodix@gmail.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Pengyu Luo <mitltlatltl@gmail.com>
Subject: [PATCH v2 2/2] input: touchscreen: goodix_berlin: Add stylus support
Date: Thu, 10 Jul 2025 19:57:33 +0800
Message-ID: <20250710115733.226670-3-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250710115733.226670-1-mitltlatltl@gmail.com>
References: <20250710115733.226670-1-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch introduces a new input device dedicated to stylus reporting,
allowing handling of stylus-specific data such as pressure, tilt, and
side buttons. The implementation distinguishes between touch and stylus
events and ensures that the appropriate input device reports each event.

Key changes include:
- New event type tracking to differentiate between finger and stylus input.
- A new `struct goodix_berlin_stylus` to represent stylus data layout.
- Support for stylus pressure, tilt (X/Y), and button states (BTN_STYLUS, BTN_STYLUS2).
- Switching between input devices when changing from touch to stylus events.

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
 .../input/touchscreen/goodix_berlin_core.c    | 240 ++++++++++++++++--
 1 file changed, 222 insertions(+), 18 deletions(-)

diff --git a/drivers/input/touchscreen/goodix_berlin_core.c b/drivers/input/touchscreen/goodix_berlin_core.c
index c78d512d9..74cd31878 100644
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
@@ -432,24 +462,17 @@ static int goodix_berlin_get_remaining_contacts(struct goodix_berlin_core *cd,
 	return 0;
 }
 
-static void goodix_berlin_report_state(struct goodix_berlin_core *cd, int n)
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
@@ -470,10 +493,118 @@ static void goodix_berlin_report_state(struct goodix_berlin_core *cd, int n)
 	input_sync(cd->input_dev);
 }
 
+static void goodix_berlin_stylus_report(struct goodix_berlin_core *cd,
+					u8 btn_pressed, bool down)
+{
+	struct goodix_berlin_stylus *s =
+	(struct goodix_berlin_stylus *)cd->event.data;
+
+	struct input_dev *dev = cd->stylus_dev;
+	s8 tilt_x, tilt_y;
+	int i;
+
+	if (!dev)
+		return;
+
+	input_report_key(dev, BTN_TOUCH, down);
+	input_report_key(dev, BTN_TOOL_PEN, down);
+
+	if (!down)
+		goto key_report;
+
+	tilt_x = (s8)(le16_to_cpu(s->x_angle) / 100);
+	tilt_y = (s8)(le16_to_cpu(s->y_angle) / 100);
+
+	touchscreen_report_pos(dev, &cd->props, le16_to_cpu(s->x),
+			       le16_to_cpu(s->y), false);
+
+	input_report_abs(dev, ABS_PRESSURE, le16_to_cpu(s->p));
+	input_report_abs(dev, ABS_DISTANCE, !le16_to_cpu(s->p));
+	input_report_abs(dev, ABS_TILT_X, tilt_x);
+	input_report_abs(dev, ABS_TILT_Y, tilt_y);
+
+	dev_dbg(&dev->dev, "stylus: x: %d, y: %d, pressure: %d, tilt_x: %d tilt_y: %d, btn: %d",
+		le16_to_cpu(s->x), le16_to_cpu(s->y), le16_to_cpu(s->p), tilt_x,
+		tilt_y, btn_pressed);
+
+key_report:
+	for (i = 0; i < GOODIX_BERLIN_MAX_STYLUS_BTN; i++)
+		input_report_key(dev, stylus_btn[i],
+				 !!(btn_pressed & (1 << i)));
+
+	input_sync(dev);
+}
+
+static inline void goodix_berlin_device_switch(struct goodix_berlin_core *cd)
+{
+	switch (cd->last_event) {
+	case EVENT_STYLUS:
+		goodix_berlin_stylus_report(cd, 0, false);
+		break;
+	case EVENT_TOUCH:
+		goodix_berlin_mt_report(cd, 0);
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
+	if (likely(cd->last_event != EVENT_NONE) && cd->last_event != cd->cur_event)
+		goodix_berlin_device_switch(cd);
+
+	switch (cd->cur_event) {
+	case EVENT_STYLUS:
+		goodix_berlin_stylus_report(cd, btn_pressed, true);
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
+static inline void goodix_berlin_event_update(struct goodix_berlin_core *cd,
+					      int touch_num)
+{
+	struct goodix_berlin_touch *touch_data =
+			(struct goodix_berlin_touch *)cd->event.data;
+
+	u8 type;
+
+	cd->last_event = cd->cur_event;
+	type = FIELD_GET(GOODIX_BERLIN_POINT_TYPE_MASK, touch_data->status);
+	if (touch_num && (type == GOODIX_BERLIN_POINT_TYPE_STYLUS ||
+			  type == GOODIX_BERLIN_POINT_TYPE_STYLUS_HOVER))
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
@@ -489,9 +620,11 @@ static void goodix_berlin_touch_handler(struct goodix_berlin_core *cd)
 			return;
 	}
 
+	goodix_berlin_event_update(cd, touch_num);
+
 	if (touch_num) {
-		int len = touch_num * GOODIX_BERLIN_TOUCH_SIZE +
-			  GOODIX_BERLIN_CHECKSUM_SIZE;
+		len = goodix_berlin_event_len(cd, touch_num);
+
 		if (!goodix_berlin_checksum_valid(cd->event.data, len)) {
 			dev_err(cd->dev, "touch data checksum error: %*ph\n",
 				len, cd->event.data);
@@ -499,7 +632,10 @@ static void goodix_berlin_touch_handler(struct goodix_berlin_core *cd)
 		}
 	}
 
-	goodix_berlin_report_state(cd, touch_num);
+	btn_pressed = FIELD_GET(GOODIX_BERLIN_STYLUS_BTN_MASK,
+				cd->event.hdr.stylus_btn);
+
+	goodix_berlin_report_state(cd, btn_pressed, touch_num);
 }
 
 static int goodix_berlin_request_handle_reset(struct goodix_berlin_core *cd)
@@ -519,9 +655,9 @@ static irqreturn_t goodix_berlin_irq(int irq, void *data)
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
@@ -532,6 +668,12 @@ static irqreturn_t goodix_berlin_irq(int irq, void *data)
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
@@ -601,6 +743,62 @@ static irqreturn_t goodix_berlin_irq(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
+static int goodix_berlin_stylus_dev_config(struct goodix_berlin_core *cd,
+					   const struct input_id *id)
+{
+	struct device_node *np = cd->dev->of_node;
+	struct input_dev *stylus_dev;
+	int i, width, height, p_lvl;
+
+	if (!of_property_read_bool(np, "goodix,stylus-enable"))
+		return 0;
+
+	/*
+	 * If no value is provided, then setting the default to 10 units/mm
+	 * just like drivers/input/touchscreen/goodix.c
+	 */
+	if (of_property_read_u32(np, "touchscreen-x-mm", &width))
+		width = cd->props.max_x / 10;
+
+	if (of_property_read_u32(np, "touchscreen-y-mm", &height))
+		height = cd->props.max_y / 10;
+
+	if (of_property_read_u32(np, "goodix,stylus-pressure-level", &p_lvl))
+		p_lvl = 4096;
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
+	input_set_abs_params(stylus_dev, ABS_PRESSURE, 0, p_lvl - 1, 0, 0);
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
@@ -780,6 +978,12 @@ int goodix_berlin_probe(struct device *dev, int irq, const struct input_id *id,
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
2.50.0


