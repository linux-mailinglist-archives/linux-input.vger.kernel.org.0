Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8F44E6A8072
	for <lists+linux-input@lfdr.de>; Thu,  2 Mar 2023 11:56:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229562AbjCBK4G (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 2 Mar 2023 05:56:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229774AbjCBK4F (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 2 Mar 2023 05:56:05 -0500
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::223])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 281D23E60A;
        Thu,  2 Mar 2023 02:56:02 -0800 (PST)
Received: (Authenticated sender: hadess@hadess.net)
        by mail.gandi.net (Postfix) with ESMTPSA id C465C60007;
        Thu,  2 Mar 2023 10:55:59 +0000 (UTC)
From:   Bastien Nocera <hadess@hadess.net>
To:     linux-usb@vger.kernel.org, linux-input@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        =?UTF-8?q?Filipe=20La=C3=ADns?= <lains@riseup.net>,
        Nestor Lopez Casado <nlopezcasad@logitech.com>
Subject: [PATCH v3 3/6] HID: logitech-hidpp: Add Logitech G935 headset
Date:   Thu,  2 Mar 2023 11:55:52 +0100
Message-Id: <20230302105555.51417-3-hadess@hadess.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230302105555.51417-1-hadess@hadess.net>
References: <20230302105555.51417-1-hadess@hadess.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add the Logitech G935 headset that uses the HID++ protocol to the
list of supported devices.

Signed-off-by: Bastien Nocera <hadess@hadess.net>
---
No changes since v1

 drivers/hid/hid-logitech-hidpp.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
index 5a95f01a6129..4708819a6d79 100644
--- a/drivers/hid/hid-logitech-hidpp.c
+++ b/drivers/hid/hid-logitech-hidpp.c
@@ -4556,6 +4556,9 @@ static const struct hid_device_id hidpp_devices[] = {
 	{ /* Logitech G Pro Gaming Mouse over USB */
 	  HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, 0xC088) },
 
+	{ /* G935 Gaming Headset */
+	  HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, 0x0a87) },
+
 	{ /* MX5000 keyboard over Bluetooth */
 	  HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_LOGITECH, 0xb305),
 	  .driver_data = HIDPP_QUIRK_HIDPP_CONSUMER_VENDOR_KEYS },
-- 
2.39.2

