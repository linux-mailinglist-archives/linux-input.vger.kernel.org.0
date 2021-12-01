Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 452A546559C
	for <lists+linux-input@lfdr.de>; Wed,  1 Dec 2021 19:36:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352502AbhLASjX (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 1 Dec 2021 13:39:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352355AbhLASjU (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 1 Dec 2021 13:39:20 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59FF6C0613ED
        for <linux-input@vger.kernel.org>; Wed,  1 Dec 2021 10:35:13 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 20FEBB820FD
        for <linux-input@vger.kernel.org>; Wed,  1 Dec 2021 18:35:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 536D8C53FCD;
        Wed,  1 Dec 2021 18:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1638383710;
        bh=0e4RORsMiwkoHNSWpoOCnAEdCMWlqCsSxt27Nh6Se0Y=;
        h=From:To:Cc:Subject:Date:From;
        b=IzWtyRd4+I47vCKmJT97MpQzfGUCLQyguwgzjL2JnlR2Pa8UPseeywbV+GT8vvuSX
         LdkividJHd+VIq2RODzJ06OGiX5dH/b+q2C2Y4vdbBMaB5o5B1hQ0tX0bmUAtsVlxR
         S/5lqaqynhtTmOsFWXVuNWSjyQpNAYDL/IOOUZgE=
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     linux-input@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v3 1/3] HID: add hid_is_usb() function to make it simpler for USB detection
Date:   Wed,  1 Dec 2021 19:35:01 +0100
Message-Id: <20211201183503.2373082-1-gregkh@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4656; h=from:subject; bh=0e4RORsMiwkoHNSWpoOCnAEdCMWlqCsSxt27Nh6Se0Y=; b=owGbwMvMwCRo6H6F97bub03G02pJDInLDwSLhRjwfSk7xWfFulXoZOv0GJe7QUtWreifddKhwckr +kJsRywLgyATg6yYIsuXbTxH91ccUvQytD0NM4eVCWQIAxenAEykQ5phwaUFVxy54l3epkl7uJ49Z9 6fJvhnD8OCq9NE638ZxyllOB35fu69Zs7WOd97AA==
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp; fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

A number of HID drivers already call hid_is_using_ll_driver() but only
for the detection of if this is a USB device or not.  Make this more
obvious by creating hid_is_usb() and calling the function that way.

Also converts the existing hid_is_using_ll_driver() functions to use the
new call.

Cc: Jiri Kosina <jikos@kernel.org>
Cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc: linux-input@vger.kernel.org
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
v3: no change
v2: no change

 drivers/hid/hid-asus.c           | 6 ++----
 drivers/hid/hid-logitech-dj.c    | 2 +-
 drivers/hid/hid-u2fzero.c        | 2 +-
 drivers/hid/hid-uclogic-params.c | 3 +--
 drivers/hid/wacom_sys.c          | 2 +-
 include/linux/hid.h              | 5 +++++
 6 files changed, 11 insertions(+), 9 deletions(-)

diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
index 5d57214d8dee..c5968fd21d09 100644
--- a/drivers/hid/hid-asus.c
+++ b/drivers/hid/hid-asus.c
@@ -1028,8 +1028,7 @@ static int asus_probe(struct hid_device *hdev, const struct hid_device_id *id)
 	if (drvdata->quirks & QUIRK_IS_MULTITOUCH)
 		drvdata->tp = &asus_i2c_tp;
 
-	if ((drvdata->quirks & QUIRK_T100_KEYBOARD) &&
-	    hid_is_using_ll_driver(hdev, &usb_hid_driver)) {
+	if ((drvdata->quirks & QUIRK_T100_KEYBOARD) && hid_is_usb(hdev)) {
 		struct usb_interface *intf = to_usb_interface(hdev->dev.parent);
 
 		if (intf->altsetting->desc.bInterfaceNumber == T100_TPAD_INTF) {
@@ -1057,8 +1056,7 @@ static int asus_probe(struct hid_device *hdev, const struct hid_device_id *id)
 		drvdata->tp = &asus_t100chi_tp;
 	}
 
-	if ((drvdata->quirks & QUIRK_MEDION_E1239T) &&
-	    hid_is_using_ll_driver(hdev, &usb_hid_driver)) {
+	if ((drvdata->quirks & QUIRK_MEDION_E1239T) && hid_is_usb(hdev)) {
 		struct usb_host_interface *alt =
 			to_usb_interface(hdev->dev.parent)->altsetting;
 
diff --git a/drivers/hid/hid-logitech-dj.c b/drivers/hid/hid-logitech-dj.c
index a0017b010c34..7106b921b53c 100644
--- a/drivers/hid/hid-logitech-dj.c
+++ b/drivers/hid/hid-logitech-dj.c
@@ -1777,7 +1777,7 @@ static int logi_dj_probe(struct hid_device *hdev,
 	case recvr_type_bluetooth:	no_dj_interfaces = 2; break;
 	case recvr_type_dinovo:		no_dj_interfaces = 2; break;
 	}
-	if (hid_is_using_ll_driver(hdev, &usb_hid_driver)) {
+	if (hid_is_usb(hdev)) {
 		intf = to_usb_interface(hdev->dev.parent);
 		if (intf && intf->altsetting->desc.bInterfaceNumber >=
 							no_dj_interfaces) {
diff --git a/drivers/hid/hid-u2fzero.c b/drivers/hid/hid-u2fzero.c
index 31ea7fc69916..ad489caf53ad 100644
--- a/drivers/hid/hid-u2fzero.c
+++ b/drivers/hid/hid-u2fzero.c
@@ -311,7 +311,7 @@ static int u2fzero_probe(struct hid_device *hdev,
 	unsigned int minor;
 	int ret;
 
-	if (!hid_is_using_ll_driver(hdev, &usb_hid_driver))
+	if (!hid_is_usb(hdev))
 		return -EINVAL;
 
 	dev = devm_kzalloc(&hdev->dev, sizeof(*dev), GFP_KERNEL);
diff --git a/drivers/hid/hid-uclogic-params.c b/drivers/hid/hid-uclogic-params.c
index 3d67b748a3b9..adff1bd68d9f 100644
--- a/drivers/hid/hid-uclogic-params.c
+++ b/drivers/hid/hid-uclogic-params.c
@@ -843,8 +843,7 @@ int uclogic_params_init(struct uclogic_params *params,
 	struct uclogic_params p = {0, };
 
 	/* Check arguments */
-	if (params == NULL || hdev == NULL ||
-	    !hid_is_using_ll_driver(hdev, &usb_hid_driver)) {
+	if (params == NULL || hdev == NULL || !hid_is_usb(hdev)) {
 		rc = -EINVAL;
 		goto cleanup;
 	}
diff --git a/drivers/hid/wacom_sys.c b/drivers/hid/wacom_sys.c
index 2717d39600b4..22d73772fbc5 100644
--- a/drivers/hid/wacom_sys.c
+++ b/drivers/hid/wacom_sys.c
@@ -2214,7 +2214,7 @@ static void wacom_update_name(struct wacom *wacom, const char *suffix)
 	if ((features->type == HID_GENERIC) && !strcmp("Wacom HID", features->name)) {
 		char *product_name = wacom->hdev->name;
 
-		if (hid_is_using_ll_driver(wacom->hdev, &usb_hid_driver)) {
+		if (hid_is_usb(wacom->hdev)) {
 			struct usb_interface *intf = to_usb_interface(wacom->hdev->dev.parent);
 			struct usb_device *dev = interface_to_usbdev(intf);
 			product_name = dev->product;
diff --git a/include/linux/hid.h b/include/linux/hid.h
index 9e067f937dbc..f453be385bd4 100644
--- a/include/linux/hid.h
+++ b/include/linux/hid.h
@@ -840,6 +840,11 @@ static inline bool hid_is_using_ll_driver(struct hid_device *hdev,
 	return hdev->ll_driver == driver;
 }
 
+static inline bool hid_is_usb(struct hid_device *hdev)
+{
+	return hid_is_using_ll_driver(hdev, &usb_hid_driver);
+}
+
 #define	PM_HINT_FULLON	1<<5
 #define PM_HINT_NORMAL	1<<1
 
-- 
2.34.1

