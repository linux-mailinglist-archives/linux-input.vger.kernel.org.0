Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4035A40DE6A
	for <lists+linux-input@lfdr.de>; Thu, 16 Sep 2021 17:46:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239031AbhIPPsM (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 16 Sep 2021 11:48:12 -0400
Received: from mx22.baidu.com ([220.181.50.185]:43832 "EHLO baidu.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S239127AbhIPPsM (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 16 Sep 2021 11:48:12 -0400
Received: from BC-Mail-Ex09.internal.baidu.com (unknown [172.31.51.49])
        by Forcepoint Email with ESMTPS id 1C8B01DA6463004D2149;
        Thu, 16 Sep 2021 23:31:17 +0800 (CST)
Received: from BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) by
 BC-Mail-Ex09.internal.baidu.com (172.31.51.49) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2242.12; Thu, 16 Sep 2021 23:31:16 +0800
Received: from LAPTOP-UKSR4ENP.internal.baidu.com (172.31.63.8) by
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.14; Thu, 16 Sep 2021 23:31:16 +0800
From:   Cai Huoqing <caihuoqing@baidu.com>
To:     <caihuoqing@baidu.com>
CC:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] Input: ams_delta_serio - Make use of the helper function dev_err_probe()
Date:   Thu, 16 Sep 2021 23:31:11 +0800
Message-ID: <20210916153111.13780-1-caihuoqing@baidu.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.31.63.8]
X-ClientProxiedBy: BC-Mail-Ex11.internal.baidu.com (172.31.51.51) To
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
 drivers/input/serio/ams_delta_serio.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/input/serio/ams_delta_serio.c b/drivers/input/serio/ams_delta_serio.c
index 1c0be299f179..9963f336e253 100644
--- a/drivers/input/serio/ams_delta_serio.c
+++ b/drivers/input/serio/ams_delta_serio.c
@@ -121,8 +121,8 @@ static int ams_delta_serio_init(struct platform_device *pdev)
 
 	priv->vcc = devm_regulator_get(&pdev->dev, "vcc");
 	if (IS_ERR(priv->vcc)) {
-		err = PTR_ERR(priv->vcc);
-		dev_err(&pdev->dev, "regulator request failed (%d)\n", err);
+		err = dev_err_probe(&pdev->dev, PTR_ERR(priv->vcc),
+				    "regulator request failed\n");
 		/*
 		 * When running on a non-dt platform and requested regulator
 		 * is not available, devm_regulator_get() never returns
-- 
2.25.1

