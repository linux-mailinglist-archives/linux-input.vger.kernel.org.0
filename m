Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 55B38CCD9C
	for <lists+linux-input@lfdr.de>; Sun,  6 Oct 2019 03:04:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726968AbfJFBEG (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 5 Oct 2019 21:04:06 -0400
Received: from mail-40136.protonmail.ch ([185.70.40.136]:32585 "EHLO
        mail-40136.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727008AbfJFBEG (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sat, 5 Oct 2019 21:04:06 -0400
Date:   Sun, 06 Oct 2019 01:04:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=default; t=1570323843;
        bh=xOf7naOIf6rDpc0khn4XCANsLt39rlB4TiL3sCEDg70=;
        h=Date:To:From:Cc:Reply-To:Subject:Feedback-ID:From;
        b=yGvuqtfzb4tOobTwRTNB+3m7L6HP02jRum1TsROQSWZ9wTKat9xzFemc5anAYO2im
         1Ir2Df6MXJnmeqk7CgpA5nc/N/S46XsrzBg8apTdwx9JvS+6jI8XDmHxM5qkh60yWq
         4lUnbH+oOvnKavkBXmM7b63U8jm9s8tVkEu0W28k=
To:     "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
From:   Mazin Rezk <mnrzk@protonmail.com>
Cc:     "benjamin.tissoires@redhat.com" <benjamin.tissoires@redhat.com>,
        "jikos@kernel.org" <jikos@kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "lains@archlinux.org" <lains@archlinux.org>,
        "mnrzk@protonmail.com" <mnrzk@protonmail.com>
Reply-To: Mazin Rezk <mnrzk@protonmail.com>
Subject: [PATCH v3 1/4] HID: logitech: Add MX Mice over Bluetooth
Message-ID: <l7xYjnA9EGfZe03FsrFhnH2aMq8qS8plWhHVvOtY_l4ShZ1NV6HA6hn9aI-jAzbLYUGFCIQCIKkx9z42Uoj4-AZDwBfRcAecYIn-0ZA5upE=@protonmail.com>
Feedback-ID: 18B_FC5q-t32TXzMsVp9BgkgrdNH3iwklfW8WOrHrcxZA0WRj7JodCh5VXKxs6A3OaiHK0QNd8wi3SImKex8yQ==:Ext:ProtonMail
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=7.0 tests=ALL_TRUSTED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HK_RANDOM_REPLYTO
        autolearn=no autolearn_force=no version=3.4.2
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.protonmail.ch
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This patch adds support for several MX mice over Bluetooth. The device IDs
have been copied from the libratbag device database and their features
have been based on their DJ device counterparts.

Signed-off-by: Mazin Rezk <mnrzk@protonmail.com>
---
 drivers/hid/hid-logitech-hidpp.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hi=
dpp.c
index 0179f7ed77e5..85fd0c17cc2f 100644
--- a/drivers/hid/hid-logitech-hidpp.c
+++ b/drivers/hid/hid-logitech-hidpp.c
@@ -3773,6 +3773,24 @@ static const struct hid_device_id hidpp_devices[] =
=3D {
 =09{ /* MX5500 keyboard over Bluetooth */
 =09  HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_LOGITECH, 0xb30b),
 =09  .driver_data =3D HIDPP_QUIRK_HIDPP_CONSUMER_VENDOR_KEYS },
+=09{ /* MX Anywhere 2 mouse over Bluetooth */
+=09  HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_LOGITECH, 0xb013),
+=09  .driver_data =3D HIDPP_QUIRK_HI_RES_SCROLL_X2121 },
+=09{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_LOGITECH, 0xb018),
+=09  .driver_data =3D HIDPP_QUIRK_HI_RES_SCROLL_X2121 },
+=09{ /* MX Anywhere 2S mouse over Bluetooth */
+=09  HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_LOGITECH, 0xb01a),
+=09  .driver_data =3D HIDPP_QUIRK_HI_RES_SCROLL_X2121 },
+=09{ /* MX Master mouse over Bluetooth */
+=09  HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_LOGITECH, 0xb012),
+=09  .driver_data =3D HIDPP_QUIRK_HI_RES_SCROLL_X2121 },
+=09{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_LOGITECH, 0xb017),
+=09  .driver_data =3D HIDPP_QUIRK_HI_RES_SCROLL_X2121 },
+=09{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_LOGITECH, 0xb01e),
+=09  .driver_data =3D HIDPP_QUIRK_HI_RES_SCROLL_X2121 },
+=09{ /* MX Master 2S mouse over Bluetooth */
+=09  HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_LOGITECH, 0xb019),
+=09  .driver_data =3D HIDPP_QUIRK_HI_RES_SCROLL_X2121 },
 =09{}
 };

--
2.23.0

