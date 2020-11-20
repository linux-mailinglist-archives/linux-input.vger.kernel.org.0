Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 153CF2BA397
	for <lists+linux-input@lfdr.de>; Fri, 20 Nov 2020 08:41:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727185AbgKTHj1 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 20 Nov 2020 02:39:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726775AbgKTHjZ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 20 Nov 2020 02:39:25 -0500
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B0ADC0613CF;
        Thu, 19 Nov 2020 23:39:25 -0800 (PST)
Received: by mail-pl1-x644.google.com with SMTP id 5so4433516plj.8;
        Thu, 19 Nov 2020 23:39:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IKjGMif0oqpMFb7yovlcEvvXjuLqyVVWHwDGnP+/Lts=;
        b=OhmT//MzGxe5lSTVcFZmGDB0u+jnT5kM36inp7A0NwIa00FYl2w0sDOArsVbh1FkZz
         8T9HPPWsydeUadO4dRGQnBrHk6U2CVBvzLgiL+vG1Ot9i5RUKQz1sjMDsZ8u5xxf15JI
         YFjIQH/6keopHyKUhgue4zpNEWfSkcWjuw/R3HQSDV55mjHqnReoMT+2qzkv4xBwtwh8
         UAHzUKEIPG+Y3vCnt0BIvBYPNspr0NwHEmrBfZW6bqFI0SnpadQP69EjViStnw+s6gdl
         PKT7ohIx/+UALrHYAFPVeKKlu+3ddBwhEGoDHuHJAaC8SiyhB9oPqvpK7zj908tE0dwP
         jAsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IKjGMif0oqpMFb7yovlcEvvXjuLqyVVWHwDGnP+/Lts=;
        b=YQiz9Q18LBNdvK5fNmlgzhNati/WYK1JuvlfCidmfTenWpz9XlOP8yLpupa1PDscTg
         PIiqkj6QlHWt6CuAXQIvUOeMk23PQ38QJ+e0aE4Iu1H7ArSbyN+tXTgKiSfA+5ea2Zop
         KDpUiIiRdVKgKNYbfsoLD6TgZAkSnA4N4RfPvyeYix1OT1M2PHsWUFIecU4QcPwL1ikm
         M/Cf3Gaew30oP4Bk05hDe7xbRixqo/QSwHt3RqBdiKQIcGeG2Wgx4m7A1DHLsM8KkfgM
         9P5saDlP3br9eNQm87JQsSAW57ZTlNguuE1kPykG5/frDSvspjiMYBd0wHACbY4v9Ct4
         yzWg==
X-Gm-Message-State: AOAM531gG7Uc6hOHh33XVujuDs3NNAubYxeAm9gQF2pGiD8QxhGagDuP
        84IO8sRPlj7jdEjaSylzYroYydMErc4=
X-Google-Smtp-Source: ABdhPJwUhDWXrYBCU/oe1R7p1bjd6SsnlZWMRVW2oDeStZIgkQ72+3/iDPYgGEPSWyjJNAhBNDicrg==
X-Received: by 2002:a17:902:6909:b029:d6:6ec4:e1f7 with SMTP id j9-20020a1709026909b02900d66ec4e1f7mr12866597plk.40.1605857964877;
        Thu, 19 Nov 2020 23:39:24 -0800 (PST)
Received: from dtor-ws.mtv.corp.google.com ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id b3sm2324002pfd.66.2020.11.19.23.39.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2020 23:39:24 -0800 (PST)
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     Alexandru Ardelean <alexandru.ardelean@analog.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] Input: adp5589-keys - do not explicitly control IRQ for wakeup
Date:   Thu, 19 Nov 2020 23:39:20 -0800
Message-Id: <20201120073920.3214492-2-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.29.2.454.gaff20da3a2-goog
In-Reply-To: <20201120073920.3214492-1-dmitry.torokhov@gmail.com>
References: <20201120073920.3214492-1-dmitry.torokhov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

If device is set up as a wakeup source, I2C core configures the interrupt
line as wake IRQ and PM core automatically configures it for waking up the
system on system suspend transition, so we do not have to explicitly call
enable_irq_wake() and disable_irq_wake() in suspend/resume.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/keyboard/adp5589-keys.c | 27 +++++++++------------------
 1 file changed, 9 insertions(+), 18 deletions(-)

diff --git a/drivers/input/keyboard/adp5589-keys.c b/drivers/input/keyboard/adp5589-keys.c
index d76b0e4e67c4..654e0476406b 100644
--- a/drivers/input/keyboard/adp5589-keys.c
+++ b/drivers/input/keyboard/adp5589-keys.c
@@ -14,6 +14,7 @@
 #include <linux/workqueue.h>
 #include <linux/errno.h>
 #include <linux/pm.h>
+#include <linux/pm_wakeirq.h>
 #include <linux/platform_device.h>
 #include <linux/input.h>
 #include <linux/i2c.h>
@@ -1017,32 +1018,22 @@ static int adp5589_probe(struct i2c_client *client,
 
 static int __maybe_unused adp5589_suspend(struct device *dev)
 {
-	struct adp5589_kpad *kpad = dev_get_drvdata(dev);
-	struct i2c_client *client = kpad->client;
-
-	if (!kpad->input)
-		return 0;
-
-	disable_irq(client->irq);
+	struct i2c_client *client = to_i2c_client(dev);
+	struct adp5589_kpad *kpad = i2c_get_clientdata(client);
 
-	if (device_may_wakeup(&client->dev))
-		enable_irq_wake(client->irq);
+	if (kpad->input)
+		disable_irq(client->irq);
 
 	return 0;
 }
 
 static int __maybe_unused adp5589_resume(struct device *dev)
 {
-	struct adp5589_kpad *kpad = dev_get_drvdata(dev);
-	struct i2c_client *client = kpad->client;
-
-	if (!kpad->input)
-		return 0;
-
-	if (device_may_wakeup(&client->dev))
-		disable_irq_wake(client->irq);
+	struct i2c_client *client = to_i2c_client(dev);
+	struct adp5589_kpad *kpad = i2c_get_clientdata(client);
 
-	enable_irq(client->irq);
+	if (kpad->input)
+		enable_irq(client->irq);
 
 	return 0;
 }
-- 
2.29.2.454.gaff20da3a2-goog

