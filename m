Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9DF42569C40
	for <lists+linux-input@lfdr.de>; Thu,  7 Jul 2022 09:54:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235198AbiGGHwp (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 7 Jul 2022 03:52:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235188AbiGGHwm (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 7 Jul 2022 03:52:42 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD72F33367
        for <linux-input@vger.kernel.org>; Thu,  7 Jul 2022 00:52:40 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id q9so25092939wrd.8
        for <linux-input@vger.kernel.org>; Thu, 07 Jul 2022 00:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=70xtc+uGcQwXm4fuaD/+Dh6Vj8lV/MgZmktrLD3peVk=;
        b=q+ABpgrDDFIRVVXBzf1fEBgDOZzkcnovjTczwvCHoQEx9EgtVFK1S3cP2uNewqCcTu
         p46x/EAuzL8Mq8CqKyQKnXaxdbv3t5xEZRPHIX+0v+6H8mmMHaFBVqG/LkKwzDxuMvnC
         hBFFYWRW6D7mzE+7JF28l0mzOAPa6pzYpJundz2VwprhE2P8uOzoL2H6ZCYKZxy9MJ//
         BeAQIkrUCwLtgQ8mgVS0wZ1tqgWgPyRDmcXgxyV01Cd757TNNiA/UbgAwSOyR+wXyAvU
         Qqv9uxflEEFTnsmPUuz5NOh649OaU3wk0Y4VIjLPFzrTqwduxHStzOCezNJdJWkRcmOQ
         SUdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=70xtc+uGcQwXm4fuaD/+Dh6Vj8lV/MgZmktrLD3peVk=;
        b=SsnHq/syOEQwmDfNOtcXMmA4LtweXRsXzFTHwFTEhgIHUpHcVbf20sEGoS4gdEihEj
         O3shY9TsdljINkFIALgglpkMGr/iItCYMI7hkXguOfSol99nPxp1Jp6fvCViEXUP0TdG
         CnEC0KJ783tNiODA5glFfpSiOdePKLM35ULMeJyKV66edWf50woiuQhnR0BdBghwpA18
         Hbg83AxIpGkPea5i2+zAlklWUEC/BmzFQtmK+NHOW0ETtQembm22sQdJcblwrqjX25zn
         5JXPHPYSsfpud2TVW+lsaffC6AL50+hzjvNzQqGbOf04I0qTQSYx7T95WdvxF+7TpZwY
         DsYg==
X-Gm-Message-State: AJIora/uoR4jl/oSIB2AR5VdMxjQsBRlHtoaaTot+oBk2J/TjyYZ9/hG
        sOrBda9Pg/j8OpcaY5hhtCHZWw==
X-Google-Smtp-Source: AGRyM1sZKaUua+SZ//O7YATU5JaHhkvcrG36JPkNNJpcew0H+3gBJSHXOrAH+5Ri9Sdz2ccf4TInhA==
X-Received: by 2002:adf:f34c:0:b0:21d:6705:87dd with SMTP id e12-20020adff34c000000b0021d670587ddmr20717172wrp.430.1657180359439;
        Thu, 07 Jul 2022 00:52:39 -0700 (PDT)
Received: from groot.home ([2a01:cb19:85e6:1900:334b:5931:88c6:bbd2])
        by smtp.gmail.com with ESMTPSA id m16-20020adfe950000000b0021d70a871cbsm6972089wrn.32.2022.07.07.00.52.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Jul 2022 00:52:39 -0700 (PDT)
From:   Mattijs Korpershoek <mkorpershoek@baylibre.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Fabien Parent <parent.f@gmail.com>,
        linux-input@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Mattijs Korpershoek <mkorpershoek@baylibre.com>
Subject: [RESEND PATCH v3 0/2] Input: mt6779-keypad - fix hw code logic and row/col selection
Date:   Thu,  7 Jul 2022 09:52:34 +0200
Message-Id: <20220707075236.126631-1-mkorpershoek@baylibre.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Input: mt6779-keypad - fix hw code logic and row/col selection

This serie is the first follow-up on the mt6779-keypad in
order to enable it on the MediaTek mt8183-pumpkin board.

To fully enable it on mt8183-pumpkin, we still need:
* double key support
* dts changes

To ease up reviewing, I preferred sending this first.

The first patch fixes a logic bug based on the (non-public) datasheet
I have.
The second patch configures the keypad correctly in order to not
report bogus values.

Thank you,
Mattijs

Changes in v3:
* reworked row/column logic as discussed in [1]
* Dropped Angelo's review since patch 1 changed

Changes in v2:
* Simplified SEL_COL/ROW_MASK macros as suggested by Dmitry
* Added Angelo's Reviewed-by on patch 1

Mattijs Korpershoek (2):
  Input: mt6779-keypad - match hardware matrix organization
  Input: mt6779-keypad - implement row/column selection

 drivers/input/keyboard/mt6779-keypad.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

[1] https://lore.kernel.org/r/YpMDZORAlHmg/x/0@google.com

base-commit: c4bcc1b99b8b8acdfe673e4701a9c2acb6b8b2fb
-- 
2.34.1

