Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 628A423BF5F
	for <lists+linux-input@lfdr.de>; Tue,  4 Aug 2020 20:30:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726230AbgHDSaU (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 4 Aug 2020 14:30:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726101AbgHDSaT (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 4 Aug 2020 14:30:19 -0400
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com [IPv6:2607:f8b0:4864:20::d42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A1B5C06174A;
        Tue,  4 Aug 2020 11:30:19 -0700 (PDT)
Received: by mail-io1-xd42.google.com with SMTP id q75so35108557iod.1;
        Tue, 04 Aug 2020 11:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zjB/bse/AIG3ec5CH7lkmfaqywcsn17p5QYWsN0kQJw=;
        b=dCRcZcl935xER4Rf59nQmFnexVv4UViEqV9aZJ2xyWAs38weoDxfzlosh8SsGr6mdj
         C9sCDBRY8EonQdh2gB6H1Qj1P3z4Gzlgc9FqJ+eDebeKm2rVWZ3hXYgTdhuoIqJR6g2h
         bfFEvVxD/8SfvyLR2rIPctE+rtmHIuPZT5yJn8xCNA12o9lIdt38gJa8L/OQdNaE4GB+
         v+NtRGPuTApH/UazFOWT5Dzywn4pGjihzeJv/7jclqR4hpQ3fOTBHIvgt5riFIHZIFB4
         UCPJsRDcFeymaJKBwDTrFmKmMPsg7U5lGqRAawt6R2zTNNgvgTbJ+mtRMb5dCwON/yKf
         2Pqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zjB/bse/AIG3ec5CH7lkmfaqywcsn17p5QYWsN0kQJw=;
        b=iMAQxeJc1JgxqQ488UkURkovBb+OqH6Q648VUzbEasa6N3l6Vsj+Uqgj51PLi8TCzD
         ypWVP7egJPyRyOZaia6OiZQP+qIcFivLbZVmCYMj6JJuO8tMTv8EU5nIEOMFemhMq4SN
         uLNkZ7QimTj2j4dvYJ7V4ygElgE45suOwhHlFJ2wf4oGfwFvqpwIQbNDE+hA8CvslK9Y
         0g1Y41X1QZuuQ3GbFcHIqK/+rxgzwGqMFQWNQBp3oRudBTe1G8JpBleMA61Jsl0n83k8
         kvra7B/yXZI03Ez3wdK0edLUAsgiMWxrqFJVbrl/T4G7Gsa5gV9wLtxLKebtIV/IfAYb
         LCeQ==
X-Gm-Message-State: AOAM532LgNZXo+1Q5Q9dc7AjAsIdPtWXlaW1OFD4Bp17yymEpaMPsXDc
        LBRoSs6KSq3Tbv/2BzlDhz2OMrnz/d8=
X-Google-Smtp-Source: ABdhPJxE48uCTrCDf4/g2gDlwTt02WrWwBMyxZk4Wkht9gX32sBeqmTHI3Q1i0yO2RLnxyv6ErMfCA==
X-Received: by 2002:a6b:15c2:: with SMTP id 185mr6327964iov.207.1596565818447;
        Tue, 04 Aug 2020 11:30:18 -0700 (PDT)
Received: from aford-IdeaCentre-A730.lan (c-73-37-219-234.hsd1.mn.comcast.net. [73.37.219.234])
        by smtp.gmail.com with ESMTPSA id q70sm13399267ili.49.2020.08.04.11.30.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2020 11:30:17 -0700 (PDT)
From:   Adam Ford <aford173@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     dmitry.torokhov@gmail.com, linux-kernel@vger.kernel.org,
        Adam Ford <aford173@gmail.com>
Subject: [PATCH] Input: ili210x: Fix potential memory leaks
Date:   Tue,  4 Aug 2020 13:30:07 -0500
Message-Id: <20200804183007.117125-1-aford173@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This driver requests, memory twice and requests a threaded irq, but
it doesn't free any of them if something fails.

This patch attempts to identify areas where a return was issued
without freeing allocated memory or IRQ's.

Signed-off-by: Adam Ford <aford173@gmail.com>

diff --git a/drivers/input/touchscreen/ili210x.c b/drivers/input/touchscreen/ili210x.c
index 199cf3daec10..967329fbdde3 100644
--- a/drivers/input/touchscreen/ili210x.c
+++ b/drivers/input/touchscreen/ili210x.c
@@ -421,7 +421,7 @@ static int ili210x_i2c_probe(struct i2c_client *client,
 
 	input = devm_input_allocate_device(dev);
 	if (!input)
-		return -ENOMEM;
+		goto free_priv;
 
 	priv->client = client;
 	priv->input = input;
@@ -443,7 +443,7 @@ static int ili210x_i2c_probe(struct i2c_client *client,
 				    INPUT_MT_DIRECT);
 	if (error) {
 		dev_err(dev, "Unable to set up slots, err: %d\n", error);
-		return error;
+		goto free_input;
 	}
 
 	error = devm_request_threaded_irq(dev, client->irq, NULL, ili210x_irq,
@@ -451,27 +451,36 @@ static int ili210x_i2c_probe(struct i2c_client *client,
 	if (error) {
 		dev_err(dev, "Unable to request touchscreen IRQ, err: %d\n",
 			error);
-		return error;
+		goto free_input;
 	}
 
 	error = devm_add_action_or_reset(dev, ili210x_stop, priv);
 	if (error)
-		return error;
+		goto free_irq;
 
 	error = devm_device_add_group(dev, &ili210x_attr_group);
 	if (error) {
 		dev_err(dev, "Unable to create sysfs attributes, err: %d\n",
 			error);
-		return error;
+		goto free_irq;
 	}
 
 	error = input_register_device(priv->input);
 	if (error) {
 		dev_err(dev, "Cannot register input device, err: %d\n", error);
-		return error;
+		goto free_irq;
 	}
 
 	return 0;
+
+free_irq:
+	free_irq(client->irq, client);
+free_input:
+	input_free_device(input);
+free_priv:
+	kfree(priv);
+
+	return error;
 }
 
 static const struct i2c_device_id ili210x_i2c_id[] = {
-- 
2.25.1

