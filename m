Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5A0FD525F31
	for <lists+linux-input@lfdr.de>; Fri, 13 May 2022 12:08:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1379101AbiEMJkB (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 13 May 2022 05:40:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1379123AbiEMJjz (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 13 May 2022 05:39:55 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48982291CF2
        for <linux-input@vger.kernel.org>; Fri, 13 May 2022 02:39:54 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id a5so6848543wrp.7
        for <linux-input@vger.kernel.org>; Fri, 13 May 2022 02:39:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=flKb5XvgSjC4TVDtKYTkzDo0feCAfP5GPsMQQeLy88U=;
        b=RlMOJzNkCNkpZnaJgPcdeG2gPHko+hufgMruirJ7LVWxJrLQLv7cIRnTDW9rgmxgt5
         WIsbeKRKpwXoc3KUyD8hcbGtNptaDgS3ay/igXCyd5lkg637qkr6r2RpPL3sRFYgfS39
         gjjgWx4HQKimwyLvK7QXGIv118RqFBuEPK4TMwwA1f8YptJF4tT9eye12T6z3boa5WHR
         W0Hy6fg6Pm39aNlcT2foAhO1hy2hFYlgykkB9OY3v5rpkORMvt8YxB0rCN2hlmONPGQh
         fRTgGQ9LT1s0O+I0toAzh7eOYGkK/xIgDxOec0Jnw0p8rzgYLJx5sDlKv1gnHGlQhose
         va8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=flKb5XvgSjC4TVDtKYTkzDo0feCAfP5GPsMQQeLy88U=;
        b=oBatjoKnePHdit2wpRkeKP8LrWxu9gGlzpjXQgFeyHGJ6AbFPqadowuGQtBv+YKOoQ
         jchjwt8oNme8LD+xVk/ADhXTSiuBOvXcVDTa7Xq71h46RtDMcbrMciKO8pjINolF/5Fj
         6rmDRmOLgh1jaldJd99T0SA3ks9e6unpgJKecKpsC8WCYgI7GAdI4nGnL4U1hHtOVF+A
         indFvry7cV/wfpLgkhuqL0W+bREJP1Yc8ROxh3Y+NyVwj3xnQVSv4lAUN9W9v2L/Pb43
         43IaXvHkrPBal6GERjECVQUmes9EfiC0oKowcnXyrGny3H4wygNk8YSxbznP3EdZVvn6
         VBNA==
X-Gm-Message-State: AOAM531pXn0/69J8UoAtE55uwJ9KelHeRC+4cskoWCqoxz9dkF8UTw1R
        ii1nvvetVQ80F3XMV3IAoE67mOI+ULjK/BITm7o=
X-Google-Smtp-Source: ABdhPJwvp/O4HH0Cfa9E0w5mhfjw6pgWsHqsn3MlMhRWDvcwydSz2elgcVGE2STTjoTY7kG1teTKkw==
X-Received: by 2002:a05:6000:1283:b0:20a:e149:a9ab with SMTP id f3-20020a056000128300b0020ae149a9abmr3102175wrx.330.1652434792921;
        Fri, 13 May 2022 02:39:52 -0700 (PDT)
Received: from aczubak.c.googlers.com.com (88.140.78.34.bc.googleusercontent.com. [34.78.140.88])
        by smtp.gmail.com with ESMTPSA id l5-20020adfa385000000b0020ce015ed48sm1631404wrb.103.2022.05.13.02.39.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 May 2022 02:39:52 -0700 (PDT)
From:   Angela Czubak <acz@semihalf.com>
To:     linux-input@vger.kernel.org
Cc:     upstream@semihalf.com, benjamin.tissoires@redhat.com,
        jikos@kernel.org, dmitry.torokhov@gmail.com,
        Angela Czubak <acz@semihalf.com>
Subject: [PATCH v3 15/17] HID: add HID device reset callback
Date:   Fri, 13 May 2022 09:39:25 +0000
Message-Id: <20220513093927.1632262-16-acz@semihalf.com>
X-Mailer: git-send-email 2.36.0.550.gb090851708-goog
In-Reply-To: <20220513093927.1632262-1-acz@semihalf.com>
References: <20220513093927.1632262-1-acz@semihalf.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
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
index c078f09a2318..37f134a3d9cb 100644
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
index 3f5899c62821..9db9b7133f1a 100644
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
2.36.0.550.gb090851708-goog

