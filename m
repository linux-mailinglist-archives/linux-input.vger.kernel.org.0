Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1EEB140DE77
	for <lists+linux-input@lfdr.de>; Thu, 16 Sep 2021 17:48:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240016AbhIPPtL (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 16 Sep 2021 11:49:11 -0400
Received: from mx22.baidu.com ([220.181.50.185]:44422 "EHLO baidu.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S240049AbhIPPtK (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 16 Sep 2021 11:49:10 -0400
Received: from BC-Mail-Ex28.internal.baidu.com (unknown [172.31.51.22])
        by Forcepoint Email with ESMTPS id 24CED95A706080A020D1;
        Thu, 16 Sep 2021 23:32:32 +0800 (CST)
Received: from BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) by
 BC-Mail-Ex28.internal.baidu.com (172.31.51.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Thu, 16 Sep 2021 23:32:31 +0800
Received: from LAPTOP-UKSR4ENP.internal.baidu.com (172.31.63.8) by
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.14; Thu, 16 Sep 2021 23:32:31 +0800
From:   Cai Huoqing <caihuoqing@baidu.com>
To:     <caihuoqing@baidu.com>
CC:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] Input: gpio_decoder - Make use of the helper function dev_err_probe()
Date:   Thu, 16 Sep 2021 23:32:25 +0800
Message-ID: <20210916153226.14310-1-caihuoqing@baidu.com>
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
 drivers/input/misc/gpio_decoder.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/input/misc/gpio_decoder.c b/drivers/input/misc/gpio_decoder.c
index 145826a1a9a1..06a45a0df7a3 100644
--- a/drivers/input/misc/gpio_decoder.c
+++ b/drivers/input/misc/gpio_decoder.c
@@ -80,10 +80,9 @@ static int gpio_decoder_probe(struct platform_device *pdev)
 	device_property_read_u32(dev, "linux,axis", &decoder->axis);
 
 	decoder->input_gpios = devm_gpiod_get_array(dev, NULL, GPIOD_IN);
-	if (IS_ERR(decoder->input_gpios)) {
-		dev_err(dev, "unable to acquire input gpios\n");
-		return PTR_ERR(decoder->input_gpios);
-	}
+	if (IS_ERR(decoder->input_gpios))
+		return dev_err_probe(dev, PTR_ERR(decoder->input_gpios),
+				     "unable to acquire input gpios\n");
 
 	if (decoder->input_gpios->ndescs < 2) {
 		dev_err(dev, "not enough gpios found\n");
-- 
2.25.1

