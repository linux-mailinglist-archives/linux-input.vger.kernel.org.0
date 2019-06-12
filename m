Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 949F344795
	for <lists+linux-input@lfdr.de>; Thu, 13 Jun 2019 19:00:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729765AbfFMRAk (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 13 Jun 2019 13:00:40 -0400
Received: from mail-yw1-f73.google.com ([209.85.161.73]:36162 "EHLO
        mail-yw1-f73.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729762AbfFLX6i (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 12 Jun 2019 19:58:38 -0400
Received: by mail-yw1-f73.google.com with SMTP id 75so13156115ywb.3
        for <linux-input@vger.kernel.org>; Wed, 12 Jun 2019 16:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=yYB71N56/U5nJhQbhNUWbENgcXZCI0bW+Vplj/QJV3Y=;
        b=L3D5qSk4yCBQXeK/aFvbSB+ZGxQIQCLKbFQsu6tl+wobBVotYYEFmur7xqd90bDCY0
         uNua69ri9O+S2ZhjuTLsl+MrQk57rb3p+A0xVJ+vBxpzuJ5+QpK8HygJlfYWZBRQkw1z
         EzJpZHnCzFew6rWCaX15Jqgdzt+eY5ydSMqlzHikdcjf4wxmQ0w+BbkF0H6MaGwK+ivx
         GUaoeTz+1ZcN+rzM4Ega0Qr+Nc6IljLoVtLtHO3RGHvD3wEzd6nRUtcQfGk/MjLjhBWl
         boh65s934voespHQ47oIGTcIP4aKIdfbhX45vlXoRUKcVL+ThwxznHxtQ0HkAlQ4SVoB
         OpXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=yYB71N56/U5nJhQbhNUWbENgcXZCI0bW+Vplj/QJV3Y=;
        b=IQm22QM0AaQ61+zy3DNz0p54Ff0jglpj9AJ+bBOpy1aab63OeSgd1bFkDqvzZnbNbc
         8rC30PJR57xshCe+XltI9exUi0TRC5OLFVjOHPy6CnU0uPEvsGHJvOz7NXPUqdDBg++7
         MnqhG3aJWdZ32aCY3NxJ6H2iVgwb/Yog/7ZFeG+wlW8djHaj+49zCWg0Wjaoy3tSQWGf
         +bVrLWZN1CtPTPFuaRIhTG+VB6FcZr1LNVQBPTwPQT3eBOJK1tMDEXA4W1FI/Bniw0kl
         dUc4p5iYsWRaUqNFOaPKrkSJeyoPw/PlhKVSJHFIeEkmt+Fb/1mQaFCEYwGdMM16aPGC
         jdKQ==
X-Gm-Message-State: APjAAAUROWjgfhoWy0nLvNl7mqQp9NkOMfXEhfdUwrtos7i5hQAWQShg
        l71+aFDGYUqUI/RRdvvFVUkEgFm0tg==
X-Google-Smtp-Source: APXvYqxQsIAuwUkeEw6dmQi8jxqyLd0soq95WIuFqa6rF1GfYqz3bp/GztaqYMzknAo0AiUfAiokSpIVuA==
X-Received: by 2002:a81:6ad5:: with SMTP id f204mr25535319ywc.108.1560383917681;
 Wed, 12 Jun 2019 16:58:37 -0700 (PDT)
Date:   Wed, 12 Jun 2019 16:58:03 -0700
Message-Id: <20190612235803.9290-1-nhuck@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.22.0.rc2.383.gf4fbbf30c2-goog
Subject: [PATCH] Input: atmel_mxt_ts - fix -Wunused-const-variable
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
 drivers/input/touchscreen/atmel_mxt_ts.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
index 19378f200c63..48411c83320b 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -256,6 +256,7 @@ enum v4l_dbg_inputs {
 	MXT_V4L_INPUT_MAX,
 };
 
+#ifdef CONFIG_TOUCHSCREEN_ATMEL_MXT_T37
 static const struct v4l2_file_operations mxt_video_fops = {
 	.owner = THIS_MODULE,
 	.open = v4l2_fh_open,
@@ -265,6 +266,7 @@ static const struct v4l2_file_operations mxt_video_fops = {
 	.mmap = vb2_fop_mmap,
 	.poll = vb2_fop_poll,
 };
+#endif
 
 enum mxt_suspend_mode {
 	MXT_SUSPEND_DEEP_SLEEP	= 0,
-- 
2.22.0.rc2.383.gf4fbbf30c2-goog

