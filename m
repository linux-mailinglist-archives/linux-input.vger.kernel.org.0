Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5CB7C6E4FF
	for <lists+linux-input@lfdr.de>; Fri, 19 Jul 2019 13:22:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726711AbfGSLWD (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 19 Jul 2019 07:22:03 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:43224 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726076AbfGSLWD (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 19 Jul 2019 07:22:03 -0400
Received: by mail-pf1-f194.google.com with SMTP id i189so14053526pfg.10;
        Fri, 19 Jul 2019 04:22:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ieRA0ATlD9ptZAEwZvM9IvsAcQiwaPnKguGMs+HECQQ=;
        b=fOJKnzDxOpqOstOZtgHjAo71WcHTkC0xuFG8DLt9KjGHQHESnuRFzp2G3xm84OFyuA
         Be1b+2a4ruhEcNLKStmWPJXUMkyCJWZBX2/u/X4aWr6Imm2fT7SDfeCQq4frDvhnCIjD
         D63ACqrjjub03Mfzz8XTB4CEgP26cIAigtqp41GjXDhmeNr0LHUSjpDZl7C4VZRnrixD
         A/zW+6UU5HEew75V2UnnH1jGIewxFascvE2ATObqp/UQjZuDtoqccEXwOczqZccO08IO
         rmZtwWSrEzuSV5JXilYFhGYongChhM2MZcgdEDZpmcrLc89vTbZWmF5bGgjDpOApFs51
         Lklw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ieRA0ATlD9ptZAEwZvM9IvsAcQiwaPnKguGMs+HECQQ=;
        b=i2B7lc16UOqQCcINthUq9AFoZP8O2KTlODS6lwwh4JNIL+s3qnbv0x/5VDiJntHHKx
         /vA5lzMQSwso3uHC+k5VVCtWiipgA1YTSBoo+Ppo57Sh55oSwBMytPTQwotQBCp6Tlsm
         jC+zEf6Ji0y5u9yl4RUQBCY8YmMr1WROmR95YZ2292KUZG2B+tk3vaDMu8IJ219c7Vy6
         fgbHB0TzZl8c5jaFRnuvkrJAIlMVNsFxY/ppNDGFevgFBJlnpcUlJfHKElq+pLVzBirg
         +nY+RSPGthVrplULCpjIHVb6Lm6YMihlQsMS5D/SNPKllhAWk1mGGeOuijFn3ab4ru/m
         ZnSQ==
X-Gm-Message-State: APjAAAWoEHU3+IY71T+6Z623Qr/kefwC+KH+Nm3Pd/VZRr5OIA1XQhcp
        OEcZpS2LA0jX+u3eskWO3EJ6k4Hqem8=
X-Google-Smtp-Source: APXvYqzpXnNJs8iKpl1g8HQP0BOEt5zexq/EV9Wm8+Q4UEmOiQY+ILq6saomJIBTIpdQXV8xlgoOrA==
X-Received: by 2002:a17:90a:a116:: with SMTP id s22mr56826398pjp.47.1563535322986;
        Fri, 19 Jul 2019 04:22:02 -0700 (PDT)
Received: from suzukaze.ipads-lab.se.sjtu.edu.cn ([89.31.126.54])
        by smtp.gmail.com with ESMTPSA id g92sm36002504pje.11.2019.07.19.04.22.00
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 19 Jul 2019 04:22:02 -0700 (PDT)
From:   Chuhong Yuan <hslester96@gmail.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Chuhong Yuan <hslester96@gmail.com>
Subject: [PATCH] Input: mouse: Use dev_get_drvdata
Date:   Fri, 19 Jul 2019 19:21:44 +0800
Message-Id: <20190719112143.21694-1-hslester96@gmail.com>
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
 drivers/input/mouse/navpoint.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/input/mouse/navpoint.c b/drivers/input/mouse/navpoint.c
index 0b75248c8380..f47d278c2657 100644
--- a/drivers/input/mouse/navpoint.c
+++ b/drivers/input/mouse/navpoint.c
@@ -317,8 +317,7 @@ static int navpoint_remove(struct platform_device *pdev)
 
 static int __maybe_unused navpoint_suspend(struct device *dev)
 {
-	struct platform_device *pdev = to_platform_device(dev);
-	struct navpoint *navpoint = platform_get_drvdata(pdev);
+	struct navpoint *navpoint = dev_get_drvdata(dev);
 	struct input_dev *input = navpoint->input;
 
 	mutex_lock(&input->mutex);
@@ -331,8 +330,7 @@ static int __maybe_unused navpoint_suspend(struct device *dev)
 
 static int __maybe_unused navpoint_resume(struct device *dev)
 {
-	struct platform_device *pdev = to_platform_device(dev);
-	struct navpoint *navpoint = platform_get_drvdata(pdev);
+	struct navpoint *navpoint = dev_get_drvdata(dev);
 	struct input_dev *input = navpoint->input;
 
 	mutex_lock(&input->mutex);
-- 
2.20.1

