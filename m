Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 501877D73CD
	for <lists+linux-input@lfdr.de>; Wed, 25 Oct 2023 21:02:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229498AbjJYTCz (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 25 Oct 2023 15:02:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234855AbjJYTCy (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 25 Oct 2023 15:02:54 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9A0E10E
        for <linux-input@vger.kernel.org>; Wed, 25 Oct 2023 12:02:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1698260524;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=elSlmue7Su3COBV+4fjCe/RzO4+Wu4hmNFcpbzWlleY=;
        b=Nk0rDw4lMVjUM3EO72DhrP0csUAggei6JsGbU2U0LCtG1jc/5gcrmuqELUa56fD4cEnqdH
        SCtr+MkIbXiOHpYwwPEOBRLgWjjDorFVjHRcehXBEr9B60dAAsIPbKTGbd1xfhaBOOQgAq
        oeIzFyjYRvwPo43dq2FVsnb6xQeZurM=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-677-p8C6bcGZPLqR15cHKTWjqw-1; Wed,
 25 Oct 2023 15:02:01 -0400
X-MC-Unique: p8C6bcGZPLqR15cHKTWjqw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5F3522810D47;
        Wed, 25 Oct 2023 19:02:01 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.127])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 6526240C6F79;
        Wed, 25 Oct 2023 19:02:00 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     =?UTF-8?q?Filipe=20La=C3=ADns?= <lains@riseup.net>,
        Bastien Nocera <hadess@hadess.net>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org
Subject: [PATCH] HID: logitech-hidpp: Stop IO before calling hid_connect()
Date:   Wed, 25 Oct 2023 21:01:51 +0200
Message-ID: <20231025190151.302376-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.2
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

hid_connect() will call hid_pidff_init() which does
hid_device_io_start() leading to an "io already started" warning.

To fix this call hid_device_io_stop() before calling hid_connect(),
stopping IO means that connect events may be lost while hid_connect()
runs, re-enable IO and move the hidpp_connect_event() work queuing
after the hid_connect().

Note re-enabling IO is also necessary for the g920_get_config()
call later during hidpp_probe().

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/hid/hid-logitech-hidpp.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
index c1bc89560612..fd6d8f1d9b8f 100644
--- a/drivers/hid/hid-logitech-hidpp.c
+++ b/drivers/hid/hid-logitech-hidpp.c
@@ -4461,19 +4461,22 @@ static int hidpp_probe(struct hid_device *hdev, const struct hid_device_id *id)
 	else
 		hidpp_non_unifying_init(hidpp);
 
-	schedule_work(&hidpp->work);
-	flush_work(&hidpp->work);
-
 	if (hidpp->quirks & HIDPP_QUIRK_DELAYED_INIT)
 		connect_mask &= ~HID_CONNECT_HIDINPUT;
 
 	/* Now export the actual inputs and hidraw nodes to the world */
+	hid_device_io_stop(hdev);
 	ret = hid_connect(hdev, connect_mask);
 	if (ret) {
 		hid_err(hdev, "%s:hid_connect returned error %d\n", __func__, ret);
 		goto hid_hw_init_fail;
 	}
 
+	/* Check for connected devices now that incoming packets will not be disabled again */
+	hid_device_io_start(hdev);
+	schedule_work(&hidpp->work);
+	flush_work(&hidpp->work);
+
 	if (hidpp->quirks & HIDPP_QUIRK_CLASS_G920) {
 		struct hidpp_ff_private_data data;
 
-- 
2.41.0

