Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 675AA4FC582
	for <lists+linux-input@lfdr.de>; Mon, 11 Apr 2022 22:06:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349809AbiDKUIf (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 11 Apr 2022 16:08:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349793AbiDKUId (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 11 Apr 2022 16:08:33 -0400
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com [199.106.114.38])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C3601FCE0;
        Mon, 11 Apr 2022 13:06:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1649707578; x=1681243578;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=SIh1YjWWILEjXTV7gBY+jEesPO7/uUQ+/LkPoLmCPNo=;
  b=HYqFc+xWxOsOZs4a18uPiEWSikjpepNSAyRRNd4y2SD5eyXBPOxNgt5j
   jt/MSDajNRX68u1GgjpCoCG3CxnGvhs6by7X4YLPPiJmuNvLJQeozQckn
   a7JusX6UPXsvD+1uFAU8vAkmRAwH1lN9keKIBBde4q9JZBjX/fhI60kgU
   0=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 11 Apr 2022 13:06:17 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg02-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2022 13:06:17 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Mon, 11 Apr 2022 13:06:16 -0700
Received: from hu-amelende-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Mon, 11 Apr 2022 13:06:16 -0700
From:   Anjelique Melendez <quic_amelende@quicinc.com>
To:     <dmitry.torokhov@gmail.com>, <corbet@lwn.net>, <sre@kernel.org>,
        <robh+dt@kernel.org>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <collinsd@codeaurora.org>,
        <bjorn.andersson@linaro.org>, <swboyd@chromium.org>,
        <skakit@codeaurora.org>, <linux-doc@vger.kernel.org>,
        <linux-pm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        Anjelique Melendez <quic_amelende@quicinc.com>
Subject: [PATCH v5 4/5] input: misc: pm8941-pwrkey: add software key press debouncing support
Date:   Mon, 11 Apr 2022 13:05:09 -0700
Message-ID: <20220411200506.22891-5-quic_amelende@quicinc.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220411200506.22891-1-quic_amelende@quicinc.com>
References: <20220411200506.22891-1-quic_amelende@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: David Collins <collinsd@codeaurora.org>

On certain PMICs, an unexpected assertion of KPDPWR_DEB (the
positive logic hardware debounced power key signal) may be seen
during the falling edge of KPDPWR_N (i.e. a power key press) when
it occurs close to the rising edge of SLEEP_CLK.  This then
triggers a spurious KPDPWR interrupt.

Handle this issue by adding software debouncing support to ignore
key events that occur within the hardware debounce delay after the
most recent key release event.

Signed-off-by: David Collins <collinsd@codeaurora.org>
Signed-off-by: Anjelique Melendez <quic_amelende@quicinc.com>
---
 drivers/input/misc/pm8941-pwrkey.c | 80 +++++++++++++++++++++++++++---
 1 file changed, 74 insertions(+), 6 deletions(-)

diff --git a/drivers/input/misc/pm8941-pwrkey.c b/drivers/input/misc/pm8941-pwrkey.c
index 43106e4cfd23..881943ab4d55 100644
--- a/drivers/input/misc/pm8941-pwrkey.c
+++ b/drivers/input/misc/pm8941-pwrkey.c
@@ -9,6 +9,7 @@
 #include <linux/input.h>
 #include <linux/interrupt.h>
 #include <linux/kernel.h>
+#include <linux/ktime.h>
 #include <linux/log2.h>
 #include <linux/module.h>
 #include <linux/of.h>
@@ -20,6 +21,16 @@
 
 #define PON_REV2			0x01
 
+#define PON_SUBTYPE			0x05
+
+#define PON_SUBTYPE_PRIMARY		0x01
+#define PON_SUBTYPE_SECONDARY		0x02
+#define PON_SUBTYPE_1REG		0x03
+#define PON_SUBTYPE_GEN2_PRIMARY	0x04
+#define PON_SUBTYPE_GEN2_SECONDARY	0x05
+#define PON_SUBTYPE_GEN3_PBS		0x08
+#define PON_SUBTYPE_GEN3_HLOS		0x09
+
 #define PON_RT_STS			0x10
 #define  PON_KPDPWR_N_SET		BIT(0)
 #define  PON_RESIN_N_SET		BIT(1)
@@ -59,9 +70,12 @@ struct pm8941_pwrkey {
 	struct input_dev *input;
 
 	unsigned int revision;
+	unsigned int subtype;
 	struct notifier_block reboot_notifier;
 
 	u32 code;
+	u32 sw_debounce_time_us;
+	ktime_t sw_debounce_end_time;
 	const struct pm8941_data *data;
 };
 
@@ -128,20 +142,63 @@ static irqreturn_t pm8941_pwrkey_irq(int irq, void *_data)
 {
 	struct pm8941_pwrkey *pwrkey = _data;
 	unsigned int sts;
-	int error;
+	int err;
 
-	error = regmap_read(pwrkey->regmap,
-			    pwrkey->baseaddr + PON_RT_STS, &sts);
-	if (error)
+	if (pwrkey->sw_debounce_time_us) {
+		if (ktime_before(ktime_get(), pwrkey->sw_debounce_end_time)) {
+			dev_dbg(pwrkey->dev, "ignoring key event received before debounce end %llu us\n",
+				pwrkey->sw_debounce_end_time);
+			return IRQ_HANDLED;
+		}
+	}
+
+	err = regmap_read(pwrkey->regmap, pwrkey->baseaddr + PON_RT_STS, &sts);
+	if (err)
 		return IRQ_HANDLED;
 
-	input_report_key(pwrkey->input, pwrkey->code,
-			 sts & pwrkey->data->status_bit);
+	sts &= pwrkey->data->status_bit;
+
+	if (pwrkey->sw_debounce_time_us && !sts)
+		pwrkey->sw_debounce_end_time = ktime_add_us(ktime_get(),
+						pwrkey->sw_debounce_time_us);
+
+	input_report_key(pwrkey->input, pwrkey->code, sts);
 	input_sync(pwrkey->input);
 
 	return IRQ_HANDLED;
 }
 
+static int pm8941_pwrkey_sw_debounce_init(struct pm8941_pwrkey *pwrkey)
+{
+	unsigned int val, addr, mask;
+	int error;
+
+	if (pwrkey->data->has_pon_pbs && !pwrkey->pon_pbs_baseaddr) {
+		dev_err(pwrkey->dev, "PON_PBS address missing, can't read HW debounce time\n");
+		return 0;
+	}
+
+	if (pwrkey->pon_pbs_baseaddr)
+		addr = pwrkey->pon_pbs_baseaddr + PON_DBC_CTL;
+	else
+		addr = pwrkey->baseaddr + PON_DBC_CTL;
+	error = regmap_read(pwrkey->regmap, addr, &val);
+	if (error)
+		return error;
+
+	if (pwrkey->subtype >= PON_SUBTYPE_GEN2_PRIMARY)
+		mask = 0xf;
+	else
+		mask = 0x7;
+
+	pwrkey->sw_debounce_time_us = 2 * USEC_PER_SEC / (1 << (mask - (val & mask)));
+
+	dev_dbg(pwrkey->dev, "SW debounce time = %u us\n",
+		pwrkey->sw_debounce_time_us);
+
+	return 0;
+}
+
 static int __maybe_unused pm8941_pwrkey_suspend(struct device *dev)
 {
 	struct pm8941_pwrkey *pwrkey = dev_get_drvdata(dev);
@@ -234,6 +291,13 @@ static int pm8941_pwrkey_probe(struct platform_device *pdev)
 		return error;
 	}
 
+	error = regmap_read(pwrkey->regmap, pwrkey->baseaddr + PON_SUBTYPE,
+			    &pwrkey->subtype);
+	if (error) {
+		dev_err(&pdev->dev, "failed to read subtype: %d\n", error);
+		return error;
+	}
+
 	error = of_property_read_u32(pdev->dev.of_node, "linux,code",
 				     &pwrkey->code);
 	if (error) {
@@ -268,6 +332,10 @@ static int pm8941_pwrkey_probe(struct platform_device *pdev)
 		}
 	}
 
+	error = pm8941_pwrkey_sw_debounce_init(pwrkey);
+	if (error)
+		return error;
+
 	if (pwrkey->data->pull_up_bit) {
 		error = regmap_update_bits(pwrkey->regmap,
 					   pwrkey->baseaddr + PON_PULL_CTL,
-- 
2.35.1

