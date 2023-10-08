Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3550C7BCDA9
	for <lists+linux-input@lfdr.de>; Sun,  8 Oct 2023 11:56:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344559AbjJHJ4j (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 8 Oct 2023 05:56:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344587AbjJHJ4i (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 8 Oct 2023 05:56:38 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4147BDE
        for <linux-input@vger.kernel.org>; Sun,  8 Oct 2023 02:55:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1696758915;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=kjt1ZM5ZIEDUJZJunDTsgtms04Zn5kENYo6Vh2F0W6U=;
        b=GZP4YouE7BT6FuyhHOdBHGO5OY4GdVB1i4yV9QjEWiqr16uKdyv6Hc4TLjrZ4cFYF/uzw+
        ZIrLw4qdytYQyv+oGRIaqDlUb1UW9qGmmH4uC8uke9giM/c4z+xIaXz4UEcrhQRd+b2whm
        UCCQY01+oizPTlbXAvvMEOkI6Dp99Qw=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-145-Yc1Qru95NySj6akQNb1REg-1; Sun, 08 Oct 2023 05:55:09 -0400
X-MC-Unique: Yc1Qru95NySj6akQNb1REg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A59361C0634C;
        Sun,  8 Oct 2023 09:55:08 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.74])
        by smtp.corp.redhat.com (Postfix) with ESMTP id BF245C15BB8;
        Sun,  8 Oct 2023 09:55:07 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     =?UTF-8?q?Filipe=20La=C3=ADns?= <lains@riseup.net>,
        Bastien Nocera <hadess@hadess.net>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org
Subject: [PATCH v2 08/14] HID: logitech-hidpp: Add a hidpp_connect_and_start() helper
Date:   Sun,  8 Oct 2023 11:54:51 +0200
Message-ID: <20231008095458.8926-9-hdegoede@redhat.com>
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

Add a helper to take the 3 hid_hw_start() + hid_hw_open() +
hid_device_io_start() steps which are necessary to be able to
talk to the hw.

This is a preparation patch for moving the connect check to after
restarting IO, in case we miss a connect packet coming in while IO
is disabled during the restart.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/hid/hid-logitech-hidpp.c | 40 ++++++++++++++++++++------------
 1 file changed, 25 insertions(+), 15 deletions(-)

diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
index bbb1c6d8ccc9..45b371e7b9ee 100644
--- a/drivers/hid/hid-logitech-hidpp.c
+++ b/drivers/hid/hid-logitech-hidpp.c
@@ -4391,6 +4391,29 @@ static bool hidpp_application_equals(struct hid_device *hdev,
 	return report && report->application == application;
 }
 
+static int hidpp_connect_and_start(struct hidpp_device *hidpp, unsigned int connect_mask)
+{
+	struct hid_device *hdev = hidpp->hid_dev;
+	int ret;
+
+	ret = hid_hw_start(hdev, connect_mask);
+	if (ret) {
+		hid_err(hdev, "hw start failed: %d\n", ret);
+		return ret;
+	}
+
+	ret = hid_hw_open(hdev);
+	if (ret) {
+		hid_err(hdev, "hw open failed: %d\n", ret);
+		hid_hw_stop(hdev);
+		return ret;
+	}
+
+	/* Allow incoming packets */
+	hid_device_io_start(hdev);
+	return 0;
+}
+
 static int hidpp_probe(struct hid_device *hdev, const struct hid_device_id *id)
 {
 	struct hidpp_device *hidpp;
@@ -4462,21 +4485,9 @@ static int hidpp_probe(struct hid_device *hdev, const struct hid_device_id *id)
 	 * Plain USB connections need to actually call start and open
 	 * on the transport driver to allow incoming data.
 	 */
-	ret = hid_hw_start(hdev, 0);
-	if (ret) {
-		hid_err(hdev, "hw start failed\n");
+	ret = hidpp_connect_and_start(hidpp, 0);
+	if (ret)
 		goto hid_hw_start_fail;
-	}
-
-	ret = hid_hw_open(hdev);
-	if (ret < 0) {
-		dev_err(&hdev->dev, "%s:hid_hw_open returned error:%d\n",
-			__func__, ret);
-		goto hid_hw_open_fail;
-	}
-
-	/* Allow incoming packets */
-	hid_device_io_start(hdev);
 
 	/* Get name + serial, store in hdev->name + hdev->uniq */
 	if (hidpp->quirks & HIDPP_QUIRK_UNIFYING)
@@ -4523,7 +4534,6 @@ static int hidpp_probe(struct hid_device *hdev, const struct hid_device_id *id)
 
 hid_hw_init_fail:
 	hid_hw_close(hdev);
-hid_hw_open_fail:
 	hid_hw_stop(hdev);
 hid_hw_start_fail:
 	sysfs_remove_group(&hdev->dev.kobj, &ps_attribute_group);
-- 
2.41.0

