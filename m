Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91C452B5887
	for <lists+linux-input@lfdr.de>; Tue, 17 Nov 2020 04:50:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727342AbgKQDuP (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 16 Nov 2020 22:50:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725730AbgKQDuP (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 16 Nov 2020 22:50:15 -0500
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DFAFC0613CF;
        Mon, 16 Nov 2020 19:50:15 -0800 (PST)
Received: by mail-pl1-x644.google.com with SMTP id k7so9516986plk.3;
        Mon, 16 Nov 2020 19:50:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=O/kWm3Dkd2STDm+LsQ3zyZK4EutUpyL4Yg9Ub+0dX+8=;
        b=aeuBm54MVbfPhkalpTCqWszSKOyZjk7yqkv3eLCh6lgj4JEThoDtP9l9eeJ8J7SChr
         zHehSUmxC8jC0+ypeCCxqOXI1hz/7V8e4GZdregDdItv7suctn9SVkWkcwmRbAf+SLhs
         BPeeZVqvRj4NBT9Roj4cMhsL7vbgJpqQVN0+aLNoOO1qMsYmCa/N+JNWwYrolmdEl8h+
         rjrHITJ6fFWFMF9HSCMa48m8ABdewDZA8NLtVetETfMnCdM3soHoZSexH2xeGi+Rufqj
         qnL53sAWlu4e6mx+XtA5JsjvzRwtY3zk0/1rQxdqwSFY4ToHhFsqOuG8NBIy/gPbYt6v
         m5ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=O/kWm3Dkd2STDm+LsQ3zyZK4EutUpyL4Yg9Ub+0dX+8=;
        b=rKK2D2d+sRzNTiPDO7Ak2bxDbItcn3UzTe2xttkD5W0hdGuSmoJwri8ZVFtrVr0D6X
         ckCSMsygyo0NJSb6QTj2mNSbPCBHuPPqVx5KtMVGejUUucOVMrWGQP3uQpS08m1sqtmI
         96JtT9t+DgA++V94nmq6gk90kpZjbkJ3DQATX+UWF4TDTTHOw2e07qPI7yMbQznDNsfD
         GqDRbpfoBkQCkNUJpjZfmFn1G6ZVlCEx9Et2gPh+f/RYmN6t65TIce51NRCNeGgQ3y1o
         x+j5FFC3cXu72daaLxLVMk0NYCW+bynb90d3fbJ4bVQyx1e+JJP58rZzHdv7sk5z98SO
         vcog==
X-Gm-Message-State: AOAM531U2hznhi7dVJyGjrA8mjIZvX0SMAtRVnXuHaUbqfYliW0fmnGt
        KxvatGC2PxN+gTJBeRUKzup0cjzJ+AmAcA==
X-Google-Smtp-Source: ABdhPJw/YgdOpMlt6WDYoWdVMVeEqFZIXgEY4KizmZcCJG24mEXKfFFKvEPqWpvj0ydwskClPxfs+w==
X-Received: by 2002:a17:902:d211:b029:d7:cd5e:2857 with SMTP id t17-20020a170902d211b02900d7cd5e2857mr15475441ply.45.1605585014871;
        Mon, 16 Nov 2020 19:50:14 -0800 (PST)
Received: from ubt.spreadtrum.com ([117.18.48.82])
        by smtp.gmail.com with ESMTPSA id u24sm19602329pfm.51.2020.11.16.19.50.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2020 19:50:14 -0800 (PST)
From:   Chunyan Zhang <zhang.lyra@gmail.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang7@gmail.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Chunyan Zhang <chunyan.zhang@unisoc.com>,
        Nemo Han <nemo.han@unisoc.com>
Subject: [PATCH v2 3/3] dt-bindings: input: Add compatible string for SC2721 and SC2730
Date:   Tue, 17 Nov 2020 11:49:49 +0800
Message-Id: <20201117034949.47877-4-zhang.lyra@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201117034949.47877-1-zhang.lyra@gmail.com>
References: <20201117034949.47877-1-zhang.lyra@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Chunyan Zhang <chunyan.zhang@unisoc.com>

Add new compatible strings to support sc2730 and sc2721 which are
two varieties of SC27XX family.

Signed-off-by: Chunyan Zhang <chunyan.zhang@unisoc.com>
---
 .../devicetree/bindings/input/sprd,sc27xx-vibrator.yaml         | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/sprd,sc27xx-vibrator.yaml b/Documentation/devicetree/bindings/input/sprd,sc27xx-vibrator.yaml
index b8a3f23ee3dd..5d67fc8ebc18 100644
--- a/Documentation/devicetree/bindings/input/sprd,sc27xx-vibrator.yaml
+++ b/Documentation/devicetree/bindings/input/sprd,sc27xx-vibrator.yaml
@@ -15,6 +15,8 @@ maintainers:
 properties:
   compatible:
     enum:
+      - sprd,sc2721-vibrator
+      - sprd,sc2730-vibrator
       - sprd,sc2731-vibrator
 
   reg:
-- 
2.25.1

