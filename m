Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C213429B0F
	for <lists+linux-input@lfdr.de>; Tue, 12 Oct 2021 03:37:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232260AbhJLBjo (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 11 Oct 2021 21:39:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232492AbhJLBjn (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 11 Oct 2021 21:39:43 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C93EC061570;
        Mon, 11 Oct 2021 18:37:42 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id na16-20020a17090b4c1000b0019f5bb661f9so1333700pjb.0;
        Mon, 11 Oct 2021 18:37:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2qY7OmEsJgZ9iHLdKewMDKhiZ78eeuM4IXQtYMLFZgM=;
        b=QSEosjzFcOISdwnSiGH55XIhgH1D5Gc1zZ9cliRgDvuEggtNOlW49o2lbpWW4EDSrA
         2cDH4W/+75Uuc2MuVXQvym5T/awppZg1ibuI7xXglIawnupaBwBEtMZX2NVQELBUtAv2
         PzRY4OFv9qSDMcirSQtod+6gJntN+ch3kf57EdhhqH1mP8NZVYSYPOrvADOsOuU2wau2
         llBO2dkjMPLFJd3qNQCRDQi1RvKmfCJc5gjjQKL4Lqj4zWhH7PoftTWWozMRwK7MYurP
         vHaxtSHntmE08u3pilVEZjavwoIbsqK/kPktkanqpgSK6384dhweKXfburRAaDgfpRcE
         fgfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2qY7OmEsJgZ9iHLdKewMDKhiZ78eeuM4IXQtYMLFZgM=;
        b=wGhgEv7KFOU+eC3VOCwtMi1LvnE0adYYi/wUVQArRbZoOguKdjgN2EkhugVbu2GmUS
         Oe5Nefl4w0rYfmpHauH+dZNzOJGcMnimyRPEyk7evnxG0t79r72t8GIQlmAQX9lDnfbS
         Nm02tIfCcvbPr4YplzrykjDe2B+RkhNo+eTWxGohxVQJVeIvLvSnifa0K5oOgUhgnIPl
         uvrUnVMtHr5luqLVNyPiBOqZpolCs2proivvoLwLxbaJzqeAKa+kGtpk5botrAuOaKHQ
         3PGI0xFDCto+XxQyXslZcncnBi72AZX4cGEcf5o7+ZAOaJ67l4miqZZrj3tE0sd3HWvV
         Qhqg==
X-Gm-Message-State: AOAM530cGnZ05Iy08IV0hmqywYA1ZsQv43ZpLOnowC1KF1TMeAT6VZoJ
        LQngLClarEK3pcUwdS6LYHHiK5fBHaQ=
X-Google-Smtp-Source: ABdhPJyWrRckkHDpt8LgCswoqPaR7X2GIsDRckFNDU47VUSxBFWse0/5NG5XPpMXK5h96MdYCr7DLA==
X-Received: by 2002:a17:90a:f013:: with SMTP id bt19mr197267pjb.82.1634002661240;
        Mon, 11 Oct 2021 18:37:41 -0700 (PDT)
Received: from dtor-ws.mtv.corp.google.com ([2620:15c:202:201:10fb:4b55:2926:7ada])
        by smtp.gmail.com with ESMTPSA id nr14sm654719pjb.24.2021.10.11.18.37.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Oct 2021 18:37:39 -0700 (PDT)
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     Alexander Sverdlin <alexander.sverdlin@gmail.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] Input: ep93xx_keypad - use BIT() and GENMASK() macros
Date:   Mon, 11 Oct 2021 18:37:33 -0700
Message-Id: <20211012013735.3523140-2-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.33.0.882.g93a45727a2-goog
In-Reply-To: <20211012013735.3523140-1-dmitry.torokhov@gmail.com>
References: <20211012013735.3523140-1-dmitry.torokhov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Also drop parenthesis around macros that do not use expressions as they are
not needed.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/keyboard/ep93xx_keypad.c | 37 +++++++++++++-------------
 1 file changed, 19 insertions(+), 18 deletions(-)

diff --git a/drivers/input/keyboard/ep93xx_keypad.c b/drivers/input/keyboard/ep93xx_keypad.c
index a0c6cdf8e0d3..6be5474ba2f2 100644
--- a/drivers/input/keyboard/ep93xx_keypad.c
+++ b/drivers/input/keyboard/ep93xx_keypad.c
@@ -17,6 +17,7 @@
  * flag.
  */
 
+#include <linux/bits.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/interrupt.h>
@@ -35,28 +36,28 @@
 #define KEY_REG			0x08	/* Key Value Capture register */
 
 /* Key Scan Initialization Register bit defines */
-#define KEY_INIT_DBNC_MASK	(0x00ff0000)
-#define KEY_INIT_DBNC_SHIFT	(16)
-#define KEY_INIT_DIS3KY		(1<<15)
-#define KEY_INIT_DIAG		(1<<14)
-#define KEY_INIT_BACK		(1<<13)
-#define KEY_INIT_T2		(1<<12)
-#define KEY_INIT_PRSCL_MASK	(0x000003ff)
-#define KEY_INIT_PRSCL_SHIFT	(0)
+#define KEY_INIT_DBNC_MASK	GENMASK(23, 16)
+#define KEY_INIT_DBNC_SHIFT	16
+#define KEY_INIT_DIS3KY		BIT(15)
+#define KEY_INIT_DIAG		BIT(14)
+#define KEY_INIT_BACK		BIT(13)
+#define KEY_INIT_T2		BIT(12)
+#define KEY_INIT_PRSCL_MASK	GENMASK(9, 0)
+#define KEY_INIT_PRSCL_SHIFT	0
 
 /* Key Scan Diagnostic Register bit defines */
-#define KEY_DIAG_MASK		(0x0000003f)
-#define KEY_DIAG_SHIFT		(0)
+#define KEY_DIAG_MASK		GENMASK(5, 0)
+#define KEY_DIAG_SHIFT		0
 
 /* Key Value Capture Register bit defines */
-#define KEY_REG_K		(1<<15)
-#define KEY_REG_INT		(1<<14)
-#define KEY_REG_2KEYS		(1<<13)
-#define KEY_REG_1KEY		(1<<12)
-#define KEY_REG_KEY2_MASK	(0x00000fc0)
-#define KEY_REG_KEY2_SHIFT	(6)
-#define KEY_REG_KEY1_MASK	(0x0000003f)
-#define KEY_REG_KEY1_SHIFT	(0)
+#define KEY_REG_K		BIT(15)
+#define KEY_REG_INT		BIT(14)
+#define KEY_REG_2KEYS		BIT(13)
+#define KEY_REG_1KEY		BIT(12)
+#define KEY_REG_KEY2_MASK	GENMASK(11, 6)
+#define KEY_REG_KEY2_SHIFT	6
+#define KEY_REG_KEY1_MASK	GENMASK(5, 0)
+#define KEY_REG_KEY1_SHIFT	0
 
 #define EP93XX_MATRIX_SIZE	(EP93XX_MATRIX_ROWS * EP93XX_MATRIX_COLS)
 
-- 
2.33.0.882.g93a45727a2-goog

