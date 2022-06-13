Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C187A549F66
	for <lists+linux-input@lfdr.de>; Mon, 13 Jun 2022 22:35:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240259AbiFMUfB (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 13 Jun 2022 16:35:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235738AbiFMUdd (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 13 Jun 2022 16:33:33 -0400
Received: from mail-oa1-x31.google.com (mail-oa1-x31.google.com [IPv6:2001:4860:4864:20::31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 260A833B;
        Mon, 13 Jun 2022 12:24:05 -0700 (PDT)
Received: by mail-oa1-x31.google.com with SMTP id 586e51a60fabf-fe539f9afbso9702330fac.5;
        Mon, 13 Jun 2022 12:24:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/jxAroPORONkWHCP81HqzVgF07d+274DtG9JNGDJZdA=;
        b=RUHJKh+3j/CGwnKeNxGZJdL26F8MjQxY4sCgq2DhG2groUNmSXC54g4YvN/K2B6ogO
         aGFTIruaHmEAgZt5zJ938t8TIH4SmMOyBbI+5DsGAxsqudH5U1lGa4aohNuKlyy9ZodN
         QLJ3vf+qAr20Z96om5yupJQCJfrzLn+FXn6lijnkjF6FmcWGLANB/2Yh8tPvZDa51Tyy
         bfnFff/CJny2hG6CjqzbTOMda4ELRZOIH46oTah3hyx8SJQt7IUohqQqNikqlqcaouOe
         BWVgsZBVLpoxpgrL3ICXf6u6CRN5EbL3cD0g/j977Ah6Ajd7k+N5vkqbcwfVnoU1pq+d
         p+xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/jxAroPORONkWHCP81HqzVgF07d+274DtG9JNGDJZdA=;
        b=UetjumSYcJTnz7xJMxoSjHpLNofSqm+aH0UHaue1lFmJHlQNnZPy1mH/PqeBeFivjq
         g6BTbaJtsv86RY/Y1ABtyFbCmOCToyO5BuEHN1qJK9aWeje6lZif8beP93UAWy5RF+3r
         lJS75L/8bP+A5q2gcKUrPvDsPHkG5h1xMx3+PCpmcBKH+hz+iYPLkAbmjE/2fJO5rkeu
         cKUJVzeUETjLJoGN6U7Ihav6iKBMgh4dovQc6Hp2s2tljLB8LJVbtqsaCX0H0J1g6z9z
         Q7OvvmoH/pOwIh9/eQrocPfa9QD9ahLGbRsLOyCl3/IMKGFZZfZlsvGbYSey+OV0qN43
         Yfcw==
X-Gm-Message-State: AJIora9bCgazPfRxbK5X2pGPWZT1F+OtP61wOHT00K5f4jPYoi/8k36e
        u+Vf5nv/EGHbNIJonHok99wx/dbyhxc=
X-Google-Smtp-Source: AGRyM1v+4bR9gYj6JAeT+mRFItrp28XznEw9GJl9qynpALPR30+MKp6gAr8MvFSl3Y7pqnr3ptiI0A==
X-Received: by 2002:a05:6870:42c7:b0:f3:1803:6306 with SMTP id z7-20020a05687042c700b000f318036306mr166800oah.233.1655148244206;
        Mon, 13 Jun 2022 12:24:04 -0700 (PDT)
Received: from wintermute.localdomain (cpe-76-183-134-35.tx.res.rr.com. [76.183.134.35])
        by smtp.gmail.com with ESMTPSA id bf34-20020a056808192200b0032ba1b363d2sm3637274oib.55.2022.06.13.12.24.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jun 2022 12:24:03 -0700 (PDT)
From:   Chris Morgan <macroalpha82@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     devicetree@vger.kernel.org, contact@artur-rojek.eu,
        maccraft123mc@gmail.com, heiko@sntech.de,
        krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org,
        dmitry.torokhov@gmail.com, Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH v3 2/3] Input: adc-joystick - Add polled input device support
Date:   Mon, 13 Jun 2022 14:23:52 -0500
Message-Id: <20220613192353.696-3-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220613192353.696-1-macroalpha82@gmail.com>
References: <20220613192353.696-1-macroalpha82@gmail.com>
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
index 78ebca7d400a..dc01cd0214d2 100644
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
+	if (device_property_read_bool(dev, "adc-joystick,no-hardware-trigger"))
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

