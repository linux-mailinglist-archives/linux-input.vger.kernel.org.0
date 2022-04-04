Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9838A4F1286
	for <lists+linux-input@lfdr.de>; Mon,  4 Apr 2022 12:03:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240274AbiDDKFY (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 4 Apr 2022 06:05:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238728AbiDDKFX (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 4 Apr 2022 06:05:23 -0400
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CEBE3B56D
        for <linux-input@vger.kernel.org>; Mon,  4 Apr 2022 03:03:26 -0700 (PDT)
Received: from relay4-d.mail.gandi.net (unknown [217.70.183.196])
        by mslow1.mail.gandi.net (Postfix) with ESMTP id BFB88C5AA3
        for <linux-input@vger.kernel.org>; Mon,  4 Apr 2022 10:03:16 +0000 (UTC)
Received: (Authenticated sender: hadess@hadess.net)
        by mail.gandi.net (Postfix) with ESMTPSA id 2CA44E0012;
        Mon,  4 Apr 2022 10:03:11 +0000 (UTC)
From:   Bastien Nocera <hadess@hadess.net>
To:     linux-input@vger.kernel.org
Cc:     =?UTF-8?q?Filipe=20La=C3=ADns?= <lains@riseup.net>
Subject: [PATCH] HID: logitech-hidpp: Add Signature M650
Date:   Mon,  4 Apr 2022 12:03:11 +0200
Message-Id: <20220404100311.3304-1-hadess@hadess.net>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add support for HID++ over Bluetooth for the Logitech Signature
M650 mouse. It comes with a dongle but can also be used over Bluetooth
without one.

Signed-off-by: Bastien Nocera <hadess@hadess.net>
---
 drivers/hid/hid-logitech-hidpp.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
index 81de88ab2ecc..a2a9f6f54b2e 100644
--- a/drivers/hid/hid-logitech-hidpp.c
+++ b/drivers/hid/hid-logitech-hidpp.c
@@ -4344,6 +4344,8 @@ static const struct hid_device_id hidpp_devices[] = {
 	  HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_LOGITECH, 0xb01d) },
 	{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_LOGITECH, 0xb01e),
 	  .driver_data = HIDPP_QUIRK_HI_RES_SCROLL_X2121 },
+	{ /* Signature M650 over Bluetooth */
+	  HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_LOGITECH, 0xb02a) },
 	{ /* MX Master 3 mouse over Bluetooth */
 	  HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_LOGITECH, 0xb023),
 	  .driver_data = HIDPP_QUIRK_HI_RES_SCROLL_X2121 },
-- 
2.35.1

