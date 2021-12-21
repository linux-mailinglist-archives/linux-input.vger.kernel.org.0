Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 31E3747C755
	for <lists+linux-input@lfdr.de>; Tue, 21 Dec 2021 20:17:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229436AbhLUTRv (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 21 Dec 2021 14:17:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241729AbhLUTRv (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 21 Dec 2021 14:17:51 -0500
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1C6DC06173F
        for <linux-input@vger.kernel.org>; Tue, 21 Dec 2021 11:17:50 -0800 (PST)
Received: by mail-wr1-x42e.google.com with SMTP id e5so60342wrc.5
        for <linux-input@vger.kernel.org>; Tue, 21 Dec 2021 11:17:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KUy4u4/fllLjqTaoSYHcRo6aZSM05/Tqo7d9/i38GsM=;
        b=mVCS7gzy//josiO9WrCr/f074SLOb/Wm8Y9DgBz0lIb/EUURBPouk2Z9blaSLC7XNj
         aF0CptxB6wdog31sXXK6ollyfpaTpzlqaE7Cmlh+dEXifDvSx1ESznGk7waOCW6Vz2BB
         bS8AXRhwIExv2iNZXF7LXznu6XYBgZGeLzKtO0iDbomLcK5z1adu0g5FUR94twPNUR0c
         +5+pTUxU9dfcVpQU2w8VItG6xheqHgI4a2i2fgs9MXURBLPpmowp/349g9k5Ok//aEli
         3WiTh5Dwq6g0ww5aTLjynkxiPAhCWBR+8/OKFSPPkI5f8bQ2SfOBn+9FauBcsnWJFGS5
         gG4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KUy4u4/fllLjqTaoSYHcRo6aZSM05/Tqo7d9/i38GsM=;
        b=0S/u0P2pS63i9XaRlHjeCKmu2z/6EFENduReAyt5cMXC9KdfK4jDEHqKbHwLmj2XRW
         J9dV8wpyZ42YuyaQVv4QXXWpG8PHAXgDt1UEz/Eiy8+5A1p94RyX+Rpz5SgLec2yxJi/
         Xs/CJn/B+JnlbwQcix8WVEvQeNWNkHP9J8do6GAFxLNtO9k08a0ld03xvAGIgx56Yymq
         BCJDkOK3QldDiotTmO7tGhwc72Xed9LXW7M1ybpKGAN45ccfDjdS60SDGvKeXg/x3+BK
         gqsYgOmLzAGqRsxuuKBesKrSRBH5L8r2yTcOyo/+VDJKZT0DT1Pwqf7tymHpkUQxKBat
         rDiA==
X-Gm-Message-State: AOAM532PH51x7RWSS/9ar+G9ru5HwmWgjlt/q6RcfN7+3qOelsym6nZK
        V/4k98R3rlAUh6IlyReIFhUbZlX1Qr8w9Phm7VA=
X-Google-Smtp-Source: ABdhPJyD8JxqKj61KGmKzpj8jCyPpUPNZp6E5+O53hkOQ/VSiFEef+b3EQZcIxdFyfJ6iqp7/FeU2g==
X-Received: by 2002:adf:d841:: with SMTP id k1mr3976074wrl.396.1640114269365;
        Tue, 21 Dec 2021 11:17:49 -0800 (PST)
Received: from aczubak.c.googlers.com.com (109.36.187.35.bc.googleusercontent.com. [35.187.36.109])
        by smtp.gmail.com with ESMTPSA id t8sm3994846wmq.32.2021.12.21.11.17.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Dec 2021 11:17:49 -0800 (PST)
From:   Angela Czubak <acz@semihalf.com>
To:     linux-input@vger.kernel.org
Cc:     upstream@semihalf.com, dmitry.torokhov@gmail.com,
        Angela Czubak <acz@semihalf.com>
Subject: [PATCH 03/18] Input: add INPUT_PROP_HAPTIC_TOUCHPAD
Date:   Tue, 21 Dec 2021 19:17:28 +0000
Message-Id: <20211221191743.1893185-4-acz@semihalf.com>
X-Mailer: git-send-email 2.34.1.307.g9b7440fafd-goog
In-Reply-To: <20211221191743.1893185-1-acz@semihalf.com>
References: <20211221191743.1893185-1-acz@semihalf.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

INPUT_PROP_HAPTIC_TOUCHPAD property is to be set for a device with simple
haptic capabilities.

Signed-off-by: Angela Czubak <acz@semihalf.com>
---
 include/uapi/linux/input-event-codes.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/uapi/linux/input-event-codes.h b/include/uapi/linux/input-event-codes.h
index 225ec87d4f22..df2ba5da4eaa 100644
--- a/include/uapi/linux/input-event-codes.h
+++ b/include/uapi/linux/input-event-codes.h
@@ -27,6 +27,7 @@
 #define INPUT_PROP_TOPBUTTONPAD		0x04	/* softbuttons at top of pad */
 #define INPUT_PROP_POINTING_STICK	0x05	/* is a pointing stick */
 #define INPUT_PROP_ACCELEROMETER	0x06	/* has accelerometer */
+#define INPUT_PROP_HAPTIC_TOUCHPAD	0x07	/* is a haptic touchpad */
 
 #define INPUT_PROP_MAX			0x1f
 #define INPUT_PROP_CNT			(INPUT_PROP_MAX + 1)
-- 
2.34.1.307.g9b7440fafd-goog

