Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5FE034652E6
	for <lists+linux-input@lfdr.de>; Wed,  1 Dec 2021 17:38:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243414AbhLAQlq (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 1 Dec 2021 11:41:46 -0500
Received: from sin.source.kernel.org ([145.40.73.55]:54472 "EHLO
        sin.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243363AbhLAQlp (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 1 Dec 2021 11:41:45 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 9B79CCE1FCA
        for <linux-input@vger.kernel.org>; Wed,  1 Dec 2021 16:38:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C968C53FAD;
        Wed,  1 Dec 2021 16:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1638376701;
        bh=URit94yx7yTKKrVR6znRcUdgedZ2D78PMa4/AUIT3H0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Pg4MY7DkzZwywO4NeJ1bPNV+0kiWys+MrDCIFbTrT9fYpEP0sysXswoZygmXOoiJ1
         iXvk3GYlRI2T9q69YeWCvRpVNyEyfmBYp7OVr2OG1m2nv77ghHgzBm9wfHwRe/zeha
         aubHgYZR3BWZEQRgpsIOswl6xr0Fr2b5x76ysiu0=
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     linux-input@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v2 2/3] HID: wacom: fix problems when device is not a valid USB device
Date:   Wed,  1 Dec 2021 17:38:15 +0100
Message-Id: <20211201163816.2219291-2-gregkh@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211201163816.2219291-1-gregkh@linuxfoundation.org>
References: <20211201163816.2219291-1-gregkh@linuxfoundation.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2565; h=from:subject; bh=URit94yx7yTKKrVR6znRcUdgedZ2D78PMa4/AUIT3H0=; b=owGbwMvMwCRo6H6F97bub03G02pJDInLl3xXmpeYtMdbYVLDpHtBB+ZbvZCecHX3WV4vH37vx+XH Nk961RHLwiDIxCArpsjyZRvP0f0VhxS9DG1Pw8xhZQIZwsDFKQATkWVlmJ918MqZaNGfXDPf6jXXrV Q6d/UaUyfDfM+e7l5Vjdq59WcDpm54m+m1dfmEcwA=
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp; fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The wacom driver accepts devices of more than just USB types, but some
code paths can cause problems if the device being controlled is not a
USB device due to a lack of checking.  Add the needed checks to ensure
that the USB device accesses are only happening on a "real" USB device,
and not one on some other bus.

Cc: Jiri Kosina <jikos@kernel.org>
Cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc: linux-input@vger.kernel.org
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
v2: split into separate patch
    refined test to not abort probe for any non-USB device as the driver
    works for many other types based on Benjamin's review

 drivers/hid/wacom_sys.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/hid/wacom_sys.c b/drivers/hid/wacom_sys.c
index 22d73772fbc5..066c567dbaa2 100644
--- a/drivers/hid/wacom_sys.c
+++ b/drivers/hid/wacom_sys.c
@@ -726,7 +726,7 @@ static void wacom_retrieve_hid_descriptor(struct hid_device *hdev,
 	 * Skip the query for this type and modify defaults based on
 	 * interface number.
 	 */
-	if (features->type == WIRELESS) {
+	if (features->type == WIRELESS && intf) {
 		if (intf->cur_altsetting->desc.bInterfaceNumber == 0)
 			features->device_type = WACOM_DEVICETYPE_WL_MONITOR;
 		else
@@ -2451,6 +2451,9 @@ static void wacom_wireless_work(struct work_struct *work)
 
 	wacom_destroy_battery(wacom);
 
+	if (!usbdev)
+		return;
+
 	/* Stylus interface */
 	hdev1 = usb_get_intfdata(usbdev->config->interface[1]);
 	wacom1 = hid_get_drvdata(hdev1);
@@ -2730,8 +2733,6 @@ static void wacom_mode_change_work(struct work_struct *work)
 static int wacom_probe(struct hid_device *hdev,
 		const struct hid_device_id *id)
 {
-	struct usb_interface *intf = to_usb_interface(hdev->dev.parent);
-	struct usb_device *dev = interface_to_usbdev(intf);
 	struct wacom *wacom;
 	struct wacom_wac *wacom_wac;
 	struct wacom_features *features;
@@ -2766,8 +2767,14 @@ static int wacom_probe(struct hid_device *hdev,
 	wacom_wac->hid_data.inputmode = -1;
 	wacom_wac->mode_report = -1;
 
-	wacom->usbdev = dev;
-	wacom->intf = intf;
+	if (hid_is_usb(hdev)) {
+		struct usb_interface *intf = to_usb_interface(hdev->dev.parent);
+		struct usb_device *dev = interface_to_usbdev(intf);
+
+		wacom->usbdev = dev;
+		wacom->intf = intf;
+	}
+
 	mutex_init(&wacom->lock);
 	INIT_DELAYED_WORK(&wacom->init_work, wacom_init_work);
 	INIT_WORK(&wacom->wireless_work, wacom_wireless_work);
-- 
2.34.1

