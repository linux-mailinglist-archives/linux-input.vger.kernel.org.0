Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4F4BD630CDD
	for <lists+linux-input@lfdr.de>; Sat, 19 Nov 2022 08:10:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232655AbiKSHKn (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 19 Nov 2022 02:10:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232547AbiKSHKm (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 19 Nov 2022 02:10:42 -0500
Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AEBE89A5D8
        for <linux-input@vger.kernel.org>; Fri, 18 Nov 2022 23:10:41 -0800 (PST)
Received: from fsav314.sakura.ne.jp (fsav314.sakura.ne.jp [153.120.85.145])
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 2AJ7AKY6030076;
        Sat, 19 Nov 2022 16:10:20 +0900 (JST)
        (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav314.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav314.sakura.ne.jp);
 Sat, 19 Nov 2022 16:10:20 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav314.sakura.ne.jp)
Received: from [192.168.1.9] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
        (authenticated bits=0)
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 2AJ79u7t030016
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
        Sat, 19 Nov 2022 16:10:20 +0900 (JST)
        (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <6d878e01-6c2f-8766-2578-c95030442369@I-love.SAKURA.ne.jp>
Date:   Sat, 19 Nov 2022 16:09:56 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: [PATCH] Input: MT - use __GFP_NOWARN allocation at
 input_mt_init_slots()
To:     Henrik Rydberg <rydberg@bitmath.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
References: <000000000000de2f4f05b8942be9@google.com>
Content-Language: en-US
Cc:     syzkaller-bugs@googlegroups.com,
        syzbot <syzbot+0122fa359a69694395d5@syzkaller.appspotmail.com>,
        akpm@linux-foundation.org,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
From:   Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
In-Reply-To: <000000000000de2f4f05b8942be9@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

syzbot is reporting too large allocation at input_mt_init_slots() {1], for
num_slots is supplied from userspace using ioctl(UI_DEV_CREATE).
Also, replace n2 with array_size(), for 32bits variable n2 will overflow
if num_slots >= 65536.

Link: https://syzkaller.appspot.com/bug?extid=0122fa359a69694395d5 [1]
Reported-by: syzbot <syzbot+0122fa359a69694395d5@syzkaller.appspotmail.com>
Signed-off-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
---
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
2.34.1


