Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 33AFD2D1561
	for <lists+linux-input@lfdr.de>; Mon,  7 Dec 2020 17:02:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725832AbgLGP7s (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 7 Dec 2020 10:59:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725822AbgLGP7r (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 7 Dec 2020 10:59:47 -0500
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE462C061749;
        Mon,  7 Dec 2020 07:59:01 -0800 (PST)
Received: by mail-pj1-x1042.google.com with SMTP id hk16so7693263pjb.4;
        Mon, 07 Dec 2020 07:59:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=BE4wQ+R2PT4XIQVS+F1KT6eVPOo758cR6bK64GA7Y+E=;
        b=dhOtYwjY9h9J7gbcBq7nT67T+F3ZGsTdIqqgznzSJ+16eMrwZ9mDeH84Q4fPNY2HG5
         eha6hFU01xytvOzsqHIx9nYC6Fd4gMUZyCz2wlF5UBLzQ/ljYqbwLnl8i/eVnLs0dPSh
         G7Dhfa+whCkOXcb0ODg/Nqh3fslZVwc2IdMRUheEQjLEdSwbfj+HKIogDiIOcmkGveSu
         WMJc4tBC2wxpdPnTTc/tJxWfVoeYHTAWRyVkF469elgYk2VnS00xWtud6vySscFwp1Lw
         Pvk8T+3nfz5mggUISYmkBIruS8nUTyzWGg3VxdQmJyO4fGFeQstE1JrSMsTMnt8pfshU
         b+hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=BE4wQ+R2PT4XIQVS+F1KT6eVPOo758cR6bK64GA7Y+E=;
        b=ba8ruMRrrPKvIPwKDpjSZzSrI/LSfdPcBeT3p+vW4BLIf6n06cEfv7GR22jSnmUmlJ
         KBwhM9+O1VtgiRdqTObHGA6CcSdVzA+FEmQJxlCW++gqqqnDQc6cvzrwJ/Fxg6dAOZ0W
         g6iqFwhFlLviCi7bQd+X1zjyEbq+XVzt2rwE+FkhtRb+R5WOKGEkdKppB5vZYJ1ypoO8
         JEtMv5wbTj6QC0WcOswXDXw6jYCLSV074X8sWVgpboH1wNo4Rd2bj146TmXnGOn6lzcV
         +bhSeS6LZ4YpJZljQOi2Aqp5lytQx8b8aMLamL7E4GcW0UQgMNjSI/iXgjRX25K+tS2e
         p1mg==
X-Gm-Message-State: AOAM533lYpE31sjSNjhugW4E7kDM5eEOO7MMg7UJ351rqiwtvV5m2+FU
        q1i7O4CjcM3+nASgDjST5r4=
X-Google-Smtp-Source: ABdhPJwBQ0Gd5rbfhY7/vxDSpYl1I86bSHi85ogUVzX2imXbcCHQqhARi4v7Ph5ABOBRDoqhsWaGFQ==
X-Received: by 2002:a17:90a:d308:: with SMTP id p8mr17026576pju.110.1607356741250;
        Mon, 07 Dec 2020 07:59:01 -0800 (PST)
Received: from manjaro (ik1-419-41911.vs.sakura.ne.jp. [153.127.43.165])
        by smtp.gmail.com with ESMTPSA id t22sm188688pja.1.2020.12.07.07.58.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Dec 2020 07:59:00 -0800 (PST)
Date:   Mon, 7 Dec 2020 23:58:36 +0800
From:   Zhaoyu Liu <zackary.liu.pro@gmail.com>
To:     jikos@kernel.org, benjamin.tissoires@redhat.com
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] hidraw: use the tab replace spaces in hidraw_init()
Message-ID: <X85RLAPzYjsQQUdz@manjaro>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Use the tab replace spaces in hidraw_init() to ensure that the code tidy.

Signed-off-by: Zhaoyu Liu <zackary.liu.pro@gmail.com>
---
 drivers/hid/hidraw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/hidraw.c b/drivers/hid/hidraw.c
index 2eee5e31c2b7..249666ea9a5a 100644
--- a/drivers/hid/hidraw.c
+++ b/drivers/hid/hidraw.c
@@ -600,7 +600,7 @@ int __init hidraw_init(void)
 		goto error_cdev;
 	}
 
-        cdev_init(&hidraw_cdev, &hidraw_ops);
+	cdev_init(&hidraw_cdev, &hidraw_ops);
 	result = cdev_add(&hidraw_cdev, dev_id, HIDRAW_MAX_DEVICES);
 	if (result < 0)
 		goto error_class;
-- 
2.29.2

