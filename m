Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 19DCE6B5293
	for <lists+linux-input@lfdr.de>; Fri, 10 Mar 2023 22:11:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231343AbjCJVLd (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 10 Mar 2023 16:11:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230118AbjCJVLc (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 10 Mar 2023 16:11:32 -0500
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9044911F2C5
        for <linux-input@vger.kernel.org>; Fri, 10 Mar 2023 13:11:30 -0800 (PST)
Received: by mail-wr1-x436.google.com with SMTP id h11so6239255wrm.5
        for <linux-input@vger.kernel.org>; Fri, 10 Mar 2023 13:11:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678482689;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=epsyKj1iUIHYd5x8Fb5v2R5om+rQyPRNOcnsyfhyKcI=;
        b=JW4JqCt3vQjclJadtuAX0oW5OWZE5Ki1pV094hfBi0MU1CjHmjhtkuEdzsZEUOuGba
         S4T1Mfvw/R4y/9YE7XUVX5EkAO6e339sXlIf8On8WwzhiI1m+ZnfwxM8QOzUeFW1a+ZB
         GKweaQvCpppbsg+R4aoBMmDQGl1KRiObZ0VyyetkV0P5NOz1WZC06LbAolW714ctNIAZ
         ToOjjsUUAVinEGSRYq87J1okudNDg3/3JRae1W9SN4b8ERsCXJPLUvNJM1UQ0saZonFt
         BUXnNDINKgQFKUzGhiCVhDgzMvHuD9qv1aWYzW2wZvNe7ARzolWo/wt7IJiRXtNv/xA0
         2nOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678482689;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=epsyKj1iUIHYd5x8Fb5v2R5om+rQyPRNOcnsyfhyKcI=;
        b=FrOlokne7My+2qr599mnwZPov9p5u/svurjG2Y99TjJHsyURfAG8nTzZhJ09nsYRRB
         IfRxP3Pn/AhS//PUyt/cdDWrV5cMjt2rZOCEqqjySW89pR4jg0fhkeas1Y8BxOsLWDhf
         3PQoFR+WfEXn+UuDyuHzj9driO7FHCyk2xk8M/Fi8J2wf/CXWZfwj03AUYBB6dSjHh9C
         QzJD/ix6cKR3E280CnCLTGGSl9cKt5uY0i5hsIaCU8pNVtV5ekJzLv56Jr6BZDcrc5Ra
         osZhU4CMH6Asww45KXkt75u00FUVQMGQkEuRywRsLBuzUiYMuzLU6bWEoRDAelNT2Knz
         FH0g==
X-Gm-Message-State: AO0yUKXMu1pj3gsr3KkuLqjXvqH829q3y/VQxKsoEkvapREZFZ+UP9YU
        EQSx2PngYz8Vo7gW0RpKnz1YX4mRWRiiciPIVwo=
X-Google-Smtp-Source: AK7set/i2VoJjXIPe2vrg335vUrQ78IXmLG4vhWobTSEplAGKLLJKRdvLwKKosfJ0QMSSUEbxCBv+Q==
X-Received: by 2002:adf:e50c:0:b0:2c7:a39:6e2e with SMTP id j12-20020adfe50c000000b002c70a396e2emr17202971wrm.15.1678482688934;
        Fri, 10 Mar 2023 13:11:28 -0800 (PST)
Received: from localhost.localdomain ([217.138.222.109])
        by smtp.gmail.com with ESMTPSA id f11-20020adff44b000000b002c6e8cb612fsm687934wrp.92.2023.03.10.13.11.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 13:11:28 -0800 (PST)
From:   Jan Jasper de Kroon <jajadekroon@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     =?UTF-8?q?Ond=C5=99ej=20Jirman?= <megi@xff.cz>,
        Jan Jasper de Kroon <jajadekroon@gmail.com>
Subject: [PATCH] input: goodix: Add option to power off the controller during suspend
Date:   Fri, 10 Mar 2023 18:00:26 +0100
Message-Id: <20230310170026.415739-1-jajadekroon@gmail.com>
X-Mailer: git-send-email 2.34.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.5 required=5.0 tests=BAYES_00,DATE_IN_PAST_03_06,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Ondřej Jirman <megi@xff.cz>

For whatever reason the controller is not suspended on Pinephone
by the default procedure. It consumes quite a bit of power (~40mW)
during system sleep, and more when the screen is touched.

Let's power off the controller during system sleep instead.

Signed-off-by: Ondrej Jirman <megi@xff.cz>

input: goodix: Don't disable regulators during suspend

It does no harm to disable them, but on Pinephone we have other
peripherals attached to the same power supplies, whose drivers
will not reference the regulator, so powering down the regulators
from Goodix driver will break those other devices.

Until those drivers gain the regulator support, don't disable
the regulators in Goodix driver.

Signed-off-by: Ondrej Jirman <megi@xff.cz>
Signed-off-by: Jan Jasper de Kroon <jajadekroon@gmail.com>
---
 drivers/input/touchscreen/goodix.c | 23 +++++++++++++++++++++++
 drivers/input/touchscreen/goodix.h |  1 +
 2 files changed, 24 insertions(+)

diff --git a/drivers/input/touchscreen/goodix.c b/drivers/input/touchscreen/goodix.c
index b348172f19c3..e6d054ede960 100644
--- a/drivers/input/touchscreen/goodix.c
+++ b/drivers/input/touchscreen/goodix.c
@@ -1284,6 +1284,7 @@ static void goodix_disable_regulators(void *arg)
 
 static int goodix_ts_probe(struct i2c_client *client)
 {
+	struct device_node *np = client->dev.of_node;
 	struct goodix_ts_data *ts;
 	const char *cfg_name;
 	int error;
@@ -1303,6 +1304,7 @@ static int goodix_ts_probe(struct i2c_client *client)
 	i2c_set_clientdata(client, ts);
 	init_completion(&ts->firmware_loading_complete);
 	ts->contact_size = GOODIX_CONTACT_SIZE;
+	ts->poweroff_in_suspend = of_property_read_bool(np, "poweroff-in-suspend");
 
 	error = goodix_get_gpio_config(ts);
 	if (error)
@@ -1410,6 +1412,13 @@ static int goodix_suspend(struct device *dev)
 	if (ts->load_cfg_from_disk)
 		wait_for_completion(&ts->firmware_loading_complete);
 
+	if (ts->poweroff_in_suspend) {
+		goodix_free_irq(ts);
+		goodix_irq_direction_output(ts, 0);
+		gpiod_direction_output(ts->gpiod_rst, 0);
+		return 0;
+	}
+
 	/* We need gpio pins to suspend/resume */
 	if (ts->irq_pin_access_method == IRQ_PIN_ACCESS_NONE) {
 		disable_irq(client->irq);
@@ -1455,6 +1464,20 @@ static int goodix_resume(struct device *dev)
 	u8 config_ver;
 	int error;
 
+	if (ts->poweroff_in_suspend) {
+		error = goodix_reset(ts);
+		if (error) {
+			dev_err(dev, "Controller reset failed.\n");
+			return error;
+		}
+
+		error = goodix_request_irq(ts);
+		if (error)
+			return error;
+
+		return 0;
+	}
+
 	if (ts->irq_pin_access_method == IRQ_PIN_ACCESS_NONE) {
 		enable_irq(client->irq);
 		return 0;
diff --git a/drivers/input/touchscreen/goodix.h b/drivers/input/touchscreen/goodix.h
index 87797cc88b32..dc358bcda698 100644
--- a/drivers/input/touchscreen/goodix.h
+++ b/drivers/input/touchscreen/goodix.h
@@ -104,6 +104,7 @@ struct goodix_ts_data {
 	u8 main_clk[GOODIX_MAIN_CLK_LEN];
 	int bak_ref_len;
 	u8 *bak_ref;
+	bool poweroff_in_suspend;
 };
 
 int goodix_i2c_read(struct i2c_client *client, u16 reg, u8 *buf, int len);
-- 
2.34.3

