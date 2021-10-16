Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24285430067
	for <lists+linux-input@lfdr.de>; Sat, 16 Oct 2021 07:26:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234949AbhJPF2K (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 16 Oct 2021 01:28:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230261AbhJPF2K (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 16 Oct 2021 01:28:10 -0400
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBCCEC061570;
        Fri, 15 Oct 2021 22:26:02 -0700 (PDT)
Received: by mail-pg1-x52c.google.com with SMTP id c4so3447243pgv.11;
        Fri, 15 Oct 2021 22:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=npYtXsG4o31tfZXhoAnSf4Vl6YEYR1oRFbKo5PAp3eg=;
        b=pxQ6Enzct9zzmY15WmvSA12NK1cNn10axW0XIQ91q+z87OQnwniyciYv60KCddggfS
         /1pD1MvVZThizOFoBBywlVrzMK9ef4N76RM+8o4z+pvzsoCxUZxHD/0oNj29mEQU27g2
         cyaUdNBfTtBRqAjsMPbfHZGjodTuar6Yf5n8mStwLnoarKhAUS6+iC7r4roJ2E9Gkkuy
         ADx2hFIklLrUmTk2UNxKf1C6Hw4laWN4m/b+mXMTfBoPhKRzmrQ6Hzu+XEeUKe1x0LUF
         MqeqQoe1Z+/WVnDPBkv/du6FhItqp+C7hZrary0/4dOuJOlYITz5uOUT71atuLqHdpUD
         +SgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=npYtXsG4o31tfZXhoAnSf4Vl6YEYR1oRFbKo5PAp3eg=;
        b=X/5dnQ7z+kwBKM1gZ9ZHOpoZmqCMQ0qQ/UMJV4NwRe+BaVhujSa0Id5cBksCdVrQsp
         YBCEriST5F2G60Og8hVGmfHAfN4wHd3132gwcFWrXY4FSyu9DQ4uTSo1EA85/Zm/ZsVf
         Jrm0GftRQ7q9Rom5d0cwv0qywco24I+yXzTQvYoLgjRIgOILSwVuZRYap34/2LLRW890
         7fp2SeO6H1nlBNKQ5TqP6Nsbs6cW0CvDHNDvm7JvcdjiZEOuzxROuaIaCpuspZjNI5EN
         iKCqPXSaAgE9frlIh2EXZAGusK0eTFf/KfznL3wyJ17m42LMQUNyA6IBHibUVHFFxDR5
         yQZw==
X-Gm-Message-State: AOAM5306pRBG0zGJXGizQkwGXIHUCdSwh0Ef0Y3Hq5Ka7zxoJjUvw8B6
        DkexfeDm3GyExDnA8EipY0oB3gEyqxM=
X-Google-Smtp-Source: ABdhPJxIUhZWbntZ1ye7mxoyI4IveyuzkTvf0RA5k/ibuleg0S3jpNefGHifCTDrgv5FPebLZ5gnfg==
X-Received: by 2002:a62:4d42:0:b0:44b:3078:7387 with SMTP id a63-20020a624d42000000b0044b30787387mr15678717pfb.27.1634361961352;
        Fri, 15 Oct 2021 22:26:01 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:6a02:4736:3b83:a269])
        by smtp.gmail.com with ESMTPSA id y1sm6443114pfo.104.2021.10.15.22.26.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Oct 2021 22:26:00 -0700 (PDT)
Date:   Fri, 15 Oct 2021 22:25:58 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, Sebastian Reichel <sre@kernel.org>
Subject: [PATCH] Input: cpcap-pwrbutton - do not set input parent explicitly
Message-ID: <YWpiZqrfC9+GQsM4@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

We are using devm_input_allocate_device() that already sets parent
of the input device, there is no need to do that again.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/misc/cpcap-pwrbutton.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/input/misc/cpcap-pwrbutton.c b/drivers/input/misc/cpcap-pwrbutton.c
index 372cb44d0635..879790bbf9fe 100644
--- a/drivers/input/misc/cpcap-pwrbutton.c
+++ b/drivers/input/misc/cpcap-pwrbutton.c
@@ -77,7 +77,6 @@ static int cpcap_power_button_probe(struct platform_device *pdev)
 
 	button->idev->name = "cpcap-pwrbutton";
 	button->idev->phys = "cpcap-pwrbutton/input0";
-	button->idev->dev.parent = button->dev;
 	input_set_capability(button->idev, EV_KEY, KEY_POWER);
 
 	err = devm_request_threaded_irq(&pdev->dev, irq, NULL,
-- 
2.33.0.1079.g6e70778dc9-goog


-- 
Dmitry
