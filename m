Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 440D76CBD85
	for <lists+linux-input@lfdr.de>; Tue, 28 Mar 2023 13:26:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230156AbjC1L0Q (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 28 Mar 2023 07:26:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232394AbjC1L0P (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 28 Mar 2023 07:26:15 -0400
Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BD0C3C22
        for <linux-input@vger.kernel.org>; Tue, 28 Mar 2023 04:26:11 -0700 (PDT)
Received: from fsav414.sakura.ne.jp (fsav414.sakura.ne.jp [133.242.250.113])
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 32SBPlIK066834;
        Tue, 28 Mar 2023 20:25:47 +0900 (JST)
        (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav414.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav414.sakura.ne.jp);
 Tue, 28 Mar 2023 20:25:47 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav414.sakura.ne.jp)
Received: from [192.168.1.6] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
        (authenticated bits=0)
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 32SBPlZv066831
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
        Tue, 28 Mar 2023 20:25:47 +0900 (JST)
        (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <aa0d1e42-9a62-698b-fa89-000ce397316c@I-love.SAKURA.ne.jp>
Date:   Tue, 28 Mar 2023 20:25:48 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-US
To:     Henrik Rydberg <rydberg@bitmath.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
From:   Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Subject: [PATCH (repost)] Input: MT - use __GFP_NOWARN allocation at
 input_mt_init_slots()
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

syzbot is reporting too large allocation at input_mt_init_slots(), for
num_slots is supplied from userspace using ioctl(UI_DEV_CREATE).

Use __GFP_NOWARN. Also, replace n2 with array_size(), for 32bits variable
n2 will overflow if num_slots >= 65536 and will cause out of bounds
read/write at input_mt_set_matrix()/input_mt_set_slots() on architectures
where PAGE_SIZE > 4096 is available (e.g. PPC64).

Reported-by: syzbot <syzbot+0122fa359a69694395d5@syzkaller.appspotmail.com>
Link: https://syzkaller.appspot.com/bug?extid=0122fa359a69694395d5
Signed-off-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
---
Dmitry Torokhov proposed limiting max size to accept. But since it seems
that nobody knows appropriate max size to accept, reposting as-is.
https://lkml.kernel.org/r/03e8c3f0-bbbf-af37-6f52-67547cbd4cde@I-love.SAKURA.ne.jp

 drivers/input/input-mt.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/input/input-mt.c b/drivers/input/input-mt.c
index 14b53dac1253..cf74579462ba 100644
--- a/drivers/input/input-mt.c
+++ b/drivers/input/input-mt.c
@@ -47,7 +47,7 @@ int input_mt_init_slots(struct input_dev *dev, unsigned int num_slots,
 	if (mt)
 		return mt->num_slots != num_slots ? -EINVAL : 0;
 
-	mt = kzalloc(struct_size(mt, slots, num_slots), GFP_KERNEL);
+	mt = kzalloc(struct_size(mt, slots, num_slots), GFP_KERNEL | __GFP_NOWARN);
 	if (!mt)
 		goto err_mem;
 
@@ -80,8 +80,8 @@ int input_mt_init_slots(struct input_dev *dev, unsigned int num_slots,
 	if (flags & INPUT_MT_SEMI_MT)
 		__set_bit(INPUT_PROP_SEMI_MT, dev->propbit);
 	if (flags & INPUT_MT_TRACK) {
-		unsigned int n2 = num_slots * num_slots;
-		mt->red = kcalloc(n2, sizeof(*mt->red), GFP_KERNEL);
+		mt->red = kcalloc(array_size(num_slots, num_slots),
+				  sizeof(*mt->red), GFP_KERNEL | __GFP_NOWARN);
 		if (!mt->red)
 			goto err_mem;
 	}
-- 
2.18.4
