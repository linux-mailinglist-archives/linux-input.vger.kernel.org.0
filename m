Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 594157BCDA5
	for <lists+linux-input@lfdr.de>; Sun,  8 Oct 2023 11:56:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344592AbjJHJ4A (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 8 Oct 2023 05:56:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344580AbjJHJz7 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 8 Oct 2023 05:55:59 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2BEFCA
        for <linux-input@vger.kernel.org>; Sun,  8 Oct 2023 02:55:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1696758909;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=nYZDKtSlXnQ1FRRsCoZLuiE/XL41iqdTU3dUtClMnq0=;
        b=RylFfRzirCNrIYtY/MEjf9j0LjEWm62d/+ozAtP5dub1WtEa8qPXfdf2AjrUe3FV0lFGQ/
        pVAwygloZjD/f3wXexDeQyZjKveUfWh3b2RqIY02b2MkSEQo5kNE27UhAfS63b3dsox97A
        MNxG8eAPDPq9svReHmHF5xeWm4glDFk=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-246-5E6pH1xxOSW5nFgdQNZm9g-1; Sun, 08 Oct 2023 05:55:05 -0400
X-MC-Unique: 5E6pH1xxOSW5nFgdQNZm9g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5B3B51C0634C;
        Sun,  8 Oct 2023 09:55:05 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.74])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 72558C15BB8;
        Sun,  8 Oct 2023 09:55:04 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     =?UTF-8?q?Filipe=20La=C3=ADns?= <lains@riseup.net>,
        Bastien Nocera <hadess@hadess.net>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org
Subject: [PATCH v2 05/14] HID: logitech-hidpp: Move get_wireless_feature_index() check to hidpp_connect_event()
Date:   Sun,  8 Oct 2023 11:54:48 +0200
Message-ID: <20231008095458.8926-6-hdegoede@redhat.com>
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

Calling get_wireless_feature_index() from probe() causes
the wireless_feature_index to only get set for unifying devices which
are already connected at probe() time. It does not get set for devices
which connect later.

Fix this by moving get_wireless_feature_index() to hidpp_connect_event(),
this does not make a difference for devices connected at probe() since
probe() will queue the hidpp_connect_event() for those at probe time.

Fixes: 0da0a63b7cba ("HID: logitech-hidpp: Support WirelessDeviceStatus connect events")
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/hid/hid-logitech-hidpp.c | 20 +++++++++-----------
 1 file changed, 9 insertions(+), 11 deletions(-)

diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
index 82f9723154f1..fe4c4871ea5c 100644
--- a/drivers/hid/hid-logitech-hidpp.c
+++ b/drivers/hid/hid-logitech-hidpp.c
@@ -1835,15 +1835,14 @@ static int hidpp_battery_get_property(struct power_supply *psy,
 /* -------------------------------------------------------------------------- */
 #define HIDPP_PAGE_WIRELESS_DEVICE_STATUS			0x1d4b
 
-static int hidpp_set_wireless_feature_index(struct hidpp_device *hidpp)
+static int hidpp_get_wireless_feature_index(struct hidpp_device *hidpp, u8 *feature_index)
 {
 	u8 feature_type;
 	int ret;
 
 	ret = hidpp_root_get_feature(hidpp,
 				     HIDPP_PAGE_WIRELESS_DEVICE_STATUS,
-				     &hidpp->wireless_feature_index,
-				     &feature_type);
+				     feature_index, &feature_type);
 
 	return ret;
 }
@@ -4247,6 +4246,13 @@ static void hidpp_connect_event(struct hidpp_device *hidpp)
 		}
 	}
 
+	if (hidpp->protocol_major >= 2) {
+		u8 feature_index;
+
+		if (!hidpp_get_wireless_feature_index(hidpp, &feature_index))
+			hidpp->wireless_feature_index = feature_index;
+	}
+
 	if (hidpp->name == hdev->name && hidpp->protocol_major >= 2) {
 		name = hidpp_get_device_name(hidpp);
 		if (name) {
@@ -4481,14 +4487,6 @@ static int hidpp_probe(struct hid_device *hdev, const struct hid_device_id *id)
 	connected = hidpp_root_get_protocol_version(hidpp) == 0;
 	atomic_set(&hidpp->connected, connected);
 
-	if (connected && hidpp->protocol_major >= 2) {
-		ret = hidpp_set_wireless_feature_index(hidpp);
-		if (ret == -ENOENT)
-			hidpp->wireless_feature_index = 0;
-		else if (ret)
-			goto hid_hw_init_fail;
-	}
-
 	if (connected && (hidpp->quirks & HIDPP_QUIRK_CLASS_WTP)) {
 		ret = wtp_get_config(hidpp);
 		if (ret)
-- 
2.41.0

