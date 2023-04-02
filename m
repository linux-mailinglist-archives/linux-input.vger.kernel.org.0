Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C74896D3A2B
	for <lists+linux-input@lfdr.de>; Sun,  2 Apr 2023 22:10:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230367AbjDBUK0 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 2 Apr 2023 16:10:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230300AbjDBUKW (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 2 Apr 2023 16:10:22 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DE2B93CA
        for <linux-input@vger.kernel.org>; Sun,  2 Apr 2023 13:10:20 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id h8so109530508ede.8
        for <linux-input@vger.kernel.org>; Sun, 02 Apr 2023 13:10:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1680466220;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AFjm9UZOr4B7pRsXgqjvbVyzqWT97tUm8W06JvPbgKQ=;
        b=O3nYWp+wncOn7KIYtTsObuYApJsAoEL4q+RnfvaUH7NaoUfBGA9w2AsigwGa8GK0LQ
         lOmWNaA7mk+nlJB47YhEmoIe7kfLHo6cvpaSiqhXyt/yYkQFqWgbcAzuh9/CKTrtvtnT
         CFxEU3X2w4DIFV4r9koGIseFEwOsrK8oONBdA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680466220;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AFjm9UZOr4B7pRsXgqjvbVyzqWT97tUm8W06JvPbgKQ=;
        b=YX9EaGP7NDuu9QeBazQmx1XYIwshyTf3e2Y+W/vl5LbDmvZP2PNdK+vMGUe0s0ZgOM
         AtT+uxSxJhwBO2ONcaSkK8XNlZtoGwAVclaHdadlLZ/FpAopSIiEqJc2y/8q0G4UaSxv
         5xxg0hVoACUs1eFckeq+5rRDOGlnzlEGID1MwO+V2fJZmhfd564a4RVm5JthJdBsQAQA
         eWQQGiDcCw1xEfEOZih5Er3sOhrqvapgWwV1aGzBYGFfm76BmHkOoFfyTgVAYGXWETi9
         Q+sGGzOJNRAUVNxlkC0TG92+BUwmAJwGJLMrv5p3J6PsFNtEIOiXFukSHEdtffK04Bmw
         x1ug==
X-Gm-Message-State: AAQBX9cghacT6Q4nFSjpRajGfgAZ4u36GSiWTVeACW4cHV2DNKRRtDSt
        L/qjOgsBCciEdCKvam8x0dihyQ==
X-Google-Smtp-Source: AKy350ZrfvKhl6J8wrlb8EkFs1zqWNhrUu1U+K4T+XQ/FIO4ncxFjBgu9CPs8BDDnrJduJJjUsAHyQ==
X-Received: by 2002:a17:907:84a:b0:947:87a2:31d7 with SMTP id ww10-20020a170907084a00b0094787a231d7mr13489859ejb.33.1680466220561;
        Sun, 02 Apr 2023 13:10:20 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-95-248-31-153.retail.telecomitalia.it. [95.248.31.153])
        by smtp.gmail.com with ESMTPSA id gl18-20020a170906e0d200b00924d38bbdc0sm3553127ejb.105.2023.04.02.13.10.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Apr 2023 13:10:20 -0700 (PDT)
From:   Dario Binacchi <dario.binacchi@amarulasolutions.com>
To:     linux-kernel@vger.kernel.org
Cc:     michael@amarulasolutions.com, linux-amarula@amarulasolutions.com,
        Dario Binacchi <dario.binacchi@amarulasolutions.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Oliver Graute <oliver.graute@kococonnector.com>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-input@vger.kernel.org
Subject: [PATCH 6/9] Input: edt-ft5x06 - don't print error messages with dev_dbg()
Date:   Sun,  2 Apr 2023 22:09:48 +0200
Message-Id: <20230402200951.1032513-7-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20230402200951.1032513-1-dario.binacchi@amarulasolutions.com>
References: <20230402200951.1032513-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

In some parts of the code, error messages were improperly printed with
dev_dbg() calls. In those cases, dev_dbg() has been replaced with
dev_err().

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 drivers/input/touchscreen/edt-ft5x06.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/input/touchscreen/edt-ft5x06.c b/drivers/input/touchscreen/edt-ft5x06.c
index 7d82f412ab15..89958881fca1 100644
--- a/drivers/input/touchscreen/edt-ft5x06.c
+++ b/drivers/input/touchscreen/edt-ft5x06.c
@@ -783,7 +783,7 @@ static ssize_t edt_ft5x06_debugfs_raw_data_read(struct file *file,
 
 	error = edt_ft5x06_register_write(tsdata, 0x08, 0x01);
 	if (error) {
-		dev_dbg(&client->dev,
+		dev_err(&client->dev,
 			"failed to write 0x08 register, error %d\n", error);
 		goto out;
 	}
@@ -797,13 +797,13 @@ static ssize_t edt_ft5x06_debugfs_raw_data_read(struct file *file,
 
 	if (val < 0) {
 		error = val;
-		dev_dbg(&client->dev,
+		dev_err(&client->dev,
 			"failed to read 0x08 register, error %d\n", error);
 		goto out;
 	}
 
 	if (retries == 0) {
-		dev_dbg(&client->dev,
+		dev_err(&client->dev,
 			"timed out waiting for register to settle\n");
 		error = -ETIMEDOUT;
 		goto out;
-- 
2.32.0

