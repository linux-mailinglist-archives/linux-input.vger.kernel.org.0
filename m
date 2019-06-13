Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C12C444A8A
	for <lists+linux-input@lfdr.de>; Thu, 13 Jun 2019 20:24:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725889AbfFMSYL (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 13 Jun 2019 14:24:11 -0400
Received: from mail-oi1-f202.google.com ([209.85.167.202]:51994 "EHLO
        mail-oi1-f202.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727058AbfFMSYK (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 13 Jun 2019 14:24:10 -0400
Received: by mail-oi1-f202.google.com with SMTP id w5so7175684oig.18
        for <linux-input@vger.kernel.org>; Thu, 13 Jun 2019 11:24:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=SGwIsVM07EtaffbmDpnZVkUL5vQqSHg2GIU9vXpPeb8=;
        b=bFuTpY0dyBqE8maBPH0hVPPVcI6tJeD7mTXq09nzb0xfgTnClr2nbCxQSh3PO20I2c
         fwWsMc7xvaUqCqUXeHpBzL935+Q3B7XTWpsNdg0TLgGEXeqJonqaAGZH1WO+3KQdWr9W
         PxFw8FCSiZdoNLsPSqFQIGXkjVc11F+oeEfT2y2U68FxvtyxpxhCP/UoKagERz8dVLM0
         LNhSOp9MQy979IxebyJ7oiu1tIiFXO9SuZFHpIXWFoNtZXQQduUwcgbkwi6HaV0KrSrV
         shXQCuCddSEyWg0MleMi0nNm9hNvu+ykz1VEp6VOkJMIFXCKz/3H6j7D4Qx2xXjSdLrm
         LGaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=SGwIsVM07EtaffbmDpnZVkUL5vQqSHg2GIU9vXpPeb8=;
        b=BgJwJj9sLeKNfe6/EaT3awdCCGrbUT6HBVAnBN5rghZ7xpfcaQBmfPXhjyqAgHi6EQ
         Bgy9IWsrkQba+pGsJQ5y1Z0PvArTCdlSOAKRp5fMt3hXcspYOpvnU0NpBy9ce5LxW9l/
         SJzIONqwX9qvUGRq/UVaKaZQuaQ18FXs6TMqpIB9KipiQR3g7tTqS/j6tU1cC2IIZ9oC
         52I1gSDtSOi1gBpeA0zCn+Iz4ucpV9nwbaFzJBcOhq1F443EPjic4Sg4tb3Z8cfBiI3V
         VV01GMjRhZpw7CKp6Sawr8ZgY8dZCfIu0ja3iM1a2zZSKvyL3xLHsdVg6UVn1H/DprBZ
         /NSQ==
X-Gm-Message-State: APjAAAVlRG9xZfFHPK/feZ9/DVCWFAXCtoxa34vYOIb2DbWH+BfUw+58
        djgx7j7r3U8P573VZJ6xyKlPUamDkQ==
X-Google-Smtp-Source: APXvYqwksvyhmI8WeWO3LbQ+qZI+KVFYpKjUb5OERlzv7A+ohpJ+NsjsBGcXCiVq45OeC0V2fdwTGVOYRg==
X-Received: by 2002:aca:50c6:: with SMTP id e189mr3771958oib.63.1560450249360;
 Thu, 13 Jun 2019 11:24:09 -0700 (PDT)
Date:   Thu, 13 Jun 2019 11:23:26 -0700
In-Reply-To: <CAKwvOdnjTxzXgPHQcC7K8N5YkTvh66sy86oorPJZc07b7UBhGw@mail.gmail.com>
Message-Id: <20190613182326.237391-1-nhuck@google.com>
Mime-Version: 1.0
References: <CAKwvOdnjTxzXgPHQcC7K8N5YkTvh66sy86oorPJZc07b7UBhGw@mail.gmail.com>
X-Mailer: git-send-email 2.22.0.rc2.383.gf4fbbf30c2-goog
Subject: [PATCH v2] Input: atmel_mxt_ts - fix -Wunused-const-variable
From:   Nathan Huckleberry <nhuck@google.com>
To:     nick@shmanahar.org, dmitry.torokhov@gmail.com
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Nathan Huckleberry <nhuck@google.com>,
        clang-built-linux@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Clang produces the following warning

drivers/input/touchscreen/atmel_mxt_ts.c:259:42: warning: unused
variable 'mxt_video_fops' [-Wunused-const-variable]
static const struct v4l2_file_operations mxt_video_fops = {

Since mxt_video_fops is only used inside an ifdef. It should
be moved inside the ifdef.

Cc: clang-built-linux@googlegroups.com
Link: https://github.com/ClangBuiltLinux/linux/issues/527
Signed-off-by: Nathan Huckleberry <nhuck@google.com>
---
Changes from v1 -> v2
* Moved definition of mxt_video_fops into existing ifdef
 drivers/input/touchscreen/atmel_mxt_ts.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
index 19378f200c63..0dae381c6637 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -256,16 +256,6 @@ enum v4l_dbg_inputs {
 	MXT_V4L_INPUT_MAX,
 };
 
-static const struct v4l2_file_operations mxt_video_fops = {
-	.owner = THIS_MODULE,
-	.open = v4l2_fh_open,
-	.release = vb2_fop_release,
-	.unlocked_ioctl = video_ioctl2,
-	.read = vb2_fop_read,
-	.mmap = vb2_fop_mmap,
-	.poll = vb2_fop_poll,
-};
-
 enum mxt_suspend_mode {
 	MXT_SUSPEND_DEEP_SLEEP	= 0,
 	MXT_SUSPEND_T9_CTRL	= 1,
@@ -2218,6 +2208,16 @@ static int mxt_init_t7_power_cfg(struct mxt_data *data)
 }
 
 #ifdef CONFIG_TOUCHSCREEN_ATMEL_MXT_T37
+static const struct v4l2_file_operations mxt_video_fops = {
+	.owner = THIS_MODULE,
+	.open = v4l2_fh_open,
+	.release = vb2_fop_release,
+	.unlocked_ioctl = video_ioctl2,
+	.read = vb2_fop_read,
+	.mmap = vb2_fop_mmap,
+	.poll = vb2_fop_poll,
+};
+
 static u16 mxt_get_debug_value(struct mxt_data *data, unsigned int x,
 			       unsigned int y)
 {
-- 
2.22.0.rc2.383.gf4fbbf30c2-goog

