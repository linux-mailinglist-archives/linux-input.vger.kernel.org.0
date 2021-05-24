Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 767A338E384
	for <lists+linux-input@lfdr.de>; Mon, 24 May 2021 11:50:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232415AbhEXJvq (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 24 May 2021 05:51:46 -0400
Received: from m12-14.163.com ([220.181.12.14]:59993 "EHLO m12-14.163.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232313AbhEXJvp (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 24 May 2021 05:51:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
        s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=4knG8
        BtykaQwETiDN9cbwBvGvd+lcXmV7rz/lIeDAUU=; b=lxzJAwSquvyFwDCmBIlSK
        HrZrYyf7GP2ojv2foBYAyThshLVBDk3VrxpGdF5G1HUxKbp7fxbMbUXkTJjZu5VS
        /Dh1AOE3btrOFIhmoQa4Y2tGAc/MpaJG8yyjy7EJ0nfp4nqF6XM4dKfWAswug4KA
        utcySTnH4Nzc+eMODq3jkM=
Received: from COOL-20201218BF.ccdomain.com (unknown [218.94.48.178])
        by smtp10 (Coremail) with SMTP id DsCowAD3UW_4cqtgCM3HKg--.29986S2;
        Mon, 24 May 2021 17:33:57 +0800 (CST)
From:   mateng <ayowoe@163.com>
To:     hadess@hadess.net, dmitry.torokhov@gmail.com
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        mateng <mateng@yulong.com>
Subject: [PATCH] touchscreen/goodix.c:remove no needed commas
Date:   Mon, 24 May 2021 17:33:54 +0800
Message-Id: <20210524093354.1356-1-ayowoe@163.com>
X-Mailer: git-send-email 2.29.2.windows.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: DsCowAD3UW_4cqtgCM3HKg--.29986S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7WrWktF17AFW3GrW7uw48Zwb_yoW8Xry5pr
        s3Wry7Ar1qya1UXr45ta1DXFn8ur4rKay0ka9rAw4rXayUJw18ZasYyFn2gFyUtFZ8J3Wk
        Aw18Zw18Ca97AaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jnyCXUUUUU=
X-Originating-IP: [218.94.48.178]
X-CM-SenderInfo: 5d1r40rh6rljoofrz/xtbBIg+cKl3l-tppUwAAs9
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: mateng <mateng@yulong.com>

remove no needed commas

Signed-off-by: mateng <mateng@yulong.com>
---
 drivers/input/touchscreen/goodix.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/input/touchscreen/goodix.c b/drivers/input/touchscreen/goodix.c
index c682b02..35febde 100644
--- a/drivers/input/touchscreen/goodix.c
+++ b/drivers/input/touchscreen/goodix.c
@@ -190,8 +190,8 @@ static int goodix_check_cfg_16(struct goodix_ts_data *ts,
 			/* tPAD is too generic, also match on bios date */
 			DMI_MATCH(DMI_BOARD_VENDOR, "TECLAST"),
 			DMI_MATCH(DMI_BOARD_NAME, "tPAD"),
-			DMI_MATCH(DMI_BIOS_DATE, "12/19/2014"),
-		},
+			DMI_MATCH(DMI_BIOS_DATE, "12/19/2014")
+		}
 	},
 	{
 		.ident = "Teclast X98 Pro",
@@ -202,8 +202,8 @@ static int goodix_check_cfg_16(struct goodix_ts_data *ts,
 			 * (sometimes)...
 			 */
 			DMI_MATCH(DMI_BOARD_VENDOR, "TECLAST"),
-			DMI_MATCH(DMI_BIOS_DATE, "10/28/2015"),
-		},
+			DMI_MATCH(DMI_BIOS_DATE, "10/28/2015")
+		}
 	},
 	{
 		.ident = "WinBook TW100",
@@ -217,7 +217,7 @@ static int goodix_check_cfg_16(struct goodix_ts_data *ts,
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "WinBook"),
 			DMI_MATCH(DMI_PRODUCT_NAME, "TW700")
-		},
+		}
 	},
 #endif
 	{}
@@ -246,7 +246,7 @@ static int goodix_check_cfg_16(struct goodix_ts_data *ts,
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "Cube"),
 			DMI_MATCH(DMI_PRODUCT_NAME, "I15-TC")
-		},
+		}
 	},
 #endif
 	{}
-- 
1.9.1

