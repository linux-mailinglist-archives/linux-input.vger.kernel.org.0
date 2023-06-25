Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7641C73D214
	for <lists+linux-input@lfdr.de>; Sun, 25 Jun 2023 18:22:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229481AbjFYQWH (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 25 Jun 2023 12:22:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229667AbjFYQWG (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 25 Jun 2023 12:22:06 -0400
Received: from mail-0301.mail-europe.com (mail-0301.mail-europe.com [188.165.51.139])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0CD918D
        for <linux-input@vger.kernel.org>; Sun, 25 Jun 2023 09:22:01 -0700 (PDT)
Date:   Sun, 25 Jun 2023 16:21:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail3; t=1687710116; x=1687969316;
        bh=dkbkKkywTM+ffvqs2p1uk7wkn9i7Ko57glA4RAdYeL8=;
        h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
         Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
        b=GMbky8+my3ae8mRp+Q8yFXtVPrEcZBHUhcxtH0YuBGhK3cGwwYC/oVa8OI9S5SbVX
         SD/PUg4cczObTBgUMWArdsaFeLmcJHGMoiadcQYkvygkWdMItSMgQF/ZjTb7Og7DfM
         X2SgXjRVmNoVRva1ABycRZDpKxInpTa3pXK9x2NrGMPYpZlRfbi2rkVysy/J6R//TX
         epLhZdD3ha78hvAAyz/fLNjLRoiOve+d49P+TylqoCBSRjLxho0hlzd5WmW/MIE60z
         +yUFZQakxrQBZEipjHilU6eNZ0Y9Bf1qEkBw+uaklUgdgqs9I/8Vbnf3FSx3G58cG9
         8gveVUSbnbfpg==
To:     jikos@kernel.org
From:   Mavroudis Chatzilazaridis <mavchatz@protonmail.com>
Cc:     linux-input@vger.kernel.org, benjamin.tissoires@redhat.com,
        lains@riseup.net,
        Mavroudis Chatzilazaridis <mavchatz@protonmail.com>
Subject: [RESEND PATCH 1/2] HID: logitech-dj: Add support for new lightspeed receiver iteration
Message-ID: <20230625162131.17921-1-mavchatz@protonmail.com>
Feedback-ID: 20039310:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
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
index 5d29abac2300..ea3a1e7be2c7 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -864,6 +864,7 @@
 #define USB_DEVICE_ID_LOGITECH_NANO_RECEIVER_2=09=090xc534
 #define USB_DEVICE_ID_LOGITECH_NANO_RECEIVER_LIGHTSPEED_1=090xc539
 #define USB_DEVICE_ID_LOGITECH_NANO_RECEIVER_LIGHTSPEED_1_1=090xc53f
+#define USB_DEVICE_ID_LOGITECH_NANO_RECEIVER_LIGHTSPEED_1_2=090xc547
 #define USB_DEVICE_ID_LOGITECH_NANO_RECEIVER_POWERPLAY=090xc53a
 #define USB_DEVICE_ID_SPACETRAVELLER=090xc623
 #define USB_DEVICE_ID_SPACENAVIGATOR=090xc626
diff --git a/drivers/hid/hid-logitech-dj.c b/drivers/hid/hid-logitech-dj.c
index 62180414efcc..fef67da0de53 100644
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


