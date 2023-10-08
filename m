Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D0AB97BCDA8
	for <lists+linux-input@lfdr.de>; Sun,  8 Oct 2023 11:56:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344608AbjJHJ4j (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 8 Oct 2023 05:56:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344594AbjJHJ4i (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 8 Oct 2023 05:56:38 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 966ACE9
        for <linux-input@vger.kernel.org>; Sun,  8 Oct 2023 02:55:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1696758919;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=E1kj2POh2TKKg4arWVtWEwTpR1rPeel0wPR3HdautPE=;
        b=RJwaEiJ9Rwf/0KUKzfZGEgB2K1H3QHvttwMrU1wWonoIqyAsBwbn8cdkh8VlWxIg+J6JbI
        gtdMhawJjRKjbdE2/hLVAfBXBdNUUZ38tupdKTrnflmE6PMD6p69ahWxgS6NPbLuV/MCnc
        u5mfa3ZZGaZ+syvl2p/ltJjkGoXrQU4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-554-yn3WIBqTNkSN1NPe_usLZg-1; Sun, 08 Oct 2023 05:55:12 -0400
X-MC-Unique: yn3WIBqTNkSN1NPe_usLZg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 17DB1185A790;
        Sun,  8 Oct 2023 09:55:12 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.74])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 317EEC15BB8;
        Sun,  8 Oct 2023 09:55:11 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     =?UTF-8?q?Filipe=20La=C3=ADns?= <lains@riseup.net>,
        Bastien Nocera <hadess@hadess.net>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org
Subject: [PATCH v2 11/14] HID: logitech-hidpp: Remove unused connected param from *_connect()
Date:   Sun,  8 Oct 2023 11:54:54 +0200
Message-ID: <20231008095458.8926-12-hdegoede@redhat.com>
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

Remove the unused connected function parameter from wtp_connect(),
m560_send_config_command() and k400_connect().

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/hid/hid-logitech-hidpp.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
index b278e2b8924a..2b0a2ea5da22 100644
--- a/drivers/hid/hid-logitech-hidpp.c
+++ b/drivers/hid/hid-logitech-hidpp.c
@@ -3141,7 +3141,7 @@ static int wtp_allocate(struct hid_device *hdev, const struct hid_device_id *id)
 	return 0;
 };
 
-static int wtp_connect(struct hid_device *hdev, bool connected)
+static int wtp_connect(struct hid_device *hdev)
 {
 	struct hidpp_device *hidpp = hid_get_drvdata(hdev);
 	struct wtp_data *wd = hidpp->private_data;
@@ -3203,7 +3203,7 @@ static const u8 m560_config_parameter[] = {0x00, 0xaf, 0x03};
 #define M560_SUB_ID			0x0a
 #define M560_BUTTON_MODE_REGISTER	0x35
 
-static int m560_send_config_command(struct hid_device *hdev, bool connected)
+static int m560_send_config_command(struct hid_device *hdev)
 {
 	struct hidpp_report response;
 	struct hidpp_device *hidpp_dev;
@@ -3398,7 +3398,7 @@ static int k400_allocate(struct hid_device *hdev)
 	return 0;
 };
 
-static int k400_connect(struct hid_device *hdev, bool connected)
+static int k400_connect(struct hid_device *hdev)
 {
 	struct hidpp_device *hidpp = hid_get_drvdata(hdev);
 
@@ -4205,15 +4205,15 @@ static void hidpp_connect_event(struct hidpp_device *hidpp)
 	}
 
 	if (hidpp->quirks & HIDPP_QUIRK_CLASS_WTP) {
-		ret = wtp_connect(hdev, connected);
+		ret = wtp_connect(hdev);
 		if (ret)
 			return;
 	} else if (hidpp->quirks & HIDPP_QUIRK_CLASS_M560) {
-		ret = m560_send_config_command(hdev, connected);
+		ret = m560_send_config_command(hdev);
 		if (ret)
 			return;
 	} else if (hidpp->quirks & HIDPP_QUIRK_CLASS_K400) {
-		ret = k400_connect(hdev, connected);
+		ret = k400_connect(hdev);
 		if (ret)
 			return;
 	}
-- 
2.41.0

