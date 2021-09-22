Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D75504149B5
	for <lists+linux-input@lfdr.de>; Wed, 22 Sep 2021 14:52:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236144AbhIVMyJ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 22 Sep 2021 08:54:09 -0400
Received: from mx22.baidu.com ([220.181.50.185]:48876 "EHLO baidu.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S235995AbhIVMyI (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 22 Sep 2021 08:54:08 -0400
Received: from BC-Mail-Ex11.internal.baidu.com (unknown [172.31.51.51])
        by Forcepoint Email with ESMTPS id 74A49AA6E23F99F428E6;
        Wed, 22 Sep 2021 20:52:31 +0800 (CST)
Received: from BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) by
 BC-Mail-Ex11.internal.baidu.com (172.31.51.51) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2242.12; Wed, 22 Sep 2021 20:52:30 +0800
Received: from LAPTOP-UKSR4ENP.internal.baidu.com (172.31.63.8) by
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.14; Wed, 22 Sep 2021 20:52:30 +0800
From:   Cai Huoqing <caihuoqing@baidu.com>
To:     <caihuoqing@baidu.com>
CC:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 1/3] Input: colibri-vf50-ts - Make use of the helper function devm_add_action_or_reset()
Date:   Wed, 22 Sep 2021 20:52:09 +0800
Message-ID: <20210922125212.95-1-caihuoqing@baidu.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.31.63.8]
X-ClientProxiedBy: BC-Mail-Ex21.internal.baidu.com (172.31.51.15) To
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42)
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The helper function devm_add_action_or_reset() will internally
call devm_add_action(), and if devm_add_action() fails then it will
execute the action mentioned and return the error code. So
use devm_add_action_or_reset() instead of devm_add_action()
to simplify the error handling, reduce the code.

Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
---
 drivers/input/touchscreen/colibri-vf50-ts.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/input/touchscreen/colibri-vf50-ts.c b/drivers/input/touchscreen/colibri-vf50-ts.c
index aa829725ded7..1a1d8e70ec40 100644
--- a/drivers/input/touchscreen/colibri-vf50-ts.c
+++ b/drivers/input/touchscreen/colibri-vf50-ts.c
@@ -271,9 +271,8 @@ static int vf50_ts_probe(struct platform_device *pdev)
 	if (IS_ERR(channels))
 		return PTR_ERR(channels);
 
-	error = devm_add_action(dev, vf50_ts_channel_release, channels);
+	error = devm_add_action_or_reset(dev, vf50_ts_channel_release, channels);
 	if (error) {
-		iio_channel_release_all(channels);
 		dev_err(dev, "Failed to register iio channel release action");
 		return error;
 	}
-- 
2.25.1

