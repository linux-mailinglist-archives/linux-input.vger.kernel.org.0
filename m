Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F987374AAC
	for <lists+linux-input@lfdr.de>; Wed,  5 May 2021 23:40:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233772AbhEEVlJ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 5 May 2021 17:41:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52706 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233722AbhEEVkt (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 5 May 2021 17:40:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1620250792;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=KJpnGKsjgIiuxbsc1ISPgJdjzVr1zEzqG2Jggbdhcdk=;
        b=WqMI8kWXuOmoVJt0MBkGsYm1Cu6txENThjgLXmFbv6zZAxjwbnylpchL8oOqdbUWmj4ePw
        sbXEZNQIXdMDpOPYxzAHKKJv/CI6iPPu6uUfgRQbbDWLDLYmEZ93qycDb8sSzphAKam0YS
        l3b65xCgltkBNXyVV6J58DSn2hgcpEM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-188-ik9t_UfVPuqfoEzwmswfhA-1; Wed, 05 May 2021 17:39:49 -0400
X-MC-Unique: ik9t_UfVPuqfoEzwmswfhA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 60AD4801B13;
        Wed,  5 May 2021 21:39:48 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-112-71.ams2.redhat.com [10.36.112.71])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 741C75D6A8;
        Wed,  5 May 2021 21:39:47 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org
Subject: [PATCH v2 6/6] HID: asus: Switch to the new hid_is_usb_device() helper
Date:   Wed,  5 May 2021 23:39:35 +0200
Message-Id: <20210505213935.631351-7-hdegoede@redhat.com>
In-Reply-To: <20210505213935.631351-1-hdegoede@redhat.com>
References: <20210505213935.631351-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Switch to the new hid_is_usb_device() helper.

With this new helper building without USB_HID being enabled should work,
so also change the Kconfig depends on from USB_HID to plain HID.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/hid/Kconfig    | 2 +-
 drivers/hid/hid-asus.c | 6 ++----
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
index 786b71ef7738..6b244e67c272 100644
--- a/drivers/hid/Kconfig
+++ b/drivers/hid/Kconfig
@@ -149,7 +149,7 @@ config HID_APPLEIR
 
 config HID_ASUS
 	tristate "Asus"
-	depends on USB_HID
+	depends on HID
 	depends on LEDS_CLASS
 	depends on ASUS_WMI || ASUS_WMI=n
 	select POWER_SUPPLY
diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
index 6e24f48f211c..41bc34aaaf09 100644
--- a/drivers/hid/hid-asus.c
+++ b/drivers/hid/hid-asus.c
@@ -1009,8 +1009,7 @@ static int asus_probe(struct hid_device *hdev, const struct hid_device_id *id)
 	if (drvdata->quirks & QUIRK_IS_MULTITOUCH)
 		drvdata->tp = &asus_i2c_tp;
 
-	if ((drvdata->quirks & QUIRK_T100_KEYBOARD) &&
-	    hid_is_using_ll_driver(hdev, &usb_hid_driver)) {
+	if ((drvdata->quirks & QUIRK_T100_KEYBOARD) && hid_is_usb_device(hdev)) {
 		struct usb_interface *intf = to_usb_interface(hdev->dev.parent);
 
 		if (intf->altsetting->desc.bInterfaceNumber == T100_TPAD_INTF) {
@@ -1038,8 +1037,7 @@ static int asus_probe(struct hid_device *hdev, const struct hid_device_id *id)
 		drvdata->tp = &asus_t100chi_tp;
 	}
 
-	if ((drvdata->quirks & QUIRK_MEDION_E1239T) &&
-	    hid_is_using_ll_driver(hdev, &usb_hid_driver)) {
+	if ((drvdata->quirks & QUIRK_MEDION_E1239T) && hid_is_usb_device(hdev)) {
 		struct usb_host_interface *alt =
 			to_usb_interface(hdev->dev.parent)->altsetting;
 
-- 
2.31.1

