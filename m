Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 098BC53AE28
	for <lists+linux-input@lfdr.de>; Wed,  1 Jun 2022 22:50:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230013AbiFAUqa (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 1 Jun 2022 16:46:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229606AbiFAUo1 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 1 Jun 2022 16:44:27 -0400
Received: from mail-oa1-x32.google.com (mail-oa1-x32.google.com [IPv6:2001:4860:4864:20::32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A19F260CE2;
        Wed,  1 Jun 2022 13:29:35 -0700 (PDT)
Received: by mail-oa1-x32.google.com with SMTP id 586e51a60fabf-e656032735so4305776fac.0;
        Wed, 01 Jun 2022 13:29:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=c2gVDF8Gi6ZBDN7EWWtWy6JxYjUWjegDiiCN3IKGjD0=;
        b=d/v7A74aeA2RQcQ78lE6EEbkKb5PKlvcsVxqjShMRiKuz6c6KUEpmj+n9pl7mR7zhw
         ZDhLvxsllPWAT1eYekBujjWcudnFsyCmM5ujHO77Jp+Bs69ocF89732zcKYc6gK6qUr4
         gbrjCTiAM1QeK/JvC+I8cToDBJ7zenOoQkMdg8ecl8TFAkhqJY+i+wwdgU5Fuykbl7Ob
         TwFzjwl7bSvwo7O8SWrkmqSUXAv4P+cEkLt9oK58iKhSLhSqAN9ujjCqpy7jAt7ye5TQ
         i206maVH3E8TAhJV+N4HKu+1+SJipAcI82ty3cxFaPocLhmJ/+wEArFXQaXMECuIMy6v
         /jqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=c2gVDF8Gi6ZBDN7EWWtWy6JxYjUWjegDiiCN3IKGjD0=;
        b=Znmje8DzrsmR/Hp2HOxuO70B/2wZLQcLU80t1myeSghMFXa5UWzxgnjefg28jUXlvz
         VKtTQbjhAovN8IYiUP1wtPfd+3pHo0bJQFIRlg7iYHwJFuUBSSiXVdYp3PBohf7+AgGt
         Tj1T9teVFp1oyUsPcoJilTya6MjtcCchofNErwS9vimP6NZGubqW4YkPs3oy8Ca63E5G
         2NpLBmKU9To0hdUB6XcebSaHO3fosZJy8TTqKLHie6DGEhr0WkZhsvm+OrlBpMrW/w6L
         jc+WefZ2tVfwsOpiTj3zqDwgmfS8Rg1Be82kegMHh5lR9Pk7ZnQj3ZzmgQdISbtnq7U0
         pKBA==
X-Gm-Message-State: AOAM533Oby3fwqde5Y4exGTatOdEDu9QTV26XC4/KCkKOF5vCNovH4fS
        XPeyCcL8xgNjhqTEn6MJgzVW5JKAFZjR6w==
X-Google-Smtp-Source: ABdhPJxX1tpY7gD2134GbLhvleB3mOZN8X57E0YYPIfMWta7WSJZMFjNI/IDgBsuRURT8W2lCbpCVQ==
X-Received: by 2002:a05:6871:149:b0:f5:d454:d5ac with SMTP id z9-20020a056871014900b000f5d454d5acmr626744oab.76.1654111063134;
        Wed, 01 Jun 2022 12:17:43 -0700 (PDT)
Received: from wintermute.localdomain (cpe-76-183-134-35.tx.res.rr.com. [76.183.134.35])
        by smtp.gmail.com with ESMTPSA id w41-20020a056830412900b005b22a0d826csm1194512ott.1.2022.06.01.12.17.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jun 2022 12:17:42 -0700 (PDT)
From:   Chris Morgan <macroalpha82@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     devicetree@vger.kernel.org, contact@artur-rojek.eu,
        heiko@sntech.de, krzysztof.kozlowski+dt@linaro.org,
        robh+dt@kernel.org, dmitry.torokhov@gmail.com,
        maccraft123mc@gmail.com, Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH 1/3] dt-bindings: adc-joystick: bindings for adc-joystick-polled
Date:   Wed,  1 Jun 2022 14:17:28 -0500
Message-Id: <20220601191730.29721-2-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220601191730.29721-1-macroalpha82@gmail.com>
References: <20220601191730.29721-1-macroalpha82@gmail.com>
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

Add devicetree bindings for adc-joystick-polled.

Signed-off-by: Maya Matuszczyk <maccraft123mc@gmail.com>
Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 Documentation/devicetree/bindings/input/adc-joystick.yaml | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/input/adc-joystick.yaml b/Documentation/devicetree/bindings/input/adc-joystick.yaml
index 2ee04e03bc22..a9d2ac157322 100644
--- a/Documentation/devicetree/bindings/input/adc-joystick.yaml
+++ b/Documentation/devicetree/bindings/input/adc-joystick.yaml
@@ -12,11 +12,15 @@ maintainers:
 
 description: >
   Bindings for joystick devices connected to ADC controllers supporting
-  the Industrial I/O subsystem.
+  the Industrial I/O subsystem. Supports both polled devices where no
+  iio trigger is available and non-polled devices which are triggered
+  by iio.
 
 properties:
   compatible:
-    const: adc-joystick
+    enum:
+      - adc-joystick
+      - adc-joystick-polled
 
   io-channels:
     minItems: 1
-- 
2.25.1

