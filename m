Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 109B62B1AB2
	for <lists+linux-input@lfdr.de>; Fri, 13 Nov 2020 13:05:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727026AbgKMMEl (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 13 Nov 2020 07:04:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726794AbgKMLf5 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 13 Nov 2020 06:35:57 -0500
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EFFAC061A47;
        Fri, 13 Nov 2020 03:35:33 -0800 (PST)
Received: by mail-pg1-x542.google.com with SMTP id r186so6900995pgr.0;
        Fri, 13 Nov 2020 03:35:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=o7NqOob2SuaSO2soq39g6gS3UOakZc15B2k6LvdQYo4=;
        b=LU7DmusLCBEXzffTzVZwGfbz68qGkourJBpHflRtpLpaTPL1LVjxRXAELwN5NLSx9q
         e1wPMrebGTxid8xWK5kk/6vhauXWwn/nBQQNdiIWxZeaSgWVOyJPd5dhclfTOqpoKh+t
         ZSA0M0dkkfdYtdq28jcBnBBLerGg/O7bESZEPUzCQSzZ9UGDChrCQubvZl1HH30+Nf5k
         6X34RR9tnNvzc3FAQgztPwb1HCHyRH/K/NGsHk5SFXrlO0Hi1MZPsw261QZiaAdvSsQd
         kof+MyaFDJ7WPg9+7cfxMGxtiI0bZ1+iMxi4DFM/Z7v+YBk2cjmv9Jbf2Q/d6sMEoCuX
         ZiiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=o7NqOob2SuaSO2soq39g6gS3UOakZc15B2k6LvdQYo4=;
        b=c+eEBk9DMP79KZt/pdzZN6TFs9P7yo1hP3fZetXoh831PZO/2I6EuZX352mRB05eed
         1D2U4sZOSsOfFUQUtUc9BjaUq/GcleJ4hxa7STlcWq9JGQozU5+BfKghJ1yZ1kZiVdS6
         GMHLcvdxuATPvYOC49XIAhANUcSKP1kKrIJrVYFYHh/xoX5S3PgQM2r2qIjTYQ6Sx1H/
         AmQjtadiY1hpGxY5bjFAes/2RvKq76VaVbDTtdy4reltoy16/buc7E9jbvdQGqbCx/5l
         TGRMgZNQHJtjtkyccFri23sVI9aePIviW4jknsuazqoixmkTE5pgMhXGC2PjgHrRK2FW
         xocQ==
X-Gm-Message-State: AOAM5323Y3K+NyyCK9z9qH6SxP/Di/WrvGXgbv4ICGm8PM4u44KPt8Du
        H9+axeXLf5kkl/85BG7rypU=
X-Google-Smtp-Source: ABdhPJyQtmbkHam/d3XIwzXLPa0QF5WRO0ziS6GpXMdrdR38XUXD1y9WSYtJeAh6ZoGZRzRe0qHrWQ==
X-Received: by 2002:a17:90b:512:: with SMTP id r18mr2574045pjz.149.1605267332853;
        Fri, 13 Nov 2020 03:35:32 -0800 (PST)
Received: from ubt.spreadtrum.com ([117.18.48.82])
        by smtp.gmail.com with ESMTPSA id q12sm9900987pfc.84.2020.11.13.03.35.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2020 03:35:32 -0800 (PST)
From:   Chunyan Zhang <zhang.lyra@gmail.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang7@gmail.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Chunyan Zhang <chunyan.zhang@unisoc.com>,
        Nemo Han <nemo.han@unisoc.com>
Subject: [PATCH 3/3] dt-bindings: input: Add compatible string for SC2721 and SC2730
Date:   Fri, 13 Nov 2020 19:34:51 +0800
Message-Id: <20201113113451.52355-3-zhang.lyra@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201113113451.52355-1-zhang.lyra@gmail.com>
References: <20201113113451.52355-1-zhang.lyra@gmail.com>
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
index abdf459d9141..a94c4b790487 100644
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

