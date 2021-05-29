Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A09DC394CAA
	for <lists+linux-input@lfdr.de>; Sat, 29 May 2021 17:14:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229821AbhE2PQL (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 29 May 2021 11:16:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58581 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229814AbhE2PQK (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 29 May 2021 11:16:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1622301273;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=KbLduYRKwqWTfuSOSbe1GKOQIYkXZyV7Z64Q3lIATZE=;
        b=MDdvWvXTD9HnUDJAXxKVplzgv0s9NfhLluJ3Fu7xrCO3qGSQjeAeAytDPOLyBgFmuyhb/5
        HxnC8AXO52qQ9oeJNVE/pZ3FiJXXrwuNT5Zrr+JW3qDk+2vZH+PQD6ROD0tbaTe/a+gCfR
        K9SqtrMQtojSBdqRfBn1GsYOoauCA3Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-594-RotmWBvoP8OX4WVFFXeJPw-1; Sat, 29 May 2021 11:14:32 -0400
X-MC-Unique: RotmWBvoP8OX4WVFFXeJPw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6AAAF1007476;
        Sat, 29 May 2021 15:14:31 +0000 (UTC)
Received: from x1.localdomain (ovpn-112-39.ams2.redhat.com [10.36.112.39])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 7E8121002F12;
        Sat, 29 May 2021 15:14:30 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org
Subject: [PATCH 1/4] HID: core: Add hid_hw_may_wakeup() function
Date:   Sat, 29 May 2021 17:14:21 +0200
Message-Id: <20210529151424.12212-2-hdegoede@redhat.com>
In-Reply-To: <20210529151424.12212-1-hdegoede@redhat.com>
References: <20210529151424.12212-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add a hid_hw_may_wakeup() function, which is the equivalent of
hid_hw_may_wakeup() for hid devices.

In most cases this just returns device_may_wakeup(hdev->dev.parent),
but for some ll-drivers this is not correct. E.g. usb_hid_driver
instantiated hid devices have their parent set to the usb-interface
to which the usb_hid_driver is bound, but the power/wakeup* sysfs
attributes are part of the usb-device, which is the usb-interface's
parent.

For these special cases a new may_wakeup callback is added to
hid_ll_driver, so that ll-drivers can override the default behavior.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 include/linux/hid.h | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/include/linux/hid.h b/include/linux/hid.h
index 271021e20a3f..4d2b2212f079 100644
--- a/include/linux/hid.h
+++ b/include/linux/hid.h
@@ -800,6 +800,7 @@ struct hid_driver {
  * @raw_request: send raw report request to device (e.g. feature report)
  * @output_report: send output report to device
  * @idle: send idle request to device
+ * @may_wakeup: return if device may act as a wakeup source during system-suspend
  */
 struct hid_ll_driver {
 	int (*start)(struct hid_device *hdev);
@@ -824,6 +825,7 @@ struct hid_ll_driver {
 	int (*output_report) (struct hid_device *hdev, __u8 *buf, size_t len);
 
 	int (*idle)(struct hid_device *hdev, int report, int idle, int reqtype);
+	bool (*may_wakeup)(struct hid_device *hdev);
 };
 
 extern struct hid_ll_driver i2c_hid_ll_driver;
@@ -1149,6 +1151,22 @@ static inline int hid_hw_idle(struct hid_device *hdev, int report, int idle,
 	return 0;
 }
 
+/**
+ * hid_may_wakeup - return if the hid device may act as a wakeup source during system-suspend
+ *
+ * @hdev: hid device
+ */
+static inline bool hid_hw_may_wakeup(struct hid_device *hdev)
+{
+	if (hdev->ll_driver->may_wakeup)
+		return hdev->ll_driver->may_wakeup(hdev);
+
+	if (hdev->dev.parent)
+		return device_may_wakeup(hdev->dev.parent);
+
+	return false;
+}
+
 /**
  * hid_hw_wait - wait for buffered io to complete
  *
-- 
2.31.1

