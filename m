Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E9E147BB2EC
	for <lists+linux-input@lfdr.de>; Fri,  6 Oct 2023 10:20:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230445AbjJFIUA (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 6 Oct 2023 04:20:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230486AbjJFIT7 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 6 Oct 2023 04:19:59 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91011EB
        for <linux-input@vger.kernel.org>; Fri,  6 Oct 2023 01:19:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1696580353;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=T8r6BuhhHNCuaReOYrE87W3e+J02utYf4Bb0HnAaUFM=;
        b=Xf0cBXGo2rDQbGIOdz59a7OM5qyIzYiKpxlLuX2TKAxXInhShd0cHAJK1uy0j12k8j59rR
        dmptIlTWjKEv0Mlr8b8Eh39sj/Bf+zlW6BFCXpbxLPWtpqInWygi+WSG9/54e9XH7YNmUl
        xzrXlqDAB5DOJFs6mhy/beHtfqV6qMA=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-300-68TMe5oxPbG2jcjkCFNmiw-1; Fri, 06 Oct 2023 04:19:07 -0400
X-MC-Unique: 68TMe5oxPbG2jcjkCFNmiw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 864B21DD35D3;
        Fri,  6 Oct 2023 08:19:07 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.193.111])
        by smtp.corp.redhat.com (Postfix) with ESMTP id A06D2140E950;
        Fri,  6 Oct 2023 08:19:06 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     =?UTF-8?q?Filipe=20La=C3=ADns?= <lains@riseup.net>,
        Bastien Nocera <hadess@hadess.net>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org
Subject: [PATCH 2/2] HID: logitech-hidpp: Drop delayed_work_cb()
Date:   Fri,  6 Oct 2023 10:18:58 +0200
Message-ID: <20231006081858.17677-3-hdegoede@redhat.com>
In-Reply-To: <20231006081858.17677-1-hdegoede@redhat.com>
References: <20231006081858.17677-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Drop delayed_work_cb() instead make hidpp_connect_event() the workqueue
function itself.

Besides resulting in a small cleanup this will hopefully also make
it clearer that going forward hidpp_connect_event() should only
be run from a workqueue and not be directly involved.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/hid/hid-logitech-hidpp.c | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
index 33f9cd98485a..15c36112902b 100644
--- a/drivers/hid/hid-logitech-hidpp.c
+++ b/drivers/hid/hid-logitech-hidpp.c
@@ -236,8 +236,6 @@ struct hidpp_device {
 #define HIDPP20_ERROR_UNSUPPORTED		0x09
 #define HIDPP20_ERROR				0xff
 
-static void hidpp_connect_event(struct hidpp_device *hidpp_dev);
-
 static int __hidpp_send_report(struct hid_device *hdev,
 				struct hidpp_report *hidpp_report)
 {
@@ -451,13 +449,6 @@ static int hidpp_send_rap_command_sync(struct hidpp_device *hidpp_dev,
 	return ret;
 }
 
-static void delayed_work_cb(struct work_struct *work)
-{
-	struct hidpp_device *hidpp = container_of(work, struct hidpp_device,
-							work);
-	hidpp_connect_event(hidpp);
-}
-
 static inline bool hidpp_match_answer(struct hidpp_report *question,
 		struct hidpp_report *answer)
 {
@@ -4190,8 +4181,9 @@ static struct input_dev *hidpp_allocate_input(struct hid_device *hdev)
 	return input_dev;
 }
 
-static void hidpp_connect_event(struct hidpp_device *hidpp)
+static void hidpp_connect_event(struct work_struct *work)
 {
+	struct hidpp_device *hidpp = container_of(work, struct hidpp_device, work);
 	struct hid_device *hdev = hidpp->hid_dev;
 	int ret = 0;
 	bool connected = atomic_read(&hidpp->connected);
@@ -4455,7 +4447,7 @@ static int hidpp_probe(struct hid_device *hdev, const struct hid_device_id *id)
 	    hidpp->quirks & HIDPP_QUIRK_UNIFYING)
 		will_restart = true;
 
-	INIT_WORK(&hidpp->work, delayed_work_cb);
+	INIT_WORK(&hidpp->work, hidpp_connect_event);
 	mutex_init(&hidpp->io_mutex);
 	mutex_init(&hidpp->send_mutex);
 	init_waitqueue_head(&hidpp->wait);
-- 
2.41.0

