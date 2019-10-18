Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9A64ADD096
	for <lists+linux-input@lfdr.de>; Fri, 18 Oct 2019 22:48:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726383AbfJRUsk (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 18 Oct 2019 16:48:40 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:45555 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729259AbfJRUsj (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 18 Oct 2019 16:48:39 -0400
Received: by mail-pf1-f193.google.com with SMTP id y72so4558030pfb.12;
        Fri, 18 Oct 2019 13:48:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BdxRc1UROJN98x5wdivSSXWp9YlY4xVJ4ceaFtsHsk8=;
        b=ryfQhcHg2v071KLkxUg1tsXRz5hBHWpixlWYU5kRFg6EOYD018x7AR6bKgHyhl7Uke
         6xvz2DTaz9kHtyCQT8Hw2j2G+xMsKA60ac888HYN0ywnoQlPk5tse+QXkG+FS5+PZGJG
         m3pGF2XUXfv3goC3dm2JwWWfw1r+F9MPPbUiosSEIjnQ1pFrwMlevEJOvoPFVTUy3EC4
         3ETiRIZ4KVH5UtXGFUfXmH8tStUJtm0llzEz87hrKLSn/X+FnsH06peFq1clJXfXwmir
         2Y3O8GMOWy/5kT70WhpdMyQ3eE7IDEM86eeMyCyiKIPZLTZo6nfllm6r/Ip+/MS7uQwH
         JNgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BdxRc1UROJN98x5wdivSSXWp9YlY4xVJ4ceaFtsHsk8=;
        b=c+vBzDTzmcnTd+OaBiTnQbptSq+odSY04E11GNzXsKdzA9hqj+SP4AvTmY7LxChMNn
         0UVWaRpGgFDdZ3PRjcIhfa6o9E808IGcPUcMd/y+7UF7vqstw6vOkH3lEtOuVKKbziIm
         9wF2UxjBjFcwDniGOgoGHPyAtzaUAxIi83zOJ6qT8KmY655yUYz7j/k9vAHueX7KRGxm
         a/smPBrmY0WcKf4v/9VKtYv+BHo8X13PCigWgVAyZTaVwhl6rIQ5hmisj3awvl1B8srs
         N4U/jk2N2jII1JduIJJaxo3bg9jJr+vEU1WCCGWdclGBJF2FkNqM6qMx6aKyFbAhJl8a
         4C5w==
X-Gm-Message-State: APjAAAUZ8ObF8IoMcsw5TRrA++0tMwt6Vkeljplu4e1jgvu5snDZHZdl
        dE3wxCelBdV4vsTvYhpdrWU=
X-Google-Smtp-Source: APXvYqzHofReptZNjBfkfDGH9NpRwpT57brmR14obJfgZ1oq7PReWlbWCRAK2OHVzSAmxLI/NYGXlA==
X-Received: by 2002:a17:90a:5898:: with SMTP id j24mr1047225pji.7.1571431718687;
        Fri, 18 Oct 2019 13:48:38 -0700 (PDT)
Received: from dtor-ws.mtv.corp.google.com ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id i190sm7936452pgc.93.2019.10.18.13.48.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2019 13:48:38 -0700 (PDT)
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Haojian Zhuang <haojian.zhuang@gmail.com>,
        Marek Vasut <marek.vasut@gmail.com>,
        Daniel Mack <daniel@zonque.org>,
        Mark Brown <broonie@kernel.org>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] Input: wm97xx - get rid of irq_enable method in wm97xx_mach_ops
Date:   Fri, 18 Oct 2019 13:48:34 -0700
Message-Id: <20191018204834.213424-2-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.23.0.866.gb869b98d4c-goog
In-Reply-To: <20191018204834.213424-1-dmitry.torokhov@gmail.com>
References: <20191018204834.213424-1-dmitry.torokhov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Now that we are using oneshot threaded IRQ this method is not used anymore.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

---

 drivers/input/touchscreen/mainstone-wm97xx.c | 9 ---------
 drivers/input/touchscreen/zylonite-wm97xx.c  | 9 ---------
 include/linux/wm97xx.h                       | 3 ---
 3 files changed, 21 deletions(-)

diff --git a/drivers/input/touchscreen/mainstone-wm97xx.c b/drivers/input/touchscreen/mainstone-wm97xx.c
index f8564b398eb3..72b62a00b11a 100644
--- a/drivers/input/touchscreen/mainstone-wm97xx.c
+++ b/drivers/input/touchscreen/mainstone-wm97xx.c
@@ -256,21 +256,12 @@ static void wm97xx_acc_shutdown(struct wm97xx *wm)
 	}
 }
 
-static void wm97xx_irq_enable(struct wm97xx *wm, int enable)
-{
-	if (enable)
-		enable_irq(wm->pen_irq);
-	else
-		disable_irq_nosync(wm->pen_irq);
-}
-
 static struct wm97xx_mach_ops mainstone_mach_ops = {
 	.acc_enabled = 1,
 	.acc_pen_up = wm97xx_acc_pen_up,
 	.acc_pen_down = wm97xx_acc_pen_down,
 	.acc_startup = wm97xx_acc_startup,
 	.acc_shutdown = wm97xx_acc_shutdown,
-	.irq_enable = wm97xx_irq_enable,
 	.irq_gpio = WM97XX_GPIO_2,
 };
 
diff --git a/drivers/input/touchscreen/zylonite-wm97xx.c b/drivers/input/touchscreen/zylonite-wm97xx.c
index 0f4ac7f844ce..23d09b1cb339 100644
--- a/drivers/input/touchscreen/zylonite-wm97xx.c
+++ b/drivers/input/touchscreen/zylonite-wm97xx.c
@@ -161,20 +161,11 @@ static int wm97xx_acc_startup(struct wm97xx *wm)
 	return 0;
 }
 
-static void wm97xx_irq_enable(struct wm97xx *wm, int enable)
-{
-	if (enable)
-		enable_irq(wm->pen_irq);
-	else
-		disable_irq_nosync(wm->pen_irq);
-}
-
 static struct wm97xx_mach_ops zylonite_mach_ops = {
 	.acc_enabled	= 1,
 	.acc_pen_up	= wm97xx_acc_pen_up,
 	.acc_pen_down	= wm97xx_acc_pen_down,
 	.acc_startup	= wm97xx_acc_startup,
-	.irq_enable	= wm97xx_irq_enable,
 	.irq_gpio	= WM97XX_GPIO_2,
 };
 
diff --git a/include/linux/wm97xx.h b/include/linux/wm97xx.h
index 7d5496fa6ac7..43bfb9589aab 100644
--- a/include/linux/wm97xx.h
+++ b/include/linux/wm97xx.h
@@ -254,9 +254,6 @@ struct wm97xx_mach_ops {
 	int (*acc_startup) (struct wm97xx *);
 	void (*acc_shutdown) (struct wm97xx *);
 
-	/* interrupt mask control - required for accelerated operation */
-	void (*irq_enable) (struct wm97xx *, int enable);
-
 	/* GPIO pin used for accelerated operation */
 	int irq_gpio;
 
-- 
2.23.0.866.gb869b98d4c-goog

