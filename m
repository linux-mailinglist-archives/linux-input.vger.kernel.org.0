Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3F9C3196EA6
	for <lists+linux-input@lfdr.de>; Sun, 29 Mar 2020 19:25:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728065AbgC2RZV (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 29 Mar 2020 13:25:21 -0400
Received: from mail-qv1-f73.google.com ([209.85.219.73]:57116 "EHLO
        mail-qv1-f73.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728303AbgC2RZS (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 29 Mar 2020 13:25:18 -0400
Received: by mail-qv1-f73.google.com with SMTP id dh19so10845044qvb.23
        for <linux-input@vger.kernel.org>; Sun, 29 Mar 2020 10:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=EC/U461+gwqn24yReon8yuub2CQF5dEI1L4tqKNZnTU=;
        b=D3+qiGb+3Bos7ak2NV7SPB2wSBA7O6UYjsdYqSqqTW0qI1xFsj24CB46jbyNPOzQzD
         kxVd6jzoq8yWYR9vl0gRZsQUmbyLROevCX/VRrkmXfRYmpms1C3vaWjXmASNRZCSjuZ9
         32/kJfzyaau4ebwaCnyCOCSWYs/QTEvDRjL8K1FLpZH+ui6qlSJ/A3jiaBGeI3MBZlw2
         zH7k5tU8uAVLZ0KdXJYS9itVwkI2VLtwGVyF0ht7hU0X3iZer7fZ2+usvnADH84r+ExB
         cWseU1S/1vktGRyzTu4ncrzmxH3z7u4oN6z3K6SLGvMaq5WtZK74t4+ltmEXuVdvXPps
         g9Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=EC/U461+gwqn24yReon8yuub2CQF5dEI1L4tqKNZnTU=;
        b=hgFOVQQi7QFnfzhJ9WFUSYDlL2l+yRqVj53hOWb1cO6olyedEa0kEzVBgma8xa5gwf
         Ec4VjPqU1DlyYNiGi74gm6sCGInk5x4mG42uV+tL3Y0b7rxY6DzGmElbWcv5o/Y3qM8E
         BxUieZ+fRpcm25YJWQiJOYBHiA4DIoCrqgx9z+x8UrQJOcSsYl4I6zyGI4xmKhE+l6rK
         vhoTC17J1DuhDWivXCtS/1Pzp/FiqtdyfXiYt9aXUuXtYOAwuWLfef+/iEWQi7+zx5Qf
         jYZ+sr1Qy6zZiTMB0fycKKWRlRZ7f5tPrIkhLDiqyMVl5Z8RWuJJSHWO3mEpJXHc3jAC
         +1Qw==
X-Gm-Message-State: ANhLgQ0xbZoZRqLlXUGnglEUNxWdZfQO5QWV7vs2tSLHzb9GYLroCNzz
        bTqut5kkzDL6quDrqndoX7DFkInjX2z5
X-Google-Smtp-Source: ADFU+vu4i10Gh7yzTZjhEUSWpfFGbE9wnvJi0F1/Eqla5s2nPiUeLOuYWg+8TH7Uxa2JwOKGt/539wJnHXuV
X-Received: by 2002:ac8:7b26:: with SMTP id l6mr8405402qtu.64.1585502717195;
 Sun, 29 Mar 2020 10:25:17 -0700 (PDT)
Date:   Sun, 29 Mar 2020 10:25:13 -0700
Message-Id: <20200329172513.133548-1-rajatja@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.26.0.rc2.310.g2932bb562d-goog
Subject: [PATCH v2] Input: input-event-codes.h: Update the license
From:   Rajat Jain <rajatja@google.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rajat Jain <rajatja@google.com>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     rajatxjain@gmail.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Replace the
/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
with
/* SPDX-License-Identifier: GPL-2.0-only WITH Linux-syscall-note */

to help coreboot community consume this file without relaxing their
licensing requirements.

Signed-off-by: Rajat Jain <rajatja@google.com>
---
V2: Update the commit log

 include/uapi/linux/input-event-codes.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/uapi/linux/input-event-codes.h b/include/uapi/linux/input-event-codes.h
index 6923dc7e02982..b6a835d378263 100644
--- a/include/uapi/linux/input-event-codes.h
+++ b/include/uapi/linux/input-event-codes.h
@@ -1,4 +1,4 @@
-/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
+/* SPDX-License-Identifier: GPL-2.0-only WITH Linux-syscall-note */
 /*
  * Input event codes
  *
-- 
2.26.0.rc2.310.g2932bb562d-goog

