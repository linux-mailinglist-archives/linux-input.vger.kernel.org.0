Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 537D5E5F1D
	for <lists+linux-input@lfdr.de>; Sat, 26 Oct 2019 21:00:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726393AbfJZS77 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 26 Oct 2019 14:59:59 -0400
Received: from mail-qt1-f195.google.com ([209.85.160.195]:43261 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726107AbfJZS77 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 26 Oct 2019 14:59:59 -0400
Received: by mail-qt1-f195.google.com with SMTP id l15so1866635qtr.10
        for <linux-input@vger.kernel.org>; Sat, 26 Oct 2019 11:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=R/25DFnnAfdOOznSWFsjeGi3TAKxHfedwHIKgwRRADs=;
        b=RG27uXvPA2nuJyXyMMR9ug+IdxlweVi4WUZ2e1zokTdQl8d5ZPOItS0FBqpL+pMIxN
         5G2ZLDreaZdCwL7AEQA1OTQ1qmsq7o1ccjn80r8z8KkiR01rcbZJaGpnR9TNR8ZeYjPt
         dEqysuTu9wmxHMOJKV/ifaZZs9n0J/hXzVYIFzrMTleApS0bahqy4IGiNJyTUJLpUHRN
         01QWrGcgHHZQYOogKLNdLr1VDRKnfMtiY7gZNmywgTW2OO2Iuz5w4WpQ9QeHYlfcXHdT
         mjAbruwg5QUv0f05aNkzcOysCQrDCvQYMnreQ+5VQ45CYyD92kHCVQ+GuBPkaBxPRCIf
         G/Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=R/25DFnnAfdOOznSWFsjeGi3TAKxHfedwHIKgwRRADs=;
        b=r9afgWkgoOx2Ewo7MPoxE1R8Huas9GxLiQjXafcL10Zth9w8XsXVL1iEHyWfxtACSH
         1Gwq2PEtpaXexPlqsVHh1XhquosMXGw+gUAf1+t78uHc8oLortWeRb95mOqgO/yQdq1T
         1v3uN0cZUKHErXveSFK9hCvS8kTLvrC6v7dmShuNYyQNunpMdxee4VL96Yk530equHHC
         qvV0HWRw4LmHRvzB4vAZPKj39S51hUhpSyB8rPc3rAGyJC20LqPHbnA3ams1dYyFpLFd
         dw/IUxMats4hRgsgwVVPjou59TDjkOx6qXW5fkH5J+i4mh9rmIpSygnouteqL3h8J+Tk
         MOXA==
X-Gm-Message-State: APjAAAWIWnGEDeKz4fAsnpGYgqjUS1xT1aO0KRXWB4jQkt83EHtXqSgl
        suLRgR0Fy8kUMNlA4zPAV/s=
X-Google-Smtp-Source: APXvYqxAM7KxsFLmuyWQdS75N9ZTnAtzoWIrCqy2wG7dzuMm5EDO7OVE+jVEniY2QOGsWAjlWfy1KA==
X-Received: by 2002:a0c:d983:: with SMTP id y3mr9867472qvj.52.1572116397425;
        Sat, 26 Oct 2019 11:59:57 -0700 (PDT)
Received: from fabio-Latitude-E5450.nxp.com ([2804:14c:482:99:1a50:482f:3e7:284a])
        by smtp.gmail.com with ESMTPSA id y29sm3991798qtc.8.2019.10.26.11.59.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Oct 2019 11:59:56 -0700 (PDT)
From:   Fabio Estevam <festevam@gmail.com>
To:     dmitry.torokhov@gmail.com
Cc:     linux-input@vger.kernel.org, Fabio Estevam <festevam@gmail.com>
Subject: [PATCH 2/3] Input: s3c2410_ts - remove unneeded gpio.h header file
Date:   Sat, 26 Oct 2019 15:59:57 -0300
Message-Id: <20191026185958.24158-2-festevam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191026185958.24158-1-festevam@gmail.com>
References: <20191026185958.24158-1-festevam@gmail.com>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

There is no gpio functions used in the driver that is exported
by the gpio.h header, so remove this unneeded header.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 drivers/input/touchscreen/s3c2410_ts.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/input/touchscreen/s3c2410_ts.c b/drivers/input/touchscreen/s3c2410_ts.c
index b346e7cafd62..82920ff46f72 100644
--- a/drivers/input/touchscreen/s3c2410_ts.c
+++ b/drivers/input/touchscreen/s3c2410_ts.c
@@ -13,7 +13,6 @@
 #include <linux/errno.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
-#include <linux/gpio.h>
 #include <linux/input.h>
 #include <linux/delay.h>
 #include <linux/interrupt.h>
-- 
2.17.1

