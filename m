Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EDD0C107874
	for <lists+linux-input@lfdr.de>; Fri, 22 Nov 2019 20:53:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727816AbfKVTuU (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 22 Nov 2019 14:50:20 -0500
Received: from mail.kernel.org ([198.145.29.99]:51072 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727813AbfKVTuT (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 22 Nov 2019 14:50:19 -0500
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B73F72075B;
        Fri, 22 Nov 2019 19:50:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1574452218;
        bh=gFCL55yY9BQIM8t0HoiwSrpJw767D1kWJryM0A1GYfw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=tq5UqK5zufoxHwsWshMfdnPuqQgd4U5B2qoZX+1hPWIWdDwYkEsgQlohI7/rm4ZhQ
         TNQgnOHO+xZEFuqT9wkpFVCg7ASgWKBeMaWYBT1uVEcijJFk/gJAye3RgPWbd2eX2D
         WED1jFQOUQx3lTeeG5FTtesCAMaorYwAD3Ycsj68=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Pan Bian <bianpan2016@163.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Sasha Levin <sashal@kernel.org>, linux-input@vger.kernel.org
Subject: [PATCH AUTOSEL 4.4 3/9] Input: cyttsp4_core - fix use after free bug
Date:   Fri, 22 Nov 2019 14:50:08 -0500
Message-Id: <20191122195014.25065-3-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191122195014.25065-1-sashal@kernel.org>
References: <20191122195014.25065-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Pan Bian <bianpan2016@163.com>

[ Upstream commit 79aae6acbef16f720a7949f8fc6ac69816c79d62 ]

The device md->input is used after it is released. Setting the device
data to NULL is unnecessary as the device is never used again. Instead,
md->input should be assigned NULL to avoid accessing the freed memory
accidently. Besides, checking md->si against NULL is superfluous as it
points to a variable address, which cannot be NULL.

Signed-off-by: Pan Bian <bianpan2016@163.com>
Link: https://lore.kernel.org/r/1572936379-6423-1-git-send-email-bianpan2016@163.com
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/input/touchscreen/cyttsp4_core.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/input/touchscreen/cyttsp4_core.c b/drivers/input/touchscreen/cyttsp4_core.c
index 5ed31057430c6..6e904048d1cb7 100644
--- a/drivers/input/touchscreen/cyttsp4_core.c
+++ b/drivers/input/touchscreen/cyttsp4_core.c
@@ -1972,11 +1972,6 @@ static int cyttsp4_mt_probe(struct cyttsp4 *cd)
 
 	/* get sysinfo */
 	md->si = &cd->sysinfo;
-	if (!md->si) {
-		dev_err(dev, "%s: Fail get sysinfo pointer from core p=%p\n",
-			__func__, md->si);
-		goto error_get_sysinfo;
-	}
 
 	rc = cyttsp4_setup_input_device(cd);
 	if (rc)
@@ -1986,8 +1981,6 @@ static int cyttsp4_mt_probe(struct cyttsp4 *cd)
 
 error_init_input:
 	input_free_device(md->input);
-error_get_sysinfo:
-	input_set_drvdata(md->input, NULL);
 error_alloc_failed:
 	dev_err(dev, "%s failed.\n", __func__);
 	return rc;
-- 
2.20.1

