Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C57557BCDA2
	for <lists+linux-input@lfdr.de>; Sun,  8 Oct 2023 11:55:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344586AbjJHJzw (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 8 Oct 2023 05:55:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344569AbjJHJzv (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 8 Oct 2023 05:55:51 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6E05C5
        for <linux-input@vger.kernel.org>; Sun,  8 Oct 2023 02:55:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1696758908;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=iiZJPTeCOBMQkn0nOhKSU0XyqdnlUqKu4LlFA7D/2NA=;
        b=a8ASCYZ9YUMP1ITnSs+TGuO/Uk3R1uwJh30OIkOpvTiJ5ONqodofuR+luTBlR6OlwJ2iK5
        ba4N18+dksGUGV5snT0ST1VeFnhW1I9q7Mz229DrrPrkhCspUYCPlAMfVGg675QsITlnI6
        WIwD+Cv0QDrr4CN08A0XSqymOLTIqaI=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-50-TdWQR5FeOye-K8I6rFBtxA-1; Sun, 08 Oct 2023 05:55:01 -0400
X-MC-Unique: TdWQR5FeOye-K8I6rFBtxA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E556429AA2F0;
        Sun,  8 Oct 2023 09:55:00 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.74])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 0A8BCC15BB8;
        Sun,  8 Oct 2023 09:54:59 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     =?UTF-8?q?Filipe=20La=C3=ADns?= <lains@riseup.net>,
        Bastien Nocera <hadess@hadess.net>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org
Subject: [PATCH v2 01/14] HID: logitech-hidpp: Revert "Don't restart communication if not necessary"
Date:   Sun,  8 Oct 2023 11:54:44 +0200
Message-ID: <20231008095458.8926-2-hdegoede@redhat.com>
In-Reply-To: <20231008095458.8926-1-hdegoede@redhat.com>
References: <20231008095458.8926-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
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

Then later on IO is stopped and started again with hid_hw_start(hdev,
HID_CONNECT_DEFAULT) connecting hid-input and hidraw after the name
and serial number have been setup.

Commit 498ba2069035 ("HID: logitech-hidpp: Don't restart communication
if not necessary") changed the probe() code to only do the start with
a 0 connect-mask + restart later for unifying devices.

But for non unifying devices hdev->name and hdev->uniq are updated too.
So this change re-introduces the problem for which the start with
a 0 connect-mask + restart later behavior was introduced.

Revert the change to limit the restart behavior to unifying devices to
fix hdev->name changing after userspace facing devices have already been
registered.

Fixes: 498ba2069035 ("HID: logitech-hidpp: Don't restart communication if not necessary")
Cc: Bastien Nocera <hadess@hadess.net>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/hid/hid-logitech-hidpp.c | 32 ++++++++++++--------------------
 1 file changed, 12 insertions(+), 20 deletions(-)

diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
index a209d51bd247..09f7723eaabe 100644
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
@@ -4463,7 +4458,7 @@ static int hidpp_probe(struct hid_device *hdev, const struct hid_device_id *id)
 	 * Plain USB connections need to actually call start and open
 	 * on the transport driver to allow incoming data.
 	 */
-	ret = hid_hw_start(hdev, will_restart ? 0 : connect_mask);
+	ret = hid_hw_start(hdev, 0);
 	if (ret) {
 		hid_err(hdev, "hw start failed\n");
 		goto hid_hw_start_fail;
@@ -4502,7 +4497,6 @@ static int hidpp_probe(struct hid_device *hdev, const struct hid_device_id *id)
 			hidpp->wireless_feature_index = 0;
 		else if (ret)
 			goto hid_hw_init_fail;
-		ret = 0;
 	}
 
 	if (connected && (hidpp->quirks & HIDPP_QUIRK_CLASS_WTP)) {
@@ -4518,21 +4512,19 @@ static int hidpp_probe(struct hid_device *hdev, const struct hid_device_id *id)
 	schedule_work(&hidpp->work);
 	flush_work(&hidpp->work);
 
-	if (will_restart) {
-		/* Reset the HID node state */
-		hid_device_io_stop(hdev);
-		hid_hw_close(hdev);
-		hid_hw_stop(hdev);
+	/* Reset the HID node state */
+	hid_device_io_stop(hdev);
+	hid_hw_close(hdev);
+	hid_hw_stop(hdev);
 
-		if (hidpp->quirks & HIDPP_QUIRK_DELAYED_INIT)
-			connect_mask &= ~HID_CONNECT_HIDINPUT;
+	if (hidpp->quirks & HIDPP_QUIRK_DELAYED_INIT)
+		connect_mask &= ~HID_CONNECT_HIDINPUT;
 
-		/* Now export the actual inputs and hidraw nodes to the world */
-		ret = hid_hw_start(hdev, connect_mask);
-		if (ret) {
-			hid_err(hdev, "%s:hid_hw_start returned error\n", __func__);
-			goto hid_hw_start_fail;
-		}
+	/* Now export the actual inputs and hidraw nodes to the world */
+	ret = hid_hw_start(hdev, connect_mask);
+	if (ret) {
+		hid_err(hdev, "%s:hid_hw_start returned error\n", __func__);
+		goto hid_hw_start_fail;
 	}
 
 	if (hidpp->quirks & HIDPP_QUIRK_CLASS_G920) {
-- 
2.41.0

