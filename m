Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1803B2A697E
	for <lists+linux-input@lfdr.de>; Wed,  4 Nov 2020 17:26:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731005AbgKDQZY (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 4 Nov 2020 11:25:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731021AbgKDQZI (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 4 Nov 2020 11:25:08 -0500
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0023C0613D4
        for <linux-input@vger.kernel.org>; Wed,  4 Nov 2020 08:25:06 -0800 (PST)
Received: by mail-wm1-x343.google.com with SMTP id e2so2902003wme.1
        for <linux-input@vger.kernel.org>; Wed, 04 Nov 2020 08:25:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pzzgIIrLdF8ykN8u3cmmBIEsZtdCUyU67RK6IptSh0I=;
        b=LTaYEiE1iRu0RgzvlDDLlI7NXWBMFl8leMa2AJcx94kVBdqeKoOZg73o3NgB6i5xKE
         QW8+vYVvu65g10XKy2s+CLasqSTL7FsBQ/fAugv1JCZyaRrhl1eJyvnv9T5EFQDkq+Q8
         hqevmPcln8KUaoj0D98n72cGJK81JEs2P1A3rvNSVqrYHK1dLkfMDdz5whaE9u0qjLq3
         KcSrG8Wdw2PpFkLcHPsi6HNsV4pWZ5kM5d4aOBE7vhYRv50uEbVsPUSNYYukoIxZt8YL
         Bf6dqx+6FKzq7vqgr4n1c7GHu2re9sGE47pmCrHgPcm8NLr5Xl+MoAb0kcGmPL+dS1uo
         PArw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pzzgIIrLdF8ykN8u3cmmBIEsZtdCUyU67RK6IptSh0I=;
        b=sI94ErsRYokBkAVK/UDiUm7H2VPf+LGdou43IqQwwQHZWAIwWWHUi95EbyWVwdAWfI
         oTUcFZBXOVsJ5QqKgwyn1uNQfMu20h9c32NUO+gJfxyO0Rz/3lebA6g/xSAfTcjkSiEt
         Cr64jG0QxOT7c5SEYo5HNt8XJO3PzL6lGVqdMawScVs8TIICRmtitdLbr35e2+0w5Djy
         AYJb3bz68Y08Wci5AP7sL1uiC7zRzK6i587wD1UI9vK/otKx+6ny5UX8z+NaNiMSzse9
         3u0N9Y5kqwLkKpxp0DdPXjmFmlMR/bwOIzgT/so5+SxFTxgH79l9zfGSNRxxVeWE9DUH
         pKDg==
X-Gm-Message-State: AOAM532LToidOSMCtne8CGCUOwR+xnEzbeKURpbOohTAs0Wr8Cg9VjdJ
        wP1SwQG8xBi7/ZDaWnoMS68gVQ==
X-Google-Smtp-Source: ABdhPJxKrOSvHcePAUxBziapSUMd6iVGO2PGQTlj2QxxJ8/xho0A9F6lpZwcx365YE5E8QDiS0LVJg==
X-Received: by 2002:a1c:84:: with SMTP id 126mr3537081wma.160.1604507105380;
        Wed, 04 Nov 2020 08:25:05 -0800 (PST)
Received: from dell.default ([91.110.221.242])
        by smtp.gmail.com with ESMTPSA id o129sm3008564wmb.25.2020.11.04.08.25.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2020 08:25:04 -0800 (PST)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Kumar G <naveen.gaddipati@stericsson.com>,
        Sundar Iyer <sundar.iyer@stericsson.com>,
        linux-input@vger.kernel.org
Subject: [PATCH 19/20] input: keyboard: nomadik-ske-keypad: Provide some missing struct member docs
Date:   Wed,  4 Nov 2020 16:24:26 +0000
Message-Id: <20201104162427.2984742-20-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201104162427.2984742-1-lee.jones@linaro.org>
References: <20201104162427.2984742-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/input/keyboard/nomadik-ske-keypad.c:71: warning: Function parameter or member 'pclk' not described in 'ske_keypad'
 drivers/input/keyboard/nomadik-ske-keypad.c:71: warning: Function parameter or member 'ske_keypad_lock' not described in 'ske_keypad'

Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Kumar G <naveen.gaddipati@stericsson.com>
Cc: Sundar Iyer <sundar.iyer@stericsson.com>
Cc: linux-input@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/input/keyboard/nomadik-ske-keypad.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/input/keyboard/nomadik-ske-keypad.c b/drivers/input/keyboard/nomadik-ske-keypad.c
index 608446e14614d..0d55a95347f16 100644
--- a/drivers/input/keyboard/nomadik-ske-keypad.c
+++ b/drivers/input/keyboard/nomadik-ske-keypad.c
@@ -58,6 +58,8 @@
  * @board:	keypad platform device
  * @keymap:	matrix scan code table for keycodes
  * @clk:	clock structure pointer
+ * @pclk:	clock structure pointer
+ * @ske_keypad_lock: spinlock protecting the keypad read/writes
  */
 struct ske_keypad {
 	int irq;
-- 
2.25.1

