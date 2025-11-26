Return-Path: <linux-input+bounces-16346-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id E70AFC8A815
	for <lists+linux-input@lfdr.de>; Wed, 26 Nov 2025 16:01:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id F263234A6F6
	for <lists+linux-input@lfdr.de>; Wed, 26 Nov 2025 14:58:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53087302755;
	Wed, 26 Nov 2025 14:56:55 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2A4D305063;
	Wed, 26 Nov 2025 14:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764169015; cv=none; b=GT6pw9ZO3drmNLgViU1TPptJBHJStw35J4ZG5JCOl+FBeIA4z0rjaRFU9SJKP2A9MnnJRrs+LxwI6ZBLxQnTb3ZW5W6GFaolrfDXlFFK103NllR6z/unce94Q/SE47RJfaIceuErTp71a2kbpDiUZN/QOcha2dFUVVAeLlIGKXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764169015; c=relaxed/simple;
	bh=tBQahxl3O6jxkT/hIx7/WkiZ58k1496AvxzG/aczs5c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=O0uEzZ81e7Bl7bPWm4A66DTBS/MsyVCEvHYpt7roQBY6jtAh/cesaEj5ZQYdCeAXq0ZMYx2qFfu8BZOff2T53dpM3fljTCQJlZRk/guXfYlMUUX8ph3SNEqQYPf2qAlD8rFaRhWr3Cgp7qx1ZIYqiPcF3hjjfXhOGmKC9P8GEKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from DESKTOP-L0HPE2S (unknown [114.245.38.183])
	by APP-01 (Coremail) with SMTP id qwCowABnANAuFSdpJOwhAg--.10323S2;
	Wed, 26 Nov 2025 22:56:46 +0800 (CST)
From: Haotian Zhang <vulab@iscas.ac.cn>
To: sebastian.reichel@collabora.co.uk,
	dmitry.torokhov@gmail.com
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Haotian Zhang <vulab@iscas.ac.cn>
Subject: [PATCH] Input: misc: pwm-vibra: fix resource leaks on start failure
Date: Wed, 26 Nov 2025 22:56:35 +0800
Message-ID: <20251126145635.954-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1.windows.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qwCowABnANAuFSdpJOwhAg--.10323S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Aw4DJw47Gw4Uuw18ZrykAFb_yoW8ur4xpr
	1fArZ2kr1rJFW7Xa15Zw1vv3y5J3y0q34Skr1kG34rWwn3CF1xGr18Jas7uF4kAryUGwn7
	AF4qyayUKF17ZwUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkl14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkF7I0En4kS14v26r12
	6r1DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI
	0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y
	0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxV
	WUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1l
	IxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUjuHq7UUUU
	U==
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiDAcSA2kmz-rN5QAAsI

The pwm_vibrator_start() function returns immediately if
pwm_apply_might_sleep() fails, neglecting to disable the
regulator or reset the enable GPIO. This results in a
potential resource leak.

Introduce a local flag to track regulator enablement
and implement an error handling path. Deassert the enable
GPIO and disable the regulator upon failure.

Fixes: 3e5b08518f6a ("Input: add a driver for PWM controllable vibrators")
Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>
---
 drivers/input/misc/pwm-vibra.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/input/misc/pwm-vibra.c b/drivers/input/misc/pwm-vibra.c
index 3e5ed685ed8f..d323a12596c3 100644
--- a/drivers/input/misc/pwm-vibra.c
+++ b/drivers/input/misc/pwm-vibra.c
@@ -40,6 +40,7 @@ static int pwm_vibrator_start(struct pwm_vibrator *vibrator)
 	struct device *pdev = vibrator->input->dev.parent;
 	struct pwm_state state;
 	int err;
+	bool new_vcc_on = false;
 
 	if (!vibrator->vcc_on) {
 		err = regulator_enable(vibrator->vcc);
@@ -48,6 +49,7 @@ static int pwm_vibrator_start(struct pwm_vibrator *vibrator)
 			return err;
 		}
 		vibrator->vcc_on = true;
+		new_vcc_on = true;
 	}
 
 	gpiod_set_value_cansleep(vibrator->enable_gpio, 1);
@@ -59,7 +61,7 @@ static int pwm_vibrator_start(struct pwm_vibrator *vibrator)
 	err = pwm_apply_might_sleep(vibrator->pwm, &state);
 	if (err) {
 		dev_err(pdev, "failed to apply pwm state: %d\n", err);
-		return err;
+		goto err_gpio;
 	}
 
 	if (vibrator->pwm_dir) {
@@ -71,11 +73,19 @@ static int pwm_vibrator_start(struct pwm_vibrator *vibrator)
 		if (err) {
 			dev_err(pdev, "failed to apply dir-pwm state: %d\n", err);
 			pwm_disable(vibrator->pwm);
-			return err;
+			goto err_gpio;
 		}
 	}
 
 	return 0;
+
+err_gpio:
+	gpiod_set_value_cansleep(vibrator->enable_gpio, 0);
+	if (new_vcc_on) {
+		regulator_disable(vibrator->vcc);
+		vibrator->vcc_on = false;
+	}
+	return err;
 }
 
 static void pwm_vibrator_stop(struct pwm_vibrator *vibrator)
-- 
2.50.1.windows.1


