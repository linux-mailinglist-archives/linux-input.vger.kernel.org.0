Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B18893013A5
	for <lists+linux-input@lfdr.de>; Sat, 23 Jan 2021 08:01:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726472AbhAWG7J (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 23 Jan 2021 01:59:09 -0500
Received: from m12-16.163.com ([220.181.12.16]:39476 "EHLO m12-16.163.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725730AbhAWG7H (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sat, 23 Jan 2021 01:59:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
        s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=KraP/
        NX5seaXvKYciU17/aNwpDeyDWQLEp1Gly+AH84=; b=j6pl/uUOtXaWEGwKjK7QR
        w53gqQYhmrMVheiwGUuAME8zprgeJBkWT1nKsgQZeCkQPRhoaWkNtHSoWvbZQqCf
        U43Wb4wOXeaHsicuVydXerRpip+XSzDUAMsgEVL1iMHYgna/XYMaK/+5XWsU+H/3
        wSdRGUSEp+EuIXoRKUwY/0=
Received: from liumingyu.ccdomain.com (unknown [119.137.55.101])
        by smtp12 (Coremail) with SMTP id EMCowACnqk71yAtgyNv1YQ--.54774S2;
        Sat, 23 Jan 2021 14:57:58 +0800 (CST)
From:   liumingyu <liu_mingyu@163.com>
To:     dmitry.torokhov@gmail.com
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        liumingyu <liumingyu@yulong.com>
Subject: [PATCH] Input: ti_am335x_tsc - fix spelling mistake
Date:   Sat, 23 Jan 2021 14:58:03 +0800
Message-Id: <20210123065803.128-1-liu_mingyu@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: EMCowACnqk71yAtgyNv1YQ--.54774S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrtrWUAr1xWF1UAr1kuw45Jrb_yoW3GFbEkr
        10qwn2gr1qyrWqk34Dtwn3Z34ktF18urWkAw1kKrW3try2vrnrJa98Wa1UAF4UKw17C34D
        Xr4agFySkan7WjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU87DG7UUUUU==
X-Originating-IP: [119.137.55.101]
X-CM-SenderInfo: 5olxsz5lqj53i6rwjhhfrp/1tbiQxYjmlc7St7UzAAAsM
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: liumingyu <liumingyu@yulong.com>

fix typo "postion" -> "position"

Signed-off-by: liumingyu <liumingyu@yulong.com>
---
 drivers/input/touchscreen/ti_am335x_tsc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/touchscreen/ti_am335x_tsc.c b/drivers/input/touchscreen/ti_am335x_tsc.c
index 83e6855..d77555e 100644
--- a/drivers/input/touchscreen/ti_am335x_tsc.c
+++ b/drivers/input/touchscreen/ti_am335x_tsc.c
@@ -310,7 +310,7 @@ static irqreturn_t titsc_irq(int irq, void *dev)
 			/*
 			 * Calculate pressure using formula
 			 * Resistance(touch) = x plate resistance *
-			 * x postion/4096 * ((z2 / z1) - 1)
+			 * x position/4096 * ((z2 / z1) - 1)
 			 */
 			z = z1 - z2;
 			z *= x;
-- 
1.9.1


