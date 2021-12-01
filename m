Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 839F2464F72
	for <lists+linux-input@lfdr.de>; Wed,  1 Dec 2021 15:15:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234216AbhLAOSl (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 1 Dec 2021 09:18:41 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:60894 "EHLO
        ams.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349815AbhLAOSk (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 1 Dec 2021 09:18:40 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 35570B81F6F
        for <linux-input@vger.kernel.org>; Wed,  1 Dec 2021 14:15:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 633CDC53FAD;
        Wed,  1 Dec 2021 14:15:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1638368116;
        bh=dC18uMQNxKM0sdaP8MrzASQRU6KhYcyNo4A0kGkuTfg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=bNncLiDmEtMFbybAzJkD5QReTexi3fxWFLuQXTDHW9p5RH5VEuzmmQhJxGQMrn31N
         LHCqiuVPL/IKKb3DVjQe2JbtDG66FZvpjakYpuBqnYXZAER0giUbgo1sYejwth3h+D
         uD0AyoXdwUjYOsRFWFJyU9f2kR8w/dh5Xq66CoGA=
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     linux-input@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Michael Zaidman <michael.zaidman@gmail.com>,
        Stefan Achatz <erazor_de@users.sourceforge.net>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
Subject: [PATCH 2/2] HID: check for valid USB device for many HID drivers
Date:   Wed,  1 Dec 2021 15:15:13 +0100
Message-Id: <20211201141513.2107815-2-gregkh@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211201141513.2107815-1-gregkh@linuxfoundation.org>
References: <20211201141513.2107815-1-gregkh@linuxfoundation.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=14238; h=from:subject; bh=dC18uMQNxKM0sdaP8MrzASQRU6KhYcyNo4A0kGkuTfg=; b=owGbwMvMwCRo6H6F97bub03G02pJDInLmwsFj0juV72Zf+PwsTj5Ts3MjmUCTn/SFyTfCLrs+UL0 2A6vjlgWBkEmBlkxRZYv23iO7q84pOhlaHsaZg4rE8gQBi5OAZhIXCLD/Bxm+xu2lzcZyXRvK10lyX Dxqu6DHQwLJmd+uiL6QUGH8b+V5Yv5AbbHpEqKAQ==
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp; fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Many HID drivers assume that the HID device assigned to them is a USB
device as that was the only way HID devices used to be able to be
created in Linux.  However, with the additional ways that HID devices
can be created for many different bus types, that is no longer true, so
properly check that we have a USB device associated with the HID device
before allowing a driver that makes this assumption to claim it.

Cc: Jiri Kosina <jikos@kernel.org>
Cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc: Michael Zaidman <michael.zaidman@gmail.com>
Cc: Stefan Achatz <erazor_de@users.sourceforge.net>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/hid/hid-chicony.c         |  3 +++
 drivers/hid/hid-corsair.c         |  7 ++++++-
 drivers/hid/hid-elan.c            |  2 +-
 drivers/hid/hid-elo.c             |  3 +++
 drivers/hid/hid-ft260.c           |  3 +++
 drivers/hid/hid-holtek-kbd.c      |  3 +++
 drivers/hid/hid-holtek-mouse.c    |  9 +++++++++
 drivers/hid/hid-lg.c              | 10 ++++++++--
 drivers/hid/hid-prodikeys.c       | 10 ++++++++--
 drivers/hid/hid-roccat-arvo.c     |  3 +++
 drivers/hid/hid-roccat-isku.c     |  3 +++
 drivers/hid/hid-roccat-kone.c     |  3 +++
 drivers/hid/hid-roccat-koneplus.c |  3 +++
 drivers/hid/hid-roccat-konepure.c |  3 +++
 drivers/hid/hid-roccat-kovaplus.c |  3 +++
 drivers/hid/hid-roccat-lua.c      |  3 +++
 drivers/hid/hid-roccat-pyra.c     |  3 +++
 drivers/hid/hid-roccat-ryos.c     |  3 +++
 drivers/hid/hid-roccat-savu.c     |  3 +++
 drivers/hid/hid-samsung.c         |  3 +++
 drivers/hid/hid-thrustmaster.c    |  3 +++
 drivers/hid/hid-uclogic-core.c    |  3 +++
 drivers/hid/wacom_sys.c           | 10 ++++++++--
 23 files changed, 91 insertions(+), 8 deletions(-)

diff --git a/drivers/hid/hid-chicony.c b/drivers/hid/hid-chicony.c
index ca556d39da2a..f04d2aa23efe 100644
--- a/drivers/hid/hid-chicony.c
+++ b/drivers/hid/hid-chicony.c
@@ -114,6 +114,9 @@ static int ch_probe(struct hid_device *hdev, const struct hid_device_id *id)
 {
 	int ret;
 
+	if (!hid_is_usb(hdev))
+		return -EINVAL;
+
 	hdev->quirks |= HID_QUIRK_INPUT_PER_APP;
 	ret = hid_parse(hdev);
 	if (ret) {
diff --git a/drivers/hid/hid-corsair.c b/drivers/hid/hid-corsair.c
index 902a60e249ed..8c895c820b67 100644
--- a/drivers/hid/hid-corsair.c
+++ b/drivers/hid/hid-corsair.c
@@ -553,7 +553,12 @@ static int corsair_probe(struct hid_device *dev, const struct hid_device_id *id)
 	int ret;
 	unsigned long quirks = id->driver_data;
 	struct corsair_drvdata *drvdata;
-	struct usb_interface *usbif = to_usb_interface(dev->dev.parent);
+	struct usb_interface *usbif;
+
+	if (!hid_is_usb(dev))
+		return -EINVAL;
+
+	usbif = to_usb_interface(dev->dev.parent);
 
 	drvdata = devm_kzalloc(&dev->dev, sizeof(struct corsair_drvdata),
 			       GFP_KERNEL);
diff --git a/drivers/hid/hid-elan.c b/drivers/hid/hid-elan.c
index 021049805bb7..3091355d48df 100644
--- a/drivers/hid/hid-elan.c
+++ b/drivers/hid/hid-elan.c
@@ -50,7 +50,7 @@ struct elan_drvdata {
 
 static int is_not_elan_touchpad(struct hid_device *hdev)
 {
-	if (hdev->bus == BUS_USB) {
+	if (hid_is_usb(hdev)) {
 		struct usb_interface *intf = to_usb_interface(hdev->dev.parent);
 
 		return (intf->altsetting->desc.bInterfaceNumber !=
diff --git a/drivers/hid/hid-elo.c b/drivers/hid/hid-elo.c
index 383dfda8c12f..8e960d7b233b 100644
--- a/drivers/hid/hid-elo.c
+++ b/drivers/hid/hid-elo.c
@@ -230,6 +230,9 @@ static int elo_probe(struct hid_device *hdev, const struct hid_device_id *id)
 	int ret;
 	struct usb_device *udev;
 
+	if (!hid_is_usb(hdev))
+		return -EINVAL;
+
 	priv = kzalloc(sizeof(*priv), GFP_KERNEL);
 	if (!priv)
 		return -ENOMEM;
diff --git a/drivers/hid/hid-ft260.c b/drivers/hid/hid-ft260.c
index 4ef1c3b8094e..183eeb3863b3 100644
--- a/drivers/hid/hid-ft260.c
+++ b/drivers/hid/hid-ft260.c
@@ -915,6 +915,9 @@ static int ft260_probe(struct hid_device *hdev, const struct hid_device_id *id)
 	struct ft260_get_chip_version_report version;
 	int ret;
 
+	if (!hid_is_usb(hdev))
+		return -EINVAL;
+
 	dev = devm_kzalloc(&hdev->dev, sizeof(*dev), GFP_KERNEL);
 	if (!dev)
 		return -ENOMEM;
diff --git a/drivers/hid/hid-holtek-kbd.c b/drivers/hid/hid-holtek-kbd.c
index 0a38e8e9bc78..a438d8ac00e2 100644
--- a/drivers/hid/hid-holtek-kbd.c
+++ b/drivers/hid/hid-holtek-kbd.c
@@ -143,6 +143,9 @@ static int holtek_kbd_probe(struct hid_device *hdev,
 	struct usb_interface *intf = to_usb_interface(hdev->dev.parent);
 	int ret = hid_parse(hdev);
 
+	if (!hid_is_usb(hdev))
+		return -EINVAL;
+
 	if (!ret)
 		ret = hid_hw_start(hdev, HID_CONNECT_DEFAULT);
 
diff --git a/drivers/hid/hid-holtek-mouse.c b/drivers/hid/hid-holtek-mouse.c
index 195b735b001d..b7172c48ef9f 100644
--- a/drivers/hid/hid-holtek-mouse.c
+++ b/drivers/hid/hid-holtek-mouse.c
@@ -62,6 +62,14 @@ static __u8 *holtek_mouse_report_fixup(struct hid_device *hdev, __u8 *rdesc,
 	return rdesc;
 }
 
+static int holtek_mouse_probe(struct hid_device *hdev,
+			      const struct hid_device_id *id)
+{
+	if (!hid_is_usb(hdev))
+		return -EINVAL;
+	return 0;
+}
+
 static const struct hid_device_id holtek_mouse_devices[] = {
 	{ HID_USB_DEVICE(USB_VENDOR_ID_HOLTEK_ALT,
 			USB_DEVICE_ID_HOLTEK_ALT_MOUSE_A067) },
@@ -83,6 +91,7 @@ static struct hid_driver holtek_mouse_driver = {
 	.name = "holtek_mouse",
 	.id_table = holtek_mouse_devices,
 	.report_fixup = holtek_mouse_report_fixup,
+	.probe = holtek_mouse_probe,
 };
 
 module_hid_driver(holtek_mouse_driver);
diff --git a/drivers/hid/hid-lg.c b/drivers/hid/hid-lg.c
index d40af911df63..fb3f7258009c 100644
--- a/drivers/hid/hid-lg.c
+++ b/drivers/hid/hid-lg.c
@@ -749,12 +749,18 @@ static int lg_raw_event(struct hid_device *hdev, struct hid_report *report,
 
 static int lg_probe(struct hid_device *hdev, const struct hid_device_id *id)
 {
-	struct usb_interface *iface = to_usb_interface(hdev->dev.parent);
-	__u8 iface_num = iface->cur_altsetting->desc.bInterfaceNumber;
+	struct usb_interface *iface;
+	__u8 iface_num;
 	unsigned int connect_mask = HID_CONNECT_DEFAULT;
 	struct lg_drv_data *drv_data;
 	int ret;
 
+	if (!hid_is_usb(hdev))
+		return -EINVAL;
+
+	iface = to_usb_interface(hdev->dev.parent);
+	iface_num = iface->cur_altsetting->desc.bInterfaceNumber;
+
 	/* G29 only work with the 1st interface */
 	if ((hdev->product == USB_DEVICE_ID_LOGITECH_G29_WHEEL) &&
 	    (iface_num != 0)) {
diff --git a/drivers/hid/hid-prodikeys.c b/drivers/hid/hid-prodikeys.c
index 2666af02d5c1..e4e9471d0f1e 100644
--- a/drivers/hid/hid-prodikeys.c
+++ b/drivers/hid/hid-prodikeys.c
@@ -798,12 +798,18 @@ static int pk_raw_event(struct hid_device *hdev, struct hid_report *report,
 static int pk_probe(struct hid_device *hdev, const struct hid_device_id *id)
 {
 	int ret;
-	struct usb_interface *intf = to_usb_interface(hdev->dev.parent);
-	unsigned short ifnum = intf->cur_altsetting->desc.bInterfaceNumber;
+	struct usb_interface *intf;
+	unsigned short ifnum;
 	unsigned long quirks = id->driver_data;
 	struct pk_device *pk;
 	struct pcmidi_snd *pm = NULL;
 
+	if (!hid_is_usb(hdev))
+		return -EINVAL;
+
+	intf = to_usb_interface(hdev->dev.parent);
+	ifnum = intf->cur_altsetting->desc.bInterfaceNumber;
+
 	pk = kzalloc(sizeof(*pk), GFP_KERNEL);
 	if (pk == NULL) {
 		hid_err(hdev, "can't alloc descriptor\n");
diff --git a/drivers/hid/hid-roccat-arvo.c b/drivers/hid/hid-roccat-arvo.c
index 4556d2a50f75..d94ee0539421 100644
--- a/drivers/hid/hid-roccat-arvo.c
+++ b/drivers/hid/hid-roccat-arvo.c
@@ -344,6 +344,9 @@ static int arvo_probe(struct hid_device *hdev,
 {
 	int retval;
 
+	if (!hid_is_usb(hdev))
+		return -EINVAL;
+
 	retval = hid_parse(hdev);
 	if (retval) {
 		hid_err(hdev, "parse failed\n");
diff --git a/drivers/hid/hid-roccat-isku.c b/drivers/hid/hid-roccat-isku.c
index ce5f22519956..e95d59cd8d07 100644
--- a/drivers/hid/hid-roccat-isku.c
+++ b/drivers/hid/hid-roccat-isku.c
@@ -324,6 +324,9 @@ static int isku_probe(struct hid_device *hdev,
 {
 	int retval;
 
+	if (!hid_is_usb(hdev))
+		return -EINVAL;
+
 	retval = hid_parse(hdev);
 	if (retval) {
 		hid_err(hdev, "parse failed\n");
diff --git a/drivers/hid/hid-roccat-kone.c b/drivers/hid/hid-roccat-kone.c
index ea17abc7ad52..76da04801ca9 100644
--- a/drivers/hid/hid-roccat-kone.c
+++ b/drivers/hid/hid-roccat-kone.c
@@ -749,6 +749,9 @@ static int kone_probe(struct hid_device *hdev, const struct hid_device_id *id)
 {
 	int retval;
 
+	if (!hid_is_usb(hdev))
+		return -EINVAL;
+
 	retval = hid_parse(hdev);
 	if (retval) {
 		hid_err(hdev, "parse failed\n");
diff --git a/drivers/hid/hid-roccat-koneplus.c b/drivers/hid/hid-roccat-koneplus.c
index 0316edf8c5bb..1896c69ea512 100644
--- a/drivers/hid/hid-roccat-koneplus.c
+++ b/drivers/hid/hid-roccat-koneplus.c
@@ -431,6 +431,9 @@ static int koneplus_probe(struct hid_device *hdev,
 {
 	int retval;
 
+	if (!hid_is_usb(hdev))
+		return -EINVAL;
+
 	retval = hid_parse(hdev);
 	if (retval) {
 		hid_err(hdev, "parse failed\n");
diff --git a/drivers/hid/hid-roccat-konepure.c b/drivers/hid/hid-roccat-konepure.c
index 5248b3c7cf78..cf8eeb33a125 100644
--- a/drivers/hid/hid-roccat-konepure.c
+++ b/drivers/hid/hid-roccat-konepure.c
@@ -133,6 +133,9 @@ static int konepure_probe(struct hid_device *hdev,
 {
 	int retval;
 
+	if (!hid_is_usb(hdev))
+		return -EINVAL;
+
 	retval = hid_parse(hdev);
 	if (retval) {
 		hid_err(hdev, "parse failed\n");
diff --git a/drivers/hid/hid-roccat-kovaplus.c b/drivers/hid/hid-roccat-kovaplus.c
index 960012881570..6fb9b9563769 100644
--- a/drivers/hid/hid-roccat-kovaplus.c
+++ b/drivers/hid/hid-roccat-kovaplus.c
@@ -501,6 +501,9 @@ static int kovaplus_probe(struct hid_device *hdev,
 {
 	int retval;
 
+	if (!hid_is_usb(hdev))
+		return -EINVAL;
+
 	retval = hid_parse(hdev);
 	if (retval) {
 		hid_err(hdev, "parse failed\n");
diff --git a/drivers/hid/hid-roccat-lua.c b/drivers/hid/hid-roccat-lua.c
index 4a88a76d5c62..d5ddf0d68346 100644
--- a/drivers/hid/hid-roccat-lua.c
+++ b/drivers/hid/hid-roccat-lua.c
@@ -160,6 +160,9 @@ static int lua_probe(struct hid_device *hdev,
 {
 	int retval;
 
+	if (!hid_is_usb(hdev))
+		return -EINVAL;
+
 	retval = hid_parse(hdev);
 	if (retval) {
 		hid_err(hdev, "parse failed\n");
diff --git a/drivers/hid/hid-roccat-pyra.c b/drivers/hid/hid-roccat-pyra.c
index 989927defe8d..4fcc8e7d276f 100644
--- a/drivers/hid/hid-roccat-pyra.c
+++ b/drivers/hid/hid-roccat-pyra.c
@@ -449,6 +449,9 @@ static int pyra_probe(struct hid_device *hdev, const struct hid_device_id *id)
 {
 	int retval;
 
+	if (!hid_is_usb(hdev))
+		return -EINVAL;
+
 	retval = hid_parse(hdev);
 	if (retval) {
 		hid_err(hdev, "parse failed\n");
diff --git a/drivers/hid/hid-roccat-ryos.c b/drivers/hid/hid-roccat-ryos.c
index 3956a6c9c521..5bf1971a2b14 100644
--- a/drivers/hid/hid-roccat-ryos.c
+++ b/drivers/hid/hid-roccat-ryos.c
@@ -141,6 +141,9 @@ static int ryos_probe(struct hid_device *hdev,
 {
 	int retval;
 
+	if (!hid_is_usb(hdev))
+		return -EINVAL;
+
 	retval = hid_parse(hdev);
 	if (retval) {
 		hid_err(hdev, "parse failed\n");
diff --git a/drivers/hid/hid-roccat-savu.c b/drivers/hid/hid-roccat-savu.c
index 818701f7a028..a784bb4ee651 100644
--- a/drivers/hid/hid-roccat-savu.c
+++ b/drivers/hid/hid-roccat-savu.c
@@ -113,6 +113,9 @@ static int savu_probe(struct hid_device *hdev,
 {
 	int retval;
 
+	if (!hid_is_usb(hdev))
+		return -EINVAL;
+
 	retval = hid_parse(hdev);
 	if (retval) {
 		hid_err(hdev, "parse failed\n");
diff --git a/drivers/hid/hid-samsung.c b/drivers/hid/hid-samsung.c
index 2e1c31156eca..cf5992e97094 100644
--- a/drivers/hid/hid-samsung.c
+++ b/drivers/hid/hid-samsung.c
@@ -152,6 +152,9 @@ static int samsung_probe(struct hid_device *hdev,
 	int ret;
 	unsigned int cmask = HID_CONNECT_DEFAULT;
 
+	if (!hid_is_usb(hdev))
+		return -EINVAL;
+
 	ret = hid_parse(hdev);
 	if (ret) {
 		hid_err(hdev, "parse failed\n");
diff --git a/drivers/hid/hid-thrustmaster.c b/drivers/hid/hid-thrustmaster.c
index d44550aa8805..0c92b7f9b8b8 100644
--- a/drivers/hid/hid-thrustmaster.c
+++ b/drivers/hid/hid-thrustmaster.c
@@ -274,6 +274,9 @@ static int thrustmaster_probe(struct hid_device *hdev, const struct hid_device_i
 	int ret = 0;
 	struct tm_wheel *tm_wheel = 0;
 
+	if (!hid_is_usb(hdev))
+		return -EINVAL;
+
 	ret = hid_parse(hdev);
 	if (ret) {
 		hid_err(hdev, "parse failed with error %d\n", ret);
diff --git a/drivers/hid/hid-uclogic-core.c b/drivers/hid/hid-uclogic-core.c
index 6a9865dd703c..d8ab0139e5cd 100644
--- a/drivers/hid/hid-uclogic-core.c
+++ b/drivers/hid/hid-uclogic-core.c
@@ -164,6 +164,9 @@ static int uclogic_probe(struct hid_device *hdev,
 	struct uclogic_drvdata *drvdata = NULL;
 	bool params_initialized = false;
 
+	if (!hid_is_usb(hdev))
+		return -EINVAL;
+
 	/*
 	 * libinput requires the pad interface to be on a different node
 	 * than the pen, so use QUIRK_MULTI_INPUT for all tablets.
diff --git a/drivers/hid/wacom_sys.c b/drivers/hid/wacom_sys.c
index 22d73772fbc5..88d9d5930c5f 100644
--- a/drivers/hid/wacom_sys.c
+++ b/drivers/hid/wacom_sys.c
@@ -2730,16 +2730,22 @@ static void wacom_mode_change_work(struct work_struct *work)
 static int wacom_probe(struct hid_device *hdev,
 		const struct hid_device_id *id)
 {
-	struct usb_interface *intf = to_usb_interface(hdev->dev.parent);
-	struct usb_device *dev = interface_to_usbdev(intf);
+	struct usb_interface *intf;
+	struct usb_device *dev;
 	struct wacom *wacom;
 	struct wacom_wac *wacom_wac;
 	struct wacom_features *features;
 	int error;
 
+	if (!hid_is_usb(hdev))
+		return -EINVAL;
+
 	if (!id->driver_data)
 		return -EINVAL;
 
+	intf = to_usb_interface(hdev->dev.parent);
+	dev = interface_to_usbdev(intf);
+
 	hdev->quirks |= HID_QUIRK_NO_INIT_REPORTS;
 
 	/* hid-core sets this quirk for the boot interface */
-- 
2.34.1

