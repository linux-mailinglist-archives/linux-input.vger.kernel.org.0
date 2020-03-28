Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 13F891962B2
	for <lists+linux-input@lfdr.de>; Sat, 28 Mar 2020 01:48:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726340AbgC1Asi (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 27 Mar 2020 20:48:38 -0400
Received: from mail-pj1-f73.google.com ([209.85.216.73]:50481 "EHLO
        mail-pj1-f73.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726330AbgC1Ash (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 27 Mar 2020 20:48:37 -0400
Received: by mail-pj1-f73.google.com with SMTP id e8so8506155pjd.0
        for <linux-input@vger.kernel.org>; Fri, 27 Mar 2020 17:48:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=V3RVGKTnvULr71PCJzOr4oAgJDqzxAQ7cIFBHDK9MJM=;
        b=Mx6haa/hAO4e0oi0GGgxjpzV/GRHVOwGpOMYS1XF8EuajtvI0NN1+dIk9104v6xkjh
         HPueHCTMl8QbVElLapdVxtS6VpqLy/TKpJdZT/s6T1EtOUn1ARdsGxKTWbHxslm/UKWu
         +JUzujVKNeMRd/eJk1asK2FW2jz3/XQsT19FZ9ACXJwyH9zjuuhyIno4OgzG+nrYmz3R
         vjvmRfoViTj/CDWRdHpQtHbqoBhDz2IG41j8ZJi+nJ+2rIr+svPu9IID0XlZyewrgR/y
         TiNQsew9FLtQfeploC1KNulgyQm/Vfzt6eA5oZwzA+99L5kzk7AF0dezebLq2+joruyn
         ByNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=V3RVGKTnvULr71PCJzOr4oAgJDqzxAQ7cIFBHDK9MJM=;
        b=Qoisdahx+m1cX9xbvlzoJlThZlKXKBup5/sGGOrtXi+ChS0vLO4ovUS6eJdAAHMz2w
         zRicZxvYFg1+6/M8D6Xe72zvkzewB8wgSxiwetfy6ymxM9BdZB830HKB9zUaCObTb2Om
         EShmf5S8DTMp8mzqPHs/YLtaab7L54154HKcQIfD/LI8seYDouo4ClA6A6kAEraryoFm
         bDVmdu90DI6E7RUJc/OCphM2UfF8z3LAZKf/EG8fgFTOAqR4zbBkbBMyaXtSLs0EJo/R
         dHYjl6tMf5EQ2P39dhrwMWCl1vV9psGg7fDEW02F3VEmc77fo1AyIxIbrRRTjJglfiFJ
         bKlw==
X-Gm-Message-State: ANhLgQ0QiBA7Vi5Drj1YWf9GvGXkkRQKOrv0haTQGewT5Z5zhkC4RlUH
        SUQQI7bYC7gdST//Z9kR5UbJJNmC4mci
X-Google-Smtp-Source: ADFU+vurKcOW8+PhGxANI+fEe0oKAeuHWov8ylyFM57xjXLJZDBKI3luDy6eTR3HW5QK4gitzcBP2hIMyl1p
X-Received: by 2002:a17:90a:4d43:: with SMTP id l3mr2074720pjh.165.1585356516664;
 Fri, 27 Mar 2020 17:48:36 -0700 (PDT)
Date:   Fri, 27 Mar 2020 17:48:32 -0700
Message-Id: <20200328004832.107247-1-rajatja@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.26.0.rc2.310.g2932bb562d-goog
Subject: [PATCH] Input: input-event-codes.h: Update the deprecated license
From:   Rajat Jain <rajatja@google.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>
Cc:     Rajat Jain <rajatja@google.com>, rajatxjain@gmail.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From https://spdx.org/licenses/

"Release 3.0 replaced previous Identifiers for GNU licenses with more
explicit Identifiers to reflect the "this version only" or "any later
version" option specific to those licenses. As such, the previously used
Identifiers for those licenses are deprecated as of v3.0."

Replace the
/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
with
/* SPDX-License-Identifier: GPL-2.0-only WITH Linux-syscall-note */

Signed-off-by: Rajat Jain <rajatja@google.com>
---
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

