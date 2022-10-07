Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D01F85F7D64
	for <lists+linux-input@lfdr.de>; Fri,  7 Oct 2022 20:30:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229682AbiJGSad (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 7 Oct 2022 14:30:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229834AbiJGSa0 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 7 Oct 2022 14:30:26 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 682C2CAE71
        for <linux-input@vger.kernel.org>; Fri,  7 Oct 2022 11:30:23 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id a10so8444680wrm.12
        for <linux-input@vger.kernel.org>; Fri, 07 Oct 2022 11:30:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JNN28EYVyipGF0nBWtHYc0eS8Dpeqf76Q08EI6PsIYU=;
        b=qxAr0agrBtuhcTLuSxwaDckdMbmBM1fxleKKtepgIMmgz97EO5RtBq16Aloynl2ov6
         8XBY6hmYNKFgOWfdKY0qUBW0tTrDO4xK47f6XOpdQHCyT5foyc2aMV1tC4fScK7Ne8nW
         +gy3kQw7XdyKGuuzBaB6iHyYjZ7thDm/A1ztZo/4vTvRfoXH8kGy9Hr2LnxzT6KuAKeF
         4j2Nz/N7rBxB8B2/bhVviWfXt2MJNlveZcMArUmp9DTHQ6Mbh2NpuRwfK4vx8CGfOa8l
         toKpys5WqMglynMrsgyC7pQH6c31fZKHVv+RR1Bgh4VePtF6sruOak9OSOfp2vYQ9tNE
         /BAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JNN28EYVyipGF0nBWtHYc0eS8Dpeqf76Q08EI6PsIYU=;
        b=tMvYdJ29YP0+J9bbGoNfa/dac4zW74dwCmHTlVfbLOrGtkwR6Ow9LNVpNHcFEvo8jI
         lyS+yQY0C1PmmbaiftIJo8Xqqfqej7PTptnMKakOTD6QCi+uNJz6h9Y0EQPewG8oYcFn
         tJzQvlpUsrSbdXuy6hmBRLoUHMiLDxOQ1Cm1I/TtrOYyJcvx9yDQbs3z7m3MMRRNROUA
         8r31dT6jSIao7M4ubBWZHim3VSQcM4VyexB2XQdn8zHtBXfwxWlu8x3H0zU/HZoRcqMo
         dvFV8a4SsFsvnkuBfpOtmpZl7SwrVUim61ZW8PLQilBF2iPyME8hoCOCnLYIGFtQZ6uc
         RRZQ==
X-Gm-Message-State: ACrzQf0j1VVVhka1qbAGUAEU3gUNP1zNVvR7sljaoff6fgbuXVbd0iVQ
        U3jCiUHc5he7EF4RYnXjOSy1Q0MLqy9MZsDP
X-Google-Smtp-Source: AMsMyM5OznlW71Wh2uVbuhX3QbKu7s447vTLifwqhN25O96FWDC//RTi9aKWj742ZrNNiosUpskkIA==
X-Received: by 2002:adf:dc41:0:b0:22e:3dac:b066 with SMTP id m1-20020adfdc41000000b0022e3dacb066mr4168953wrj.344.1665167422781;
        Fri, 07 Oct 2022 11:30:22 -0700 (PDT)
Received: from aczubak.c.googlers.com.com (230.213.79.34.bc.googleusercontent.com. [34.79.213.230])
        by smtp.gmail.com with ESMTPSA id l10-20020a05600012ca00b002258235bda3sm2573627wrx.61.2022.10.07.11.30.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Oct 2022 11:30:22 -0700 (PDT)
From:   Angela Czubak <acz@semihalf.com>
To:     linux-input@vger.kernel.org
Cc:     upstream@semihalf.com, benjamin.tissoires@redhat.com,
        jikos@kernel.org, dmitry.torokhov@gmail.com,
        Angela Czubak <acz@semihalf.com>
Subject: [PATCH v4 15/17] HID: add HID device reset callback
Date:   Fri,  7 Oct 2022 18:29:43 +0000
Message-Id: <20221007182945.1654046-16-acz@semihalf.com>
X-Mailer: git-send-email 2.38.0.rc1.362.ged0d419d3c-goog
In-Reply-To: <20221007182945.1654046-1-acz@semihalf.com>
References: <20221007182945.1654046-1-acz@semihalf.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

HID-over-I2C devices might reset on their own. Any device configuration
applied before the reset might be brought back to defaults so we need to
reconfigure to make sure the driver state is consistent.

Add a reset callback to the hid driver structure.
Issue it if the driver implements it and the device reset gets observed.

Signed-off-by: Angela Czubak <acz@semihalf.com>
---
 drivers/hid/i2c-hid/i2c-hid-core.c | 21 +++++++++++++++++++++
 include/linux/hid.h                |  2 ++
 2 files changed, 23 insertions(+)

diff --git a/drivers/hid/i2c-hid/i2c-hid-core.c b/drivers/hid/i2c-hid/i2c-hid-core.c
index 95cefae47adfe..f8a54eda2ff98 100644
--- a/drivers/hid/i2c-hid/i2c-hid-core.c
+++ b/drivers/hid/i2c-hid/i2c-hid-core.c
@@ -116,6 +116,7 @@ struct i2c_hid {
 	struct mutex		reset_lock;
 
 	struct i2chid_ops	*ops;
+	struct work_struct	reset_work;
 };
 
 static const struct i2c_hid_quirks {
@@ -504,6 +505,19 @@ static int i2c_hid_hwreset(struct i2c_hid *ihid)
 	return ret;
 }
 
+static void i2c_hid_reset_worker(struct work_struct *work)
+{
+	struct i2c_hid *ihid = container_of(work, struct i2c_hid, reset_work);
+	struct hid_device *hid = ihid->hid;
+
+	down(&hid->driver_input_lock);
+
+	if (hid->driver && hid->driver->reset)
+		hid->driver->reset(hid);
+
+	up(&hid->driver_input_lock);
+}
+
 static void i2c_hid_get_input(struct i2c_hid *ihid)
 {
 	u16 size = le16_to_cpu(ihid->hdesc.wMaxInputLength);
@@ -529,6 +543,8 @@ static void i2c_hid_get_input(struct i2c_hid *ihid)
 		/* host or device initiated RESET completed */
 		if (test_and_clear_bit(I2C_HID_RESET_PENDING, &ihid->flags))
 			wake_up(&ihid->wait);
+		else
+			schedule_work(&ihid->reset_work);
 		return;
 	}
 
@@ -821,6 +837,10 @@ static int i2c_hid_start(struct hid_device *hid)
 
 static void i2c_hid_stop(struct hid_device *hid)
 {
+	struct i2c_client *client = hid->driver_data;
+	struct i2c_hid *ihid = i2c_get_clientdata(client);
+
+	cancel_work_sync(&ihid->reset_work);
 	hid->claimed = 0;
 }
 
@@ -988,6 +1008,7 @@ int i2c_hid_core_probe(struct i2c_client *client, struct i2chid_ops *ops,
 	ihid->wHIDDescRegister = cpu_to_le16(hid_descriptor_address);
 
 	init_waitqueue_head(&ihid->wait);
+	INIT_WORK(&ihid->reset_work, i2c_hid_reset_worker);
 	mutex_init(&ihid->reset_lock);
 
 	/* we need to allocate the command buffer without knowing the maximum
diff --git a/include/linux/hid.h b/include/linux/hid.h
index 3f5899c628211..9db9b7133f1a1 100644
--- a/include/linux/hid.h
+++ b/include/linux/hid.h
@@ -784,6 +784,7 @@ struct hid_usage_id {
  * @suspend: invoked on suspend (NULL means nop)
  * @resume: invoked on resume if device was not reset (NULL means nop)
  * @reset_resume: invoked on resume if device was reset (NULL means nop)
+ * @reset: invoked if device was reset (NULL means nop)
  *
  * probe should return -errno on error, or 0 on success. During probe,
  * input will not be passed to raw_event unless hid_device_io_start is
@@ -840,6 +841,7 @@ struct hid_driver {
 	int (*resume)(struct hid_device *hdev);
 	int (*reset_resume)(struct hid_device *hdev);
 #endif
+	int (*reset)(struct hid_device *hdev);
 /* private: */
 	struct device_driver driver;
 };
-- 
2.38.0.rc1.362.ged0d419d3c-goog

