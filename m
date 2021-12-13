Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C1C9472525
	for <lists+linux-input@lfdr.de>; Mon, 13 Dec 2021 10:41:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232760AbhLMJlW (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 13 Dec 2021 04:41:22 -0500
Received: from sin.source.kernel.org ([145.40.73.55]:33454 "EHLO
        sin.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233055AbhLMJjf (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 13 Dec 2021 04:39:35 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id BAF72CE0E83;
        Mon, 13 Dec 2021 09:39:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65299C00446;
        Mon, 13 Dec 2021 09:39:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1639388372;
        bh=S/hygQGUET9MIZyjYTY0CDNN5sHGYddTMZYOqSss/Fs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=hoOjTaoXTcS3/+4lHcEg6IZcwB4ovajMNNdqIvAPDg4lbIg/xmQzGfppYjgNoLVEe
         K4no6Zk1/aHLALPYlKU/M9zh60dMlgHwZwOwyacOAFS4ZSwxmXKXt1QGaXmF4cD87l
         5kfijAEHt+TeYt/gYKhECLcvgrt8rpm99AWEXWMw=
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     linux-kernel@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        stable@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org
Subject: [PATCH 4.19 06/74] HID: wacom: fix problems when device is not a valid USB device
Date:   Mon, 13 Dec 2021 10:29:37 +0100
Message-Id: <20211213092930.981333974@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211213092930.763200615@linuxfoundation.org>
References: <20211213092930.763200615@linuxfoundation.org>
User-Agent: quilt/0.66
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

commit 720ac467204a70308bd687927ed475afb904e11b upstream.

The wacom driver accepts devices of more than just USB types, but some
code paths can cause problems if the device being controlled is not a
USB device due to a lack of checking.  Add the needed checks to ensure
that the USB device accesses are only happening on a "real" USB device,
and not one on some other bus.

Cc: Jiri Kosina <jikos@kernel.org>
Cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc: linux-input@vger.kernel.org
Cc: stable@vger.kernel.org
Tested-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>
Link: https://lore.kernel.org/r/20211201183503.2373082-2-gregkh@linuxfoundation.org
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/hid/wacom_sys.c |   17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

--- a/drivers/hid/wacom_sys.c
+++ b/drivers/hid/wacom_sys.c
@@ -697,7 +697,7 @@ static void wacom_retrieve_hid_descripto
 	 * Skip the query for this type and modify defaults based on
 	 * interface number.
 	 */
-	if (features->type == WIRELESS) {
+	if (features->type == WIRELESS && intf) {
 		if (intf->cur_altsetting->desc.bInterfaceNumber == 0)
 			features->device_type = WACOM_DEVICETYPE_WL_MONITOR;
 		else
@@ -2419,6 +2419,9 @@ static void wacom_wireless_work(struct w
 
 	wacom_destroy_battery(wacom);
 
+	if (!usbdev)
+		return;
+
 	/* Stylus interface */
 	hdev1 = usb_get_intfdata(usbdev->config->interface[1]);
 	wacom1 = hid_get_drvdata(hdev1);
@@ -2698,8 +2701,6 @@ static void wacom_mode_change_work(struc
 static int wacom_probe(struct hid_device *hdev,
 		const struct hid_device_id *id)
 {
-	struct usb_interface *intf = to_usb_interface(hdev->dev.parent);
-	struct usb_device *dev = interface_to_usbdev(intf);
 	struct wacom *wacom;
 	struct wacom_wac *wacom_wac;
 	struct wacom_features *features;
@@ -2736,8 +2737,14 @@ static int wacom_probe(struct hid_device
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


