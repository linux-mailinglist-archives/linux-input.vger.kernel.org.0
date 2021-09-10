Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 08CAA406692
	for <lists+linux-input@lfdr.de>; Fri, 10 Sep 2021 06:50:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230205AbhIJEv6 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 10 Sep 2021 00:51:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230176AbhIJEv4 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 10 Sep 2021 00:51:56 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD2C7C061575;
        Thu,  9 Sep 2021 21:50:45 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id u11-20020a17090adb4b00b00181668a56d6so608573pjx.5;
        Thu, 09 Sep 2021 21:50:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bAkfFi1fbdwn5IY/EHFRuZsc/VEvo0VKSmcmcN7PbEg=;
        b=WaDc0x0F6G0+UIsQ7NvGXqOTbdjU6fp693YhaYC5pmMCBr9/iYbczQWgqHMG12j5wz
         rJ5dw4R52c6M5mBR0AihimcblbXV9Of5L91YqRbdMggeBVWl5X9KLFv/k+8d7T51Aa10
         CnK1dCUQCqGBPzvu8vOET1dVJHdl3SDfXQ8+itFlZJSNwrfRvi81//0A5k3MdyOjM10y
         1NxDDtFCmMr11WYEDJ5pz1PkD1i4kp5x2rFugnSfFstSgf2equDTxhFfAtCOYWpNvJmI
         Ga0K+ESrVT3OpHjo3I706tqPBkAAV0issQpVe9n5rQCaT9sIRWSAneuuXHtIHj83YoFR
         fe/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bAkfFi1fbdwn5IY/EHFRuZsc/VEvo0VKSmcmcN7PbEg=;
        b=7VaMwhodxj2FLliEDAsCSBykV4/2qUsbJFYT+8P+9GuvJQc3HGMKTFWkJFCoCDIpeC
         Q0T8mOiWsmFHgq0aBIeewv6xpPG1RejGO7nD0vGZZ4E7oHgzT5tyyD0YzztUgQorYjdf
         8eru+57VvcWNELD/0NOMcRqeTLSzlpCTDDPrG5fYlW/HWiWchmaFUXkZc0NJfP5exOLr
         qtDn+nqycK6vzY1Ec1K0jMchssS4bUdMM3qmY2rxhSL7mETLuMRqZKWSfVkWOh7eqTEh
         DO/B5SAOP02LH8OFll8zEI0IKYt45iZgTlBlSqSlnHnXrcjj8cBPJ1DIFAXDmfPmcgZJ
         q3+g==
X-Gm-Message-State: AOAM530zkARQfQ94+vCNvgL7psT90eucbvpuNh7N93XLq1YkKV/a4i7h
        A18C2xDlLiKS7M/c8TZEyC0k19rI0A0=
X-Google-Smtp-Source: ABdhPJwQODIGtnldg7G45GSgW2i/7U2ZSoT1vHTwLcApfI6/wOKvAtyHvs1e4gppEN+0t/qVmjiDiQ==
X-Received: by 2002:a17:902:bb10:b0:13a:3cc4:8242 with SMTP id im16-20020a170902bb1000b0013a3cc48242mr5831717plb.58.1631249445286;
        Thu, 09 Sep 2021 21:50:45 -0700 (PDT)
Received: from dtor-ws.mtv.corp.google.com ([2620:15c:202:201:acdc:1d22:e20a:2796])
        by smtp.gmail.com with ESMTPSA id y4sm3555477pjw.57.2021.09.09.21.50.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Sep 2021 21:50:44 -0700 (PDT)
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Daniel Mack <daniel@zonque.org>,
        Marco Felsch <m.felsch@pengutronix.de>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] Input: ads7846 - use input_set_capability()
Date:   Thu,  9 Sep 2021 21:50:38 -0700
Message-Id: <20210910045039.4020199-2-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.33.0.309.g3052b89438-goog
In-Reply-To: <20210910045039.4020199-1-dmitry.torokhov@gmail.com>
References: <20210910045039.4020199-1-dmitry.torokhov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Instead of manipulating capability bits directly use
input_set_capability(). Also stop setting EV_ABS explicitly as
input_set_abs_params() does it for us.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/touchscreen/ads7846.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/input/touchscreen/ads7846.c b/drivers/input/touchscreen/ads7846.c
index a018481e9d8b..0f973351bc67 100644
--- a/drivers/input/touchscreen/ads7846.c
+++ b/drivers/input/touchscreen/ads7846.c
@@ -1307,8 +1307,7 @@ static int ads7846_probe(struct spi_device *spi)
 	input_dev->id.bustype = BUS_SPI;
 	input_dev->id.product = pdata->model;
 
-	input_dev->evbit[0] = BIT_MASK(EV_KEY) | BIT_MASK(EV_ABS);
-	input_dev->keybit[BIT_WORD(BTN_TOUCH)] = BIT_MASK(BTN_TOUCH);
+	input_set_capability(input_dev, EV_KEY, BTN_TOUCH);
 	input_set_abs_params(input_dev, ABS_X,
 			pdata->x_min ? : 0,
 			pdata->x_max ? : MAX_12BIT,
-- 
2.33.0.309.g3052b89438-goog

