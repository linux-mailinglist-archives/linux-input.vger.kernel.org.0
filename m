Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F62A320698
	for <lists+linux-input@lfdr.de>; Sat, 20 Feb 2021 19:10:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229796AbhBTSKT (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 20 Feb 2021 13:10:19 -0500
Received: from m12-13.163.com ([220.181.12.13]:41807 "EHLO m12-13.163.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229784AbhBTSKS (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sat, 20 Feb 2021 13:10:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
        s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=TjEyC
        rN0Dxxy8C0CP5JTiP1d5AvXCV8LfvEJ+9l0vlg=; b=ArkTtwDpXMvZ6JIvNhxfx
        z7jA99GgYDRGjRJkaOKEMA8RgK2PhVz5yV5ta9sN/mU3loL5660WJC53h/xAB0tE
        kOfaYKEebNj+0oIjXgKzlSK57nu74vUsv3JHgNc1B7iH+NZHy5MXnHIptkfUjRFA
        FuZIHUtele965WcqqEJMr8=
Received: from jiangzhipeng.ccdomain.com (unknown [218.94.48.178])
        by smtp9 (Coremail) with SMTP id DcCowAD3iozdRDFg7ZlUgA--.32257S2;
        Sun, 21 Feb 2021 01:20:33 +0800 (CST)
From:   jzp0409 <jzp0409@163.com>
To:     dmitry.torokhov@gmail.com
Cc:     linux-input@vger.kernel.org, jiangzhipeng <jiangzhipeng@yulong.com>
Subject: [PATCH] input: adp5589-keys: Add err log
Date:   Sun, 21 Feb 2021 01:20:40 +0800
Message-Id: <20210220172040.1559-1-jzp0409@163.com>
X-Mailer: git-send-email 2.30.0.windows.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: DcCowAD3iozdRDFg7ZlUgA--.32257S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrtrW3uFWrCr4UZr1xZFWUArb_yoWftrg_uF
        W0v3Z7Wr4jyF13KrZ8Aw1fZry0grn8uF95uFsYqF15Cr1fArWkJ3WDurWrtw4kAr1qyryU
        C3ykWr92yws3CjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUbRpBPUUUUU==
X-Originating-IP: [218.94.48.178]
X-CM-SenderInfo: hm2sikiqz6il2tof0z/xtbBiAE-hlaD+CVIvQAAsN
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: jiangzhipeng <jiangzhipeng@yulong.com>

When devm_gpiochip_add_data() failed ,print err log

Signed-off-by: jiangzhipeng <jiangzhipeng@yulong.com>
---
 drivers/input/keyboard/adp5589-keys.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/input/keyboard/adp5589-keys.c b/drivers/input/keyboard/adp5589-keys.c
index 654e047..e99c0bd 100644
--- a/drivers/input/keyboard/adp5589-keys.c
+++ b/drivers/input/keyboard/adp5589-keys.c
@@ -526,8 +526,10 @@ static int adp5589_gpio_add(struct adp5589_kpad *kpad)
 	mutex_init(&kpad->gpio_lock);
 
 	error = devm_gpiochip_add_data(dev, &kpad->gc, kpad);
-	if (error)
+	if (error) {
+		dev_err(dev, "devm_gpiochip_add_data() failed, err: %d\n", error);
 		return error;
+	}
 
 	for (i = 0; i <= kpad->var->bank(kpad->var->maxgpio); i++) {
 		kpad->dat_out[i] = adp5589_read(kpad->client, kpad->var->reg(
-- 
1.9.1


