Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C126F30BDC1
	for <lists+linux-input@lfdr.de>; Tue,  2 Feb 2021 13:10:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231289AbhBBMJK (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 2 Feb 2021 07:09:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231281AbhBBMIx (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 2 Feb 2021 07:08:53 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCF94C061573;
        Tue,  2 Feb 2021 04:08:12 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id v24so27565862lfr.7;
        Tue, 02 Feb 2021 04:08:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zZCZ+wr8JRQsDltWKVRvfaIgSPnse+tD2ObDmx6z1mo=;
        b=WE6eDV958XPFL2lx62O08hHtA4AbTQKkx99h3LgDSiB8kL4k18sPL29upJlhwy79pW
         dRE9GxYeTwkpywtjjLXy1FsDikUdVM0GoydTIbdG4O1iTCTjymUN4hrll8XWJVlyY+yl
         6a/1394h+4586CA4idzuKMeYwn6tKQp8JKgcj3wlWTE4yVLfMHRk/BmusiN+RsTg3Nij
         B0/Q6Sj5V0zAQ4EdSvUmr1/aDVfFt4lm+dSoacZ6PVGkVKg5MXiyFKlS1eMAayfJyJ7H
         gGkRlmWMhZMevMiRAbw+CQkJ9O+UoeQ8qfuDXyRn2lncIdR/sKwLykcPjGmcOE78RnlA
         is6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zZCZ+wr8JRQsDltWKVRvfaIgSPnse+tD2ObDmx6z1mo=;
        b=iW8JPFTuwAgDcc1KA+8l6JWsSc8c45pz2I+zNHfOcDag7j/BsL/MWHuarHcbGkwT1o
         QkXh7z5swnLHG1BIxkV7hmfQaYa3YJUhgsHQ1yXRC3TYNGioDeKhoEzh3dfxHzAiesZA
         m6nxxXUNDCXYvJUfBAiggOEEiEqagwJGUVXQyueh8jajpdU/OdfhnasJaetQZtImO3ZG
         SAnZkP/iBtbeIDYBsiMvKg7x5RRguwggw6HPOGJBrn3jUGIHI2tYi196HnWG7kPRvJeY
         o2rK3bn8WCsoeGxGF5/bH+XmU+010rTbZRc2+kO1hTEFxug6KMYSs5gdHTxuuRPrZbCZ
         wITA==
X-Gm-Message-State: AOAM531jGMcbaTIum70KM7rsOLO814D988AuFRq8bXJo6yDXU3A1Q53Q
        nKKK/Yot0rXe5SEL51Mhyrg=
X-Google-Smtp-Source: ABdhPJzlgkqPiX4UUZ8aMlEwbhk6EdlzN9uDmhnCePDFFjoZGK+1yh+5uZEfT9h5TWq+18bIEG0J/A==
X-Received: by 2002:a05:6512:39c3:: with SMTP id k3mr5404293lfu.501.1612267691278;
        Tue, 02 Feb 2021 04:08:11 -0800 (PST)
Received: from localhost.localdomain ([146.158.65.228])
        by smtp.googlemail.com with ESMTPSA id i5sm3918806ljj.42.2021.02.02.04.08.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Feb 2021 04:08:10 -0800 (PST)
From:   Sabyrzhan Tasbolatov <snovitoll@gmail.com>
To:     rydberg@bitmath.org, dmitry.torokhov@gmail.com
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        syzbot+0122fa359a69694395d5@syzkaller.appspotmail.com
Subject: [PATCH] drivers/mt: restrict length of kzalloc in input_mt_init_slots()
Date:   Tue,  2 Feb 2021 18:08:07 +0600
Message-Id: <20210202120807.1394788-1-snovitoll@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

syzbot found WARNING in input_mt_init_slots [1] when
struct_size(mt, slots, num_slots)=0x40006 where num_slots=0x10001,
which exceeds KMALLOC_MAX_SIZE (0x40000) and causes
order >= MAX_ORDER condition.

[1]
Call Trace:
 alloc_pages_current+0x18c/0x2a0 mm/mempolicy.c:2267
 alloc_pages include/linux/gfp.h:547 [inline]
 kmalloc_order+0x2e/0xb0 mm/slab_common.c:837
 kmalloc_order_trace+0x14/0x120 mm/slab_common.c:853
 kmalloc include/linux/slab.h:557 [inline]
 kzalloc include/linux/slab.h:682 [inline]
 input_mt_init_slots drivers/input/input-mt.c:49 [inline]

Reported-by: syzbot+0122fa359a69694395d5@syzkaller.appspotmail.com
Signed-off-by: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
---
 drivers/input/input-mt.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/input/input-mt.c b/drivers/input/input-mt.c
index 44fe6f2f063c..e542f45a45ab 100644
--- a/drivers/input/input-mt.c
+++ b/drivers/input/input-mt.c
@@ -40,13 +40,18 @@ int input_mt_init_slots(struct input_dev *dev, unsigned int num_slots,
 {
 	struct input_mt *mt = dev->mt;
 	int i;
+	size_t mt_size = 0;
 
 	if (!num_slots)
 		return 0;
 	if (mt)
 		return mt->num_slots != num_slots ? -EINVAL : 0;
 
-	mt = kzalloc(struct_size(mt, slots, num_slots), GFP_KERNEL);
+	mt_size = struct_size(mt, slots, num_slots);
+	if (mt_size > KMALLOC_MAX_SIZE)
+		return -ENOMEM;
+
+	mt = kzalloc(mt_size, GFP_KERNEL);
 	if (!mt)
 		goto err_mem;
 
-- 
2.25.1

