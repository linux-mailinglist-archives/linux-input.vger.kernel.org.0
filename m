Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E6634549F6F
	for <lists+linux-input@lfdr.de>; Mon, 13 Jun 2022 22:35:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232026AbiFMUfH (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 13 Jun 2022 16:35:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235793AbiFMUdd (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 13 Jun 2022 16:33:33 -0400
Received: from mail-oa1-x33.google.com (mail-oa1-x33.google.com [IPv6:2001:4860:4864:20::33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B74D309;
        Mon, 13 Jun 2022 12:24:04 -0700 (PDT)
Received: by mail-oa1-x33.google.com with SMTP id 586e51a60fabf-10113b4c2b5so8031212fac.6;
        Mon, 13 Jun 2022 12:24:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iQEw6C6W4ynHjM4NmULFrolW4tl3sFX7qhxY2QtQmIU=;
        b=Su12xoM+wu1upN9O8S+DxcF3rtZ7zlz6Q/Mrswdt+6FljEOzozF+3rMC1FFtY1Pzkh
         TCAsz/l+2LgeUnqUAbC35CczyNiF9HhFvV0n+8UoPBNelB26Kix5knJlf9YlxsmprV61
         3Y2bKUl3xhTwNKZlgZ474+qQDOZDkLD5x/YXAqBc1wDrE3eF63jRay/59sSWdbSoHl5K
         6KxXDkbHBF/QPN8aEgC3xY5FMgENjMy8FjDJgD3XdWGfZtZV1B9/W9XPdbAaKyIgoWI8
         KvsG7hbtdoPLiHFe0s1yi8LwFqrPeS4wU2vCU9SMps+bUF9tMrLke3u03gfcNGF9dy/I
         ZB5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iQEw6C6W4ynHjM4NmULFrolW4tl3sFX7qhxY2QtQmIU=;
        b=2eUdpBcwXg+Ec0e4d5kLPDKdaY3e7kn92/dIqTWe+hWBjQ12ojyKVtoVpMg9lCeUsp
         O8Xn6Z9DA2WHk9aN+61hfFOdxB0By8xQjAKumS5lDYaBUAWFh+oLny2lu2IpmO+/U05l
         qn3zvr+B1WI3sflBrkTQtbu/MEtv4w6s17/Rar51zzdL+AfKlbchECwlNf8SREgTS4Xy
         K79tb6gskDRDgZiSGAOFPaeaQKTM8JasJjpgaZv9zukWFeqFoWj3mWcfYlbYQ0vq3zvg
         rKDgDo6ss40rVt38+hryQErCMYtJ8iiXBUGeBZAQJZ8vKkILewHVgpqc8MJMoDR3MuGP
         zJjg==
X-Gm-Message-State: AJIora/R3TH7z2dU/1AVtGAn+FZbyUymkUvZTOP3V6gaLZUHcQ8+efY6
        ckc+r3g8jxQlVaCtuypZcU/AQFRmj50=
X-Google-Smtp-Source: AGRyM1tUx+Czf2n4Jhb7UJJPz8dpBDTrx0d35jMNqUnQUXMiZWv/yw1JFl/7k0qG7jEHWAXyPQ3iSA==
X-Received: by 2002:a05:6870:589a:b0:f2:fafb:3268 with SMTP id be26-20020a056870589a00b000f2fafb3268mr203143oab.68.1655148243257;
        Mon, 13 Jun 2022 12:24:03 -0700 (PDT)
Received: from wintermute.localdomain (cpe-76-183-134-35.tx.res.rr.com. [76.183.134.35])
        by smtp.gmail.com with ESMTPSA id bf34-20020a056808192200b0032ba1b363d2sm3637274oib.55.2022.06.13.12.24.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jun 2022 12:24:02 -0700 (PDT)
From:   Chris Morgan <macroalpha82@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     devicetree@vger.kernel.org, contact@artur-rojek.eu,
        maccraft123mc@gmail.com, heiko@sntech.de,
        krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org,
        dmitry.torokhov@gmail.com, Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH v3 1/3] dt-bindings: adc-joystick: add adc-joystick,no-hardware-trigger
Date:   Mon, 13 Jun 2022 14:23:51 -0500
Message-Id: <20220613192353.696-2-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220613192353.696-1-macroalpha82@gmail.com>
References: <20220613192353.696-1-macroalpha82@gmail.com>
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

Add documentation for adc-joystick,no-hardware-trigger. New device-tree
properties have been added.

- adc-joystick,no-hardware-trigger: A boolean value noting the joystick
				    device should be polled rather than
				    use a triggered buffer.

Signed-off-by: Maya Matuszczyk <maccraft123mc@gmail.com>
Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 .../devicetree/bindings/input/adc-joystick.yaml          | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/input/adc-joystick.yaml b/Documentation/devicetree/bindings/input/adc-joystick.yaml
index 2ee04e03bc22..627cc6c40191 100644
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
 
+  adc-joystick,no-hardware-trigger:
+    type: boolean
+    description:
+      If the device does not support triggered buffers and needs to be polled.
+
   io-channels:
     minItems: 1
     maxItems: 1024
-- 
2.25.1

