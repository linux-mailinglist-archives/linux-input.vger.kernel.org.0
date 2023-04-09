Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1D6FE6DC067
	for <lists+linux-input@lfdr.de>; Sun,  9 Apr 2023 16:43:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229583AbjDIOnZ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 9 Apr 2023 10:43:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229462AbjDIOnZ (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 9 Apr 2023 10:43:25 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B05AC30E9
        for <linux-input@vger.kernel.org>; Sun,  9 Apr 2023 07:42:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1681051369;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=UFLbyQ/siPdTt/ksUTe6CUAuQDKxUj93BikknIIghx8=;
        b=d5f+RlX7BoA9H/30rH8gx6Rmoe26iIpo/M4W64YXzk66QZgJDbjkOEo4Xo8G3hN+jtCafl
        fet6nSL/j5lgqWt6MzhrA9T/Y0irDFSORLnwSZaraUaBf6pqK5WJnjwgGj+BDKDd0mb8sR
        9tZ+suAhTcDfVEeEGgeJxGNjF/yuLL8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-638-kt3gUJQnMTuyZHAQceqruA-1; Sun, 09 Apr 2023 10:42:46 -0400
X-MC-Unique: kt3gUJQnMTuyZHAQceqruA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4A125101A531;
        Sun,  9 Apr 2023 14:42:46 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.31])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 7DBD52027040;
        Sun,  9 Apr 2023 14:42:45 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Douglas Anderson <dianders@chromium.org>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org
Subject: [PATCH 1/6] HID: i2c-hid-of: Consistenly use dev local variable in probe()
Date:   Sun,  9 Apr 2023 16:42:38 +0200
Message-Id: <20230409144243.25360-2-hdegoede@redhat.com>
In-Reply-To: <20230409144243.25360-1-hdegoede@redhat.com>
References: <20230409144243.25360-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

i2c_hid_of_probe() has a dev local variable pointing to &i2c_client->dev,
consistently use this everywhere in i2c_hid_of_probe().

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/hid/i2c-hid/i2c-hid-of.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/hid/i2c-hid/i2c-hid-of.c b/drivers/hid/i2c-hid/i2c-hid-of.c
index 10176568133a..c82a5a54c3e6 100644
--- a/drivers/hid/i2c-hid/i2c-hid-of.c
+++ b/drivers/hid/i2c-hid/i2c-hid-of.c
@@ -75,7 +75,7 @@ static int i2c_hid_of_probe(struct i2c_client *client)
 	int ret;
 	u32 val;
 
-	ihid_of = devm_kzalloc(&client->dev, sizeof(*ihid_of), GFP_KERNEL);
+	ihid_of = devm_kzalloc(dev, sizeof(*ihid_of), GFP_KERNEL);
 	if (!ihid_of)
 		return -ENOMEM;
 
@@ -84,24 +84,21 @@ static int i2c_hid_of_probe(struct i2c_client *client)
 
 	ret = of_property_read_u32(dev->of_node, "hid-descr-addr", &val);
 	if (ret) {
-		dev_err(&client->dev, "HID register address not provided\n");
+		dev_err(dev, "HID register address not provided\n");
 		return -ENODEV;
 	}
 	if (val >> 16) {
-		dev_err(&client->dev, "Bad HID register address: 0x%08x\n",
-			val);
+		dev_err(dev, "Bad HID register address: 0x%08x\n", val);
 		return -EINVAL;
 	}
 	hid_descriptor_address = val;
 
-	if (!device_property_read_u32(&client->dev, "post-power-on-delay-ms",
-				      &val))
+	if (!device_property_read_u32(dev, "post-power-on-delay-ms", &val))
 		ihid_of->post_power_delay_ms = val;
 
 	ihid_of->supplies[0].supply = "vdd";
 	ihid_of->supplies[1].supply = "vddl";
-	ret = devm_regulator_bulk_get(&client->dev,
-				      ARRAY_SIZE(ihid_of->supplies),
+	ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(ihid_of->supplies),
 				      ihid_of->supplies);
 	if (ret)
 		return ret;
-- 
2.39.1

