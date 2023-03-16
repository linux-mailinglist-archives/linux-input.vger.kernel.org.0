Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 25C0F6BD3E8
	for <lists+linux-input@lfdr.de>; Thu, 16 Mar 2023 16:35:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231149AbjCPPfh (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 16 Mar 2023 11:35:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231834AbjCPPew (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 16 Mar 2023 11:34:52 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 418F5E4C48;
        Thu, 16 Mar 2023 08:31:39 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id o12so9153836edb.9;
        Thu, 16 Mar 2023 08:31:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678980610;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kR1oOd0KW+NoHybvtjt8GhtXv3GPHKja8BztShJw2Sc=;
        b=DnvEH2yt7mXhqeCKIGZALHx+GWSIxRKGQhllkUUxzmYLK53DYFsu3Mp37WFBBz8nVL
         p4LMttNZBh7GMresFLGX/v8fhDPS22LuhJcFHJ9kCYfHulu60ONRQ6TicPIx+HpHrBUB
         wYeBlU+KcXZIweglDVJKvEARNbPeU/cXKK/Ju0Sx+6RWK0/bbLvce0MVDAkIhfzljnLi
         3OYNA9WupYhTVdKkeZCmIXaQsvPybrOBn3aQ/9PMf+/F4eXZYjm0rflrvpCJk6tn7u1s
         sR2wNpdBgWN9JKF09ijqhwTkwVLDcfkyIaTf00vHpJui1g4Kg2L2D++Q41xC4TDvmZZw
         jUng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678980610;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kR1oOd0KW+NoHybvtjt8GhtXv3GPHKja8BztShJw2Sc=;
        b=LH+lgbEl9iS8pW72lBlzR+hPYyxd8Q4u9xCR2xh2PYwlD2OO58cyLV7nFhowRVGwt1
         5Ka4FhrgN5SQoLNsu+aRQzwgbV6R4T08ehl+ERDGbvgbO5rEYXUV7pM5VpT/RaeKLGgc
         FYGOsacntGe/RjXPeSDwBbg6YrPzGmpKqEQId3wshYCCCSp3WQ+CZNVQORC7nLP0IL9J
         suy7OGzHEc0T3/iVjiypuh2/rX1Rtlcm52jl86d4PcWjJXs0Qf15lg70dTFUEBfIJQcu
         XRv6QLgRFCzh5oLIbtwh7ry8+J7OIir+8VW6dCz/nY02sgWz/HGAIQB1j200dS9pCyw0
         IjfQ==
X-Gm-Message-State: AO0yUKUN4BGe7m7aqPufweHAtqaHI2lG164rtV8o7eEHavVB2qnLuomM
        scBl8m8H9UCu7AIGQfcxzLI=
X-Google-Smtp-Source: AK7set/HOUiyIY0YMzvXFDiy9l11rYHYEYSWkk7yen19J93Lq3Yx258aDMaUwmYxFcs41Bd+GaZ/9Q==
X-Received: by 2002:a17:907:7fa1:b0:930:123:8cc8 with SMTP id qk33-20020a1709077fa100b0093001238cc8mr4483529ejc.21.1678980610468;
        Thu, 16 Mar 2023 08:30:10 -0700 (PDT)
Received: from localhost.localdomain (84-84-8-249.fixed.kpn.net. [84.84.8.249])
        by smtp.gmail.com with ESMTPSA id a17-20020a1709063e9100b0093048a8bd31sm1018977ejj.68.2023.03.16.08.30.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Mar 2023 08:30:08 -0700 (PDT)
From:   Jan Jasper de Kroon <jajadekroon@gmail.com>
To:     jajadekroon@gmail.com
Cc:     alexandre.belloni@bootlin.com, broonie@kernel.org,
        devicetree@vger.kernel.org, dmitry.torokhov@gmail.com,
        kernel@undef.tools, krzysztof.kozlowski+dt@linaro.org,
        linux-input@vger.kernel.org, robh+dt@kernel.org
Subject: [PATCH v3 1/2] dt-bindings: input: touchscreen: Add 'goodix-hold-in-reset' property to Goodix
Date:   Thu, 16 Mar 2023 16:29:50 +0100
Message-Id: <20230316152949.67441-1-jajadekroon@gmail.com>
X-Mailer: git-send-email 2.34.3
In-Reply-To: <20230312183106.551840-1-jajadekroon@gmail.com>
References: <20230312183106.551840-1-jajadekroon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add an optional 'goodix-hold-in-reset', to the Goodix touchscreen
device tree binding. When set to true, the touchscreen controller will
be held in reset mode during system suspend, reducing power consumption.
If not present, the property defaults to false.

Signed-off-by: Jan Jasper de Kroon <jajadekroon@gmail.com>
---
Changes from v2 to v3:
- Used imperative mood instead of "This patch adds".
- Dropped "I am submitting this patch to..." as it is redundant.
- Removed the paragraph related to the related patch sent to the 
  linux-input mailing list as it is not necessary.
- Renamed the hold-in-reset-in-suspend function to 
  goodix-hold-in-reset to prevent potential naming conflicts with other 
  functions in the codebase. No functional changes were made.

Changes from v1 to v2:
- Updated subject prefix to match subsystem.
- Added more detailed description of the change.
- Fixed formatting issues in commit message.
 .../devicetree/bindings/input/touchscreen/goodix.yaml     | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/touchscreen/goodix.yaml b/Documentation/devicetree/bindings/input/touchscreen/goodix.yaml
index 3d016b87c8df..197f8db9acc2 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/goodix.yaml
+++ b/Documentation/devicetree/bindings/input/touchscreen/goodix.yaml
@@ -56,6 +56,13 @@ properties:
   touchscreen-size-y: true
   touchscreen-swapped-x-y: true
 
+  goodix-hold-in-reset:
+    description: |
+      When set to true, the touchscreen controller will be held in reset mode
+      during system suspend. This can help reduce power consumption, but may
+      cause the touchscreen to take longer to resume when the system is woken
+      up from suspend.
+
 additionalProperties: false
 
 required:
@@ -75,6 +82,7 @@ examples:
         interrupts = <0 0>;
         irq-gpios = <&gpio1 0 0>;
         reset-gpios = <&gpio1 1 0>;
+        goodix-hold-in-reset;
       };
     };
 
-- 
2.34.3

