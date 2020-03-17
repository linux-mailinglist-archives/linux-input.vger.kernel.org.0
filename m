Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 11563187E1A
	for <lists+linux-input@lfdr.de>; Tue, 17 Mar 2020 11:20:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726506AbgCQKUQ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 17 Mar 2020 06:20:16 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:36745 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726066AbgCQKUQ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 17 Mar 2020 06:20:16 -0400
Received: by mail-lj1-f193.google.com with SMTP id g12so22149101ljj.3;
        Tue, 17 Mar 2020 03:20:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=2bvQoM7fTBjp0klcuiM54Wdtln7AcxQr31yym9z34dg=;
        b=MZDRgS4BaT0SU4IYSBvCwUz5CUebXUPcrF+pOqrlQ1nhj3L6353fbCQP8jVC8mCPoM
         If2LSZ8A1bUp6I1JalHYrMfCENCwipMZawDM3C9DxuEvV2bOreSnHD4oq5016l48hXvd
         YBEq1jmeL7JcsMdn1Aiel7r7H6xkrbU4IoBKDGPRfUcNbWF5dpCJXyge6KD889Qvzcog
         feNv988Lw6Fj7ZZ1AqjZQ/hRPBcmFU+WvZ+OiyVIdU8yYLhyCE8KAsp8KJSBdZL0JiZ4
         gNwDURP5LVtLbziVRCqlTW+LOJPwTJVmDHi++ePSEnUbwOEOdMbJtFOa/h7wiAXm41Ux
         GeHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=2bvQoM7fTBjp0klcuiM54Wdtln7AcxQr31yym9z34dg=;
        b=oqz9q7TsVX8ClG9rVUO6zjnMQFEx68OcULKohhUgaHsSzLBLIULQmIJdzLvA0989zW
         uZJcmclAwTJUjehQNm8AGYZ49GPMKPGHTqKd9Mf2rjzD1MDu7kQobzdaBzOJ+BvS5wTp
         J0ehO30DDq2Eyzz1H6tl4FFMJIOJOKgRCi2toLDlVF0Axrr13ptCmrMng/WgEv+KZuau
         aObzfRHsgbOLZBfAGDrA8d9LHDrHK2R79gR3tn7Oduf5CKPwu/rMBtulrrwyBB9E7RN6
         fZclOY0O/Jo3V2fHYN5d7kD2PmVvD0zf7V3SCTpf3fc4225wbW8W0ue09pvTyt735grP
         lJsw==
X-Gm-Message-State: ANhLgQ1RQ1GieUyHt0PopgEYvldXXklcc5EIoLQgRllkJMxahkDl6FcO
        50SHwU4taBXuqJ9QFRqp51s=
X-Google-Smtp-Source: ADFU+vvszzeoWJVd3TcHDvI8WAFElfYnQkMXm+roHZR329HPbNexz7N9xlKt3WDG1FhhpHxuuB7jgA==
X-Received: by 2002:a2e:5844:: with SMTP id x4mr2279916ljd.40.1584440413435;
        Tue, 17 Mar 2020 03:20:13 -0700 (PDT)
Received: from localhost (host-176-37-176-139.la.net.ua. [176.37.176.139])
        by smtp.gmail.com with ESMTPSA id c20sm2189438lfb.60.2020.03.17.03.20.12
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Mar 2020 03:20:12 -0700 (PDT)
From:   Igor Opaniuk <igor.opaniuk@gmail.com>
To:     linux-arm-kernel@lists.infradead.org
Cc:     Max Krummenacher <max.krummenacher@toradex.com>,
        Philippe Schenker <philippe.schenker@toradex.com>,
        Stefan Agner <stefan@agner.ch>,
        Marcel Ziswiler <marcel.ziswiler@toradex.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Oleksandr Suvorov <oleksandr.suvorov@toradex.com>,
        Igor Opaniuk <igor.opaniuk@toradex.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [RFC PATCH v1 5/5] input: Dual license file adding MIT
Date:   Tue, 17 Mar 2020 12:19:47 +0200
Message-Id: <20200317101947.27250-5-igor.opaniuk@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200317101947.27250-1-igor.opaniuk@gmail.com>
References: <20200317101947.27250-1-igor.opaniuk@gmail.com>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Igor Opaniuk <igor.opaniuk@toradex.com>

Dual license file adding MIT license, which will permit to re-use
bindings and dependent device tree sources (that include this file
directly or indirectly via dt-bindings) in other non-GPL OSS projects.

Signed-off-by: Igor Opaniuk <igor.opaniuk@toradex.com>
---

 include/uapi/linux/input-event-codes.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/uapi/linux/input-event-codes.h b/include/uapi/linux/input-event-codes.h
index 0f1db1cccc3f..2f86c4554721 100644
--- a/include/uapi/linux/input-event-codes.h
+++ b/include/uapi/linux/input-event-codes.h
@@ -1,4 +1,4 @@
-/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note OR MIT */
 /*
  * Input event codes
  *
-- 
2.17.1

