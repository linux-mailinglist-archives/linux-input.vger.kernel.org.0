Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E74606E649F
	for <lists+linux-input@lfdr.de>; Tue, 18 Apr 2023 14:51:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232160AbjDRMvA (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 18 Apr 2023 08:51:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232143AbjDRMu7 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 18 Apr 2023 08:50:59 -0400
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13B3116B3D
        for <linux-input@vger.kernel.org>; Tue, 18 Apr 2023 05:50:45 -0700 (PDT)
Received: by mail-pl1-x62a.google.com with SMTP id p17so16745116pla.3
        for <linux-input@vger.kernel.org>; Tue, 18 Apr 2023 05:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1681822244; x=1684414244;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UvYQl2dSNs2drI6x+tVSTFEOpl8Z5ePoGgWVyp9WoW4=;
        b=lO293BhjwNYLclYsjSpzyyLDt218sTOzbWEbdzTmjP4dBWHVcxa87ECW84PUQ2/B5B
         jBQjO399/tOmeIpg/xIuV/QbyYVsIOx3a6SoDkdh4AOW0IJNhE+whTdu8n7gx4krMy9w
         zTyAltktrrl8zLKmZZq+3s+/gQGCDL/kNppiU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681822244; x=1684414244;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UvYQl2dSNs2drI6x+tVSTFEOpl8Z5ePoGgWVyp9WoW4=;
        b=GKO9xnztAHD9usQYPKC4DiyZ4qMHgvNt0u1MqEWkdnoZHXDtiGoa3t2wptPNjVs15P
         011ID92bx3uz2e/+i+ZVQvEbrA3We+OeLgnKS5OY2QbFfjHVy6EVAE6dqhaQjRS06av2
         iyxGhDzFAf+4W2QLBMzeV1Nwpmi1465LG2gqKaTJ0A5JYgz1HQ9e6M+AvcSaVGTDlGtP
         UA2SZMUX8YSxLGkxdHordBBfk6gDNKtdvtUp2hfRlS+YWaTU0g5SifsgPFQk8iNE68cU
         UA8js3SWh8oXdWF6SUI43UedFcaR3DEC+P51S/WJmYyIw3B3FB9ByZMkPToUKtGLQfPx
         xRbg==
X-Gm-Message-State: AAQBX9dajvyLorTAax3ep+EHz9xIAom4C3r7uOvLu6nOGpjQMP/vqcgq
        SimrixZJJXxy6B7/M3VDP8Wd6A==
X-Google-Smtp-Source: AKy350Ztbx6m0tcVjG7FcO5xLpjLe3Ig3KnXB+nMZHFdI7Sk9FxbAaBQP2g0+zKuvD4RGnngbX4HBg==
X-Received: by 2002:a05:6a21:32a2:b0:ee:3e4f:eecd with SMTP id yt34-20020a056a2132a200b000ee3e4feecdmr17968088pzb.38.1681822244288;
        Tue, 18 Apr 2023 05:50:44 -0700 (PDT)
Received: from fshao-glinux.tpe.corp.google.com ([2401:fa00:1:10:2fb7:301d:6083:752b])
        by smtp.gmail.com with ESMTPSA id v11-20020a62a50b000000b0063afb08afeesm9323733pfm.67.2023.04.18.05.50.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Apr 2023 05:50:43 -0700 (PDT)
From:   Fei Shao <fshao@chromium.org>
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Douglas Anderson <dianders@chromium.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-mediatek <linux-mediatek@lists.infradead.org>,
        Fei Shao <fshao@chromium.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Jiri Kosina <jikos@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Stephen Kitt <steve@sk2.org>, devicetree@vger.kernel.org,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] Fix Goodix touchscreen power leakage for MT8186 boards
Date:   Tue, 18 Apr 2023 20:49:50 +0800
Message-ID: <20230418124953.3170028-1-fshao@chromium.org>
X-Mailer: git-send-email 2.40.0.634.g4ca3ef3211-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
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


Fei Shao (2):
  dt-bindings: input: goodix: Add powered-in-suspend property
  HID: i2c-hid: goodix: Add support for powered-in-suspend property

 .../bindings/input/goodix,gt7375p.yaml        |  6 +++
 drivers/hid/i2c-hid/i2c-hid-of-goodix.c       | 46 ++++++++++++++++---
 2 files changed, 45 insertions(+), 7 deletions(-)

-- 
2.40.0.634.g4ca3ef3211-goog

