Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 18E2651C462
	for <lists+linux-input@lfdr.de>; Thu,  5 May 2022 17:57:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1381497AbiEEQA0 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 5 May 2022 12:00:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1381478AbiEEQAY (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 5 May 2022 12:00:24 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 515CE59BA2
        for <linux-input@vger.kernel.org>; Thu,  5 May 2022 08:56:44 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id y3so9526835ejo.12
        for <linux-input@vger.kernel.org>; Thu, 05 May 2022 08:56:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5FXIG1Rp9D4NgAZ2oOx6JgdhKdrDvM+0LjdQT4OHOI8=;
        b=asmYyZ1uqbz/6UfC4APhsaQDL+Xo2KIGm63Q8n3sY3AZyDHNETreND5tJrcgd3POJR
         z16WLNDMtMBHIFieY/3EZCE4VCfvUt77YQQtydkChnleODiYBprvtoN9UBS2Dq4pTCAl
         6Hk3oEWiJ/hQ+jL7PCCMzfVx3mk7sM4cGhiQg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5FXIG1Rp9D4NgAZ2oOx6JgdhKdrDvM+0LjdQT4OHOI8=;
        b=gpdz7PqVE/W+eyUEQA7fwcYIV+9fqD0kGdyADytW1SrOyD1odAzqwiXefxJQoWIKhx
         SKWj+zCcMQcpPm3Vmv/ujQTZA+Q74B16Do9w4YHX8ycPqUnHc4qEAuL4xlDhEx1fE3pT
         CQiCY9loX+QkpOHz29wlc9ARbK+X8kJzXREe0yipoBMy9pTITOhjTk9rQDlcM5HRaNCB
         RU4mlUVwrlx1+1pKh81dIKNNjDaVX/Q/cLHX7i6tzTHPKciO52Yt9i2RiIAdXcTPR4k6
         XvDG28TiSzrVq3G0tTUdQgzCTGjLahjYodzxd+/HX5OVJqvfF8xqUJrtBVO5sLf/a0QO
         +0kA==
X-Gm-Message-State: AOAM531gqsYs6b+sU47gQ+FfkdGe5xmCY9XrjbDlPqsiG86kX8x5OQ8Z
        hqy53B8UL3P409MZFUoSXjF9Lg==
X-Google-Smtp-Source: ABdhPJxk2xLimIlWtTu5+Z+7YYTRzorLG6sg2IDJWygRE6+lTox6zzKuytcuFsQHPq6/EnuAIiCV2w==
X-Received: by 2002:a17:906:57c1:b0:6d6:da73:e9c0 with SMTP id u1-20020a17090657c100b006d6da73e9c0mr25625398ejr.45.1651766202804;
        Thu, 05 May 2022 08:56:42 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.pdxnet.pdxeng.ch (host-87-0-15-73.retail.telecomitalia.it. [87.0.15.73])
        by smtp.gmail.com with ESMTPSA id a4-20020aa7d904000000b0042617ba6385sm1009328edr.15.2022.05.05.08.56.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 May 2022 08:56:42 -0700 (PDT)
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
Date:   Thu,  5 May 2022 17:56:31 +0200
Message-Id: <20220505155635.419653-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220505155635.419653-1-dario.binacchi@amarulasolutions.com>
References: <20220505155635.419653-1-dario.binacchi@amarulasolutions.com>
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

