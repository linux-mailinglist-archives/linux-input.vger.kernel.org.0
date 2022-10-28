Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7796A611B83
	for <lists+linux-input@lfdr.de>; Fri, 28 Oct 2022 22:27:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229739AbiJ1U1E (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 28 Oct 2022 16:27:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229744AbiJ1U1D (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 28 Oct 2022 16:27:03 -0400
Received: from mail-oa1-x2a.google.com (mail-oa1-x2a.google.com [IPv6:2001:4860:4864:20::2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 183681E7478;
        Fri, 28 Oct 2022 13:26:59 -0700 (PDT)
Received: by mail-oa1-x2a.google.com with SMTP id 586e51a60fabf-13ba9a4430cso7523120fac.11;
        Fri, 28 Oct 2022 13:26:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KV7ywrxE9IjYQaMA+QAo3Kx56L98yM+ZIpIAbUeFJpA=;
        b=p9cpJleHEd3SP2lGSjRKnQNqjL2A9ZZJMX2Fe4NIOvJ+M5ILDTbMncU/QeIrUhvUzT
         NPCKyKGOXqIp7uYAtQ8JAdu/f1tpdPR6WJzru95SNS86Pw0MJluiTZvDXRCv55GJbioN
         KWdv9Pa9hSvkxGkXX87vi+NhSbs7xArtBbjQIe9rwQ41CBN59s1pZzkQOYvqljzRgUIs
         U2rhLofsqBBVkv7TZcp0AL9w3hrWm4D5q9NV25jtSKWe/vi6OQ+o+irpVZQVvDm5xZUj
         F7mET2YRFGP3N0iiRwp3ltXmjgNc6m7I8BfuNYWmzeVGoaOVLgmlHbDJlVYifk0qpXqn
         X0Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KV7ywrxE9IjYQaMA+QAo3Kx56L98yM+ZIpIAbUeFJpA=;
        b=tHyGWjGvsXLw1XBI4vvGqC/ibR35F3KatY6DC9BOFWX4S/V0YDDiJ2KG0kuYUzR4lN
         BhuEAlhXVaboiaheXx1sh3ijX2Fu5yxttJQWIbsqMI1nAJ8EBXXyIwW1s+dAfnOWHUPf
         OBMy70olg/9c4fQclBy06I8TNlX1fZ71et82/MrGeeQolFxwTIM4WJ06nQhOcCCt7dS8
         WfzQHwj+WUgE8iq4leKrsJUGLZbAZLs5xKAtvTpsaEo83k9J8QlrQgqo7+m3ihX/B1Bp
         ko0SakJwahXjmbfLq8UmQR+hEQ3xh4vO96T9h6aCusC3KqrPvRHrHJtXR6vKx9TFeMvP
         Vc4Q==
X-Gm-Message-State: ACrzQf0Lma1r6c0VUgVuQHjYgXzEC9VS6c+XkG8FFQvc+5WyMss3ISRx
        JEOWePtpD3vihx/85TY2MllljHPhffg=
X-Google-Smtp-Source: AMsMyM7Zf70VdwItcB9bY4KwxHAu9aKWVu5/IZntFxgPZrKlQjrKmgm+MxyUxKD2PSTkzsbeCp6kcQ==
X-Received: by 2002:a05:6870:d24a:b0:13b:68bd:a391 with SMTP id h10-20020a056870d24a00b0013b68bda391mr10199782oac.75.1666988818171;
        Fri, 28 Oct 2022 13:26:58 -0700 (PDT)
Received: from wintermute.localdomain (76-244-6-13.lightspeed.rcsntx.sbcglobal.net. [76.244.6.13])
        by smtp.gmail.com with ESMTPSA id u43-20020a4a972e000000b004728e64dc0fsm1914744ooi.38.2022.10.28.13.26.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Oct 2022 13:26:57 -0700 (PDT)
From:   Chris Morgan <macroalpha82@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     devicetree@vger.kernel.org, rydberg@bitmath.org,
        krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org,
        dmitry.torokhov@gmail.com, mkorpershoek@baylibre.com,
        Chris Morgan <macromorgan@hotmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH V4 1/3] dt-bindings: vendor-prefixes: add Hynitron vendor prefix
Date:   Fri, 28 Oct 2022 15:26:34 -0500
Message-Id: <20221028202636.14341-2-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221028202636.14341-1-macroalpha82@gmail.com>
References: <20221028202636.14341-1-macroalpha82@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Chris Morgan <macromorgan@hotmail.com>

Hynitron is a company based in Shanghai that makes controller ICs for
touchscreens.

http://www.hynitron.com/

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 6e323a380294..b11b19c14669 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -567,6 +567,8 @@ patternProperties:
     description: Hycon Technology Corp.
   "^hydis,.*":
     description: Hydis Technologies
+  "^hynitron,.*":
+    description: Shanghai Hynitron Microelectronics Co. Ltd.
   "^hynix,.*":
     description: SK Hynix Inc.
   "^hyundai,.*":
-- 
2.25.1

