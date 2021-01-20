Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EEABC2FC6F6
	for <lists+linux-input@lfdr.de>; Wed, 20 Jan 2021 02:42:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730979AbhATBmY (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 19 Jan 2021 20:42:24 -0500
Received: from m12-18.163.com ([220.181.12.18]:48870 "EHLO m12-18.163.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729906AbhATBmE (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 19 Jan 2021 20:42:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
        s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=1Gm7H
        tgDNLpNAVltYOoyuVgoYF8I/DZ9P/osH6rUo/E=; b=HUIeffIB1Mai1UpHVT4bG
        FlHArhbhEbXsHSYH/0WvQypzMWBm+gWoDZsuRaCwg7LdygfNfaN66CfrlTnfi3e5
        EE/IfgL9tTQ2ucF3c9eI24ENhAcfNkEFZZbcEqA7K1nbdHeKPE7zqvqaYnw+1wjU
        KpQhGJxI0RshZnwPWektNM=
Received: from jiangzhipeng.ccdomain.com (unknown [218.94.48.178])
        by smtp14 (Coremail) with SMTP id EsCowAC3DNbjfgdgKeMeQA--.56094S2;
        Wed, 20 Jan 2021 08:53:04 +0800 (CST)
From:   jzp0409 <jzp0409@163.com>
To:     dmitry.torokhov@gmail.com
Cc:     linux-input@vger.kernel.org, jiangzhipeng <jiangzhipeng@yulong.com>
Subject: [PATCH] Input: ft5x06 - of_device_id using CONFIG_OF
Date:   Wed, 20 Jan 2021 08:53:01 +0800
Message-Id: <20210120005301.2158-1-jzp0409@163.com>
X-Mailer: git-send-email 2.30.0.windows.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: EsCowAC3DNbjfgdgKeMeQA--.56094S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrtrW3KF13Ar47Gw1fXw4fXwb_yoWDtrc_ur
        yrXrn7trWrAr1vkF1qq343Zr92q3W8W3s5Ww1UKF45Zw1rXan8GFsxWwn8J3yUCr48tFW7
        u3WfWF1rKa129jkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUbzwZDUUUUU==
X-Originating-IP: [218.94.48.178]
X-CM-SenderInfo: hm2sikiqz6il2tof0z/1tbiRBAghlSIiKBF0AAAsT
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: jiangzhipeng <jiangzhipeng@yulong.com>

ft5x06 use of_device_id,Use CONFIG_OF include

Signed-off-by: jiangzhipeng <jiangzhipeng@yulong.com>
---
 drivers/input/touchscreen/edt-ft5x06.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/input/touchscreen/edt-ft5x06.c b/drivers/input/touchscreen/edt-ft5x06.c
index 2eefbc2..c69fde0 100644
--- a/drivers/input/touchscreen/edt-ft5x06.c
+++ b/drivers/input/touchscreen/edt-ft5x06.c
@@ -1371,6 +1371,7 @@ static SIMPLE_DEV_PM_OPS(edt_ft5x06_ts_pm_ops,
 };
 MODULE_DEVICE_TABLE(i2c, edt_ft5x06_ts_id);
 
+#ifdef CONFIG_OF
 static const struct of_device_id edt_ft5x06_of_match[] = {
 	{ .compatible = "edt,edt-ft5206", .data = &edt_ft5x06_data },
 	{ .compatible = "edt,edt-ft5306", .data = &edt_ft5x06_data },
@@ -1382,6 +1383,7 @@ static SIMPLE_DEV_PM_OPS(edt_ft5x06_ts_pm_ops,
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, edt_ft5x06_of_match);
+#endif
 
 static struct i2c_driver edt_ft5x06_ts_driver = {
 	.driver = {
-- 
1.9.1


