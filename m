Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ACAC564760D
	for <lists+linux-input@lfdr.de>; Thu,  8 Dec 2022 20:20:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229592AbiLHTUc (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 8 Dec 2022 14:20:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229470AbiLHTUb (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 8 Dec 2022 14:20:31 -0500
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B41C28F0B3
        for <linux-input@vger.kernel.org>; Thu,  8 Dec 2022 11:20:30 -0800 (PST)
Received: by mail-pl1-x62c.google.com with SMTP id d7so2464230pll.9
        for <linux-input@vger.kernel.org>; Thu, 08 Dec 2022 11:20:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ifQ3Jav6VsSh1zyTRvbz7pDkhV+r1K5wCw7Us/t45o0=;
        b=X5atqoLOC95H8hGG6aBCNBoodKm+iMf7Ug0EuydjqLq5lc+FvwdCwRWqKzn+D6ITYD
         sHDDLbefyapJJE5aWPeT2ZnrzctfSZmI4BdUvu7Tsm8IfbmyXCAitOp0ICvAWYCLohSr
         /WxClb5RXALcnX5LBwlGxTkiMGVRtouhYKSc8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ifQ3Jav6VsSh1zyTRvbz7pDkhV+r1K5wCw7Us/t45o0=;
        b=8FCjsOXVGY3DW9pAukspJiPtELbGO0OjZijH4+eUD+xo2fNQtletK+7F2abJJA1/55
         RDWnDa/nB165l8GxJYLmAd46OG2PcWz1I8pscNA28pSo0L2x5DiBp9coCjLsJFqYMAuy
         kjjYx0/pJDd8W+ruygVpkRkxJmyuz9YgSwC48jpVReESk5evHBS+DUKR/GxQ6i0ej3rc
         qCNHonmn+CFT2IDntJ92lvXQJ/4ckpqVn5z8Stm5pAtrEKLdSvTvXQ6oXlet/92feYz0
         yonO9CMXkMw6iFcLDxrlE4g408SRf78iDPCcKHq7WNg4QHE56FKmkfBnFQ0QyH0rUdkV
         eGrw==
X-Gm-Message-State: ANoB5pmc3Q6Y1ElZ83BmN+s2Lmn5HvgOUYazSWyAV9/jhQMKsVMJf5Io
        sbqbSEyU47ewfiDGMXQnMcVCRA==
X-Google-Smtp-Source: AA0mqf70cATti+xb7wjPXJuFUg5RS0zjxNnJbgQkzNAyfUDBsVP2zR8uCcSgJ32j6So/RiOaMZCGuA==
X-Received: by 2002:a17:902:c745:b0:189:9519:87b6 with SMTP id q5-20020a170902c74500b00189951987b6mr2423967plq.5.1670527230259;
        Thu, 08 Dec 2022 11:20:30 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:9d:2:3aa1:2c62:9ac:4468])
        by smtp.gmail.com with ESMTPSA id u5-20020a170902e5c500b00186a2274382sm17112019plf.76.2022.12.08.11.20.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Dec 2022 11:20:29 -0800 (PST)
From:   Douglas Anderson <dianders@chromium.org>
To:     Bjorn Andersson <andersson@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     mka@chromium.org, swboyd@chromium.org,
        linux-arm-msm@vger.kernel.org, linux-input@vger.kernel.org,
        Yunlong Jia <ecs.beijing2022@gmail.com>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Johnny Chuang <johnny.chuang.emc@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 0/5] arm64: dts: qcom: sc7180: Make pazquel360's touchscreen work
Date:   Thu,  8 Dec 2022 11:20:01 -0800
Message-Id: <20221208192006.1070898-1-dianders@chromium.org>
X-Mailer: git-send-email 2.39.0.rc1.256.g54fd8350bd-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This series of patches adds / fixes problems with pazquel360's
touchscreen. A few notes here:

1. Originally the touchscreen was supposed to be added as part of the
first landing of the pazquel360 device tree. ...but the fact that
Yunlong changed email addresses seems to have messed up Bjorn's
scripts. What landed was v3 [1] instead of v5 [2]. The pazquel360 part
of this series is that diff.

2. We delayed sending the fixup till now because soon after the series
landed upstream we found that some laptops were having trouble
initting the touchscreen in cases where the eDP/touchscreen regulator
was left on by the bootloader. We've been struggling to make sense of
all of this. As part of this investigation we landed a85fbd649844
("Input: elants_i2c - properly handle the reset GPIO when power is
off") but that wasn't enough. That fix, together with the fixes in
this series, is enough though.

3. This series is mostly device tree changes with one more change to
the Elan driver. They are fine to land in separate trees. It turns out
that with _just_ the device tree changes things are actually working
OK but the timing is tight, so getting a little extra breathing room
from the Linux driver is nice.

4. Despite the fact that we did debugging here on pazquel360, many of
the changes here are made in general for trogdor devices. I believe
that this will make the timing more correct on those devices even if
we weren't actually seeing problems.

[1] https://lore.kernel.org/r/20220901024827.v3.2.Iea2d2918adfff2825b87d428b5732717425c196f@changeid
[2] https://lore.kernel.org/r/20220923083657.v5.3.Iea2d2918adfff2825b87d428b5732717425c196f@changeid


Douglas Anderson (5):
  arm64: dts: qcom: sc7180: Bump up trogdor ts_reset_l drive strength
  arm64: dts: qcom: sc7180: Add trogdor eDP/touchscreen regulator
    off-on-time
  arm64: dts: qcom: sc7180: Start the trogdor eDP/touchscreen regulator
    on
  arm64: dts: qcom: sc7180: Add pazquel360 touschreen
  Input: elants_i2c: Delay longer with reset asserted

 .../dts/qcom/sc7180-trogdor-homestar.dtsi     | 18 ++++++++++++++++
 .../qcom/sc7180-trogdor-parade-ps8640.dtsi    | 20 ++++++++++++++++++
 .../dts/qcom/sc7180-trogdor-pazquel360.dtsi   | 21 +++++++++++++++++++
 .../dts/qcom/sc7180-trogdor-ti-sn65dsi86.dtsi | 20 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi  | 10 ++++++++-
 drivers/input/touchscreen/elants_i2c.c        |  2 +-
 6 files changed, 89 insertions(+), 2 deletions(-)

-- 
2.39.0.rc1.256.g54fd8350bd-goog

