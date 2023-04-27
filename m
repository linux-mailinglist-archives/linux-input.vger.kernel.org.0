Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1F31F6EFFFB
	for <lists+linux-input@lfdr.de>; Thu, 27 Apr 2023 05:57:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242718AbjD0D5X (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 26 Apr 2023 23:57:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242556AbjD0D5W (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 26 Apr 2023 23:57:22 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EE3E2137
        for <linux-input@vger.kernel.org>; Wed, 26 Apr 2023 20:57:20 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-2470e93ea71so5760229a91.0
        for <linux-input@vger.kernel.org>; Wed, 26 Apr 2023 20:57:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1682567839; x=1685159839;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qyCuMNKBtQeGA2gyVABto0ConQLwqnJ6FAuzCLNNnoo=;
        b=XPmo68CuIhhAAWRf+FBNumslgXuHd59asHCw8Hw/Wq47BEyMLMLgmyuuyI2EGsCBh5
         xnVTMAzNjy0dL2RGxv0len2THJ81brBgBlc2WZH8zR6Btv46u8c8RnldHC1M8cP/n7It
         2kwD6AqSgTqkQG1LscmH/muTMzoyh/p7KU/+c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682567839; x=1685159839;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qyCuMNKBtQeGA2gyVABto0ConQLwqnJ6FAuzCLNNnoo=;
        b=KTlDYmc1s7OMoO9CoGlb09niuYMK7QKeC6q+U5VBxYf2sRrEhxXcmgGyxExjJegGPr
         P7Q++NSibjGzHiIx2R855BnWzWyN6gzU64G0egNNVqJa71/dExnWlUygBRIGG5lYBBuf
         o7tgVxly4FJlK0vgqFpu6NlX4+9laqP26SZvRcHckPn5fuZ4b5LIJbjzLXWXjiZPo8K/
         FbR8XgzhGGJa33Ub1+ogHzlP2jh5h7Q5hFcB8vBaClhhl6s6FXsa6jYMY3XtkfQtdGzl
         LtDC7Qt/6yqOz7S1ud+hh0Hdpsfwb9YqgZoUTMcBshQbpK864waIaxuBGvsTUAA2y6nL
         zn5A==
X-Gm-Message-State: AC+VfDxTiPYrWnlZfmcQY3/d0HXcQjEdiMUK4asTZCZkyOBzizrmSiIy
        nvFD6JQ19pnWdm8wFoVf3ONVQA==
X-Google-Smtp-Source: ACHHUZ4cTM0qcZus6xYcro7JvNMdYpjfgWbsmj/pL9SiS8eN7atWWr38IqCZ1ohC5+ViTtremXq2mw==
X-Received: by 2002:a17:90b:38c4:b0:23d:a2a:3ae4 with SMTP id nn4-20020a17090b38c400b0023d0a2a3ae4mr405236pjb.44.1682567839599;
        Wed, 26 Apr 2023 20:57:19 -0700 (PDT)
Received: from fshao-glinux.tpe.corp.google.com ([2401:fa00:1:10:dcf6:797f:140d:6d])
        by smtp.gmail.com with ESMTPSA id u1-20020a17090ae00100b002471f9a010dsm12214092pjy.21.2023.04.26.20.57.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Apr 2023 20:57:19 -0700 (PDT)
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
Subject: [PATCH v4 0/2] Fix Goodix touchscreen power leakage for MT8186 boards
Date:   Thu, 27 Apr 2023 11:56:54 +0800
Message-ID: <20230427035656.1962698-1-fshao@chromium.org>
X-Mailer: git-send-email 2.40.1.495.gc816e09b53d-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
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

Changes in v4:
- Minor coding style improvement

Changes in v3:
- In power-down, only skip the GPIO but not the regulator calls if the
  flag is set

Changes in v2:
- Use a more accurate property name and with "goodix," prefix.
- Do not change the regulator_enable logic during power-up.

Fei Shao (2):
  dt-bindings: input: goodix: Add "goodix,no-reset-during-suspend"
    property
  HID: i2c-hid: goodix: Add support for "goodix,no-reset-during-suspend"
    property

 .../bindings/input/goodix,gt7375p.yaml           |  9 +++++++++
 drivers/hid/i2c-hid/i2c-hid-of-goodix.c          | 16 +++++++++++++++-
 2 files changed, 24 insertions(+), 1 deletion(-)

-- 
2.40.1.495.gc816e09b53d-goog

