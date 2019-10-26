Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D8FD1E5F1C
	for <lists+linux-input@lfdr.de>; Sat, 26 Oct 2019 20:59:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726528AbfJZS7z (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 26 Oct 2019 14:59:55 -0400
Received: from mail-qk1-f195.google.com ([209.85.222.195]:36139 "EHLO
        mail-qk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726393AbfJZS7z (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 26 Oct 2019 14:59:55 -0400
Received: by mail-qk1-f195.google.com with SMTP id y189so4882583qkc.3
        for <linux-input@vger.kernel.org>; Sat, 26 Oct 2019 11:59:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=iiUFxX0X0PI/CBzDHsfQ3SYb316BMLzdPJvSp77pueI=;
        b=tZD1lmaf70N2ac7C7/ChARaA+jiFFveUGo0ZPl6muNk6sNzkRZRyIP2fbXe269uFEH
         MvphBsZR1mWLvMHl1Q4+/wemiB3jwMF1tSr9wzpYe0XxuhgNLlaIm7OHm8uT5Rxv8O7R
         /QSd+00+vOhVvTDddBVcfIUPlsR42OXf92XtfV6SJxwE/trdG0fjhvu3MJWK1YIfT2GS
         70RLHOMpWv/FVMzSSpwcslGc2HuRlP9Bo4cDC4/eEjeOwf1leLgEDDdkYZrK9RH5ndqN
         9uINHD7cSqidQ42+42sovXNwHHwDSolzv+vO5epasVgpHoBBu1kbsqyEMAKPrU3qQTSM
         hm4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=iiUFxX0X0PI/CBzDHsfQ3SYb316BMLzdPJvSp77pueI=;
        b=ZhAO6XGbz0n+BQN0D9I+U0x8zuYTSctH5uf1XKj3zpx9+lQwyKWGgzMYjk15dPdCvs
         eN4kOs/PeTRoxX0jWev+ya0Ut8Dq4SsyVIikD6Erq0xI0rUqOcRE+qriVAzLwBSNaRml
         ZMJ0dYgJuK6+qH0mAQHGOeMjsIapkKz9MfUoOuDryP5uoqeM3O1PcoL3HCXoCzQFiWb+
         xVdDYNQvaw8G4LF/ENwz8DIJnbcjIWkdeM7/W3Yz3PdukPMtDrwsDiWqSSoEZSL4D9wJ
         A8y6ZCt/FfSDPkE8uAVIZAPd1Yc4bJEVNL2ClrSlSJlNZTX/PqRHiUQ968JUbYCMi3Rc
         jE5A==
X-Gm-Message-State: APjAAAWRf+M20Y/3k0vpt9uOIl0xErKetOvh7S70Hlo8cPBkcQaDpUxb
        h2Oz/Ha0lmFDJZVUwYg7XVZweNlGi2U=
X-Google-Smtp-Source: APXvYqxBJpLXXuVyTX+b2i5ldY5L3X2e/+GZQI+b5hDHh3KiTIXr0cf/0ntkN2ypACVSklXfaHxLvw==
X-Received: by 2002:a37:4e81:: with SMTP id c123mr8600020qkb.468.1572116394720;
        Sat, 26 Oct 2019 11:59:54 -0700 (PDT)
Received: from fabio-Latitude-E5450.nxp.com ([2804:14c:482:99:1a50:482f:3e7:284a])
        by smtp.gmail.com with ESMTPSA id y29sm3991798qtc.8.2019.10.26.11.59.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Oct 2019 11:59:53 -0700 (PDT)
From:   Fabio Estevam <festevam@gmail.com>
To:     dmitry.torokhov@gmail.com
Cc:     linux-input@vger.kernel.org, Fabio Estevam <festevam@gmail.com>
Subject: [PATCH 1/3] Input: colibri-vf50-ts - remove unneeded gpio.h header file
Date:   Sat, 26 Oct 2019 15:59:56 -0300
Message-Id: <20191026185958.24158-1-festevam@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The touchscreen device is a GPIO consumer, not a GPIO controller,
so there is no need to include <linux/gpio.h>.

Remove the unneeded header file.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 drivers/input/touchscreen/colibri-vf50-ts.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/input/touchscreen/colibri-vf50-ts.c b/drivers/input/touchscreen/colibri-vf50-ts.c
index 0e40897949bb..aa829725ded7 100644
--- a/drivers/input/touchscreen/colibri-vf50-ts.c
+++ b/drivers/input/touchscreen/colibri-vf50-ts.c
@@ -9,7 +9,6 @@
 
 #include <linux/delay.h>
 #include <linux/err.h>
-#include <linux/gpio.h>
 #include <linux/gpio/consumer.h>
 #include <linux/iio/consumer.h>
 #include <linux/iio/types.h>
-- 
2.17.1

