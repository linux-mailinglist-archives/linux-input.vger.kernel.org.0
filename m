Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B29351769A5
	for <lists+linux-input@lfdr.de>; Tue,  3 Mar 2020 01:56:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726890AbgCCA4x (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 2 Mar 2020 19:56:53 -0500
Received: from mail-pf1-f202.google.com ([209.85.210.202]:41592 "EHLO
        mail-pf1-f202.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726843AbgCCA4w (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 2 Mar 2020 19:56:52 -0500
Received: by mail-pf1-f202.google.com with SMTP id w11so803621pfd.8
        for <linux-input@vger.kernel.org>; Mon, 02 Mar 2020 16:56:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=MjWn1xssQfoWQqE8a57xumnRtF/eKeos54BJPVuyJV4=;
        b=Z9RypMQmX1DwNAhQzgfwPiu4aHPUXLU7YWppGyRQBOx+02/19l5Mv6xS1CrmVHCise
         DMj/S7jt7FrFtvKkvxIvmKI/qPyJ0niR5A1bmQCf/q8WeQkeCnojsu8MddM0cqG8GBL3
         +iVLA8T1LvHeoIV4Ah2OWHyaectOrGPnUnACxbEbKRjXhh0m9C8FLRv0H5GMgV8BOwwv
         4822cYDagLBndX9/hi+Mq6gootKGvIGA65N29T8czKm11A8GVSsbUcKEeTK6kmTJlXo1
         Z+EiByzfI4wUTbbFIpuKBq8vFPum7sDOk/Kud4ZwO+gPibd0zVhWOmD3zhvMw6bYGdqW
         9rfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=MjWn1xssQfoWQqE8a57xumnRtF/eKeos54BJPVuyJV4=;
        b=D4Gy7GC4MuJ11iRG9Ofn8QokJQf3p21xZSsQYxwSLgrs7XydgeaIu1u3WXzIj0DXM3
         cMN59h7buvJ9Y4u19VDyiDIKYigbGU6YYEMXVKbkpPPosI2aREZWzb7oFkWOpBsS33PK
         BYUoLwy78c3zdTfDQumWQLu0iqa2AkkRwIrRBbcuNzZz/zc48hqmHV5dfBIYrkfeohM1
         k3eMajydj2Ngc6MImWbX3xOD/Ur0GNCT/V81Jp5oBYaJpuDozVrniFKVXVUzDkwswlAI
         ebb3OmpQfaVtWNQTkuiqbl4Q6UeDLixA/AeS12Eo4DnsFLyfz7akLLicUzj21Kc4D0d0
         ScJg==
X-Gm-Message-State: ANhLgQ0B1uh6M86JYVuMis7py5+ag7TIKCSJ+RcohSHnUCL+Lyo48XIN
        ysOYd7CKjtredJwpl5OL9m7CqRUMKXn0
X-Google-Smtp-Source: ADFU+vuTvBWJoDi9HjHUHwiqoNQ82VV/Guk+HqRmAyeMFXexpzrcVUJWMfZFz+RVBN7mv9wOQpa0LCXnMV/+
X-Received: by 2002:a63:ad42:: with SMTP id y2mr1524288pgo.445.1583197010143;
 Mon, 02 Mar 2020 16:56:50 -0800 (PST)
Date:   Mon,  2 Mar 2020 16:56:44 -0800
Message-Id: <20200303005645.237763-1-rajatja@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.25.0.265.gbab2e86ba0-goog
Subject: [PATCH 1/2] Input: Add keycodes for keyboard backlight control
From:   Rajat Jain <rajatja@google.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        dtor@google.com
Cc:     Rajat Jain <rajatja@google.com>, rajatxjain@gmail.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

New keyboards can have backlight control keys. Allocating keycodes
for them. Such keyboards are already available in ChromeOS.

Signed-off-by: Rajat Jain <rajatja@google.com>
---
 include/uapi/linux/input-event-codes.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/uapi/linux/input-event-codes.h b/include/uapi/linux/input-event-codes.h
index 0f1db1cccc3fd..e12a19dc30262 100644
--- a/include/uapi/linux/input-event-codes.h
+++ b/include/uapi/linux/input-event-codes.h
@@ -652,6 +652,10 @@
 /* Electronic privacy screen control */
 #define KEY_PRIVACY_SCREEN_TOGGLE	0x279
 
+/* Keyboard Backlight control */
+#define KEY_KBD_BKLIGHT_UP              0x280
+#define KEY_KBD_BKLIGHT_DOWN            0x281
+
 /*
  * Some keyboards have keys which do not have a defined meaning, these keys
  * are intended to be programmed / bound to macros by the user. For most
-- 
2.25.0.265.gbab2e86ba0-goog

