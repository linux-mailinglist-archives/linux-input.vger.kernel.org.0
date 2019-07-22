Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7F72870BF5
	for <lists+linux-input@lfdr.de>; Mon, 22 Jul 2019 23:48:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732901AbfGVVso (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 22 Jul 2019 17:48:44 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:34446 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730274AbfGVVsn (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 22 Jul 2019 17:48:43 -0400
Received: by mail-ed1-f66.google.com with SMTP id s49so7115350edb.1;
        Mon, 22 Jul 2019 14:48:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZbTATclhVfBlGWFDB5efjA9W9vf6/Py4hi06i3erHPU=;
        b=AnoDBrthgsI3o8DGAH7++2JDKpO82XDtupaff6mpz+ogj/++m9LBhYgjzm5kZJkgeJ
         NGtdFGN3lGgpql95xFsgGsh0Wom2dUDyrglnt4RNWBFy7aNU5veBR7Vbpscp67hceA4i
         N42ClwCCBIvusI0evmnIdaWNN5TOIWZC+f1PuT8JonpTCccV8zWWC403k9ixwjL1STCf
         wAq+EK/I3Us34HitRF6oj1Yf0eRD0V/n4K1mD5kRZEbw5Xrc4pSaPcmkSZPY0yzHqWpa
         lHcVIbPb4ZRVLJnbbFQER1Jgt9sTFsbwLhbpiKlk+t0wmhPKJbTaUjkkKC21dIpfWLEJ
         3lyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZbTATclhVfBlGWFDB5efjA9W9vf6/Py4hi06i3erHPU=;
        b=PEXk9YTtgtDvcZZsnv6jyEUauXg94WcttO8V4GrNzTPh/V7RYoJ2D5vgNNci4Y/NZx
         pd2KLB5plvy9WH2F24A4ZcR/4o3/GG653tG9i6DnHtztNNMEFkO1B5LMWyu4rIVm8RR4
         Z5m2x1TNl5FWDBnUzG8W1PhVaPFZSy3cjVnC1RttqxPdtvX+hBaOtcYuECAuosoZFhrk
         IOaRd85r321dZ47f1OdG5evJspjlVhflo8i+3HpqhkD9dfx2Q/UbatM5qMy2l/lAY6Ef
         i0mViu6MeN/NZeSVB3e5+NATylSkA7EPfOLb3nWsS4GAkhCnLtT7SbYpRIKCaDQyDwej
         F8Iw==
X-Gm-Message-State: APjAAAWfnnXbPsBo41/qFad6kBrPM5iKH8hDwiY5k3Ax1GJgGJA3f9XW
        +x0ySQUxdM+jgeMPdBwK1Gc=
X-Google-Smtp-Source: APXvYqwPv/bMIzABFLEfvw6u9o5ZuTRHhGYUL6UWFvdaMSvHKjs0ttQnmpA18+gun2JCC71272dLlw==
X-Received: by 2002:a17:906:ad86:: with SMTP id la6mr52067941ejb.43.1563832121287;
        Mon, 22 Jul 2019 14:48:41 -0700 (PDT)
Received: from localhost.localdomain ([65.154.66.198])
        by smtp.gmail.com with ESMTPSA id d4sm11315617edb.4.2019.07.22.14.48.39
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 22 Jul 2019 14:48:40 -0700 (PDT)
From:   stillcompiling@gmail.com
To:     Joe Perches <joe@perches.com>, Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org (open list:HID CORE LAYER),
        linux-kernel@vger.kernel.org (open list)
Cc:     Joshua Clayton <stillcompiling@gmail.com>
Subject: [PATCH v3 1/3] HID: core: reformat and reduce hid_printk macros
Date:   Mon, 22 Jul 2019 15:48:25 -0600
Message-Id: <20190722214827.29257-1-stillcompiling@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190722163642.10417-2-stillcompiling@gmail.com>
References: <20190722163642.10417-2-stillcompiling@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Joshua Clayton <stillcompiling@gmail.com>

Reformat hid_printk macros to use standard __VA_ARGS__ syntax
Remove hid_printk(), hid_emerg(), hid_crit(), and hid_alert().
Per Joe Perches these unused and likely never to be used.

Signed-off-by: Joshua Clayton <stillcompiling@gmail.com>
---
 include/linux/hid.h | 32 ++++++++++++--------------------
 1 file changed, 12 insertions(+), 20 deletions(-)

diff --git a/include/linux/hid.h b/include/linux/hid.h
index d770ab1a0479..e6c7efdb0458 100644
--- a/include/linux/hid.h
+++ b/include/linux/hid.h
@@ -1154,29 +1154,21 @@ int hid_pidff_init(struct hid_device *hid);
 #define hid_pidff_init NULL
 #endif
 
-#define dbg_hid(format, arg...)						\
+#define dbg_hid(fmt, ...)						\
 do {									\
 	if (hid_debug)							\
-		printk(KERN_DEBUG "%s: " format, __FILE__, ##arg);	\
+		printk(KERN_DEBUG "%s: " fmt, __FILE__, ##__VA_ARGS__);	\
 } while (0)
 
-#define hid_printk(level, hid, fmt, arg...)		\
-	dev_printk(level, &(hid)->dev, fmt, ##arg)
-#define hid_emerg(hid, fmt, arg...)			\
-	dev_emerg(&(hid)->dev, fmt, ##arg)
-#define hid_crit(hid, fmt, arg...)			\
-	dev_crit(&(hid)->dev, fmt, ##arg)
-#define hid_alert(hid, fmt, arg...)			\
-	dev_alert(&(hid)->dev, fmt, ##arg)
-#define hid_err(hid, fmt, arg...)			\
-	dev_err(&(hid)->dev, fmt, ##arg)
-#define hid_notice(hid, fmt, arg...)			\
-	dev_notice(&(hid)->dev, fmt, ##arg)
-#define hid_warn(hid, fmt, arg...)			\
-	dev_warn(&(hid)->dev, fmt, ##arg)
-#define hid_info(hid, fmt, arg...)			\
-	dev_info(&(hid)->dev, fmt, ##arg)
-#define hid_dbg(hid, fmt, arg...)			\
-	dev_dbg(&(hid)->dev, fmt, ##arg)
+#define hid_err(hid, fmt, ...)				\
+	dev_err(&(hid)->dev, fmt, ##__VA_ARGS__)
+#define hid_notice(hid, fmt, ...)			\
+	dev_notice(&(hid)->dev, fmt, ##__VA_ARGS__)
+#define hid_warn(hid, fmt, ...)				\
+	dev_warn(&(hid)->dev, fmt, ##__VA_ARGS__)
+#define hid_info(hid, fmt, ...)				\
+	dev_info(&(hid)->dev, fmt, ##__VA_ARGS__)
+#define hid_dbg(hid, fmt, ...)				\
+	dev_dbg(&(hid)->dev, fmt, ##__VA_ARGS__)
 
 #endif
-- 
2.21.0

