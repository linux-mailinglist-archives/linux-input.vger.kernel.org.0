Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A666E2B8D32
	for <lists+linux-input@lfdr.de>; Thu, 19 Nov 2020 09:32:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726485AbgKSI2L (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 19 Nov 2020 03:28:11 -0500
Received: from mout.web.de ([212.227.15.14]:60963 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725915AbgKSI2L (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 19 Nov 2020 03:28:11 -0500
X-Greylist: delayed 302 seconds by postgrey-1.27 at vger.kernel.org; Thu, 19 Nov 2020 03:28:10 EST
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
        s=dbaedf251592; t=1605774489;
        bh=1sIQo4mAwPfUeLG68QgGEkh80UAFrw6JgWqmH8C4NuY=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
        b=nPwQPQIcTupTegvmbUosn/xkDCjdwZMc+W6IqDDQiQrkF6UBqRSM8bHzE5AlGqvYJ
         tgh71lyFifvK94uZRKPd1AEsp04wcmLoYt3yvmFl2fBJok6pRTVl+d/JZu0esQ1fw3
         AIiCnZdr4uLlPxG79D0LdQCT0ZCxGffSVyVe1/8Y=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from localhost.localdomain ([134.3.46.87]) by smtp.web.de (mrweb003
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0MRUC0-1kqgkM3gO8-00SeWb; Thu, 19
 Nov 2020 09:23:06 +0100
From:   =?UTF-8?q?Felix=20H=C3=A4dicke?= <felixhaedicke@web.de>
To:     linux-input@vger.kernel.org
Cc:     =?UTF-8?q?Felix=20H=C3=A4dicke?= <felixhaedicke@web.de>,
        Sean O'Brien <seobrien@chromium.org>
Subject: [PATCH] HID: quirks: Add Apple Magic Trackpad 2 to hid_have_special_driver list
Date:   Thu, 19 Nov 2020 09:22:32 +0100
Message-Id: <20201119082232.8774-1-felixhaedicke@web.de>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:gKd4IjKHHTSpSQMVNQ9QibjAVH33ZzJJyRk/+4jIJcCHmboMpmk
 9ITc0HskBJV0xKwa8mR9EX2F/WNjeNBVLNKio/wkLYstm/gSm/UTOlFv9/U3w8sl7oqrFx+
 pw66FWCx1P212zFbDPiPdb46dP9Zgxvo3maF8wyXLY4x5WVS0gjFwghzo7hv4xQcfrxUcGO
 SQ40ErxMsYHgzMO4LKeQg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:lpvats1wd0k=:B5eMS3apmGHaHhKmr0eQHl
 FJsVY4MhHq5D6Ypr1vf8eplvob4y0WlHU3tmR68JoZiN+nKscRcun1K2fWS4wsHDGEBWj12/4
 4/tPaSoEy+bvUvEkY74CjAXpfSCEBBmhFUJB06c0PFR4v32zvsBMU5OKbF60MZ+xqQQRA76Ml
 Bvi4iUT9rKn4OSCHchVrizkmKF8IS4CUDMQpPCVAyF1R1cjY0VU/YCnSuvOTpi/InAz6LZfHa
 1QPSDF4GM0hfKbX5nq8mmpO3UJ7eADjMIsPv9rDU40w4HYXBBD+LMISGAh6nt2ixCRsM/DoTb
 5guvoU7SJbZwhvhl0uPxZtFaX4qpN6XGVVW+VF0Rqo/m9oNaFFSbD4chPBTyjNHX4h/G+NcSC
 wXjhu9f9/0yI9fXBtSGjxQbbrnkkeNQRZhICr6nqAAZonKHxWXoVBaSq5ms7gwVuxYGvsVGh2
 hz2iK511syKfogs9W8bvG0Clq1e/DsEdmrbnnTIWn3Oww2nkwlevLuVN9c31MWrXQFNT1o5Y7
 XktqNZu+J7PHO3Ua1uGJ6qfHee6semiqHTXJc0ShLD2CmWEyeIhlnWbfLs28SCylerTqcIMb4
 exwlU8FZ0NRBlZhyb5t62RDv1TOJxn6LUbuCajyC5wCd7XboV9wMR2EAFBf+QmrrAM07bhOui
 D75lSnB8WPcvdU7hUk9dO8eTdi0J1CLx9XCIATZwceGPU0KhjgKNdmVwH+fJjMQ+DjEquLMCq
 If7q4Z1EEwF3g7vWZmeNbXrgY4PgZsbrVKFUSSSTlcfnx2qaxLmDeewky74bOBWJW784zzpqj
 yUVZZMgXsuGmxOlPn6u5u/Cf6hQFlrZG+N5bxkFUIGduiXceoEnk2lhXARp1HfarV/F1nQMbZ
 5YyesapnCUcGOhakvNkw==
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The Apple Magic Trackpad 2 is handled by the magicmouse driver. And
there were severe stability issues when both drivers (hid-generic and
hid-magicmouse) were loaded for this device.

Fixes: https://bugzilla.kernel.org/show_bug.cgi?id=3D210241

Signed-off-by: Felix H=C3=A4dicke <felixhaedicke@web.de>
=2D--
 drivers/hid/hid-quirks.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/hid/hid-quirks.c b/drivers/hid/hid-quirks.c
index 7a2be0205dfd..0a589d956e5c 100644
=2D-- a/drivers/hid/hid-quirks.c
+++ b/drivers/hid/hid-quirks.c
@@ -473,6 +473,8 @@ static const struct hid_device_id hid_have_special_dri=
ver[] =3D {
 #if IS_ENABLED(CONFIG_HID_MAGICMOUSE)
 	{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_MAGICMOU=
SE) },
 	{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_MAGICTRA=
CKPAD) },
+	{ HID_BLUETOOTH_DEVICE(BT_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_MAGICTRAC=
KPAD2) },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_MAGICTRACKPAD2=
) },
 #endif
 #if IS_ENABLED(CONFIG_HID_MAYFLASH)
 	{ HID_USB_DEVICE(USB_VENDOR_ID_DRAGONRISE, USB_DEVICE_ID_DRAGONRISE_PS3)=
 },
=2D-
2.29.2

