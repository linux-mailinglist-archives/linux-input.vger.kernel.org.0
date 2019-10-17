Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E2CB6DB871
	for <lists+linux-input@lfdr.de>; Thu, 17 Oct 2019 22:42:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2502167AbfJQUmk (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 17 Oct 2019 16:42:40 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:35670 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2502467AbfJQUmk (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 17 Oct 2019 16:42:40 -0400
Received: by mail-pg1-f194.google.com with SMTP id p30so2035378pgl.2;
        Thu, 17 Oct 2019 13:42:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HlyTv1vxc6ePybQkoO4f5oM/4dcEruouJB05duaVKOg=;
        b=Etg86CwGZ+v3CIcN3+OB9F2ezo3lxulhWGvKvFJ/Khi2bemD+HihqF4RzcPR/QO/XU
         cEpINIkKoz4HldLf/AQwdqTskzwveI1ITM3xLiSULviKiFauPsIKhg3xgatCy00zN+41
         zwxYlUvUoJauPL6GJ2GyIgJ5OSJ7TMEVIdPIYBWLW+upLso81zbsRuX0//zV4lT0piAU
         FIP6XqLXzcXXX53tSCPMDnjByp0Ys0yaufH3JDRpCGNoMeRYLahuD9sYCDD/yugvJk1C
         Fm7GxgKzRfDPSbvUMxkVg6MVTIW8UpT87L6I8X7dn4f6mnbGSFicZ29tmmXpAfZ9+OLT
         WPNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HlyTv1vxc6ePybQkoO4f5oM/4dcEruouJB05duaVKOg=;
        b=mh/JoiBY02hrgyunRDWhArL1q1DyBGU0WgqL8XmYEpTcreK2jqJZtcRo54IH8TvarA
         FthzLXmGpKP3vyPkppofmW/tQIQJCxY6eTef7KyEJouDV0IH3W/vDmgUezw3eryIgp+i
         WqLcr+qOYSqE0wLLNEQVzeVgbFDivrAxAt0t/CDVsYB58GF34UqXpP3W130zoxRbAIwQ
         M8cte37ofZ6wSGZ/TM8d69UFY6kIvlCZtEU9QQbEBcapCQNcOSXjkWSZ/lK4Og5YKI8+
         MKzWJJchE5tYC6Pj6UYZbuRUvluF7TcnfQ82ITlo7wnYJv/egHSxLssqbQiV5hcs/DVl
         XSzg==
X-Gm-Message-State: APjAAAXJRyeunsycgSC9Nw8PIbHUZqpgyz/RwR/23s/jMzt8bLYr35b3
        BXVefyXEMp1AoChpkiCR78rsLJfA
X-Google-Smtp-Source: APXvYqx2rCUUL0uB7Oa8fpKv2VmOqEtr/L5iYRfOD3zpjZFO02ZAaJyVscUDv45qdl9E5OpiRTf61g==
X-Received: by 2002:a17:90a:858a:: with SMTP id m10mr6937186pjn.128.1571344958930;
        Thu, 17 Oct 2019 13:42:38 -0700 (PDT)
Received: from dtor-ws.mtv.corp.google.com ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id b3sm4626365pfd.125.2019.10.17.13.42.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2019 13:42:38 -0700 (PDT)
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     Allison Randal <allison@lohutok.net>,
        Jilayne Lovejoy <opensource@jilayne.com>,
        Steve Winslow <swinslow@gmail.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 13/22] Input: sgi_btns - switch to using managed resources
Date:   Thu, 17 Oct 2019 13:42:07 -0700
Message-Id: <20191017204217.106453-14-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.23.0.866.gb869b98d4c-goog
In-Reply-To: <20191017204217.106453-1-dmitry.torokhov@gmail.com>
References: <20191017204217.106453-1-dmitry.torokhov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Switching to devm API allows to clean up error handling paths and drop
the remove() method.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---

 drivers/input/misc/sgi_btns.c | 37 ++++++++---------------------------
 1 file changed, 8 insertions(+), 29 deletions(-)

diff --git a/drivers/input/misc/sgi_btns.c b/drivers/input/misc/sgi_btns.c
index 0fee6ddf3602..829277b4271f 100644
--- a/drivers/input/misc/sgi_btns.c
+++ b/drivers/input/misc/sgi_btns.c
@@ -45,7 +45,6 @@ static const unsigned short sgi_map[] = {
 };
 
 struct buttons_dev {
-	struct input_polled_dev *poll_dev;
 	unsigned short keymap[ARRAY_SIZE(sgi_map)];
 	int count[ARRAY_SIZE(sgi_map)];
 };
@@ -84,12 +83,13 @@ static int sgi_buttons_probe(struct platform_device *pdev)
 	struct input_dev *input;
 	int error, i;
 
-	bdev = kzalloc(sizeof(struct buttons_dev), GFP_KERNEL);
-	poll_dev = input_allocate_polled_device();
-	if (!bdev || !poll_dev) {
-		error = -ENOMEM;
-		goto err_free_mem;
-	}
+	bdev = devm_kzalloc(&pdev->dev, sizeof(*bdev), GFP_KERNEL);
+	if (!bdev)
+		return -ENOMEM;
+
+	poll_dev = devm_input_allocate_polled_device(&pdev->dev);
+	if (!poll_dev)
+		return -ENOMEM;
 
 	memcpy(bdev->keymap, sgi_map, sizeof(bdev->keymap));
 
@@ -101,7 +101,6 @@ static int sgi_buttons_probe(struct platform_device *pdev)
 	input->name = "SGI buttons";
 	input->phys = "sgi/input0";
 	input->id.bustype = BUS_HOST;
-	input->dev.parent = &pdev->dev;
 
 	input->keycode = bdev->keymap;
 	input->keycodemax = ARRAY_SIZE(bdev->keymap);
@@ -113,35 +112,15 @@ static int sgi_buttons_probe(struct platform_device *pdev)
 		__set_bit(bdev->keymap[i], input->keybit);
 	__clear_bit(KEY_RESERVED, input->keybit);
 
-	bdev->poll_dev = poll_dev;
-	platform_set_drvdata(pdev, bdev);
-
 	error = input_register_polled_device(poll_dev);
 	if (error)
-		goto err_free_mem;
-
-	return 0;
-
- err_free_mem:
-	input_free_polled_device(poll_dev);
-	kfree(bdev);
-	return error;
-}
-
-static int sgi_buttons_remove(struct platform_device *pdev)
-{
-	struct buttons_dev *bdev = platform_get_drvdata(pdev);
-
-	input_unregister_polled_device(bdev->poll_dev);
-	input_free_polled_device(bdev->poll_dev);
-	kfree(bdev);
+		return error;
 
 	return 0;
 }
 
 static struct platform_driver sgi_buttons_driver = {
 	.probe	= sgi_buttons_probe,
-	.remove	= sgi_buttons_remove,
 	.driver	= {
 		.name	= "sgibtns",
 	},
-- 
2.23.0.866.gb869b98d4c-goog

