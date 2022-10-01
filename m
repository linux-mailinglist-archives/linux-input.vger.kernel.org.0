Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 867955F17A9
	for <lists+linux-input@lfdr.de>; Sat,  1 Oct 2022 02:52:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232528AbiJAAwb (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 30 Sep 2022 20:52:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230311AbiJAAwa (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 30 Sep 2022 20:52:30 -0400
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com [IPv6:2607:f8b0:4864:20::735])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74EE8157B9E
        for <linux-input@vger.kernel.org>; Fri, 30 Sep 2022 17:52:29 -0700 (PDT)
Received: by mail-qk1-x735.google.com with SMTP id o7so3824660qkj.10
        for <linux-input@vger.kernel.org>; Fri, 30 Sep 2022 17:52:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=YbYc9Wb8hOpiGkV8KRi+RzCLZEcBuGY8tuloAubI/yo=;
        b=laaWXpp3rMJ6tr8a9Gk7ORzcIWmhcJfeFhVS/n7Wq3VKzwVJV4SEMNNsNgGhMPgT77
         s3Y7AY70DhdnxNurnPG7A9oBsuDhtvMuhnDdGExT4EwrcrHxHWcwRRfn/UhPytf9eGea
         uCj+Dr5/3qYUsMgLo5gK8x+rGSqgF5NQmK84c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=YbYc9Wb8hOpiGkV8KRi+RzCLZEcBuGY8tuloAubI/yo=;
        b=n+gOzHxAHoVB1DiCpfUXmQKMed+A2gJiJDRbVhdjGs+FfehGQbAkRa4FSzyqW9Nc44
         kGIlr2cZDvIHa5wB/gjEJp3uZscJMVvojc+YsRUOTbN6nYnAkt4KM5yHpvU2exudKKQc
         EkN1MH+jvwNjtiLzP7+qrGa3uj4uA7e62sydheGP9RJzTraMTvO8JEp4alTHs2+44ikg
         XP7tNA4b7jKuBXu22NCUEHq/nrlrocjmXIMuzzKHl4dHeStKCH9PEtp3IqNfss5BQ+Tt
         H7jKgHGxgnPa2ZwyTIbNZ4QNn7H0qTjQQlxLY3376cYdw0vICJ1jnWD7Wu2owebMt6WC
         uAQw==
X-Gm-Message-State: ACrzQf30IPSyGhUF6B1YSd3I366XvQXW7PVI9xw0iUziekP2URmbYAUB
        IyIXot+3hoFKMfvfZohvOue/nA==
X-Google-Smtp-Source: AMsMyM5O5w2hZz9fNfq/AAOhgrUdclGfgEsIXdtv6p5xgtyrAQAwuPagdmmDKF1cnnI7e2olQHYxJQ==
X-Received: by 2002:a05:620a:24cf:b0:6ce:7d6a:9c85 with SMTP id m15-20020a05620a24cf00b006ce7d6a9c85mr8125458qkn.271.1664585549150;
        Fri, 30 Sep 2022 17:52:29 -0700 (PDT)
Received: from localhost.localdomain ([185.193.125.71])
        by smtp.gmail.com with ESMTPSA id r10-20020a05622a034a00b0035ce8965045sm3224817qtw.42.2022.09.30.17.52.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Sep 2022 17:52:28 -0700 (PDT)
From:   Matt Ranostay <matt.ranostay@konsulko.com>
To:     jic23@kernel.org, gupt21@gmail.com, benjamin.tissoires@redhat.com,
        jikos@kernel.org
Cc:     linux-iio@vger.kernel.org, linux-input@vger.kernel.org,
        Matt Ranostay <matt.ranostay@konsulko.com>
Subject: [PATCH v6 1/3] HID: mcp2221: switch i2c registration to devm functions
Date:   Fri, 30 Sep 2022 17:52:06 -0700
Message-Id: <20221001005208.8010-2-matt.ranostay@konsulko.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221001005208.8010-1-matt.ranostay@konsulko.com>
References: <20221001005208.8010-1-matt.ranostay@konsulko.com>
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

Switch from i2c_add_adapter() to resource managed devm_i2c_add_adapter()
for matching rest of driver initialization, and more concise code.

Signed-off-by: Matt Ranostay <matt.ranostay@konsulko.com>
---
 drivers/hid/hid-mcp2221.c | 50 +++++++++++++++++++--------------------
 1 file changed, 25 insertions(+), 25 deletions(-)

diff --git a/drivers/hid/hid-mcp2221.c b/drivers/hid/hid-mcp2221.c
index de52e9f7bb8c..4d10a24e3e13 100644
--- a/drivers/hid/hid-mcp2221.c
+++ b/drivers/hid/hid-mcp2221.c
@@ -824,6 +824,20 @@ static int mcp2221_raw_event(struct hid_device *hdev,
 	return 1;
 }
 
+/* Device resource managed function for HID unregistration */
+static void mcp2221_hid_unregister(void *ptr)
+{
+	struct hid_device *hdev = ptr;
+
+	hid_hw_close(hdev);
+	hid_hw_stop(hdev);
+}
+
+/* This is needed to be sure hid_hw_stop() isn't called twice by the subsystem */
+static void mcp2221_remove(struct hid_device *hdev)
+{
+}
+
 static int mcp2221_probe(struct hid_device *hdev,
 					const struct hid_device_id *id)
 {
@@ -849,7 +863,8 @@ static int mcp2221_probe(struct hid_device *hdev,
 	ret = hid_hw_open(hdev);
 	if (ret) {
 		hid_err(hdev, "can't open device\n");
-		goto err_hstop;
+		hid_hw_stop(hdev);
+		return ret;
 	}
 
 	mutex_init(&mcp->lock);
@@ -857,6 +872,10 @@ static int mcp2221_probe(struct hid_device *hdev,
 	hid_set_drvdata(hdev, mcp);
 	mcp->hdev = hdev;
 
+	ret = devm_add_action_or_reset(&hdev->dev, mcp2221_hid_unregister, hdev);
+	if (ret)
+		return ret;
+
 	/* Set I2C bus clock diviser */
 	if (i2c_clk_freq > 400)
 		i2c_clk_freq = 400;
@@ -873,19 +892,17 @@ static int mcp2221_probe(struct hid_device *hdev,
 			"MCP2221 usb-i2c bridge on hidraw%d",
 			((struct hidraw *)hdev->hidraw)->minor);
 
-	ret = i2c_add_adapter(&mcp->adapter);
+	ret = devm_i2c_add_adapter(&hdev->dev, &mcp->adapter);
 	if (ret) {
 		hid_err(hdev, "can't add usb-i2c adapter: %d\n", ret);
-		goto err_i2c;
+		return ret;
 	}
 	i2c_set_adapdata(&mcp->adapter, mcp);
 
 	/* Setup GPIO chip */
 	mcp->gc = devm_kzalloc(&hdev->dev, sizeof(*mcp->gc), GFP_KERNEL);
-	if (!mcp->gc) {
-		ret = -ENOMEM;
-		goto err_gc;
-	}
+	if (!mcp->gc)
+		return -ENOMEM;
 
 	mcp->gc->label = "mcp2221_gpio";
 	mcp->gc->direction_input = mcp_gpio_direction_input;
@@ -900,26 +917,9 @@ static int mcp2221_probe(struct hid_device *hdev,
 
 	ret = devm_gpiochip_add_data(&hdev->dev, mcp->gc, mcp);
 	if (ret)
-		goto err_gc;
+		return ret;
 
 	return 0;
-
-err_gc:
-	i2c_del_adapter(&mcp->adapter);
-err_i2c:
-	hid_hw_close(mcp->hdev);
-err_hstop:
-	hid_hw_stop(mcp->hdev);
-	return ret;
-}
-
-static void mcp2221_remove(struct hid_device *hdev)
-{
-	struct mcp2221 *mcp = hid_get_drvdata(hdev);
-
-	i2c_del_adapter(&mcp->adapter);
-	hid_hw_close(mcp->hdev);
-	hid_hw_stop(mcp->hdev);
 }
 
 static const struct hid_device_id mcp2221_devices[] = {
-- 
2.37.2

