Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 70AD2607583
	for <lists+linux-input@lfdr.de>; Fri, 21 Oct 2022 12:57:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229747AbiJUK5E (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 21 Oct 2022 06:57:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229952AbiJUK47 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 21 Oct 2022 06:56:59 -0400
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 971BF25C4AE
        for <linux-input@vger.kernel.org>; Fri, 21 Oct 2022 03:56:56 -0700 (PDT)
Received: by mail-pl1-x636.google.com with SMTP id k9so1993072pll.11
        for <linux-input@vger.kernel.org>; Fri, 21 Oct 2022 03:56:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=quanta-corp-partner-google-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xEGNT4/3lz34cY+3eCl12Hw3t70qCjaHbNwjPzY9H3I=;
        b=XyM12OxvqesbIsWCiOuLMTE4RB/6jGoLyijiv+bvmNPkZMOl6EzvTaeKMBoikNOgCG
         YIZwM4pN58aaUGH0B52MpeF66Ge3GxmOIjBXll47I68K/VvjDViu/Y+72boej9p6Yv9A
         9vv7VB/F+IJfYbXu9sQmqLIvjZAAt0dqbtH9DfekMXbZV+nBnxTVS+qUBNqI2JIR8G2z
         gavUWPUutWBLkyfv2hjzJBKA3kLiQevsslY76KTCyo2GCrywrCCIBVcqRlpXv1QJfOAH
         qX+UvdbWcwI8f1MsqAtFQ5JSip/NJIIquhF30rDRFl44+ii6T8OVgOMpkGMgNFDIbUw+
         N63w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xEGNT4/3lz34cY+3eCl12Hw3t70qCjaHbNwjPzY9H3I=;
        b=BFjrbmlWFH7+0stpghwMmBN2aqfKh1CDYILgCz2Y6OArQw8jfOIl99Dhkewc3TTg8+
         xfJeh8rdM5edE5D/stC2N1up4d/ID3TQzmluujGAlBZNgbM5pVyBoCgJo4N8sQeUdfYm
         ED7bSvrYhz3BI2bs+BV9jBTFKNX9vx99HAUpORU7AqbCjUfc4r8ryke3H1LH3a6x5WUr
         1o45+C6pfxIDRARs+0Qg1/khU5dqUFSJkhS4ILwG2ls3zBHlrGhDr/866I898e3zZ/b/
         PZMydxNDXaeSC+/5vxc9IdITchNXzEeGvxlDO6rpK85lwv1qvYStkHMMVwlNJk+91h26
         2K0Q==
X-Gm-Message-State: ACrzQf33mgf9KBEKxB0FMk0toRvXKPlKZzr74BfdoWP5k9TEM4P4/ert
        sQawD1UEp0kTg5ttIm6JH/vsIw==
X-Google-Smtp-Source: AMsMyM42VQvyM4Bn4cyMJxZbf4spKqgy0fLJwNy5b/WigrgwDfb/73XGyHg/fxr8jLl7mm/UrONcdg==
X-Received: by 2002:a17:90a:4fe4:b0:20a:629c:e854 with SMTP id q91-20020a17090a4fe400b0020a629ce854mr58910281pjh.30.1666349816341;
        Fri, 21 Oct 2022 03:56:56 -0700 (PDT)
Received: from liang-Predator-PH517-52.. (2001-b400-e339-bb7d-a809-3af0-ee98-4fc4.emome-ip6.hinet.net. [2001:b400:e339:bb7d:a809:3af0:ee98:4fc4])
        by smtp.gmail.com with ESMTPSA id 2-20020a620602000000b0052d4cb47339sm14822957pfg.151.2022.10.21.03.56.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Oct 2022 03:56:56 -0700 (PDT)
From:   Sheng-Liang Pan <sheng-liang.pan@quanta.corp-partner.google.com>
To:     LKML <linux-kernel@vger.kernel.org>
Cc:     dianders@chromium.org,
        Sheng-Liang Pan <sheng-liang.pan@quanta.corp-partner.google.com>,
        Rob Herring <robh@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-input@vger.kernel.org
Subject: [PATCH v8 3/4] dt-bindings: input: touchscreen: Add goodix GT7986U touchscreen chip
Date:   Fri, 21 Oct 2022 18:56:22 +0800
Message-Id: <20221021105623.3520859-2-sheng-liang.pan@quanta.corp-partner.google.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221021105623.3520859-1-sheng-liang.pan@quanta.corp-partner.google.com>
References: <20221021105623.3520859-1-sheng-liang.pan@quanta.corp-partner.google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add an goodix touch screen chip GT7986U.

Acked-by: Rob Herring <robh@kernel.org>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
Signed-off-by: Sheng-Liang Pan <sheng-liang.pan@quanta.corp-partner.google.com>
---

Changes in v7:
- goodix gt7986 dt bindings added in v7

 Documentation/devicetree/bindings/input/goodix,gt7375p.yaml | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/input/goodix,gt7375p.yaml b/Documentation/devicetree/bindings/input/goodix,gt7375p.yaml
index fe1c5016f7f31..1c191bc5a1782 100644
--- a/Documentation/devicetree/bindings/input/goodix,gt7375p.yaml
+++ b/Documentation/devicetree/bindings/input/goodix,gt7375p.yaml
@@ -16,8 +16,11 @@ description:
 
 properties:
   compatible:
-    items:
+    oneOf:
       - const: goodix,gt7375p
+      - items:
+          - const: goodix,gt7986u
+          - const: goodix,gt7375p
 
   reg:
     enum:
-- 
2.34.1

