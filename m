Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 50E73234DB7
	for <lists+linux-input@lfdr.de>; Sat,  1 Aug 2020 00:45:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726281AbgGaWo7 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 31 Jul 2020 18:44:59 -0400
Received: from mail-40140.protonmail.ch ([185.70.40.140]:17401 "EHLO
        mail-40140.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726099AbgGaWo7 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 31 Jul 2020 18:44:59 -0400
X-Greylist: delayed 492 seconds by postgrey-1.27 at vger.kernel.org; Fri, 31 Jul 2020 18:44:58 EDT
Date:   Fri, 31 Jul 2020 22:36:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1596235004;
        bh=DZK+C9tspeddpYuevasHBR3qJVFo7MjtUx2qpZxkoXs=;
        h=Date:To:From:Reply-To:Subject:From;
        b=UzABnuFVzPs/tzGpTfOU346tWyURsjmOvegLLzDf8JkswwxJBW1lgQqZ9o3MzMCqn
         A8WZRXf87+0KG7f4CLFtHCxZCE5mHOeD12qcHj16Yh8BXiZZvVZ894dmDPOLEIpiyy
         yAOfrwC2UmF8WrmQt7id67DQjoJgouxNNjCyiHKU=
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: [PATCH 1/2] HID: multitouch: export {surface,button}_switch to sysfs
Message-ID: <46x0ZulX2qWADzBaU_UWUW7qQX-azKvbS40ooWaLKhIZ-NkUZDy51EfE6f1ViuUAEGPmBLYVTONaipsGosR0WczAt_OIFbW-8CkK42hXdfo=@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=7.0 tests=ALL_TRUSTED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM shortcircuit=no
        autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on mail.protonmail.ch
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Some touchpads have an LED that tells the user whether
the touchpad is disabled/enabled. Sometimes this LED
may only be controlled by the touchpad hardware.

In such cases disabling the touchpad simply via X.Org
(or other similar means) cannot take advantage of the
available LED to signal the state of the touchpad to
the user. Thus users may choose to disable their
touchpad via these two attributes (instead of xinput, etc.)
so that they can take advantage of the visual cue provided
by the LED.

This commit also changes all exported attributes to use
the DEVICE_ATTR_RW() macro (hence mt_{show,set}_quirks() functions
have been renamed).

Signed-off-by: Barnab=C3=A1s P=C5=91cze <pobrn@protonmail.com>
---
 drivers/hid/hid-multitouch.c | 96 ++++++++++++++++++++++++++++++++----
 1 file changed, 86 insertions(+), 10 deletions(-)

diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
index 3f94b4954225..051c78c37603 100644
--- a/drivers/hid/hid-multitouch.c
+++ b/drivers/hid/hid-multitouch.c
@@ -164,6 +164,8 @@ struct mt_device {
 =09__u8 maxcontacts;
 =09bool is_buttonpad;=09/* is this device a button pad? */
 =09bool serial_maybe;=09/* need to check for serial protocol */
+=09enum latency_mode latency;
+=09bool surface_switch, button_switch;

 =09struct list_head applications;
 =09struct list_head reports;
@@ -370,7 +372,7 @@ static const struct mt_class mt_classes[] =3D {
 =09{ }
 };

-static ssize_t mt_show_quirks(struct device *dev,
+static ssize_t quirks_show(struct device *dev,
 =09=09=09   struct device_attribute *attr,
 =09=09=09   char *buf)
 {
@@ -380,7 +382,7 @@ static ssize_t mt_show_quirks(struct device *dev,
 =09return sprintf(buf, "%u\n", td->mtclass.quirks);
 }

-static ssize_t mt_set_quirks(struct device *dev,
+static ssize_t quirks_store(struct device *dev,
 =09=09=09  struct device_attribute *attr,
 =09=09=09  const char *buf, size_t count)
 {
@@ -404,10 +406,72 @@ static ssize_t mt_set_quirks(struct device *dev,
 =09return count;
 }

-static DEVICE_ATTR(quirks, S_IWUSR | S_IRUGO, mt_show_quirks, mt_set_quirk=
s);
+static void mt_set_modes(struct mt_device *td);
+
+static ssize_t surface_switch_show(struct device *dev,
+=09=09=09   struct device_attribute *attr,
+=09=09=09   char *buf)
+{
+=09struct hid_device *hdev =3D to_hid_device(dev);
+=09struct mt_device *td =3D hid_get_drvdata(hdev);
+
+=09return sprintf(buf, "%d\n", (int) td->surface_switch);
+}
+
+static ssize_t surface_switch_store(struct device *dev,
+=09=09=09  struct device_attribute *attr,
+=09=09=09  const char *buf, size_t count)
+{
+=09struct hid_device *hdev =3D to_hid_device(dev);
+=09struct mt_device *td =3D hid_get_drvdata(hdev);
+
+=09bool val;
+
+=09if (kstrtobool(buf, &val))
+=09=09return -EINVAL;
+
+=09td->surface_switch =3D val;
+=09mt_set_modes(td);
+
+=09return count;
+}
+
+static ssize_t button_switch_show(struct device *dev,
+=09=09=09   struct device_attribute *attr,
+=09=09=09   char *buf)
+{
+=09struct hid_device *hdev =3D to_hid_device(dev);
+=09struct mt_device *td =3D hid_get_drvdata(hdev);
+
+=09return sprintf(buf, "%d\n", (int) td->button_switch);
+}
+
+static ssize_t button_switch_store(struct device *dev,
+=09=09=09  struct device_attribute *attr,
+=09=09=09  const char *buf, size_t count)
+{
+=09struct hid_device *hdev =3D to_hid_device(dev);
+=09struct mt_device *td =3D hid_get_drvdata(hdev);
+
+=09bool val;
+
+=09if (kstrtobool(buf, &val))
+=09=09return -EINVAL;
+
+=09td->button_switch =3D val;
+=09mt_set_modes(td);
+
+=09return count;
+}
+
+static DEVICE_ATTR_RW(quirks);
+static DEVICE_ATTR_RW(surface_switch);
+static DEVICE_ATTR_RW(button_switch);

 static struct attribute *sysfs_attrs[] =3D {
 =09&dev_attr_quirks.attr,
+=09&dev_attr_surface_switch.attr,
+=09&dev_attr_button_switch.attr,
 =09NULL
 };

@@ -1470,9 +1534,9 @@ static bool mt_need_to_apply_feature(struct hid_devic=
e *hdev,
 =09return false; /* no need to update the report */
 }

-static void mt_set_modes(struct hid_device *hdev, enum latency_mode latenc=
y,
-=09=09=09 bool surface_switch, bool button_switch)
+static void mt_set_modes(struct mt_device *td)
 {
+=09struct hid_device *hdev =3D td->hdev;
 =09struct hid_report_enum *rep_enum;
 =09struct hid_report *rep;
 =09struct hid_usage *usage;
@@ -1495,9 +1559,9 @@ static void mt_set_modes(struct hid_device *hdev, enu=
m latency_mode latency,
 =09=09=09=09if (mt_need_to_apply_feature(hdev,
 =09=09=09=09=09=09=09     rep->field[i],
 =09=09=09=09=09=09=09     usage,
-=09=09=09=09=09=09=09     latency,
-=09=09=09=09=09=09=09     surface_switch,
-=09=09=09=09=09=09=09     button_switch,
+=09=09=09=09=09=09=09     td->latency,
+=09=09=09=09=09=09=09     td->surface_switch,
+=09=09=09=09=09=09=09     td->button_switch,
 =09=09=09=09=09=09=09     &inputmode_found))
 =09=09=09=09=09update_report =3D true;
 =09=09=09}
@@ -1738,7 +1802,11 @@ static int mt_probe(struct hid_device *hdev, const s=
truct hid_device_id *id)
 =09=09dev_warn(&hdev->dev, "Cannot allocate sysfs group for %s\n",
 =09=09=09=09hdev->name);

-=09mt_set_modes(hdev, HID_LATENCY_NORMAL, true, true);
+=09td->latency =3D HID_LATENCY_NORMAL;
+=09td->surface_switch =3D true;
+=09td->button_switch =3D true;
+
+=09mt_set_modes(td);

 =09return 0;
 }
@@ -1746,8 +1814,16 @@ static int mt_probe(struct hid_device *hdev, const s=
truct hid_device_id *id)
 #ifdef CONFIG_PM
 static int mt_reset_resume(struct hid_device *hdev)
 {
+=09struct mt_device *td =3D hid_get_drvdata(hdev);
+
 =09mt_release_contacts(hdev);
-=09mt_set_modes(hdev, HID_LATENCY_NORMAL, true, true);
+
+=09td->latency =3D HID_LATENCY_NORMAL;
+=09td->surface_switch =3D true;
+=09td->button_switch =3D true;
+
+=09mt_set_modes(td);
+
 =09return 0;
 }

--
2.27.0

