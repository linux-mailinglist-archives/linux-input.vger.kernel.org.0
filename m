Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EA5B06EF136
	for <lists+linux-input@lfdr.de>; Wed, 26 Apr 2023 11:33:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240292AbjDZJdj (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 26 Apr 2023 05:33:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232123AbjDZJdh (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 26 Apr 2023 05:33:37 -0400
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD8B6E7
        for <linux-input@vger.kernel.org>; Wed, 26 Apr 2023 02:33:35 -0700 (PDT)
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-63b5c48ea09so5679032b3a.1
        for <linux-input@vger.kernel.org>; Wed, 26 Apr 2023 02:33:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1682501615; x=1685093615;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tiC1EixoNe9TvcsXGi4HMFFCigO3LAC2XK4QXXLhOuY=;
        b=N/4d2/dnYSkhGgmo1yEJ21nMJwso80TVv1R2jKDFELl94n03lMwt6NogcEwg1IsE6c
         kSjyQUDyCFg3pECB7tQBBB3Q1iX4k7l08KYKz/UoU9ccAOok4Svwduyt0D01gNr1L2Ma
         LvwNagl9VKFmb+/D6nQBPH3LJbb40OXlhjzlE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682501615; x=1685093615;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tiC1EixoNe9TvcsXGi4HMFFCigO3LAC2XK4QXXLhOuY=;
        b=epOvkJSPBlg6K2OOSdb2OzTmlzpvUBG7POPVHqfmC9Z7vwNQrc9Pe5PWRANfH635E3
         BHrjvnF2brFUmjw8pCt33/KqV8B8gnBSgilFDleD4QAST7Js77WNdOcxYvDYXiThkz31
         iTjiWqCB212rJDz1Eb/P7Qa98zKD7kmPmCWkTnFqPC5tNAxLMkkcDOrbwx1wZvt+ocAT
         YN7Y3wnEDTf6gM8Zxk2zdu0p3lRRxI563MTR4I15KFvKNDaLMkVqa0FVbWbgNE2yxclA
         sTyDCU5pinS1vJDhNi6RRvzdxcA2njWqPd3nV5C4pRsY1NwV09n1HXVpP+ZJMZF8o6ly
         JUJA==
X-Gm-Message-State: AAQBX9fVuAqRYsqGicUd7LMlE0Fe+5GKHiXaHx4Z8O7ssWHEYYaExPcx
        RBNRF0eDuOiRJd1zFD9Jb1Irfg==
X-Google-Smtp-Source: AKy350aRbFyZHOGKWRhhNxNRmhRppBdI6Qj5Hf5cU5Xv1kPX2Am2QNrW4+QfzRy/3gQG4MmiMaD/Rg==
X-Received: by 2002:a05:6a00:10cc:b0:63a:cefa:9d44 with SMTP id d12-20020a056a0010cc00b0063acefa9d44mr23043975pfu.14.1682501615312;
        Wed, 26 Apr 2023 02:33:35 -0700 (PDT)
Received: from fshao-glinux.tpe.corp.google.com ([2401:fa00:1:10:dcf6:797f:140d:6d])
        by smtp.gmail.com with ESMTPSA id g1-20020a056a00078100b005810c4286d6sm10730075pfu.0.2023.04.26.02.33.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Apr 2023 02:33:34 -0700 (PDT)
From:   Fei Shao <fshao@chromium.org>
To:     Jeff LaBundy <jeff@labundy.com>,
        Douglas Anderson <dianders@chromium.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-mediatek <linux-mediatek@lists.infradead.org>,
        Fei Shao <fshao@chromium.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Jiri Kosina <jikos@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Stephen Kitt <steve@sk2.org>, devicetree@vger.kernel.org,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] Fix Goodix touchscreen power leakage for MT8186 boards
Date:   Wed, 26 Apr 2023 17:32:28 +0800
Message-ID: <20230426093231.1466984-1-fshao@chromium.org>
X-Mailer: git-send-email 2.40.1.495.gc816e09b53d-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

These changes are based on the series in [1], which modified the
i2c-hid-of-goodix driver and removed the workaround for a power leakage
issue, so the issue revisits on Mediatek MT8186 boards (Steelix).

The root cause is that the touchscreen can be powered in different ways
depending on the hardware designs, and it's not as easy to come up with
a solution that is both simple and elegant for all the known designs.

To address the issue, I ended up adding a new boolean property for the
driver so that we can control the power up/down sequence depending on
that.

Adding a new property might not be the cleanest approach for this, but
at least the intention would be easy enough to understand, and it
introduces relatively small change to the code and fully preserves the
original control flow.
I hope this is something acceptable, and I'm open to any better
approaches.

[1] https://lore.kernel.org/all/20230207024816.525938-1-dianders@chromium.org/

Changes in v2:
- Use a more accurate property name and with "goodix," prefix.
- Do not change the regulator_enable logic during power-up.

Fei Shao (2):
  dt-bindings: input: goodix: Add "goodix,no-reset-during-suspend"
    property
  HID: i2c-hid: goodix: Add support for "goodix,no-reset-during-suspend"
    property

 .../bindings/input/goodix,gt7375p.yaml        |  9 +++++++
 drivers/hid/i2c-hid/i2c-hid-of-goodix.c       | 26 +++++++++++++++++++
 2 files changed, 35 insertions(+)

-- 
2.40.1.495.gc816e09b53d-goog

