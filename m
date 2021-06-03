Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8580C39993D
	for <lists+linux-input@lfdr.de>; Thu,  3 Jun 2021 06:39:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229810AbhFCEkc (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 3 Jun 2021 00:40:32 -0400
Received: from mail-pj1-f51.google.com ([209.85.216.51]:38701 "EHLO
        mail-pj1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229441AbhFCEkc (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 3 Jun 2021 00:40:32 -0400
Received: by mail-pj1-f51.google.com with SMTP id m13-20020a17090b068db02901656cc93a75so4728161pjz.3;
        Wed, 02 Jun 2021 21:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LUTD/0JVHZqpR5tku85xORtPHS0kkXWJ/rRsE1xJMms=;
        b=QSCbT58cY1IB4g29SGun7iPl3pfkbPujDh6tsThxphFEBHDwncc6hg1PG10StS70w7
         RIXgtiYHEpHiLZWoLvnfjSTsdSwrNxVaK1uAMcGR5YHE8U83eqU8uIgIjX5zcxuNHVbp
         GoGF/IC7IXhw3jVsgUBpRiJoT2iJ//Ki2YQVYftFuy66Z3l4gjjEEQwa0R42GQ44wv5n
         vCZGwJXCMUN6u8XDLb23iuEdAg40AYUTsR00ktzEr66DdPoOrTbhTbzkcbDY1J/qVrwe
         c4SLUPSKk0Q8S5Jdy5WqyzpCS6XteY5llGe09aJv0f5+r7tF7o5R08RFbEvjo5erOp99
         LYdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LUTD/0JVHZqpR5tku85xORtPHS0kkXWJ/rRsE1xJMms=;
        b=fXuJR/WT03Yxv+eRMqwo8TuGdmtWoWxOJdif5/PZouak0XV/+EcwJhugWbVL+2fXVP
         Zr/VjXqHYHta7RG62pxHemASr6fk+3h+y1vBg7SFpKz+dDl1yEAptOgaTpbUrO+vMZJs
         dKuNDd7oPCRc+aM1PDq7T2FQVjW03KAuw/SGh/UAkdO5DV1O6Rferk+DsmAaQbzTJDV4
         wy96E+iIQTCbw0CUOjbNuDoDpn/UmJy+WJH8am2B9QFOoXkNaJYQdgSqMbWfGSLjSzLA
         CLbW7zonvKnXyaKXB/AkZDbEGfZA/phcs4v6rC5NLXwBSZ9HWNrYhPmIOJXW8rEapNn2
         S4hQ==
X-Gm-Message-State: AOAM531OHjye5IZLLlERG80owPCBIhBCBzQvWCc5LLF9GJKa4RV8IB4d
        T61CM3QVioUwffENWyTb2QuHWKgkSgI=
X-Google-Smtp-Source: ABdhPJzjhttXQrMrtSGqxfZnLvLIlMor5yUi8W4MYQy/KFV+0pl0KaLDIqCmelZj+At/nbIYG60/Zg==
X-Received: by 2002:a17:90a:b782:: with SMTP id m2mr911189pjr.147.1622695051748;
        Wed, 02 Jun 2021 21:37:31 -0700 (PDT)
Received: from dtor-ws.mtv.corp.google.com ([2620:15c:202:201:fc6a:97ca:f00c:8377])
        by smtp.gmail.com with ESMTPSA id f28sm1132414pgb.12.2021.06.02.21.37.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jun 2021 21:37:30 -0700 (PDT)
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/7] Input: cy8ctmg110_ts - do not hard code interrupt trigger
Date:   Wed,  2 Jun 2021 21:37:21 -0700
Message-Id: <20210603043726.3793876-2-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.32.0.rc0.204.g9fa02ecfa5-goog
In-Reply-To: <20210603043726.3793876-1-dmitry.torokhov@gmail.com>
References: <20210603043726.3793876-1-dmitry.torokhov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Rely on the platform to set up interrupt polarity/type properly instead
of hard-coding falling edge.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/touchscreen/cy8ctmg110_ts.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/input/touchscreen/cy8ctmg110_ts.c b/drivers/input/touchscreen/cy8ctmg110_ts.c
index 691f35f1bdd7..d83257284537 100644
--- a/drivers/input/touchscreen/cy8ctmg110_ts.c
+++ b/drivers/input/touchscreen/cy8ctmg110_ts.c
@@ -221,8 +221,7 @@ static int cy8ctmg110_probe(struct i2c_client *client,
 	cy8ctmg110_set_sleepmode(ts, false);
 
 	err = request_threaded_irq(client->irq, NULL, cy8ctmg110_irq_thread,
-				   IRQF_TRIGGER_RISING | IRQF_ONESHOT,
-				   "touch_reset_key", ts);
+				   IRQF_ONESHOT, "touch_reset_key", ts);
 	if (err < 0) {
 		dev_err(&client->dev,
 			"irq %d busy? error %d\n", client->irq, err);
-- 
2.32.0.rc0.204.g9fa02ecfa5-goog

