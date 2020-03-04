Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4FD7D1786F4
	for <lists+linux-input@lfdr.de>; Wed,  4 Mar 2020 01:21:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727864AbgCDAVn (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 3 Mar 2020 19:21:43 -0500
Received: from mail-pg1-f201.google.com ([209.85.215.201]:47086 "EHLO
        mail-pg1-f201.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727823AbgCDAVn (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 3 Mar 2020 19:21:43 -0500
Received: by mail-pg1-f201.google.com with SMTP id s18so152732pgd.13
        for <linux-input@vger.kernel.org>; Tue, 03 Mar 2020 16:21:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=XLi40nUCzA8fnaDyDGF03FgthTtZFBNIpUCeUaZ4OCY=;
        b=vxThYwXQBRKgj9U9BFUi7qmfUinxmcdc3qe3QzENhfA/a2LYqFOPRMNcfDxwCQhB2d
         gymSrtQex8H+m6RW/A0C9g5rNw/1jfS1qgVkGhlpJek4R5DNUBt+ADiyeYsPhXXL+9Wi
         +h8hzDn/3Ybc1mhGaN7nDSolNSLWSBJkR41TWL9uFsU8iOBkzzqD4XuKPo0w9AC1iE4f
         vzLCSDCyNznaOBvUtl6YX5Ti9NXWbTV+yT+obV2X6/ZEvBeEDdMArxI5f4QUzEWUKy3F
         LxUqJgMQ0bjeB2xVgfXueiv4rRmro8vt9la/ZMQlIUxSsqaYnZiedbtR1gsoeF0+HFXF
         K2jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=XLi40nUCzA8fnaDyDGF03FgthTtZFBNIpUCeUaZ4OCY=;
        b=sJ61IbB9qrtLgqF/Ex6ogleb91WmO26vOLnOQB9VjyFNDKoh3P57VEAXPMNgYzd5y3
         b4iZMGCFPMW2mCVEfvNElIF1j4Aai3cyDZTG5dd7oVaDJWpy3WV1N/sIF6vEWo6S8Qm5
         ua2FfpeCuK5TNiiGkDROdCnuZkDTuh4Jv6HDSNrAutKwXv7eiFnmycJzOhzIGPJf+bfZ
         OqBO2UpLXn8JFiS1ciSUDKrCEenoDTf9q64lyCF52Qfqj3p1g+tKiXe5zGg4/L2RvXfF
         KMtapsGm2PvD1M+LHDccoCyeknoJdHttRPj1HrKQPo+A2h9/DGJjRaK9th84uHeRxYG1
         Ghxg==
X-Gm-Message-State: ANhLgQ0DPAKgmOnjt9gEDPOtnkbAG8V8fxnc+mGa0+e9QDXB0ydfqoi1
        1/ugt7IpYVmq0XsnMMRf8ZHXRGldvCnN
X-Google-Smtp-Source: ADFU+vtvKQhD67pqUGct00FjXRXrDe/JEahrEkPrPvZD2b+pBi3f8jWmeXa35eoFU2604R1VjcQJd7UQLgx+
X-Received: by 2002:a63:4c66:: with SMTP id m38mr27005pgl.313.1583281301582;
 Tue, 03 Mar 2020 16:21:41 -0800 (PST)
Date:   Tue,  3 Mar 2020 16:21:37 -0800
Message-Id: <20200304002137.83630-1-rajatja@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.25.0.265.gbab2e86ba0-goog
Subject: [PATCH v2] Input: Allocate keycode for SNIP key
From:   Rajat Jain <rajatja@google.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        dtor@google.com
Cc:     Rajat Jain <rajatja@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

New chromeos keyboards have a "snip" key that is basically a selective
screenshot (allows a user to select an area of screen to be copied).
Allocate a keyvode for it.

Signed-off-by: Rajat Jain <rajatja@google.com>
---
V2: Drop patch [1/2] and instead rebase this on top of Linus' tree.

 include/uapi/linux/input-event-codes.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/uapi/linux/input-event-codes.h b/include/uapi/linux/input-event-codes.h
index 0f1db1cccc3fd..08c8572891efb 100644
--- a/include/uapi/linux/input-event-codes.h
+++ b/include/uapi/linux/input-event-codes.h
@@ -652,6 +652,9 @@
 /* Electronic privacy screen control */
 #define KEY_PRIVACY_SCREEN_TOGGLE	0x279
 
+/* Selective Screenshot */
+#define KEY_SNIP                        0x280
+
 /*
  * Some keyboards have keys which do not have a defined meaning, these keys
  * are intended to be programmed / bound to macros by the user. For most
-- 
2.25.0.265.gbab2e86ba0-goog

