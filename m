Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 35DF35A716C
	for <lists+linux-input@lfdr.de>; Wed, 31 Aug 2022 01:16:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231487AbiH3XQQ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 30 Aug 2022 19:16:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231401AbiH3XQO (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 30 Aug 2022 19:16:14 -0400
Received: from mail-il1-x131.google.com (mail-il1-x131.google.com [IPv6:2607:f8b0:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5D2E57228
        for <linux-input@vger.kernel.org>; Tue, 30 Aug 2022 16:16:12 -0700 (PDT)
Received: by mail-il1-x131.google.com with SMTP id e7so5354119ilc.5
        for <linux-input@vger.kernel.org>; Tue, 30 Aug 2022 16:16:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=E5Gu43PGVE7VaKsHNMloj9b2iupdeWYkctb9tALGTWA=;
        b=calzQ4UJJQNihFU8xJrPTf7HQOsAtNJvL7Jdv2bN4AZQ0Eq8qPzQeFq10UppBuSOgi
         MUzY50aXsaEIyTwZU9C7C+ZTp308XJV8y7wcAy5q/lQQKqATC2DECYQ8yszRXczw07Rn
         m7rYPvOXti6+GFoLl2jol+9N+r4nMw50T0uHU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=E5Gu43PGVE7VaKsHNMloj9b2iupdeWYkctb9tALGTWA=;
        b=n75AuUKiYQrhd3pqq8oikBT4WinLA83zbDH1Bft2sPf/p2r+Lx+wSREQojzVeGMoBL
         QP8jDfzZYBcc5PTAKsRJH8+nceibH9BLuMOIosFyvDvnGtwyljv/aEh+iw5wVAbRP6JK
         iCBz/ZV5XxGU9UpIU41B4Xk6Jr7V5qCFVQvl0sPlHA8cbfo1ZiqSYpDvmoW6hd8n/Oil
         yc5Ccn6aC+8yv2NTVxj7rgc/axsQ/lCDg4h0SoMWlukAtXeKbk1NVMkCPVjSMfqLwWGg
         fCdlHnAP5BUrooTyYQOYmsYu7Qcborz7Eo64QqdYeM+YSRgpYo8tN39MNUR8DFwJSRaU
         jysQ==
X-Gm-Message-State: ACgBeo3bSLGhO3A8sdfJslQX3n6etvaJcw6ty/5/ahinHJTZF0z4Ex+C
        NBz51bw/BO+62QfivPduHQuMBdSAQNyI2w==
X-Google-Smtp-Source: AA6agR7UWrQrF7nrb54KyCGExTs/aPKg2m+FvODWT33fVdouif8eYW5zosvaGTTPJAIvXq36GoKgDg==
X-Received: by 2002:a92:cd8f:0:b0:2df:ff82:2e5f with SMTP id r15-20020a92cd8f000000b002dfff822e5fmr13230289ilb.72.1661901372164;
        Tue, 30 Aug 2022 16:16:12 -0700 (PDT)
Received: from rrangel920.bld.corp.google.com (h24-56-189-219.arvdco.broadband.dynamic.tds.net. [24.56.189.219])
        by smtp.gmail.com with ESMTPSA id z30-20020a056602081e00b0068b1858c81asm6165821iow.13.2022.08.30.16.16.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Aug 2022 16:16:11 -0700 (PDT)
From:   Raul E Rangel <rrangel@chromium.org>
To:     linux-acpi@vger.kernel.org, linux-input@vger.kernel.org
Cc:     hdegoede@redhat.com, mario.limonciello@amd.com, timvp@google.com,
        rafael@kernel.org, Raul E Rangel <rrangel@chromium.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        "jingle.wu" <jingle.wu@emc.com.tw>, linux-kernel@vger.kernel.org
Subject: [PATCH 1/8] Input: elan_i2c - Use PM subsystem to manage wake irq
Date:   Tue, 30 Aug 2022 17:15:34 -0600
Message-Id: <20220830171332.1.Id022caf53d01112188308520915798f08a33cd3e@changeid>
X-Mailer: git-send-email 2.37.2.672.g94769d06f0-goog
In-Reply-To: <20220830231541.1135813-1-rrangel@chromium.org>
References: <20220830231541.1135813-1-rrangel@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The Elan I2C touchpad driver is currently manually managing the wake
IRQ. This change removes the explicit enable_irq_wake/disable_irq_wake
and instead relies on the PM subsystem. This is done by calling
dev_pm_set_wake_irq.

i2c_device_probe already calls dev_pm_set_wake_irq when using device
tree, so it's only required when using ACPI. The net result is that this
change should be a no-op. i2c_device_remove also already calls
dev_pm_clear_wake_irq, so we don't need to do that in this driver.

I tested this on an ACPI system where the touchpad doesn't have _PRW
defined. I verified I can still wake the system and that the wake source
was the touchpad IRQ GPIO.

Signed-off-by: Raul E Rangel <rrangel@chromium.org>
---

 drivers/input/mouse/elan_i2c_core.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/input/mouse/elan_i2c_core.c b/drivers/input/mouse/elan_i2c_core.c
index e1758d5ffe4218..7d997d2b56436b 100644
--- a/drivers/input/mouse/elan_i2c_core.c
+++ b/drivers/input/mouse/elan_i2c_core.c
@@ -33,6 +33,7 @@
 #include <linux/jiffies.h>
 #include <linux/completion.h>
 #include <linux/of.h>
+#include <linux/pm_wakeirq.h>
 #include <linux/property.h>
 #include <linux/regulator/consumer.h>
 #include <asm/unaligned.h>
@@ -86,8 +87,6 @@ struct elan_tp_data {
 	u16			fw_page_size;
 	u32			fw_signature_address;
 
-	bool			irq_wake;
-
 	u8			min_baseline;
 	u8			max_baseline;
 	bool			baseline_ready;
@@ -1337,8 +1336,10 @@ static int elan_probe(struct i2c_client *client,
 	 * Systems using device tree should set up wakeup via DTS,
 	 * the rest will configure device as wakeup source by default.
 	 */
-	if (!dev->of_node)
+	if (!dev->of_node) {
 		device_init_wakeup(dev, true);
+		dev_pm_set_wake_irq(dev, client->irq);
+	}
 
 	return 0;
 }
@@ -1362,8 +1363,6 @@ static int __maybe_unused elan_suspend(struct device *dev)
 
 	if (device_may_wakeup(dev)) {
 		ret = elan_sleep(data);
-		/* Enable wake from IRQ */
-		data->irq_wake = (enable_irq_wake(client->irq) == 0);
 	} else {
 		ret = elan_set_power(data, false);
 		if (ret)
@@ -1394,9 +1393,6 @@ static int __maybe_unused elan_resume(struct device *dev)
 			dev_err(dev, "error %d enabling regulator\n", error);
 			goto err;
 		}
-	} else if (data->irq_wake) {
-		disable_irq_wake(client->irq);
-		data->irq_wake = false;
 	}
 
 	error = elan_set_power(data, true);
-- 
2.37.2.672.g94769d06f0-goog

