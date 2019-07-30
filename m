Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E292A7B167
	for <lists+linux-input@lfdr.de>; Tue, 30 Jul 2019 20:16:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387909AbfG3SQS (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 30 Jul 2019 14:16:18 -0400
Received: from mail-pg1-f174.google.com ([209.85.215.174]:43272 "EHLO
        mail-pg1-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726847AbfG3SQR (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 30 Jul 2019 14:16:17 -0400
Received: by mail-pg1-f174.google.com with SMTP id r22so2876408pgk.10
        for <linux-input@vger.kernel.org>; Tue, 30 Jul 2019 11:16:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=oZRLaUqeB/5df00RsBgkLSDiD1UyQYIF6lNxbHtHxVQ=;
        b=ctkXaWFD0Q4nOoTq/Spp/ZZ3HNca5vZ/q6xyT87gx+aVQ5jq/uKaK0YnTrGmgdq81l
         ZsRxT2Ty1zwFs9HifGAPSMruY4KbceP4dH7MOv5TDu07sCSfIPOPjEoKANYaCLQXsF18
         fBONfTBJCKVwrbFcdcE4KVBhbnym3x+zUTeOc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oZRLaUqeB/5df00RsBgkLSDiD1UyQYIF6lNxbHtHxVQ=;
        b=LRsaTYNh1xnzOItUyUG7ji6YsO2NSGhEe3sahZ04Y53/gARJ1i8F0+z5HfUdaMt+P+
         9XXMj3UjKZK6o39VxZ3TUjHme3g/qeV5LQ+a3MTqVLc+OPHQGwVTkJqwkP3S63fRYenM
         08i9HYGJew+93Dei1CAZX1grfL2t3zaj6u9I7/BHgBtXoS/esX9NEwv9n78d9rCLE0PP
         0HPRWZ/loUBEJB8kumxr+xnnNrWUf4BJ3biHz7LyY1tJuQKdslN1zALLvbCHOlBRMgnB
         g7vDTjvVe9v7eQ1Hu+PEZmaGdxPq/ns4l0Qf8UIlfIwehr4bTagEbflVu3/7w+8T5Qqm
         2NBA==
X-Gm-Message-State: APjAAAUrW91H7NBRWJPkJTryyFks700X7d4G6wSXneUVc7iqvwxuFngQ
        CgxV2ZZDBBy0qA+H29XuQV/nFQ==
X-Google-Smtp-Source: APXvYqxfiJzynA4kXv7deGlBnLBrFYIIa+joXHZnLUm6WLWP8Yfuh+iI/GwcGrhyxjRb7seH4XtI5Q==
X-Received: by 2002:a17:90a:28e4:: with SMTP id f91mr114491702pjd.99.1564510576754;
        Tue, 30 Jul 2019 11:16:16 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id g1sm106744083pgg.27.2019.07.30.11.16.16
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 30 Jul 2019 11:16:16 -0700 (PDT)
From:   Stephen Boyd <swboyd@chromium.org>
To:     linux-kernel@vger.kernel.org
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v6 21/57] Input: Remove dev_err() usage after platform_get_irq()
Date:   Tue, 30 Jul 2019 11:15:21 -0700
Message-Id: <20190730181557.90391-22-swboyd@chromium.org>
X-Mailer: git-send-email 2.22.0.709.g102302147b-goog
In-Reply-To: <20190730181557.90391-1-swboyd@chromium.org>
References: <20190730181557.90391-1-swboyd@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

We don't need dev_err() messages when platform_get_irq() fails now that
platform_get_irq() prints an error message itself when something goes
wrong. Let's remove these prints with a simple semantic patch.

// <smpl>
@@
expression ret;
struct platform_device *E;
@@

ret =
(
platform_get_irq(E, ...)
|
platform_get_irq_byname(E, ...)
);

if ( \( ret < 0 \| ret <= 0 \) )
{
(
-if (ret != -EPROBE_DEFER)
-{ ...
-dev_err(...);
-... }
|
...
-dev_err(...);
)
...
}
// </smpl>

While we're here, remove braces on if statements that only have one
statement (manually).

Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---

Please apply directly to subsystem trees

 drivers/input/keyboard/bcm-keypad.c         |  4 +---
 drivers/input/keyboard/davinci_keyscan.c    |  1 -
 drivers/input/keyboard/imx_keypad.c         |  4 +---
 drivers/input/keyboard/lpc32xx-keys.c       |  4 +---
 drivers/input/keyboard/nomadik-ske-keypad.c |  4 +---
 drivers/input/keyboard/nspire-keypad.c      |  4 +---
 drivers/input/keyboard/opencores-kbd.c      |  4 +---
 drivers/input/keyboard/pmic8xxx-keypad.c    |  8 ++------
 drivers/input/keyboard/pxa27x_keypad.c      |  4 +---
 drivers/input/keyboard/pxa930_rotary.c      |  4 +---
 drivers/input/keyboard/sh_keysc.c           |  4 +---
 drivers/input/keyboard/snvs_pwrkey.c        |  4 +---
 drivers/input/keyboard/spear-keyboard.c     |  4 +---
 drivers/input/keyboard/st-keyscan.c         |  4 +---
 drivers/input/keyboard/tegra-kbc.c          |  4 +---
 drivers/input/keyboard/w90p910_keypad.c     |  4 +---
 drivers/input/misc/88pm80x_onkey.c          |  1 -
 drivers/input/misc/88pm860x_onkey.c         |  4 +---
 drivers/input/misc/ab8500-ponkey.c          |  8 ++------
 drivers/input/misc/axp20x-pek.c             | 10 ++--------
 drivers/input/misc/da9055_onkey.c           |  5 +----
 drivers/input/misc/da9063_onkey.c           |  7 ++-----
 drivers/input/misc/e3x0-button.c            | 10 ++--------
 drivers/input/misc/hisi_powerkey.c          |  8 ++------
 drivers/input/misc/max8925_onkey.c          |  8 ++------
 drivers/input/misc/pm8941-pwrkey.c          |  4 +---
 drivers/input/misc/rk805-pwrkey.c           |  8 ++------
 drivers/input/misc/stpmic1_onkey.c          | 10 ++--------
 drivers/input/misc/tps65218-pwrbutton.c     |  4 +---
 drivers/input/misc/twl6040-vibra.c          |  4 +---
 drivers/input/mouse/pxa930_trkball.c        |  4 +---
 drivers/input/serio/arc_ps2.c               |  4 +---
 drivers/input/serio/ps2-gpio.c              |  2 --
 drivers/input/touchscreen/88pm860x-ts.c     |  4 +---
 drivers/input/touchscreen/bcm_iproc_tsc.c   |  4 +---
 drivers/input/touchscreen/fsl-imx25-tcq.c   |  4 +---
 drivers/input/touchscreen/imx6ul_tsc.c      |  8 ++------
 drivers/input/touchscreen/lpc32xx_ts.c      |  4 +---
 38 files changed, 45 insertions(+), 145 deletions(-)

diff --git a/drivers/input/keyboard/bcm-keypad.c b/drivers/input/keyboard/bcm-keypad.c
index e1cf63ee148f..2b771c3a5578 100644
--- a/drivers/input/keyboard/bcm-keypad.c
+++ b/drivers/input/keyboard/bcm-keypad.c
@@ -413,10 +413,8 @@ static int bcm_kp_probe(struct platform_device *pdev)
 	bcm_kp_stop(kp);
 
 	kp->irq = platform_get_irq(pdev, 0);
-	if (kp->irq < 0) {
-		dev_err(&pdev->dev, "no IRQ specified\n");
+	if (kp->irq < 0)
 		return -EINVAL;
-	}
 
 	error = devm_request_threaded_irq(&pdev->dev, kp->irq,
 					  NULL, bcm_kp_isr_thread,
diff --git a/drivers/input/keyboard/davinci_keyscan.c b/drivers/input/keyboard/davinci_keyscan.c
index 1d94928db922..f489cd585b33 100644
--- a/drivers/input/keyboard/davinci_keyscan.c
+++ b/drivers/input/keyboard/davinci_keyscan.c
@@ -192,7 +192,6 @@ static int __init davinci_ks_probe(struct platform_device *pdev)
 
 	davinci_ks->irq = platform_get_irq(pdev, 0);
 	if (davinci_ks->irq < 0) {
-		dev_err(dev, "no key scan irq\n");
 		error = davinci_ks->irq;
 		goto fail2;
 	}
diff --git a/drivers/input/keyboard/imx_keypad.c b/drivers/input/keyboard/imx_keypad.c
index 97500a2de2d5..5a46d113e909 100644
--- a/drivers/input/keyboard/imx_keypad.c
+++ b/drivers/input/keyboard/imx_keypad.c
@@ -430,10 +430,8 @@ static int imx_keypad_probe(struct platform_device *pdev)
 	}
 
 	irq = platform_get_irq(pdev, 0);
-	if (irq < 0) {
-		dev_err(&pdev->dev, "no irq defined in platform data\n");
+	if (irq < 0)
 		return irq;
-	}
 
 	input_dev = devm_input_allocate_device(&pdev->dev);
 	if (!input_dev) {
diff --git a/drivers/input/keyboard/lpc32xx-keys.c b/drivers/input/keyboard/lpc32xx-keys.c
index a34e3271b0c9..348af2aeb5de 100644
--- a/drivers/input/keyboard/lpc32xx-keys.c
+++ b/drivers/input/keyboard/lpc32xx-keys.c
@@ -172,10 +172,8 @@ static int lpc32xx_kscan_probe(struct platform_device *pdev)
 	}
 
 	irq = platform_get_irq(pdev, 0);
-	if (irq < 0) {
-		dev_err(&pdev->dev, "failed to get platform irq\n");
+	if (irq < 0)
 		return -EINVAL;
-	}
 
 	kscandat = devm_kzalloc(&pdev->dev, sizeof(*kscandat),
 				GFP_KERNEL);
diff --git a/drivers/input/keyboard/nomadik-ske-keypad.c b/drivers/input/keyboard/nomadik-ske-keypad.c
index fa265fdce2c4..608446e14614 100644
--- a/drivers/input/keyboard/nomadik-ske-keypad.c
+++ b/drivers/input/keyboard/nomadik-ske-keypad.c
@@ -235,10 +235,8 @@ static int __init ske_keypad_probe(struct platform_device *pdev)
 	}
 
 	irq = platform_get_irq(pdev, 0);
-	if (irq < 0) {
-		dev_err(&pdev->dev, "failed to get keypad irq\n");
+	if (irq < 0)
 		return -EINVAL;
-	}
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	if (!res) {
diff --git a/drivers/input/keyboard/nspire-keypad.c b/drivers/input/keyboard/nspire-keypad.c
index 57eac91ecd76..63d5e488137d 100644
--- a/drivers/input/keyboard/nspire-keypad.c
+++ b/drivers/input/keyboard/nspire-keypad.c
@@ -165,10 +165,8 @@ static int nspire_keypad_probe(struct platform_device *pdev)
 	int error;
 
 	irq = platform_get_irq(pdev, 0);
-	if (irq < 0) {
-		dev_err(&pdev->dev, "failed to get keypad irq\n");
+	if (irq < 0)
 		return -EINVAL;
-	}
 
 	keypad = devm_kzalloc(&pdev->dev, sizeof(struct nspire_keypad),
 			      GFP_KERNEL);
diff --git a/drivers/input/keyboard/opencores-kbd.c b/drivers/input/keyboard/opencores-kbd.c
index 159346cb4060..b0ea387414c1 100644
--- a/drivers/input/keyboard/opencores-kbd.c
+++ b/drivers/input/keyboard/opencores-kbd.c
@@ -49,10 +49,8 @@ static int opencores_kbd_probe(struct platform_device *pdev)
 	}
 
 	irq = platform_get_irq(pdev, 0);
-	if (irq < 0) {
-		dev_err(&pdev->dev, "missing board IRQ resource\n");
+	if (irq < 0)
 		return -EINVAL;
-	}
 
 	opencores_kbd = devm_kzalloc(&pdev->dev, sizeof(*opencores_kbd),
 				     GFP_KERNEL);
diff --git a/drivers/input/keyboard/pmic8xxx-keypad.c b/drivers/input/keyboard/pmic8xxx-keypad.c
index d529768a1d06..91d5811d6f0e 100644
--- a/drivers/input/keyboard/pmic8xxx-keypad.c
+++ b/drivers/input/keyboard/pmic8xxx-keypad.c
@@ -544,16 +544,12 @@ static int pmic8xxx_kp_probe(struct platform_device *pdev)
 	}
 
 	kp->key_sense_irq = platform_get_irq(pdev, 0);
-	if (kp->key_sense_irq < 0) {
-		dev_err(&pdev->dev, "unable to get keypad sense irq\n");
+	if (kp->key_sense_irq < 0)
 		return kp->key_sense_irq;
-	}
 
 	kp->key_stuck_irq = platform_get_irq(pdev, 1);
-	if (kp->key_stuck_irq < 0) {
-		dev_err(&pdev->dev, "unable to get keypad stuck irq\n");
+	if (kp->key_stuck_irq < 0)
 		return kp->key_stuck_irq;
-	}
 
 	kp->input->name = "PMIC8XXX keypad";
 	kp->input->phys = "pmic8xxx_keypad/input0";
diff --git a/drivers/input/keyboard/pxa27x_keypad.c b/drivers/input/keyboard/pxa27x_keypad.c
index 39023664d2f2..7e65708b25a4 100644
--- a/drivers/input/keyboard/pxa27x_keypad.c
+++ b/drivers/input/keyboard/pxa27x_keypad.c
@@ -727,10 +727,8 @@ static int pxa27x_keypad_probe(struct platform_device *pdev)
 		return -EINVAL;
 
 	irq = platform_get_irq(pdev, 0);
-	if (irq < 0) {
-		dev_err(&pdev->dev, "failed to get keypad irq\n");
+	if (irq < 0)
 		return -ENXIO;
-	}
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	if (res == NULL) {
diff --git a/drivers/input/keyboard/pxa930_rotary.c b/drivers/input/keyboard/pxa930_rotary.c
index 585e7765cbf0..f7414091d94e 100644
--- a/drivers/input/keyboard/pxa930_rotary.c
+++ b/drivers/input/keyboard/pxa930_rotary.c
@@ -89,10 +89,8 @@ static int pxa930_rotary_probe(struct platform_device *pdev)
 	int err;
 
 	irq = platform_get_irq(pdev, 0);
-	if (irq < 0) {
-		dev_err(&pdev->dev, "no irq for rotary controller\n");
+	if (irq < 0)
 		return -ENXIO;
-	}
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	if (!res) {
diff --git a/drivers/input/keyboard/sh_keysc.c b/drivers/input/keyboard/sh_keysc.c
index 08ba41a81f14..27ad73f43451 100644
--- a/drivers/input/keyboard/sh_keysc.c
+++ b/drivers/input/keyboard/sh_keysc.c
@@ -181,10 +181,8 @@ static int sh_keysc_probe(struct platform_device *pdev)
 	}
 
 	irq = platform_get_irq(pdev, 0);
-	if (irq < 0) {
-		dev_err(&pdev->dev, "failed to get irq\n");
+	if (irq < 0)
 		goto err0;
-	}
 
 	priv = kzalloc(sizeof(*priv), GFP_KERNEL);
 	if (priv == NULL) {
diff --git a/drivers/input/keyboard/snvs_pwrkey.c b/drivers/input/keyboard/snvs_pwrkey.c
index 5342d8d45f81..e76b7a400a1c 100644
--- a/drivers/input/keyboard/snvs_pwrkey.c
+++ b/drivers/input/keyboard/snvs_pwrkey.c
@@ -118,10 +118,8 @@ static int imx_snvs_pwrkey_probe(struct platform_device *pdev)
 	pdata->wakeup = of_property_read_bool(np, "wakeup-source");
 
 	pdata->irq = platform_get_irq(pdev, 0);
-	if (pdata->irq < 0) {
-		dev_err(&pdev->dev, "no irq defined in platform data\n");
+	if (pdata->irq < 0)
 		return -EINVAL;
-	}
 
 	regmap_update_bits(pdata->snvs, SNVS_LPCR_REG, SNVS_LPCR_DEP_EN, SNVS_LPCR_DEP_EN);
 
diff --git a/drivers/input/keyboard/spear-keyboard.c b/drivers/input/keyboard/spear-keyboard.c
index 7d25fa338ab4..9b8d78f87253 100644
--- a/drivers/input/keyboard/spear-keyboard.c
+++ b/drivers/input/keyboard/spear-keyboard.c
@@ -191,10 +191,8 @@ static int spear_kbd_probe(struct platform_device *pdev)
 	int error;
 
 	irq = platform_get_irq(pdev, 0);
-	if (irq < 0) {
-		dev_err(&pdev->dev, "not able to get irq for the device\n");
+	if (irq < 0)
 		return irq;
-	}
 
 	kbd = devm_kzalloc(&pdev->dev, sizeof(*kbd), GFP_KERNEL);
 	if (!kbd) {
diff --git a/drivers/input/keyboard/st-keyscan.c b/drivers/input/keyboard/st-keyscan.c
index f097128b93fe..27562cd67fb6 100644
--- a/drivers/input/keyboard/st-keyscan.c
+++ b/drivers/input/keyboard/st-keyscan.c
@@ -187,10 +187,8 @@ static int keyscan_probe(struct platform_device *pdev)
 	keyscan_stop(keypad_data);
 
 	keypad_data->irq = platform_get_irq(pdev, 0);
-	if (keypad_data->irq < 0) {
-		dev_err(&pdev->dev, "no IRQ specified\n");
+	if (keypad_data->irq < 0)
 		return -EINVAL;
-	}
 
 	error = devm_request_irq(&pdev->dev, keypad_data->irq, keyscan_isr, 0,
 				 pdev->name, keypad_data);
diff --git a/drivers/input/keyboard/tegra-kbc.c b/drivers/input/keyboard/tegra-kbc.c
index a37a7a9e9171..d34d6947960f 100644
--- a/drivers/input/keyboard/tegra-kbc.c
+++ b/drivers/input/keyboard/tegra-kbc.c
@@ -631,10 +631,8 @@ static int tegra_kbc_probe(struct platform_device *pdev)
 		return -EINVAL;
 
 	kbc->irq = platform_get_irq(pdev, 0);
-	if (kbc->irq < 0) {
-		dev_err(&pdev->dev, "failed to get keyboard IRQ\n");
+	if (kbc->irq < 0)
 		return -ENXIO;
-	}
 
 	kbc->idev = devm_input_allocate_device(&pdev->dev);
 	if (!kbc->idev) {
diff --git a/drivers/input/keyboard/w90p910_keypad.c b/drivers/input/keyboard/w90p910_keypad.c
index c88d05d6108a..2503f44dc335 100644
--- a/drivers/input/keyboard/w90p910_keypad.c
+++ b/drivers/input/keyboard/w90p910_keypad.c
@@ -132,10 +132,8 @@ static int w90p910_keypad_probe(struct platform_device *pdev)
 	keymap_data = pdata->keymap_data;
 
 	irq = platform_get_irq(pdev, 0);
-	if (irq < 0) {
-		dev_err(&pdev->dev, "failed to get keypad irq\n");
+	if (irq < 0)
 		return -ENXIO;
-	}
 
 	keypad = kzalloc(sizeof(struct w90p910_keypad), GFP_KERNEL);
 	input_dev = input_allocate_device();
diff --git a/drivers/input/misc/88pm80x_onkey.c b/drivers/input/misc/88pm80x_onkey.c
index 45a09497f680..51c8a326fd06 100644
--- a/drivers/input/misc/88pm80x_onkey.c
+++ b/drivers/input/misc/88pm80x_onkey.c
@@ -77,7 +77,6 @@ static int pm80x_onkey_probe(struct platform_device *pdev)
 
 	info->irq = platform_get_irq(pdev, 0);
 	if (info->irq < 0) {
-		dev_err(&pdev->dev, "No IRQ resource!\n");
 		err = -EINVAL;
 		goto out;
 	}
diff --git a/drivers/input/misc/88pm860x_onkey.c b/drivers/input/misc/88pm860x_onkey.c
index cc87443aa2ee..685995cad73f 100644
--- a/drivers/input/misc/88pm860x_onkey.c
+++ b/drivers/input/misc/88pm860x_onkey.c
@@ -64,10 +64,8 @@ static int pm860x_onkey_probe(struct platform_device *pdev)
 	int irq, ret;
 
 	irq = platform_get_irq(pdev, 0);
-	if (irq < 0) {
-		dev_err(&pdev->dev, "No IRQ resource!\n");
+	if (irq < 0)
 		return -EINVAL;
-	}
 
 	info = devm_kzalloc(&pdev->dev, sizeof(struct pm860x_onkey_info),
 			    GFP_KERNEL);
diff --git a/drivers/input/misc/ab8500-ponkey.c b/drivers/input/misc/ab8500-ponkey.c
index 12b18a8db315..ea3b8292acdd 100644
--- a/drivers/input/misc/ab8500-ponkey.c
+++ b/drivers/input/misc/ab8500-ponkey.c
@@ -55,16 +55,12 @@ static int ab8500_ponkey_probe(struct platform_device *pdev)
 	int error;
 
 	irq_dbf = platform_get_irq_byname(pdev, "ONKEY_DBF");
-	if (irq_dbf < 0) {
-		dev_err(&pdev->dev, "No IRQ for ONKEY_DBF, error=%d\n", irq_dbf);
+	if (irq_dbf < 0)
 		return irq_dbf;
-	}
 
 	irq_dbr = platform_get_irq_byname(pdev, "ONKEY_DBR");
-	if (irq_dbr < 0) {
-		dev_err(&pdev->dev, "No IRQ for ONKEY_DBR, error=%d\n", irq_dbr);
+	if (irq_dbr < 0)
 		return irq_dbr;
-	}
 
 	ponkey = devm_kzalloc(&pdev->dev, sizeof(struct ab8500_ponkey),
 			      GFP_KERNEL);
diff --git a/drivers/input/misc/axp20x-pek.c b/drivers/input/misc/axp20x-pek.c
index debeeaeb8812..bb6462ee6abe 100644
--- a/drivers/input/misc/axp20x-pek.c
+++ b/drivers/input/misc/axp20x-pek.c
@@ -232,20 +232,14 @@ static int axp20x_pek_probe_input_device(struct axp20x_pek *axp20x_pek,
 	int error;
 
 	axp20x_pek->irq_dbr = platform_get_irq_byname(pdev, "PEK_DBR");
-	if (axp20x_pek->irq_dbr < 0) {
-		dev_err(&pdev->dev, "No IRQ for PEK_DBR, error=%d\n",
-				axp20x_pek->irq_dbr);
+	if (axp20x_pek->irq_dbr < 0)
 		return axp20x_pek->irq_dbr;
-	}
 	axp20x_pek->irq_dbr = regmap_irq_get_virq(axp20x->regmap_irqc,
 						  axp20x_pek->irq_dbr);
 
 	axp20x_pek->irq_dbf = platform_get_irq_byname(pdev, "PEK_DBF");
-	if (axp20x_pek->irq_dbf < 0) {
-		dev_err(&pdev->dev, "No IRQ for PEK_DBF, error=%d\n",
-				axp20x_pek->irq_dbf);
+	if (axp20x_pek->irq_dbf < 0)
 		return axp20x_pek->irq_dbf;
-	}
 	axp20x_pek->irq_dbf = regmap_irq_get_virq(axp20x->regmap_irqc,
 						  axp20x_pek->irq_dbf);
 
diff --git a/drivers/input/misc/da9055_onkey.c b/drivers/input/misc/da9055_onkey.c
index a4ff4782e605..7a0d3a1d503c 100644
--- a/drivers/input/misc/da9055_onkey.c
+++ b/drivers/input/misc/da9055_onkey.c
@@ -76,11 +76,8 @@ static int da9055_onkey_probe(struct platform_device *pdev)
 	int irq, err;
 
 	irq = platform_get_irq_byname(pdev, "ONKEY");
-	if (irq < 0) {
-		dev_err(&pdev->dev,
-			"Failed to get an IRQ for input device, %d\n", irq);
+	if (irq < 0)
 		return -EINVAL;
-	}
 
 	onkey = devm_kzalloc(&pdev->dev, sizeof(*onkey), GFP_KERNEL);
 	if (!onkey) {
diff --git a/drivers/input/misc/da9063_onkey.c b/drivers/input/misc/da9063_onkey.c
index fd355cf59397..dace8577fa43 100644
--- a/drivers/input/misc/da9063_onkey.c
+++ b/drivers/input/misc/da9063_onkey.c
@@ -248,11 +248,8 @@ static int da9063_onkey_probe(struct platform_device *pdev)
 	}
 
 	irq = platform_get_irq_byname(pdev, "ONKEY");
-	if (irq < 0) {
-		error = irq;
-		dev_err(&pdev->dev, "Failed to get platform IRQ: %d\n", error);
-		return error;
-	}
+	if (irq < 0)
+		return irq;
 
 	error = devm_request_threaded_irq(&pdev->dev, irq,
 					  NULL, da9063_onkey_irq_handler,
diff --git a/drivers/input/misc/e3x0-button.c b/drivers/input/misc/e3x0-button.c
index 4d7217f43888..e2fde6e1553f 100644
--- a/drivers/input/misc/e3x0-button.c
+++ b/drivers/input/misc/e3x0-button.c
@@ -65,18 +65,12 @@ static int e3x0_button_probe(struct platform_device *pdev)
 	int error;
 
 	irq_press = platform_get_irq_byname(pdev, "press");
-	if (irq_press < 0) {
-		dev_err(&pdev->dev, "No IRQ for 'press', error=%d\n",
-			irq_press);
+	if (irq_press < 0)
 		return irq_press;
-	}
 
 	irq_release = platform_get_irq_byname(pdev, "release");
-	if (irq_release < 0) {
-		dev_err(&pdev->dev, "No IRQ for 'release', error=%d\n",
-			irq_release);
+	if (irq_release < 0)
 		return irq_release;
-	}
 
 	input = devm_input_allocate_device(&pdev->dev);
 	if (!input)
diff --git a/drivers/input/misc/hisi_powerkey.c b/drivers/input/misc/hisi_powerkey.c
index dee6245f38d7..d3c293a95d32 100644
--- a/drivers/input/misc/hisi_powerkey.c
+++ b/drivers/input/misc/hisi_powerkey.c
@@ -90,12 +90,8 @@ static int hi65xx_powerkey_probe(struct platform_device *pdev)
 	for (i = 0; i < ARRAY_SIZE(hi65xx_irq_info); i++) {
 
 		irq = platform_get_irq_byname(pdev, hi65xx_irq_info[i].name);
-		if (irq < 0) {
-			error = irq;
-			dev_err(dev, "couldn't get irq %s: %d\n",
-				hi65xx_irq_info[i].name, error);
-			return error;
-		}
+		if (irq < 0)
+			return irq;
 
 		error = devm_request_any_context_irq(dev, irq,
 						     hi65xx_irq_info[i].handler,
diff --git a/drivers/input/misc/max8925_onkey.c b/drivers/input/misc/max8925_onkey.c
index 7c49b8d23894..ffab4a490c75 100644
--- a/drivers/input/misc/max8925_onkey.c
+++ b/drivers/input/misc/max8925_onkey.c
@@ -71,16 +71,12 @@ static int max8925_onkey_probe(struct platform_device *pdev)
 	int irq[2], error;
 
 	irq[0] = platform_get_irq(pdev, 0);
-	if (irq[0] < 0) {
-		dev_err(&pdev->dev, "No IRQ resource!\n");
+	if (irq[0] < 0)
 		return -EINVAL;
-	}
 
 	irq[1] = platform_get_irq(pdev, 1);
-	if (irq[1] < 0) {
-		dev_err(&pdev->dev, "No IRQ resource!\n");
+	if (irq[1] < 0)
 		return -EINVAL;
-	}
 
 	info = devm_kzalloc(&pdev->dev, sizeof(struct max8925_onkey_info),
 			    GFP_KERNEL);
diff --git a/drivers/input/misc/pm8941-pwrkey.c b/drivers/input/misc/pm8941-pwrkey.c
index 017f81a66658..cf8104454e74 100644
--- a/drivers/input/misc/pm8941-pwrkey.c
+++ b/drivers/input/misc/pm8941-pwrkey.c
@@ -205,10 +205,8 @@ static int pm8941_pwrkey_probe(struct platform_device *pdev)
 		return error;
 
 	pwrkey->irq = platform_get_irq(pdev, 0);
-	if (pwrkey->irq < 0) {
-		dev_err(&pdev->dev, "failed to get irq\n");
+	if (pwrkey->irq < 0)
 		return pwrkey->irq;
-	}
 
 	error = regmap_read(pwrkey->regmap, pwrkey->baseaddr + PON_REV2,
 			    &pwrkey->revision);
diff --git a/drivers/input/misc/rk805-pwrkey.c b/drivers/input/misc/rk805-pwrkey.c
index 4a6d4a5746e5..3fb64dbda1a2 100644
--- a/drivers/input/misc/rk805-pwrkey.c
+++ b/drivers/input/misc/rk805-pwrkey.c
@@ -53,16 +53,12 @@ static int rk805_pwrkey_probe(struct platform_device *pdev)
 	input_set_capability(pwr, EV_KEY, KEY_POWER);
 
 	fall_irq = platform_get_irq(pdev, 0);
-	if (fall_irq < 0) {
-		dev_err(&pdev->dev, "Can't get fall irq: %d\n", fall_irq);
+	if (fall_irq < 0)
 		return fall_irq;
-	}
 
 	rise_irq = platform_get_irq(pdev, 1);
-	if (rise_irq < 0) {
-		dev_err(&pdev->dev, "Can't get rise irq: %d\n", rise_irq);
+	if (rise_irq < 0)
 		return rise_irq;
-	}
 
 	err = devm_request_any_context_irq(&pwr->dev, fall_irq,
 					   pwrkey_fall_irq,
diff --git a/drivers/input/misc/stpmic1_onkey.c b/drivers/input/misc/stpmic1_onkey.c
index 7b49c9997df7..d8dc2f2f8000 100644
--- a/drivers/input/misc/stpmic1_onkey.c
+++ b/drivers/input/misc/stpmic1_onkey.c
@@ -61,18 +61,12 @@ static int stpmic1_onkey_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	onkey->irq_falling = platform_get_irq_byname(pdev, "onkey-falling");
-	if (onkey->irq_falling < 0) {
-		dev_err(dev, "failed: request IRQ onkey-falling %d\n",
-			onkey->irq_falling);
+	if (onkey->irq_falling < 0)
 		return onkey->irq_falling;
-	}
 
 	onkey->irq_rising = platform_get_irq_byname(pdev, "onkey-rising");
-	if (onkey->irq_rising < 0) {
-		dev_err(dev, "failed: request IRQ onkey-rising %d\n",
-			onkey->irq_rising);
+	if (onkey->irq_rising < 0)
 		return onkey->irq_rising;
-	}
 
 	if (!device_property_read_u32(dev, "power-off-time-sec", &val)) {
 		if (val > 0 && val <= 16) {
diff --git a/drivers/input/misc/tps65218-pwrbutton.c b/drivers/input/misc/tps65218-pwrbutton.c
index a4455bb12ae0..f011447c44fb 100644
--- a/drivers/input/misc/tps65218-pwrbutton.c
+++ b/drivers/input/misc/tps65218-pwrbutton.c
@@ -124,10 +124,8 @@ static int tps6521x_pb_probe(struct platform_device *pdev)
 	device_init_wakeup(dev, true);
 
 	irq = platform_get_irq(pdev, 0);
-	if (irq < 0) {
-		dev_err(dev, "No IRQ resource!\n");
+	if (irq < 0)
 		return -EINVAL;
-	}
 
 	error = devm_request_threaded_irq(dev, irq, NULL, tps6521x_pb_irq,
 					  IRQF_TRIGGER_RISING |
diff --git a/drivers/input/misc/twl6040-vibra.c b/drivers/input/misc/twl6040-vibra.c
index 93235a007d07..bf6644927630 100644
--- a/drivers/input/misc/twl6040-vibra.c
+++ b/drivers/input/misc/twl6040-vibra.c
@@ -272,10 +272,8 @@ static int twl6040_vibra_probe(struct platform_device *pdev)
 	}
 
 	info->irq = platform_get_irq(pdev, 0);
-	if (info->irq < 0) {
-		dev_err(info->dev, "invalid irq\n");
+	if (info->irq < 0)
 		return -EINVAL;
-	}
 
 	error = devm_request_threaded_irq(&pdev->dev, info->irq, NULL,
 					  twl6040_vib_irq_handler,
diff --git a/drivers/input/mouse/pxa930_trkball.c b/drivers/input/mouse/pxa930_trkball.c
index 87bac8cff6f7..41acde60b60f 100644
--- a/drivers/input/mouse/pxa930_trkball.c
+++ b/drivers/input/mouse/pxa930_trkball.c
@@ -147,10 +147,8 @@ static int pxa930_trkball_probe(struct platform_device *pdev)
 	int irq, error;
 
 	irq = platform_get_irq(pdev, 0);
-	if (irq < 0) {
-		dev_err(&pdev->dev, "failed to get trkball irq\n");
+	if (irq < 0)
 		return -ENXIO;
-	}
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	if (!res) {
diff --git a/drivers/input/serio/arc_ps2.c b/drivers/input/serio/arc_ps2.c
index 443194a2b9e3..0af9fba5d16d 100644
--- a/drivers/input/serio/arc_ps2.c
+++ b/drivers/input/serio/arc_ps2.c
@@ -187,10 +187,8 @@ static int arc_ps2_probe(struct platform_device *pdev)
 	int error, id, i;
 
 	irq = platform_get_irq_byname(pdev, "arc_ps2_irq");
-	if (irq < 0) {
-		dev_err(&pdev->dev, "no IRQ defined\n");
+	if (irq < 0)
 		return -EINVAL;
-	}
 
 	arc_ps2 = devm_kzalloc(&pdev->dev, sizeof(struct arc_ps2_data),
 				GFP_KERNEL);
diff --git a/drivers/input/serio/ps2-gpio.c b/drivers/input/serio/ps2-gpio.c
index e0f18469d01b..8970b49ea09a 100644
--- a/drivers/input/serio/ps2-gpio.c
+++ b/drivers/input/serio/ps2-gpio.c
@@ -369,8 +369,6 @@ static int ps2_gpio_probe(struct platform_device *pdev)
 
 	drvdata->irq = platform_get_irq(pdev, 0);
 	if (drvdata->irq < 0) {
-		dev_err(dev, "failed to get irq from platform resource: %d\n",
-			drvdata->irq);
 		error = drvdata->irq;
 		goto err_free_serio;
 	}
diff --git a/drivers/input/touchscreen/88pm860x-ts.c b/drivers/input/touchscreen/88pm860x-ts.c
index 1d1bbc8da949..81a3ea4b9a3d 100644
--- a/drivers/input/touchscreen/88pm860x-ts.c
+++ b/drivers/input/touchscreen/88pm860x-ts.c
@@ -185,10 +185,8 @@ static int pm860x_touch_probe(struct platform_device *pdev)
 	int irq, ret, res_x = 0, data = 0;
 
 	irq = platform_get_irq(pdev, 0);
-	if (irq < 0) {
-		dev_err(&pdev->dev, "No IRQ resource!\n");
+	if (irq < 0)
 		return -EINVAL;
-	}
 
 	if (pm860x_touch_dt_init(pdev, chip, &res_x)) {
 		if (pdata) {
diff --git a/drivers/input/touchscreen/bcm_iproc_tsc.c b/drivers/input/touchscreen/bcm_iproc_tsc.c
index 4d11b27c7c43..7de1fd24ce36 100644
--- a/drivers/input/touchscreen/bcm_iproc_tsc.c
+++ b/drivers/input/touchscreen/bcm_iproc_tsc.c
@@ -489,10 +489,8 @@ static int iproc_ts_probe(struct platform_device *pdev)
 
 	/* get interrupt */
 	irq = platform_get_irq(pdev, 0);
-	if (irq < 0) {
-		dev_err(&pdev->dev, "platform_get_irq failed: %d\n", irq);
+	if (irq < 0)
 		return irq;
-	}
 
 	error = devm_request_irq(&pdev->dev, irq,
 				 iproc_touchscreen_interrupt,
diff --git a/drivers/input/touchscreen/fsl-imx25-tcq.c b/drivers/input/touchscreen/fsl-imx25-tcq.c
index 1d6c8f490b40..5de58bd57a88 100644
--- a/drivers/input/touchscreen/fsl-imx25-tcq.c
+++ b/drivers/input/touchscreen/fsl-imx25-tcq.c
@@ -528,10 +528,8 @@ static int mx25_tcq_probe(struct platform_device *pdev)
 	}
 
 	priv->irq = platform_get_irq(pdev, 0);
-	if (priv->irq <= 0) {
-		dev_err(dev, "Failed to get IRQ\n");
+	if (priv->irq <= 0)
 		return priv->irq;
-	}
 
 	idev = devm_input_allocate_device(dev);
 	if (!idev) {
diff --git a/drivers/input/touchscreen/imx6ul_tsc.c b/drivers/input/touchscreen/imx6ul_tsc.c
index e04eecd65bbb..9ed258854349 100644
--- a/drivers/input/touchscreen/imx6ul_tsc.c
+++ b/drivers/input/touchscreen/imx6ul_tsc.c
@@ -430,16 +430,12 @@ static int imx6ul_tsc_probe(struct platform_device *pdev)
 	}
 
 	tsc_irq = platform_get_irq(pdev, 0);
-	if (tsc_irq < 0) {
-		dev_err(&pdev->dev, "no tsc irq resource?\n");
+	if (tsc_irq < 0)
 		return tsc_irq;
-	}
 
 	adc_irq = platform_get_irq(pdev, 1);
-	if (adc_irq < 0) {
-		dev_err(&pdev->dev, "no adc irq resource?\n");
+	if (adc_irq < 0)
 		return adc_irq;
-	}
 
 	err = devm_request_threaded_irq(tsc->dev, tsc_irq,
 					NULL, tsc_irq_fn, IRQF_ONESHOT,
diff --git a/drivers/input/touchscreen/lpc32xx_ts.c b/drivers/input/touchscreen/lpc32xx_ts.c
index 567ed64b5392..b2cd9472e2d1 100644
--- a/drivers/input/touchscreen/lpc32xx_ts.c
+++ b/drivers/input/touchscreen/lpc32xx_ts.c
@@ -212,10 +212,8 @@ static int lpc32xx_ts_probe(struct platform_device *pdev)
 	}
 
 	irq = platform_get_irq(pdev, 0);
-	if (irq < 0) {
-		dev_err(&pdev->dev, "Can't get interrupt resource\n");
+	if (irq < 0)
 		return irq;
-	}
 
 	tsc = kzalloc(sizeof(*tsc), GFP_KERNEL);
 	input = input_allocate_device();
-- 
Sent by a computer through tubes

