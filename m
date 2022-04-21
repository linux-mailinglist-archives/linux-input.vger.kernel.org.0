Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 42F7150A8A7
	for <lists+linux-input@lfdr.de>; Thu, 21 Apr 2022 21:02:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1391675AbiDUTDi (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 21 Apr 2022 15:03:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1391687AbiDUTDf (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 21 Apr 2022 15:03:35 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C78BC48E72
        for <linux-input@vger.kernel.org>; Thu, 21 Apr 2022 12:00:41 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id s18so11998727ejr.0
        for <linux-input@vger.kernel.org>; Thu, 21 Apr 2022 12:00:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5FXIG1Rp9D4NgAZ2oOx6JgdhKdrDvM+0LjdQT4OHOI8=;
        b=MaR3Nh0a44PUeP4GD3N3fQzpOlKuDClTPxLe42jw/eCBgTgd5mP96liXIDHRTXppE6
         ixs8Ql1juGJM6TIDGV2+bJ9iYvfZ00PBMmh1w8O1yGdYwLdAzEODqrF9D0bSqvGeq50m
         sW/4spg0aTemVpI+udSkE8CjxlOk3WfAac4+4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5FXIG1Rp9D4NgAZ2oOx6JgdhKdrDvM+0LjdQT4OHOI8=;
        b=IQXmsoraVAQSKA8TwIzND2Zlfxst74xLQ23jDcxkGAsK5icWSvQVqCvVV3MPpJ1qpY
         RmWEsv6+8aABJS5eIpxRSrGdj/iCgBVdUQUqGC2rZNgofkaoS99b5P9WDXYSWrF6l0dS
         bIAyyF+XxDRr3EouNDPDWLv0diNNYBK2snu9Jf/ar0Rlt+WCnAgfh2hfmv+Ggczr2y6V
         3lX9M6AK9LbnGHiugmyNJUeiuzAUzSRKHeZ/vv24Se8Xb5y2YW/on+6285iRY2tZ6OBk
         bOGJB4/ht4lBaWr9rY5oUe/qKlrSbH4VtJzTRc9EML938/EEq+fIu9mR9bEgujSVdidL
         AkPg==
X-Gm-Message-State: AOAM530bpLJ5IheYCQd2FHlBebn5T7j2u/Li89IzzXQyBKOum3vifUFr
        nZfLgrvnZXCXEY83VYRTvCpqfA==
X-Google-Smtp-Source: ABdhPJxoL9Wtl1u17AlU4k2DNhoDrILAoq0+heR0L3nJccvzIFmIBYZJqw8kj58yiZXBbRQhzIKFIg==
X-Received: by 2002:a17:907:1b19:b0:6f0:1022:1430 with SMTP id mp25-20020a1709071b1900b006f010221430mr843589ejc.13.1650567640396;
        Thu, 21 Apr 2022 12:00:40 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com (host-87-0-15-73.retail.telecomitalia.it. [87.0.15.73])
        by smtp.gmail.com with ESMTPSA id s11-20020a170906284b00b006e108693850sm7975142ejc.28.2022.04.21.12.00.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Apr 2022 12:00:34 -0700 (PDT)
From:   Dario Binacchi <dario.binacchi@amarulasolutions.com>
To:     linux-kernel@vger.kernel.org
Cc:     Dario Binacchi <dario.binacchi@amarulasolutions.com>,
        Michael Trimarchi <michael@amarulasolutions.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Oliver Graute <oliver.graute@kococonnector.com>,
        Stephan Gerhold <stephan@gerhold.net>,
        linux-input@vger.kernel.org
Subject: [RESEND PATCH v4 2/6] Input: edt-ft5x06 - get/set M12 report rate by sysfs
Date:   Thu, 21 Apr 2022 20:59:59 +0200
Message-Id: <20220421190003.3228699-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220421190003.3228699-1-dario.binacchi@amarulasolutions.com>
References: <20220421190003.3228699-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
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

