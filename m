Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 394796BD452
	for <lists+linux-input@lfdr.de>; Thu, 16 Mar 2023 16:49:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231571AbjCPPtF (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 16 Mar 2023 11:49:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231285AbjCPPtC (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 16 Mar 2023 11:49:02 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECA07241E8;
        Thu, 16 Mar 2023 08:48:30 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id cn21so9641659edb.0;
        Thu, 16 Mar 2023 08:48:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678981707;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kR1oOd0KW+NoHybvtjt8GhtXv3GPHKja8BztShJw2Sc=;
        b=JKEObWMVttxaoJpJYcHNbfQBItwun3NaiDI7u2gNPtBs+JhLSs51yP6un4UFSCWY2D
         CsQpOtZ3hZ6RiWlDUGr+i34+bEwe/yYSDoewMWEDiS7woBa/hIiDBg8u93akWRPPH+q0
         akUriDCXHFJgkVwZ5qEbtID3jJBdavTYF0lxEpmwYHZ9GssAiWM3VNVujzTmPXC010M8
         EGFko7sIfYxRFIEjtWEeI6XnXQtU3BggLigF01Rv7keD6gfMxNuG3esaVecufD5yF3R1
         uqGN4J4hLGHfoq9q5g0iQwmjT/hP+4n88qatxK4WOz5Uvc6VyNgOcwQrnufFhwG9ka//
         KGSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678981707;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kR1oOd0KW+NoHybvtjt8GhtXv3GPHKja8BztShJw2Sc=;
        b=ABPr4aNfC/Z9vVfZXYGl7yXV0zUHnWvo1peK5O0U8GUvR28NdudAALYztTd+gEmi39
         gyCz7SiY4g4ISIcsSVHGMDHpis9vdduidds6plQKJh2XS8v5xc/nkU4ycc4ipeMECSlh
         2wT/i7LcpvvjYrSUzDI1HSYzBFByALouQVBuqGdX+RINp+36/J6On2YyvFIAlevV58OI
         TPUF1Pp8dQy8/WOeHPX5txr6QviVLRoShtbNK8II5hyecedeljioFYxy7gFMufsK/15A
         8g3ej2CqAH0Z00QAFd9H3qSnkB1WyxnYli3u41oxglJUtE5Rg2vsh75WBdTPaXY4IPiY
         hyVg==
X-Gm-Message-State: AO0yUKUCkt1TwT9JioF2cJ3/Bi7jJnEpGeNwJ3KOG33ccKn/8yuJsdQl
        oenRr7YHRogMKN+OO4CrjkU=
X-Google-Smtp-Source: AK7set+hCOPOy0QtU16+jr9bUyw6DBpMqNkwrERWt938iQqHY6QyGQ73tBzzl5055opqoWty08uKZQ==
X-Received: by 2002:a17:906:e091:b0:8b1:3d17:811e with SMTP id gh17-20020a170906e09100b008b13d17811emr11508595ejb.12.1678981707593;
        Thu, 16 Mar 2023 08:48:27 -0700 (PDT)
Received: from localhost.localdomain (84-84-8-249.fixed.kpn.net. [84.84.8.249])
        by smtp.gmail.com with ESMTPSA id c23-20020a170906171700b00926b944676esm3952301eje.131.2023.03.16.08.48.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Mar 2023 08:48:26 -0700 (PDT)
From:   Jan Jasper de Kroon <jajadekroon@gmail.com>
To:     jajadekroon@gmail.com
Cc:     alexandre.belloni@bootlin.com, broonie@kernel.org,
        devicetree@vger.kernel.org, dmitry.torokhov@gmail.com,
        kernel@undef.tools, krzysztof.kozlowski+dt@linaro.org,
        linux-input@vger.kernel.org, robh+dt@kernel.org
Subject: [PATCH v3 1/2] dt-bindings: input: touchscreen: Add 'goodix-hold-in-reset' property to Goodix
Date:   Thu, 16 Mar 2023 16:47:50 +0100
Message-Id: <20230316154749.68304-1-jajadekroon@gmail.com>
X-Mailer: git-send-email 2.34.3
In-Reply-To: <20230311134655.486973-1-jajadekroon@gmail.com>
References: <20230311134655.486973-1-jajadekroon@gmail.com>
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

