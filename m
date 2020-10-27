Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B88D29CAE9
	for <lists+linux-input@lfdr.de>; Tue, 27 Oct 2020 22:07:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2504494AbgJ0VHi (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 27 Oct 2020 17:07:38 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:41248 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2409083AbgJ0VHh (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 27 Oct 2020 17:07:37 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 8CD201C0B7F; Tue, 27 Oct 2020 22:07:33 +0100 (CET)
Date:   Tue, 27 Oct 2020 22:07:32 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Jiri Kosina <jikos@kernel.org>
Cc:     dmitry.torokhov@gmail.com, vojtech@suse.cz,
        linux-input@vger.kernel.org,
        kernel list <linux-kernel@vger.kernel.org>
Subject: Re: Proper support for Saitek X36F joystick
Message-ID: <20201027210732.GA4479@amd>
References: <20201027124235.GA27148@duo.ucw.cz>
 <nycvar.YFH.7.76.2010272006490.18859@cbobk.fhfr.pm>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="Nq2Wo0NMKNjxTN9z"
Content-Disposition: inline
In-Reply-To: <nycvar.YFH.7.76.2010272006490.18859@cbobk.fhfr.pm>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--Nq2Wo0NMKNjxTN9z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > This is from 4.19, but I doubt this changed recently.
> >=20
> > Saitek X36F+X35T combination is detected like this... in short one
> > hat, no switches, and lot of buttons.
> >=20
> > In reality, combination has 4 four-way switches (hats?), 2 slider
> > switches (three positions) and lot less buttons. Sliders and 3 of 4
> > hats are detected as groups of buttons. Last hat is strange, I can't
> > see anything that corresponds to it on evtest, and as long as it is
> > pushed in any direction, all the other events stop. (It is also one
> > I'd like to use).
> >=20
> > What needs to be done to get more useful mapping for userspace?
>=20
> It wouldn't be the first device produced by Saitek that has completely=20
> bogus report descriptor.
>=20
> The most straightforward way would be to let hid-saitek module claim the=
=20
> device, and fix the report descriptor (saitek_report_fixup()) before it's=
=20
> passed to hid parser so that it actually describes the events produced.
>=20
> You can either patch individual bytes (that's what saitek_report_fixup()=
=20
> is currently doing for another device), or replace the whole descriptor=
=20
> completely (see e.g. hid-kye for inspiration how this is done).

Thank you... replacing whole descriptors is rather easy.

Coming up with descriptors that works ... not so :-(. I can replace
descriptor with equivalent one, but things get horribly confused as
soon as I really try to change anything.

So far I have this, ideas would be welcome.

Best regards,
								Pavel

diff --git a/drivers/hid/Makefile b/drivers/hid/Makefile
index 4acb583c92a6..9ecdd344c542 100644
--- a/drivers/hid/Makefile
+++ b/drivers/hid/Makefile
@@ -103,6 +103,7 @@ obj-$(CONFIG_HID_ROCCAT)	+=3D hid-roccat.o hid-roccat-c=
ommon.o \
 	hid-roccat-lua.o hid-roccat-pyra.o hid-roccat-ryos.o hid-roccat-savu.o
 obj-$(CONFIG_HID_RMI)		+=3D hid-rmi.o
 obj-$(CONFIG_HID_SAITEK)	+=3D hid-saitek.o
+obj-m                           +=3D hid-saitek-joystick.o
 obj-$(CONFIG_HID_SAMSUNG)	+=3D hid-samsung.o
 obj-$(CONFIG_HID_SMARTJOYPLUS)	+=3D hid-sjoy.o
 obj-$(CONFIG_HID_SONY)		+=3D hid-sony.o
diff --git a/drivers/hid/hid-saitek-joystick.c b/drivers/hid/hid-saitek-joy=
stick.c
new file mode 100644
index 000000000000..69ac249fba55
--- /dev/null
+++ b/drivers/hid/hid-saitek-joystick.c
@@ -0,0 +1,125 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ *  HID driver for Saitek/Genius devices not fully compliant with HID stan=
dard
+ *
+ *  Copyright (c) 2009 Jiri Kosina
+ *  Copyright (c) 2009 Tomas Hanak
+ *  Copyright (c) 2012 Nikolai Kondrashov
+ *  Copyright (c) 2020 Pavel Machek
+ */
+
+/*
+
+sudo rmmod hid-saitek-joystick && make drivers/hid/hid-saitek-joystick.ko =
&& sudo insmod drivers/hid/hid-saitek-joystick.ko
+
+
+python3 ./js.py -o code
+
+  Event type 1 (EV_KEY)
+    Event code 288 (BTN_TRIGGER)  -- trigger
+    Event code 289 (BTN_THUMB)    -- A
+    Event code 290 (BTN_THUMB2)   -- B
+    Event code 291 (BTN_TOP)      -- launch
+    Event code 292 (BTN_TOP2)     -- D  =20
+    Event code 293 (BTN_PINKIE)   -- thumb on throttle
+    Event code 294 (BTN_BASE)     -- pinkie on stick  / f lock
+    Event code 295 (BTN_BASE2)    -- C
+    Event code 296 (BTN_BASE3)    \
+    Event code 297 (BTN_BASE4)    |  mode slider=20
+    Event code 298 (BTN_BASE5)    /
+    Event code 299 (BTN_BASE6)   \
+    Event code 300 (?)           |  aux slider
+    Event code 301 (?)           /
+    Event code 302 (?)                    \
+    Event code 303 (BTN_DEAD)              \ left hat on joystick
+    Event code 704 (BTN_TRIGGER_HAPPY1)    /
+    Event code 705 (BTN_TRIGGER_HAPPY2)   /
+    Event code 706 (BTN_TRIGGER_HAPPY3)  \
+    Event code 707 (BTN_TRIGGER_HAPPY4)   \ index hat on throttle
+    Event code 708 (BTN_TRIGGER_HAPPY5)   /=20
+    Event code 709 (BTN_TRIGGER_HAPPY6)  /
+    Event code 710 (BTN_TRIGGER_HAPPY7)   \
+    Event code 711 (BTN_TRIGGER_HAPPY8)    \ thumb hat on throttle
+    Event code 712 (BTN_TRIGGER_HAPPY9)    /
+    Event code 713 (BTN_TRIGGER_HAPPY10)  /
+
+ Rudder and RZ axis are swapped.
+ */
+
+#include <linux/device.h>
+#include <linux/hid.h>
+#include <linux/module.h>
+
+#include "hid-ids.h"
+
+#define ID_X36F 0x053f
+
+/* Fixed EasyPen i405X report descriptor */
+static u8 x36f_desc_fixed[] =3D {
+#include "js.hex"
+};
+
+
+static u8 *saitek_report_fixup(struct hid_device *hdev, u8 *rdesc,
+		unsigned int *rsize)
+{
+	switch (hdev->product) {
+	case ID_X36F:
+	        printk("original size is %d\n", *rsize);
+		{
+		  int i;
+		  for (i=3D0; i<*rsize; i++) {
+		    printk("%02x, ", rdesc[i]);
+		  }
+		  printk("\n");
+		}
+		if (*rsize =3D=3D 131) {
+			rdesc =3D x36f_desc_fixed;
+			*rsize =3D sizeof(x36f_desc_fixed);
+		}
+		break;
+	}
+	return rdesc;
+}
+
+
+static int saitek_probe(struct hid_device *hdev, const struct hid_device_i=
d *id)
+{
+	int ret;
+
+	ret =3D hid_parse(hdev);
+	if (ret) {
+		hid_err(hdev, "parse failed\n");
+		goto err;
+	}
+
+	ret =3D hid_hw_start(hdev, HID_CONNECT_DEFAULT);
+	if (ret) {
+		hid_err(hdev, "hw start failed\n");
+		goto err;
+	}
+
+	printk("saitek js: my hacks are running\n");
+
+	return 0;
+enabling_err:
+	hid_hw_stop(hdev);
+err:
+	return ret;
+}
+
+static const struct hid_device_id saitek_devices[] =3D {
+	{ HID_USB_DEVICE(0x06a3, ID_X36F) },
+	{ }
+};
+MODULE_DEVICE_TABLE(hid, saitek_devices);
+
+static struct hid_driver saitek_driver =3D {
+	.name =3D "saitek",
+	.id_table =3D saitek_devices,
+	.probe =3D saitek_probe,
+	.report_fixup =3D saitek_report_fixup,
+};
+module_hid_driver(saitek_driver);
+
+MODULE_LICENSE("GPL");
diff --git a/drivers/hid/js.hex b/drivers/hid/js.hex
new file mode 100644
index 000000000000..804209e5307b
--- /dev/null
+++ b/drivers/hid/js.hex
@@ -0,0 +1,52 @@
+     0x05, 0x01,                    // UsagePage (desktop)
+     0x09, 0x04,                    // Usage (Joystick)
+     0xa1, 0x01,                    // Collection (Application)
+     0x15, 0x4c,                    //     LogicalMinimum (76)
+     0x26, 0x6c, 0x01,              //     LogicalMaximum (364)
+     0x75, 0x0c,                    //     ReportSize (12)
+     0x95, 0x01,                    //     ReportCount (1)
+     0x09, 0x30,                    //     Usage (X)
+     0x81, 0x02,                    //     Input (Variable)
+     0x75, 0x04,                    //     ReportSize (4)
+     0x81, 0x03,                    //     Input (Constant|Variable)
+     0x26, 0x94, 0x01,              //     LogicalMaximum (404)
+     0x75, 0x0c,                    //     ReportSize (12)
+     0x09, 0x31,                    //     Usage (Y)
+     0x81, 0x02,                    //     Input (Variable)
+     0x75, 0x04,                    //     ReportSize (4)
+     0x81, 0x03,                    //     Input (Constant|Variable)
+     0x15, 0x15,                    //     LogicalMinimum (21)
+     0x26, 0xeb, 0x00,              //     LogicalMaximum (235)
+     0x75, 0x08,                    //     ReportSize (8)
+     0x09, 0x36,                    //     Usage (Slider)
+     0x81, 0x02,                    //     Input (Variable)
+     0x26, 0xf1, 0x00,              //     LogicalMaximum (241)
+     0x09, 0x35,                    //     Usage (Rz)
+     0x81, 0x02,                    //     Input (Variable)
+     0x15, 0x01,                    //     LogicalMinimum (1)
+     0x26, 0xd1, 0x00,              //     LogicalMaximum (209)
+     0x09, 0x37,                    //     Usage (Dial)
+     0x81, 0x02,                    //     Input (Variable)
+     0x26, 0xe1, 0x00,              //     LogicalMaximum (225)
+     0x09, 0x33,                    //     Usage (Rx)
+     0x81, 0x02,                    //     Input (Variable)
+     0x15, 0x00,                    //     LogicalMinimum (0)
+     0x25, 0x01,                    //     LogicalMaximum (1)
+     0x75, 0x01,                    //     ReportSize (1)
+     0x95, 0x1a,                    //     ReportCount (26)
+     0x05, 0x09,                    //     UsagePage (button)
+     0x19, 0x01,                    //     UsageMinimum (Button(1))
+     0x29, 0x1a,                    //     UsageMaximum (Button(26))
+     0x81, 0x02,                    //     Input (Variable)
+     0x75, 0x02,                    //     ReportSize (2)
+     0x95, 0x01,                    //     ReportCount (1)
+     0x81, 0x03,                    //     Input (Constant|Variable)
+     0x46, 0x3b, 0x01,              //     PhysicalMaximum (315)
+     0x15, 0x01,                    //     LogicalMinimum (1)
+     0x25, 0x08,                    //     LogicalMaximum (8)
+     0x65, 0x14,                    //     Unit (Degree)
+     0x75, 0x04,                    //     ReportSize (4)
+     0x05, 0x01,                    //     UsagePage (desktop)
+     0x09, 0x39,                    //     Usage (HatSwitch)
+     0x81, 0x42,                    //     Input (Variable|NullState)
+     0xc0,                          // EndCollection
diff --git a/drivers/hid/js.py b/drivers/hid/js.py
new file mode 100644
index 000000000000..8806e25f9118
--- /dev/null
+++ b/drivers/hid/js.py
@@ -0,0 +1,46 @@
+from hrdc.usage import *
+from hrdc.descriptor import *
+
+descriptor =3D TopLevel(
+    Report(0,
+        Collection(Collection.Application, desktop.Joystick,
+            Value(Value.Input, desktop.X, 12, logicalMin =3D 76, logicalMa=
x =3D 364),
+            Value(Value.Input, desktop.Y, 12, logicalMin =3D 76, logicalMa=
x =3D 404),
+            Value(Value.Input, desktop.Slider, 8, logicalMin =3D 21, logic=
alMax =3D 235),
+            Value(Value.Input, desktop.Rz, 8, logicalMin =3D 21, logicalMa=
x =3D 241),
+            Value(Value.Input, desktop.Dial, 8, logicalMax =3D 209),
+            Value(Value.Input, desktop.Rx, 8, logicalMax =3D 225),
+            Value(Value.Input, button.Button(1), 1, logicalMin =3D 0, logi=
calMax =3D 1),
+            Value(Value.Input, button.Button(2), 1, logicalMin =3D 0, logi=
calMax =3D 1),
+            Value(Value.Input, button.Button(3), 1, logicalMin =3D 0, logi=
calMax =3D 1),
+            Value(Value.Input, button.Button(4), 1, logicalMin =3D 0, logi=
calMax =3D 1),
+            Value(Value.Input, button.Button(5), 1, logicalMin =3D 0, logi=
calMax =3D 1),
+            Value(Value.Input, button.Button(6), 1, logicalMin =3D 0, logi=
calMax =3D 1),
+            Value(Value.Input, button.Button(7), 1, logicalMin =3D 0, logi=
calMax =3D 1),
+            Value(Value.Input, button.Button(8), 1, logicalMin =3D 0, logi=
calMax =3D 1),
+            Value(Value.Input, button.Button(9), 1, logicalMin =3D 0, logi=
calMax =3D 1),
+            Value(Value.Input, button.Button(10), 1, logicalMin =3D 0, log=
icalMax =3D 1),
+            Value(Value.Input, button.Button(11), 1, logicalMin =3D 0, log=
icalMax =3D 1),
+            Value(Value.Input, button.Button(12), 1, logicalMin =3D 0, log=
icalMax =3D 1),
+            Value(Value.Input, button.Button(13), 1, logicalMin =3D 0, log=
icalMax =3D 1),
+            Value(Value.Input, button.Button(14), 1, logicalMin =3D 0, log=
icalMax =3D 1),
+            Value(Value.Input, button.Button(15), 1, logicalMin =3D 0, log=
icalMax =3D 1),
+            Value(Value.Input, button.Button(16), 1, logicalMin =3D 0, log=
icalMax =3D 1),
+            Value(Value.Input, button.Button(17), 1, logicalMin =3D 0, log=
icalMax =3D 1),
+            Value(Value.Input, button.Button(18), 1, logicalMin =3D 0, log=
icalMax =3D 1),
+            Value(Value.Input, button.Button(19), 1, logicalMin =3D 0, log=
icalMax =3D 1),
+            Value(Value.Input, button.Button(20), 1, logicalMin =3D 0, log=
icalMax =3D 1),
+            Value(Value.Input, button.Button(21), 1, logicalMin =3D 0, log=
icalMax =3D 1),
+            Value(Value.Input, button.Button(22), 1, logicalMin =3D 0, log=
icalMax =3D 1),
+            Value(Value.Input, button.Button(23), 1, logicalMin =3D 0, log=
icalMax =3D 1),
+            Value(Value.Input, button.Button(24), 1, logicalMin =3D 0, log=
icalMax =3D 1),
+            Value(Value.Input, button.Button(25), 1, logicalMin =3D 0, log=
icalMax =3D 1),
+            Value(Value.Input, button.Button(26), 1, logicalMin =3D 0, log=
icalMax =3D 1),
+            Padding(Value.Input, 2),
+            Value(Value.Input, desktop.HatSwitch, 4, flags =3D Value.Varia=
ble|Value.NullState, logicalMax =3D 8, physicalMin =3D 0, physicalMax =3D 3=
15, unit =3D Unit.Degree),
+        ),
+    ),
+)
+
+if __name__ =3D=3D "__main__":
+    compile_main(descriptor)


--=20
http://www.livejournal.com/~pavelmachek

--Nq2Wo0NMKNjxTN9z
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl+YjBQACgkQMOfwapXb+vL/GQCeLsILVvxjqH/lFzu/RlimsY/6
ZaMAoJenImM3ZEyPcaNCPq+VSyKBq5CD
=aq0V
-----END PGP SIGNATURE-----

--Nq2Wo0NMKNjxTN9z--
