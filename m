Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D0D315F7D82
	for <lists+linux-input@lfdr.de>; Fri,  7 Oct 2022 20:47:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229538AbiJGSrW (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 7 Oct 2022 14:47:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229637AbiJGSrU (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 7 Oct 2022 14:47:20 -0400
Received: from mail-oa1-x33.google.com (mail-oa1-x33.google.com [IPv6:2001:4860:4864:20::33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 873E03BC7B;
        Fri,  7 Oct 2022 11:47:19 -0700 (PDT)
Received: by mail-oa1-x33.google.com with SMTP id 586e51a60fabf-132af5e5543so6500514fac.8;
        Fri, 07 Oct 2022 11:47:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SxMEG2D0fKX0Y4XJnSEHp+xrRPhYinjlTROVSX95OxM=;
        b=ceRhQVwpYE/P69MAASA+4Yq1S9TFcXFm1yJxSDvjBTFN66UgQKoYqFxBHU8zH3TY+N
         gD6qkiRNHwqDxbjEAR24mxy63R9A5KGtUaKYCg2oseJwzn8HgNLreY+BrYrthO1uhAM7
         vwKt/6rfRq2HhcSSItObp4ZPUR+dJDeYiwrWtF85LyioC+17NBtAxzRPuQVATCl+awvp
         N6hfbggX0LDeaoPQ5XLM2s7QelpTarQ6Y3bxbGf/JMqlfkh3XvPFYo7NE68aO0aHntBT
         86mNu6+csHXckeGwVJPpZGaf6m5M+xhQArG7BZm4ZKr+IXVRLTvwRBQI5iFner/U+3ZK
         5/sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SxMEG2D0fKX0Y4XJnSEHp+xrRPhYinjlTROVSX95OxM=;
        b=2jExUBE9WQm+H8bT/f1lKOCT0v3+nH9KrnxjRfHY7M3Tj++ytTe1bNf+QFZ/2iqctR
         vQufg+pPO2OCmjkejqMdyeDpRlIIMlJcTbbfAAk97kk8n0YADsw92+Kiv9crQHtwbTKT
         xq/cJ0Hf7HXrFUiEzvTRCvYRc+rkAjplRqxoJj0SopLKv4cDzxn2+j+KEBCnhgHzwdo8
         rEy3QUyQJw28XBnNeHR5uJUWZkUIps+LHRmt8X0k165XSByH296llxKgOegYiLzkrvNz
         tMobXHKIemOrbVIU2tEt/MLqyyj4M/rhZbx4ZDQSdJz6Jy06Se6ZezKKdZTrsRPBV7Wd
         YhBg==
X-Gm-Message-State: ACrzQf2LVvc+Ru7ZlaO6W7T/K6vJ0HFFOnRxHZJLj72mS2Bc1SZWOWX/
        tP8bN3BuNRRML6J/NYHcEM0qmUA1Ldo=
X-Google-Smtp-Source: AMsMyM7KQHp948ALXKIomKCRB4fDMkYczaiEOohqhT1qfOtrmeWWOK1k8cH+pujIJ4IcR7rMA1jqCQ==
X-Received: by 2002:a05:6870:d20a:b0:132:7f14:2474 with SMTP id g10-20020a056870d20a00b001327f142474mr8677872oac.10.1665168438549;
        Fri, 07 Oct 2022 11:47:18 -0700 (PDT)
Received: from wintermute.localdomain ([76.244.6.13])
        by smtp.gmail.com with ESMTPSA id n6-20020a4ad626000000b00425806a20f5sm1267861oon.3.2022.10.07.11.47.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Oct 2022 11:47:17 -0700 (PDT)
From:   Chris Morgan <macroalpha82@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     devicetree@vger.kernel.org, jeff@labundy.com,
        neil.armstrong@linaro.org, arnd@arndb.de, robert.jarzmik@free.fr,
        Jonathan.Cameron@huawei.com, christianshewitt@gmail.com,
        stano.jakubek@gmail.com, rydberg@bitmath.org,
        krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org,
        dmitry.torokhov@gmail.com, Chris Morgan <macromorgan@hotmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 1/3] dt-bindings: vendor-prefixes: add Hynitron vendor prefix
Date:   Fri,  7 Oct 2022 13:47:08 -0500
Message-Id: <20221007184710.6395-2-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221007184710.6395-1-macroalpha82@gmail.com>
References: <20221007184710.6395-1-macroalpha82@gmail.com>
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
index 2f0151e9f6be..4f36032eab02 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -563,6 +563,8 @@ patternProperties:
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

