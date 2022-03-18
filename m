Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A00E44DD919
	for <lists+linux-input@lfdr.de>; Fri, 18 Mar 2022 12:40:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234469AbiCRLl2 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 18 Mar 2022 07:41:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231450AbiCRLl1 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 18 Mar 2022 07:41:27 -0400
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 758581AFE81
        for <linux-input@vger.kernel.org>; Fri, 18 Mar 2022 04:40:09 -0700 (PDT)
Received: by mail-pf1-x434.google.com with SMTP id d19so9192288pfv.7
        for <linux-input@vger.kernel.org>; Fri, 18 Mar 2022 04:40:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rX7E2IR+oA+B91josSb883WCzzH21m/aEa4MxN7Ff4g=;
        b=O6QsUGYDVCohpEZcrpiV/D0dmI87zC+atxsP5J8GYDfwiY4gsZxz4PjkC5k8Lq5A4A
         p0xL8p8d3OuifDtkhDLKG9/UhQMVCHq6i34rsamVWTHfnDBab8tBtOVOTowgFe1YPUPq
         ss6C5jCTvx364CZulS3Xd5yWf3OH9hSr8qC6RPw86iyzWzbPMIrYvV2QzxwJE6nDotbb
         t7Xipce6/z+WIFllKyPvgiTEkdwpTZDFfwF42A4SEy9tvN2arGeXpXa5dIV57eEyrdZp
         qLAYRIffS5ARZEAVH0As4Z+M4qRkEu+QklOOQE2lEmmseT4KA+fP4TrskplqlmvW9dn4
         +Bbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rX7E2IR+oA+B91josSb883WCzzH21m/aEa4MxN7Ff4g=;
        b=PAHLZSnA5+yOcDyhT0Hnk/MEKjShh/ErJM0HTMJac/f1ixPh+euKwEOyxanlzSIT3U
         4XMNmZJFU+c/jEy5ImOO+Jh0Xi56Gzm8YdVB1WSRJTwkKSHBAtjnJ/24hsPpzvYg5iK+
         AgS8WVUxWRx8qIQ+UDAsjRuGgNuthBIu+W2tnSpnWP+d9/HOds1RWtawDMHL0OP33F1e
         RXiS+Uo4AiHdyI+7RyeIrLS04DuBhMqvQzUq5SJ5zf6XeAHAkSgPuBvgRn8HWQ30+JjZ
         Ijza3ZXIeZGx3A54Li7kong6BPK9f34krUjHf3T8rmitAejkVR83ejxl2hx3O50MD9sx
         SqWw==
X-Gm-Message-State: AOAM5328F+wTW0xURZXElukVonwuBG5I/SDFhugcsW4ndkumAfmy/PIQ
        YoPlh6Byvr1yr7n1f8WwO/Lcatt5mtF3Ng==
X-Google-Smtp-Source: ABdhPJzkKSeK6THYS4qv+jkekwzrn+vjxxMAbumM6u+tKPlyRJc2xzJBOlU3iuPKtBu3YXGbYGgRwQ==
X-Received: by 2002:a63:303:0:b0:381:113f:c5d7 with SMTP id 3-20020a630303000000b00381113fc5d7mr7436408pgd.368.1647603608584;
        Fri, 18 Mar 2022 04:40:08 -0700 (PDT)
Received: from p14s.home.arpa (2403-5804-29--6a89-104a-5097-9947.ip6.aussiebb.net. [2403:5804:29:0:6a89:104a:5097:9947])
        by smtp.gmail.com with ESMTPSA id u5-20020a056a00158500b004f745148736sm10180259pfk.179.2022.03.18.04.40.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Mar 2022 04:40:08 -0700 (PDT)
From:   Matthew Haughton <snafu109@gmail.com>
To:     linux-input@vger.kernel.org, dmitry.torokhov@gmail.com
Cc:     Matthew Haughton <snafu109@gmail.com>
Subject: [PATCH] Input: synaptics - enable InterTouch on ThinkPad T14/P14s Gen 1 AMD
Date:   Fri, 18 Mar 2022 22:39:49 +1100
Message-Id: <20220318113949.32722-1-snafu109@gmail.com>
X-Mailer: git-send-email 2.34.1
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

Confirmed LEN2064 on my P14s works with psmouse.synaptics_intertouch=1
By all accounts T14 and P14s are the same hardware which only differ by
model identifier.

Signed-off-by: Matthew Haughton <snafu109@gmail.com>
---
 drivers/input/mouse/synaptics.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/input/mouse/synaptics.c b/drivers/input/mouse/synaptics.c
index ffad14280..434d48ae4 100644
--- a/drivers/input/mouse/synaptics.c
+++ b/drivers/input/mouse/synaptics.c
@@ -186,6 +186,7 @@ static const char * const smbus_pnp_ids[] = {
 	"LEN2044", /* L470  */
 	"LEN2054", /* E480 */
 	"LEN2055", /* E580 */
+	"LEN2064", /* T14 Gen 1 AMD / P14s Gen 1 AMD */
 	"LEN2068", /* T14 Gen 1 */
 	"SYN3052", /* HP EliteBook 840 G4 */
 	"SYN3221", /* HP 15-ay000 */
-- 
2.34.1

