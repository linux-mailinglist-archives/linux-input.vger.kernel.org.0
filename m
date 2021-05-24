Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07B4138DF5B
	for <lists+linux-input@lfdr.de>; Mon, 24 May 2021 04:46:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232108AbhEXCsT (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 23 May 2021 22:48:19 -0400
Received: from m12-16.163.com ([220.181.12.16]:43391 "EHLO m12-16.163.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231896AbhEXCsT (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sun, 23 May 2021 22:48:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
        s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=F5DKz
        egLK/OFJv8BSflRc3rA+ySwDrYnnEJttEQFJbQ=; b=K+kSFmF0N32MZGA6Dp7qy
        aoSsxtWkx2SBzwtj+4WoW89ltA+cMPz5ixCNcjqxXs+5qWCyo+sEFmQdvxMyOSub
        7xqIkir59I2mWQ5Vv52XeuahLCjgFyYRlw9TR7SUWK8Y59mBQ9n9lDODzawoa4Lu
        ag9PbUDqWg/VLCvWKMTmec=
Received: from COOL-20201218BF.ccdomain.com (unknown [218.94.48.178])
        by smtp12 (Coremail) with SMTP id EMCowACna0VzE6tg5JHZsw--.50302S2;
        Mon, 24 May 2021 10:46:24 +0800 (CST)
From:   mateng <ayowoe@163.com>
To:     hadess@hadess.net, dmitry.torokhov@gmail.com
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        mateng <mateng@yulong.com>
Subject: [PATCH] touchscreen/goodix.c:unify format
Date:   Mon, 24 May 2021 10:46:19 +0800
Message-Id: <20210524024619.1227-1-ayowoe@163.com>
X-Mailer: git-send-email 2.29.2.windows.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: EMCowACna0VzE6tg5JHZsw--.50302S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Gr1rJr17CF4xWFyUWw47XFb_yoWfJrb_W3
        4rXF17Wr12kr4Ykryqvw13Z34rtr4v9rZ5C3WagrW5Zry7trsxt397A3WFvrZ8WFyjyay7
        Jr43Kr4Svw4I9jkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUbRBT7UUUUU==
X-Originating-IP: [218.94.48.178]
X-CM-SenderInfo: 5d1r40rh6rljoofrz/1tbiPgGcKlxBm2JPFAAAs2
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: mateng <mateng@yulong.com>

unify format

Signed-off-by: mateng <mateng@yulong.com>
---
 drivers/input/touchscreen/goodix.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/input/touchscreen/goodix.c b/drivers/input/touchscreen/goodix.c
index c682b02..ab12065 100644
--- a/drivers/input/touchscreen/goodix.c
+++ b/drivers/input/touchscreen/goodix.c
@@ -210,7 +210,7 @@ static int goodix_check_cfg_16(struct goodix_ts_data *ts,
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "WinBook"),
 			DMI_MATCH(DMI_PRODUCT_NAME, "TW100")
-		}
+		},
 	},
 	{
 		.ident = "WinBook TW700",
@@ -230,7 +230,7 @@ static int goodix_check_cfg_16(struct goodix_ts_data *ts,
 		/* YB1-X91L/F and YB1-X90L/F */
 		.matches = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "Lenovo YB1-X9")
-		}
+		},
 	},
 #endif
 	{}
-- 
1.9.1


