Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3EDAC2CBF5
	for <lists+linux-input@lfdr.de>; Tue, 28 May 2019 18:29:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726600AbfE1Q3l (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 28 May 2019 12:29:41 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:35995 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726560AbfE1Q3l (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 28 May 2019 12:29:41 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.nyi.internal (Postfix) with ESMTP id B14C82226D;
        Tue, 28 May 2019 12:29:39 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Tue, 28 May 2019 12:29:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        pedrovanzella.com; h=from:to:cc:subject:date:message-id
        :mime-version:content-transfer-encoding; s=fm3; bh=HrYebImi0JpM/
        NU0tgSv9WvJ50qAhbEz9O2pwTX0xrQ=; b=Cb6y8ddVGUYrbJnqMk50tMZLjg9IB
        jd60Eyj5xqoZP72yX1Z7wFVzPADHWSOBaBzIXqUF8duYyPKu5A8Qby8xmHPAv1pB
        nGkV6nCaiknWOdycZ/Ao/YMQ/QSxbrkbapxuHmBb0GBKvqUotZgTosZbuNKsnQek
        N3aeG3Gr5dn8JmJCyzfpR+N7+3x+5B1YL9KOw0uF9/8iLvlb74LC5qvfCIchat51
        wZE+b2NyRgPPpIu3L71ozG50aXKMTp/hfRPnwTVybTtKcDk2V3LUKj20G26fhX2u
        O4mn9ZXtqMXcK6I5ZfxZICuoTw+cWbBIrPoRvA0mQJTmFXXgPc3tuE8LA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=HrYebImi0JpM/NU0t
        gSv9WvJ50qAhbEz9O2pwTX0xrQ=; b=xK1HTnr2SPDZzam9THiBW7zgjq8Z6icYI
        OJTzw2hLIPiBE5AXBQhY85j0uWYPBJuMQUmELO0I6X1LzC3353b72/yq3Xv5OeNv
        ht1CZ62zUEcEz0lghvNmZ1hS8BzqApuwaFEy7YRnye2mhhYvcEZGxdzSZQ1C+7TO
        2KtEbS8eEQI0zzHeVqH43N6E/x09STdYyM/z4D6w/DC6iODCjZ6A8MjYOHqzGkMI
        fy2wiKaAf8dgth2r5jHrE4NlAgqi+hI+MUY8O78+ZA661VCVtnNQPD80LZnE4oVw
        RJakI7N7kMLE07m4dtaqZd0zJzMS+6g8AP97XWjO/0dNwV2TFt9yw==
X-ME-Sender: <xms:82HtXFTereKlcQVQEKQjbFqsaEsuDBzjfJGPtSEAAzolCEBUMLPTUw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddruddvhedguddttdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefhvffufffkofgggfestdekredtredttdenucfhrhhomheprfgvughrohcu
    gggrnhiivghllhgruceophgvughrohesphgvughrohhvrghniigvlhhlrgdrtghomheqne
    cukfhppedukeegrddugeehrddufedurdektdenucfrrghrrghmpehmrghilhhfrhhomhep
    phgvughrohesphgvughrohhvrghniigvlhhlrgdrtghomhenucevlhhushhtvghrufhiii
    gvpedt
X-ME-Proxy: <xmx:82HtXLEO4kgzfqWtIoom2w4jI8BTmztua1n7a46HDc0q3agE5Jyjtw>
    <xmx:82HtXNlQnjlEf9UXJmh3nJykGvgqSviyG0OTAmQclsNA-dDa55jEgw>
    <xmx:82HtXO0Bq1OacDr1D0_-sD4HYg-wbAYi2gGchIIdeun8Vlj8yrsvgg>
    <xmx:82HtXDx5afBSwy9ADfEzA4f6Zt4yT6LPjjqxIorWP6TIXqvXLOm3xg>
Received: from localhost (toroon020aw-lp130-01-184-145-131-80.dsl.bell.ca [184.145.131.80])
        by mail.messagingengine.com (Postfix) with ESMTPA id BCABA8005A;
        Tue, 28 May 2019 12:29:38 -0400 (EDT)
From:   Pedro Vanzella <pedro@pedrovanzella.com>
To:     linux-input@vger.kernel.org
Cc:     Pedro Vanzella <pedro@pedrovanzella.com>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] HID: hid-logitech-hidpp: detect wireless lightspeed devices
Date:   Tue, 28 May 2019 12:29:24 -0400
Message-Id: <20190528162924.32754-1-pedro@pedrovanzella.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Send a low device index when the device is connected via the lightspeed
receiver so that the receiver will pass the message along to the device
instead of responding. If we don't do that, we end up thinking it's a
hidpp10 device and miss out on all new features available to newer devices.

This will enable correct detection of the following models:
G603, GPro, G305, G613, G900 and G903, and possibly others.

Signed-off-by: Pedro Vanzella <pedro@pedrovanzella.com>
---
 drivers/hid/hid-logitech-hidpp.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
index 72fc9c0566db..621fce141d9f 100644
--- a/drivers/hid/hid-logitech-hidpp.c
+++ b/drivers/hid/hid-logitech-hidpp.c
@@ -62,6 +62,7 @@ MODULE_PARM_DESC(disable_tap_to_click,
 #define HIDPP_QUIRK_CLASS_K400			BIT(2)
 #define HIDPP_QUIRK_CLASS_G920			BIT(3)
 #define HIDPP_QUIRK_CLASS_K750			BIT(4)
+#define HIDPP_QUIRK_CLASS_LIGHTSPEED		BIT(5)
 
 /* bits 2..20 are reserved for classes */
 /* #define HIDPP_QUIRK_CONNECT_EVENTS		BIT(21) disabled */
@@ -236,7 +237,11 @@ static int __hidpp_send_report(struct hid_device *hdev,
 	 * set the device_index as the receiver, it will be overwritten by
 	 * hid_hw_request if needed
 	 */
-	hidpp_report->device_index = 0xff;
+	if (hidpp->quirks & HIDPP_QUIRK_CLASS_LIGHTSPEED) {
+		hidpp_report->device_index = 0x01;
+	} else {
+		hidpp_report->device_index = 0xff;
+	}
 
 	if (hidpp->quirks & HIDPP_QUIRK_FORCE_OUTPUT_REPORTS) {
 		ret = hid_hw_output_report(hdev, (u8 *)hidpp_report, fields_count);
@@ -3753,6 +3758,9 @@ static const struct hid_device_id hidpp_devices[] = {
 	  HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, 0xC06B) },
 	{ /* Logitech G900 Gaming Mouse over USB */
 	  HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, 0xC081) },
+	{ /* Logitech Gaming Mice over Lightspeed Receiver */
+	  HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, 0xC539),
+	  .driver_data = HIDPP_QUIRK_CLASS_LIGHTSPEED },
 	{ /* Logitech G920 Wheel over USB */
 	  HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, USB_DEVICE_ID_LOGITECH_G920_WHEEL),
 		.driver_data = HIDPP_QUIRK_CLASS_G920 | HIDPP_QUIRK_FORCE_OUTPUT_REPORTS},
-- 
2.21.0

