Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D4F1634A9FF
	for <lists+linux-input@lfdr.de>; Fri, 26 Mar 2021 15:37:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230299AbhCZOf6 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 26 Mar 2021 10:35:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230315AbhCZOfW (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 26 Mar 2021 10:35:22 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34939C0613B1
        for <linux-input@vger.kernel.org>; Fri, 26 Mar 2021 07:35:22 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id x16so5868228wrn.4
        for <linux-input@vger.kernel.org>; Fri, 26 Mar 2021 07:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xh7i5Zt9zY8KA4+yMY4ctmVEgG+7w746xU8n69jbbEs=;
        b=fLcj8t4LYR6hRhlXGoJbtXpS9AeaTkfx75kb7h/IAQkN9bkwczcfHP3SpsfBobIXv2
         8Txb2yVtWky8UpSkBZnd4SoEHbYDnOY2ZHvtSLUfONx2PLo5jiUbNcBHM/Ultuq53wNb
         /qzmdvlfRUM5xz2gx0M0FVisLXL6vDI3xqDjXzFmJGiBveGl8FHa6Kb+X6sH8bcl1Xvz
         BHBuPt9HoZDMONgY+VJw1WH+rZAXuHkg2B1oWpQ3xbTdnelsjhi7F3oiZo9XHG/WVqLR
         +BWBn/NJa4iGkF42GxiYMq6RB7IUnmZA/vxVs4cdqP6x8CCXbkruUN1Tz3gz5+sAdepC
         6b2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xh7i5Zt9zY8KA4+yMY4ctmVEgG+7w746xU8n69jbbEs=;
        b=ZR1EdocyOAMoQR5tTaDy4e70qz55iomhKj43LRXxZ0K66eQH17CXopVmSKaaxUlOTV
         AczXuZPP9WBf/ilW/ErL77c4c4/C1SApbX3HnaxVac99HWcqufrEdMnGbFQ0+tdyBE6R
         DJ61YAsyEY09Kj8Yor+Sg9VxkcFAUMFY7UesuncMVkjbC5RUbbj/Brl7pLPRfgri+cn1
         MJsIXEjjzuNOkzY1nAQj1Qt8/GIJ0Nv/ANQI64iITs/+ADMDP6qewzoyrEs72ov3NPkM
         1rar06w8Mg3L+KPkPdd6x2sKZGeobNLo52bLDmMQNuilXsOmfxPoVTQYb2zQ1pjvV3zv
         FPiA==
X-Gm-Message-State: AOAM531FwXfQrDHm+b6qSHC79/ThcceBfVWdriogDbgWlXUo28Nenm7v
        Kk5MsBtOr01/4y86stYMRwn0rw==
X-Google-Smtp-Source: ABdhPJwb/a/SRwF/DAAw8ogBKfBvlx8OkfX2V5/f/vRfPam9TRSF9EbP2sUYi4E/UDR4SJzevq431Q==
X-Received: by 2002:adf:ea0e:: with SMTP id q14mr15168861wrm.389.1616769320924;
        Fri, 26 Mar 2021 07:35:20 -0700 (PDT)
Received: from dell.default ([91.110.221.194])
        by smtp.gmail.com with ESMTPSA id j26sm12878225wrh.57.2021.03.26.07.35.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Mar 2021 07:35:20 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org
Subject: [PATCH 19/25] HID: hid-uclogic-params: Ensure function names are present and correct in kernel-doc headers
Date:   Fri, 26 Mar 2021 14:34:52 +0000
Message-Id: <20210326143458.508959-21-lee.jones@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210326143458.508959-1-lee.jones@linaro.org>
References: <20210326143458.508959-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/hid/hid-uclogic-params.c:33: warning: expecting prototype for Convert a pen in(). Prototype was for uclogic_params_pen_inrange_to_str() instead
 drivers/hid/hid-uclogic-params.c:519: warning: wrong kernel-doc identifier on line:
 drivers/hid/hid-uclogic-params.c:706: warning: expecting prototype for uclogic_params_init(). Prototype was for uclogic_params_huion_init() instead

Cc: Jiri Kosina <jikos@kernel.org>
Cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc: linux-input@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/hid/hid-uclogic-params.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/hid/hid-uclogic-params.c b/drivers/hid/hid-uclogic-params.c
index 6af25c38b9ccb..3d67b748a3b95 100644
--- a/drivers/hid/hid-uclogic-params.c
+++ b/drivers/hid/hid-uclogic-params.c
@@ -21,7 +21,8 @@
 #include <asm/unaligned.h>
 
 /**
- * Convert a pen in-range reporting type to a string.
+ * uclogic_params_pen_inrange_to_str() - Convert a pen in-range reporting type
+ *                                       to a string.
  *
  * @inrange:	The in-range reporting type to convert.
  *
@@ -516,7 +517,8 @@ void uclogic_params_cleanup(struct uclogic_params *params)
 }
 
 /**
- * Get a replacement report descriptor for a tablet's interface.
+ * uclogic_params_get_desc() - Get a replacement report descriptor for a
+ *                             tablet's interface.
  *
  * @params:	The parameters of a tablet interface to get report
  *		descriptor for. Cannot be NULL.
@@ -689,7 +691,7 @@ static void uclogic_params_init_with_pen_unused(struct uclogic_params *params)
 }
 
 /**
- * uclogic_params_init() - initialize a Huion tablet interface and discover
+ * uclogic_params_huion_init() - initialize a Huion tablet interface and discover
  * its parameters.
  *
  * @params:	Parameters to fill in (to be cleaned with
-- 
2.27.0

