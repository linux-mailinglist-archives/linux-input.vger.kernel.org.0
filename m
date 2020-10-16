Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D956028FE73
	for <lists+linux-input@lfdr.de>; Fri, 16 Oct 2020 08:44:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404222AbgJPGob (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 16 Oct 2020 02:44:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404220AbgJPGob (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 16 Oct 2020 02:44:31 -0400
X-Greylist: delayed 309 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 15 Oct 2020 23:44:30 PDT
Received: from thuis.zeewinde.xyz (unknown [IPv6:2001:985:bd79:8:5054:ff:fe8a:e8ef])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id BF1E0C061755;
        Thu, 15 Oct 2020 23:44:30 -0700 (PDT)
Received: from nas.zeewinde.xyz (nas.zeewinde.xyz [10.130.8.16])
        by thuis.zeewinde.xyz (Postfix) with ESMTP id AC0EC20B;
        Fri, 16 Oct 2020 08:39:18 +0200 (CEST)
From:   Martijn van de Streek <martijn@zeewinde.xyz>
Cc:     martijn@zeewinde.xyz, Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] HID: uclogic: Add ID for Trust Flex Design Tablet
Date:   Fri, 16 Oct 2020 08:38:05 +0200
Message-Id: <20201016063805.4059-1-martijn@zeewinde.xyz>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The Trust Flex Design Tablet has an UGTizer USB ID and requires the same
initialization as the UGTizer GP0610 to be detected as a graphics tablet
instead of a mouse.

Signed-off-by: Martijn van de Streek <martijn@zeewinde.xyz>
---
 drivers/hid/hid-ids.h            | 1 +
 drivers/hid/hid-uclogic-core.c   | 2 ++
 drivers/hid/hid-uclogic-params.c | 2 ++
 3 files changed, 5 insertions(+)

diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index 74fc1df6e3c2..b0056c1bba56 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -1295,6 +1295,7 @@
 
 #define USB_VENDOR_ID_UGTIZER			0x2179
 #define USB_DEVICE_ID_UGTIZER_TABLET_GP0610	0x0053
+#define USB_DEVICE_ID_UGTIZER_TABLET_GT5040	0x0077
 
 #define USB_VENDOR_ID_VIEWSONIC			0x0543
 #define USB_DEVICE_ID_VIEWSONIC_PD1011		0xe621
diff --git a/drivers/hid/hid-uclogic-core.c b/drivers/hid/hid-uclogic-core.c
index 86b568037cb8..8e9c9e646cb7 100644
--- a/drivers/hid/hid-uclogic-core.c
+++ b/drivers/hid/hid-uclogic-core.c
@@ -385,6 +385,8 @@ static const struct hid_device_id uclogic_devices[] = {
 				USB_DEVICE_ID_UCLOGIC_DRAWIMAGE_G3) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_UGTIZER,
 				USB_DEVICE_ID_UGTIZER_TABLET_GP0610) },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_UGTIZER,
+				USB_DEVICE_ID_UGTIZER_TABLET_GT5040) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_UGEE,
 				USB_DEVICE_ID_UGEE_TABLET_G5) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_UGEE,
diff --git a/drivers/hid/hid-uclogic-params.c b/drivers/hid/hid-uclogic-params.c
index 7d20d1fcf8d2..d26d8cd98efc 100644
--- a/drivers/hid/hid-uclogic-params.c
+++ b/drivers/hid/hid-uclogic-params.c
@@ -997,6 +997,8 @@ int uclogic_params_init(struct uclogic_params *params,
 		break;
 	case VID_PID(USB_VENDOR_ID_UGTIZER,
 		     USB_DEVICE_ID_UGTIZER_TABLET_GP0610):
+	case VID_PID(USB_VENDOR_ID_UGTIZER,
+		     USB_DEVICE_ID_UGTIZER_TABLET_GT5040):
 	case VID_PID(USB_VENDOR_ID_UGEE,
 		     USB_DEVICE_ID_UGEE_XPPEN_TABLET_G540):
 	case VID_PID(USB_VENDOR_ID_UGEE,

base-commit: c48b75b7271db23c1b2d1204d6e8496d91f27711
-- 
2.20.1

