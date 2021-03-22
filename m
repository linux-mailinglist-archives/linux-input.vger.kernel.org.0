Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 48348345251
	for <lists+linux-input@lfdr.de>; Mon, 22 Mar 2021 23:14:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229933AbhCVWO0 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 22 Mar 2021 18:14:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230008AbhCVWNy (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 22 Mar 2021 18:13:54 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9A45C061574
        for <linux-input@vger.kernel.org>; Mon, 22 Mar 2021 15:13:53 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id g8so16579825lfv.12
        for <linux-input@vger.kernel.org>; Mon, 22 Mar 2021 15:13:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QG4pJPzpaQNgceNKTVM3fAPhn89r0E2revH+Of2LXuo=;
        b=FczkD41gsRJbUoAKiQ02Pu/9OECmGnQjTQlg580HvxxH24QuLVv8VL1dxrBjCa9ikv
         m6L2Boo7s0dCjQH3tb5QbkIfnIeWdGSLv5JJhrl95/9h0XNfyrcN/EMZDnfcXijPXvIs
         wsJHaGhz5617YOE1wKsjL/oJ1NcstWXoL3bbICPr/JJpgCEPw7LlIS7VQNlv/VhstkCb
         rWSf3c5H9U6gAZXfjUv7lh4WBKWy/vihzwTu77k8zvr1YwMacWpTXmaKC/jhF0umTQ1s
         5RrvUuyt0ZzcaUZa4YQlHk6ZQNgTZBHdPXXTanRKGPKzf/ALfOzfHERRr7NsHWe5aUfB
         T+kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QG4pJPzpaQNgceNKTVM3fAPhn89r0E2revH+Of2LXuo=;
        b=FnDEdqQPrbj/7fWzFlIYlCx9DSTf/MjTTrvLdUyOefyO1uD6NkLvIP/IyNN/EFbT2g
         7LwnkPc6+qxD24E0/JxIPn51vdSVUIqrFLiN3lb72EwU1lwGnfVTBOlfRUGsYtL4X5pv
         36E7OgWazEaixsF3v9ehH72bIpsMeTM+Qz5EkOC9MavdLe7slpG+yInjBnxPcswVcX2y
         9Z3tC2sJgZLcB/NLJq72fiVkb37A+chXYB2pekITQM9U3FzAkPZU1f/Zwi0zd8E2YEoU
         b/BCDv2CKr5qZ02OpsPITmjBRsISWGlxtJqgqY+pWh8B8gwuLPEy+9gmTUIiGWln5Vjv
         QYIg==
X-Gm-Message-State: AOAM5306tuH9rPqELgzcQ3yBSG1Gm1cDHOQv1ay7Fyb8e7GpTOtnuyNL
        DtRj//RBUF85jPaSipoaMeN59QSKbLZxU0tLJ2Y=
X-Google-Smtp-Source: ABdhPJx/2RXdXDB8JncLhelTJojlM7hb0+D2RigoIiOD8MVXwcicrM1aAGVYxcXo2p+I3MKIq4X8zA==
X-Received: by 2002:ac2:5a1b:: with SMTP id q27mr748665lfn.189.1616451232145;
        Mon, 22 Mar 2021 15:13:52 -0700 (PDT)
Received: from localhost.localdomain (c-d7cb225c.014-348-6c756e10.bbcust.telenor.se. [92.34.203.215])
        by smtp.gmail.com with ESMTPSA id y11sm2133366ljc.18.2021.03.22.15.13.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Mar 2021 15:13:51 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Ferruh Yigit <fery@cypress.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org
Cc:     Henrik Rydberg <rydberg@bitmath.org>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] Input: cyttsp - Verbose error on soft reset
Date:   Mon, 22 Mar 2021 23:13:49 +0100
Message-Id: <20210322221349.1116666-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The first thing the Cypress driver does when starting
up is to try a soft reset. This is the first point where
the driver SPI/I2C communication can fail, so put out some
nice debug text:

  cyttsp-spi spi2.0: failed to send soft reset

Instead of just:

  cyttsp-spi: probe of spi2.0 failed with error -5

This is more helpful.

Cc: Ferruh Yigit <fery@cypress.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/input/touchscreen/cyttsp_core.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/input/touchscreen/cyttsp_core.c b/drivers/input/touchscreen/cyttsp_core.c
index 73c854f35f33..b9772192b5ea 100644
--- a/drivers/input/touchscreen/cyttsp_core.c
+++ b/drivers/input/touchscreen/cyttsp_core.c
@@ -248,12 +248,16 @@ static int cyttsp_soft_reset(struct cyttsp *ts)
 	enable_irq(ts->irq);
 
 	retval = ttsp_send_command(ts, CY_SOFT_RESET_MODE);
-	if (retval)
+	if (retval) {
+		dev_err(ts->dev, "failed to send soft reset\n");
 		goto out;
+	}
 
 	timeout = wait_for_completion_timeout(&ts->bl_ready,
 			msecs_to_jiffies(CY_DELAY_DFLT * CY_DELAY_MAX));
 	retval = timeout ? 0 : -EIO;
+	if (retval)
+		dev_err(ts->dev, "timeout waiting for soft reset\n");
 
 out:
 	ts->state = CY_IDLE_STATE;
-- 
2.29.2

