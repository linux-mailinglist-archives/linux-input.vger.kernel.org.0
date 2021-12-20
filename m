Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E43E947B63F
	for <lists+linux-input@lfdr.de>; Tue, 21 Dec 2021 00:44:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233144AbhLTXoA (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 20 Dec 2021 18:44:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233131AbhLTXn7 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 20 Dec 2021 18:43:59 -0500
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com [IPv6:2607:f8b0:4864:20::d2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6890BC061574
        for <linux-input@vger.kernel.org>; Mon, 20 Dec 2021 15:43:59 -0800 (PST)
Received: by mail-io1-xd2f.google.com with SMTP id e128so15533381iof.1
        for <linux-input@vger.kernel.org>; Mon, 20 Dec 2021 15:43:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lNqaSlrOE70VPTa+GjJ5DlEK6n0EAgcYkJbBO9oyFQk=;
        b=jUmFumTvIIdji9Cf7/UTW3J0mtygeMxgJLE07pAbntRBj5W7WGySBEXF+XrO69kC58
         55pP1A/xiMYYlW9P4IwZDtIE1fSy17IXppqoMS3o/u8B0n2/cXxDq9bq/2ZnGdwYcApg
         acU0YA94vLuG9mB+6GrJ5ql40FjSItokhabYw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lNqaSlrOE70VPTa+GjJ5DlEK6n0EAgcYkJbBO9oyFQk=;
        b=SNzZLuZhrEwOD+J6/AxFiZXyGl45eNShaUfG23nRtt3hgvWpjd+6eeCCr+1gP8ZmzA
         SrZJIr163S8TSa1h4qI8cgMQBeAPr3PY0x795YJ3IG0+ckaV9TLX1gw1PgatQCLS0MUO
         n7lO/eMrTrVXVuvWtAYilylC+L8hx+KhUgt+nkbU/wFlAyjAKxZtjgt6dgv9vV+BoFA8
         dSbzwTyORlscKsVR23EBNYIp7qUQCwWnB5VJQn0Gj4sZqBuYLicx+C3fjvS1ltASHrC2
         rxnOvHpqNSccVQEd57GIvT1mf50j7u7pmM5kUg1ePfZxLapYO7SViV+K3s6/B9j5hRQB
         eaJg==
X-Gm-Message-State: AOAM533KRlO3OaXCwx13MIanDTBbIv7XLP2aPjb0d2zxnvQTlCu2SkYd
        pIV5qePLxwFzh1RDQjhUb1ZBeg==
X-Google-Smtp-Source: ABdhPJzUHNnstH41oXkBeK5J7PARGhWrTMv2EcttYGTcNS5AYBraDp2A2GI+XOH/RQC6P87vAEUWWg==
X-Received: by 2002:a02:8501:: with SMTP id g1mr369627jai.144.1640043838916;
        Mon, 20 Dec 2021 15:43:58 -0800 (PST)
Received: from rrangel920.bld.corp.google.com (h24-56-189-219.arvdco.broadband.dynamic.tds.net. [24.56.189.219])
        by smtp.gmail.com with ESMTPSA id k19sm4077521ilr.34.2021.12.20.15.43.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Dec 2021 15:43:58 -0800 (PST)
From:   Raul E Rangel <rrangel@chromium.org>
To:     linux-kernel@vger.kernel.org
Cc:     mario.limonciello@amd.com, linux-input@vger.kernel.org,
        dianders@chromium.org, Raul E Rangel <rrangel@chromium.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        "jingle.wu" <jingle.wu@emc.com.tw>
Subject: [PATCH 2/3] Input: elan_i2c - Use PM subsystem to manage wake irq
Date:   Mon, 20 Dec 2021 16:43:45 -0700
Message-Id: <20211220163823.2.Id022caf53d01112188308520915798f08a33cd3e@changeid>
X-Mailer: git-send-email 2.34.1.307.g9b7440fafd-goog
In-Reply-To: <20211220234346.2798027-1-rrangel@chromium.org>
References: <20211220234346.2798027-1-rrangel@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The Elan I2C touchpad driver is currently manually managing the wake
IRQ. When a device is managed by device tree or ACPI it is expected that
those subsystems manage defining the wake pin and manage enabling it.

This change removes the explicit enable_irq_wake/disable_irq_wake and
relies on the PM subsystem. See device_wakeup_arm_wake_irqs.

It also registers the IRQ using dev_pm_set_wake_irq only in the case
where the device isn't DT or ACPI managed. This should preserve the
existing behavior. I'm not sure how we actually get into this state
though.

I tested this with an ACPI device that has a `_PRW` method that uses a
GPE was the wake event. I no longer see the GPIO controller being called
to enable the wake pin. This results in the GPE correctly being marked
as the wake source.

Signed-off-by: Raul E Rangel <rrangel@chromium.org>
---

 drivers/input/mouse/elan_i2c_core.c | 21 +++++++--------------
 1 file changed, 7 insertions(+), 14 deletions(-)

diff --git a/drivers/input/mouse/elan_i2c_core.c b/drivers/input/mouse/elan_i2c_core.c
index 47af62c12267..58f056ee0747 100644
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
@@ -1368,11 +1367,13 @@ static int elan_probe(struct i2c_client *client,
 	}
 
 	/*
-	 * Systems using device tree should set up wakeup via DTS,
+	 * Systems using device tree or ACPI should set up wakeup via DTS/ACPI,
 	 * the rest will configure device as wakeup source by default.
 	 */
-	if (!dev->of_node)
+	if (!dev->of_node && !ACPI_COMPANION(dev)) {
 		device_init_wakeup(dev, true);
+		dev_pm_set_wake_irq(dev, client->irq);
+	}
 
 	return 0;
 }
@@ -1394,13 +1395,10 @@ static int __maybe_unused elan_suspend(struct device *dev)
 
 	disable_irq(client->irq);
 
-	if (device_may_wakeup(dev)) {
+	if (device_may_wakeup(dev))
 		ret = elan_sleep(data);
-		/* Enable wake from IRQ */
-		data->irq_wake = (enable_irq_wake(client->irq) == 0);
-	} else {
+	else
 		ret = elan_disable_power(data);
-	}
 
 	mutex_unlock(&data->sysfs_mutex);
 	return ret;
@@ -1412,11 +1410,6 @@ static int __maybe_unused elan_resume(struct device *dev)
 	struct elan_tp_data *data = i2c_get_clientdata(client);
 	int error;
 
-	if (device_may_wakeup(dev) && data->irq_wake) {
-		disable_irq_wake(client->irq);
-		data->irq_wake = false;
-	}
-
 	error = elan_enable_power(data);
 	if (error) {
 		dev_err(dev, "power up when resuming failed: %d\n", error);
-- 
2.34.1.307.g9b7440fafd-goog

