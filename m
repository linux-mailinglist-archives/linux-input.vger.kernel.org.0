Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AEA6B32FAE2
	for <lists+linux-input@lfdr.de>; Sat,  6 Mar 2021 14:38:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230483AbhCFNh5 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 6 Mar 2021 08:37:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45537 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230472AbhCFNh1 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 6 Mar 2021 08:37:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1615037847;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=jmiQKXGDA936jk/6+/NlBgGGjrJTW3es/ozXHww+pbE=;
        b=TTglxrRDjDa4QEzJ7Cbys4J0TDMx07iDxxI1DFQJkhbMjPAEO+Ty1q6E9ABNk2DBlwWzr8
        zYCi/C69se4/MARxctHlz9IS7XZqLofL/Kfg4F0QohhDRX6TTMgijo0yavcPhqNrEgpgqQ
        cinsswySRUvgd6eXJy39uG+onerOhlg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-599-1qFd_TwoPWqkNpg5LOGS-A-1; Sat, 06 Mar 2021 08:37:25 -0500
X-MC-Unique: 1qFd_TwoPWqkNpg5LOGS-A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 129B1801814;
        Sat,  6 Mar 2021 13:37:24 +0000 (UTC)
Received: from x1.localdomain (ovpn-112-60.ams2.redhat.com [10.36.112.60])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 20D6419C66;
        Sat,  6 Mar 2021 13:37:22 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org
Subject: [PATCH 3/3] HID: multitouch: Disable event reporting on suspend when our parent is not a wakeup-source
Date:   Sat,  6 Mar 2021 14:37:16 +0100
Message-Id: <20210306133716.453447-3-hdegoede@redhat.com>
In-Reply-To: <20210306133716.453447-1-hdegoede@redhat.com>
References: <20210306133716.453447-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Disable event reporting on suspend when our parent is not
a wakeup-source. This should help save some extra power in
this case.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/hid/Kconfig          |  2 +-
 drivers/hid/hid-multitouch.c | 23 ++++++++++++++++++++++-
 2 files changed, 23 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
index 786b71ef7738..5cbe4adfd816 100644
--- a/drivers/hid/Kconfig
+++ b/drivers/hid/Kconfig
@@ -675,7 +675,7 @@ config HID_MONTEREY
 
 config HID_MULTITOUCH
 	tristate "HID Multitouch panels"
-	depends on HID
+	depends on USB_HID
 	help
 	  Generic support for HID multitouch panels.
 
diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
index cfb68e443ddd..7926295bab81 100644
--- a/drivers/hid/hid-multitouch.c
+++ b/drivers/hid/hid-multitouch.c
@@ -1759,12 +1759,33 @@ static int mt_probe(struct hid_device *hdev, const struct hid_device_id *id)
 }
 
 #ifdef CONFIG_PM
+
+/* Check if the parent which has the power/wakeup* sysfs attributes may wake the hdev */
+static bool mt_parent_may_wake(struct hid_device *hdev)
+{
+	struct device *parent = hdev->dev.parent;
+
+	/*
+	 * USB-HID is attached to the usb_interface (our parent), the
+	 * power/wakeup* attr are part of the usb-device which is its parent.
+	 */
+	if (hid_is_using_ll_driver(hdev, &usb_hid_driver) && parent)
+		parent = parent->parent;
+
+	if (parent)
+		return device_may_wakeup(parent);
+
+	/* Huh? Play it safe and keep reporting events. */
+	return true;
+}
+
 static int mt_suspend(struct hid_device *hdev, pm_message_t state)
 {
 	struct mt_device *td = hid_get_drvdata(hdev);
 
 	/* High latency is desirable for power savings during S3/S0ix */
-	if (td->mtclass.quirks & MT_QUIRK_DISABLE_WAKEUP)
+	if ((td->mtclass.quirks & MT_QUIRK_DISABLE_WAKEUP) ||
+	    !mt_parent_may_wake(hdev))
 		mt_set_modes(hdev, HID_LATENCY_HIGH, false, false);
 	else
 		mt_set_modes(hdev, HID_LATENCY_HIGH, true, true);
-- 
2.30.1

