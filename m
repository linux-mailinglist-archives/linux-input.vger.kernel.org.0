Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 737F47DFDB5
	for <lists+linux-input@lfdr.de>; Fri,  3 Nov 2023 02:21:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229657AbjKCBU7 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 2 Nov 2023 21:20:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229615AbjKCBU6 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 2 Nov 2023 21:20:58 -0400
X-Greylist: delayed 568 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 02 Nov 2023 18:20:50 PDT
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com [66.111.4.229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB809187
        for <linux-input@vger.kernel.org>; Thu,  2 Nov 2023 18:20:50 -0700 (PDT)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.48])
        by mailnew.nyi.internal (Postfix) with ESMTP id E1839580A41;
        Thu,  2 Nov 2023 21:11:21 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute7.internal (MEProxy); Thu, 02 Nov 2023 21:11:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
        cc:cc:content-transfer-encoding:content-type:date:date:from:from
        :in-reply-to:message-id:mime-version:reply-to:sender:subject
        :subject:to:to; s=fm3; t=1698973881; x=1698977481; bh=46nVxG98tw
        eWOrfDert6stNGU2EAW8J2F6CKhpkaGxw=; b=nXZVbmuRyIPSOc9MNL3q2KRcpt
        t7FW1VfGxqwVj9ZmBSq1J94o21Jgsrf8teIP9fMAcx7kwr5LxachB/sEPjBEW+F8
        gD74+19pxxjE4r3D/Zh+V34cmo61TmrnTsf76l2LQseFLHw4RN6GMfeexKAojskn
        4yNiBw34IjqEf+PWihmzHnMVLD0CK9xobYYr9WVmOuZDd20hTgqB7TdKAaRQZMBT
        JkWf3aAvU0FyvwigdF6gqiySc3NjWv/quNxezDbN9+hp3nrSxM0RoUNXgbSRKzFz
        FKtTq0HvBD1wNRoDh+nozDrspNUzOGfEPuwNO9qRRey/GGetpKKlqPjUGlxw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:date:date:feedback-id:feedback-id:from:from
        :in-reply-to:message-id:mime-version:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; t=1698973881; x=1698977481; bh=46nVxG98tweWO
        rfDert6stNGU2EAW8J2F6CKhpkaGxw=; b=HqI8NVjIYa9g/oqvryIpj0QsgBl5R
        etyL1saJXntPYUHbxEHf/1YSKBVZGSFEzvLN+RnZeGTd2SOhFJm55r9JUVB8Hc81
        hJWPtN8KDsSRGtqpvQb67lcdIFWrAmb3rhqtkP7FjQFc90M3e3MmzmetkmlzCznw
        vUAZ1nWfRdgrFr7x5jfblKbszhEtxpZuOWmVHbkmYNWcIF669Ks9ZHV4EkUyJtT8
        W+iys+9D4TeVlN3IYpSTF1lWedQGEzK1ySrMBAZXEwjlrtYiIOD4AH6N8B8hpNzX
        2srCcArafU7Uhe9MquziBItFhKzAyhqcty7WhXVkKwFidkQLQNW4fdkUw==
X-ME-Sender: <xms:uUhEZUf6mOwLafiuGgOf_LTR7XFwh-u2XkrttCaEBM1BQq64B7okkQ>
    <xme:uUhEZWN2aMEMqkRzquTypkDsyeGQZcLpndGNK468jL6zYLMQ349CHmBQUjmncnnhp
    oAKJbDc0YmHJdpEYxQ>
X-ME-Received: <xmr:uUhEZViyeyiyxaq6X3WCrBncFuATepf3ul30sH_EK1_rJ4IczoylJ9SFYpNwb1RPdUe1d9nHaLQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedruddtjedgfedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffoggfgsedtkeertd
    ertddtnecuhfhrohhmpeeurhgvthhtucftrgihvgcuoegsrhgrhigvsehfrghsthhmrghi
    lhdrtghomheqnecuggftrfgrthhtvghrnheptdefiedvgfffueefteekheegueeukefhhe
    dutefhueegueettdfgfedukeelffehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghr
    rghmpehmrghilhhfrhhomhepsghrrgihvgesfhgrshhtmhgrihhlrdgtohhm
X-ME-Proxy: <xmx:uUhEZZ9r6VxIKrdpPKKMmbHYXxYzWzQdaT1TcuheXRqTfz3vuAkhEA>
    <xmx:uUhEZQtx65rf6aSDZRFo3DOiz8kUyvAq6YIUG3WTpzgzy1wbte6lig>
    <xmx:uUhEZQGg2b6PCO7ruXGgSUgWOYCRI5SU2Gl3NxVTkJe9A4kPANTLWg>
    <xmx:uUhEZZ508Rv6Gz1wkj9G81XcAwi9WiUVSpFR_eN7OJOzc1nIQNTz5w>
Feedback-ID: ice5149f5:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 2 Nov 2023 21:11:20 -0400 (EDT)
From:   Brett Raye <braye@fastmail.com>
To:     jikos@kernel.org
Cc:     benjamin.tissoires@redhat.com, linux-input@vger.kernel.org,
        Brett Raye <braye@fastmail.com>
Subject: [PATCH] HID: glorious: fix Glorious Model I HID report
Date:   Thu,  2 Nov 2023 18:10:38 -0700
Message-Id: <20231103011038.27462-1-braye@fastmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The Glorious Model I mouse has a buggy HID report descriptor for its
keyboard endpoint (used for programmable buttons). For report ID 2, there
is a mismatch between Logical Minimum and Usage Minimum in the array that
reports keycodes.

The offending portion of the descriptor: (from hid-decode)

0x95, 0x05,                    //  Report Count (5)                   30
0x75, 0x08,                    //  Report Size (8)                    32
0x15, 0x00,                    //  Logical Minimum (0)                34
0x25, 0x65,                    //  Logical Maximum (101)              36
0x05, 0x07,                    //  Usage Page (Keyboard)              38
0x19, 0x01,                    //  Usage Minimum (1)                  40
0x29, 0x65,                    //  Usage Maximum (101)                42
0x81, 0x00,                    //  Input (Data,Arr,Abs)               44

This bug shifts all programmed keycodes up by 1. Importantly, this causes
"empty" array indexes of 0x00 to be interpreted as 0x01, ErrorRollOver.
The presence of ErrorRollOver causes the system to ignore all keypresses
from the endpoint and breaks the ability to use the programmable buttons.

Setting byte 41 to 0x00 fixes this, and causes keycodes to be interpreted
correctly.

Also, USB_VENDOR_ID_GLORIOUS is changed to USB_VENDOR_ID_SINOWEALTH,
and a new ID for Laview Technology is added. Glorious seems to be
white-labeling controller boards or mice from these vendors. There isn't a
single canonical vendor ID for Glorious products.

Signed-off-by: Brett Raye <braye@fastmail.com>
---
 drivers/hid/hid-glorious.c | 16 ++++++++++++++--
 drivers/hid/hid-ids.h      | 11 +++++++----
 2 files changed, 21 insertions(+), 6 deletions(-)

diff --git a/drivers/hid/hid-glorious.c b/drivers/hid/hid-glorious.c
index 558eb08c19ef..281b3a7187ce 100644
--- a/drivers/hid/hid-glorious.c
+++ b/drivers/hid/hid-glorious.c
@@ -21,6 +21,10 @@ MODULE_DESCRIPTION("HID driver for Glorious PC Gaming Race mice");
  * Glorious Model O and O- specify the const flag in the consumer input
  * report descriptor, which leads to inputs being ignored. Fix this
  * by patching the descriptor.
+ *
+ * Glorious Model I incorrectly specifes the Usage Minimum for its
+ * keyboard HID report, causing keycodes to be misinterpreted.
+ * Fix this by setting Usage Minimum to 0 in that report.
  */
 static __u8 *glorious_report_fixup(struct hid_device *hdev, __u8 *rdesc,
 		unsigned int *rsize)
@@ -32,6 +36,10 @@ static __u8 *glorious_report_fixup(struct hid_device *hdev, __u8 *rdesc,
 		rdesc[85] = rdesc[113] = rdesc[141] = \
 			HID_MAIN_ITEM_VARIABLE | HID_MAIN_ITEM_RELATIVE;
 	}
+	if (*rsize == 156 && rdesc[41] == 1) {
+		hid_info(hdev, "patching Glorious Model I keyboard report descriptor\n");
+		rdesc[41] = 0;
+	}
 	return rdesc;
 }
 
@@ -44,6 +52,8 @@ static void glorious_update_name(struct hid_device *hdev)
 		model = "Model O"; break;
 	case USB_DEVICE_ID_GLORIOUS_MODEL_D:
 		model = "Model D"; break;
+	case USB_DEVICE_ID_GLORIOUS_MODEL_I:
+		model = "Model I"; break;
 	}
 
 	snprintf(hdev->name, sizeof(hdev->name), "%s %s", "Glorious", model);
@@ -66,10 +76,12 @@ static int glorious_probe(struct hid_device *hdev,
 }
 
 static const struct hid_device_id glorious_devices[] = {
-	{ HID_USB_DEVICE(USB_VENDOR_ID_GLORIOUS,
+	{ HID_USB_DEVICE(USB_VENDOR_ID_SINOWEALTH,
 		USB_DEVICE_ID_GLORIOUS_MODEL_O) },
-	{ HID_USB_DEVICE(USB_VENDOR_ID_GLORIOUS,
+	{ HID_USB_DEVICE(USB_VENDOR_ID_SINOWEALTH,
 		USB_DEVICE_ID_GLORIOUS_MODEL_D) },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_LAVIEW,
+		USB_DEVICE_ID_GLORIOUS_MODEL_I) },
 	{ }
 };
 MODULE_DEVICE_TABLE(hid, glorious_devices);
diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index e4d2dfd5d253..9ed9ec03ad1b 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -510,10 +510,6 @@
 #define USB_DEVICE_ID_GENERAL_TOUCH_WIN8_PIT_010A 0x010a
 #define USB_DEVICE_ID_GENERAL_TOUCH_WIN8_PIT_E100 0xe100
 
-#define USB_VENDOR_ID_GLORIOUS  0x258a
-#define USB_DEVICE_ID_GLORIOUS_MODEL_D 0x0033
-#define USB_DEVICE_ID_GLORIOUS_MODEL_O 0x0036
-
 #define I2C_VENDOR_ID_GOODIX		0x27c6
 #define I2C_DEVICE_ID_GOODIX_01F0	0x01f0
 
@@ -744,6 +740,9 @@
 #define USB_VENDOR_ID_LABTEC		0x1020
 #define USB_DEVICE_ID_LABTEC_WIRELESS_KEYBOARD	0x0006
 
+#define USB_VENDOR_ID_LAVIEW		0x22D4
+#define USB_DEVICE_ID_GLORIOUS_MODEL_I	0x1503
+
 #define USB_VENDOR_ID_LCPOWER		0x1241
 #define USB_DEVICE_ID_LCPOWER_LC1000	0xf767
 
@@ -1159,6 +1158,10 @@
 #define USB_VENDOR_ID_SIGMATEL		0x066F
 #define USB_DEVICE_ID_SIGMATEL_STMP3780	0x3780
 
+#define USB_VENDOR_ID_SINOWEALTH  0x258a
+#define USB_DEVICE_ID_GLORIOUS_MODEL_D 0x0033
+#define USB_DEVICE_ID_GLORIOUS_MODEL_O 0x0036
+
 #define USB_VENDOR_ID_SIS_TOUCH		0x0457
 #define USB_DEVICE_ID_SIS9200_TOUCH	0x9200
 #define USB_DEVICE_ID_SIS817_TOUCH	0x0817
-- 
2.40.1

