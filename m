Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BF9407BCDB1
	for <lists+linux-input@lfdr.de>; Sun,  8 Oct 2023 11:56:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344603AbjJHJ4s (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 8 Oct 2023 05:56:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344612AbjJHJ4r (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 8 Oct 2023 05:56:47 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90DACF1
        for <linux-input@vger.kernel.org>; Sun,  8 Oct 2023 02:55:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1696758932;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=b5rJrslAnv1U9s2DPDPrRtntfVCJmFEfnHd6BuXiqxU=;
        b=TI8qoUOIFGP42orL9Y0KMQIUjPosTu0zbSJ8900TBbwgak9n54nPy/yLv3LiLe9AkIGXWx
        fah19qvdJ/WMZqPmK0tD4NiW5CfB4nV/hTjfu+vlv2GY3g7maBEjxiauph8WkOpPAbsLth
        ugZ/KIz9jDOWQ8M0pik0AN+YHUH9NPI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-530-CVyg9Dh2NsefyL_4Hrjy_w-1; Sun, 08 Oct 2023 05:55:14 -0400
X-MC-Unique: CVyg9Dh2NsefyL_4Hrjy_w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4B9CA101A550;
        Sun,  8 Oct 2023 09:55:14 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.74])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 64103C15BB8;
        Sun,  8 Oct 2023 09:55:13 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     =?UTF-8?q?Filipe=20La=C3=ADns?= <lains@riseup.net>,
        Bastien Nocera <hadess@hadess.net>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org
Subject: [PATCH v2 13/14] HID: logitech-hidpp: Avoid hidpp_connect_event() running while probe() restarts IO
Date:   Sun,  8 Oct 2023 11:54:56 +0200
Message-ID: <20231008095458.8926-14-hdegoede@redhat.com>
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

hidpp_probe() restarts IO after setting things up, if we get a connect
event just before hidpp_probe() stops all IO then hidpp_connect_event()
will be running from the workqueue and it will see IO errors.

To avoid this add an enable_connect_event flag and only set that
after the IO restart is done.

Since an hidpp_connect_event() run is queued after restarting IO
anyways, connect events before that run can safely be ignored.

Note this also means that hidpp_connect_event() is now guaranteed to
not get queued on hidpp_connect_and_start() failures so the work
for this no longer needs to be cancelled on failure.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v2:
- Use an enable_connect_event flag instead of a mutex
---
 drivers/hid/hid-logitech-hidpp.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
index 37213dcc9d9c..9e34a29619a0 100644
--- a/drivers/hid/hid-logitech-hidpp.c
+++ b/drivers/hid/hid-logitech-hidpp.c
@@ -192,6 +192,7 @@ struct hidpp_device {
 
 	void *private_data;
 
+	atomic_t enable_connect_event;
 	struct work_struct work;
 	struct kfifo delayed_work_fifo;
 	struct input_dev *delayed_input;
@@ -3892,6 +3893,9 @@ static int hidpp_raw_hidpp_event(struct hidpp_device *hidpp, u8 *data,
 	}
 
 	if (unlikely(hidpp_report_is_connect_event(hidpp, report))) {
+		if (!atomic_read(&hidpp->enable_connect_event))
+			return 1;
+
 		if (schedule_work(&hidpp->work) == 0)
 			dbg_hid("%s: connect event already queued\n", __func__);
 		return 1;
@@ -4501,6 +4505,7 @@ static int hidpp_probe(struct hid_device *hdev, const struct hid_device_id *id)
 	 * again (which may cause missing packets) queue hidpp_connect_event()
 	 * to check the connected state of the device.
 	 */
+	atomic_set(&hidpp->enable_connect_event, 1);
 	schedule_work(&hidpp->work);
 	flush_work(&hidpp->work);
 
@@ -4526,7 +4531,6 @@ static int hidpp_probe(struct hid_device *hdev, const struct hid_device_id *id)
 
 hid_hw_start_fail:
 	sysfs_remove_group(&hdev->dev.kobj, &ps_attribute_group);
-	cancel_work_sync(&hidpp->work);
 	mutex_destroy(&hidpp->send_mutex);
 	return ret;
 }
-- 
2.41.0

