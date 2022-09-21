Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9E9CA5C031F
	for <lists+linux-input@lfdr.de>; Wed, 21 Sep 2022 18:00:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232064AbiIUQAl (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 21 Sep 2022 12:00:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232657AbiIUQAN (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 21 Sep 2022 12:00:13 -0400
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com [IPv6:2607:f8b0:4864:20::d30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7ABBB7173A
        for <linux-input@vger.kernel.org>; Wed, 21 Sep 2022 08:53:45 -0700 (PDT)
Received: by mail-io1-xd30.google.com with SMTP id b23so5397565iof.2
        for <linux-input@vger.kernel.org>; Wed, 21 Sep 2022 08:53:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=6u3eurb1Xgmesw5AwuVmsCmrALfE27B+XzNhz8oQb68=;
        b=GjNRcw26DfNp1l72ePzR8ypLaHtbjo9vTe+iNGgtnIGQ9xGOBVzZn5KboLP69H5myp
         y+dUWNcagsdvpiW4vKFj7s6IF0d19PAHzXGNM/sLcB18OZboAUtwHCt3UudddS4mef9O
         zXnDIjDUNMgv+xukGWZvkXhvcqKZDAVLsQl2c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=6u3eurb1Xgmesw5AwuVmsCmrALfE27B+XzNhz8oQb68=;
        b=4hjQ/QVjY21l+9yvZLXjMC2IA4L6TWGo3wS6Oh/ZYcKSQPkXOY0ck+Tww9KEOCC0qt
         sGz8Je4NybtAsxJED+hOG/5RrXZqvCyAO//vYmIah3IZdd6rSbxCWQfuaErJEBG9iJN/
         5M9zr5Oc176g/fTVPx1YEqBPStiLSqKyDHMGRKC7LBP8paVqQBpHggv3yCvKK4JgEMr5
         lJNxi5JWOnFEnP9lhAcMFb+247UhMPPguGwUad+3v7o13xyg4iLHD5tmx/nm2h1Vi/+d
         QMZAyX4njKLu8zX3frgn58jvBSem2hyX3kujGK9fEHrLOt3wSA1ev+uutpZG9Ps5Qmgy
         w3uQ==
X-Gm-Message-State: ACrzQf0oiLoqFv1o0M5cPE9hPmzX8HxpzBvtjaGeetcZaUtFpOhG9FHp
        pLZpIIMEKjqKAUe+Dy8aEF8BAg==
X-Google-Smtp-Source: AMsMyM5FurtQcQ3Zhi3svvOfSucFfvzPX0N07mOcLz3OH6cod0plPgWlxJ+tS5OwcMy5uXtmsLl+iA==
X-Received: by 2002:a05:6638:c48:b0:35a:3f5f:d382 with SMTP id g8-20020a0566380c4800b0035a3f5fd382mr13561628jal.6.1663775530256;
        Wed, 21 Sep 2022 08:52:10 -0700 (PDT)
Received: from rrangel920.bld.corp.google.com (h24-56-189-219.arvdco.broadband.dynamic.tds.net. [24.56.189.219])
        by smtp.gmail.com with ESMTPSA id c14-20020a023b0e000000b0035a8d644a31sm1148061jaa.117.2022.09.21.08.52.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Sep 2022 08:52:09 -0700 (PDT)
From:   Raul E Rangel <rrangel@chromium.org>
To:     linux-acpi@vger.kernel.org, linux-input@vger.kernel.org
Cc:     rafael@kernel.org, timvp@google.com,
        mika.westerberg@linux.intel.com, andriy.shevchenko@linux.intel.com,
        dmitry.torokhov@gmail.com, jingle.wu@emc.com.tw,
        hdegoede@redhat.com, mario.limonciello@amd.com,
        linus.walleij@linaro.org, Raul E Rangel <rrangel@chromium.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Angela Czubak <acz@semihalf.com>,
        Jiri Kosina <jikos@kernel.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Rob Herring <robh@kernel.org>,
        Yang Li <yang.lee@linux.alibaba.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v5 01/13] HID: i2c-hid: Use PM subsystem to manage wake irq
Date:   Wed, 21 Sep 2022 09:51:53 -0600
Message-Id: <20220921094736.v5.1.Id4b4bdfe06e2caf2d5a3c9dd4a9b1080c38b539c@changeid>
X-Mailer: git-send-email 2.37.3.968.ga6b4b080e4-goog
In-Reply-To: <20220921155205.1332614-1-rrangel@chromium.org>
References: <20220921155205.1332614-1-rrangel@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The I2C hid driver is currently manually managing the wake
IRQ. This change removes the explicit enable_irq_wake/disable_irq_wake
and instead relies on the PM subsystem. This is done by calling
dev_pm_set_wake_irq.

i2c_device_probe already calls dev_pm_set_wake_irq when using device
tree, and i2c_device_remove also already calls dev_pm_clear_wake_irq.
There could be some device tree systems that have incorrectly declared
`wake` capabilities, so this change will set the wake irq if one is
missing. This matches the previous behavior.

I tested this on an ACPI system that has a HID touchscreen and verified
the IRQ was armed for wake on suspend.

Signed-off-by: Raul E Rangel <rrangel@chromium.org>
Acked-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>

---

Changes in v5:
- Added Acked-by: Benjamin Tissoires

Changes in v3:
- Fixed typo in if condition

Changes in v2:
- Set the wake_irq when not configured by the i2c-core. This is
  different than v1, where the wake_irq was only set for non DT systems.

 drivers/hid/i2c-hid/i2c-hid-core.c | 33 +++++++++++-------------------
 1 file changed, 12 insertions(+), 21 deletions(-)

diff --git a/drivers/hid/i2c-hid/i2c-hid-core.c b/drivers/hid/i2c-hid/i2c-hid-core.c
index baa169fadd6632..a2fa40dec04ea5 100644
--- a/drivers/hid/i2c-hid/i2c-hid-core.c
+++ b/drivers/hid/i2c-hid/i2c-hid-core.c
@@ -26,6 +26,7 @@
 #include <linux/delay.h>
 #include <linux/slab.h>
 #include <linux/pm.h>
+#include <linux/pm_wakeirq.h>
 #include <linux/device.h>
 #include <linux/wait.h>
 #include <linux/err.h>
@@ -116,7 +117,6 @@ struct i2c_hid {
 
 	wait_queue_head_t	wait;		/* For waiting the interrupt */
 
-	bool			irq_wake_enabled;
 	struct mutex		reset_lock;
 
 	struct i2chid_ops	*ops;
@@ -1036,6 +1036,15 @@ int i2c_hid_core_probe(struct i2c_client *client, struct i2chid_ops *ops,
 	if (ret < 0)
 		goto err_powered;
 
+	/*
+	 * The wake IRQ should be declared via device tree instead of assuming
+	 * the IRQ can wake the system. This is here for legacy reasons and
+	 * will be removed once the i2c-core supports querying ACPI for wake
+	 * capabilities.
+	 */
+	if (!client->dev.power.wakeirq)
+		dev_pm_set_wake_irq(&client->dev, client->irq);
+
 	hid = hid_allocate_device();
 	if (IS_ERR(hid)) {
 		ret = PTR_ERR(hid);
@@ -1119,7 +1128,6 @@ static int i2c_hid_core_suspend(struct device *dev)
 	struct i2c_hid *ihid = i2c_get_clientdata(client);
 	struct hid_device *hid = ihid->hid;
 	int ret;
-	int wake_status;
 
 	ret = hid_driver_suspend(hid, PMSG_SUSPEND);
 	if (ret < 0)
@@ -1130,16 +1138,8 @@ static int i2c_hid_core_suspend(struct device *dev)
 
 	disable_irq(client->irq);
 
-	if (device_may_wakeup(&client->dev)) {
-		wake_status = enable_irq_wake(client->irq);
-		if (!wake_status)
-			ihid->irq_wake_enabled = true;
-		else
-			hid_warn(hid, "Failed to enable irq wake: %d\n",
-				wake_status);
-	} else {
+	if (!device_may_wakeup(&client->dev))
 		i2c_hid_core_power_down(ihid);
-	}
 
 	return 0;
 }
@@ -1150,18 +1150,9 @@ static int i2c_hid_core_resume(struct device *dev)
 	struct i2c_client *client = to_i2c_client(dev);
 	struct i2c_hid *ihid = i2c_get_clientdata(client);
 	struct hid_device *hid = ihid->hid;
-	int wake_status;
 
-	if (!device_may_wakeup(&client->dev)) {
+	if (!device_may_wakeup(&client->dev))
 		i2c_hid_core_power_up(ihid);
-	} else if (ihid->irq_wake_enabled) {
-		wake_status = disable_irq_wake(client->irq);
-		if (!wake_status)
-			ihid->irq_wake_enabled = false;
-		else
-			hid_warn(hid, "Failed to disable irq wake: %d\n",
-				wake_status);
-	}
 
 	enable_irq(client->irq);
 
-- 
2.37.3.968.ga6b4b080e4-goog

