Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 37F1F7E31BC
	for <lists+linux-input@lfdr.de>; Tue,  7 Nov 2023 00:56:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233242AbjKFX4S (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 6 Nov 2023 18:56:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233478AbjKFX4O (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 6 Nov 2023 18:56:14 -0500
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com [66.111.4.221])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17DC99E
        for <linux-input@vger.kernel.org>; Mon,  6 Nov 2023 15:56:11 -0800 (PST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailnew.nyi.internal (Postfix) with ESMTP id 47E57580B72;
        Mon,  6 Nov 2023 18:56:11 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Mon, 06 Nov 2023 18:56:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
        cc:cc:content-transfer-encoding:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to; s=fm3; t=1699314971; x=
        1699318571; bh=KWVxPyLnJyp572EMsF9f7K4EBUGZ5WdaQoctN9xrgXI=; b=e
        hWkNblBXQH0CqkBALtI9478msOmKaC+oUFcUC5cxikDNrSPX7KfL3u46jSNMFjyB
        a7l5HGrO6OmUeK2B1rPkObvkI7HK2BCpKdIEVZu7TnASS7GybQKvNua38dEfBat5
        r4tFhYM6E0AhP0DxXLuaQfd4In7ggsb9OQ8O9yI0e5e2LYi8b3YdHBIH+fMiJaCV
        65998rhMV2G8yXBXRoY0ziw34f9R3KbE4PrvT9bytKjLnkE1bMwlMnNQTA65vcf6
        uuK03J+9DqqqEcBc3HdzhOO4QJ4nOv9UFfqivLJhpuuh7VP6q8MY+JEGWI8K1oyl
        Im8gEwqoDyPIohktJVirA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:date:date:feedback-id:feedback-id:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1699314971; x=
        1699318571; bh=KWVxPyLnJyp572EMsF9f7K4EBUGZ5WdaQoctN9xrgXI=; b=F
        pX75QCdOnh6WSiqtKLiOaYvlQ/yJ2S611LEzGhDeURIYBt1IWBfBrXIVg8htZCvn
        hUbA8gp4qGLL7v76ZfabKLXME39mJR3G1GSbnMjCp/92m3HHm8x7vpgtRUk1aPQT
        5LTOCg3I28wtrfiWXrl+jOjXESALG6K91p4TP59wTHql+D0y4zobC+5oMrk8+Q/Q
        03zPjeh32gPeIJCMRqeLH6HiIF2LL7McVaBdCsy0l3rHwz3vp9dNvDP04nLIKIAU
        KTlGga6jAGUV0jBx98u4SAd4j0rsYDk2swjQVhrLL2LZKcOf3fYDbTkgKS2BVPoe
        UtVmNiG3IkeK/B20gTNXQ==
X-ME-Sender: <xms:G31JZTuChYbgpAOjrt5YcUVjvWg6eas0pmu4IG31eeDf4h9aFLe66g>
    <xme:G31JZUeRM7rSE1a5w2mqaaZqLbmvIjNGWgyTgW7Bd39ZUbG838ae7SbL8B1SmdR2d
    7_gMwseeuI2wWGflFY>
X-ME-Received: <xmr:G31JZWz9ThNDpXlUzhwlyQuLXr_ZadzfBN1dinEZl7E_rWV_VGkyvarbJMEyVa5PnbwLNz-8TYo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrudduhedgudegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffojghfggfgsedtke
    ertdertddtnecuhfhrohhmpeeurhgvthhtucftrgihvgcuoegsrhgrhigvsehfrghsthhm
    rghilhdrtghomheqnecuggftrfgrthhtvghrnhepffekieeihfekhefgfedtveekjedtvd
    euhfeiveelleejfeeiheeljeefvedvffdvnecuvehluhhsthgvrhfuihiivgeptdenucfr
    rghrrghmpehmrghilhhfrhhomhepsghrrgihvgesfhgrshhtmhgrihhlrdgtohhm
X-ME-Proxy: <xmx:G31JZSNbxLymsJZflPPWzqMixRxlwcaEgBdRUosVnZAEz8qI1mBiFQ>
    <xmx:G31JZT8EBGRD2TmngP7brbVIlQkIRrnpIo0fRiHirTM1e2moxV040w>
    <xmx:G31JZSUFgT4agsrpO3fWTj-yjdYhfwVH0j3oYOBhmGGNe_DgAsPqfA>
    <xmx:G31JZWYK1c-0yPUOviwsGjGT2KVKMHFl-_cbu3U0kWC2F5qkU2bswA>
Feedback-ID: ice5149f5:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 6 Nov 2023 18:56:10 -0500 (EST)
From:   Brett Raye <braye@fastmail.com>
To:     jikos@kernel.org
Cc:     sergeantsagara@protonmail.com, benjamin.tissoires@redhat.com,
        linux-input@vger.kernel.org, Brett Raye <braye@fastmail.com>
Subject: [PATCH v2 1/2] HID: glorious: fix Glorious Model I HID report
Date:   Mon,  6 Nov 2023 15:55:56 -0800
Message-Id: <20231106235557.8741-2-braye@fastmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231106235557.8741-1-braye@fastmail.com>
References: <20231106235557.8741-1-braye@fastmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
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

Signed-off-by: Brett Raye <braye@fastmail.com>
---
 drivers/hid/hid-glorious.c | 12 ++++++++++++
 drivers/hid/hid-ids.h      |  3 +++
 2 files changed, 15 insertions(+)

diff --git a/drivers/hid/hid-glorious.c b/drivers/hid/hid-glorious.c
index 558eb08c19ef..e44a39a17151 100644
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
@@ -70,6 +80,8 @@ static const struct hid_device_id glorious_devices[] = {
 		USB_DEVICE_ID_GLORIOUS_MODEL_O) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_GLORIOUS,
 		USB_DEVICE_ID_GLORIOUS_MODEL_D) },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_LAVIEW,
+		USB_DEVICE_ID_GLORIOUS_MODEL_I) },
 	{ }
 };
 MODULE_DEVICE_TABLE(hid, glorious_devices);
diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index e4d2dfd5d253..c30bca343982 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -744,6 +744,9 @@
 #define USB_VENDOR_ID_LABTEC		0x1020
 #define USB_DEVICE_ID_LABTEC_WIRELESS_KEYBOARD	0x0006
 
+#define USB_VENDOR_ID_LAVIEW		0x22D4
+#define USB_DEVICE_ID_GLORIOUS_MODEL_I	0x1503
+
 #define USB_VENDOR_ID_LCPOWER		0x1241
 #define USB_DEVICE_ID_LCPOWER_LC1000	0xf767
 
-- 
2.40.1

