Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 128AB6A37AF
	for <lists+linux-input@lfdr.de>; Mon, 27 Feb 2023 03:11:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230410AbjB0CLC (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 26 Feb 2023 21:11:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231138AbjB0CKN (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 26 Feb 2023 21:10:13 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6AE3D1ABE7;
        Sun, 26 Feb 2023 18:09:16 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 112C4B80CAD;
        Mon, 27 Feb 2023 02:02:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C286FC433A0;
        Mon, 27 Feb 2023 02:02:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1677463336;
        bh=XPJpeSdRnBnhaLREdf2QTqaEce4WcAfaAXTbHhAWunE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=dB1h18C7QGtrOeKaB5rMihYUNmwWvyzw27eOLY8ErLG6WpgHgVM7Gg1tPGCAm/6Vv
         LrP2nnfOciU7zpTlwy3MYE1ny1va2wjFMtPPiZMI8QUTJgSrFhN330cOGuC3oKwdsm
         0uuh6n0cfvIcAEMn1tKqYbYrsjFEtZ4cFapspCDV6WhMUIm3v3JOLmDZfziFcd50i3
         9MGNNn7G77tUMcjODSx1p5PO800n5JrvUc4P9Ehj7deIbEJcM7eIp097Vc86E7rj0f
         Tcfd59zI/neKvoIDeAwlAOau15nSt17lFN6cCAkTqMXPeqg9mgciEfF+Tuj6atCFaK
         FZFzS72hhuMow==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>,
        Mia Kanashi <chad@redpilled.dev>,
        Andreas Grosse <andig.mail@t-online.de>,
        Jiri Kosina <jkosina@suse.cz>, Sasha Levin <sashal@kernel.org>,
        jikos@kernel.org, benjamin.tissoires@redhat.com,
        linux-input@vger.kernel.org
Subject: [PATCH AUTOSEL 6.2 19/60] HID: uclogic: Add frame type quirk
Date:   Sun, 26 Feb 2023 21:00:04 -0500
Message-Id: <20230227020045.1045105-19-sashal@kernel.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230227020045.1045105-1-sashal@kernel.org>
References: <20230227020045.1045105-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: José Expósito <jose.exposito89@gmail.com>

[ Upstream commit 14b71e6ad8ca59dd734c7fa9676f3d60bddee2a9 ]

The report descriptor used to get information about UGEE v2 devices is
incorrect in the XP-PEN Deco Pro SW. It indicates that the device frame
is of type UCLOGIC_PARAMS_FRAME_BUTTONS but the device has a frame of
type UCLOGIC_PARAMS_FRAME_MOUSE.

Here is the original report descriptor:

  0x0e 0x03 0xc8 0xb3 0x34 0x65 0x08 0x00 0xff 0x1f 0xd8 0x13 0x00 0x00
                                     ^ This byte should be 2

Add a quirk to be able to fix the reported frame type.

Tested-by: Mia Kanashi <chad@redpilled.dev>
Tested-by: Andreas Grosse <andig.mail@t-online.de>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
Signed-off-by: Jiri Kosina <jkosina@suse.cz>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/hid/hid-uclogic-core.c   | 20 +-------------------
 drivers/hid/hid-uclogic-params.c |  5 +++++
 drivers/hid/hid-uclogic-params.h | 23 +++++++++++++++++++++++
 3 files changed, 29 insertions(+), 19 deletions(-)

diff --git a/drivers/hid/hid-uclogic-core.c b/drivers/hid/hid-uclogic-core.c
index cfbbc39807a69..739984b8fa1b8 100644
--- a/drivers/hid/hid-uclogic-core.c
+++ b/drivers/hid/hid-uclogic-core.c
@@ -22,25 +22,6 @@
 
 #include "hid-ids.h"
 
-/* Driver data */
-struct uclogic_drvdata {
-	/* Interface parameters */
-	struct uclogic_params params;
-	/* Pointer to the replacement report descriptor. NULL if none. */
-	__u8 *desc_ptr;
-	/*
-	 * Size of the replacement report descriptor.
-	 * Only valid if desc_ptr is not NULL
-	 */
-	unsigned int desc_size;
-	/* Pen input device */
-	struct input_dev *pen_input;
-	/* In-range timer */
-	struct timer_list inrange_timer;
-	/* Last rotary encoder state, or U8_MAX for none */
-	u8 re_state;
-};
-
 /**
  * uclogic_inrange_timeout - handle pen in-range state timeout.
  * Emulate input events normally generated when pen goes out of range for
@@ -202,6 +183,7 @@ static int uclogic_probe(struct hid_device *hdev,
 	}
 	timer_setup(&drvdata->inrange_timer, uclogic_inrange_timeout, 0);
 	drvdata->re_state = U8_MAX;
+	drvdata->quirks = id->driver_data;
 	hid_set_drvdata(hdev, drvdata);
 
 	/* Initialize the device and retrieve interface parameters */
diff --git a/drivers/hid/hid-uclogic-params.c b/drivers/hid/hid-uclogic-params.c
index 3c5eea3df3288..e052538a62fb3 100644
--- a/drivers/hid/hid-uclogic-params.c
+++ b/drivers/hid/hid-uclogic-params.c
@@ -1298,6 +1298,7 @@ static int uclogic_params_ugee_v2_init(struct uclogic_params *params,
 				       struct hid_device *hdev)
 {
 	int rc = 0;
+	struct uclogic_drvdata *drvdata;
 	struct usb_interface *iface;
 	__u8 bInterfaceNumber;
 	const int str_desc_len = 12;
@@ -1316,6 +1317,7 @@ static int uclogic_params_ugee_v2_init(struct uclogic_params *params,
 		goto cleanup;
 	}
 
+	drvdata = hid_get_drvdata(hdev);
 	iface = to_usb_interface(hdev->dev.parent);
 	bInterfaceNumber = iface->cur_altsetting->desc.bInterfaceNumber;
 
@@ -1382,6 +1384,9 @@ static int uclogic_params_ugee_v2_init(struct uclogic_params *params,
 	p.pen.subreport_list[0].id = UCLOGIC_RDESC_V1_FRAME_ID;
 
 	/* Initialize the frame interface */
+	if (drvdata->quirks & UCLOGIC_MOUSE_FRAME_QUIRK)
+		frame_type = UCLOGIC_PARAMS_FRAME_MOUSE;
+
 	switch (frame_type) {
 	case UCLOGIC_PARAMS_FRAME_DIAL:
 	case UCLOGIC_PARAMS_FRAME_MOUSE:
diff --git a/drivers/hid/hid-uclogic-params.h b/drivers/hid/hid-uclogic-params.h
index a97477c02ff82..10a05c7fd9398 100644
--- a/drivers/hid/hid-uclogic-params.h
+++ b/drivers/hid/hid-uclogic-params.h
@@ -19,6 +19,8 @@
 #include <linux/usb.h>
 #include <linux/hid.h>
 
+#define UCLOGIC_MOUSE_FRAME_QUIRK	BIT(0)
+
 /* Types of pen in-range reporting */
 enum uclogic_params_pen_inrange {
 	/* Normal reports: zero - out of proximity, one - in proximity */
@@ -215,6 +217,27 @@ struct uclogic_params {
 	struct uclogic_params_frame frame_list[3];
 };
 
+/* Driver data */
+struct uclogic_drvdata {
+	/* Interface parameters */
+	struct uclogic_params params;
+	/* Pointer to the replacement report descriptor. NULL if none. */
+	__u8 *desc_ptr;
+	/*
+	 * Size of the replacement report descriptor.
+	 * Only valid if desc_ptr is not NULL
+	 */
+	unsigned int desc_size;
+	/* Pen input device */
+	struct input_dev *pen_input;
+	/* In-range timer */
+	struct timer_list inrange_timer;
+	/* Last rotary encoder state, or U8_MAX for none */
+	u8 re_state;
+	/* Device quirks */
+	unsigned long quirks;
+};
+
 /* Initialize a tablet interface and discover its parameters */
 extern int uclogic_params_init(struct uclogic_params *params,
 				struct hid_device *hdev);
-- 
2.39.0

