Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3D22053AF20
	for <lists+linux-input@lfdr.de>; Thu,  2 Jun 2022 00:50:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230132AbiFAUwh (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 1 Jun 2022 16:52:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230059AbiFAUvQ (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 1 Jun 2022 16:51:16 -0400
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com [IPv6:2607:f8b0:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 892EC915A5;
        Wed,  1 Jun 2022 13:49:37 -0700 (PDT)
Received: by mail-ot1-x32c.google.com with SMTP id g13-20020a9d6b0d000000b0060b13026e0dso2073209otp.8;
        Wed, 01 Jun 2022 13:49:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZGf5MMy759Vak/8WG6t17kedCivIjuKTblPpyCYJaes=;
        b=J2fKaNhWDhRft6hDjRM9ZNJGoOgBHXelVqIY268qnVeCckiE9C2bMns1rzvvL9DyUo
         p4k3ntHHHcmje64V8krloMOpD5PW1qZfGuZmxNMIh+MvkAA9X5vROdvLxUHxb3L2BANG
         /xgUzRnQ/llYx2pSAnn4YyPUcjddUbidXhO18/Edfuy5mwb6wO7twfDwwSQpNUZPDPQY
         UR7LxSSOG3wmE5fIicv8281EOurq443e7BTxGJ4DcjddJiEnXujiqfxLUX4Axjw3bCSE
         vkqvJp9LrEANYR1n73MvTt1uLrMJAS4K1R61uC+u5QEcs89PHMWkarjVc86fpNPcNQGn
         LNfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZGf5MMy759Vak/8WG6t17kedCivIjuKTblPpyCYJaes=;
        b=m+WMmGrwtiK1MWSw8MwmLDubgHhPNiBbPqEOoVVSXU8EsCeZli2SxVD1KvKt8z4YaK
         mS1zjJl6PuAmatYlu0v4P0IBv3JO2SYr0Ze8Wq0kRHdaq8SDnP8ny+9i9MlJJrGwRu2N
         iT1ru3EytV+auB8ZO5WiP+DXKasktvu8gn2VloLCMtDA7SHqk0JDs61L387MI+rCNF7R
         8lELVJBCLPg4EdFCeUmluYkvBZ4EHngGvT+r+AJYN6KNxCeFf9NN/poRhdJpmZU3MMs3
         moWgdtdTxvUb2q4HygNKCU08E/ln5O/sh/jiRocNt2gRXGVhWTCO9nfbYeaiXmdUPfSj
         kK/g==
X-Gm-Message-State: AOAM531mNVK08Cd5WMb2JwYttpaLrHgOxwjyImBvgxdJKUBnWycu6rhw
        HpPsrNr40klWmKPIuWen29z7bdI98c5odw==
X-Google-Smtp-Source: ABdhPJyz+rqZUxiv4Tm150IHWMdoiW1+APtpcoXxpsn302eVa2pWCQsV0HLu01o04+9oUE1w0yLwqQ==
X-Received: by 2002:a05:6830:2708:b0:606:621f:b634 with SMTP id j8-20020a056830270800b00606621fb634mr743463otu.1.1654116573156;
        Wed, 01 Jun 2022 13:49:33 -0700 (PDT)
Received: from wintermute.localdomain (cpe-76-183-134-35.tx.res.rr.com. [76.183.134.35])
        by smtp.gmail.com with ESMTPSA id 3-20020a9d0b83000000b0060603221279sm1222157oth.73.2022.06.01.13.49.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jun 2022 13:49:32 -0700 (PDT)
From:   Chris Morgan <macroalpha82@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     devicetree@vger.kernel.org, dmitry.torokhov@gmail.com,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        heiko@sntech.de, maccraft123mc@gmail.com, contact@artur-rojek.eu,
        Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH v2 2/3] Input: adc-joystick - Add polled input device support
Date:   Wed,  1 Jun 2022 15:49:26 -0500
Message-Id: <20220601204927.10256-3-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220601204927.10256-1-macroalpha82@gmail.com>
References: <20220601204927.10256-1-macroalpha82@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
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
 drivers/input/joystick/adc-joystick.c | 52 +++++++++++++++++++++------
 1 file changed, 41 insertions(+), 11 deletions(-)

diff --git a/drivers/input/joystick/adc-joystick.c b/drivers/input/joystick/adc-joystick.c
index 78ebca7d400a..5a28fe7b8ebc 100644
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
+	if (device_property_read_bool(dev, "adc-joystick,polled"))
+		joy->polled = 1;
+
+	if (joy->polled) {
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
+	if (!joy->polled) {
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
-- 
2.25.1

