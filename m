Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6F12153AD68
	for <lists+linux-input@lfdr.de>; Wed,  1 Jun 2022 21:48:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229587AbiFATal (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 1 Jun 2022 15:30:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229463AbiFATae (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 1 Jun 2022 15:30:34 -0400
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7BEC17D3A8;
        Wed,  1 Jun 2022 12:28:36 -0700 (PDT)
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-f2a4c51c45so4010233fac.9;
        Wed, 01 Jun 2022 12:28:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XZHYlXGE/Gj6HgAtGn+s07Im2MDC4D0sr/Mr2hsyhJc=;
        b=FGGQMA136L0V8cOVVqL1HHuZRyAPa6flPt/N0VztaBi2WqmtubZhbRg5uDUnDTE8GF
         ym0LfjI/MBIHxhwLqvyUBwMRJb6Bdus3ICSlgriMdGcFb6pXvMgdlEapr9TTUVflk9Dj
         4eu2EpazUuU5fNldQLVMLybM9MLAkRtnW6Wuz8uGS739h41Y2xYAyoEPEZhkfnMvxpUI
         sOInSICftmyxm/FgF95q9f8qb0AKBYMq6waXnWyQ0YKT3oehxm0V0T3KtynZIiCygNcY
         CadVeJgwpnUAoe8GEIP6b3tRFPII5SmEofOaQTfuanvSaDv01iwfE3meG7ZcbSGjDQhB
         27Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XZHYlXGE/Gj6HgAtGn+s07Im2MDC4D0sr/Mr2hsyhJc=;
        b=RrD9BZDkYzYYHGiTVPKABeUNFOXXB29ZpYUUH+UJ+nSjAFU2arFkdZaQWcZ9GAnC29
         tHrKhmCe6YlOlw7zi/AbOl/07ML5VC9rd7emEv4CltlNgtIdkYbV9dqqbSlv8YjJoB/9
         nZW/jsf5JKoa6Y9nNhMDBpLWfZSXp4u2hnGb+SrENRP2Z2TdWun17SbAkRucMWtJijNK
         ga2T7LHBa/NwfHoeZ0gXmU5zpvy3JYiu8d7eag4RSb4Pcft99fdrZ826bKD3T9LefuvZ
         1twzIRHbTTuQItcoEJxUU5JfRUspuwM9WG4Op6cgSJ8yLlurKQCcMV6V7Az+ubx5bscT
         kbTg==
X-Gm-Message-State: AOAM533ZplxVPjiGD7+T8BrO1fosRw6xaT9/YVaws7aNR9xPoGuqehcs
        9+LpfDvg3etKbCvez0UHQXBoSi3NGMWOXA==
X-Google-Smtp-Source: ABdhPJyLUivhx8v1SCAZrXKdj3/PkUpEYPIpZh8oD+1ERe7p+2gmN9TTFdzMCy/WyhmHx8KgNo/MHw==
X-Received: by 2002:a05:6870:3293:b0:f2:dbc9:596f with SMTP id q19-20020a056870329300b000f2dbc9596fmr17556684oac.112.1654111064154;
        Wed, 01 Jun 2022 12:17:44 -0700 (PDT)
Received: from wintermute.localdomain (cpe-76-183-134-35.tx.res.rr.com. [76.183.134.35])
        by smtp.gmail.com with ESMTPSA id w41-20020a056830412900b005b22a0d826csm1194512ott.1.2022.06.01.12.17.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jun 2022 12:17:43 -0700 (PDT)
From:   Chris Morgan <macroalpha82@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     devicetree@vger.kernel.org, contact@artur-rojek.eu,
        heiko@sntech.de, krzysztof.kozlowski+dt@linaro.org,
        robh+dt@kernel.org, dmitry.torokhov@gmail.com,
        maccraft123mc@gmail.com, Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH 2/3] Input: adc-joystick - Add polled input device support
Date:   Wed,  1 Jun 2022 14:17:29 -0500
Message-Id: <20220601191730.29721-3-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220601191730.29721-1-macroalpha82@gmail.com>
References: <20220601191730.29721-1-macroalpha82@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Chris Morgan <macromorgan@hotmail.com>

Add polled input device support to the adc-joystick driver. This is
useful for devices which do not have hardware capable triggers on
their SARADC. Code modified from adc-joystick.c changes made by Maya
Matuszczyk.

Signed-off-by: Maya Matuszczyk <maccraft123mc@gmail.com>
Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 drivers/input/joystick/adc-joystick.c | 53 +++++++++++++++++++++------
 1 file changed, 42 insertions(+), 11 deletions(-)

diff --git a/drivers/input/joystick/adc-joystick.c b/drivers/input/joystick/adc-joystick.c
index 78ebca7d400a..83a5a420141e 100644
--- a/drivers/input/joystick/adc-joystick.c
+++ b/drivers/input/joystick/adc-joystick.c
@@ -13,6 +13,10 @@
 
 #include <asm/unaligned.h>
 
+#define ADC_JSK_POLL_INTERVAL	16
+#define ADC_JSK_POLL_MIN	8
+#define ADC_JSK_POLL_MAX	32
+
 struct adc_joystick_axis {
 	u32 code;
 	s32 range[2];
@@ -26,8 +30,21 @@ struct adc_joystick {
 	struct adc_joystick_axis *axes;
 	struct iio_channel *chans;
 	int num_chans;
+	bool polled;
 };
 
+static void adc_joystick_poll(struct input_dev *input)
+{
+	struct adc_joystick *joy = input_get_drvdata(input);
+	int i, val;
+
+	for (i = 0; i < joy->num_chans; i++) {
+		iio_read_channel_raw(&joy->chans[i], &val);
+		input_report_abs(input, joy->axes[i].code, val);
+	}
+	input_sync(input);
+}
+
 static int adc_joystick_handle(const void *data, void *private)
 {
 	struct adc_joystick *joy = private;
@@ -215,8 +232,19 @@ static int adc_joystick_probe(struct platform_device *pdev)
 	joy->input = input;
 	input->name = pdev->name;
 	input->id.bustype = BUS_HOST;
-	input->open = adc_joystick_open;
-	input->close = adc_joystick_close;
+
+	if (of_device_is_compatible(dev->of_node, "adc-joystick-polled"))
+		joy->polled = 1;
+
+	if (joy->polled == 1) {
+		input_setup_polling(input, adc_joystick_poll);
+		input_set_poll_interval(input, ADC_JSK_POLL_INTERVAL);
+		input_set_min_poll_interval(input, ADC_JSK_POLL_MIN);
+		input_set_max_poll_interval(input, ADC_JSK_POLL_MAX);
+	} else {
+		input->open = adc_joystick_open;
+		input->close = adc_joystick_close;
+	}
 
 	error = adc_joystick_set_axes(dev, joy);
 	if (error)
@@ -229,16 +257,18 @@ static int adc_joystick_probe(struct platform_device *pdev)
 		return error;
 	}
 
-	joy->buffer = iio_channel_get_all_cb(dev, adc_joystick_handle, joy);
-	if (IS_ERR(joy->buffer)) {
-		dev_err(dev, "Unable to allocate callback buffer\n");
-		return PTR_ERR(joy->buffer);
-	}
+	if (joy->polled == 0) {
+		joy->buffer = iio_channel_get_all_cb(dev, adc_joystick_handle, joy);
+		if (IS_ERR(joy->buffer)) {
+			dev_err(dev, "Unable to allocate callback buffer\n");
+			return PTR_ERR(joy->buffer);
+		}
 
-	error = devm_add_action_or_reset(dev, adc_joystick_cleanup, joy->buffer);
-	if (error)  {
-		dev_err(dev, "Unable to add action\n");
-		return error;
+		error = devm_add_action_or_reset(dev, adc_joystick_cleanup, joy->buffer);
+		if (error)  {
+			dev_err(dev, "Unable to add action\n");
+			return error;
+		}
 	}
 
 	return 0;
@@ -246,6 +276,7 @@ static int adc_joystick_probe(struct platform_device *pdev)
 
 static const struct of_device_id adc_joystick_of_match[] = {
 	{ .compatible = "adc-joystick", },
+	{ .compatible = "adc-joystick-polled", },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, adc_joystick_of_match);
-- 
2.25.1

