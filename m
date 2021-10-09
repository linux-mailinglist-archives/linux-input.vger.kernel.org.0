Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F9B5427988
	for <lists+linux-input@lfdr.de>; Sat,  9 Oct 2021 13:43:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238204AbhJILpb (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 9 Oct 2021 07:45:31 -0400
Received: from new3-smtp.messagingengine.com ([66.111.4.229]:35625 "EHLO
        new3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232933AbhJILpa (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 9 Oct 2021 07:45:30 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailnew.nyi.internal (Postfix) with ESMTP id A623658055B;
        Sat,  9 Oct 2021 07:43:33 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Sat, 09 Oct 2021 07:43:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alistair23.me;
         h=from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm2; bh=vG4rDoxLOurcR
        PRUON9TUlIYZV6lZNVLV2WNHonc82s=; b=eKaj2URk2c+EQHsDlAljxcUztVVub
        Mb4p0qdp0TLw+vdlRzjJPWwp48W5bGRqIfVv5imniJs63lbThxjzgoyk+UWY7P2C
        WXo+OEBand4QoJdaJKinAG++4zrNXOLByIFrlhgJaIrrmCN2X9CFKmUVmSti70Sy
        L63tJxmvc65I02ebGhMqqnIEr01xfnKK6WH9A++rFRsaccymfVzaF7Ks3Fu0f4jD
        dKGrQFDaBbTEwj7Tj3vheNUzpuh2F1Jp/d4j1mZizeN0zFkVhKlC6EIb1AaZdvNo
        KJNU46YeRvWzXEFsz+x3Ey/SCrdJ0SHYmHj3Ec2k6S6UFXR7xlfXjBoMg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm1; bh=vG4rDoxLOurcRPRUON9TUlIYZV6lZNVLV2WNHonc82s=; b=DHJ0C9OG
        Ae1+P2ahV3880eSdcL5TZ0H7M3p2dLKupdRdOwd1NlIBaD/FhrC67hlDZQQjRBkl
        KRbsdjhBTR+66AYex7+V6/t30ZThrss7646FREfQnRIFOSeeCfSWPiKdg2kULoFj
        02c4LYf1HxZhythi5Zav8X5vaVewurnjmn9pHcBhusGZ7VDeKzG9Ybqgkfti5gYi
        jGci0hcQSaackMX+plUv4oeb4eQ95GseJna76yK9TljgxpO6OTdybuo/lRynHWYn
        h+TT/QoaBv/dIehk4r4z4qe0JjXdEcQQuQp28ya8TMjKLxQ01mGD/urVkGwI02aY
        TjQpziKTgmaWhw==
X-ME-Sender: <xms:ZYBhYXMQ2aIevI2_ku3hXk3AL5KZvbPGU3SN66nE33eGNLJ7CKs4nA>
    <xme:ZYBhYR9vLYcsBYE8P2M5rGmdRiNE9Z-ZJ5C6Umpb2GM0tNU5CLe39eTESqbWTkajc
    KFax0ZJtG-w_-jsqCw>
X-ME-Received: <xmr:ZYBhYWSCIqp3qK-FyPfUFeMMDaRwmDtclivjpZySeh8yY15MuyAtWhp3qhTijystmnAghAxITwVlFafmCsc3RTY5EPQOJ2xgO3U>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvddtvddggedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
    dtredttdenucfhrhhomheptehlihhsthgrihhrucfhrhgrnhgtihhsuceorghlihhsthgr
    ihhrsegrlhhishhtrghirhdvfedrmhgvqeenucggtffrrghtthgvrhhnpeeggedtteejke
    eggeeugfehueevudegvdetjeeviedugedvtdekffekhedtteduhfenucevlhhushhtvghr
    ufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrlhhishhtrghirhesrghlih
    hsthgrihhrvdefrdhmvg
X-ME-Proxy: <xmx:ZYBhYbvI6qKWBDBJfYzT1G_hrQoHn5hxtsByDpsSfdhlm6QLfFpbXg>
    <xmx:ZYBhYfc998BM6QsI1Ind1J2XMyPPZo4f06KVGQ90oXQ1SGLl2YEJ6g>
    <xmx:ZYBhYX3oix3twQMqaMs6WEsDEzvr4VleA9dgSMClI0vcnuDoLG32Sw>
    <xmx:ZYBhYQU8lTHURa76qMqQ_dAciJ4Pc3tqx11nRVa7Jx1MvSj006i04w>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 9 Oct 2021 07:43:29 -0400 (EDT)
From:   Alistair Francis <alistair@alistair23.me>
To:     dmitry.torokhov@gmail.com, shawnguo@kernel.org,
        s.hauer@pengutronix.de
Cc:     linux-imx@nxp.com, jikos@kernel.org, benjamin.tissoires@redhat.com,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        alistair23@gmail.com, Alistair Francis <alistair@alistair23.me>
Subject: [PATCH v11 2/4] HID: wacom: Add support for the AG14 Wacom device
Date:   Sat,  9 Oct 2021 21:43:11 +1000
Message-Id: <20211009114313.17967-2-alistair@alistair23.me>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211009114313.17967-1-alistair@alistair23.me>
References: <20211009114313.17967-1-alistair@alistair23.me>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add support for the AG14 Wacom digitiser connected via I2C. This is used
on the reMarkable2 tablet.

The vendor ID is different then the usual Wacom vendor ID, and I'm not
sure why. Otherwise we can just use the generic HID type.

Signed-off-by: Alistair Francis <alistair@alistair23.me>
---
 drivers/hid/hid-core.c  | 1 +
 drivers/hid/hid-ids.h   | 1 +
 drivers/hid/wacom_wac.c | 8 ++++++++
 3 files changed, 10 insertions(+)

diff --git a/drivers/hid/hid-core.c b/drivers/hid/hid-core.c
index dbed2524fd47..724bec1754bd 100644
--- a/drivers/hid/hid-core.c
+++ b/drivers/hid/hid-core.c
@@ -904,6 +904,7 @@ static int hid_scan_report(struct hid_device *hid)
 	 * Vendor specific handlings
 	 */
 	switch (hid->vendor) {
+	case USB_VENDOR_ID_I2C_WACOM:
 	case USB_VENDOR_ID_WACOM:
 		hid->group = HID_GROUP_WACOM;
 		break;
diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index 29564b370341..daa0197445e7 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -1260,6 +1260,7 @@
 #define USB_DEVICE_ID_VTL_MULTITOUCH_FF3F	0xff3f
 
 #define USB_VENDOR_ID_WACOM		0x056a
+#define USB_VENDOR_ID_I2C_WACOM		0x2D1F
 #define USB_DEVICE_ID_WACOM_GRAPHIRE_BLUETOOTH	0x81
 #define USB_DEVICE_ID_WACOM_INTUOS4_BLUETOOTH   0x00BD
 
diff --git a/drivers/hid/wacom_wac.c b/drivers/hid/wacom_wac.c
index c01f683e23fa..6a800150933a 100644
--- a/drivers/hid/wacom_wac.c
+++ b/drivers/hid/wacom_wac.c
@@ -4814,6 +4814,9 @@ static const struct wacom_features wacom_features_0x3c8 =
 	{ "Wacom Intuos BT M", 21600, 13500, 4095, 63,
 	  INTUOSHT3_BT, WACOM_INTUOS_RES, WACOM_INTUOS_RES, 4 };
 
+static const struct wacom_features wacom_features_0x95 =
+	{ "Wacom AG14", .type = HID_GENERIC, .oVid = 0x2D1F, .oPid = 149 };
+
 static const struct wacom_features wacom_features_HID_ANY_ID =
 	{ "Wacom HID", .type = HID_GENERIC, .oVid = HID_ANY_ID, .oPid = HID_ANY_ID };
 
@@ -4829,6 +4832,10 @@ static const struct wacom_features wacom_features_HID_ANY_ID =
 	HID_DEVICE(BUS_I2C, HID_GROUP_WACOM, USB_VENDOR_ID_WACOM, prod),\
 	.driver_data = (kernel_ulong_t)&wacom_features_##prod
 
+#define I2C_AG14_DEVICE_WACOM(prod)					    \
+	HID_DEVICE(BUS_I2C, HID_GROUP_WACOM, USB_VENDOR_ID_I2C_WACOM, prod),\
+	.driver_data = (kernel_ulong_t)&wacom_features_##prod
+
 #define USB_DEVICE_LENOVO(prod)					\
 	HID_USB_DEVICE(USB_VENDOR_ID_LENOVO, prod),			\
 	.driver_data = (kernel_ulong_t)&wacom_features_##prod
@@ -4890,6 +4897,7 @@ const struct hid_device_id wacom_ids[] = {
 	{ USB_DEVICE_WACOM(0x84) },
 	{ USB_DEVICE_WACOM(0x90) },
 	{ USB_DEVICE_WACOM(0x93) },
+	{ I2C_AG14_DEVICE_WACOM(0x95) },
 	{ USB_DEVICE_WACOM(0x97) },
 	{ USB_DEVICE_WACOM(0x9A) },
 	{ USB_DEVICE_WACOM(0x9F) },
-- 
2.31.1

