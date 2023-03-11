Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B14E26B5C2F
	for <lists+linux-input@lfdr.de>; Sat, 11 Mar 2023 14:16:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229552AbjCKNQp (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 11 Mar 2023 08:16:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229450AbjCKNQo (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 11 Mar 2023 08:16:44 -0500
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B3F910E597
        for <linux-input@vger.kernel.org>; Sat, 11 Mar 2023 05:16:42 -0800 (PST)
Received: by mail-wm1-x333.google.com with SMTP id j19-20020a05600c191300b003eb3e1eb0caso7937228wmq.1
        for <linux-input@vger.kernel.org>; Sat, 11 Mar 2023 05:16:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678540601;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OcL07zXIG7KXxlq/YaRlvc5cxo6LKN9z/vMMgyuhJjY=;
        b=Pkxkib/MWjZf0l6b4aIQDP1yIPGMs+HjPX+qWWMl85baaugA/UaR2dQDy9jjMojZ4w
         NRRzyV/m9+KbvbBrKaO3SguBZi150Wm768et4LujVoI/7DlO8H60fg6em5tbeUycZvUG
         Qbaf0HTFe8VjpKWTvfGpjedbI/OvxFKMZJshWXlf/Udov8dRkFmJ2RNpYl8qft1aIwJN
         wvXUPaNfxRW9qYOIlPUAfiwdkFiQ6BLvwxyguxQlmO/pRzhW0PdjPgCF1vRPVYp5L5Hm
         Y1OA06d9/EfNH9CC0kBRuZkIa4pgpVbuySz4XtQvwHCEDa+O5JK8zJ0X2kyIS3sFYOqM
         c6KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678540601;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OcL07zXIG7KXxlq/YaRlvc5cxo6LKN9z/vMMgyuhJjY=;
        b=f1ikdpQi5t/kECb5fIL53nbHWMZA50XhDt0O515ms2iZrCDABszlZh8qO3DbZdusOo
         UhAcCoJd39JeuOaRggx0GKecvBP5VRvqcDIZCAFRQuFuftES7NBTtpk1qz0vAPByON/4
         BUlxBrlVDppZ2eYZ5AI1fxN88jMklmnxNwWYsBjLaFzpjz4pZbFNVITmYPRhpoaOhS0j
         LEakAgAF9dY3jE3AyUNf4bxUXLJfG2vRVX0uZNU8pyDzIl4gwbLV6I26iPYf839dEw0J
         crNsYEnF+0QtbO2mBemeZ/1RRfqzrMMuMtxArR2unQO7DVoy33KEuJ9IhiHh7nj2YRDt
         Ozig==
X-Gm-Message-State: AO0yUKXIUrBHO6cWeP4RUTM7yP7MPQoKXk+j0lHGCeQ63Mu2/Zz/BGEf
        yuLwLUBIQ4bhKRiZzChj8b8=
X-Google-Smtp-Source: AK7set+Ph040YSlq6SxYuynrboqh902he93ctXHaMMHarmSl3VXJKoj56rnZhT13oK+skLcG5/Meaw==
X-Received: by 2002:a05:600c:3d88:b0:3eb:33fb:9dcf with SMTP id bi8-20020a05600c3d8800b003eb33fb9dcfmr5827151wmb.5.1678540600889;
        Sat, 11 Mar 2023 05:16:40 -0800 (PST)
Received: from localhost.localdomain ([146.70.189.177])
        by smtp.gmail.com with ESMTPSA id n6-20020a7bcbc6000000b003e21f01c426sm2880201wmi.9.2023.03.11.05.16.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Mar 2023 05:16:40 -0800 (PST)
From:   Jan Jasper de Kroon <jajadekroon@gmail.com>
To:     jajadekroon@gmail.com
Cc:     linux-input@vger.kernel.org, megi@xff.cz
Subject: [PATCH v2] input: touchscreen: goodix: Hold controller in reset during suspend
Date:   Sat, 11 Mar 2023 14:15:35 +0100
Message-Id: <20230311131534.484700-1-jajadekroon@gmail.com>
X-Mailer: git-send-email 2.34.3
In-Reply-To: <20230310170026.415739-1-jajadekroon@gmail.com>
References: <20230310170026.415739-1-jajadekroon@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Ondřej Jirman <megi@xff.cz>

The Goodix touchscreen controller used in PinePhone is not properly
suspended during system sleep, leading to high power consumption. This
commit modifies the driver to hold the controller in reset during
system sleep, reducing power consumption by around 40mW.

The original patch also disabled the regulators during system sleep, but
this could cause issues with other peripherals attached to the same power
supplies. Hence, this commit only holds the controller in reset during
system sleep and does not attempt to power it off.

A separate commit adds a new device tree property "hold-in-reset-in-suspend"
to control the hold-in-reset behavior of the controller during system sleep.

Signed-off-by: Ondrej Jirman <megi@xff.cz>
Signed-off-by: Jan Jasper de Kroon <jajadekroon@gmail.com>
---
V1 -> V2: Rewrote the commit message and function name to better reflect it's behavior.

 drivers/input/touchscreen/goodix.c | 23 +++++++++++++++++++++++
 drivers/input/touchscreen/goodix.h |  1 +
 2 files changed, 24 insertions(+)

diff --git a/drivers/input/touchscreen/goodix.c b/drivers/input/touchscreen/goodix.c
index b348172f19c3..a35a203e04bf 100644
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
+	ts->hold_in_reset_in_suspend = of_property_read_bool(np, "hold-in-reset-in-suspend");
 
 	error = goodix_get_gpio_config(ts);
 	if (error)
@@ -1410,6 +1412,13 @@ static int goodix_suspend(struct device *dev)
 	if (ts->load_cfg_from_disk)
 		wait_for_completion(&ts->firmware_loading_complete);
 
+	if (ts->hold_in_reset_in_suspend) {
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
 
+	if (ts->hold_in_reset_in_suspend) {
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
index 87797cc88b32..c515d03b742c 100644
--- a/drivers/input/touchscreen/goodix.h
+++ b/drivers/input/touchscreen/goodix.h
@@ -104,6 +104,7 @@ struct goodix_ts_data {
 	u8 main_clk[GOODIX_MAIN_CLK_LEN];
 	int bak_ref_len;
 	u8 *bak_ref;
+	bool hold_in_reset_in_suspend;
 };
 
 int goodix_i2c_read(struct i2c_client *client, u16 reg, u8 *buf, int len);
-- 
2.34.3

