Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C0A323797ED
	for <lists+linux-input@lfdr.de>; Mon, 10 May 2021 21:47:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231151AbhEJTsj (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 10 May 2021 15:48:39 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.54]:10006 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230473AbhEJTsj (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 10 May 2021 15:48:39 -0400
X-Greylist: delayed 353 seconds by postgrey-1.27 at vger.kernel.org; Mon, 10 May 2021 15:48:38 EDT
ARC-Seal: i=1; a=rsa-sha256; t=1620675691; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=dQtyE84oUSOsta0e+MVVCCHgW0APtklorh/lEaijeYmmxeQdtaRboBIuDKmRFbeBT4
    76l/8CAOabgZGY0SGn0Al6y9SPxoIxQjOPwy47a0EGxs3EgK6J5efntYigKdTA+ZVG+n
    UYMPSSs0NcaJ3GyWWepd8fEZ48BgUZYA4+U/eMyLa+UwoeP+22YdGT2cW65bP/BAoOIx
    FzypGHjOg4Lyk1aYBT+mZs/Yub6rSQnk4VYfYTdFQmodfda8qBRP0pXspq/MSt6zvJUg
    jL4rVvK0YK76Y6Pf8M8zKTW/C8ixjDFNXXmOKBrTr9XYr8aJszwSfBgbj3Z+94+wbf1k
    XkNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1620675691;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=a8xy3/Hp6U7ap7at4TxX/63gkke7j/hfvHMtBLfmenk=;
    b=rD01YfyxAPTlE32YzK6Ampy427rpY1/u5NXa3XJ8oQH+13M3QebCjitBdczmLTXH2X
    pJ/XgJRuUv2f6YHnsIY0OPzVQ1JuNW/Atl4KjsSk69onbiJhs9SjKvjEuFCzI0za1Hyq
    H39xD4RZcSSeK33o/VsIEotI1F87hUjnFEIk2M3fZe86WP8798IH+AJ5Qe/zhr7DNgYl
    9mUJyJ04aDLpay23RQlQOPeeLVcVbKK4IVufojReiv3amV9YrMVxiVz4KdiEhKXXS7iV
    xgWXY1vSJFBmG80KYmVNKXVSP6+yfwhXLtiMTV0bnXB7BHnLyKAlnLOSdp1JYoN13wCB
    3TFw==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1620675691;
    s=strato-dkim-0002; d=gerhold.net;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=a8xy3/Hp6U7ap7at4TxX/63gkke7j/hfvHMtBLfmenk=;
    b=edWStSsJSkFmX2tZ8bD1564qSsZvzCFIkm7muuSG+jCROpCxaddoOJCMY6fPeb5meY
    W3yZuLpkf62UwovwMlJxflJqcCY7pMYumWr3HnL5F28GTGjvprc6TArqUyb+qqgRKb8z
    ocUYoGGE8tqXe/aiLBtkc5eIuWUmIAbFH/w+w4KF6uUOnAkwPpwJEQRN9JRBEH4pPXtS
    viJ1tVZMRZbo5rryTO3lNiwtzoSJSYCp2Dx7qiT6kjJZLFbokzkbNOo2ZgOGd4uRNY8e
    h0IquBmBtCmWO4rWnePQgY9cuZ6ymCaEER9lc4dMptuuCZpz04QQ+JtJTbjrZGMCQwhX
    pbPA==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXS7IYBkLahKxB5m6NCQEo"
X-RZG-CLASS-ID: mo00
Received: from droid..
    by smtp.strato.de (RZmta 47.25.6 DYNA|AUTH)
    with ESMTPSA id e01f26x4AJfVYUJ
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Mon, 10 May 2021 21:41:31 +0200 (CEST)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org,
        Simon Budig <simon.budig@kernelconcepts.de>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Stephan Gerhold <stephan@gerhold.net>,
        Ondrej Jirman <megous@megous.com>,
        Marco Felsch <m.felsch@pengutronix.de>
Subject: [PATCH v2 2/2] Input: edt-ft5x06 - add support for iovcc-supply
Date:   Mon, 10 May 2021 21:31:08 +0200
Message-Id: <20210510193108.50178-2-stephan@gerhold.net>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210510193108.50178-1-stephan@gerhold.net>
References: <20210510193108.50178-1-stephan@gerhold.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

At the moment, the edt-ft5x06 driver can control a single regulator
("vcc"). However, some FocalTech touch controllers have an additional
IOVCC pin that should be supplied with the digital I/O voltage.

The I/O voltage might be provided by another regulator that should also
be kept on. Otherwise, the touchscreen can randomly stop functioning if
the regulator is turned off because no other components still require it.

Implement (optional) support for also enabling an "iovcc-supply".
The datasheet specifies a delay of ~ 10us before enabling VDD/VCC
after IOVCC is enabled, so make sure to enable IOVCC first.

Cc: Ondrej Jirman <megous@megous.com>
Cc: Marco Felsch <m.felsch@pengutronix.de>
Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
Sorry about the long delay, couldn't find the time to test the new changes :)

Changes in v2:
  - Respect 10us delay between enabling IOVCC and VDD/VCC line
    (suggested by Marco Felsch)

v1: https://lore.kernel.org/linux-input/20210108192337.563679-2-stephan@gerhold.net/
---
 drivers/input/touchscreen/edt-ft5x06.c | 34 ++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/drivers/input/touchscreen/edt-ft5x06.c b/drivers/input/touchscreen/edt-ft5x06.c
index 2eefbc2485bc..d3271856bb5c 100644
--- a/drivers/input/touchscreen/edt-ft5x06.c
+++ b/drivers/input/touchscreen/edt-ft5x06.c
@@ -104,6 +104,7 @@ struct edt_ft5x06_ts_data {
 	u16 num_x;
 	u16 num_y;
 	struct regulator *vcc;
+	struct regulator *iovcc;
 
 	struct gpio_desc *reset_gpio;
 	struct gpio_desc *wake_gpio;
@@ -1067,6 +1068,7 @@ static void edt_ft5x06_disable_regulator(void *arg)
 	struct edt_ft5x06_ts_data *data = arg;
 
 	regulator_disable(data->vcc);
+	regulator_disable(data->iovcc);
 }
 
 static int edt_ft5x06_ts_probe(struct i2c_client *client,
@@ -1107,9 +1109,28 @@ static int edt_ft5x06_ts_probe(struct i2c_client *client,
 		return error;
 	}
 
+	tsdata->iovcc = devm_regulator_get(&client->dev, "iovcc");
+	if (IS_ERR(tsdata->iovcc)) {
+		error = PTR_ERR(tsdata->iovcc);
+		if (error != -EPROBE_DEFER)
+			dev_err(&client->dev,
+				"failed to request iovcc regulator: %d\n", error);
+		return error;
+	}
+
+	error = regulator_enable(tsdata->iovcc);
+	if (error < 0) {
+		dev_err(&client->dev, "failed to enable iovcc: %d\n", error);
+		return error;
+	}
+
+	/* Delay enabling VCC for > 10us (T_ivd) after IOVCC */
+	usleep_range(10, 100);
+
 	error = regulator_enable(tsdata->vcc);
 	if (error < 0) {
 		dev_err(&client->dev, "failed to enable vcc: %d\n", error);
+		regulator_disable(tsdata->iovcc);
 		return error;
 	}
 
@@ -1289,6 +1310,9 @@ static int __maybe_unused edt_ft5x06_ts_suspend(struct device *dev)
 	ret = regulator_disable(tsdata->vcc);
 	if (ret)
 		dev_warn(dev, "Failed to disable vcc\n");
+	ret = regulator_disable(tsdata->iovcc);
+	if (ret)
+		dev_warn(dev, "Failed to disable iovcc\n");
 
 	return 0;
 }
@@ -1319,9 +1343,19 @@ static int __maybe_unused edt_ft5x06_ts_resume(struct device *dev)
 		gpiod_set_value_cansleep(reset_gpio, 1);
 		usleep_range(5000, 6000);
 
+		ret = regulator_enable(tsdata->iovcc);
+		if (ret) {
+			dev_err(dev, "Failed to enable iovcc\n");
+			return ret;
+		}
+
+		/* Delay enabling VCC for > 10us (T_ivd) after IOVCC */
+		usleep_range(10, 100);
+
 		ret = regulator_enable(tsdata->vcc);
 		if (ret) {
 			dev_err(dev, "Failed to enable vcc\n");
+			regulator_disable(tsdata->iovcc);
 			return ret;
 		}
 
-- 
2.31.1

