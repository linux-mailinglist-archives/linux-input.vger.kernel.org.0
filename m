Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF08934581E
	for <lists+linux-input@lfdr.de>; Tue, 23 Mar 2021 08:03:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230042AbhCWHDN (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 23 Mar 2021 03:03:13 -0400
Received: from m12-11.163.com ([220.181.12.11]:59333 "EHLO m12-11.163.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229451AbhCWHC6 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 23 Mar 2021 03:02:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
        s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=CJLfo
        sLeNSNlUjydq+9W2TUSg8WBNK8o8siasoDi61k=; b=YqhTAqjvcS+r68fSQkHgM
        MNEeF9xIjNtG1FG/kmbSdQN7iepU6yLMT7Sdw5m+TKKL52QAckLtnMDaHv9fUiRQ
        VleL7CAAhAvieYR/YachJteWZVZZtG+JD0hlbo4mwNGoklSGEYZyCK2HdBwOQycs
        jSgp5Rfn3SQVdg+hyJIGOw=
Received: from COOL-20201218BF.ccdomain.com (unknown [218.94.48.178])
        by smtp7 (Coremail) with SMTP id C8CowAA3YqyQkllgA+OrTg--.2683S2;
        Tue, 23 Mar 2021 15:02:53 +0800 (CST)
From:   mateng <ayowoe@163.com>
To:     dmitry.torokhov@gmail.com
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        mateng <mateng@yulong.com>
Subject: [PATCH] input/serio:unneeded variable:delay
Date:   Tue, 23 Mar 2021 15:02:50 +0800
Message-Id: <20210323070250.1306-1-ayowoe@163.com>
X-Mailer: git-send-email 2.29.2.windows.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: C8CowAA3YqyQkllgA+OrTg--.2683S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7GryftF4UJrykWw18Wry7trb_yoW3AFg_u3
        s5Zrn7JFyjywn0kFnrZry3Zr9YkanFqFyI9F4Fyw13ZryYqrWftF1DCrW7Cw42vr4fWF9r
        Kw17Gr95Ar45CjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU8WrW5UUUUU==
X-Originating-IP: [218.94.48.178]
X-CM-SenderInfo: 5d1r40rh6rljoofrz/1tbiWx5eKlSIpZefZwAAsn
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: mateng <mateng@yulong.com>

delete unneeded variable 'delay'

Signed-off-by: mateng <mateng@yulong.com>
---
 drivers/input/serio/i8042.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/input/serio/i8042.c b/drivers/input/serio/i8042.c
index abae23a..145bda1 100644
--- a/drivers/input/serio/i8042.c
+++ b/drivers/input/serio/i8042.c
@@ -1126,7 +1126,6 @@ static void i8042_controller_reset(bool s2r_wants_reset)
 
 static long i8042_panic_blink(int state)
 {
-	long delay = 0;
 	char led;
 
 	led = (state) ? 0x01 | 0x04 : 0;
@@ -1142,7 +1141,7 @@ static long i8042_panic_blink(int state)
 	dbg("%02x -> i8042 (panic blink)\n", led);
 	i8042_write_data(led);
 	DELAY;
-	return delay;
+	return 0;
 }
 
 #undef DELAY
-- 
1.9.1

