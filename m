Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BE3A670A57E
	for <lists+linux-input@lfdr.de>; Sat, 20 May 2023 07:07:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230175AbjETFHu (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 20 May 2023 01:07:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229627AbjETFHt (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 20 May 2023 01:07:49 -0400
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06FFCE42
        for <linux-input@vger.kernel.org>; Fri, 19 May 2023 22:07:44 -0700 (PDT)
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-530638a60e1so3718859a12.2
        for <linux-input@vger.kernel.org>; Fri, 19 May 2023 22:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=huaqin-corp-partner-google-com.20221208.gappssmtp.com; s=20221208; t=1684559263; x=1687151263;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zr3+BQp3+2PjwyI+d5nRt/2xB87GampH66jS3gUBxOw=;
        b=tQq8QqCjFnJXUkndLkdBDdM88GCy5IZKOOlXkaOaIr8MBB9T1cEo0bNgo+YhRpvxId
         GKjfaaAnS7PS9YjGBCtDsgIfZDYvs8t2CujkKCKQADpGZutumj3mTZzdyXUD0sUq6ZPa
         I4PWQ8N71cgI97NLd/QVANZOuv53UJFEZuH8WYSbFWvBEyAgsltLNPEY1ErUm0CQ7Irz
         GGk6HANnSbbVhpLPFwuw1cAn/h2+YBgp41soSIulUdFzLysHKNdIuyjnm+9CKhiBzQXX
         BsqQWQzf19VmVWqgzI/A9t6P2+WR3SxZvdferiiLZ0cC8gcu4LP5wE+ujmEfAUKvLtGz
         pUkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684559263; x=1687151263;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zr3+BQp3+2PjwyI+d5nRt/2xB87GampH66jS3gUBxOw=;
        b=F2tBCg9/MQKN0qJem1Ww05Ysk3cirI+lFM1mevhxkdaKeFLBuQlcKTjBn/d2zHEiTQ
         bxIMtVtI7LpSvTZQt3RBjcfN6oZahkznMH00sIbmeMGbsscBDKAMI9JTSni3zeLq+/db
         uFJ0Io4EvS18B+Bxlr7WhXJEQBvwqfRotS/8S53vWl/FSRfpS0HhhVS6diOBMyiEGL17
         kB0SWl4pPZXEs1COdj+fc59pvhx9zfEer/DDrIcgZh0+oBlJi4pA0f4dk9Gh3lUjezbO
         5yruB28NShkKdaxf6LhPq5TiXqrft7xB+20DrJmdQxs9fdaUdTZR9dqxGbf1wDtnaGSa
         TqIA==
X-Gm-Message-State: AC+VfDzOMnZjsC+3j+YVYn2ORD+OWLMmBlQaBQf4yc4lmOBO1Lt+ocNt
        P1g02pShUVGxHmWZa8jd9QjJ3A==
X-Google-Smtp-Source: ACHHUZ7l/uiLFw7b+1H9hfC4+7wi76DzEWM6L9/k2ZR6jjCTwESstBl79wynT9r2LhOfVl+959hYEg==
X-Received: by 2002:a17:902:db03:b0:1ae:6135:a050 with SMTP id m3-20020a170902db0300b001ae6135a050mr6091997plx.19.1684559263554;
        Fri, 19 May 2023 22:07:43 -0700 (PDT)
Received: from yc.huaqin.com ([101.78.151.214])
        by smtp.gmail.com with ESMTPSA id jf9-20020a170903268900b0019e60c645b1sm476725plb.305.2023.05.19.22.07.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 May 2023 22:07:43 -0700 (PDT)
From:   Cong Yang <yangcong5@huaqin.corp-partner.google.com>
To:     dianders@chromium.org
Cc:     benjamin.tissoires@redhat.com, devicetree@vger.kernel.org,
        dmitry.torokhov@gmail.com, hsinyi@google.com, jikos@kernel.org,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        mka@chromium.org, yangcong5@huaqin.corp-partner.google.com
Subject: [v2 2/2] dt-bindings: input: touchscreen: Add ilitek 9882T touchscreen chip
Date:   Sat, 20 May 2023 13:06:49 +0800
Message-Id: <20230520050649.2494497-3-yangcong5@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230520050649.2494497-1-yangcong5@huaqin.corp-partner.google.com>
References: <CAD=FV=VYfPSwar2AXBxB3vX0dV1kjQ5bZMxsEBFhUnMNRXbBCw@mail.gmail.com>
 <20230520050649.2494497-1-yangcong5@huaqin.corp-partner.google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add an ilitek touch screen chip ili9882t.

Signed-off-by: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
---
 .../devicetree/bindings/input/elan,ekth6915.yaml         | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/input/elan,ekth6915.yaml b/Documentation/devicetree/bindings/input/elan,ekth6915.yaml
index 05e6f2df604c..29eb63b2360b 100644
--- a/Documentation/devicetree/bindings/input/elan,ekth6915.yaml
+++ b/Documentation/devicetree/bindings/input/elan,ekth6915.yaml
@@ -15,11 +15,16 @@ description:
 
 properties:
   compatible:
-    items:
+    oneOf:
       - const: elan,ekth6915
+      - items:
+          - const: elan,ekth6915
+          - const: ilitek,ili9882t
 
   reg:
-    const: 0x10
+    enum:
+      - 0x10
+      - 0x41
 
   interrupts:
     maxItems: 1
-- 
2.25.1

