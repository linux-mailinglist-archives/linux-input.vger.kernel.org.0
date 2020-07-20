Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8795227024
	for <lists+linux-input@lfdr.de>; Mon, 20 Jul 2020 23:05:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726601AbgGTVFp (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 20 Jul 2020 17:05:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726012AbgGTVFp (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 20 Jul 2020 17:05:45 -0400
X-Greylist: delayed 477 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 20 Jul 2020 14:05:45 PDT
Received: from zero.eik.bme.hu (zero.eik.bme.hu [IPv6:2001:738:2001:2001::2001])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 956D6C061794
        for <linux-input@vger.kernel.org>; Mon, 20 Jul 2020 14:05:45 -0700 (PDT)
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
        by localhost (Postfix) with SMTP id 24922747DFA;
        Mon, 20 Jul 2020 22:57:41 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
        id 0A114747871; Mon, 20 Jul 2020 22:57:41 +0200 (CEST)
From:   BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH] HID: apple: Add support for Matias wireless keyboard
Date:   Mon, 20 Jul 2020 22:53:46 +0200
To:     linux-input@vger.kernel.org
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Message-Id: <20200720205741.0A114747871@zero.eik.bme.hu>
X-Spam-Checker-Version: Sophos PMX: 6.4.8.2820816, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2020.7.20.204817, AntiVirus-Engine: 5.75.0, AntiVirus-Data: 2020.7.20.5750000
X-Spam-Flag: NO
X-Spam-Probability: 8%
X-Spam-Level: 
X-Spam-Status: No, score=8% required=50%
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The Matias Wireless keyboard has an Apple like layout and identifies
as ISO RevB Alu keyboard. Use hid-apple for it so Fn key and media
control functions work as expected.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 drivers/hid/hid-apple.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/hid/hid-apple.c b/drivers/hid/hid-apple.c
index e82f604d33e9..6b8f0d004d34 100644
--- a/drivers/hid/hid-apple.c
+++ b/drivers/hid/hid-apple.c
@@ -503,6 +503,8 @@ static const struct hid_device_id apple_devices[] = {
 		.driver_data = APPLE_HAS_FN },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_ALU_REVB_ISO),
 		.driver_data = APPLE_HAS_FN },
+	{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_ALU_REVB_ISO),
+		.driver_data = APPLE_HAS_FN },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_ALU_REVB_JIS),
 		.driver_data = APPLE_HAS_FN },
 	{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_ALU_WIRELESS_ANSI),
-- 
2.21.3

