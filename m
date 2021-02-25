Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D3703249C4
	for <lists+linux-input@lfdr.de>; Thu, 25 Feb 2021 05:33:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234703AbhBYEdL (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 24 Feb 2021 23:33:11 -0500
Received: from m12-11.163.com ([220.181.12.11]:50081 "EHLO m12-11.163.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231284AbhBYEdL (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 24 Feb 2021 23:33:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
        s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=sBCHY
        tyyAMjewXzDkB4dkOq0rbmi9+6n4xSLTpVJPbA=; b=RTiMRrQCst1Zv2y1BygZw
        /O2Q8dy6SIa0KXIkiAH3b1AGDx6spzjFOWOUk+q8IcVt/ZjMyiAXZ+tVChgp6hit
        V+hdD9xMTnThOKHFxwgowZW2aDGkv2s0J42vTNaLdgqa8tjsBC54PU4rbh+uRlG+
        s32R64/K+98jpnJ6AvK1eg=
Received: from COOL-20201222LC.ccdomain.com (unknown [218.94.48.178])
        by smtp7 (Coremail) with SMTP id C8CowAAHIKDWJzdg6NQbPQ--.26767S2;
        Thu, 25 Feb 2021 12:30:16 +0800 (CST)
From:   dingsenjie@163.com
To:     dmitry.torokhov@gmail.com, fery@cypress.com
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        dingsenjie <dingsenjie@yulong.com>
Subject: [PATCH] input: touchscreen: Remove unneeded variable: "rc"
Date:   Thu, 25 Feb 2021 12:29:39 +0800
Message-Id: <20210225042939.11100-1-dingsenjie@163.com>
X-Mailer: git-send-email 2.21.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: C8CowAAHIKDWJzdg6NQbPQ--.26767S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrZw4UWrWfJF4xKFW8Kw1rWFg_yoWDZwbE9w
        18twnrWry0kr47KrnrJ3sIvr97tryvvrnYv3Wkt343Gw15Xr47Ar9xW3WkA3y5WrW8uFWk
        ArsxGr10kw4xAjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU8F385UUUUU==
X-Originating-IP: [218.94.48.178]
X-CM-SenderInfo: 5glqw25hqmxvi6rwjhhfrp/1tbiThhEyFUDH3tfLwAAsY
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: dingsenjie <dingsenjie@yulong.com>

Remove unneeded "rc" variable in the cyttsp4_core.c.

Signed-off-by: dingsenjie <dingsenjie@yulong.com>
---
 drivers/input/touchscreen/cyttsp4_core.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/input/touchscreen/cyttsp4_core.c b/drivers/input/touchscreen/cyttsp4_core.c
index dccbcb9..93d3c77 100644
--- a/drivers/input/touchscreen/cyttsp4_core.c
+++ b/drivers/input/touchscreen/cyttsp4_core.c
@@ -544,7 +544,6 @@ static int cyttsp4_si_get_btn_data(struct cyttsp4 *cd)
 	int num_defined_keys;
 	u16 *key_table;
 	void *p;
-	int rc = 0;
 
 	if (si->si_ofs.num_btns) {
 		si->si_ofs.btn_keys_size = si->si_ofs.num_btns *
@@ -581,13 +580,13 @@ static int cyttsp4_si_get_btn_data(struct cyttsp4 *cd)
 			si->btn[btn].enabled = true;
 		}
 
-		return rc;
+		return 0;
 	}
 
 	si->si_ofs.btn_keys_size = 0;
 	kfree(si->btn);
 	si->btn = NULL;
-	return rc;
+	return 0;
 }
 
 static int cyttsp4_si_get_op_data_ptrs(struct cyttsp4 *cd)
-- 
1.9.1

