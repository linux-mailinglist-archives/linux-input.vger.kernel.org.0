Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DF00652B436
	for <lists+linux-input@lfdr.de>; Wed, 18 May 2022 10:06:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232898AbiERH7S (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 18 May 2022 03:59:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232889AbiERH7R (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 18 May 2022 03:59:17 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8B5A19C31
        for <linux-input@vger.kernel.org>; Wed, 18 May 2022 00:59:14 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id j25so1446196wrc.9
        for <linux-input@vger.kernel.org>; Wed, 18 May 2022 00:59:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cr9IuqWtBo466Tia/00HMR/yH/z82IE9n6W3kz9q2kk=;
        b=UZMxd0RalgViWp21dea+ESesYp/kKT9ZVbvLTtlj8Rht3kSJW6HqrcGEEXPwUskqqN
         rJyuGGQTE+C/W/SaM2lAyWsdtw8rdtoRoWTvf2Q6rvvz9Z0XEic9YEbbFpo2sj9d53cF
         nyXSs5HotYKKP5nfWw77fWODsom/CNHECnsOPHeDKNQaprdx2OgwWjoX3OJsRNpjO50h
         Bxjy/4xeTibxRcpPJA2DB5TIorlWQwBuiIqcSUKrbQRSCN42JTDC4l6i4UrP4SZd+S2y
         jx8fYqUROIObvSLP7IFrCIghf7bjwRsDEf8MChj5bepSOg7sKtkBZ0kDSeS5mfq6yLBM
         giJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cr9IuqWtBo466Tia/00HMR/yH/z82IE9n6W3kz9q2kk=;
        b=iWj/A+cq4m/CvCc+q4ahLtAHKZXKKuHGCMB1g4jmaymqI5CIX6VmJ2J9SPUwB8acTG
         HKpxrFISLPDNUOgeltpfzy87aY/OnUSxAM8nPKOnkVWL7nVBvqoJf7eY1So/fL44vOVc
         ICMFZFQGbUPKNhB7uM1zjvUvhuUou+NLi9UdVpcXrJ4U8UKLvSLLZlMX/EEV6EjtV5Ql
         yxmxxj/CkkBMhR6DgeKYgulA/tHTgGOPiYM068ppmSnWNP3ORSnxmzQToZnKyvPln5zs
         dvd5jD/5zoMgQWqLPrv6XXVMPGoIcAl8XMyk6/xHq9QNGXdcnC7M2s6DcUW4gzfxBvmM
         +k5g==
X-Gm-Message-State: AOAM531OeoAfluUAVTB/Lu06JtzIGEO9WAu8dkAFNqKTeKYfOEt5FRFq
        WOU37lqtSSvKhcSj/bJkJWwLow==
X-Google-Smtp-Source: ABdhPJzVX7UQ3EXyOePlliPc9lSitJsKhoncu56QgpwvrEr4emm+cTnz8pUVLNqTQZB6AhsP9jKuug==
X-Received: by 2002:a05:6000:715:b0:20c:5a15:9409 with SMTP id bs21-20020a056000071500b0020c5a159409mr22138319wrb.146.1652860753188;
        Wed, 18 May 2022 00:59:13 -0700 (PDT)
Received: from groot.home ([2a01:cb19:85e6:1900:bda6:8356:4db1:4539])
        by smtp.gmail.com with ESMTPSA id ay1-20020a05600c1e0100b0039706782e06sm1041300wmb.33.2022.05.18.00.59.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 May 2022 00:59:12 -0700 (PDT)
From:   Mattijs Korpershoek <mkorpershoek@baylibre.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Fabien Parent <fparent@baylibre.com>,
        linux-input@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Mattijs Korpershoek <mkorpershoek@baylibre.com>
Subject: [PATCH v2 0/2] Input: mt6779-keypad - fix hw code logic and row/col selection
Date:   Wed, 18 May 2022 09:59:07 +0200
Message-Id: <20220518075909.180629-1-mkorpershoek@baylibre.com>
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

v2 -> v1:
* Simplified SEL_COL/ROW_MASK macros as suggested by Dmitry
* Added Angelo's Reviewed-by on patch 1

Mattijs Korpershoek (2):
  Input: mt6779-keypad - fix hardware code mapping
  Input: mt6779-keypad - implement row/column selection

 drivers/input/keyboard/mt6779-keypad.c | 26 ++++++++++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)


base-commit: db02d07308ba7e94347ca037a662b3a1b1afe8c4
-- 
2.34.1

