Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 987617BF86E
	for <lists+linux-input@lfdr.de>; Tue, 10 Oct 2023 12:21:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230395AbjJJKVb (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 10 Oct 2023 06:21:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229941AbjJJKVa (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 10 Oct 2023 06:21:30 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE3D897
        for <linux-input@vger.kernel.org>; Tue, 10 Oct 2023 03:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1696933244;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=i60mpHDLYliNvAq+eYcK6E61BINKEDtNU8s6ZVtKSVg=;
        b=HA1xf0iC5i12f9vHh1INKDYipk3b9qAzd9SF+KdeUYopKS1d2GIoeu16kl6Z3mAJDGKIPL
        rOXIOHhvt+sFcCnVNO90kecCfVaL1eHiArpW0KnDqZdHGX8afKOsgqWUNv45GUIJZi/RAB
        rkhI8NMMwO+LNPYOvdLGha1WbWeyjqY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-284-S-t-IbjzO32UR7SYqTBiVQ-1; Tue, 10 Oct 2023 06:20:38 -0400
X-MC-Unique: S-t-IbjzO32UR7SYqTBiVQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 83417185A797;
        Tue, 10 Oct 2023 10:20:38 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.194.20])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 9B1DC40BAED;
        Tue, 10 Oct 2023 10:20:37 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     =?UTF-8?q?Filipe=20La=C3=ADns?= <lains@riseup.net>,
        Bastien Nocera <hadess@hadess.net>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org
Subject: [PATCH v3 02/12] HID: logitech-hidpp: Revert "Don't restart communication if not necessary"
Date:   Tue, 10 Oct 2023 12:20:19 +0200
Message-ID: <20231010102029.111003-3-hdegoede@redhat.com>
In-Reply-To: <20231010102029.111003-1-hdegoede@redhat.com>
References: <20231010102029.111003-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Commit 91cf9a98ae41 ("HID: logitech-hidpp: make .probe usbhid capable")
makes hidpp_probe() first call hid_hw_start(hdev, 0) to allow IO
without connecting any hid subdrivers (hid-input, hidraw).

This is done to allow to retrieve the device's name and serial number
and store these in hdev->name and hdev->uniq.

Then later on IO was stopped and started again with hid_hw_start(hdev,
HID_CONNECT_DEFAULT) connecting hid-input and hidraw after the name
and serial number have been setup.

Commit 498ba2069035 ("HID: logitech-hidpp: Don't restart communication
if not necessary") changed the probe() code to only do the start with
a 0 connect-mask + restart later for unifying devices.

But for non unifying devices hdev->name and hdev->uniq are updated too.
So this change re-introduces the problem for which the start with
a 0 connect-mask + restart later behavior was introduced.

The previous patch in this series changes the unifying path to instead of
restarting IO only call hid_connect() later. This avoids possible issues
with restarting IO seen on non unifying devices.

Revert the change to limit the restart behavior to unifying devices to
fix hdev->name changing after userspace facing devices have already been
registered.

This series has been tested on the following devices:
Logitech Bluetooth Laser Travel Mouse (bluetooth, HID++ 1.0)
Logitech M720 Triathlon (bluetooth, HID++ 4.5)
Logitech M720 Triathlon (unifying, HID++ 4.5)
Logitech K400 Pro (unifying, HID++ 4.1)
Logitech K270 (eQUAD nano Lite, HID++ 2.0)
Logitech M185 (eQUAD nano Lite, HID++ 4.5)
Logitech LX501 keyboard (27 Mhz, HID++ builtin scroll-wheel, HID++ 1.0)
Logitech M-RAZ105 mouse (27 Mhz, HID++ extra mouse buttons, HID++ 1.0)

Fixes: 498ba2069035 ("HID: logitech-hidpp: Don't restart communication if not necessary")
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/hid/hid-logitech-hidpp.c | 24 ++++++++----------------
 1 file changed, 8 insertions(+), 16 deletions(-)

diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
index aa4f232c4518..c582d19b11d6 100644
--- a/drivers/hid/hid-logitech-hidpp.c
+++ b/drivers/hid/hid-logitech-hidpp.c
@@ -4394,7 +4394,6 @@ static int hidpp_probe(struct hid_device *hdev, const struct hid_device_id *id)
 	bool connected;
 	unsigned int connect_mask = HID_CONNECT_DEFAULT;
 	struct hidpp_ff_private_data data;
-	bool will_restart = false;
 
 	/* report_fixup needs drvdata to be set before we call hid_parse */
 	hidpp = devm_kzalloc(&hdev->dev, sizeof(*hidpp), GFP_KERNEL);
@@ -4445,10 +4444,6 @@ static int hidpp_probe(struct hid_device *hdev, const struct hid_device_id *id)
 			return ret;
 	}
 
-	if (hidpp->quirks & HIDPP_QUIRK_DELAYED_INIT ||
-	    hidpp->quirks & HIDPP_QUIRK_UNIFYING)
-		will_restart = true;
-
 	INIT_WORK(&hidpp->work, delayed_work_cb);
 	mutex_init(&hidpp->send_mutex);
 	init_waitqueue_head(&hidpp->wait);
@@ -4465,7 +4460,7 @@ static int hidpp_probe(struct hid_device *hdev, const struct hid_device_id *id)
 	 * name and serial number and store these in hdev->name and hdev->uniq,
 	 * before the hid-input and hidraw drivers expose these to userspace.
 	 */
-	ret = hid_hw_start(hdev, will_restart ? 0 : connect_mask);
+	ret = hid_hw_start(hdev, 0);
 	if (ret) {
 		hid_err(hdev, "hw start failed\n");
 		goto hid_hw_start_fail;
@@ -4504,7 +4499,6 @@ static int hidpp_probe(struct hid_device *hdev, const struct hid_device_id *id)
 			hidpp->wireless_feature_index = 0;
 		else if (ret)
 			goto hid_hw_init_fail;
-		ret = 0;
 	}
 
 	if (connected && (hidpp->quirks & HIDPP_QUIRK_CLASS_WTP)) {
@@ -4520,16 +4514,14 @@ static int hidpp_probe(struct hid_device *hdev, const struct hid_device_id *id)
 	schedule_work(&hidpp->work);
 	flush_work(&hidpp->work);
 
-	if (will_restart) {
-		if (hidpp->quirks & HIDPP_QUIRK_DELAYED_INIT)
-			connect_mask &= ~HID_CONNECT_HIDINPUT;
+	if (hidpp->quirks & HIDPP_QUIRK_DELAYED_INIT)
+		connect_mask &= ~HID_CONNECT_HIDINPUT;
 
-		/* Now export the actual inputs and hidraw nodes to the world */
-		ret = hid_connect(hdev, connect_mask);
-		if (ret) {
-			hid_err(hdev, "%s:hid_connect returned error %d\n", __func__, ret);
-			goto hid_hw_init_fail;
-		}
+	/* Now export the actual inputs and hidraw nodes to the world */
+	ret = hid_connect(hdev, connect_mask);
+	if (ret) {
+		hid_err(hdev, "%s:hid_connect returned error %d\n", __func__, ret);
+		goto hid_hw_init_fail;
 	}
 
 	if (hidpp->quirks & HIDPP_QUIRK_CLASS_G920) {
-- 
2.41.0

