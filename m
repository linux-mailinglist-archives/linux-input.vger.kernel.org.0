Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BF7485FA131
	for <lists+linux-input@lfdr.de>; Mon, 10 Oct 2022 17:35:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229820AbiJJPfe (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 10 Oct 2022 11:35:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229769AbiJJPfc (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 10 Oct 2022 11:35:32 -0400
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com [IPv6:2607:f8b0:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A15A76CF7B;
        Mon, 10 Oct 2022 08:35:27 -0700 (PDT)
Received: by mail-oi1-x22c.google.com with SMTP id m81so13081394oia.1;
        Mon, 10 Oct 2022 08:35:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SxMEG2D0fKX0Y4XJnSEHp+xrRPhYinjlTROVSX95OxM=;
        b=D/Kwn2AKw/sQNhi0v97MQ2dfAKznir/2V6pNNHpjOO6pX8QmPuI+JuyiHY96iSfE9A
         F5p5K7iMvoGz2AOkiioSY8J6S/Cs3O8pQjnZvgWl/0wvdQ7qqxMQkolPOQK6TvoJ+gdO
         Y/3Tz6tpN3MXZ9Ryf3VjnYiuCsj7Mge8sQA75Z+OQ2qbrnGAepQQlZyK/R/G7E0tk5U8
         2nOEpEYu3vm578x04VqUfHcLdGY9X4tFgAJ6BHCAu+qrOfXf4jHj/XTRsGa6bWlvyAa1
         jFv0QSKCnfhykDcNdV1YYINhfmrkhCZ+lkzDVeD0wkrPUIXJThcadD3DBNF8h5VZO8Q5
         49Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SxMEG2D0fKX0Y4XJnSEHp+xrRPhYinjlTROVSX95OxM=;
        b=DYKnKQghzL/82wPz5yXPbnPDWEDELN5KcCFCm58ASMJOWnrJHPFRFkGu8a3vy1cFva
         LVc9nx1Htx72dbQLGCTlyioHn4XO+6cGJXA4QVaO5MWHzY1dzRyvSA8oo4+a5WP0hr2F
         KNuoql0MNAVwqXiV3L898tff1X/Qvf7DrDT9c+xHvXN890l9NSbfzRdaXaJx084rQ1m7
         UCW07FRrevq88dJxDCYf4V4R+mxSBS0dTBPDMQqCL0I4RVwxEsbhRiZJW/mhCNCpw1yQ
         tUtTIvlBJU1Pwn2+ulghVVDdZKe2iY0p4FFkzqg+EmsJ3rzlN4/agf6dUSda/MHLVO7V
         bSBg==
X-Gm-Message-State: ACrzQf3tdVw/WqJ6xwCVYWBs6aT/r7FZdQWy39Pul2U5RLvml07EMPMg
        DXH+tlpgiF//mU2tcNAoEt5qDbFWD7s=
X-Google-Smtp-Source: AMsMyM4MUC82HD9IufWayBrey4MQsqeoxj3BquWnUzdr6UQYZwYFcsd9rA5oj0WMsNi0ZEvOBnG1ug==
X-Received: by 2002:a05:6808:17a6:b0:350:92a3:1547 with SMTP id bg38-20020a05680817a600b0035092a31547mr9432651oib.177.1665416126639;
        Mon, 10 Oct 2022 08:35:26 -0700 (PDT)
Received: from wintermute.localdomain (76-244-6-13.lightspeed.rcsntx.sbcglobal.net. [76.244.6.13])
        by smtp.gmail.com with ESMTPSA id a2-20020a056870d18200b0013125e6a60fsm5264309oac.58.2022.10.10.08.35.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Oct 2022 08:35:26 -0700 (PDT)
From:   Chris Morgan <macroalpha82@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     devicetree@vger.kernel.org, jeff@labundy.com,
        neil.armstrong@linaro.org, arnd@arndb.de, robert.jarzmik@free.fr,
        Jonathan.Cameron@huawei.com, christianshewitt@gmail.com,
        stano.jakubek@gmail.com, rydberg@bitmath.org,
        krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org,
        dmitry.torokhov@gmail.com, Chris Morgan <macromorgan@hotmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 1/3] dt-bindings: vendor-prefixes: add Hynitron vendor prefix
Date:   Mon, 10 Oct 2022 10:35:20 -0500
Message-Id: <20221010153522.17503-2-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221010153522.17503-1-macroalpha82@gmail.com>
References: <20221010153522.17503-1-macroalpha82@gmail.com>
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

