Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2CEF9715016
	for <lists+linux-input@lfdr.de>; Mon, 29 May 2023 21:55:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229621AbjE2TzS (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 29 May 2023 15:55:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229748AbjE2TzR (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 29 May 2023 15:55:17 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B5F911A
        for <linux-input@vger.kernel.org>; Mon, 29 May 2023 12:55:10 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-309382efe13so2261148f8f.2
        for <linux-input@vger.kernel.org>; Mon, 29 May 2023 12:55:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685390108; x=1687982108;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w0aZ5p38I8kGX/b4ujTIQb0+CgzOUSjO4R9Z3nmx/B0=;
        b=Nl5hN6WIcwrkM/W4vP0xtrM3JIaapuSG+YWFJdovnzE+q6WKTRQD0EccvJ16YgONZi
         /SipZIEFcxmiHlNlqnr2+VmU7ZNeu/PRmiWDdx2EpDrwMGs7Qq4Ytgb+Y6fNUPFS569I
         3v+l8w3uwjQ7X1a/NVKzfTYFdm4hHjw17OrXkEMX1uIOEBco0hvGrynBwly2umgWs4bn
         LoE+8xcsDGiKBq7ZL8zu4UOVWvKVIgNTK5n1+Jh/z2FOYn7QhV/lS/Xa0+PgYIQ4MCqN
         mB1BtvDg7AgcVbPwIjjtAfFH4gsCpSVFHDTXHjZuoKRW7zSNyaasDN913rDFI+9fjffS
         4ANw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685390108; x=1687982108;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w0aZ5p38I8kGX/b4ujTIQb0+CgzOUSjO4R9Z3nmx/B0=;
        b=VfWjE0nf784cjV3rlQaTqxUyGYzzt3wlbhvg1AVLbJ/wZo7A2F5L1s40iMx8izCPz7
         IkOWtql9ngW30FL37ocTzwKHzgHsuZATaeR4/5oyuRHAFFgpK4LQnTF+smcQQ8abVUTL
         j+5ZcwcC2a5U5bOYobb+hyb/oBs7gJfUPn66gDkfM8tBJjb0fGvigNc3nf5LjNNpVn3c
         hpTyLXpfywws/zW3DtuzbHMteidrOjfECvx+BkBmEV1gIFr0RwgNm+o1s3mHlenojhfC
         4nSltNkJiUvw5maVfusaOSlJEogoxghqNvt0cp9a1mlUVxjaBS4v8MD7W6xLXQhWPNkF
         OqIg==
X-Gm-Message-State: AC+VfDwWP6+cRcHFHlE6kT128aa89l7Cntn1v7I3WJyt1WRadOH/KESz
        6tTerjjoUCPBbuZF6HXD7e3LJA==
X-Google-Smtp-Source: ACHHUZ5scsnRAa6maUSyB+VGI1WUs37mgaAQKqz8cg8ttQni03kekKKe6WOhnuk1PRvBxDLPlT9Kaw==
X-Received: by 2002:a5d:6545:0:b0:306:32c4:7e7b with SMTP id z5-20020a5d6545000000b0030632c47e7bmr9098898wrv.41.1685390108735;
        Mon, 29 May 2023 12:55:08 -0700 (PDT)
Received: from lion.localdomain (cpc76484-cwma10-2-0-cust274.7-3.cable.virginm.net. [82.31.201.19])
        by smtp.gmail.com with ESMTPSA id t7-20020a5d4607000000b0030647449730sm887364wrq.74.2023.05.29.12.55.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 May 2023 12:55:08 -0700 (PDT)
From:   Caleb Connolly <caleb.connolly@linaro.org>
Date:   Mon, 29 May 2023 20:55:07 +0100
Subject: [PATCH 2/2] Input: pm8941-powerkey - fix debounce on gen2+ PMICs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230529-pm8941-pwrkey-debounce-v1-2-c043a6d5c814@linaro.org>
References: <20230529-pm8941-pwrkey-debounce-v1-0-c043a6d5c814@linaro.org>
In-Reply-To: <20230529-pm8941-pwrkey-debounce-v1-0-c043a6d5c814@linaro.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     linux-input@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        phone-devel@vger.kernel.org,
        Caleb Connolly <caleb.connolly@linaro.org>
X-Mailer: b4 0.13-dev-46309
X-Developer-Signature: v=1; a=openpgp-sha256; l=2348;
 i=caleb.connolly@linaro.org; h=from:subject:message-id;
 bh=921JPz9IiVwykXMRmrs9/Yug9/udoa0UJjhfiNsKYF4=;
 b=owEBbQKS/ZANAwAIAQWDMSsZX2S2AcsmYgBkdQMaOd/WMyUunFsyvX4zsfUwXfUwuiBLOZjKZ
 Bhlyi4jofSJAjMEAAEIAB0WIQS2UaFGPGq+0GkMVc0FgzErGV9ktgUCZHUDGgAKCRAFgzErGV9k
 tmO2D/9yRPBbl07O79CjqtknN1c0Dx2W7x9CpRo90zxJe9EQr1GRO1+NFD4v9Zy4ujlxJuo7Hyh
 np+RVQP+bpzbelXslgsDZjYp7fTz0y2Df8dBkoDZP4RKxhSKK5JVe0onmj5eqokOEDE37BQL6RS
 Lt9XY1DRm9Ay3O35WHc4GRYjl58QSE0PcP5Oct/m8fHGvrY+z7mhatURr72SpC4WVjaJFxdESqk
 /GU8Edtcb/wRkDczVuB2ojmN9fM3o0xcPTDuwDE3SkOe5RPOHs3S1CVS99wLYEIBEsL7frDtvOJ
 RwILxNyE1oxEaDDNfp+WHAmM9yP+/XOM4Lm5DYf07n/Gh8xDh/DUG2bN6t9/FdBN/kzEf5ttFOm
 tK/k0MsAt2DEM0PMVAG2qrWn74uqi0w65FQHiBAMOwk28qDQz/cT7rBXWfR8r6Gs6QMCDtxnxnG
 TxiQz8220pmIZALwnj7eOLwqMrohgYiyt7UFggMUtyb/2zT+JECYgiFVq6Mqcqdo9QfBMC3MOjy
 0SpzHW1aEu9OmEF6XBbooBefdLIn/eEbEpWzSbUQMRK9tCLpgtT5ZmmVSFCyqm3DuZjZmuMEuss
 KnPalhVKgkrDl0//20kHTGG7sGDRtznwkm5rUTSpbJD4IRRRCu7cDdBKWEob8t6BWBQgOlbuRRv
 NWYWDUhq+q0dJZg==
X-Developer-Key: i=caleb.connolly@linaro.org; a=openpgp;
 fpr=83B24DA7FE145076BC38BB250CD904EB673A7C47
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Since PM8998/PM660, the power key debounce register was redefined to
support shorter debounce times. On PM8941 the shortest debounce time
(represented by register value 0) was 15625us, on PM8998 the shortest
debounce time is 62us, with the default being 2ms.

Adjust the bit shift to correctly program debounce on PM8998 and newer.

Fixes: 68c581d5e7d8 ("Input: add Qualcomm PM8941 power key driver")
Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
---
This patch shouldn't be backported earlier then 5.4, as that is the
first kernel with support for PM8998.
---
 drivers/input/misc/pm8941-pwrkey.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/drivers/input/misc/pm8941-pwrkey.c b/drivers/input/misc/pm8941-pwrkey.c
index b6a27ebae977..74d77d8aaeff 100644
--- a/drivers/input/misc/pm8941-pwrkey.c
+++ b/drivers/input/misc/pm8941-pwrkey.c
@@ -50,7 +50,10 @@
 #define  PON_RESIN_PULL_UP		BIT(0)
 
 #define PON_DBC_CTL			0x71
-#define  PON_DBC_DELAY_MASK		0x7
+#define  PON_DBC_DELAY_MASK_GEN1	0x7
+#define  PON_DBC_DELAY_MASK_GEN2	0xf
+#define  PON_DBC_SHIFT_GEN1		6
+#define  PON_DBC_SHIFT_GEN2		14
 
 struct pm8941_data {
 	unsigned int	pull_up_bit;
@@ -247,7 +250,7 @@ static int pm8941_pwrkey_probe(struct platform_device *pdev)
 	struct device *parent;
 	struct device_node *regmap_node;
 	const __be32 *addr;
-	u32 req_delay;
+	u32 req_delay, mask, delay_shift;
 	int error;
 
 	if (of_property_read_u32(pdev->dev.of_node, "debounce", &req_delay))
@@ -336,12 +339,20 @@ static int pm8941_pwrkey_probe(struct platform_device *pdev)
 	pwrkey->input->phys = pwrkey->data->phys;
 
 	if (pwrkey->data->supports_debounce_config) {
-		req_delay = (req_delay << 6) / USEC_PER_SEC;
+		if (pwrkey->subtype >= PON_SUBTYPE_GEN2_PRIMARY) {
+			mask = PON_DBC_DELAY_MASK_GEN2;
+			delay_shift = PON_DBC_SHIFT_GEN2;
+		} else {
+			mask = PON_DBC_DELAY_MASK_GEN1;
+			delay_shift = PON_DBC_SHIFT_GEN1;
+		}
+
+		req_delay = (req_delay << delay_shift) / USEC_PER_SEC;
 		req_delay = ilog2(req_delay);
 
 		error = regmap_update_bits(pwrkey->regmap,
 					   pwrkey->baseaddr + PON_DBC_CTL,
-					   PON_DBC_DELAY_MASK,
+					   mask,
 					   req_delay);
 		if (error) {
 			dev_err(&pdev->dev, "failed to set debounce: %d\n",

-- 
2.40.1

