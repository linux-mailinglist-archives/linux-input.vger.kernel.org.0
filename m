Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E0D7D26941C
	for <lists+linux-input@lfdr.de>; Mon, 14 Sep 2020 19:51:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726120AbgINRvF (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 14 Sep 2020 13:51:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726114AbgINRuq (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 14 Sep 2020 13:50:46 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB463C06174A;
        Mon, 14 Sep 2020 10:50:45 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id o20so165397pfp.11;
        Mon, 14 Sep 2020 10:50:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=oCxGiwnFblUOdStsqywUVCRABxqKUUlGkpv5hbGrMug=;
        b=ltdQ1rxyPOmJTs5Qbw9ZYjv+MWkYYn8owPIqf4XVFXT0PonPt7PkBrwiaw8JdBOhnD
         CeOwzvviyv/4y82pu1Cfr/4uOdHKC5rAhOlIbbhUkSzQWNx/EHzp3GcRcfoidPGFGhar
         fxkbMQvEeP6YdylEWZUp5/kju8teGdBDFysae66NCi3M2tsdVmJDUQJNi7027Lg3N+6O
         KsyPs6XascC2w0mmuhPNUcc1nUk42rc2EsNOGNBfu3memZ+imYuEmHKE3aB/WzmX4y3P
         ISCUfe1ezHqM94525oXrKcQuLV+R/DnBwCq2kczjYYAwfHaEU3RETbO0oNa1WogA9Q5g
         G4dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=oCxGiwnFblUOdStsqywUVCRABxqKUUlGkpv5hbGrMug=;
        b=d1LJfhCcH2CL4NizOgZmdPC9E+mccDYs8V+oogXKWoFJa+f8XmnX0p/VF9HJDLpriL
         lqiE96mg6ByiP4Oun4NiN+pxTv6eL8uRuU21gkC1NeXOBLNnAHm/MBx96GFzfzXB7hhq
         pNmkyQ/1h4O2tPuL3il/WdMsvOBPut2FNHeABQJlWc1Cd07sLRltLf+06nFXR+zbbj0x
         lyjJVTR286+CEwBxvADI6sUthlUYsoIoEdR9OETKae6vs8BhyDDttjqYMYSFJxJp6f3L
         mHKwA/bOGNfI7ZHJJOt1LbgZHrV3Upw7+e+GeUCZjFnMvkC5EqBDoJ59p8wu7ATm/apJ
         kZTA==
X-Gm-Message-State: AOAM533eLELj3T9DZ8AZDrVqjvK+UzN7DqatleftUvIL4iqwKr5rfdts
        /JMDddn9YpGPI2VpcmJaIcH8lXyU8cw=
X-Google-Smtp-Source: ABdhPJxA6U40NyiwMY+MIy4+QfXSl2TKFcCMs30gADETXzHfFbVwfzZP665gb3w29H09D4wOQCCfaQ==
X-Received: by 2002:a17:902:8d8f:b029:d0:cc02:8527 with SMTP id v15-20020a1709028d8fb02900d0cc028527mr15212214plo.33.1600105845194;
        Mon, 14 Sep 2020 10:50:45 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id a13sm9310816pfi.139.2020.09.14.10.50.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2020 10:50:44 -0700 (PDT)
Date:   Mon, 14 Sep 2020 10:50:42 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] Input: imx6ul_tsc - unify open/close and PM paths
Message-ID: <20200914175042.GA1497032@dtor-ws>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Open/close and resume/suspend paths are very similar, let's factor out
common parts.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/touchscreen/imx6ul_tsc.c | 52 +++++++++++---------------
 1 file changed, 22 insertions(+), 30 deletions(-)

diff --git a/drivers/input/touchscreen/imx6ul_tsc.c b/drivers/input/touchscreen/imx6ul_tsc.c
index 5e6ba5c4eca2..cd369f9ac5e6 100644
--- a/drivers/input/touchscreen/imx6ul_tsc.c
+++ b/drivers/input/touchscreen/imx6ul_tsc.c
@@ -315,9 +315,8 @@ static irqreturn_t adc_irq_fn(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
-static int imx6ul_tsc_open(struct input_dev *input_dev)
+static int imx6ul_tsc_start(struct imx6ul_tsc *tsc)
 {
-	struct imx6ul_tsc *tsc = input_get_drvdata(input_dev);
 	int err;
 
 	err = clk_prepare_enable(tsc->adc_clk);
@@ -349,16 +348,29 @@ static int imx6ul_tsc_open(struct input_dev *input_dev)
 	return err;
 }
 
-static void imx6ul_tsc_close(struct input_dev *input_dev)
+static void imx6ul_tsc_stop(struct imx6ul_tsc *tsc)
 {
-	struct imx6ul_tsc *tsc = input_get_drvdata(input_dev);
-
 	imx6ul_tsc_disable(tsc);
 
 	clk_disable_unprepare(tsc->tsc_clk);
 	clk_disable_unprepare(tsc->adc_clk);
 }
 
+
+static int imx6ul_tsc_open(struct input_dev *input_dev)
+{
+	struct imx6ul_tsc *tsc = input_get_drvdata(input_dev);
+
+	return imx6ul_tsc_start(tsc);
+}
+
+static void imx6ul_tsc_close(struct input_dev *input_dev)
+{
+	struct imx6ul_tsc *tsc = input_get_drvdata(input_dev);
+
+	imx6ul_tsc_stop(tsc);
+}
+
 static int imx6ul_tsc_probe(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
@@ -509,12 +521,8 @@ static int __maybe_unused imx6ul_tsc_suspend(struct device *dev)
 
 	mutex_lock(&input_dev->mutex);
 
-	if (input_dev->users) {
-		imx6ul_tsc_disable(tsc);
-
-		clk_disable_unprepare(tsc->tsc_clk);
-		clk_disable_unprepare(tsc->adc_clk);
-	}
+	if (input_dev->users)
+		imx6ul_tsc_stop(tsc);
 
 	mutex_unlock(&input_dev->mutex);
 
@@ -530,27 +538,11 @@ static int __maybe_unused imx6ul_tsc_resume(struct device *dev)
 
 	mutex_lock(&input_dev->mutex);
 
-	if (!input_dev->users)
-		goto out;
-
-	retval = clk_prepare_enable(tsc->adc_clk);
-	if (retval)
-		goto out;
-
-	retval = clk_prepare_enable(tsc->tsc_clk);
-	if (retval) {
-		clk_disable_unprepare(tsc->adc_clk);
-		goto out;
-	}
+	if (input_dev->users)
+		retval = imx6ul_tsc_start(tsc);
 
-	retval = imx6ul_tsc_init(tsc);
-	if (retval) {
-		clk_disable_unprepare(tsc->tsc_clk);
-		clk_disable_unprepare(tsc->adc_clk);
-		goto out;
-	}
-out:
 	mutex_unlock(&input_dev->mutex);
+
 	return retval;
 }
 
-- 
2.28.0.618.gf4bc123cb7-goog


-- 
Dmitry
