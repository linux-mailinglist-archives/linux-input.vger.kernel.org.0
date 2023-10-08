Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E6BC87BCDAB
	for <lists+linux-input@lfdr.de>; Sun,  8 Oct 2023 11:56:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344609AbjJHJ4l (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 8 Oct 2023 05:56:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344604AbjJHJ4j (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 8 Oct 2023 05:56:39 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7AC97D8
        for <linux-input@vger.kernel.org>; Sun,  8 Oct 2023 02:55:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1696758914;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=QmU2dB37nwoWWj81lKTV6Gm1hvKlJIRjrZ/iBPPqOcY=;
        b=T074PkdA+3kybgLOvC6ci//+66oXroYs+Qp6TO1CbI4FyLphsQJu9luw+ukrjkEo/God8Y
        sJen2uZYAwsbqskTE36RGPQXBsKIdplxM0lm5J701ekvU2BXySFOGxkbp88ZLpkAhw+cO6
        U4s5qATiDxiS9ZS4cOVSVyIopJI1C0A=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-607-Kh5035ZDN6K8JIc463ek7Q-1; Sun, 08 Oct 2023 05:55:11 -0400
X-MC-Unique: Kh5035ZDN6K8JIc463ek7Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F356229AB412;
        Sun,  8 Oct 2023 09:55:10 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.74])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 1906DC15BB8;
        Sun,  8 Oct 2023 09:55:09 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     =?UTF-8?q?Filipe=20La=C3=ADns?= <lains@riseup.net>,
        Bastien Nocera <hadess@hadess.net>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org
Subject: [PATCH v2 10/14] HID: logitech-hidpp: Move g920_get_config() to just before hidpp_ff_init()
Date:   Sun,  8 Oct 2023 11:54:53 +0200
Message-ID: <20231008095458.8926-11-hdegoede@redhat.com>
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

The data retrieved by g920_get_config() is onyl used by hidpp_ff_init().

Now that the hw is kept open till the end of probe() the g920_get_config()
call can be moved to just before hidpp_ff_init() to have all
the HIDPP_QUIRK_CLASS_G920 together in a single place.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/hid/hid-logitech-hidpp.c | 17 ++++++-----------
 1 file changed, 6 insertions(+), 11 deletions(-)

diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
index ff834f905eda..b278e2b8924a 100644
--- a/drivers/hid/hid-logitech-hidpp.c
+++ b/drivers/hid/hid-logitech-hidpp.c
@@ -4420,7 +4420,6 @@ static int hidpp_probe(struct hid_device *hdev, const struct hid_device_id *id)
 	int ret;
 	bool connected;
 	unsigned int connect_mask = HID_CONNECT_DEFAULT;
-	struct hidpp_ff_private_data data;
 
 	/* report_fixup needs drvdata to be set before we call hid_parse */
 	hidpp = devm_kzalloc(&hdev->dev, sizeof(*hidpp), GFP_KERNEL);
@@ -4497,12 +4496,6 @@ static int hidpp_probe(struct hid_device *hdev, const struct hid_device_id *id)
 	else
 		hidpp_non_unifying_init(hidpp);
 
-	if (hidpp->quirks & HIDPP_QUIRK_CLASS_G920) {
-		ret = g920_get_config(hidpp, &data);
-		if (ret)
-			goto hid_hw_init_fail;
-	}
-
 	/* Reset the HID node state */
 	hid_device_io_stop(hdev);
 	hid_hw_close(hdev);
@@ -4527,7 +4520,12 @@ static int hidpp_probe(struct hid_device *hdev, const struct hid_device_id *id)
 	flush_work(&hidpp->work);
 
 	if (hidpp->quirks & HIDPP_QUIRK_CLASS_G920) {
-		ret = hidpp_ff_init(hidpp, &data);
+		struct hidpp_ff_private_data data;
+
+		ret = g920_get_config(hidpp, &data);
+		if (!ret)
+			ret = hidpp_ff_init(hidpp, &data);
+
 		if (ret)
 			hid_warn(hidpp->hid_dev,
 		     "Unable to initialize force feedback support, errno %d\n",
@@ -4541,9 +4539,6 @@ static int hidpp_probe(struct hid_device *hdev, const struct hid_device_id *id)
 	hid_hw_close(hdev);
 	return ret;
 
-hid_hw_init_fail:
-	hid_hw_close(hdev);
-	hid_hw_stop(hdev);
 hid_hw_start_fail:
 	sysfs_remove_group(&hdev->dev.kobj, &ps_attribute_group);
 	cancel_work_sync(&hidpp->work);
-- 
2.41.0

