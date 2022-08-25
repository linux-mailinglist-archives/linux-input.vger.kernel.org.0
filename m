Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1CE325A1078
	for <lists+linux-input@lfdr.de>; Thu, 25 Aug 2022 14:30:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241699AbiHYM3t convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-input@lfdr.de>); Thu, 25 Aug 2022 08:29:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241680AbiHYM3m (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 25 Aug 2022 08:29:42 -0400
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03D50B2DAB
        for <linux-input@vger.kernel.org>; Thu, 25 Aug 2022 05:29:40 -0700 (PDT)
Received: (Authenticated sender: hadess@hadess.net)
        by mail.gandi.net (Postfix) with ESMTPSA id 84ADF40007;
        Thu, 25 Aug 2022 12:29:37 +0000 (UTC)
Message-ID: <4542beb149883ab5dfdcfd7f6bb4b516e5c1bcdb.camel@hadess.net>
Subject: [PATCH] HID: logitech-hidpp: Enable HID++ for all the Logitech
 Bluetooth devices
From:   Bastien Nocera <hadess@hadess.net>
To:     Filipe =?ISO-8859-1?Q?La=EDns?= <lains@riseup.net>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org,
        Nestor Lopez Casado <nlopezcasad@logitech.com>
Date:   Thu, 25 Aug 2022 14:29:36 +0200
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.44.4 (3.44.4-1.fc36) 
MIME-Version: 1.0
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Probe for HID++ support over Bluetooth for all the Logitech Bluetooth
devices. As Logitech doesn't have a list of Bluetooth devices that
support HID++ over Bluetooth, probe every device. The HID++ driver
will fall back to plain HID if the device does not support HID++.

Note that this change might cause upower to export 2 batteries for
certain Bluetooth LE devices which export their battery information
through the Bluetooth BATT profile. This particular bug is tracked at:
https://gitlab.freedesktop.org/upower/upower/-/issues/166

Tested with a Logitech Signature M650 mouse, over Bluetooth

Signed-off-by: Bastien Nocera <hadess@hadess.net>
---

Note that I could not test whether the Harmony PS3 (handled in hid-sony.c)
or DiNovo Edge keyboard (handled in hid-input.c) devices would correctly fallback
to those drivers in that case.

Ways to test this would be appreciated (or merge this, and wait for feedback...)

 drivers/hid/hid-logitech-hidpp.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
index 81de88ab2ecc..86e7a38d8a9a 100644
--- a/drivers/hid/hid-logitech-hidpp.c
+++ b/drivers/hid/hid-logitech-hidpp.c
@@ -4347,6 +4347,9 @@ static const struct hid_device_id hidpp_devices[] = {
        { /* MX Master 3 mouse over Bluetooth */
          HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_LOGITECH, 0xb023),
          .driver_data = HIDPP_QUIRK_HI_RES_SCROLL_X2121 },
+
+       { /* And try to enable HID++ for all the Logitech Bluetooth devices */
+         HID_DEVICE(BUS_BLUETOOTH, HID_GROUP_ANY, USB_VENDOR_ID_LOGITECH, HID_ANY_ID) },
        {}
 };
 
-- 
2.37.2

