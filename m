Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5C465566B37
	for <lists+linux-input@lfdr.de>; Tue,  5 Jul 2022 14:05:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233375AbiGEMFR (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 5 Jul 2022 08:05:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233751AbiGEMER (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 5 Jul 2022 08:04:17 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4290186F3
        for <linux-input@vger.kernel.org>; Tue,  5 Jul 2022 05:04:04 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id bx13so14239183ljb.1
        for <linux-input@vger.kernel.org>; Tue, 05 Jul 2022 05:04:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SKrrlYio3nbOhBwUjGXrXLl1qRaxBrsfKwRApIXmEYA=;
        b=K8YQ23Rylb1x1QKt7AAmePbuiVxRyCHCejs55T8ZL5xKJrl3RkaVfQnfBI44Sn3rQ5
         HdBryzd2JLl9O+Fyclq/O1Qk6iwMoLwBVhzTusTZ2gPxk4PXP1SvHG06xNlbZXUlYded
         GIuwXPp2FEvc6+MRt0txApq30EkG8g0JJTVjEoxXJA2Iqin1E/5WmLffYlk12OREqfLM
         o4GcJJyfK8zrGSVbJ1V7EJjCXL8xg+veB4SWGAWyDdiK3Ws1BPVzTXJuP1+koPlZlblT
         beS16XeNojQaYi8pN0P1EwlwUBJGae0bnMHiqQFihYpJyNBGeIS3C+j7kZlNNwrvBosS
         nIDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SKrrlYio3nbOhBwUjGXrXLl1qRaxBrsfKwRApIXmEYA=;
        b=R0xdyY7AN6Bf0UBA7Gp/wL8lXNN6tZy0XVZp8RSlYNPj5wCc3drKCsL0AjekAy1Jp6
         dRYvexOMHYyZX8UXLPnDns/opc62GH4CV/4mjDYyTX2uwsRpAWi8w+K5awwBx9Ge27Qr
         B8tcoWmor7Qym+UQaEX9kEaCc7+r77XVxgYh6qr768DBZdUwZhzi76i25hKY9r6PJqCg
         Jz1HcUdMA6BtDi6a+KEHuzEqHahHq/96dy9KY7xsDm3TBU2fRH/CHnNqPhZCIWKcjYhu
         YG2gnwM8Ofwj+auozPoPo8+M+pgoxDyR7451BuFFqs3slyzNNwQNtD/mblv+b23/oEgs
         FyIw==
X-Gm-Message-State: AJIora+i8sYr64ofFokyefP4519uhJ0VvaW6YX8x+z+r5vL/l273IW8P
        erLRP76q0+UCZZkAz3i6G9ngpw==
X-Google-Smtp-Source: AGRyM1vv5rjw2OlOSx1JvR0oEE9A3qm/K4mVXdNVA3ZRjKjkZ/YHSCV55kfEk2f8/LXPfsK5ZH2vgg==
X-Received: by 2002:a05:651c:1798:b0:25d:3043:58e0 with SMTP id bn24-20020a05651c179800b0025d304358e0mr2581367ljb.310.1657022641768;
        Tue, 05 Jul 2022 05:04:01 -0700 (PDT)
Received: from krzk-bin.home ([84.20.121.239])
        by smtp.gmail.com with ESMTPSA id n13-20020a2e82cd000000b0025a885a135csm5547082ljh.119.2022.07.05.05.04.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jul 2022 05:04:00 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [RESEND PATCH v3 0/3] dt-bindings: input: gpio-keys: apply via DT tree
Date:   Tue,  5 Jul 2022 14:03:53 +0200
Message-Id: <20220705120356.94876-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Rob,

Can you apply these directly? You already reviewed them, but I dropped
the tag so you will see them in Patchwork. It seems these won't go in
through input [1].

[1] https://lore.kernel.org/all/c2c1cf0c-9462-9ba5-a297-70d13a063de1@linaro.org/

Best regards,
Krzysztof


Krzysztof Kozlowski (3):
  dt-bindings: input: gpio-keys: enforce node names to match all
    properties
  dt-bindings: input: gpio-keys: reference input.yaml and document
    properties
  dt-bindings: input: gpio-keys: accept also interrupt-extended

 .../devicetree/bindings/input/gpio-keys.yaml  | 159 +++++++++---------
 1 file changed, 82 insertions(+), 77 deletions(-)

-- 
2.34.1

