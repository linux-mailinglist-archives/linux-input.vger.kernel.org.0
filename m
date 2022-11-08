Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A96386217D0
	for <lists+linux-input@lfdr.de>; Tue,  8 Nov 2022 16:15:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234355AbiKHPPM (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 8 Nov 2022 10:15:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233809AbiKHPPD (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 8 Nov 2022 10:15:03 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1D4B554ED
        for <linux-input@vger.kernel.org>; Tue,  8 Nov 2022 07:13:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1667920436;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=3xGHFh4DrjQY2pcqTWFIXxOVH3fixxoXtO8vxBDAk8Y=;
        b=ThaEHytaJNdckudiniXDGEplINkbl6lq69LSHg4Ti1j2UyTpCWRGvQeYb8GOY9WVGB0Tel
        ayUVhjXlxiUlvvkuF4iLW3pM02NQ1qNd+hgwbYL1QPU4B9oeZJ53n7YvQ9EoEFUJ8E9GO/
        9VsfgQSqgRhqf3HbxjEj9S2I1Fe6LNc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-244---kVUdwbOraYCKsYL7hv4A-1; Tue, 08 Nov 2022 10:13:52 -0500
X-MC-Unique: --kVUdwbOraYCKsYL7hv4A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 749D63802B86;
        Tue,  8 Nov 2022 15:13:52 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.194.141])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 4DF911121314;
        Tue,  8 Nov 2022 15:13:51 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org,
        Rudolf Polzer <rpolzer@google.com>
Subject: [PATCH] HID: ite: Enable QUIRK_TOUCHPAD_ON_OFF_REPORT on Acer Aspire Switch V 10
Date:   Tue,  8 Nov 2022 16:13:50 +0100
Message-Id: <20221108151350.107055-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The Acer Aspire Switch V 10 (SW5-017)'s keyboard-dock uses the same
ITE controller setup as other Acer Switch 2-in-1's.

This needs special handling for the wifi on/off toggle hotkey as well as
to properly report touchpad on/off keypresses.

Add the USB-ids for the SW5-017's keyboard-dock with a quirk setting of
QUIRK_TOUCHPAD_ON_OFF_REPORT to fix both issues.

Cc: Rudolf Polzer <rpolzer@google.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/hid/hid-ids.h | 1 +
 drivers/hid/hid-ite.c | 5 +++++
 2 files changed, 6 insertions(+)

diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index dad953f66996..b3dfe8d9e556 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -1215,6 +1215,7 @@
 #define USB_DEVICE_ID_SYNAPTICS_DELL_K15A	0x6e21
 #define USB_DEVICE_ID_SYNAPTICS_ACER_ONE_S1002	0x73f4
 #define USB_DEVICE_ID_SYNAPTICS_ACER_ONE_S1003	0x73f5
+#define USB_DEVICE_ID_SYNAPTICS_ACER_SWITCH5_017	0x73f6
 #define USB_DEVICE_ID_SYNAPTICS_ACER_SWITCH5	0x81a7
 
 #define USB_VENDOR_ID_TEXAS_INSTRUMENTS	0x2047
diff --git a/drivers/hid/hid-ite.c b/drivers/hid/hid-ite.c
index 430fa4f52ed3..75ebfcf31889 100644
--- a/drivers/hid/hid-ite.c
+++ b/drivers/hid/hid-ite.c
@@ -121,6 +121,11 @@ static const struct hid_device_id ite_devices[] = {
 		     USB_VENDOR_ID_SYNAPTICS,
 		     USB_DEVICE_ID_SYNAPTICS_ACER_ONE_S1003),
 	  .driver_data = QUIRK_TOUCHPAD_ON_OFF_REPORT },
+	/* ITE8910 USB kbd ctlr, with Synaptics touchpad connected to it. */
+	{ HID_DEVICE(BUS_USB, HID_GROUP_GENERIC,
+		     USB_VENDOR_ID_SYNAPTICS,
+		     USB_DEVICE_ID_SYNAPTICS_ACER_SWITCH5_017),
+	  .driver_data = QUIRK_TOUCHPAD_ON_OFF_REPORT },
 	{ }
 };
 MODULE_DEVICE_TABLE(hid, ite_devices);
-- 
2.37.3

