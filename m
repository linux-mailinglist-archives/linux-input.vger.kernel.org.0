Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B73D48A225
	for <lists+linux-input@lfdr.de>; Mon, 12 Aug 2019 17:20:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727805AbfHLPUj (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 12 Aug 2019 11:20:39 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:37140 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727122AbfHLPUj (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 12 Aug 2019 11:20:39 -0400
Received: by mail-ot1-f66.google.com with SMTP id f17so24753959otq.4;
        Mon, 12 Aug 2019 08:20:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=87ODSluuxCJzsTsVGfec1oF5jXVmP/F4heF7BnrVH7o=;
        b=iYnb6LUacW57ui0QG9Sj7a0v4TbbKqq83L4ClVfLbDVd8dFsNjxAzhh4yEUc+XI78T
         2C3+owellt61xBpNP1FW2unvG1Ug8+o/MEe54iBdBLgD3ug13+7K1r8o5aiLgIMVBDOU
         raEg0lQEbZI9vPaiWBq3eFB1vdpqnqoTI28PJzWuE74Xvd2DOtAcIUYYEXhRsIaL2gCo
         4CyMmd5Pra6i+52TMF7eU6NL2G6yKLd9F2QEOOVS6zzFhUIkEfdEUxm2XiNDcLeFEvHP
         7wz4sm6Zrpa4m+jXeH3YL5V/OOweJ0qLNJyXxR9X+ap+uy8Rf8VZZ7ThOWv/Kowz9XaP
         J0Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=87ODSluuxCJzsTsVGfec1oF5jXVmP/F4heF7BnrVH7o=;
        b=pf+NkJfJAtEQkiwrolbRBL4XcGxtQQWLCiKK9QKsjhuQJt/444kmP+StNfPLL8k9Gk
         urBHBSL8d6MdWPDrd3vnBtAJQdREKRS3DRtjiqvqcVuw+8YNf9jGMjDsP4HDHj3w+m7v
         EIaAuziBmhHabIoXyqw9+t4yPOcxaHsBfGazRZCi5YBFsivizjlhb1mzEdDVh45BGj02
         muL7ubF4zA0jk9dlPyn0hT1XBQi1FFdlInf4jSKshz9/iXwqEGP5FlHV3smLbt5mVpiw
         WYFEgUBu06aLs8an5x8JAtdCRLWMqAX6FE/+U8C1ZRnh1YbbDW/GDVYt0pWfp4LNYhEb
         TTLQ==
X-Gm-Message-State: APjAAAW+Fw9ag7Ol4OWHGMrBgisTH/Ce4UgMntEG5s8QD+nntEK4rnZd
        OPTgwRnlDhNHpzUE+TZslQw=
X-Google-Smtp-Source: APXvYqxL6dW0dn+LxwAm/Yg3uUF27dLIT6hMuSG6syRQVnXZG8jG/LKnUiXQWjcVk/zmMSJedQjfXw==
X-Received: by 2002:a9d:6a4d:: with SMTP id h13mr8191899otn.259.1565623238036;
        Mon, 12 Aug 2019 08:20:38 -0700 (PDT)
Received: from localhost.localdomain ([65.154.66.198])
        by smtp.gmail.com with ESMTPSA id e10sm31792662oie.37.2019.08.12.08.20.37
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 12 Aug 2019 08:20:37 -0700 (PDT)
From:   stillcompiling@gmail.com
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org (open list:HID CORE LAYER),
        linux-kernel@vger.kernel.org (open list)
Cc:     Joe Perches <joe@perches.com>,
        Joshua Clayton <stillcompiling@gmail.com>
Subject: [PATCH v3 2/3] HID: core: Add printk_once variants to hid_warn() etc
Date:   Mon, 12 Aug 2019 09:20:21 -0600
Message-Id: <20190812152022.27963-3-stillcompiling@gmail.com>
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

hid_warn_once() is needed. Add the others as part of the block.

Signed-off-by: Joshua Clayton <stillcompiling@gmail.com>

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

