Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF3693E03BE
	for <lists+linux-input@lfdr.de>; Wed,  4 Aug 2021 16:58:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237635AbhHDO6Z (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 4 Aug 2021 10:58:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234423AbhHDO6Y (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 4 Aug 2021 10:58:24 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2F8CC0613D5;
        Wed,  4 Aug 2021 07:58:10 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id bq29so4980982lfb.5;
        Wed, 04 Aug 2021 07:58:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0KHBX9MFfC3gAIQoVx7XsxOXTg1RmXlly3J1yomsx8Y=;
        b=kubbpE0WZXwA3ZDnk/pFXsIrpiKokDra5W8mSYHPFdFW0axOBN6yF9ppazDZmOvRC7
         /jk67WyrdALQO+ApM4L/YjTFsAZ3Nb/zBLBGNRoqPXYLyTXMZx3mx9XxKcN7slIlECT+
         AUzgnz9hnsfnV0FfoD+UroKbr1qLq6TT6yZgJA7Hej7SOmqb3DNVcYKgJUDwTD/yXmoG
         NumKOvgjVRXI/bifrNQ9xlqRr0gf0nzDC1anhQb2tspIAAKjrWRKKt4jWMR4BiR6dLmX
         JlPgZwqXS3yC/gThJZ03hmS3VVD0pWErXye081aNwEq0RK/X1eX9R0rs1Ffa/JQTdzOO
         wfhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0KHBX9MFfC3gAIQoVx7XsxOXTg1RmXlly3J1yomsx8Y=;
        b=ZOkDfFdYq0i/s1LuEFFQTafBRUQTAJicB/uqQ9nxrkeyjPugDPHcOd0cTmAktoLcht
         unL6uH2uiq8brubLYSog2AlhlgpVIuGntvv8Q7yHbTzm+SmweuzBGgvaXMvq9NtxsXRu
         ar6pF/MbV/IkJRdm70EbkIIu6/UbYprfdK3O/tpBazDX2UFHR2zrsZI/zE+iXxAYVHKZ
         4ebD5QTr0CDunijoUE5SQ1UgtzyznUwfdx9KoroL7hbDOCwbSMwknifA6x4qbIG+RxFU
         QUfSkrDavB50GKIUFI2e75tj2GZgVIf+nPdRvqoErf8BvO7/IgrBwitEXKTSDST38te0
         EwKA==
X-Gm-Message-State: AOAM530ai8BlruomAPB47AsNRS2LzkRUbaY0+y9tm1BKGCPKQ40YIf3y
        zYP0FDNLHjCejlC2obIonxs=
X-Google-Smtp-Source: ABdhPJwk1zbXo3seT+3p/lO0qPQSx3SbvKsuTgEDe2X/4u5i59kQTAi5wvQe3oMsVMcO00Zw0D9TMg==
X-Received: by 2002:a05:6512:39c6:: with SMTP id k6mr10833756lfu.549.1628089089091;
        Wed, 04 Aug 2021 07:58:09 -0700 (PDT)
Received: from localhost.localdomain ([94.103.226.235])
        by smtp.gmail.com with ESMTPSA id v124sm219076lfa.192.2021.08.04.07.58.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Aug 2021 07:58:08 -0700 (PDT)
From:   Pavel Skripkin <paskripkin@gmail.com>
To:     dmitry.torokhov@gmail.com, aeh@db.org
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Pavel Skripkin <paskripkin@gmail.com>,
        syzbot+2d6d691af5ab4b7e66df@syzkaller.appspotmail.com
Subject: [PATCH] input: cm109: fix URB submitted while active
Date:   Wed,  4 Aug 2021 17:58:01 +0300
Message-Id: <20210804145801.2762-1-paskripkin@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Syzbot reported, that dev->urb_ctl was submitted while active. The
problem was in missing validation check. We should check, that dev->urb_ctl
is not pending before sumbitting it again.

Fail log:

URB 00000000cfeee59c submitted while active
WARNING: CPU: 1 PID: 8459 at drivers/usb/core/urb.c:378 usb_submit_urb+0x1271/0x1540 drivers/usb/core/urb.c:378
...
Call Trace:
 <IRQ>
 cm109_urb_irq_callback+0x44f/0xaa0 drivers/input/misc/cm109.c:422
 __usb_hcd_giveback_urb+0x2b0/0x5c0 drivers/usb/core/hcd.c:1656
 usb_hcd_giveback_urb+0x367/0x410 drivers/usb/core/hcd.c:1726

Reported-and-tested-by: syzbot+2d6d691af5ab4b7e66df@syzkaller.appspotmail.com
Fixes: c04148f915e5 ("Input: add driver for USB VoIP phones with CM109 chipset")
Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
---
 drivers/input/misc/cm109.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/misc/cm109.c b/drivers/input/misc/cm109.c
index f515fae465c3..60bddadbbe3a 100644
--- a/drivers/input/misc/cm109.c
+++ b/drivers/input/misc/cm109.c
@@ -406,7 +406,7 @@ static void cm109_urb_irq_callback(struct urb *urb)
 
 	dev->irq_urb_pending = 0;
 
-	if (likely(!dev->shutdown)) {
+	if (likely(!dev->shutdown) && likely(!dev->ctl_urb_pending)) {
 
 		if (dev->buzzer_state)
 			dev->ctl_data->byte[HID_OR0] |= BUZZER_ON;
-- 
2.32.0

