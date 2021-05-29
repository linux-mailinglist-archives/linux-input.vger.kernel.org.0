Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 18B85394CAB
	for <lists+linux-input@lfdr.de>; Sat, 29 May 2021 17:14:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229816AbhE2PQM (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 29 May 2021 11:16:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37905 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229814AbhE2PQL (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 29 May 2021 11:16:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1622301274;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=C1TPDTcbBTXZRJi9ZK9OMh/WSxdQzPTC8wUsE47BhLI=;
        b=WqJprCpyh8yOOR6+pAex3aFpk9wu65wV6tHu5o1V4iAJ9pDGsM8uB/4t8GH2EW0a06TY8U
        0oQaRlN4fmkUgAExNMlOVgc7PIgFxWf0rwdg3Kd7UdmWBz56KsHywjgwZBxD3jnNTKflMs
        RmSxf0lRVeJefTU3qopx/CU4gQ7jY3I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-104-zWncVgEXO8idmkjC8-gziA-1; Sat, 29 May 2021 11:14:33 -0400
X-MC-Unique: zWncVgEXO8idmkjC8-gziA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9AED4801AEE;
        Sat, 29 May 2021 15:14:32 +0000 (UTC)
Received: from x1.localdomain (ovpn-112-39.ams2.redhat.com [10.36.112.39])
        by smtp.corp.redhat.com (Postfix) with ESMTP id AF1AF1002F12;
        Sat, 29 May 2021 15:14:31 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org
Subject: [PATCH 2/4] HID: usbhid: Implement may_wakeup ll-driver callback
Date:   Sat, 29 May 2021 17:14:22 +0200
Message-Id: <20210529151424.12212-3-hdegoede@redhat.com>
In-Reply-To: <20210529151424.12212-1-hdegoede@redhat.com>
References: <20210529151424.12212-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Without a ll-driver callback hid_hw_may_wakeup() will return:
device_may_wakeup(hdev->dev.parent), usb_hid_driver instantiated hid
devices have their parent set to the usb-interface to which the
usb_hid_driver is bound, but the power/wakeup* sysfs attributes are
part of the usb-device.

Add a may_wakeup ll-driver callback which calls device_may_wakeup()
on the usb-device instead.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/hid/usbhid/hid-core.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/hid/usbhid/hid-core.c b/drivers/hid/usbhid/hid-core.c
index 86257ce6d619..3d792c6f1b1a 100644
--- a/drivers/hid/usbhid/hid-core.c
+++ b/drivers/hid/usbhid/hid-core.c
@@ -1304,6 +1304,13 @@ static int usbhid_idle(struct hid_device *hid, int report, int idle,
 	return hid_set_idle(dev, ifnum, report, idle);
 }
 
+static bool usbhid_may_wakeup(struct hid_device *hid)
+{
+	struct usb_device *dev = hid_to_usb_dev(hid);
+
+	return device_may_wakeup(&dev->dev);
+}
+
 struct hid_ll_driver usb_hid_driver = {
 	.parse = usbhid_parse,
 	.start = usbhid_start,
@@ -1316,6 +1323,7 @@ struct hid_ll_driver usb_hid_driver = {
 	.raw_request = usbhid_raw_request,
 	.output_report = usbhid_output_report,
 	.idle = usbhid_idle,
+	.may_wakeup = usbhid_may_wakeup,
 };
 EXPORT_SYMBOL_GPL(usb_hid_driver);
 
-- 
2.31.1

