Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C02A2364EA
	for <lists+linux-input@lfdr.de>; Wed,  5 Jun 2019 21:47:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726613AbfFETqH (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 5 Jun 2019 15:46:07 -0400
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:38269 "EHLO
        out4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726461AbfFETqF (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 5 Jun 2019 15:46:05 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.nyi.internal (Postfix) with ESMTP id 549F722492;
        Wed,  5 Jun 2019 15:46:04 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Wed, 05 Jun 2019 15:46:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        pedrovanzella.com; h=from:to:cc:subject:date:message-id
        :in-reply-to:references:mime-version:content-transfer-encoding;
         s=fm3; bh=4tneQN45dmaDB7utUFDJes91/YkdtJOJKDbbcKMVmV0=; b=d+dY4
        dt1VZJbCHPW1Jy7jFkOHUc3/TD2IKQJxmJ3fslpDDR7zbF2dCggKNO2jZ333J7CX
        5iXxy/8fnb5W5vh38aDoeULeKaachCigOqDzCnz5gdYF7N3RPTHeNBJt1dqeJ71X
        wcbubndTP2XGRh6Tj8ThgyyacZv2pOXhK6ug+GF+H8i8OmbEPcscLH3ZVz+HEEgc
        Tam4nxR5cd4Pnx2745q/VkT4R6UkiF6lBOMfBDaEY1VpBe/cAXYwgBKjqBieNeCk
        GbwG6ONMTUeIIbHMtQegATbPKWfq4DeT5I/79itJpVzi3nIRYwytql2RrbZKc7vp
        fEUf6rUMcI7kobJng==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm2; bh=4tneQN45dmaDB7utUFDJes91/YkdtJOJKDbbcKMVmV0=; b=bZ0GtyXv
        8vecMcX9yD4lC+mK5irHcgVp3g4R/HjvT3PtbhnaX7tXswAUizmVJyy/EOyXbpRo
        TLTEoDrE5YmFJbx8Ygnmn7PhSic+Hrt/wqXOx6iMJMPQ5TvTF/6TXq0PtU3cC6M8
        5+URsXiU4QM6fr3jAWC821IWI6LGV2zPOtBA1TBLIn4jhhvelb+PMd3C9MVAxF0z
        Qtl1741px4GvfKZeWAadCxSTwsnf31AU1aVfTjEp7fgGVUQE/G1yKOUvvkD6xAKa
        0iyabnzrnljQ/kns9NiNtUuv7lcURhrjy/GcZcd7gSu7rJ0AC/sj2emgi6yGMs4w
        SvTh3BOn3V8GJQ==
X-ME-Sender: <xms:_Bv4XHsrid79TVE4LYroISQawrq7nk9vJbhZRaCjBK2_UrSS0idvTg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrudegvddgudeggecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomheprfgvughr
    ohcugggrnhiivghllhgruceophgvughrohesphgvughrohhvrghniigvlhhlrgdrtghomh
    eqnecukfhppeejtddrvdejrddvjedrudegleenucfrrghrrghmpehmrghilhhfrhhomhep
    phgvughrohesphgvughrohhvrghniigvlhhlrgdrtghomhenucevlhhushhtvghrufhiii
    gvpedt
X-ME-Proxy: <xmx:_Bv4XEHLXU6z20ihke3ktuO7DHQofe0MDytbYcOKAWcvISYHJDSHuQ>
    <xmx:_Bv4XM6HHwA8otjpLbF8NDmGsU53ktH5eDYaoFqJnL596CDntwwWng>
    <xmx:_Bv4XEk32Obdemi1TvlSatT0h2sDxxoAf4UdM2rceBSoSjEVNVNSmQ>
    <xmx:_Bv4XNUV6sXEjLWe4WAyR0lnagDc_qmIUlB4fNtYfq0GdLlcTfXQmw>
Received: from localhost (toroon020aw-lp130-02-70-27-27-149.dsl.bell.ca [70.27.27.149])
        by mail.messagingengine.com (Postfix) with ESMTPA id DB984380085;
        Wed,  5 Jun 2019 15:46:03 -0400 (EDT)
From:   Pedro Vanzella <pedro@pedrovanzella.com>
To:     linux-input@vger.kernel.org
Cc:     Pedro Vanzella <pedro@pedrovanzella.com>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/4] HID: hid-logitech-hidpp: add quirk to handle battery voltage
Date:   Wed,  5 Jun 2019 15:45:30 -0400
Message-Id: <20190605194533.18717-2-pedro@pedrovanzella.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190605194533.18717-1-pedro@pedrovanzella.com>
References: <20190605194533.18717-1-pedro@pedrovanzella.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

By adding this quirk we're able to handle battery voltage for devices
in both wired and wireless modes.

Signed-off-by: Pedro Vanzella <pedro@pedrovanzella.com>
---
 drivers/hid/hid-logitech-hidpp.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
index 72fc9c0566db..8b38c14725b8 100644
--- a/drivers/hid/hid-logitech-hidpp.c
+++ b/drivers/hid/hid-logitech-hidpp.c
@@ -63,7 +63,8 @@ MODULE_PARM_DESC(disable_tap_to_click,
 #define HIDPP_QUIRK_CLASS_G920			BIT(3)
 #define HIDPP_QUIRK_CLASS_K750			BIT(4)
 
-/* bits 2..20 are reserved for classes */
+/* bits 2..1f are reserved for classes */
+#define HIDPP_QUIRK_BATTERY_VOLTAGE_X1001	BIT(20)
 /* #define HIDPP_QUIRK_CONNECT_EVENTS		BIT(21) disabled */
 #define HIDPP_QUIRK_WTP_PHYSICAL_BUTTONS	BIT(22)
 #define HIDPP_QUIRK_NO_HIDINPUT			BIT(23)
@@ -3733,6 +3734,13 @@ static const struct hid_device_id hidpp_devices[] = {
 	  LDJ_DEVICE(0xb305),
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
@@ -3752,7 +3760,8 @@ static const struct hid_device_id hidpp_devices[] = {
 	{ /* Logitech G700 Gaming Mouse over USB */
 	  HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, 0xC06B) },
 	{ /* Logitech G900 Gaming Mouse over USB */
-	  HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, 0xC081) },
+	  HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, 0xC081),
+	  .driver_data = HIDPP_QUIRK_BATTERY_VOLTAGE_X1001 },
 	{ /* Logitech G920 Wheel over USB */
 	  HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, USB_DEVICE_ID_LOGITECH_G920_WHEEL),
 		.driver_data = HIDPP_QUIRK_CLASS_G920 | HIDPP_QUIRK_FORCE_OUTPUT_REPORTS},
-- 
2.21.0

