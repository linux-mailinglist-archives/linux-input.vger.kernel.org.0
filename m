Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AD14D53AFBF
	for <lists+linux-input@lfdr.de>; Thu,  2 Jun 2022 00:51:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230059AbiFAUwi (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 1 Jun 2022 16:52:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230206AbiFAUvQ (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 1 Jun 2022 16:51:16 -0400
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com [IPv6:2607:f8b0:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A22E2789A4;
        Wed,  1 Jun 2022 13:49:36 -0700 (PDT)
Received: by mail-ot1-x32f.google.com with SMTP id h9-20020a056830400900b0060b03bfe792so2066069ots.12;
        Wed, 01 Jun 2022 13:49:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HfXAhGZstKpwrUHgURvDPoLbikylL/iicCOJA8WsIcY=;
        b=HhfRdIgpmpyKARVdrEED/uPp+WUPM0DPB5J6H6xjUEdHvNRce1VZMJg6EYTT7B+NMZ
         IJj7Al0Nv3hTyM1A1OlKoHlIceftPOJt0EC27yaeEIFobdD4XKNQPVQTyY4J6VWUdTSD
         BbmG8Fc7Mv1a9+J3UDxDFOfW4r4VqeIth3VDIZZvu1kUICqwiZbfPRm5r4n9l9deAUy2
         79uKI5moGUJX6i/wXBEuatxgt1ZJ7VPMbL4LMO9aElI4GjB4XzsQObpb1YRmhzvBcbkq
         zuHIOgflhWLOdQbdbADFpfenhOk0sgIf5vwoULKxDY6OAvck/geZCkgLQlJdTK7ubT/6
         nq+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HfXAhGZstKpwrUHgURvDPoLbikylL/iicCOJA8WsIcY=;
        b=mJHfJdvV8F8SSaqmpfHCyJ3WrS8W5Q/V1Qd4MkYoyBMumBD1GBZaweArmwrtLn6lnn
         dF0K2lCkcORWETk2HuQHoXl2czaIjDykLRoTsawWpsI36ImKEBeEfC+l9yME3rBZ1iCd
         ugVCHMCTKeZbKFZCBM764tP53JGshFqlqktjdm57f+0FZFlNmZTqw1l4I6Y7gEF1/dOk
         ivejvc1MKKwF4wu39cqaS7AnBJcJzJ/87+efcvXRoREHlYi1HYomWrAA6DZn1GsR0aWS
         Vk5qJjitSjBfgEYkcu0GqvrVZeW914V5kKzmbfsGkFGvjPPVFq5UpAAbmK8W4KuMVNI4
         uZag==
X-Gm-Message-State: AOAM5338uVbi3GuJshxjUm7JaCdu20VkE+D/r0tyJcxU/gchBt54kFM8
        YZJ7bb++1aNmGTOHkDhruHVZooXZQvnOQQ==
X-Google-Smtp-Source: ABdhPJyRknbuKUl+bIxjAPXCiccyukwjL3N8F0BaIT9XZ3J9uLdhIrewDB8j8OUo6Iwzu+C0Ckep7A==
X-Received: by 2002:a05:6830:2002:b0:60a:df8c:18f8 with SMTP id e2-20020a056830200200b0060adf8c18f8mr727455otp.184.1654116572066;
        Wed, 01 Jun 2022 13:49:32 -0700 (PDT)
Received: from wintermute.localdomain (cpe-76-183-134-35.tx.res.rr.com. [76.183.134.35])
        by smtp.gmail.com with ESMTPSA id 3-20020a9d0b83000000b0060603221279sm1222157oth.73.2022.06.01.13.49.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jun 2022 13:49:31 -0700 (PDT)
From:   Chris Morgan <macroalpha82@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     devicetree@vger.kernel.org, dmitry.torokhov@gmail.com,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        heiko@sntech.de, maccraft123mc@gmail.com, contact@artur-rojek.eu,
        Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH v2 1/3] dt-bindings: adc-joystick: add adc-joystick,polled option
Date:   Wed,  1 Jun 2022 15:49:25 -0500
Message-Id: <20220601204927.10256-2-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220601204927.10256-1-macroalpha82@gmail.com>
References: <20220601204927.10256-1-macroalpha82@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Chris Morgan <macromorgan@hotmail.com>

Add documentation for adc-joystick,polled. New device-tree properties
have been added.

- adc-joystick,polled: A boolean value noting the joystick device
		       should be polled rather than use a triggered
		       buffer.

Signed-off-by: Maya Matuszczyk <maccraft123mc@gmail.com>
Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 .../devicetree/bindings/input/adc-joystick.yaml          | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/input/adc-joystick.yaml b/Documentation/devicetree/bindings/input/adc-joystick.yaml
index 2ee04e03bc22..4f49a1a5772e 100644
--- a/Documentation/devicetree/bindings/input/adc-joystick.yaml
+++ b/Documentation/devicetree/bindings/input/adc-joystick.yaml
@@ -12,12 +12,19 @@ maintainers:
 
 description: >
   Bindings for joystick devices connected to ADC controllers supporting
-  the Industrial I/O subsystem.
+  the Industrial I/O subsystem. Supports both polled devices where no
+  iio trigger is available and non-polled devices which are triggered
+  by iio.
 
 properties:
   compatible:
     const: adc-joystick
 
+  adc-joystick,polled:
+    type: boolean
+    description:
+      If the device does not support triggered buffers and needs to be polled.
+
   io-channels:
     minItems: 1
     maxItems: 1024
-- 
2.25.1

