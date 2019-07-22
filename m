Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B460B70588
	for <lists+linux-input@lfdr.de>; Mon, 22 Jul 2019 18:37:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730972AbfGVQhD (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 22 Jul 2019 12:37:03 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:45187 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729363AbfGVQhD (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 22 Jul 2019 12:37:03 -0400
Received: by mail-ed1-f66.google.com with SMTP id x19so35266118eda.12;
        Mon, 22 Jul 2019 09:37:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XC2+BtXpxqlfYcoJEbn14m6uC88iKzN7rr5nerwc4M8=;
        b=CH+CfA8pU9bP3eqCI5E5CltgO/iukq2HzCZWkGUfJ00hRqzl4CNlAfX8VwbLAqPL6t
         GQm3PxMdvtv8n3JUiHOXDQpfVVwYgn879dQSEvGIKEeRNWLGTWE05dX3nibRcci1T4JO
         lDqjFIAQtzy31jEcqyxR5AkshEvAmLmN8OdZvkWg2MkdLJYRozlDO1hbxMVzcrz9cvsA
         9LYYjij3rfamlVLSzV+RSC0nC6wFurYGArbXD3csRnPOEHoEDv70mYGLZKxcVwrbeGAr
         Cu776rNidzBAGCYvXgqtk/O+TN5zz9zEWRoCZy5uon7kRb/LNi35B4m+0u63Xse3zNF1
         /0mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XC2+BtXpxqlfYcoJEbn14m6uC88iKzN7rr5nerwc4M8=;
        b=S3jMx9EOF/9TypLmHqzmFqxF4xR0OEmDcX/yhLUFVy17T1hZL5GxlSBaDt977RywiK
         9HnVIRj2Lgas96JOCVaRq6av9xe7Jdiq4Qb/VkfDTzgAni5fjeyhJTyQqy5Mh31aVtmd
         ST0wgGkOiBYT4VHFkVmdUKZFBRmACcAvvXpBAT36jyzGUP5huztboea6X5neFEUQhXJq
         jkVtIcfnNIbq7wYUODljq6WhbgC5WrJyFiDgs81XklQce8EmrebTveFpsxrpl0BKN3I7
         PygQibyvKXcEClrGxwmdOHab7BcnSu4JHglqnIinOvYtRARncRUfmk+w9/pdrDhVex6t
         8Gbg==
X-Gm-Message-State: APjAAAW7FPVJJ+sDhucwEjsx/L3RPc8LahAgJWRIA4nu+L/CX+SEyvj/
        ztTBi8E+G17V4EzesG0vmUQ=
X-Google-Smtp-Source: APXvYqxgo4UHHdY35P6Ylq49dVsMZ6dQsXjfye6ck3OVdyzTXJhnk31w9guNXglGI5JTND21QDsFgg==
X-Received: by 2002:aa7:c486:: with SMTP id m6mr61726928edq.298.1563813421705;
        Mon, 22 Jul 2019 09:37:01 -0700 (PDT)
Received: from localhost.localdomain ([65.154.66.198])
        by smtp.gmail.com with ESMTPSA id p23sm8058609ejl.43.2019.07.22.09.36.59
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 22 Jul 2019 09:37:00 -0700 (PDT)
From:   stillcompiling@gmail.com
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org (open list:HID CORE LAYER),
        linux-kernel@vger.kernel.org (open list)
Cc:     Joshua Clayton <stillcompiling@gmail.com>
Subject: [PATCH 1/2] HID: core: Add hid printk_once macros
Date:   Mon, 22 Jul 2019 10:36:41 -0600
Message-Id: <20190722163642.10417-1-stillcompiling@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Joshua Clayton <stillcompiling@gmail.com>

Make available printk_once variants to hid_warn() etc

Signed-off-by: Joshua Clayton <stillcompiling@gmail.com>
---
 include/linux/hid.h | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/include/linux/hid.h b/include/linux/hid.h
index d770ab1a0479..5b239712c902 100644
--- a/include/linux/hid.h
+++ b/include/linux/hid.h
@@ -1179,4 +1179,23 @@ do {									\
 #define hid_dbg(hid, fmt, arg...)			\
 	dev_dbg(&(hid)->dev, fmt, ##arg)
 
+#define hid_level_once(level, hid, fmt, arg...)		\
+	dev_level_once(level, &(hid)->dev, fmt, ##arg)
+#define hid_emerg_once(hid, fmt, arg...)		\
+	dev_emerg_once(&(hid)->dev, fmt, ##arg)
+#define hid_crit_once(hid, fmt, arg...)			\
+	dev_crit_once(&(hid)->dev, fmt, ##arg)
+#define hid_alert_once(hid, fmt, arg...)		\
+	dev_alert_once(&(hid)->dev, fmt, ##arg)
+#define hid_err_once(hid, fmt, arg...)			\
+	dev_err_once(&(hid)->dev, fmt, ##arg)
+#define hid_notice_once(hid, fmt, arg...)		\
+	dev_notice_once(&(hid)->dev, fmt, ##arg)
+#define hid_warn_once(hid, fmt, arg...)			\
+	dev_warn_once(&(hid)->dev, fmt, ##arg)
+#define hid_info_once(hid, fmt, arg...)			\
+	dev_info_once(&(hid)->dev, fmt, ##arg)
+#define hid_dbg_once(hid, fmt, arg...)			\
+	dev_dbg_once(&(hid)->dev, fmt, ##arg)
+
 #endif
-- 
2.21.0

