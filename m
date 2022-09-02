Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ABC8C5AAA23
	for <lists+linux-input@lfdr.de>; Fri,  2 Sep 2022 10:33:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235137AbiIBIdy (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 2 Sep 2022 04:33:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235809AbiIBIcy (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 2 Sep 2022 04:32:54 -0400
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF392C22AB
        for <linux-input@vger.kernel.org>; Fri,  2 Sep 2022 01:32:49 -0700 (PDT)
Received: by mail-pl1-x633.google.com with SMTP id f24so1218360plr.1
        for <linux-input@vger.kernel.org>; Fri, 02 Sep 2022 01:32:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ecs-corp-partner-google-com.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=ADcRCN6HxvIz/AomINVN7gpsax0NelSRlaJK22KDq2w=;
        b=aAVBhBHfBjyk9XBShM5bw5PrkgJRcbYSV0mo1bswoEJVF83A9WqOUi8pixMrwURJXh
         tnxmBzDEO+JllxEaBtCk4vHG6fXnjxt/3rjcGF2LOAorAGX11Dz3EWzwnwGSTR/RP5i/
         wkI8JIP7HChFVHQ4nv1Aw8rMor+Wx9N4ZgVZRUBQSuS43a141wnmbFBChIk4N6nyELtO
         or/KsIb77t2OIlqhJbOoFz63e53eiCX2Rue3/YY7axt9TqRPYpHZnc0ysoSZd5sezHXp
         OTIhP+zwj/IV5MbPuu5c6cSumcekBPfCQoa78PuVs3S4rLfl5fBE6TKt1wJ3752lXcH9
         YDcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=ADcRCN6HxvIz/AomINVN7gpsax0NelSRlaJK22KDq2w=;
        b=oZMQczCd87ZKjGEFi0JKxg3nJSo/JL5l02cApotPOhQ4zIy23naU/CFNIMhd8vzekw
         i019iXOCC8cSu0sm21YBu354/PoMrGHUXOG7LYSZ+VjTRB7IhXpR9tVZo24VCCe8P5mK
         ICuXHB6eMhsIEuvDOL9R2m+NnIAHDi6003hT3gStbxv4Joqa8LvQuVCF+Sv21c8F4u2y
         lU56XUQBubVPxeuWsgK/VQk+9XVA6Y4RCrG2xNWi/npEVYukR6R17/eUYgwH3jXhnLaT
         kAgxG7ZceB58E273Bh9tequtEHUXioPzW4pBGobAIXV5ypCCSZn1oI7V0D4kEkutQBOb
         n62Q==
X-Gm-Message-State: ACgBeo0hpu2Z8mIehR3ng18Dx9faArefDdRdC/NEWeaQAexG9DFaZpiw
        U9aD8X2gLr3o3pTFRlucIn9bOw==
X-Google-Smtp-Source: AA6agR5retUNQRmOiPo/EqbD/vxlo05gsPIOvaXIujVYseKYa/IT1g5UnjlU2I7Ps/JbH+NQNCPCtw==
X-Received: by 2002:a17:90b:1803:b0:1fb:45e2:5d85 with SMTP id lw3-20020a17090b180300b001fb45e25d85mr3681298pjb.163.1662107568149;
        Fri, 02 Sep 2022 01:32:48 -0700 (PDT)
Received: from localhost.localdomain ([103.150.184.130])
        by smtp.gmail.com with ESMTPSA id y5-20020aa79ae5000000b00537aa0fbb57sm1071241pfp.51.2022.09.02.01.32.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Sep 2022 01:32:47 -0700 (PDT)
From:   Yunlong Jia <yunlong.jia@ecs.corp-partner.google.com>
To:     LKML <linux-kernel@vger.kernel.org>
Cc:     Bob Moragues <moragues@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        Henry Sun <henrysun@google.com>,
        Yunlong Jia <yunlong.jia@ecs.corp-partner.google.com>,
        David Heidelberg <david@ixit.cz>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-input@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: input: touchscreen: elants_i2c: Add eth3915n touchscreen chip
Date:   Fri,  2 Sep 2022 08:32:35 +0000
Message-Id: <20220902082843.1.I7da6ff6c8e8700624d61e51ff7d09e151bd83dcb@changeid>
X-Mailer: git-send-email 2.17.1
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add an elan touch screen chip eth3915n.
This chip requires more delay time than the eth3500.

Signed-off-by: Yunlong Jia <yunlong.jia@ecs.corp-partner.google.com>
---

 .../devicetree/bindings/input/touchscreen/elan,elants_i2c.yaml   | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/input/touchscreen/elan,elants_i2c.yaml b/Documentation/devicetree/bindings/input/touchscreen/elan,elants_i2c.yaml
index a9b53c2e6f0ab..d28625372f5ac 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/elan,elants_i2c.yaml
+++ b/Documentation/devicetree/bindings/input/touchscreen/elan,elants_i2c.yaml
@@ -17,6 +17,7 @@ properties:
     enum:
       - elan,ektf3624
       - elan,ekth3500
+      - elan,ekth3915
 
   reg:
     maxItems: 1
-- 
2.17.1

