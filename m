Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 218AA69FE85
	for <lists+linux-input@lfdr.de>; Wed, 22 Feb 2023 23:29:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230435AbjBVW3c (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 22 Feb 2023 17:29:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232888AbjBVW3b (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 22 Feb 2023 17:29:31 -0500
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1D61769C
        for <linux-input@vger.kernel.org>; Wed, 22 Feb 2023 14:29:27 -0800 (PST)
Date:   Wed, 22 Feb 2023 22:29:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail3; t=1677104965; x=1677364165;
        bh=LIG5OnrvuBi268/TRf4S/OMLMlY9nX07VrQ5VsECQho=;
        h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
         Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
        b=KEi+QBjvZQWvWlPtVtO4dt+WACcl2LTBtoBXF1GjP1yVDgpelW6sAwVFgygd+BukW
         YCX6WF0hOVsPJAVv7KlHeDITVJU0FYQuQGEuGcQHVjIoQ0tejr9RonDuHrD5/L96/L
         sK/Eg+4dc+XYA1hZm3ps1EsgkAcbUK+RXZ1rxf90u0YhT0ciDyUc6B72OmBvIinKpE
         BYz46Od/MldluFf3C9Q/ReKo0ppPI6BsfHDZgxy12OZDTQWHNFuYACDDTcUkm7+uni
         5UEAYbPGmDCBXo3gbjos390GGLJIMD4LiIV56jrYNO8GhSMx6y3fB9XLIB/Un+JUMH
         paUfhxUFO057w==
To:     linux-input@vger.kernel.org
From:   Mavroudis Chatzilazaridis <mavchatz@protonmail.com>
Cc:     jikos@kernel.org, benjamin.tissoires@redhat.com, lains@riseup.net,
        Mavroudis Chatzilazaridis <mavchatz@protonmail.com>
Subject: [PATCH 1/2] HID: logitech-dj: Add support for new lightspeed receiver iteration
Message-ID: <20230222222800.83077-1-mavchatz@protonmail.com>
Feedback-ID: 20039310:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The lightspeed receiver for the Pro X Superlight uses 13 byte mouse reports
without a report id. The workaround for such cases has been adjusted to
handle these larger packets.

libratbag recognizes the device and input events are passing through.

https://github.com/libratbag/libratbag/pull/1122

Co-developed-by: Filipe La=C3=ADns <lains@riseup.net>
Signed-off-by: Filipe La=C3=ADns <lains@riseup.net>
Signed-off-by: Mavroudis Chatzilazaridis <mavchatz@protonmail.com>
---
 drivers/hid/hid-ids.h         |  1 +
 drivers/hid/hid-logitech-dj.c | 11 ++++++++---
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index 9e36b4cd905e..030524ed4548 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -848,6 +848,7 @@
 #define USB_DEVICE_ID_LOGITECH_NANO_RECEIVER_2=09=090xc534
 #define USB_DEVICE_ID_LOGITECH_NANO_RECEIVER_LIGHTSPEED_1=090xc539
 #define USB_DEVICE_ID_LOGITECH_NANO_RECEIVER_LIGHTSPEED_1_1=090xc53f
+#define USB_DEVICE_ID_LOGITECH_NANO_RECEIVER_LIGHTSPEED_1_2=090xc547
 #define USB_DEVICE_ID_LOGITECH_NANO_RECEIVER_POWERPLAY=090xc53a
 #define USB_DEVICE_ID_SPACETRAVELLER=090xc623
 #define USB_DEVICE_ID_SPACENAVIGATOR=090xc626
diff --git a/drivers/hid/hid-logitech-dj.c b/drivers/hid/hid-logitech-dj.c
index c358778e070b..82fe64ef4dbe 100644
--- a/drivers/hid/hid-logitech-dj.c
+++ b/drivers/hid/hid-logitech-dj.c
@@ -1692,11 +1692,12 @@ static int logi_dj_raw_event(struct hid_device *hde=
v,
 =09=09}
 =09=09/*
 =09=09 * Mouse-only receivers send unnumbered mouse data. The 27 MHz
-=09=09 * receiver uses 6 byte packets, the nano receiver 8 bytes.
+=09=09 * receiver uses 6 byte packets, the nano receiver 8 bytes,
+=09=09 * the lightspeed receiver (Pro X Superlight) 13 bytes.
 =09=09 */
 =09=09if (djrcv_dev->unnumbered_application =3D=3D HID_GD_MOUSE &&
-=09=09    size <=3D 8) {
-=09=09=09u8 mouse_report[9];
+=09=09    size <=3D 13){
+=09=09=09u8 mouse_report[14];

 =09=09=09/* Prepend report id */
 =09=09=09mouse_report[0] =3D REPORT_TYPE_MOUSE;
@@ -1980,6 +1981,10 @@ static const struct hid_device_id logi_dj_receivers[=
] =3D {
 =09  HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH,
 =09=09USB_DEVICE_ID_LOGITECH_NANO_RECEIVER_LIGHTSPEED_1_1),
 =09 .driver_data =3D recvr_type_gaming_hidpp},
+=09{ /* Logitech lightspeed receiver (0xc547) */
+=09  HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH,
+=09=09USB_DEVICE_ID_LOGITECH_NANO_RECEIVER_LIGHTSPEED_1_2),
+=09 .driver_data =3D recvr_type_gaming_hidpp},

 =09{ /* Logitech 27 MHz HID++ 1.0 receiver (0xc513) */
 =09  HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, USB_DEVICE_ID_MX3000_RECEIVER)=
,
--
2.34.1


