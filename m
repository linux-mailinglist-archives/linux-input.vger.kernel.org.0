Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4FF4F44DBE4
	for <lists+linux-input@lfdr.de>; Thu, 11 Nov 2021 19:56:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229785AbhKKS7m (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 11 Nov 2021 13:59:42 -0500
Received: from pb-smtp20.pobox.com ([173.228.157.52]:64128 "EHLO
        pb-smtp20.pobox.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234004AbhKKS7m (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 11 Nov 2021 13:59:42 -0500
Received: from pb-smtp20.pobox.com (unknown [127.0.0.1])
        by pb-smtp20.pobox.com (Postfix) with ESMTP id 92B6F167659;
        Thu, 11 Nov 2021 13:56:52 -0500 (EST)
        (envelope-from lx@xanderlent.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to:cc
        :subject:date:message-id:mime-version:content-transfer-encoding;
         s=sasl; bh=bA7xqz29FSlvwYPh6b2h+lZu+bRNQqdBBFUC0Pp5JKg=; b=wmcO
        +y/uTrg31m9MngRutQ8pCg9yRjo7pMN5I1JJ4pQnnzMfab53jUSa3ajg56H9BQNO
        hJjzzuTmAO7TvrM2p4Hls2lHcDFv+Tg5ckv22URi6hQjawj3qIzmjgRYwNSstgrh
        v5J0i9V30XQPC9JcicGxjTV3X/KZyKgxrMVs5Sc=
Received: from pb-smtp20.sea.icgroup.com (unknown [127.0.0.1])
        by pb-smtp20.pobox.com (Postfix) with ESMTP id 8A80A167658;
        Thu, 11 Nov 2021 13:56:52 -0500 (EST)
        (envelope-from lx@xanderlent.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=xanderlent.com;
 h=from:to:cc:subject:date:message-id:mime-version:content-transfer-encoding;
 s=2021-09.pbsmtp; bh=ThrpCyQ+y3hOA8S29iQEhMIqMdaNgpL+m7JiVAzlwzk=;
 b=meXg060lCX/iSrs+sYz21AlZPE63BD400CkjK+vcV4lFo/HyKf7gJgkcrTr6LS6dEvEQLcBTtVUUFahbhuUxbSCnRi5iW6pM64mSKctpGecadHqCE/br4OYbJ8LtmDiAsNtG3w+VPZevY06qIBF3v/gMrL5QqDPS4S7M2Mow8SY=
Received: from localhost.localdomain (unknown [172.58.228.37])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by pb-smtp20.pobox.com (Postfix) with ESMTPSA id 6687A167657;
        Thu, 11 Nov 2021 13:56:47 -0500 (EST)
        (envelope-from lx@xanderlent.com)
From:   "Alexander F. Lent" <lx@xanderlent.com>
To:     linux-input@vger.kernel.org
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        "Diego 'Flameeyes' Petteno" <flameeyes@gmail.com>,
        Christian Schuerer-Waldheim <csw@xray.at>,
        Andreas Krist <andreas.krist@gmail.com>,
        Alexey Kaminsky <me@akaminsky.net>,
        Huei-Horng Yo <hiroshi@ghostsinthelab.org>,
        "Alexander F. Lent" <lx@xanderlent.com>
Subject: [PATCH] HID: apple: Fix Wireless Keyboards when NumLock is on
Date:   Thu, 11 Nov 2021 13:56:33 -0500
Message-Id: <20211111185633.17567-1-lx@xanderlent.com>
MIME-Version: 1.0
X-Pobox-Relay-ID: 1F78DCE8-4321-11EC-BDFD-F327CE9DA9D6-45904678!pb-smtp20.pobox.com
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Certain Apple Wireless Keyboard models (2007, 2009, and 2011) behave
strangely when NumLock is on: The driver switches into a numeric keypad
overlay mode, locking out most keys. Worse, it is not possible to exit
this mode from the keyboard, since there is no NumLock key.

This mode is not user-friendly, since it is not obvious why key presses
translate into no input or wrong input. Users think the keyboard is
broken and have resorted to workarounds like [1] and [2].
[1] https://help.ubuntu.com/community/AppleKeyboard#Numlock_on_Apple_Wire=
less_Keyboard
[2] https://wiki.archlinux.org/title/Apple_Keyboard#Numlock_is_on

Follow the principle of least astonishment: These keyboards don't have
keycap labels for a numeric keypad mode, so don't implement one.
(The mode is still necessary on older keyboards with the appropriate
keycap labels for a numeric keypad mode.)

Remove the APPLE_NUMLOCK_EMULATION quirk from the 9 Wireless Keyboard
2007/2009/2011 ANSI/ISO/JIS device entries in the driver's table.

Fixes: 6e7045990f35 ("HID: split Numlock emulation quirk from HID_QUIRK_A=
PPLE_HAS_FN.")
Fixes: 23aeb61e7e1f ("HID: add device IDs for new model of Apple Wireless=
 Keyboard")
Fixes: ad734bc15653 ("HID: hid-apple: add device ID of another wireless a=
luminium")
Fixes: 0a97e1e9f9a6 ("HID: apple: Add Apple wireless keyboard 2011 ANSI P=
ID")
Fixes: bd4a7ce1da06 ("HID: apple: add Apple wireless keyboard 2011 JIS mo=
del support")
Cc: stable@vger.kernel.org
Tested-by: Alexander F. Lent <lx@xanderlent.com>
Signed-off-by: Alexander F. Lent <lx@xanderlent.com>
---
 drivers/hid/hid-apple.c | 21 +++++++++------------
 1 file changed, 9 insertions(+), 12 deletions(-)

diff --git a/drivers/hid/hid-apple.c b/drivers/hid/hid-apple.c
index 2c9c5faa74a9..6bb62ac5a654 100644
--- a/drivers/hid/hid-apple.c
+++ b/drivers/hid/hid-apple.c
@@ -524,21 +524,19 @@ static const struct hid_device_id apple_devices[] =3D=
 {
 	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_ALU_REVB_JIS)=
,
 		.driver_data =3D APPLE_HAS_FN },
 	{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_ALU_WIR=
ELESS_ANSI),
-		.driver_data =3D APPLE_NUMLOCK_EMULATION | APPLE_HAS_FN },
+		.driver_data =3D APPLE_HAS_FN },
 	{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_ALU_WIR=
ELESS_ISO),
-		.driver_data =3D APPLE_NUMLOCK_EMULATION | APPLE_HAS_FN |
-			APPLE_ISO_TILDE_QUIRK },
+		.driver_data =3D APPLE_HAS_FN | APPLE_ISO_TILDE_QUIRK },
 	{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_ALU_WIR=
ELESS_2011_ISO),
-		.driver_data =3D APPLE_NUMLOCK_EMULATION | APPLE_HAS_FN |
-			APPLE_ISO_TILDE_QUIRK },
+		.driver_data =3D APPLE_HAS_FN | APPLE_ISO_TILDE_QUIRK },
 	{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_APPLE,
 				USB_DEVICE_ID_APPLE_ALU_WIRELESS_2011_ANSI),
-		.driver_data =3D APPLE_NUMLOCK_EMULATION | APPLE_HAS_FN },
+		.driver_data =3D APPLE_HAS_FN },
 	{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_APPLE,
 				USB_DEVICE_ID_APPLE_ALU_WIRELESS_2011_JIS),
-		.driver_data =3D APPLE_NUMLOCK_EMULATION | APPLE_HAS_FN },
+		.driver_data =3D APPLE_HAS_FN },
 	{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_ALU_WIR=
ELESS_JIS),
-		.driver_data =3D APPLE_NUMLOCK_EMULATION | APPLE_HAS_FN },
+		.driver_data =3D APPLE_HAS_FN },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_MAGIC_KEYBOAR=
D_2015),
 		.driver_data =3D APPLE_HAS_FN | APPLE_ISO_TILDE_QUIRK },
 	{ HID_BLUETOOTH_DEVICE(BT_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_MAGIC_KE=
YBOARD_2015),
@@ -626,12 +624,11 @@ static const struct hid_device_id apple_devices[] =3D=
 {
 	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_WELLSPRING9_J=
IS),
 		.driver_data =3D APPLE_HAS_FN | APPLE_RDESC_JIS },
 	{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_ALU_WIR=
ELESS_2009_ANSI),
-		.driver_data =3D APPLE_NUMLOCK_EMULATION | APPLE_HAS_FN },
+		.driver_data =3D APPLE_HAS_FN },
 	{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_ALU_WIR=
ELESS_2009_ISO),
-		.driver_data =3D APPLE_NUMLOCK_EMULATION | APPLE_HAS_FN |
-			APPLE_ISO_TILDE_QUIRK },
+		.driver_data =3D APPLE_HAS_FN | APPLE_ISO_TILDE_QUIRK },
 	{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_ALU_WIR=
ELESS_2009_JIS),
-		.driver_data =3D APPLE_NUMLOCK_EMULATION | APPLE_HAS_FN },
+		.driver_data =3D APPLE_HAS_FN },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_FOUNTAIN_TP_O=
NLY),
 		.driver_data =3D APPLE_NUMLOCK_EMULATION | APPLE_HAS_FN },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_GEYSER1_TP_ON=
LY),
--=20
2.31.1

