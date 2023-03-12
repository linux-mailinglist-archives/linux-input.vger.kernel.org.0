Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4394D6B6A21
	for <lists+linux-input@lfdr.de>; Sun, 12 Mar 2023 19:35:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230443AbjCLSfL (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 12 Mar 2023 14:35:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230193AbjCLSez (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 12 Mar 2023 14:34:55 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C83CA1BAF1;
        Sun, 12 Mar 2023 11:32:47 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id r18so9374361wrx.1;
        Sun, 12 Mar 2023 11:32:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678645910;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4u86lk7YmBySt8wb7Y0zQ8LQVh79OIvkS6+6kSfrZqk=;
        b=ffZv5fAXns2cxW8hL/Sh6JHCqV46MLI2EvfekNoWUJyKzQG77v3Gw3MsCBS/aLRbcy
         c9oSQRbkzbLk+XbvS7Pn7wqN25gOK3sSNUSu8/447iGaSbzIPaOzejs68lcRP2NM4H+n
         bAyx8NWyf0xX52KZU3Voh1vmuRa7Izf1SM+vSj3RJqFvTdtZ63fTPIuZPoNBfoKhE9hT
         GBbwFS/M2WPJWW6v3L4UVjQvqszz2LHlFh8myaZLRqh8Y8vpWM0mJEh2KcYwnvsRes6z
         f/ybXaq2gRmGCcWd5ZJTXPIEgEgjXurRhNlho/9XcE7NK70Jp1eHWlIaEZC5QJ8unZ19
         E6Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678645910;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4u86lk7YmBySt8wb7Y0zQ8LQVh79OIvkS6+6kSfrZqk=;
        b=8GyVYC5Z3UYeo2uA4sQJkl3U+CAsswg+GHYyjgF0qt6CyQ9l7CGdm/J+oubLCer2C3
         AFLWB4X0SCeXYpp1Ked2fNVNuqtAZ/xJhac1rd43awIqbMGLL4v56XyMXAjyu/mB6O5E
         8IrdQWWQie/YhKMhhyY7KjRkOR/4f7ruYAZ1ocQzOBMSdofWf1neFbxEdGpAxRX8Bwqm
         TIrDgfbdkgleFgamYY+r8jqYfjhhxX46axekyKdxDh7QfajgQ7nXblvbkFN8VSJbl8GI
         jS9Kwup55saVZdiuAU+ct9y4ocqQF2q0lTJtvpHEICtNBI0lU/GTkZqTTT+0ClV446GV
         BW7w==
X-Gm-Message-State: AO0yUKWSw6UPmmlqzv2TKznIK7GxZeaVvHMXje7pJ/Z/hl0Cb1Ba5wmd
        cClZI/LVUkYnWMdwpTSHF9CP1enG1WrQKuUVzuw=
X-Google-Smtp-Source: AK7set8UE+YfYq2WbFwKz7jKDgvmJrGzfJBpHx/TD3nib+P5x75zbjqG+/Nmr7OVneA5BD0NsxeOcw==
X-Received: by 2002:adf:e703:0:b0:2c3:dd81:49ad with SMTP id c3-20020adfe703000000b002c3dd8149admr20730970wrm.33.1678645910276;
        Sun, 12 Mar 2023 11:31:50 -0700 (PDT)
Received: from localhost.localdomain ([146.70.189.10])
        by smtp.gmail.com with ESMTPSA id d4-20020adffbc4000000b002be505ab59asm5577568wrs.97.2023.03.12.11.31.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Mar 2023 11:31:49 -0700 (PDT)
From:   Jan Jasper de Kroon <jajadekroon@gmail.com>
To:     jajadekroon@gmail.com
Cc:     devicetree@vger.kernel.org, dmitry.torokhov@gmail.com,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        broonie@kernel.org, alexandre.belloni@bootlin.com,
        kernel@undef.tools, linux-input@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: input: touchscreen: Add 'hold-in-reset-in-suspend' property to goodix
Date:   Sun, 12 Mar 2023 19:31:07 +0100
Message-Id: <20230312183106.551840-1-jajadekroon@gmail.com>
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

This patch adds a new optional property, 'hold-in-reset-in-suspend', to the
Goodix touchscreen device tree binding. When set to true, the touchscreen
controller will be held in reset mode during system suspend, reducing
power consumption. If not present, the property defaults to false.

I am submitting this patch to the Device Tree mailing list to add a new
property to the Goodix touchscreen device tree binding. This patch
supplements a related patch sent to the linux-input mailing list, which
updates the Goodix touchscreen driver to use this new property.The
linux-input patch can be found at:
https://lore.kernel.org/all/20230311131534.484700-1-jajadekroon@gmail.com/

Signed-off-by: Jan Jasper de Kroon <jajadekroon@gmail.com>
---
V1 -> V2:
- Updated subject prefix to match subsystem
- Added more detailed description of the change
- Fixed formatting issues in commit message
 .../devicetree/bindings/input/touchscreen/goodix.yaml  | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/touchscreen/goodix.yaml b/Documentation/devicetree/bindings/input/touchscreen/goodix.yaml
index 3d016b87c8df..cd4dd3d25364 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/goodix.yaml
+++ b/Documentation/devicetree/bindings/input/touchscreen/goodix.yaml
@@ -56,6 +56,15 @@ properties:
   touchscreen-size-y: true
   touchscreen-swapped-x-y: true
 
+  hold-in-reset-in-suspend:
+    type: boolean
+    default: false
+    description: |
+      When set to true, the touchscreen controller will be held in reset mode
+      during system suspend. This can help reduce power consumption, but may
+      cause the touchscreen to take longer to resume when the system is woken
+      up from suspend. Defaults to false if not present.
+
 additionalProperties: false
 
 required:
@@ -75,6 +84,7 @@ examples:
         interrupts = <0 0>;
         irq-gpios = <&gpio1 0 0>;
         reset-gpios = <&gpio1 1 0>;
+        hold-in-reset-in-suspend;
       };
     };
 
-- 
2.34.3

