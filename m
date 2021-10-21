Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B6D07435E52
	for <lists+linux-input@lfdr.de>; Thu, 21 Oct 2021 11:51:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230269AbhJUJyF (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 21 Oct 2021 05:54:05 -0400
Received: from new1-smtp.messagingengine.com ([66.111.4.221]:52345 "EHLO
        new1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231520AbhJUJyF (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 21 Oct 2021 05:54:05 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailnew.nyi.internal (Postfix) with ESMTP id 60996580CD8;
        Thu, 21 Oct 2021 05:51:49 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Thu, 21 Oct 2021 05:51:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alistair23.me;
         h=from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm2; bh=vx06MaD0DxqwC
        PVkL4yhQlFJJuRlEfDKByXpzB5FHn8=; b=C1/RemWjtBf6qhds3xMIGrpzBdShR
        bC+j874KSxznIT8+eGeyiZA5POpWjUHvY1dBSlyeCAMAok4R5wTkp5YyYN6PpFjx
        dWUBMAmCyxqapo17rM/C7xtik2xK9Q9xLZKHVpqE3mpwqxbJclAGr5NUmVn10HAH
        AprpQczdfw+29XZgd+b7ulqvaAx2c8yKPZKVUgi7FdDIJWsen35X4mt3vz4Pdpvm
        Bh1fCFk9L3rDQORGOiZdFMIhqVcEEyp5NKtYL8Gbzsh/6y/ia8fc+LA0RLdXX2UQ
        1kjzuZNptIALf29YQ2Z6iYi4zOnlSSy5d1d1lVkMPHMs03XDzd4ljfONQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm1; bh=vx06MaD0DxqwCPVkL4yhQlFJJuRlEfDKByXpzB5FHn8=; b=iWYUdV/c
        PxMrTB3ktXIHiye1WoKw1P3p+CXhWUhMEWNIAq9HemLi/7IKaLv93DR8B7aG4obr
        PAyzIM1KzJ74szbZrL+lDXBcLYZmiSzgHufGEa57Tu6Kn8q1Trp22u1FLGfjHYZa
        EFGt/5e155NGSV5nXiZTbH5eFRXHPSGa6ro9fmJgHt0Wgwn1jmj+FJPWPHfFQyBG
        nC7C7WbIblfMRrw1Gqrd+PIhBQnKQKVZsnzoT34yXM9XO8dF1SknB9PB+kpvyQ1w
        cvxXBZosn8XaXuPjsykQzMXP1Wnw7d2pAvAJYqAnnro6dkKlNz/ZXiu68YONZnsL
        TTzyJgdJsS6NJg==
X-ME-Sender: <xms:NThxYY9q-qZAdPT9gKj4pFyaUNpr64kRSd2LCjDXo1VXMH5lyxjP_g>
    <xme:NThxYQv1JZoz2JRenFdC7MP4fXjr1Onv4-bpGiZWYwObCNIrVin1MKyOGqld9FHAE
    _4mcWXeigV1xYECbhk>
X-ME-Received: <xmr:NThxYeCP1SNtq7FEXG51qAt866mFRemQpbLz7n56ORfJ29p9Syag1gQDXI_jlrfe4GV7IrfUNw3S>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvddviedgvddtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
    dtredttdenucfhrhhomheptehlihhsthgrihhrucfhrhgrnhgtihhsuceorghlihhsthgr
    ihhrsegrlhhishhtrghirhdvfedrmhgvqeenucggtffrrghtthgvrhhnpeeggedtteejke
    eggeeugfehueevudegvdetjeeviedugedvtdekffekhedtteduhfenucevlhhushhtvghr
    ufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrlhhishhtrghirhesrghlih
    hsthgrihhrvdefrdhmvg
X-ME-Proxy: <xmx:NThxYYfulEi6hUHzk1i-x4Gez6Pw24IjP_S6ViSMMF0m21ZOgY3_8w>
    <xmx:NThxYdOdbuhlJLeJtV4dL1swYU3-mivT1SMW4utFCL4CvwPm2xFo_A>
    <xmx:NThxYSlhT1Khqw0_u5ww_gNnkEc7T7WGYVH0ctj5ELTr9ohoLhjwkQ>
    <xmx:NThxYeFKVBVHfXDCpLjBMGiykb8lyi9XXD1fh8l18jOKvQmceJH_Mg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 21 Oct 2021 05:51:44 -0400 (EDT)
From:   Alistair Francis <alistair@alistair23.me>
To:     dmitry.torokhov@gmail.com, shawnguo@kernel.org,
        s.hauer@pengutronix.de, benjamin.tissoires@redhat.com
Cc:     linux-imx@nxp.com, jikos@kernel.org, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, alistair23@gmail.com,
        Alistair Francis <alistair@alistair23.me>
Subject: [PATCH v12 2/3] HID: quirks: Invert X/Y values for rM2 Wacom
Date:   Thu, 21 Oct 2021 19:51:06 +1000
Message-Id: <20211021095107.116292-2-alistair@alistair23.me>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211021095107.116292-1-alistair@alistair23.me>
References: <20211021095107.116292-1-alistair@alistair23.me>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Enable the HID_QUIRK_XY_INVERT quirk for the Wacom digitiser used on the
reMarkable 2.

Signed-off-by: Alistair Francis <alistair@alistair23.me>
---
 drivers/hid/hid-ids.h    | 2 ++
 drivers/hid/hid-quirks.c | 1 +
 2 files changed, 3 insertions(+)

diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index 29564b370341..9dc17bf3e550 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -1260,8 +1260,10 @@
 #define USB_DEVICE_ID_VTL_MULTITOUCH_FF3F	0xff3f
 
 #define USB_VENDOR_ID_WACOM		0x056a
+#define USB_VENDOR_ID_WACOM_HID		0x2D1F
 #define USB_DEVICE_ID_WACOM_GRAPHIRE_BLUETOOTH	0x81
 #define USB_DEVICE_ID_WACOM_INTUOS4_BLUETOOTH   0x00BD
+#define I2C_DEVICE_ID_WACOM_REMARKABLE2		0x0095
 
 #define USB_VENDOR_ID_WALTOP				0x172f
 #define USB_DEVICE_ID_WALTOP_SLIM_TABLET_5_8_INCH	0x0032
diff --git a/drivers/hid/hid-quirks.c b/drivers/hid/hid-quirks.c
index 2e104682c22b..b081af3329a5 100644
--- a/drivers/hid/hid-quirks.c
+++ b/drivers/hid/hid-quirks.c
@@ -186,6 +186,7 @@ static const struct hid_device_id hid_quirks[] = {
 	{ HID_USB_DEVICE(USB_VENDOR_ID_TURBOX, USB_DEVICE_ID_TURBOX_KEYBOARD), HID_QUIRK_NOGET },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_UCLOGIC, USB_DEVICE_ID_UCLOGIC_TABLET_KNA5), HID_QUIRK_MULTI_INPUT },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_UCLOGIC, USB_DEVICE_ID_UCLOGIC_TABLET_TWA60), HID_QUIRK_MULTI_INPUT },
+	{ HID_I2C_DEVICE(USB_VENDOR_ID_WACOM_HID, I2C_DEVICE_ID_WACOM_REMARKABLE2), HID_QUIRK_XY_INVERT },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_WALTOP, USB_DEVICE_ID_WALTOP_MEDIA_TABLET_10_6_INCH), HID_QUIRK_MULTI_INPUT },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_WALTOP, USB_DEVICE_ID_WALTOP_MEDIA_TABLET_14_1_INCH), HID_QUIRK_MULTI_INPUT },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_WALTOP, USB_DEVICE_ID_WALTOP_SIRIUS_BATTERY_FREE_TABLET), HID_QUIRK_MULTI_INPUT },
-- 
2.31.1

