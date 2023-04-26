Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C32A36EF6AA
	for <lists+linux-input@lfdr.de>; Wed, 26 Apr 2023 16:44:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241298AbjDZOoj (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 26 Apr 2023 10:44:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241499AbjDZOoe (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 26 Apr 2023 10:44:34 -0400
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C839F7695
        for <linux-input@vger.kernel.org>; Wed, 26 Apr 2023 07:44:31 -0700 (PDT)
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-63b73203e0aso43668707b3a.1
        for <linux-input@vger.kernel.org>; Wed, 26 Apr 2023 07:44:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1682520271; x=1685112271;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RMNClM9ik+szOvJOLzfRpbcMxADOReFPHjEqSl9MgW0=;
        b=T1qwsRZgAaz7PgyfGME8hLTr+BlhLPS7hZWDSk7H9HG+U/in5nh4UEAeuL4awFu7Kh
         vvYQ74hjznhzvQQZ6ipUybRF6I83VVUuO8PQrWmuojfajIXZcwe72Vn8Bp6qakLrEUeT
         MSl0I6qTjgjLGXWar+a/gXZSDsWsiIMMymcxk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682520271; x=1685112271;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RMNClM9ik+szOvJOLzfRpbcMxADOReFPHjEqSl9MgW0=;
        b=I0Sl1jjGEWW09LEWXPBLduLfNgMxEOkrmvvpHFZ/2RJeYhhQG8DS8Owjb4JzdxqPT3
         7I7iFcABIrsK0l3syGAGoBvmwfB6Vce5KO1R2EP13mZ0gImLAha3t99T2Izb/lnUU6Fo
         qwy40AzemSz9cHRmux+uSVIvP7/nnGmAdPPSA0aVJnZSsfpZ+/Q7WTCP/NZWhjxhJL/+
         4znJaYY02wmUWx23DIY/VssxG102YCysYIoynS5xA8IJFekiglFNzvHv7+ElqUU172Cs
         sBUJuVthP24DLJgBhBlwfEBVPnuhlNPgyrhHSMiR4nZL+RDMyaZm3aOZoarciTPqYpgS
         t0Xw==
X-Gm-Message-State: AC+VfDxRnwc4+q8uadRTX1zjFiKOc1IUk0+hcPTksHEh6y4EQWyUi0d6
        AMEQA/dZ1LlLh5JSI0LchZjSEGLT1RxLig6TJTlIVA==
X-Google-Smtp-Source: ACHHUZ4VGDqLe4ucoBanVPHSiLZqrXQslXJ89MS3u5x7RjaMFE2ziXuibgHtnrtIF88PtTG4jGJEVA==
X-Received: by 2002:a05:6a21:9993:b0:ee:bcf3:be0c with SMTP id ve19-20020a056a21999300b000eebcf3be0cmr3657144pzb.0.1682520271275;
        Wed, 26 Apr 2023 07:44:31 -0700 (PDT)
Received: from fshao-glinux.tpe.corp.google.com ([2401:fa00:1:10:dcf6:797f:140d:6d])
        by smtp.gmail.com with ESMTPSA id f17-20020a631011000000b00502f20aa4desm8750495pgl.70.2023.04.26.07.44.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Apr 2023 07:44:30 -0700 (PDT)
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
Subject: [PATCH v3 0/2] Fix Goodix touchscreen power leakage for MT8186 boards
Date:   Wed, 26 Apr 2023 22:44:20 +0800
Message-ID: <20230426144423.2820826-1-fshao@chromium.org>
X-Mailer: git-send-email 2.40.1.495.gc816e09b53d-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
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

