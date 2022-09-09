Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 11B3D5B353E
	for <lists+linux-input@lfdr.de>; Fri,  9 Sep 2022 12:31:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230488AbiIIK2Y (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 9 Sep 2022 06:28:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231157AbiIIK2V (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 9 Sep 2022 06:28:21 -0400
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CCBC12F205
        for <linux-input@vger.kernel.org>; Fri,  9 Sep 2022 03:28:20 -0700 (PDT)
Received: by mail-pj1-x102b.google.com with SMTP id q15-20020a17090a304f00b002002ac83485so1152205pjl.0
        for <linux-input@vger.kernel.org>; Fri, 09 Sep 2022 03:28:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ecs-corp-partner-google-com.20210112.gappssmtp.com; s=20210112;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date;
        bh=dudaN+vQlPBdSJzNtdC8je441R+dRkrcZdvbH6gzK6o=;
        b=GyvQxiY/w91s0naf5u4nCgJth+JgxU7PiIRHwg1M2nASw77wKcmvilHtPwP+yvYbKC
         GrGTta2EiooFYTyvGqjdct5bzij5WNo5McezHCjswy0MNkOX/fHpmHYFBtM+QTw8MCd4
         vCuH08rZtNm5K7h3lJBo48kkvzwYCI1+ZYADLy73Bud6Yn9o3opOQgfsqlGjFJkT6CNS
         VzmEZFmrCsBRMe+5Cfps6TJuyrc+iLvF8Mcpvws6sbdf+0Kk7rbIZNlimSTbsYSfD+9A
         Q2wN3w/v+Xuy8SoGzazstKby6Yl3Qf7jCHAjq0Hc7KYIvs6CpnEYtkEJSBo0DD1AiTCE
         8Haw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date;
        bh=dudaN+vQlPBdSJzNtdC8je441R+dRkrcZdvbH6gzK6o=;
        b=y/FPyaHVP+ODW1repCfpD3wKg/THnZk1qJejs/JQoVG+7ahQaIb/4oB4MNs4ggOk75
         /A2RYqyy1O39AtGAm3uWroQa2ndOSMphrzURlteoHpTjWkA22Tc+e0hhiNF1AZ9rKMyc
         cbJFPp15Nm8ZNGpE6FQ2/f9aY53jsPLNKxHTe9idrzaIM4LjMv+BgngvJbOtv0DsqEw7
         kl/kEST/5t6Qwyexl1ICuHwJ0ArZHXFPpgkyZNOTR6fzDAke4nmS4agdCKA5ehcR8eTd
         Lcr3bTGPJ8zRcvzQPibpzWLYNYnu0ZK6/+LevyyF+K8B15w10UusDo6/BiU4JBftAhdp
         ACaQ==
X-Gm-Message-State: ACgBeo0MYRyJtdaGTTLnMXRfvt9sY+7gROOayxYk+Iw3cUKpcw+PflL0
        0JppCaqmEEs/9w6fwTgiKCQl4g==
X-Google-Smtp-Source: AA6agR74SLJNRgDh7EXqn5O6lou0t+YKwAvGJ0lXu5mgXosr5nxdp5gBXaPgpbg627lWslom8gojTw==
X-Received: by 2002:a17:902:7b8a:b0:172:9516:f15 with SMTP id w10-20020a1709027b8a00b0017295160f15mr13481676pll.92.1662719299472;
        Fri, 09 Sep 2022 03:28:19 -0700 (PDT)
Received: from localhost.localdomain ([103.150.184.130])
        by smtp.gmail.com with ESMTPSA id c12-20020a170902d48c00b0016bb24f5d19sm121476plg.209.2022.09.09.03.28.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Sep 2022 03:28:19 -0700 (PDT)
From:   Yunlong Jia <yunlong.jia@ecs.corp-partner.google.com>
X-Google-Original-From: Yunlong Jia <yunlong.jia@ecs.com.tw>
To:     LKML <linux-kernel@vger.kernel.org>
Cc:     Henry Sun <henrysun@google.com>,
        Douglas Anderson <dianders@chromium.org>,
        Bob Moragues <moragues@chromium.org>,
        Yunlong Jia <yunlong.jia@ecs.com.tw>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Johnny Chuang <johnny.chuang.emc@gmail.com>,
        linux-input@vger.kernel.org
Subject: [PATCH v3 2/2] input: touchscreen: elants_i2c: Add eth3915n touchscreen chip
Date:   Fri,  9 Sep 2022 10:27:55 +0000
Message-Id: <20220909102720.v3.2.I22ae48d8ee064456073a828393704809360c4368@changeid>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220909102720.v3.1.Ib599a6001558a4afd11016e7016d74dce748a749@changeid>
References: <20220909102720.v3.1.Ib599a6001558a4afd11016e7016d74dce748a749@changeid>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The eth3915n requires more delay time than the eth3500 when poweron
 & reset.
Define EKTH3915_POWERON_DELAY_MSEC as the poweron delay time of eth3915n,
 about 80ms.
Define EKTH3915_RESET_DELAY_MSEC as the reset delay time of eth3915n,
 about 300ms.

Signed-off-by: Yunlong Jia <yunlong.jia@ecs.com.tw>
Reviewed-by: Douglas Anderson <dianders@chromium.org>

---

Changes in v3:
 1. Add poweron delay time.

Changes in v2:
 1. Adjust the 'Signed-off-by'.

 drivers/input/touchscreen/elants_i2c.c | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/drivers/input/touchscreen/elants_i2c.c b/drivers/input/touchscreen/elants_i2c.c
index c9dd703b0c7d8..fb99dd10b0b6d 100644
--- a/drivers/input/touchscreen/elants_i2c.c
+++ b/drivers/input/touchscreen/elants_i2c.c
@@ -116,6 +116,8 @@
 
 #define ELAN_POWERON_DELAY_USEC	500
 #define ELAN_RESET_DELAY_MSEC	20
+#define EKTH3915_POWERON_DELAY_MSEC    80
+#define EKTH3915_RESET_DELAY_MSEC	300
 
 /* FW boot code version */
 #define BC_VER_H_BYTE_FOR_EKTH3900x1_I2C        0x72
@@ -133,6 +135,7 @@
 enum elants_chip_id {
 	EKTH3500,
 	EKTF3624,
+	EKTH3915,
 };
 
 enum elants_state {
@@ -664,6 +667,7 @@ static int elants_i2c_initialize(struct elants_data *ts)
 
 	switch (ts->chip_id) {
 	case EKTH3500:
+	case EKTH3915:
 		if (!error)
 			error = elants_i2c_query_ts_info_ekth(ts);
 		break;
@@ -1331,6 +1335,9 @@ static int elants_i2c_power_on(struct elants_data *ts)
 	if (IS_ERR_OR_NULL(ts->reset_gpio))
 		return 0;
 
+	if (ts->chip_id == EKTH3915)
+		msleep(EKTH3915_POWERON_DELAY_MSEC);
+
 	gpiod_set_value_cansleep(ts->reset_gpio, 1);
 
 	error = regulator_enable(ts->vcc33);
@@ -1361,7 +1368,17 @@ static int elants_i2c_power_on(struct elants_data *ts)
 	if (error)
 		return error;
 
-	msleep(ELAN_RESET_DELAY_MSEC);
+	if (ts->chip_id == EKTH3915)
+		/*
+		 * There need delay 300ms for power on sequence.
+		 * T1 + T2 + T3 >= 305 ms
+		 * T1: 0<time<500us
+		 * T2: >5ms
+		 * T3: >300ms
+		 */
+		msleep(EKTH3915_RESET_DELAY_MSEC);
+	else
+		msleep(ELAN_RESET_DELAY_MSEC);
 
 	return 0;
 }
@@ -1686,6 +1703,7 @@ static const struct i2c_device_id elants_i2c_id[] = {
 	{ DEVICE_NAME, EKTH3500 },
 	{ "ekth3500", EKTH3500 },
 	{ "ektf3624", EKTF3624 },
+	{ "ekth3915", EKTH3915 },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, elants_i2c_id);
@@ -1702,6 +1720,7 @@ MODULE_DEVICE_TABLE(acpi, elants_acpi_id);
 static const struct of_device_id elants_of_match[] = {
 	{ .compatible = "elan,ekth3500", .data = (void *)EKTH3500 },
 	{ .compatible = "elan,ektf3624", .data = (void *)EKTF3624 },
+	{ .compatible = "elan,ekth3915", .data = (void *)EKTH3915 },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, elants_of_match);
-- 
2.17.1

