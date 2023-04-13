Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9E9996E0A55
	for <lists+linux-input@lfdr.de>; Thu, 13 Apr 2023 11:37:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230204AbjDMJhQ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 13 Apr 2023 05:37:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229711AbjDMJhO (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 13 Apr 2023 05:37:14 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC64E10FC
        for <linux-input@vger.kernel.org>; Thu, 13 Apr 2023 02:36:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1681378589;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=UFLbyQ/siPdTt/ksUTe6CUAuQDKxUj93BikknIIghx8=;
        b=UbaS8TanozLmVXpz2gkTGhYT8WSFXoh5pnoNdT/A3Ugo2txQSH6to9Ottj9hfF7bn9XJEI
        Dcnf0uwgks6lrpOLwgQy+6Tmr8HgX/et6wAjEwN1JYCLc23LcamQiJT2Igs1VlZuwFOQZ+
        ZsOV07X48fdZ6Yrt34JfS+2/rC7naYA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-106-zklUxsNpO8KTDd4x4kZ1aQ-1; Thu, 13 Apr 2023 05:36:28 -0400
X-MC-Unique: zklUxsNpO8KTDd4x4kZ1aQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3E0B81C0879F;
        Thu, 13 Apr 2023 09:36:28 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.195.47])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 7B0B7C16028;
        Thu, 13 Apr 2023 09:36:27 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Douglas Anderson <dianders@chromium.org>,
        linux-input@vger.kernel.org
Subject: [PATCH v2 1/3] HID: i2c-hid-of: Consistenly use dev local variable in probe()
Date:   Thu, 13 Apr 2023 11:36:23 +0200
Message-Id: <20230413093625.71146-2-hdegoede@redhat.com>
In-Reply-To: <20230413093625.71146-1-hdegoede@redhat.com>
References: <20230413093625.71146-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
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

