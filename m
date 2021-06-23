Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD1EB3B1B81
	for <lists+linux-input@lfdr.de>; Wed, 23 Jun 2021 15:46:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230312AbhFWNtB (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 23 Jun 2021 09:49:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230206AbhFWNtB (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 23 Jun 2021 09:49:01 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEEB7C061574
        for <linux-input@vger.kernel.org>; Wed, 23 Jun 2021 06:46:43 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id nb6so4104144ejc.10
        for <linux-input@vger.kernel.org>; Wed, 23 Jun 2021 06:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=KN5dhlPjwFWLPcwVK7gO4jILUWWjL5cHiiOIwWbomwc=;
        b=rvxf54IhcT73xGm4yzf22rjo5xRZnXZmM7zRlBuMx/rgrj4JuTRsXh14Vov/WmuMEm
         m4wf1o/1CcUSrJOk4hNaynHn5n0DQDFJ8Cou2p0ZjtQ90msRJyZES22wXUX27w3ri7To
         xwOM4p8wAh6Yf4oEmQ5PNJoDosfDUyBfR5kJVOM21zAJLmMFXSTk7kRziHgI2WCHtW4N
         yEucHA//r2BIo/nuIVZ3wnvbDFn21JeUGyVutVbn2cGpwBIFPH4RdPTCykhd0JSFXvhS
         p6D/jgqcnjSl7sLdFyiqIgzRiFOkOqn5yMQnwVyexqcMyFusn636MNmdjOK6GBfWbaS0
         RY6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=KN5dhlPjwFWLPcwVK7gO4jILUWWjL5cHiiOIwWbomwc=;
        b=FE3O7MU1iG+xBCfmIP1NxgwoDCOPng3Kb3uY79/BoX2uuVMUNCqGKDu8dYi33MNBuC
         n1L7hAnYvlWchTE0k7RppSrn80kByCs+5IvfRrJJzp+TXYNEEzQ3CONxhKAJBU33iGev
         q4Trh1Pj6PfyjkZz2MyNFBtKd9luh9A61MELfX80S7XtbsmnrEhnIjV7MAcMMG4ziC2E
         tACnk+aMWOSSVQK9fqjKdsSkE7V+wzl1+kNmWAFU6zxQqBq4uBb+k8xX3spVkB2/E0ii
         mcJN5P17UgcPfyP6l6JrbliZ9Gcnvnr3RUp0DkoMPbiN/syxJ+DphG/B0S6PCnb2EVHQ
         C9yQ==
X-Gm-Message-State: AOAM5327mv1YtaKMBSUUo60MlMgS8/aqWrDKGtO0aq8ytR5xMge+lPoj
        yQ9EtapRvpD1FHXGkWGtxC+SbH8obwCVKQ==
X-Google-Smtp-Source: ABdhPJwWk1Gf8ojBLwUc7erNtfcVw3264i/88bwIHGDi43iUXv9O/4krVt2HRo1eA8ZFYPn4xypkug==
X-Received: by 2002:a5d:6882:: with SMTP id h2mr67935wru.243.1624455991856;
        Wed, 23 Jun 2021 06:46:31 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:82c:5f0:78f0:ea41:c81:639b])
        by smtp.gmail.com with ESMTPSA id l4sm89546wru.41.2021.06.23.06.46.31
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 23 Jun 2021 06:46:31 -0700 (PDT)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     nick@shmanahar.org, dmitry.torokhov@gmail.com
Cc:     linux-input@vger.kernel.org, Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH 1/2] Input: atmel_mxt_ts: Add wake-up support
Date:   Wed, 23 Jun 2021 15:56:36 +0200
Message-Id: <1624456597-9486-1-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add capability for the touchscreen to wakeup the host on touch event.

Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
---
 drivers/input/touchscreen/atmel_mxt_ts.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
index 05de92c..807f449 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -3223,6 +3223,8 @@ static int mxt_probe(struct i2c_client *client, const struct i2c_device_id *id)
 		return error;
 	}
 
+	device_set_wakeup_capable(&client->dev, true);
+
 	error = regulator_bulk_enable(ARRAY_SIZE(data->regulators),
 				      data->regulators);
 	if (error) {
@@ -3309,8 +3311,12 @@ static int __maybe_unused mxt_suspend(struct device *dev)
 
 	mutex_lock(&input_dev->mutex);
 
-	if (input_device_enabled(input_dev))
-		mxt_stop(data);
+	if (input_device_enabled(input_dev)) {
+		if (device_may_wakeup(dev))
+			enable_irq_wake(data->irq);
+		else
+			mxt_stop(data);
+	}
 
 	mutex_unlock(&input_dev->mutex);
 
@@ -3332,8 +3338,12 @@ static int __maybe_unused mxt_resume(struct device *dev)
 
 	mutex_lock(&input_dev->mutex);
 
-	if (input_device_enabled(input_dev))
-		mxt_start(data);
+	if (input_device_enabled(input_dev)) {
+		if (device_may_wakeup(dev))
+			disable_irq_wake(data->irq);
+		else
+			mxt_start(data);
+	}
 
 	mutex_unlock(&input_dev->mutex);
 
-- 
2.7.4

