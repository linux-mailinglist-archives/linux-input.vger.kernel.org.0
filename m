Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E4078A318F
	for <lists+linux-input@lfdr.de>; Fri, 30 Aug 2019 09:51:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727125AbfH3HvP (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 30 Aug 2019 03:51:15 -0400
Received: from ml01.weidahitech.com ([61.222.87.235]:1674 "EHLO
        ml01.weidahitech.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726731AbfH3HvO (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 30 Aug 2019 03:51:14 -0400
Received: from mail02.WHT.local (mail02.wht.local [192.168.10.16])
        by ml01.weidahitech.com (8.13.8/8.13.8) with ESMTP id x7U7opML018847;
        Fri, 30 Aug 2019 15:50:51 +0800
Received: from x-Veriton-M4620G.WHT.local (192.168.10.88) by MAIL02.WHT.local
 (192.168.10.16) with Microsoft SMTP Server id 14.2.347.0; Fri, 30 Aug 2019
 15:50:52 +0800
From:   <hn.chen@weidahitech.com>
To:     <linux-input@vger.kernel.org>, <jikos@kernel.org>,
        <benjamin.tissoires@redhat.com>
CC:     <linux-kernel@vger.kernel.org>, <dmitry.torokhov@gmail.com>,
        <hn.chen@weidahitech.com>
Subject: [PATCH] HID: modify quirks of i2c-hid driver for weida's devices
Date:   Fri, 30 Aug 2019 15:58:30 +0800
Message-ID: <1567151910-3819-1-git-send-email-hn.chen@weidahitech.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: HungNien Chen <hn.chen@weidahitech.com>

This 'SET_PWR_WAKEUP_DEV' quirk only works for weida's devices with pid
0xC300 & 0xC301. Some weida's devices with other pids also need this quirk
now. Use 'HID_ANY_ID' instead of 0xC300 to make all of weida's devices can be
fixed on the power on issue. This modification should be safe since devices
without power on issue will send the power on command only once.

Signed-off-by: HungNien Chen <hn.chen@weidahitech.com>
---
 drivers/hid/i2c-hid/i2c-hid-core.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/hid/i2c-hid/i2c-hid-core.c b/drivers/hid/i2c-hid/i2c-hid-core.c
index 90164fe..2a7c6e3 100644
--- a/drivers/hid/i2c-hid/i2c-hid-core.c
+++ b/drivers/hid/i2c-hid/i2c-hid-core.c
@@ -169,9 +169,7 @@ struct i2c_hid {
 	__u16 idProduct;
 	__u32 quirks;
 } i2c_hid_quirks[] = {
-	{ USB_VENDOR_ID_WEIDA, USB_DEVICE_ID_WEIDA_8752,
-		I2C_HID_QUIRK_SET_PWR_WAKEUP_DEV },
-	{ USB_VENDOR_ID_WEIDA, USB_DEVICE_ID_WEIDA_8755,
+	{ USB_VENDOR_ID_WEIDA, HID_ANY_ID,
 		I2C_HID_QUIRK_SET_PWR_WAKEUP_DEV },
 	{ I2C_VENDOR_ID_HANTICK, I2C_PRODUCT_ID_HANTICK_5288,
 		I2C_HID_QUIRK_NO_IRQ_AFTER_RESET |
-- 
1.9.1

