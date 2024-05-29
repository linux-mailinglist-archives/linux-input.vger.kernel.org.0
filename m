Return-Path: <linux-input+bounces-3943-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 97E438D3396
	for <lists+linux-input@lfdr.de>; Wed, 29 May 2024 11:49:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8F1B51C22874
	for <lists+linux-input@lfdr.de>; Wed, 29 May 2024 09:49:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 392D816EC12;
	Wed, 29 May 2024 09:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VxHlf6Ca"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F73116EBF2;
	Wed, 29 May 2024 09:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716976102; cv=none; b=IHmoijwPquarj6QNmTnVIfmvl1LcYoET0DFgwRR+tGXHO0GcuubgCOk5BL2vesz5mOP/rcJ6TF8RO9ePxa9sGt7zRo/yc/xCWQ7Nsg0LDbP+5yEy3NUAt/Kag/S17iT5fUwXUi10bm09+yis8VZLn2NERLatxUSRU3dRmtDlopM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716976102; c=relaxed/simple;
	bh=kZ74HGSw/ZLoeBlbkmNWDrz3gQ2DhvypIlvMdAhkZ+M=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=YL3AcB/3glaLcyMPZ1C+MJmrRAjvLWR0PaLtYnWIVxiEnt5b8c9WeBdSwCtgLoDnJJSFJA39A3u8U5oJ4OkJL7DBxMhVJoZoH1n4Ahx6fTJalk+I6hhM00/JswbdsrJKrDRjGUs420jmvftTFDfTihUaMo0NLl/thtILZZ8oOVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VxHlf6Ca; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66E0EC2BD10;
	Wed, 29 May 2024 09:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716976101;
	bh=kZ74HGSw/ZLoeBlbkmNWDrz3gQ2DhvypIlvMdAhkZ+M=;
	h=From:To:Cc:Subject:Date:From;
	b=VxHlf6CaetgSh5NzXLSEhK1fbzJTLm0ywjtb0Ji/n3zQDYeCplqNeyK705qDM7iYC
	 gN5B0iLLhmkuZilnpm6O8RumnDYB4jpzQ2hhAfo6suip753xgoeM3nTHtBiqe0OIeq
	 V/O9Y7AexJHyv7V4qos8/R6jpMwt8cHPkSnYeigJ5cap30sAbzirfHEz81uLtqKzCd
	 BIOJ3tkyLaX99vQBdwLpzrl46mtYUapGL55dQ33wN1qaZl/fv716sXejyESHaAvxkS
	 /F4ZuGvzuAqMmPlEkJ4eGdSO2B4XnChCw1Wbpizd7Vc+EM+IQjflTMVcSybuxiHLJc
	 mLkT7z4JjYHAw==
From: Arnd Bergmann <arnd@kernel.org>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Rahul Rameshbabu <rrameshbabu@nvidia.com>,
	Fabio Baltieri <fabiobaltieri@chromium.org>,
	Ivan Gorinov <linux-kernel@altimeter.info>,
	Johannes Roith <johannes@gnu-linux.rocks>,
	=?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] HID: uclogic: avoid linking common code into multiple modules
Date: Wed, 29 May 2024 11:48:05 +0200
Message-Id: <20240529094816.1859073-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

The hid-uclogic-params.o and hid-uclogic-rdesc.o files are linked
into both the driver module and the unit test, which triggers a
W=1 warning:

scripts/Makefile.build:236: drivers/hid/Makefile: hid-uclogic-rdesc.o is added to multiple modules: hid-uclogic hid-uclogic-test
scripts/Makefile.build:236: drivers/hid/Makefile: hid-uclogic-params.o is added to multiple modules: hid-uclogic hid-uclogic-test

Avoids this by moving these two files into a separate module
that is used by the driver and the unit test.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
I have made patches for all such warnings in the tree, this is one I'm not
sure about, maybe there is a better fix.
---
 drivers/hid/Makefile             | 12 ++----
 drivers/hid/hid-uclogic-params.c |  8 ++++
 drivers/hid/hid-uclogic-rdesc.c  | 72 ++++++++++++++++++++++++++++++++
 3 files changed, 84 insertions(+), 8 deletions(-)

diff --git a/drivers/hid/Makefile b/drivers/hid/Makefile
index ce71b53ea6c5..864dfbae8ace 100644
--- a/drivers/hid/Makefile
+++ b/drivers/hid/Makefile
@@ -133,10 +133,8 @@ obj-$(CONFIG_HID_TOPSEED)	+= hid-topseed.o
 obj-$(CONFIG_HID_TOPRE)	+= hid-topre.o
 obj-$(CONFIG_HID_TWINHAN)	+= hid-twinhan.o
 obj-$(CONFIG_HID_U2FZERO)	+= hid-u2fzero.o
-hid-uclogic-objs		:= hid-uclogic-core.o \
-				   hid-uclogic-rdesc.o \
-				   hid-uclogic-params.o
-obj-$(CONFIG_HID_UCLOGIC)	+= hid-uclogic.o
+hid-uclogic-objs		:= hid-uclogic-core.o
+obj-$(CONFIG_HID_UCLOGIC)	+= hid-uclogic.o hid-uclogic-rdesc.o hid-uclogic-params.o
 obj-$(CONFIG_HID_UDRAW_PS3)	+= hid-udraw-ps3.o
 obj-$(CONFIG_HID_LED)		+= hid-led.o
 obj-$(CONFIG_HID_XIAOMI)	+= hid-xiaomi.o
@@ -154,10 +152,8 @@ obj-$(CONFIG_HID_WINWING)	+= hid-winwing.o
 obj-$(CONFIG_HID_SENSOR_HUB)	+= hid-sensor-hub.o
 obj-$(CONFIG_HID_SENSOR_CUSTOM_SENSOR)	+= hid-sensor-custom.o
 
-hid-uclogic-test-objs		:= hid-uclogic-rdesc.o \
-				   hid-uclogic-params.o \
-				   hid-uclogic-rdesc-test.o
-obj-$(CONFIG_HID_KUNIT_TEST)	+= hid-uclogic-test.o
+hid-uclogic-test-objs		:= hid-uclogic-rdesc-test.o
+obj-$(CONFIG_HID_KUNIT_TEST)	+= hid-uclogic-test.o hid-uclogic-params.o hid-uclogic-params.o
 
 obj-$(CONFIG_USB_HID)		+= usbhid/
 obj-$(CONFIG_USB_MOUSE)		+= usbhid/
diff --git a/drivers/hid/hid-uclogic-params.c b/drivers/hid/hid-uclogic-params.c
index 5bab006ec165..97ae7e4f61e1 100644
--- a/drivers/hid/hid-uclogic-params.c
+++ b/drivers/hid/hid-uclogic-params.c
@@ -133,6 +133,7 @@ void uclogic_params_hid_dbg(const struct hid_device *hdev,
 	}
 	hid_dbg(hdev, "}\n");
 }
+EXPORT_SYMBOL_GPL(uclogic_params_hid_dbg);
 
 /**
  * uclogic_params_get_str_desc - retrieve a string descriptor from a HID
@@ -660,6 +661,7 @@ void uclogic_params_cleanup(struct uclogic_params *params)
 		memset(params, 0, sizeof(*params));
 	}
 }
+EXPORT_SYMBOL_GPL(uclogic_params_cleanup);
 
 /**
  * uclogic_params_get_desc() - Get a replacement report descriptor for a
@@ -732,6 +734,7 @@ int uclogic_params_get_desc(const struct uclogic_params *params,
 	kfree(desc);
 	return rc;
 }
+EXPORT_SYMBOL_GPL(uclogic_params_get_desc);
 
 /**
  * uclogic_params_init_invalid() - initialize tablet interface parameters,
@@ -1859,7 +1862,12 @@ int uclogic_params_init(struct uclogic_params *params,
 	uclogic_params_cleanup(&p);
 	return rc;
 }
+EXPORT_SYMBOL_GPL(uclogic_params_init);
 
 #ifdef CONFIG_HID_KUNIT_TEST
 #include "hid-uclogic-params-test.c"
 #endif
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Nikolai Kondrashov");
+MODULE_DESCRIPTION("HID driver for UC-Logic devices tablet initialization and parameter retrieval");
diff --git a/drivers/hid/hid-uclogic-rdesc.c b/drivers/hid/hid-uclogic-rdesc.c
index b6dfdf6356a6..d4f1ee79e0a1 100644
--- a/drivers/hid/hid-uclogic-rdesc.c
+++ b/drivers/hid/hid-uclogic-rdesc.c
@@ -59,9 +59,11 @@ __u8 uclogic_rdesc_wp4030u_fixed_arr[] = {
 	0xC0,               /*      End Collection,                 */
 	0xC0                /*  End Collection                      */
 };
+EXPORT_SYMBOL_GPL(uclogic_rdesc_wp4030u_fixed_arr);
 
 const size_t uclogic_rdesc_wp4030u_fixed_size =
 			sizeof(uclogic_rdesc_wp4030u_fixed_arr);
+EXPORT_SYMBOL_GPL(uclogic_rdesc_wp4030u_fixed_size);
 
 /* Fixed WP5540U report descriptor */
 __u8 uclogic_rdesc_wp5540u_fixed_arr[] = {
@@ -136,9 +138,11 @@ __u8 uclogic_rdesc_wp5540u_fixed_arr[] = {
 	0xC0,               /*      End Collection,                 */
 	0xC0                /*  End Collection                      */
 };
+EXPORT_SYMBOL_GPL(uclogic_rdesc_wp5540u_fixed_arr);
 
 const size_t uclogic_rdesc_wp5540u_fixed_size =
 			sizeof(uclogic_rdesc_wp5540u_fixed_arr);
+EXPORT_SYMBOL_GPL(uclogic_rdesc_wp5540u_fixed_size);
 
 /* Fixed WP8060U report descriptor */
 __u8 uclogic_rdesc_wp8060u_fixed_arr[] = {
@@ -213,9 +217,11 @@ __u8 uclogic_rdesc_wp8060u_fixed_arr[] = {
 	0xC0,               /*      End Collection,                 */
 	0xC0                /*  End Collection                      */
 };
+EXPORT_SYMBOL_GPL(uclogic_rdesc_wp8060u_fixed_arr);
 
 const size_t uclogic_rdesc_wp8060u_fixed_size =
 			sizeof(uclogic_rdesc_wp8060u_fixed_arr);
+EXPORT_SYMBOL_GPL(uclogic_rdesc_wp8060u_fixed_size);
 
 /* Fixed WP1062 report descriptor */
 __u8 uclogic_rdesc_wp1062_fixed_arr[] = {
@@ -261,9 +267,11 @@ __u8 uclogic_rdesc_wp1062_fixed_arr[] = {
 	0xC0,               /*      End Collection,                 */
 	0xC0                /*  End Collection                      */
 };
+EXPORT_SYMBOL_GPL(uclogic_rdesc_wp1062_fixed_arr);
 
 const size_t uclogic_rdesc_wp1062_fixed_size =
 			sizeof(uclogic_rdesc_wp1062_fixed_arr);
+EXPORT_SYMBOL_GPL(uclogic_rdesc_wp1062_fixed_size);
 
 /* Fixed PF1209 report descriptor */
 __u8 uclogic_rdesc_pf1209_fixed_arr[] = {
@@ -338,9 +346,11 @@ __u8 uclogic_rdesc_pf1209_fixed_arr[] = {
 	0xC0,               /*      End Collection,                 */
 	0xC0                /*  End Collection                      */
 };
+EXPORT_SYMBOL_GPL(uclogic_rdesc_pf1209_fixed_arr);
 
 const size_t uclogic_rdesc_pf1209_fixed_size =
 			sizeof(uclogic_rdesc_pf1209_fixed_arr);
+EXPORT_SYMBOL_GPL(uclogic_rdesc_pf1209_fixed_size);
 
 /* Fixed PID 0522 tablet report descriptor, interface 0 (stylus) */
 __u8 uclogic_rdesc_twhl850_fixed0_arr[] = {
@@ -384,9 +394,11 @@ __u8 uclogic_rdesc_twhl850_fixed0_arr[] = {
 	0xC0,               /*      End Collection,                 */
 	0xC0                /*  End Collection                      */
 };
+EXPORT_SYMBOL_GPL(uclogic_rdesc_twhl850_fixed0_arr);
 
 const size_t uclogic_rdesc_twhl850_fixed0_size =
 			sizeof(uclogic_rdesc_twhl850_fixed0_arr);
+EXPORT_SYMBOL_GPL(uclogic_rdesc_twhl850_fixed0_size);
 
 /* Fixed PID 0522 tablet report descriptor, interface 1 (mouse) */
 __u8 uclogic_rdesc_twhl850_fixed1_arr[] = {
@@ -424,9 +436,11 @@ __u8 uclogic_rdesc_twhl850_fixed1_arr[] = {
 	0xC0,               /*      End Collection,                 */
 	0xC0                /*  End Collection                      */
 };
+EXPORT_SYMBOL_GPL(uclogic_rdesc_twhl850_fixed1_arr);
 
 const size_t uclogic_rdesc_twhl850_fixed1_size =
 			sizeof(uclogic_rdesc_twhl850_fixed1_arr);
+EXPORT_SYMBOL_GPL(uclogic_rdesc_twhl850_fixed1_size);
 
 /* Fixed PID 0522 tablet report descriptor, interface 2 (frame buttons) */
 __u8 uclogic_rdesc_twhl850_fixed2_arr[] = {
@@ -450,9 +464,11 @@ __u8 uclogic_rdesc_twhl850_fixed2_arr[] = {
 	0x80,               /*      Input,                          */
 	0xC0                /*  End Collection                      */
 };
+EXPORT_SYMBOL_GPL(uclogic_rdesc_twhl850_fixed2_arr);
 
 const size_t uclogic_rdesc_twhl850_fixed2_size =
 			sizeof(uclogic_rdesc_twhl850_fixed2_arr);
+EXPORT_SYMBOL_GPL(uclogic_rdesc_twhl850_fixed2_size);
 
 /* Fixed TWHA60 report descriptor, interface 0 (stylus) */
 __u8 uclogic_rdesc_twha60_fixed0_arr[] = {
@@ -499,9 +515,11 @@ __u8 uclogic_rdesc_twha60_fixed0_arr[] = {
 	0xC0,               /*      End Collection,                 */
 	0xC0                /*  End Collection                      */
 };
+EXPORT_SYMBOL_GPL(uclogic_rdesc_twha60_fixed0_arr);
 
 const size_t uclogic_rdesc_twha60_fixed0_size =
 			sizeof(uclogic_rdesc_twha60_fixed0_arr);
+EXPORT_SYMBOL_GPL(uclogic_rdesc_twha60_fixed0_size);
 
 /* Fixed TWHA60 report descriptor, interface 1 (frame buttons) */
 __u8 uclogic_rdesc_twha60_fixed1_arr[] = {
@@ -527,9 +545,11 @@ __u8 uclogic_rdesc_twha60_fixed1_arr[] = {
 	0x81, 0x01, /*      Input (Constant),       */
 	0xC0        /*  End Collection              */
 };
+EXPORT_SYMBOL_GPL(uclogic_rdesc_twha60_fixed1_arr);
 
 const size_t uclogic_rdesc_twha60_fixed1_size =
 			sizeof(uclogic_rdesc_twha60_fixed1_arr);
+EXPORT_SYMBOL_GPL(uclogic_rdesc_twha60_fixed1_size);
 
 /* Fixed report descriptor template for (tweaked) v1 pen reports */
 const __u8 uclogic_rdesc_v1_pen_template_arr[] = {
@@ -581,9 +601,11 @@ const __u8 uclogic_rdesc_v1_pen_template_arr[] = {
 	0xC0,                   /*      End Collection,                     */
 	0xC0                    /*  End Collection                          */
 };
+EXPORT_SYMBOL_GPL(uclogic_rdesc_v1_pen_template_arr);
 
 const size_t uclogic_rdesc_v1_pen_template_size =
 			sizeof(uclogic_rdesc_v1_pen_template_arr);
+EXPORT_SYMBOL_GPL(uclogic_rdesc_v1_pen_template_size);
 
 /* Fixed report descriptor template for (tweaked) v2 pen reports */
 const __u8 uclogic_rdesc_v2_pen_template_arr[] = {
@@ -647,9 +669,11 @@ const __u8 uclogic_rdesc_v2_pen_template_arr[] = {
 	0xC0,                   /*      End Collection,                     */
 	0xC0                    /*  End Collection                          */
 };
+EXPORT_SYMBOL_GPL(uclogic_rdesc_v2_pen_template_arr);
 
 const size_t uclogic_rdesc_v2_pen_template_size =
 			sizeof(uclogic_rdesc_v2_pen_template_arr);
+EXPORT_SYMBOL_GPL(uclogic_rdesc_v2_pen_template_size);
 
 /*
  * Expand to the contents of a generic frame buttons report descriptor.
@@ -702,16 +726,22 @@ const size_t uclogic_rdesc_v2_pen_template_size =
 const __u8 uclogic_rdesc_v1_frame_arr[] = {
 	UCLOGIC_RDESC_FRAME_BUTTONS_BYTES(UCLOGIC_RDESC_V1_FRAME_ID, 8)
 };
+EXPORT_SYMBOL_GPL(uclogic_rdesc_v1_frame_arr);
+
 const size_t uclogic_rdesc_v1_frame_size =
 			sizeof(uclogic_rdesc_v1_frame_arr);
+EXPORT_SYMBOL_GPL(uclogic_rdesc_v1_frame_size);
 
 /* Fixed report descriptor for (tweaked) v2 frame button reports */
 const __u8 uclogic_rdesc_v2_frame_buttons_arr[] = {
 	UCLOGIC_RDESC_FRAME_BUTTONS_BYTES(UCLOGIC_RDESC_V2_FRAME_BUTTONS_ID,
 					  12)
 };
+EXPORT_SYMBOL_GPL(uclogic_rdesc_v2_frame_buttons_arr);
+
 const size_t uclogic_rdesc_v2_frame_buttons_size =
 			sizeof(uclogic_rdesc_v2_frame_buttons_arr);
+EXPORT_SYMBOL_GPL(uclogic_rdesc_v2_frame_buttons_size);
 
 /* Fixed report descriptor for (tweaked) v2 frame touch ring reports */
 const __u8 uclogic_rdesc_v2_frame_touch_ring_arr[] = {
@@ -758,8 +788,11 @@ const __u8 uclogic_rdesc_v2_frame_touch_ring_arr[] = {
 	0xC0,               /*      End Collection,                 */
 	0xC0                /*  End Collection                      */
 };
+EXPORT_SYMBOL_GPL(uclogic_rdesc_v2_frame_touch_ring_arr);
+
 const size_t uclogic_rdesc_v2_frame_touch_ring_size =
 			sizeof(uclogic_rdesc_v2_frame_touch_ring_arr);
+EXPORT_SYMBOL_GPL(uclogic_rdesc_v2_frame_touch_ring_size);
 
 /* Fixed report descriptor for (tweaked) v2 frame touch strip reports */
 const __u8 uclogic_rdesc_v2_frame_touch_strip_arr[] = {
@@ -806,8 +839,11 @@ const __u8 uclogic_rdesc_v2_frame_touch_strip_arr[] = {
 	0xC0,               /*      End Collection,                 */
 	0xC0                /*  End Collection                      */
 };
+EXPORT_SYMBOL_GPL(uclogic_rdesc_v2_frame_touch_strip_arr);
+
 const size_t uclogic_rdesc_v2_frame_touch_strip_size =
 			sizeof(uclogic_rdesc_v2_frame_touch_strip_arr);
+EXPORT_SYMBOL_GPL(uclogic_rdesc_v2_frame_touch_strip_size);
 
 /* Fixed report descriptor for (tweaked) v2 frame dial reports */
 const __u8 uclogic_rdesc_v2_frame_dial_arr[] = {
@@ -856,14 +892,22 @@ const __u8 uclogic_rdesc_v2_frame_dial_arr[] = {
 	0xC0,               /*      End Collection,                 */
 	0xC0                /*  End Collection                      */
 };
+EXPORT_SYMBOL_GPL(uclogic_rdesc_v2_frame_dial_arr);
+
 const size_t uclogic_rdesc_v2_frame_dial_size =
 			sizeof(uclogic_rdesc_v2_frame_dial_arr);
+EXPORT_SYMBOL_GPL(uclogic_rdesc_v2_frame_dial_size);
 
 const __u8 uclogic_ugee_v2_probe_arr[] = {
 	0x02, 0xb0, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
 };
+EXPORT_SYMBOL_GPL(uclogic_ugee_v2_probe_arr);
+
 const size_t uclogic_ugee_v2_probe_size = sizeof(uclogic_ugee_v2_probe_arr);
+EXPORT_SYMBOL_GPL(uclogic_ugee_v2_probe_size);
+
 const int uclogic_ugee_v2_probe_endpoint = 0x03;
+EXPORT_SYMBOL_GPL(uclogic_ugee_v2_probe_endpoint);
 
 /* Fixed report descriptor template for UGEE v2 pen reports */
 const __u8 uclogic_rdesc_ugee_v2_pen_template_arr[] = {
@@ -935,8 +979,11 @@ const __u8 uclogic_rdesc_ugee_v2_pen_template_arr[] = {
 	0xc0,               /*      End Collection,                     */
 	0xc0,               /*  End Collection                          */
 };
+EXPORT_SYMBOL_GPL(uclogic_rdesc_ugee_v2_pen_template_arr);
+
 const size_t uclogic_rdesc_ugee_v2_pen_template_size =
 			sizeof(uclogic_rdesc_ugee_v2_pen_template_arr);
+EXPORT_SYMBOL_GPL(uclogic_rdesc_ugee_v2_pen_template_size);
 
 /* Fixed report descriptor template for UGEE v2 frame reports (buttons only) */
 const __u8 uclogic_rdesc_ugee_v2_frame_btn_template_arr[] = {
@@ -964,8 +1011,11 @@ const __u8 uclogic_rdesc_ugee_v2_frame_btn_template_arr[] = {
 	0xC0,               /*      End Collection,                     */
 	0xC0                /*  End Collection                          */
 };
+EXPORT_SYMBOL_GPL(uclogic_rdesc_ugee_v2_frame_btn_template_arr);
+
 const size_t uclogic_rdesc_ugee_v2_frame_btn_template_size =
 			sizeof(uclogic_rdesc_ugee_v2_frame_btn_template_arr);
+EXPORT_SYMBOL_GPL(uclogic_rdesc_ugee_v2_frame_btn_template_size);
 
 /* Fixed report descriptor template for UGEE v2 frame reports (dial) */
 const __u8 uclogic_rdesc_ugee_v2_frame_dial_template_arr[] = {
@@ -1004,8 +1054,11 @@ const __u8 uclogic_rdesc_ugee_v2_frame_dial_template_arr[] = {
 	0xC0,               /*      End Collection,                     */
 	0xC0                /*  End Collection                          */
 };
+EXPORT_SYMBOL_GPL(uclogic_rdesc_ugee_v2_frame_dial_template_arr);
+
 const size_t uclogic_rdesc_ugee_v2_frame_dial_template_size =
 			sizeof(uclogic_rdesc_ugee_v2_frame_dial_template_arr);
+EXPORT_SYMBOL_GPL(uclogic_rdesc_ugee_v2_frame_dial_template_size);
 
 /* Fixed report descriptor template for UGEE v2 frame reports (mouse) */
 const __u8 uclogic_rdesc_ugee_v2_frame_mouse_template_arr[] = {
@@ -1038,8 +1091,11 @@ const __u8 uclogic_rdesc_ugee_v2_frame_mouse_template_arr[] = {
 	0xC0,               /*      End Collection,                     */
 	0xC0                /*  End Collection                          */
 };
+EXPORT_SYMBOL_GPL(uclogic_rdesc_ugee_v2_frame_mouse_template_arr);
+
 const size_t uclogic_rdesc_ugee_v2_frame_mouse_template_size =
 			sizeof(uclogic_rdesc_ugee_v2_frame_mouse_template_arr);
+EXPORT_SYMBOL_GPL(uclogic_rdesc_ugee_v2_frame_mouse_template_size);
 
 /* Fixed report descriptor template for UGEE v2 battery reports */
 const __u8 uclogic_rdesc_ugee_v2_battery_template_arr[] = {
@@ -1072,8 +1128,11 @@ const __u8 uclogic_rdesc_ugee_v2_battery_template_arr[] = {
 	0x81, 0x01,         /*      Input (Constant),                   */
 	0xC0                /*  End Collection                          */
 };
+EXPORT_SYMBOL_GPL(uclogic_rdesc_ugee_v2_battery_template_arr);
+
 const size_t uclogic_rdesc_ugee_v2_battery_template_size =
 			sizeof(uclogic_rdesc_ugee_v2_battery_template_arr);
+EXPORT_SYMBOL_GPL(uclogic_rdesc_ugee_v2_battery_template_size);
 
 /* Fixed report descriptor for Ugee EX07 frame */
 const __u8 uclogic_rdesc_ugee_ex07_frame_arr[] = {
@@ -1099,8 +1158,11 @@ const __u8 uclogic_rdesc_ugee_ex07_frame_arr[] = {
 	0xC0,                   /*      End Collection,                     */
 	0xC0                    /*  End Collection                          */
 };
+EXPORT_SYMBOL_GPL(uclogic_rdesc_ugee_ex07_frame_arr);
+
 const size_t uclogic_rdesc_ugee_ex07_frame_size =
 			sizeof(uclogic_rdesc_ugee_ex07_frame_arr);
+EXPORT_SYMBOL_GPL(uclogic_rdesc_ugee_ex07_frame_size);
 
 /* Fixed report descriptor for Ugee G5 frame controls */
 const __u8 uclogic_rdesc_ugee_g5_frame_arr[] = {
@@ -1153,8 +1215,10 @@ const __u8 uclogic_rdesc_ugee_g5_frame_arr[] = {
 	0xC0,               /*      End Collection,                 */
 	0xC0                /*  End Collection                      */
 };
+EXPORT_SYMBOL_GPL(uclogic_rdesc_ugee_g5_frame_arr);
 const size_t uclogic_rdesc_ugee_g5_frame_size =
 			sizeof(uclogic_rdesc_ugee_g5_frame_arr);
+EXPORT_SYMBOL_GPL(uclogic_rdesc_ugee_g5_frame_size);
 
 /* Fixed report descriptor for XP-Pen Deco 01 frame controls */
 const __u8 uclogic_rdesc_xppen_deco01_frame_arr[] = {
@@ -1187,9 +1251,11 @@ const __u8 uclogic_rdesc_xppen_deco01_frame_arr[] = {
 	0xC0,       /*      End Collection,                 */
 	0xC0        /*  End Collection                      */
 };
+EXPORT_SYMBOL_GPL(uclogic_rdesc_xppen_deco01_frame_arr);
 
 const size_t uclogic_rdesc_xppen_deco01_frame_size =
 			sizeof(uclogic_rdesc_xppen_deco01_frame_arr);
+EXPORT_SYMBOL_GPL(uclogic_rdesc_xppen_deco01_frame_size);
 
 /**
  * uclogic_rdesc_template_apply() - apply report descriptor parameters to a
@@ -1242,3 +1308,9 @@ __u8 *uclogic_rdesc_template_apply(const __u8 *template_ptr,
 
 	return rdesc_ptr;
 }
+EXPORT_SYMBOL_GPL(uclogic_rdesc_template_apply);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Martin Rusko");
+MODULE_AUTHOR("Nikolai Kondrashov");
+MODULE_DESCRIPTION("HID driver for UC-Logic devices original and fixed report descriptors");
-- 
2.39.2


