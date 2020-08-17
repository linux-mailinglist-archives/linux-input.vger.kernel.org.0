Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF371246063
	for <lists+linux-input@lfdr.de>; Mon, 17 Aug 2020 10:37:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726361AbgHQIhO (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 17 Aug 2020 04:37:14 -0400
Received: from mout.gmx.net ([212.227.15.19]:56953 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726385AbgHQIhK (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 17 Aug 2020 04:37:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1597653424;
        bh=EpluQfC1jJer9O26mx9jJK22gZCAA6SzOPMybTShMi8=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
        b=dz1927svERMq97Fda3A7xxjOcxZW+HBAoYCD8zBpilIiO6VZYrxOdXIQcB54w2xmt
         DzSTPeGlQe/6pHG9MG5aGI/zIU/CqgtxVJi3sbvqk5UgfYCU+lz3n5jmRjw47yWBwz
         FGOerTgY8yluPM96SngGknsLmsXkt35svBLoYCHI=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([95.91.214.168]) by mail.gmx.com
 (mrgmx005 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1N4zAs-1kqnIK2LyO-010vt6; Mon, 17 Aug 2020 10:37:04 +0200
From:   Sebastian Parschauer <s.parschauer@gmx.de>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     linux-input@vger.kernel.org,
        Sebastian Parschauer <s.parschauer@gmx.de>
Subject: [PATCH] HID: quirks: Always poll three more Lenovo PixArt mice
Date:   Mon, 17 Aug 2020 10:36:28 +0200
Message-Id: <20200817083628.21075-1-s.parschauer@gmx.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:vGMmbxhyA0R+Xxl0q0/qU9tBY1wy1bCS+W5Wz59paAnzFgWHbyr
 afxyK/ZQjkpZDmjD26ElWwEr3kEQBO3ZshTH3QOMPrQqcBxhwl9ZXCbv04hmN+7c54XZk8F
 ExrZkjF7/cGVGcqEC4Y2j2N9A+IaJXiljCPITW2XIjs5AevKFGoDfugFGuJjxDC1y0gyHX/
 otFe+9bhG9OrXG0gFrioA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:trvI5EiIhV4=:zT4jBL9VJExmra6q5SxbyQ
 HSHGLlg5n6oA5Eg65DDaqNDKY7mH6LNjMpcoFDMZju88nUpnfeep4XD0CkHbD7TtOLU74JRhy
 Kmdb+vEDJoi9sUuzA25zUeDk0ZBs4GkIUBHhL32lj+T2yDGf8AqERqJf4nIFEHPXKIqBJsobs
 iGOCxwDO9iy3UocvIz8kXsJe2zvVV2XuVXcpUZdgV8vIL+a+uJaG1dZrMgwokYUfeYY6pY+qM
 jJoWLFQhn9JsKEN5KOaNp7gkT7mr0AAbkn84GcjnID8M5Oey1+O6bnwuDqGMXuXniOUeq8Dob
 Z5i/O5PQTLXPNEyhXJJ35iZBuyuoegLxD26TOD7IOCYItV14E11U1DHqsLsV23zBGET2BEMTS
 JUF2qp2vZHDSzRyUYV6jknBiqWbo1jbLjxfE2jy0mfHMLUuzjAgmSKuSvcDRT3q2i8g/IT0ja
 +B+8cCvqKjigHzetS1kbwKb3Ni+DqBh9gPnK+fqNoRxYNt+EYqATQSp8BTez6yY0BFq1izHW6
 7lAgCtXcz/kCK5kU97Zq6lSmIppshtmAyqFR8j8hIR/BZcps5P60LLGUip+x9fYQbf5QGjSPC
 SC/UWbRurHlXA7fix2Mn88cEEz4T3lO1Ixfsa0a25qnUZQmgCBIEWoogwRNpkTOXTioFzwqot
 eoFB9eZed9MDXDXVhN033ckTqMGYY7uLIvbLMhzI1OKiTBBN8yikr8D1VgB3P34d902u3OLV/
 f8u3+wskCM8DmA2uhURXeIkhaPELvB8xBygRrmexGnt0YIs35ob5q/BX5LX4E+1Uym0N/i2HT
 IiDSZR8PAKmSa3fkplhv7mAAsLsyLRwl103nbSBi3w9QzuV7es33uWwYse67kUFTjLwyimidr
 stRDYNe8aJtlEWfdx9m9cqIq4ejD1iTs88ZJUh3Cro9roqXDtlrt42tw0WpCg7D2wuLAD3lpP
 KbrTGF8SBNT7h+BZt4EFq7Tp/Hhs70flaAknYxJoV+PSMGGDZ0zPKaa/BCLsmfISJrzh+ujcj
 9PUuNz3F1n9KsI389WjfmeEH39jnn4RK3nwc6CiXhBK1Qc+T73gDfb0mwgr4RahFmoACE6e/K
 XBv1NIsCM8LEPFkyLqb5AxcJo17am6dSwUuJMlK+9K+3yJHkfmCbUEPi/g6CpSiJ85yesSbUt
 Gn8A7R0ZDkCFD+n/hREAWgZLpgS6ot0ArarP9JqUp60ao0lN8x8l9qfm8mQNN68IS/NgkWvHa
 nxzKcgH0FtH3M8j728vW/4rcafTw5UUl9mqiiUQ==
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The PixArt OEM mice are known for disconnecting every minute in
runlevel 1 or 3 if they are not always polled. One Lenovo PixArt
mouse is already fixed. Got two references for 17ef:602e and three
references for 17ef:6019 misbehaving like this. Got one direct bug
report for 17ef:6093 from Wyatt Ward (wyatt8740). So add
HID_QUIRK_ALWAYS_POLL for all of them.

Link: https://github.com/sriemer/fix-linux-mouse issue 22
Signed-off-by: Sebastian Parschauer <s.parschauer@gmx.de>
=2D--
 drivers/hid/hid-ids.h    | 3 +++
 drivers/hid/hid-quirks.c | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index 6221888aae99..a8e3b2796be8 100644
=2D-- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -728,6 +728,9 @@
 #define USB_DEVICE_ID_LENOVO_TPPRODOCK	0x6067
 #define USB_DEVICE_ID_LENOVO_X1_COVER	0x6085
 #define USB_DEVICE_ID_LENOVO_PIXART_USB_MOUSE_608D	0x608d
+#define USB_DEVICE_ID_LENOVO_PIXART_USB_MOUSE_6019	0x6019
+#define USB_DEVICE_ID_LENOVO_PIXART_USB_MOUSE_602E	0x602e
+#define USB_DEVICE_ID_LENOVO_PIXART_USB_MOUSE_6093	0x6093

 #define USB_VENDOR_ID_LG		0x1fd2
 #define USB_DEVICE_ID_LG_MULTITOUCH	0x0064
diff --git a/drivers/hid/hid-quirks.c b/drivers/hid/hid-quirks.c
index c242150d35a3..a65aef6a322f 100644
=2D-- a/drivers/hid/hid-quirks.c
+++ b/drivers/hid/hid-quirks.c
@@ -105,6 +105,9 @@ static const struct hid_device_id hid_quirks[] =3D {
 	{ HID_USB_DEVICE(USB_VENDOR_ID_KYE, USB_DEVICE_ID_KYE_EASYPEN_M406XE), H=
ID_QUIRK_MULTI_INPUT },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_KYE, USB_DEVICE_ID_PIXART_USB_OPTICAL_MOU=
SE_ID2), HID_QUIRK_ALWAYS_POLL },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_LENOVO, USB_DEVICE_ID_LENOVO_PIXART_USB_M=
OUSE_608D), HID_QUIRK_ALWAYS_POLL },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_LENOVO, USB_DEVICE_ID_LENOVO_PIXART_USB_M=
OUSE_6019), HID_QUIRK_ALWAYS_POLL },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_LENOVO, USB_DEVICE_ID_LENOVO_PIXART_USB_M=
OUSE_602E), HID_QUIRK_ALWAYS_POLL },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_LENOVO, USB_DEVICE_ID_LENOVO_PIXART_USB_M=
OUSE_6093), HID_QUIRK_ALWAYS_POLL },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, USB_DEVICE_ID_LOGITECH_C007), H=
ID_QUIRK_ALWAYS_POLL },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, USB_DEVICE_ID_LOGITECH_C077), H=
ID_QUIRK_ALWAYS_POLL },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, USB_DEVICE_ID_LOGITECH_KEYBOARD=
_G710_PLUS), HID_QUIRK_NOGET },
=2D-
2.26.2

