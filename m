Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 13E5940DE74
	for <lists+linux-input@lfdr.de>; Thu, 16 Sep 2021 17:48:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239897AbhIPPtK (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 16 Sep 2021 11:49:10 -0400
Received: from mx22.baidu.com ([220.181.50.185]:44420 "EHLO baidu.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S240042AbhIPPtK (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 16 Sep 2021 11:49:10 -0400
Received: from BC-Mail-Ex32.internal.baidu.com (unknown [172.31.51.26])
        by Forcepoint Email with ESMTPS id 091283D1F30F32112758;
        Thu, 16 Sep 2021 23:32:02 +0800 (CST)
Received: from BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) by
 BC-Mail-Ex32.internal.baidu.com (172.31.51.26) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2242.12; Thu, 16 Sep 2021 23:32:01 +0800
Received: from LAPTOP-UKSR4ENP.internal.baidu.com (172.31.63.8) by
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.14; Thu, 16 Sep 2021 23:32:01 +0800
From:   Cai Huoqing <caihuoqing@baidu.com>
To:     <caihuoqing@baidu.com>
CC:     Linus Walleij <linus.walleij@linaro.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] Input: cyttsp - Make use of the helper function dev_err_probe()
Date:   Thu, 16 Sep 2021 23:31:55 +0800
Message-ID: <20210916153156.14098-1-caihuoqing@baidu.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.31.63.8]
X-ClientProxiedBy: BC-Mail-Ex09.internal.baidu.com (172.31.51.49) To
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42)
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

When possible use dev_err_probe help to properly deal with the
PROBE_DEFER error, the benefit is that DEFER issue will be logged
in the devices_deferred debugfs file.
Using dev_err_probe() can reduce code size, and the error value
gets printed.

Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
---
 drivers/input/touchscreen/cyttsp_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/touchscreen/cyttsp_core.c b/drivers/input/touchscreen/cyttsp_core.c
index 1dbd849c9613..01646910c9db 100644
--- a/drivers/input/touchscreen/cyttsp_core.c
+++ b/drivers/input/touchscreen/cyttsp_core.c
@@ -673,7 +673,7 @@ struct cyttsp *cyttsp_probe(const struct cyttsp_bus_ops *bus_ops,
 	ts->reset_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
 	if (IS_ERR(ts->reset_gpio)) {
 		error = PTR_ERR(ts->reset_gpio);
-		dev_err(dev, "Failed to request reset gpio, error %d\n", error);
+		dev_err_probe(dev, error, "Failed to request reset gpio\n");
 		return ERR_PTR(error);
 	}
 
-- 
2.25.1

