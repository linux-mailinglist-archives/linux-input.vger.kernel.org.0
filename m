Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C2E9753FA7F
	for <lists+linux-input@lfdr.de>; Tue,  7 Jun 2022 11:56:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240229AbiFGJ4N (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 7 Jun 2022 05:56:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240285AbiFGJ4K (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 7 Jun 2022 05:56:10 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F16AD6801
        for <linux-input@vger.kernel.org>; Tue,  7 Jun 2022 02:56:09 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id s1so277919wra.9
        for <linux-input@vger.kernel.org>; Tue, 07 Jun 2022 02:56:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5FXIG1Rp9D4NgAZ2oOx6JgdhKdrDvM+0LjdQT4OHOI8=;
        b=ewXyLD3UqIPbri3d3Epx/ZmHVw4kmGp4TWXET1A/krbuovskBBkvOZVhPknJVFKV1a
         aeSs3+P/swErSMIXx3c/+lcspyoCjpIwoDoEVASuK+cwRGejC75n7xGLJuNolhhXr7ZQ
         eBHoJPPvGL9p1XZdodxCZOvtU0JN57VWcliuw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5FXIG1Rp9D4NgAZ2oOx6JgdhKdrDvM+0LjdQT4OHOI8=;
        b=kIJ/t5n4Bm2OtnB1S5a957cRuShPEYgfN2MVfK2hRE94FnwLDs3aR8dJH+D4z8Xy4U
         0vu35H67SVvfO3S+2xWzac6lXRdNSuiCSKi/PVQsVeSvTnxgoGJBy7YheJxMoOa4ZVKV
         OUhd4xJlNEJzsjqyx/bZyQiOES3hdv9jQSxVlU97I4r2uoBHsJVRNAtweD1aMgF0Of5q
         wZFikct0WkqpdKFMnEn9cwnnjSu9QBkNJKO6uxSQLLu/tdYsA0/AN2xaRa7pT2am1Mx7
         R/vs2i9HVT804MrmTxq1UD2xTRA9WGYATwi7icEBpx8VmwvrHsYdOZhmKHnmNSpMMy18
         tMmg==
X-Gm-Message-State: AOAM531qtr9MImtApBpqFs4GKqhOiLI0uVGaNRwhSZARocdmQYYUXnSJ
        56x2SGsP7aBNFyiZTnq8YgvMbA==
X-Google-Smtp-Source: ABdhPJw7S1CHDV9dzULGPXNBpA7tqNRSYB3tkot1REE9Yc5K+Ctk7TUUjV1fwcg7urU9hU38dX2IwA==
X-Received: by 2002:adf:aa83:0:b0:210:2433:5c7c with SMTP id h3-20020adfaa83000000b0021024335c7cmr26617386wrc.340.1654595768161;
        Tue, 07 Jun 2022 02:56:08 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.pdxnet.pdxeng.ch (mob-5-90-137-51.net.vodafone.it. [5.90.137.51])
        by smtp.gmail.com with ESMTPSA id b12-20020a5d4b8c000000b0020feb9c44c2sm17693546wrt.20.2022.06.07.02.56.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jun 2022 02:56:07 -0700 (PDT)
From:   Dario Binacchi <dario.binacchi@amarulasolutions.com>
To:     linux-kernel@vger.kernel.org
Cc:     Dario Binacchi <dario.binacchi@amarulasolutions.com>,
        Michael Trimarchi <michael@amarulasolutions.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Oliver Graute <oliver.graute@kococonnector.com>,
        linux-input@vger.kernel.org
Subject: [RESEND PATCH v4 2/6] Input: edt-ft5x06 - get/set M12 report rate by sysfs
Date:   Tue,  7 Jun 2022 11:55:52 +0200
Message-Id: <20220607095556.1034338-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220607095556.1034338-1-dario.binacchi@amarulasolutions.com>
References: <20220607095556.1034338-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add support for reading/writing scan rate (SC) register for M12 by
sysfs. The register value is equal to the SC (Hz), unlike M06, where
instead it is equal to SC / 10.

Co-developed-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
Tested-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

(no changes since v1)

 drivers/input/touchscreen/edt-ft5x06.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/input/touchscreen/edt-ft5x06.c b/drivers/input/touchscreen/edt-ft5x06.c
index bb2e1cbffba7..77f061af5c61 100644
--- a/drivers/input/touchscreen/edt-ft5x06.c
+++ b/drivers/input/touchscreen/edt-ft5x06.c
@@ -47,6 +47,8 @@
 #define M09_REGISTER_NUM_X		0x94
 #define M09_REGISTER_NUM_Y		0x95
 
+#define M12_REGISTER_REPORT_RATE	0x88
+
 #define EV_REGISTER_THRESHOLD		0x40
 #define EV_REGISTER_GAIN		0x41
 #define EV_REGISTER_OFFSET_Y		0x45
@@ -523,9 +525,9 @@ static EDT_ATTR(offset_y, S_IWUSR | S_IRUGO, NO_REGISTER, NO_REGISTER,
 /* m06: range 20 to 80, m09: range 0 to 30, m12: range 1 to 255... */
 static EDT_ATTR(threshold, S_IWUSR | S_IRUGO, WORK_REGISTER_THRESHOLD,
 		M09_REGISTER_THRESHOLD, EV_REGISTER_THRESHOLD, 0, 255);
-/* m06: range 3 to 14, m12: (0x64: 100Hz) */
+/* m06: range 3 to 14, m12: range 1 to 255 */
 static EDT_ATTR(report_rate, S_IWUSR | S_IRUGO, WORK_REGISTER_REPORT_RATE,
-		NO_REGISTER, NO_REGISTER, 0, 255);
+		M12_REGISTER_REPORT_RATE, NO_REGISTER, 0, 255);
 
 static struct attribute *edt_ft5x06_attrs[] = {
 	&edt_ft5x06_attr_gain.dattr.attr,
@@ -1030,7 +1032,8 @@ static void edt_ft5x06_ts_set_regs(struct edt_ft5x06_ts_data *tsdata)
 	case EDT_M09:
 	case EDT_M12:
 		reg_addr->reg_threshold = M09_REGISTER_THRESHOLD;
-		reg_addr->reg_report_rate = NO_REGISTER;
+		reg_addr->reg_report_rate = tsdata->version == EDT_M12 ?
+			M12_REGISTER_REPORT_RATE : NO_REGISTER;
 		reg_addr->reg_gain = M09_REGISTER_GAIN;
 		reg_addr->reg_offset = M09_REGISTER_OFFSET;
 		reg_addr->reg_offset_x = NO_REGISTER;
-- 
2.32.0

