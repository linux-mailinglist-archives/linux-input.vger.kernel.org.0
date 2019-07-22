Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EF9B470BF9
	for <lists+linux-input@lfdr.de>; Mon, 22 Jul 2019 23:48:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732905AbfGVVsq (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 22 Jul 2019 17:48:46 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:40099 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732820AbfGVVsp (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 22 Jul 2019 17:48:45 -0400
Received: by mail-ed1-f66.google.com with SMTP id k8so41910815eds.7;
        Mon, 22 Jul 2019 14:48:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FENI0QfMNWJ5FelefUZ+G7/NZ/3sRK983AKLe0QVPsY=;
        b=foRZa2mKuNS0W4zx9VOG2nUDtf+PVaLSKNMRH/WoEqE8A/SBhtWy2nX2RoO68PUWGn
         0Fp0d2oGpz6wVH4L9BX/rjXP02fw8e8ycjDwhn60M7dhZD1bR57CvVsP2jXl+Sesvemy
         3BgbyMZEIeGgob3bIYEZxgDkM6/xxn1xsRVzYC2/I5+0Jq64tv75TyNNPNsgDctvMxtD
         Li+GVV3rrPw2DRKepkEJk+j02qz8Ig91R3zwQWUfROA/+0QWctki903r/lUkDDvSu0YK
         Z5nBuzWDA7oQwWeymApHbiP8+vQnTMLODjCHaGpxU7B5Mws40okzvjLhNNcsKdGc4/FR
         kTvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FENI0QfMNWJ5FelefUZ+G7/NZ/3sRK983AKLe0QVPsY=;
        b=htUqq0O1edWQVQXO21VaektRTQyP0KI1kPT+LVZ6EbTC8Wf3KJK9ypEDSS10tCXgHA
         MaWw0XM2Qr1VD9cSZ2CRNpgLj06KZ20ALRFF5aUs1yWHmMSCoPtMuhhGn93MMbpXblqI
         sKmD48e1tMdJSooQELJGr+vQihV2LU7jSJVIwH9YxJDkEvkTR2oUf/0CIc7cYr0uSUrC
         WzloEirT3UQEOvfTSoFtPEHHsnaG/eQX5xermx0OVUr2weYLUhIpTHGiShCkd+ZVlGPi
         qSFCY2hq3xhdg2JvX+CBB8d8w2P4t2XrNHTRbOfRuP3SGEaGcqvYOmxf5G1SgS980tg3
         Kwlg==
X-Gm-Message-State: APjAAAVbJFlKkPx8+eHR7GpGJofDOyPVxt90vZa+NFV/ya1mdb+Ev7lL
        GnIZeHg1jJU5K3v2SUAcpec=
X-Google-Smtp-Source: APXvYqyhoZvhyamR/6SYBtIdjJBcWbJapKFpTHtITm9MTjWGT5XBVJH7plBHhgLnsDYMitV9xTnl9w==
X-Received: by 2002:a17:906:3018:: with SMTP id 24mr56168412ejz.187.1563832123314;
        Mon, 22 Jul 2019 14:48:43 -0700 (PDT)
Received: from localhost.localdomain ([65.154.66.198])
        by smtp.gmail.com with ESMTPSA id d4sm11315617edb.4.2019.07.22.14.48.41
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 22 Jul 2019 14:48:42 -0700 (PDT)
From:   stillcompiling@gmail.com
To:     Joe Perches <joe@perches.com>, Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org (open list:HID CORE LAYER),
        linux-kernel@vger.kernel.org (open list)
Cc:     Joshua Clayton <stillcompiling@gmail.com>
Subject: [PATCH v3 2/3] HID: core: Add printk_once variants to hid_warn() etc
Date:   Mon, 22 Jul 2019 15:48:26 -0600
Message-Id: <20190722214827.29257-2-stillcompiling@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190722214827.29257-1-stillcompiling@gmail.com>
References: <20190722163642.10417-2-stillcompiling@gmail.com>
 <20190722214827.29257-1-stillcompiling@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Joshua Clayton <stillcompiling@gmail.com>

hid_warn_once() is needed, add the others as part of the block

Signed-off-by: Joshua Clayton <stillcompiling@gmail.com>
---
 include/linux/hid.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/include/linux/hid.h b/include/linux/hid.h
index e6c7efdb0458..cd41f209043f 100644
--- a/include/linux/hid.h
+++ b/include/linux/hid.h
@@ -1171,4 +1171,15 @@ do {									\
 #define hid_dbg(hid, fmt, ...)				\
 	dev_dbg(&(hid)->dev, fmt, ##__VA_ARGS__)
 
+#define hid_err_once(hid, fmt, ...)			\
+	dev_err_once(&(hid)->dev, fmt, ##__VA_ARGS__)
+#define hid_notice_once(hid, fmt, ...)			\
+	dev_notice_once(&(hid)->dev, fmt, ##__VA_ARGS__)
+#define hid_warn_once(hid, fmt, ...)			\
+	dev_warn_once(&(hid)->dev, fmt, ##__VA_ARGS__)
+#define hid_info_once(hid, fmt, ...)			\
+	dev_info_once(&(hid)->dev, fmt, ##__VA_ARGS__)
+#define hid_dbg_once(hid, fmt, ...)			\
+	dev_dbg_once(&(hid)->dev, fmt, ##__VA_ARGS__)
+
 #endif
-- 
2.21.0

