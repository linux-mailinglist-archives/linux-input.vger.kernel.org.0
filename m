Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E4B8361E77
	for <lists+linux-input@lfdr.de>; Mon,  8 Jul 2019 14:33:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730753AbfGHMdy (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 8 Jul 2019 08:33:54 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:32830 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727373AbfGHMdx (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 8 Jul 2019 08:33:53 -0400
Received: by mail-pf1-f193.google.com with SMTP id g2so2762290pfq.0;
        Mon, 08 Jul 2019 05:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=wkiM+H4s5Fx2zqrRyd6RVHqMLlLu515oxV/wDuVW7xE=;
        b=EY1NmA6hWRJyv4POxlpAl4OgtUVmqKk+8xn744a/j0JiLrZ4JtJ9Hb+18Q4NA5nKly
         k/vOaAIUFJzq9//Syqexf97oOrgBMkO2nL7p+4eLo3cexQlkx333I1KTek01ts9m0+UL
         x0PaMazC4U4gadCehkaFamo3teuNBTuMeI1U1hnNCFlNZSumtPSCHYj1Wa2/A3oqKn7C
         wWElxde/U26KEd/rTRV/rhOW3wLic1LMy2XOrn/q+SB/+NNy5UeraJsmfjwkatFNRz//
         x8gbROb7WGNgLeaW+Y8UGdzF2vMe/UZpMiTo0k8jltXe6Q3QqvoUaNXenvqLhXYMzrY3
         M5MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=wkiM+H4s5Fx2zqrRyd6RVHqMLlLu515oxV/wDuVW7xE=;
        b=FhUmvpS5skrlRI+PkrjjNcrj6QFg72L83nBPoyE8J2uEDSPzaGK+CVbovXYVT40kf3
         go9y2RBMZqwdoTgBbvO150leMZ4CSpfU0JPRmyUFnmXH8ENk4fIRUVvV4QDuo0sl4gge
         6Cwzg7wB4rBtLaEzPsU+wSCCd00wK3rdwkPwkl/IDnwFzmIgsZRxJm6wh8q9xxzgrkkS
         eZuDvZFgE8mlhPc4YtHSeXIUt49Fo/3HAma1q+fnSQavGlpUeEFF2XevkeEJmB6LU4OZ
         8xlsOrXDeq9qjMdQ6fQnGg8YdXrVzxJLPjNxAJeTEFtBjQkYnUNPkvf5R3iE0r6uSUx5
         9SlA==
X-Gm-Message-State: APjAAAV0++cgnvl1+XXAa4DtOUMaPzO6aWctEg0ppIMKAhMux3ZXkFp+
        AxPHJoJLxv0LconnbY2S6GGgDMPFLKE=
X-Google-Smtp-Source: APXvYqyQji5KOWUy67+mrc5RjfQiyEnaGWn8m8OlZBjCTYvagSPwD/DTwI+AcjH7o+mltIP2bKojhA==
X-Received: by 2002:a17:90a:a410:: with SMTP id y16mr25449728pjp.62.1562589233228;
        Mon, 08 Jul 2019 05:33:53 -0700 (PDT)
Received: from hfq-skylake.ipads-lab.se.sjtu.edu.cn ([202.120.40.82])
        by smtp.googlemail.com with ESMTPSA id b24sm16551286pfd.98.2019.07.08.05.33.51
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 08 Jul 2019 05:33:52 -0700 (PDT)
From:   Fuqian Huang <huangfq.daxian@gmail.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Fuqian Huang <huangfq.daxian@gmail.com>
Subject: [PATCH 10/14] Input: auo-pixcir-ts - Replace devm_add_action() followed by failure action with devm_add_action_or_reset()
Date:   Mon,  8 Jul 2019 20:33:47 +0800
Message-Id: <20190708123347.12081-1-huangfq.daxian@gmail.com>
X-Mailer: git-send-email 2.11.0
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

devm_add_action_or_reset() is introduced as a helper function which 
internally calls devm_add_action(). If devm_add_action() fails 
then it will execute the action mentioned and return the error code.
This reduce source code size (avoid writing the action twice) 
and reduce the likelyhood of bugs.

Signed-off-by: Fuqian Huang <huangfq.daxian@gmail.com>
---
 drivers/input/touchscreen/auo-pixcir-ts.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/input/touchscreen/auo-pixcir-ts.c b/drivers/input/touchscreen/auo-pixcir-ts.c
index 8e48fbda487a..8e9f3b7b8180 100644
--- a/drivers/input/touchscreen/auo-pixcir-ts.c
+++ b/drivers/input/touchscreen/auo-pixcir-ts.c
@@ -602,9 +602,8 @@ static int auo_pixcir_probe(struct i2c_client *client,
 		return error;
 	}
 
-	error = devm_add_action(&client->dev, auo_pixcir_reset, ts);
+	error = devm_add_action_or_reset(&client->dev, auo_pixcir_reset, ts);
 	if (error) {
-		auo_pixcir_reset(ts);
 		dev_err(&client->dev, "failed to register reset action, %d\n",
 			error);
 		return error;
-- 
2.11.0

