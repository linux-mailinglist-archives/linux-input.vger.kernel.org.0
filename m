Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6ED478A222
	for <lists+linux-input@lfdr.de>; Mon, 12 Aug 2019 17:20:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727385AbfHLPUi (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 12 Aug 2019 11:20:38 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:36734 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727122AbfHLPUi (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 12 Aug 2019 11:20:38 -0400
Received: by mail-ot1-f68.google.com with SMTP id k18so28021577otr.3;
        Mon, 12 Aug 2019 08:20:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Zbw0t6lejk4G6cnkRecei3s1P5sNxAOl1amPr4XO5a0=;
        b=XUbrbMiPdC4CsGZo+BrXMTeROlKzIsaOvXUR4UzkqeJKNOVMv0xqBdCWPxign2/PI3
         hbWQki1CTgaL45djIDH8Q9Tz5BP0sjFR0oLooi4/v/MvUCC4pEi7BoaCqDXCwDe5CLwy
         UZfbr+6aujfiKa+Ey/m3J3/QVzBgMoNX8I7VW1kgkEG+rJrz1jU5ujGCizrw2wAHmk+u
         VEdisRV0jcGiKQAD+Z3Rp4x2boADfN818OUwb8I4m7rCyOMYmFqJrs+rdTfqgfQDZJj7
         h9PJY8Hp7l231v9wzmOsU8rTcWPNZlDfXgX6PMJol+7tb6KP9VWVBKS8aC7OwwzwfRnD
         J3UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Zbw0t6lejk4G6cnkRecei3s1P5sNxAOl1amPr4XO5a0=;
        b=r1Z+ojp/fOywMeNQzARdEB/CqPoAc2T4MSBxRFcpzgVEzNAal6+XjDeB90avdGOhBg
         dzbB85F/h35bFkODkhc9keHOAuNST5N1RBJ3hZjKwcsT+M2FMBtnXaThd+S/hkkRB4x5
         lGjJo2/IAh4ctAWlOKL9+j/WRMImSbUz8MZy7soRL0WveAHmwEYOIGJyXl5q/VR/GnuF
         4F6NMZZa/Ric3/eE1auDXU4L3PbzVk22V2JyaYcbBqRocxZYjn7HpyIVYMFPgnC0gkFE
         sPQS6g97BR4bApRhetXUWQXLw0V3C7/iKvS94IT2Ven//PyBmzWF1jW8M2VT4GA0wBlU
         vf7A==
X-Gm-Message-State: APjAAAU/VJ4HMxPMFmLMmYnEWotzSSV82/OglE0vctGaudH4jhrUJYmu
        A8QLTuLRySyLm/TLkec6/4A=
X-Google-Smtp-Source: APXvYqw2Y+W44uCJ50e0/KMSB+YUxKLPGJ3sI5yWM99B1lAG2Ghf+dgUJc1gDquGQiiXsYnrEhTljg==
X-Received: by 2002:aca:6044:: with SMTP id u65mr13621440oib.25.1565623237010;
        Mon, 12 Aug 2019 08:20:37 -0700 (PDT)
Received: from localhost.localdomain ([65.154.66.198])
        by smtp.gmail.com with ESMTPSA id e10sm31792662oie.37.2019.08.12.08.20.35
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 12 Aug 2019 08:20:36 -0700 (PDT)
From:   stillcompiling@gmail.com
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org (open list:HID CORE LAYER),
        linux-kernel@vger.kernel.org (open list)
Cc:     Joe Perches <joe@perches.com>,
        Joshua Clayton <stillcompiling@gmail.com>
Subject: [PATCH v3 1/3] HID: core: reformat and reduce hid_printk macros
Date:   Mon, 12 Aug 2019 09:20:20 -0600
Message-Id: <20190812152022.27963-2-stillcompiling@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190812152022.27963-1-stillcompiling@gmail.com>
References: <20190812152022.27963-1-stillcompiling@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Joshua Clayton <stillcompiling@gmail.com>

Reformat hid_printk macros to use standard __VA_ARGS__ syntax.
Per Joe Perches hid_printk(), hid_emerg(), hid_crit(), and hid_alert() are
unlikely ever to be used. Remove them.

Signed-off-by: Joshua Clayton <stillcompiling@gmail.com>

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

