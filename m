Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EAED59A103
	for <lists+linux-input@lfdr.de>; Thu, 22 Aug 2019 22:20:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391021AbfHVUTC (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 22 Aug 2019 16:19:02 -0400
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:41161 "EHLO
        out5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2388389AbfHVUTB (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 22 Aug 2019 16:19:01 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.nyi.internal (Postfix) with ESMTP id 74EA621731;
        Thu, 22 Aug 2019 16:19:00 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Thu, 22 Aug 2019 16:19:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        pedrovanzella.com; h=from:to:cc:subject:date:message-id
        :in-reply-to:references:mime-version:content-transfer-encoding;
         s=fm3; bh=4c/lgLrm3F1n9YEmiMR6OTt64iylYrDgHb9+YtfNw1E=; b=4e8V4
        3r8ASOsXBF5O+3zQlbspZ9VW6EYKXlYm8NKto2VRtHRVhKXcGg390t0vukjJQRZk
        YzFtz5mXJzoVInMEnJnwFEdqLmLWmIC5tF5dYSzKsWI9NNvQ5abpUwYSIu35JitF
        +C9ZhfY49gOlzr7dHwxhOxGTjg4B2DymlbbuGyvYrqvsCTjXFlsFW4KvNeA/WSOD
        KYln6znTkJGoMigsSuQ0X1LT0nPgeQbn2MeyK3ARd1zbwtmzMDAZJ9D1eZU+mN+Y
        2atz0iZ+WSvYH4S39Du0djmNlV05CCrLzuFCS2K6NniUwUE2RAmODWCKgthGx2pP
        5EhfmdoJUYh3IBqUg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=4c/lgLrm3F1n9YEmiMR6OTt64iylYrDgHb9+YtfNw1E=; b=h76D8Cxf
        cjRYlUVHunWd4EbFsOsR7eZNe8kalymLglb6xv3wPGb0+IhxagfZeCIEz5rEJhZK
        7nppRXiq+nYrQ/y4zRdJag2vNDHlRoyHAr9fbIMizh9PIcqR25laTPQOgjWHFvzW
        mY37kXTZYRA8zJZJHUuoPy2G0uv1GX+JqphKzrrNgE0ZwoPhWfQVTdF5dKJWLxtv
        VPv96ra4HkYG45DE52d1QmVR20gfoJzsfTqg82umgj+y2BzWgzdP1jrh0evHIqTC
        PxSSffP766ZkYSIXFeaZvDWg/Ydt3eZgk8ozTYgpNbtHqip8YZ6HZ5Iu2ZZAzVeG
        TCNLnZe/TjWcMQ==
X-ME-Sender: <xms:s_heXWWSGalQHqGFEHPAbXvkI_-8Kg1CdXU8T8u6XP5M_xDsPikfyw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrudegiedguddtgecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomheprfgvughr
    ohcugggrnhiivghllhgruceophgvughrohesphgvughrohhvrghniigvlhhlrgdrtghomh
    eqnecukfhppedujeegrdekkedrledrudegleenucfrrghrrghmpehmrghilhhfrhhomhep
    phgvughrohesphgvughrohhvrghniigvlhhlrgdrtghomhenucevlhhushhtvghrufhiii
    gvpedt
X-ME-Proxy: <xmx:tPheXQH2c_5q-tjR4mbyw2dNSpe6ii08D6f3wS2Ghs8k03QcxxQNiA>
    <xmx:tPheXdCXFsv5SeEQ06NdnLB7aI-ezofDrxno0N0uQ3ZGKmoKWRDUmw>
    <xmx:tPheXSzROuDoaZjpSiw7VSJEP_ZvefrprpxLamo5NvF-e6iWw5_SyA>
    <xmx:tPheXQs-gLyuVHOT3JkAFVSf3r3W4b7aNgl6WOfmCH55N8ZDvpJ9wA>
Received: from localhost (toroon020aw-lp130-07-174-88-9-149.dsl.bell.ca [174.88.9.149])
        by mail.messagingengine.com (Postfix) with ESMTPA id CBECED6005B;
        Thu, 22 Aug 2019 16:18:59 -0400 (EDT)
From:   Pedro Vanzella <pedro@pedrovanzella.com>
To:     linux-input@vger.kernel.org
Cc:     lains@archlinux.org, Pedro Vanzella <pedro@pedrovanzella.com>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/4] hid-logitech-hidpp: add quirk to handle battery voltage
Date:   Thu, 22 Aug 2019 16:18:45 -0400
Message-Id: <20190822201849.28924-2-pedro@pedrovanzella.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190822201849.28924-1-pedro@pedrovanzella.com>
References: <20190822201849.28924-1-pedro@pedrovanzella.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This quirk allows us to pick which devices support the 0x1001 hidpp
feature to read the battery voltage.

Signed-off-by: Pedro Vanzella <pedro@pedrovanzella.com>
---
 drivers/hid/hid-logitech-hidpp.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
index 0179f7ed77e5..402ddba93adc 100644
--- a/drivers/hid/hid-logitech-hidpp.c
+++ b/drivers/hid/hid-logitech-hidpp.c
@@ -59,7 +59,8 @@ MODULE_PARM_DESC(disable_tap_to_click,
 #define HIDPP_QUIRK_CLASS_G920			BIT(3)
 #define HIDPP_QUIRK_CLASS_K750			BIT(4)
 
-/* bits 2..20 are reserved for classes */
+/* bits 2..1f are reserved for classes */
+#define HIDPP_QUIRK_BATTERY_VOLTAGE_X1001	BIT(20)
 /* #define HIDPP_QUIRK_CONNECT_EVENTS		BIT(21) disabled */
 #define HIDPP_QUIRK_WTP_PHYSICAL_BUTTONS	BIT(22)
 #define HIDPP_QUIRK_NO_HIDINPUT			BIT(23)
@@ -3732,6 +3733,13 @@ static const struct hid_device_id hidpp_devices[] = {
 	  LDJ_DEVICE(0xb30b),
 	  .driver_data = HIDPP_QUIRK_HIDPP_CONSUMER_VENDOR_KEYS },
 
+	{ /* Logitech G403 Gaming Mouse over Lightspeed */
+	  LDJ_DEVICE(0x405d),
+	  .driver_data = HIDPP_QUIRK_BATTERY_VOLTAGE_X1001 },
+	{ /* Logitech G900 Gaming Mouse over Lightspeed */
+	  LDJ_DEVICE(0x4053),
+	  .driver_data = HIDPP_QUIRK_BATTERY_VOLTAGE_X1001 },
+
 	{ LDJ_DEVICE(HID_ANY_ID) },
 
 	{ /* Keyboard LX501 (Y-RR53) */
@@ -3750,13 +3758,15 @@ static const struct hid_device_id hidpp_devices[] = {
 	{ L27MHZ_DEVICE(HID_ANY_ID) },
 
 	{ /* Logitech G403 Wireless Gaming Mouse over USB */
-	  HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, 0xC082) },
+	  HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, 0xC082),
+	  .driver_data = HIDPP_QUIRK_BATTERY_VOLTAGE_X1001 },
 	{ /* Logitech G703 Gaming Mouse over USB */
 	  HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, 0xC087) },
 	{ /* Logitech G703 Hero Gaming Mouse over USB */
 	  HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, 0xC090) },
 	{ /* Logitech G900 Gaming Mouse over USB */
-	  HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, 0xC081) },
+	  HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, 0xC081),
+	  .driver_data = HIDPP_QUIRK_BATTERY_VOLTAGE_X1001 },
 	{ /* Logitech G903 Gaming Mouse over USB */
 	  HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, 0xC086) },
 	{ /* Logitech G903 Hero Gaming Mouse over USB */
-- 
2.23.0

