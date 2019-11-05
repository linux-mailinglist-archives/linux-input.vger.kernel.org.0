Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8FE92EF5A4
	for <lists+linux-input@lfdr.de>; Tue,  5 Nov 2019 07:47:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387586AbfKEGqz (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 5 Nov 2019 01:46:55 -0500
Received: from mail-m972.mail.163.com ([123.126.97.2]:45014 "EHLO
        mail-m972.mail.163.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387499AbfKEGqz (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 5 Nov 2019 01:46:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
        s=s110527; h=From:Subject:Date:Message-Id; bh=ykFCQO/BivaoSQgfd6
        lpCH8QAeQHhZEYyTcon/QvQdY=; b=B1IxgbEPQCTyR8+MZIEfDb08bw1rkRw6AN
        0HPCCvRt9PM8uKMx62Wbnk8NKi/DC85KFaEEflcBIkeZJ0yq7h2ri9TpaVn9l1VB
        bsfMi080/jf/xasdsKM2CHwZEykUnKSLKjtUVTPLZvcwF/8RzIjlGjydLHyzOQIe
        0bUCpM05s=
Received: from localhost.localdomain (unknown [202.112.113.212])
        by smtp2 (Coremail) with SMTP id GtxpCgBnqpPUGsFdAK2lAw--.391S3;
        Tue, 05 Nov 2019 14:46:49 +0800 (CST)
From:   Pan Bian <bianpan2016@163.com>
To:     Ferruh Yigit <fery@cypress.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Pan Bian <bianpan2016@163.com>
Subject: [PATCH] Input: cyttsp4_core: fix use after free bug
Date:   Tue,  5 Nov 2019 14:46:19 +0800
Message-Id: <1572936379-6423-1-git-send-email-bianpan2016@163.com>
X-Mailer: git-send-email 2.7.4
X-CM-TRANSID: GtxpCgBnqpPUGsFdAK2lAw--.391S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7Cr1kWFy3KF47Ww1ktw4DXFb_yoW8GrykpF
        Z8G3s2k3y5Ga18Jw1qqFykZFn8Jw45Ka4rGFsrGwn5ur15Ary0yrn0vrWxKa45ArWkCa4r
        Wr1avr4UGa4kCaUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UQ4SwUUUUU=
X-Originating-IP: [202.112.113.212]
X-CM-SenderInfo: held01tdqsiiqw6rljoofrz/xtbBZxlkcletw8SDFgAAsA
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The device md->input is used after it is released. Setting the device
data to NULL is unnecessary as the device is never used again. Instead,
md->input should be assigned NULL to avoid accessing the freed memory
accidently. Besides, checking md->si against NULL is superfluous as it
points to a variable address, which cannot be NULL.

Signed-off-by: Pan Bian <bianpan2016@163.com>
---
 drivers/input/touchscreen/cyttsp4_core.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/input/touchscreen/cyttsp4_core.c b/drivers/input/touchscreen/cyttsp4_core.c
index 4b22d49a0f49..2cd5f835665e 100644
--- a/drivers/input/touchscreen/cyttsp4_core.c
+++ b/drivers/input/touchscreen/cyttsp4_core.c
@@ -1990,11 +1990,6 @@ static int cyttsp4_mt_probe(struct cyttsp4 *cd)
 
 	/* get sysinfo */
 	md->si = &cd->sysinfo;
-	if (!md->si) {
-		dev_err(dev, "%s: Fail get sysinfo pointer from core p=%p\n",
-			__func__, md->si);
-		goto error_get_sysinfo;
-	}
 
 	rc = cyttsp4_setup_input_device(cd);
 	if (rc)
@@ -2004,8 +1999,7 @@ static int cyttsp4_mt_probe(struct cyttsp4 *cd)
 
 error_init_input:
 	input_free_device(md->input);
-error_get_sysinfo:
-	input_set_drvdata(md->input, NULL);
+	md->input = NULL;
 error_alloc_failed:
 	dev_err(dev, "%s failed.\n", __func__);
 	return rc;
-- 
2.7.4

