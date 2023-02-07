Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DAAA968CCBB
	for <lists+linux-input@lfdr.de>; Tue,  7 Feb 2023 03:49:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229868AbjBGCtD (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 6 Feb 2023 21:49:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229910AbjBGCs4 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 6 Feb 2023 21:48:56 -0500
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72DF535270
        for <linux-input@vger.kernel.org>; Mon,  6 Feb 2023 18:48:46 -0800 (PST)
Received: by mail-pl1-x636.google.com with SMTP id w5so4231524plg.8
        for <linux-input@vger.kernel.org>; Mon, 06 Feb 2023 18:48:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wLClDN2mw8UPzR2Mt0bhcLHPl8f4SmjcZHaBzl3SwMQ=;
        b=W0W7US80iiNOz0nxN4KOFrjFuNsG9BK93IQfqi2yAaf/IQw25EYxXvAAzjrbpsTx1Z
         Qqf1SoXTX2tzuE1q7Az7/AWdpnqzb9oDfsoOgiqLT+owtX39aZRghRJwUwspUZN55btY
         HZwkoAUfUXOwX5ujJDuSyOQvp1N8iqD5ojSAo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wLClDN2mw8UPzR2Mt0bhcLHPl8f4SmjcZHaBzl3SwMQ=;
        b=xAq+YXVqC7c+tg0OEax6Lkq+rYl1RHb09aq2IWrh6zuvx2YayWMJloBvDY4I+n6rPE
         TFmbxSZ2l8M6DgnUnmZAzLdzJAMVo6K8NZVgTTR/BT8cAUGt1m1igCu0kJ/Kby0MMzCn
         r6rMK/eVW5qK62V0UdBQ/UC8CQ2LgX9pDmixKqYxRJf4gBtY2ePBZpou6ti0y8q7ztRB
         mM9Ongh95OuZwBaTiZtEdMzjKsMVcMHiyaEffGZQKkhIQsa5ERGYbypTkbbwuUAa9i/d
         6sS8Lez4k1Y+yTKvvI6Mi12ixdnKjbHz/wXOrvIhShHI+ED2NZmK/1UM2UGmy8F6EUJi
         PtWQ==
X-Gm-Message-State: AO0yUKUNG8nEiMWcWEXsR4s5/HPBNqPmYqNav5iHG0J65ayUkD/KbL83
        05zyctXLqwuomYBjsN/5LdZrJA==
X-Google-Smtp-Source: AK7set8CMMbpCNH76H+LBfbAD2TNUn+FqqoBLyDbtbOyIt4X4bKv2DEMb7QFDIt2d709r5a3n8UZ+Q==
X-Received: by 2002:a17:90b:2251:b0:230:c57b:7c24 with SMTP id hk17-20020a17090b225100b00230c57b7c24mr2034728pjb.26.1675738125883;
        Mon, 06 Feb 2023 18:48:45 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:9d:2:29fb:a635:f0df:f45a])
        by smtp.gmail.com with ESMTPSA id s17-20020a63a311000000b0045dc85c4a5fsm6882430pge.44.2023.02.06.18.48.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Feb 2023 18:48:45 -0800 (PST)
From:   Douglas Anderson <dianders@chromium.org>
To:     Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     linux-input@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        devicetree@vger.kernel.org, Stephen Kitt <steve@sk2.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>, linux-kernel@vger.kernel.org
Subject: [PATCH 0/7] arm: qcom: Fix touchscreen voltage for sc7280-herobrine boards
Date:   Mon,  6 Feb 2023 18:48:09 -0800
Message-Id: <20230207024816.525938-1-dianders@chromium.org>
X-Mailer: git-send-email 2.39.1.519.gcb327c4b5f-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Trying to figure out how to talk to the touchscreen properly on
sc7280-herobrine boards was a long and difficult process. Many
Engineering hours were spent deciding how exactly one should talk over
i2c to a peripheral. In the end, a solution has been found and this
patch series attempts to implement it in a way that will work for all
herobrine-based boards.

Validation of this code has actually been done on
sc7280-herobrine-villager. Those patches are device-tree only and are
placed first. They shouldn't be super controversial, I hope.

In order to make this work, we also need to support
sc7280-herobrine-evoker. For evoker, things are a bit tricker, though
(I think) the solution we ended up with is not terrible. See the
"Goodix" bindings patch for the full details. Unfortunately, I haven't
tested the final version of these patches on evoker hardware. Thus
those patches are at the end of the series and marked as such. It
still wouldn't hurt to land them, if people are OK with it, since
nobody in the wild has this hardware and and the evoker-specific parts
of the patch are very easy to validate.


Douglas Anderson (7):
  arm64: dts: qcom: sc7280: On QCard, regulator L3C should be 1.8V
  arm64: dts: qcom: sc7280: Add 3ms ramp to herobrine's
    pp3300_left_in_mlb
  arm64: dts: qcom: sc7280: Hook up the touchscreen IO rail on villager
  HID: i2c-hid: goodix: Stop tying the reset line to the regulator
  dt-bindings: HID: i2c-hid: goodix: Add mainboard-vddio-supply
  HID: i2c-hid: goodix: Add mainboard-vddio-supply
  arm64: dts: qcom: sc7280: Hook up the touchscreen IO rail on evoker

 .../bindings/input/goodix,gt7375p.yaml        |  7 ++
 .../dts/qcom/sc7280-herobrine-evoker.dtsi     |  1 +
 .../dts/qcom/sc7280-herobrine-villager.dtsi   |  1 +
 .../arm64/boot/dts/qcom/sc7280-herobrine.dtsi |  2 +
 arch/arm64/boot/dts/qcom/sc7280-qcard.dtsi    | 10 +-
 drivers/hid/i2c-hid/i2c-hid-of-goodix.c       | 98 +++++--------------
 6 files changed, 42 insertions(+), 77 deletions(-)

-- 
2.39.1.519.gcb327c4b5f-goog

