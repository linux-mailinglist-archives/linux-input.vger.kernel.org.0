Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CD60F7BCDAF
	for <lists+linux-input@lfdr.de>; Sun,  8 Oct 2023 11:56:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344594AbjJHJ4n (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 8 Oct 2023 05:56:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344611AbjJHJ4l (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 8 Oct 2023 05:56:41 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 015AAE4
        for <linux-input@vger.kernel.org>; Sun,  8 Oct 2023 02:55:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1696758917;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=oQvLg+JPXEv8o5z4dY3wQ/bz64J6fDlwx2H8YDJFR38=;
        b=aAXtZViZ+nAMXeNZttzM+/lzU5EU4w8iPYa31rm5D9LikqjIasmWWBbG0jOcnZgbSHKKdt
        InIzOAmx7toYjYcC+Zl1VveGSIRa/mpLbrkQ82meZJ0JZP+mMtv+r0CWOwfgdPCBRI1ECc
        ETfwlAUj+udf4Sn+FYb9vJf6zOIGDwM=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-483-DEganfwRPqOU7dwxS9IR3w-1; Sun, 08 Oct 2023 05:55:03 -0400
X-MC-Unique: DEganfwRPqOU7dwxS9IR3w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 256C029A9CB2;
        Sun,  8 Oct 2023 09:55:03 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.74])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 3C7A5C158BA;
        Sun,  8 Oct 2023 09:55:02 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     =?UTF-8?q?Filipe=20La=C3=ADns?= <lains@riseup.net>,
        Bastien Nocera <hadess@hadess.net>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org
Subject: [PATCH v2 03/14] HID: logitech-hidpp: Add hidpp_non_unifying_init() helper
Date:   Sun,  8 Oct 2023 11:54:46 +0200
Message-ID: <20231008095458.8926-4-hdegoede@redhat.com>
In-Reply-To: <20231008095458.8926-1-hdegoede@redhat.com>
References: <20231008095458.8926-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Turn hidpp_overwrite_name() into a hidpp_non_unifying_init() helper
which takes care of setting both the name and the serial for non
unifying devices.

This mirrors the hidpp_unifying_init() helper for unifying devices.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/hid/hid-logitech-hidpp.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
index b1965b91c5bb..e4dbbdf46b97 100644
--- a/drivers/hid/hid-logitech-hidpp.c
+++ b/drivers/hid/hid-logitech-hidpp.c
@@ -4131,11 +4131,16 @@ static int hidpp_initialize_battery(struct hidpp_device *hidpp)
 	return ret;
 }
 
-static void hidpp_overwrite_name(struct hid_device *hdev)
+/* Get name + serial for USB and Bluetooth HID++ devices */
+static void hidpp_non_unifying_init(struct hidpp_device *hidpp)
 {
-	struct hidpp_device *hidpp = hid_get_drvdata(hdev);
+	struct hid_device *hdev = hidpp->hid_dev;
 	char *name;
 
+	/* Bluetooth devices already have their serialnr set */
+	if (hid_is_usb(hdev))
+		hidpp_serial_init(hidpp);
+
 	name = hidpp_get_device_name(hidpp);
 	if (name) {
 		dbg_hid("HID++: Got name: %s\n", name);
@@ -4467,14 +4472,11 @@ static int hidpp_probe(struct hid_device *hdev, const struct hid_device_id *id)
 	/* Allow incoming packets */
 	hid_device_io_start(hdev);
 
+	/* Get name + serial, store in hdev->name + hdev->uniq */
 	if (hidpp->quirks & HIDPP_QUIRK_UNIFYING)
 		hidpp_unifying_init(hidpp);
-	else {
-		if (hid_is_usb(hidpp->hid_dev))
-			hidpp_serial_init(hidpp);
-
-		hidpp_overwrite_name(hdev);
-	}
+	else
+		hidpp_non_unifying_init(hidpp);
 
 	connected = hidpp_root_get_protocol_version(hidpp) == 0;
 	atomic_set(&hidpp->connected, connected);
-- 
2.41.0

