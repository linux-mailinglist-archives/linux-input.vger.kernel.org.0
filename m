Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4CF51DDC94
	for <lists+linux-input@lfdr.de>; Sun, 20 Oct 2019 06:42:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726260AbfJTEmb (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 20 Oct 2019 00:42:31 -0400
Received: from mail-40135.protonmail.ch ([185.70.40.135]:27579 "EHLO
        mail-40135.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725875AbfJTEmb (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 20 Oct 2019 00:42:31 -0400
Date:   Sun, 20 Oct 2019 04:42:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=default; t=1571546549;
        bh=rgii3XUlaS68qqkAmx2Qld1DLClAKGeLVprB87vVEQU=;
        h=Date:To:From:Cc:Reply-To:Subject:Feedback-ID:From;
        b=gay1OAs75jFWqXk3c+0DpAK3UdcZKtoPKt7Ijh6OEUhOvAFHa6hed5MrqvbvgNJoG
         DQlLvhPhfufAeec9z76xeqKKAcMf/4RK6rLSweLHhzGI6Jh/70X30X7alSlpy6EfTR
         c2SLTHw+NlBhd0P5HQj2YAOOKg1DXGysWsdATL8Q=
To:     "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
From:   Mazin Rezk <mnrzk@protonmail.com>
Cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        "jikos@kernel.org" <jikos@kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        =?UTF-8?Q?Filipe_La=C3=ADns?= <lains@archlinux.org>,
        "mnrzk@protonmail.com" <mnrzk@protonmail.com>
Reply-To: Mazin Rezk <mnrzk@protonmail.com>
Subject: [PATCH v7 2/3] HID: logitech-hidpp: Support MX Master (b012, b01e)  over Bluetooth
Message-ID: <ERZ9cXZZZguesCRv1K7psMN0R6AfneyvvZBViy-Hz3AP6V_WUqsj5YGyyWAB94B7ADvkWNj657C0DC9MowsLR0L0OTXVVQ6iBxzl5YJy_6E=@protonmail.com>
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

This patch adds support for the MX Master over Bluetooth (b012, b01e).

I have only added the devices that have been tested, so the 0xb017 variant
of the MX Master needs to be added once it is tested.

Since this patch series adds support for Bluetooth LE devices in general,
other Bluetooth LE devices should also be added later

Thanks,
Mazin

Signed-off-by: Mazin Rezk <mnrzk@protonmail.com>
---
 drivers/hid/hid-logitech-hidpp.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hi=
dpp.c
index ee604b17514f..19b315e4e91b 100644
--- a/drivers/hid/hid-logitech-hidpp.c
+++ b/drivers/hid/hid-logitech-hidpp.c
@@ -3792,6 +3792,11 @@ static const struct hid_device_id hidpp_devices[] =
=3D {
 =09{ /* MX5500 keyboard over Bluetooth */
 =09  HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_LOGITECH, 0xb30b),
 =09  .driver_data =3D HIDPP_QUIRK_HIDPP_CONSUMER_VENDOR_KEYS },
+=09{ /* MX Master mouse over Bluetooth */
+=09  HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_LOGITECH, 0xb012),
+=09  .driver_data =3D HIDPP_QUIRK_HI_RES_SCROLL_X2121 },
+=09{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_LOGITECH, 0xb01e),
+=09  .driver_data =3D HIDPP_QUIRK_HI_RES_SCROLL_X2121 },
 =09{}
 };

--
2.23.0

