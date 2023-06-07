Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6DAF67270D8
	for <lists+linux-input@lfdr.de>; Wed,  7 Jun 2023 23:53:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229614AbjFGVxX (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 7 Jun 2023 17:53:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232140AbjFGVxS (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 7 Jun 2023 17:53:18 -0400
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B9352121
        for <linux-input@vger.kernel.org>; Wed,  7 Jun 2023 14:53:16 -0700 (PDT)
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-654f8b56807so5319164b3a.1
        for <linux-input@vger.kernel.org>; Wed, 07 Jun 2023 14:53:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1686174796; x=1688766796;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=crBZss5mF3gjKLwx/CqtOTtfgR9i9SC8rNyLPUKs7BQ=;
        b=gLEGdkrlNnvMgTTGOEdCWWcfB1i72xB3KWqQx+7tAf5HZk5n8a87dTE8cDhQijzzBu
         lAV4kwbGPWSfrKgAixZN8QhMZX1SeEOn/DLX/dhv0PRDbO0tDOlWRmyatlez7rCoDgou
         WTw7bTbJbWTLjeon8Fy7dVsLN71SI8wsOrOug=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686174796; x=1688766796;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=crBZss5mF3gjKLwx/CqtOTtfgR9i9SC8rNyLPUKs7BQ=;
        b=YOkb73FNgoI1eF974R180+PJa0YhuvSw53YW3Wo9BsxEU7PuqgHyaGvrLmsSAoc4sB
         0wbhen4wCvIKezWwjKmA7G9PfySUM0Hw4lO1kRN4217s+CXjrTk8unXx6dI/8xAxLlOh
         M22Hzf0N42JwktaQOFzJINKRoH/nN2KCzjTIPOn5261sBxQZ96H1WWe9uqqcaEl+dInZ
         Yuq0g3s45owCSwhf6YZ6ZUbf5Hyd1DdjXo4XJmFcp7piNHZXSdGHiHFInVYkVCJsXulU
         tpj+xaNcUbp/h0R/JK1rGKh6xHaZL30X1FsNiZImIXpwFS1hYaV21pB8LIalpVia5WSo
         OTtw==
X-Gm-Message-State: AC+VfDwU3pnSvnL3opJacAP15Uq40qyH3QphEn/hwCczxir3xcSRpHFM
        jQE2AisHplIk8bfAJ9dv2EcluQ==
X-Google-Smtp-Source: ACHHUZ4vnQFYixY8jF66m21wSxp2x8lVupj/X6E4wb93LFsOExzlp2AYsSVAYdghITddglLp7a9/mQ==
X-Received: by 2002:aa7:8889:0:b0:64c:a554:f577 with SMTP id z9-20020aa78889000000b0064ca554f577mr8115023pfe.11.1686174795822;
        Wed, 07 Jun 2023 14:53:15 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:9d:2:34b2:b638:6b53:f6c2])
        by smtp.gmail.com with ESMTPSA id j25-20020aa78d19000000b0065dd1e7c2c1sm1376486pfe.63.2023.06.07.14.53.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jun 2023 14:53:15 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
Cc:     dri-devel@lists.freedesktop.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
        linux-kernel@vger.kernel.org, hsinyi@google.com,
        cros-qcom-dts-watchers@chromium.org, devicetree@vger.kernel.org,
        yangcong5@huaqin.corp-partner.google.com,
        linux-arm-msm@vger.kernel.org,
        Chris Morgan <macroalpha82@gmail.com>,
        Douglas Anderson <dianders@chromium.org>
Subject: [PATCH v2 04/10] of: property: fw_devlink: Add a devlink for panel followers
Date:   Wed,  7 Jun 2023 14:49:26 -0700
Message-ID: <20230607144931.v2.4.Ibf8e1342b5b7906279db2365aca45e6253857bb3@changeid>
X-Mailer: git-send-email 2.41.0.162.gfafddb0af9-goog
In-Reply-To: <20230607215224.2067679-1-dianders@chromium.org>
References: <20230607215224.2067679-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Inform fw_devlink of the fact that a panel follower (like a
touchscreen) is effectively a consumer of the panel from the purposes
of fw_devlink.

NOTE: this patch isn't required for correctness but instead optimizes
probe order / helps avoid deferrals.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
Since this is so small, I'd presume it's OK for it to go through a DRM
tree with the proper Ack. That being said, this patch is just an
optimization and thus it could land completely separately from the
rest and they could all meet up in mainline.

Changes in v2:
- ("Add a devlink for panel followers") new for v2.

 drivers/of/property.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/of/property.c b/drivers/of/property.c
index ddc75cd50825..cf8dacf3e3b8 100644
--- a/drivers/of/property.c
+++ b/drivers/of/property.c
@@ -1266,6 +1266,7 @@ DEFINE_SIMPLE_PROP(pwms, "pwms", "#pwm-cells")
 DEFINE_SIMPLE_PROP(resets, "resets", "#reset-cells")
 DEFINE_SIMPLE_PROP(leds, "leds", NULL)
 DEFINE_SIMPLE_PROP(backlight, "backlight", NULL)
+DEFINE_SIMPLE_PROP(panel, "panel", NULL)
 DEFINE_SUFFIX_PROP(regulators, "-supply", NULL)
 DEFINE_SUFFIX_PROP(gpio, "-gpio", "#gpio-cells")
 
@@ -1354,6 +1355,7 @@ static const struct supplier_bindings of_supplier_bindings[] = {
 	{ .parse_prop = parse_resets, },
 	{ .parse_prop = parse_leds, },
 	{ .parse_prop = parse_backlight, },
+	{ .parse_prop = parse_panel, },
 	{ .parse_prop = parse_gpio_compat, },
 	{ .parse_prop = parse_interrupts, },
 	{ .parse_prop = parse_regulators, },
-- 
2.41.0.162.gfafddb0af9-goog

