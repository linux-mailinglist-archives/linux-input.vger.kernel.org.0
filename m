Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D9B0B6E53F
	for <lists+linux-input@lfdr.de>; Fri, 19 Jul 2019 13:53:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726072AbfGSLx3 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 19 Jul 2019 07:53:29 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:34280 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726243AbfGSLx2 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 19 Jul 2019 07:53:28 -0400
Received: by mail-pf1-f195.google.com with SMTP id b13so14093738pfo.1;
        Fri, 19 Jul 2019 04:53:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7BQWVFk5xnfvY43V3HP4RUSBIEVm8NfFwU/OWhiUguc=;
        b=m14xS8Ld/wkugydyp1wPJICiD4EZ+GAzIwpCJUIwTOwmHroduRA2AOmXy/2OTSy/OH
         b2nY8TqpAn7eD29M+OJ7jQ0xs2NmYlTleUX8hIvZ4JCn4nOcKyWrTIoxOk7PHqw+2efO
         dVcoDfo17nQotY+imVuy8lIqw3klmXSskBNldqft1gmIyGmG2g8LMgOfs94K9S0arRIf
         88aZ0VvQhi3NEMoQlfBebxeqbKVZTAJhII1aoMMX1cydv8DwmHNwZh2ooqHmwapnuDPy
         aWNzM32UK/trXBmqx3+upJTFRdcUYLqJIoP5BmNjuyTF+4U5ThU/l2qwHix6qP6/il0H
         7N6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7BQWVFk5xnfvY43V3HP4RUSBIEVm8NfFwU/OWhiUguc=;
        b=P9qDg6maCC+ogAYcRtq2GEW5GI5t/9sLDFg2OYFQREGEvYBV+NwUNT9BwWq7lD/7WT
         +SqSLZQSXPRCYcQGKDMrjGO92WqjBe936FOi6PmQfMW9Rqs/SV+fRMqlYuqDpKn3sUUR
         ClIxTDejHeW9Z3/K3yedDEjLquRB4JRj+p32HE367BeDScfkU/0ovP4TaCAB5ClAADhm
         NMV6EppExeaXGLJxrpcaRFaiFmf4WBfzPugffwIb/r/F+1TF0iEe33j71bT2cwrskV2O
         1CVhFgvYGAFgqazT5lECsQe0DXCRDcICM60YX1xoMvNrz8VzoxAR6OSejQD/RjCZzxOb
         YHVg==
X-Gm-Message-State: APjAAAX/Cg2OTGXyzuvu+Lr18snDgLSjKIC81rnMH0rVT13ZDqQ6487H
        ZD2GNgSGt7Wd2pTDJGG5hsY=
X-Google-Smtp-Source: APXvYqwsybHi6eEwHb23QA32buHWpS8rl4ER9/dYM50aRVRtMMZZpWQTfL6OT5LSZ/rAAsXAj618tg==
X-Received: by 2002:a63:4c17:: with SMTP id z23mr14499235pga.167.1563537208055;
        Fri, 19 Jul 2019 04:53:28 -0700 (PDT)
Received: from suzukaze.ipads-lab.se.sjtu.edu.cn ([89.31.126.54])
        by smtp.gmail.com with ESMTPSA id v184sm30587380pfb.82.2019.07.19.04.53.25
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 19 Jul 2019 04:53:27 -0700 (PDT)
From:   Chuhong Yuan <hslester96@gmail.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        linux-input@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Chuhong Yuan <hslester96@gmail.com>
Subject: [PATCH] Input: touchscreen - Use dev_get_drvdata
Date:   Fri, 19 Jul 2019 19:53:08 +0800
Message-Id: <20190719115307.22124-1-hslester96@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

dev_get_drvdata is a simpler implementation comparing
to to_platform_device + platform_get_drvdata.
This makes the code simpler.

Signed-off-by: Chuhong Yuan <hslester96@gmail.com>
---
 drivers/input/touchscreen/imx6ul_tsc.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/input/touchscreen/imx6ul_tsc.c b/drivers/input/touchscreen/imx6ul_tsc.c
index e04eecd65bbb..655652f449ec 100644
--- a/drivers/input/touchscreen/imx6ul_tsc.c
+++ b/drivers/input/touchscreen/imx6ul_tsc.c
@@ -507,8 +507,7 @@ static int imx6ul_tsc_probe(struct platform_device *pdev)
 
 static int __maybe_unused imx6ul_tsc_suspend(struct device *dev)
 {
-	struct platform_device *pdev = to_platform_device(dev);
-	struct imx6ul_tsc *tsc = platform_get_drvdata(pdev);
+	struct imx6ul_tsc *tsc = dev_get_drvdata(dev);
 	struct input_dev *input_dev = tsc->input;
 
 	mutex_lock(&input_dev->mutex);
@@ -527,8 +526,7 @@ static int __maybe_unused imx6ul_tsc_suspend(struct device *dev)
 
 static int __maybe_unused imx6ul_tsc_resume(struct device *dev)
 {
-	struct platform_device *pdev = to_platform_device(dev);
-	struct imx6ul_tsc *tsc = platform_get_drvdata(pdev);
+	struct imx6ul_tsc *tsc = dev_get_drvdata(dev);
 	struct input_dev *input_dev = tsc->input;
 	int retval = 0;
 
-- 
2.20.1

