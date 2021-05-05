Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E21C4374AA6
	for <lists+linux-input@lfdr.de>; Wed,  5 May 2021 23:40:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234382AbhEEVlE (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 5 May 2021 17:41:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49033 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234489AbhEEVkn (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 5 May 2021 17:40:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1620250785;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Wh3ljzsbAAW6ZUqua+jJWjltR3pDhfVhRRc0B+jIdmk=;
        b=eNcCLswlFCsH20taEZ1SPnFCVJpaI7vglj4tPysqOoIqRs4zfinwe3ll/EvjG+S431cDli
        isazkgzfDMEnWxALY6DVZaZLlJW7n8DTtU1aJfLT3i5sbfir1418AK1oLVTyQa6r8UUQle
        xaRgU2gftkG41suUpd7zNWYUNinY8eU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-105-wBrXaZ5_Mdyap4b_Jvltsg-1; Wed, 05 May 2021 17:39:44 -0400
X-MC-Unique: wBrXaZ5_Mdyap4b_Jvltsg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 667D1835DE1;
        Wed,  5 May 2021 21:39:43 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-112-71.ams2.redhat.com [10.36.112.71])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 7B2575D6A8;
        Wed,  5 May 2021 21:39:42 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org
Subject: [PATCH v2 2/6] HID: core: Add a hid_is_usb_device() helper function
Date:   Wed,  5 May 2021 23:39:31 +0200
Message-Id: <20210505213935.631351-3-hdegoede@redhat.com>
In-Reply-To: <20210505213935.631351-1-hdegoede@redhat.com>
References: <20210505213935.631351-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Sometimes HID drivers want to know if the hid_device with which they
are dealing is using the usb_hid_driver. For example this is often
done to check if it is safe to cast hid_device->dev.parent to an
usb_interface like this:

struct usb_interface *intf = to_usb_interface(hdev->dev.parent);

If drivers directly call hid_is_using_ll_driver(hdev, &usb_hid_driver))
for this, then this leads to a "missing symbol usb_hid_driver"
compilation error when CONFIG_USB_HID is not enabled. Requiring
the driver to have a depends on USB_HID in their Kconfig entry
to work around this.

Add a hid_is_usb_device() helper function which drivers can use
to safely check if they are dealing with a usb_hid device without
needing to worry about the CONFIG_USB_HID setting.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/hid/hid-core.c | 10 ++++++++++
 include/linux/hid.h    |  1 +
 2 files changed, 11 insertions(+)

diff --git a/drivers/hid/hid-core.c b/drivers/hid/hid-core.c
index b593dff411a6..294c3cf05d85 100644
--- a/drivers/hid/hid-core.c
+++ b/drivers/hid/hid-core.c
@@ -2590,6 +2590,16 @@ int hid_check_keys_pressed(struct hid_device *hid)
 }
 EXPORT_SYMBOL_GPL(hid_check_keys_pressed);
 
+bool hid_is_usb_device(struct hid_device *hid)
+{
+#if IS_ENABLED(CONFIG_USB_HID)
+	return hid_is_using_ll_driver(hid, &usb_hid_driver);
+#else
+	return false;
+#endif
+}
+EXPORT_SYMBOL_GPL(hid_is_usb_device);
+
 static int __init hid_init(void)
 {
 	int ret;
diff --git a/include/linux/hid.h b/include/linux/hid.h
index ef702b3f56e3..6ceadc234132 100644
--- a/include/linux/hid.h
+++ b/include/linux/hid.h
@@ -901,6 +901,7 @@ struct hid_report *hid_validate_values(struct hid_device *hid,
 void hid_setup_resolution_multiplier(struct hid_device *hid);
 int hid_open_report(struct hid_device *device);
 int hid_check_keys_pressed(struct hid_device *hid);
+bool hid_is_usb_device(struct hid_device *hid);
 int hid_connect(struct hid_device *hid, unsigned int connect_mask);
 void hid_disconnect(struct hid_device *hid);
 bool hid_match_one_id(const struct hid_device *hdev,
-- 
2.31.1

