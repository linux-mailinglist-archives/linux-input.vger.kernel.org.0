Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 347677270CA
	for <lists+linux-input@lfdr.de>; Wed,  7 Jun 2023 23:53:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232305AbjFGVxU (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 7 Jun 2023 17:53:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232101AbjFGVxN (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 7 Jun 2023 17:53:13 -0400
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A93221FFE
        for <linux-input@vger.kernel.org>; Wed,  7 Jun 2023 14:53:11 -0700 (PDT)
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-654f8b56807so5319112b3a.1
        for <linux-input@vger.kernel.org>; Wed, 07 Jun 2023 14:53:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1686174791; x=1688766791;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hfUG9c2qlt8kTNqx7t/idPYkBIfLX/cfnxD2deWf3W8=;
        b=ayuR0NPMX0lCr649Ls3PcdaWJi3/pI5z6ekASxp9r2pXuUPRAKtIyY930QFx1kuFcE
         nOzUI88ocCNkotOwnkN5ZtWTSMimth7YMeld2HFSmbDacRlogFUCdDed5mPLGt0c4lYC
         KN5LqNcDew/hCZof0SBt6j5tLIkYGt873vkRE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686174791; x=1688766791;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hfUG9c2qlt8kTNqx7t/idPYkBIfLX/cfnxD2deWf3W8=;
        b=EAzaaW1bAS2lxzXsTINQlkWF6Llgy8CuhXoLF8TLFVpcEyqYA24CkLl84AH5srqu5P
         fRtJoIe3g964mnZoMUVrsXmd9IV5xoGTkIGqG05d4pRPBgjyGaZz/Eove7cXcWggscfO
         C99O6ffbMDoglob2mf+EGmEs/kZWeKnBDBdOoCcBHZLv75pZXOQQK91Co924uDkUqHzm
         TRhaXv8fS1ouZVUuP6zC6lj0Gb8jBfkE79pT7HLPnr74fmVUHpBT7eG0atsJPZtc2aAm
         gCAUMCTneduvLH6PyrGcGB2iIqdeP4OCV2BNKRwIcnbNRBAzC9XDdSSM1JhN/LGqz/AW
         ViRg==
X-Gm-Message-State: AC+VfDzLxew6NoHifw4nJxwk76FThiamK0uiQMDH7av8IISiTYx9sTXb
        wWOamjj0jDiQ56zy+J+khKrrqw==
X-Google-Smtp-Source: ACHHUZ5vfibDCVUWE3Kynbnpu3siXIIB9yWFZZP0NY7g1SfK3F8RBOhQnS7yJNMmZRj3836EH4K2tg==
X-Received: by 2002:a05:6a20:8f17:b0:107:1805:feea with SMTP id b23-20020a056a208f1700b001071805feeamr5073223pzk.37.1686174791064;
        Wed, 07 Jun 2023 14:53:11 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:9d:2:34b2:b638:6b53:f6c2])
        by smtp.gmail.com with ESMTPSA id j25-20020aa78d19000000b0065dd1e7c2c1sm1376486pfe.63.2023.06.07.14.53.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jun 2023 14:53:10 -0700 (PDT)
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
Subject: [PATCH v2 02/10] drm/panel: Check for already prepared/enabled in drm_panel
Date:   Wed,  7 Jun 2023 14:49:24 -0700
Message-ID: <20230607144931.v2.2.I59b417d4c29151cc2eff053369ec4822b606f375@changeid>
X-Mailer: git-send-email 2.41.0.162.gfafddb0af9-goog
In-Reply-To: <20230607215224.2067679-1-dianders@chromium.org>
References: <20230607215224.2067679-1-dianders@chromium.org>
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

In a whole pile of panel drivers, we have code to make the
prepare/unprepare/enable/disable callbacks behave as no-ops if they've
already been called. It's silly to have this code duplicated
everywhere. Add it to the core instead so that we can eventually
delete it from all the drivers. Note: to get some idea of the
duplicated code, try:
  git grep 'if.*>prepared' -- drivers/gpu/drm/panel
  git grep 'if.*>enabled' -- drivers/gpu/drm/panel

NOTE: arguably, the right thing to do here is actually to skip this
patch and simply remove all the extra checks from the individual
drivers. Perhaps the checks were needed at some point in time in the
past but maybe they no longer are? Certainly as we continue
transitioning over to "panel_bridge" then we expect there to be much
less variety in how these calls are made. When we're called as part of
the bridge chain, things should be pretty simple. In fact, there was
some discussion in the past about these checks [1], including a
discussion about whether the checks were needed and whether the calls
ought to be refcounted. At the time, I decided not to mess with it
because it felt too risky.

Looking closer at it now, I'm fairly certain that nothing in the
existing codebase is expecting these calls to be refcounted. The only
real question is whether someone is already doing something to ensure
prepare()/unprepare() match and enabled()/disable() match. I would say
that, even if there is something else ensuring that things match,
there's enough complexity that adding an extra bool and an extra
double-check here is a good idea. Let's add a drm_warn() to let people
know that it's considered a minor error to take advantage of
drm_panel's double-checking but we'll still make things work fine.

[1] https://lore.kernel.org/r/20210416153909.v4.27.I502f2a92ddd36c3d28d014dd75e170c2d405a0a5@changeid

Acked-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
This has Neil's Ack and I could commit it to drm-misc-next, but for
now I'm holding off to see where this series ends up. If the series
ends up looking good we'll have to coordinate landing the various bits
between the drm and the hid trees and the second drm patch in my
series depends on this one.

If my series implodes I'll land this one on its own. In any case, once
this lands somewhere I'll take an AI to cleanup the panels.

(no changes since v1)

 drivers/gpu/drm/drm_panel.c | 49 ++++++++++++++++++++++++++++++++-----
 include/drm/drm_panel.h     | 14 +++++++++++
 2 files changed, 57 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/drm_panel.c b/drivers/gpu/drm/drm_panel.c
index f634371c717a..4e1c4e42575b 100644
--- a/drivers/gpu/drm/drm_panel.c
+++ b/drivers/gpu/drm/drm_panel.c
@@ -105,11 +105,22 @@ EXPORT_SYMBOL(drm_panel_remove);
  */
 int drm_panel_prepare(struct drm_panel *panel)
 {
+	int ret;
+
 	if (!panel)
 		return -EINVAL;
 
-	if (panel->funcs && panel->funcs->prepare)
-		return panel->funcs->prepare(panel);
+	if (panel->prepared) {
+		dev_warn(panel->dev, "Skipping prepare of already prepared panel\n");
+		return 0;
+	}
+
+	if (panel->funcs && panel->funcs->prepare) {
+		ret = panel->funcs->prepare(panel);
+		if (ret < 0)
+			return ret;
+	}
+	panel->prepared = true;
 
 	return 0;
 }
@@ -128,11 +139,22 @@ EXPORT_SYMBOL(drm_panel_prepare);
  */
 int drm_panel_unprepare(struct drm_panel *panel)
 {
+	int ret;
+
 	if (!panel)
 		return -EINVAL;
 
-	if (panel->funcs && panel->funcs->unprepare)
-		return panel->funcs->unprepare(panel);
+	if (!panel->prepared) {
+		dev_warn(panel->dev, "Skipping unprepare of already unprepared panel\n");
+		return 0;
+	}
+
+	if (panel->funcs && panel->funcs->unprepare) {
+		ret = panel->funcs->unprepare(panel);
+		if (ret < 0)
+			return ret;
+	}
+	panel->prepared = false;
 
 	return 0;
 }
@@ -155,11 +177,17 @@ int drm_panel_enable(struct drm_panel *panel)
 	if (!panel)
 		return -EINVAL;
 
+	if (panel->enabled) {
+		dev_warn(panel->dev, "Skipping enable of already enabled panel\n");
+		return 0;
+	}
+
 	if (panel->funcs && panel->funcs->enable) {
 		ret = panel->funcs->enable(panel);
 		if (ret < 0)
 			return ret;
 	}
+	panel->enabled = true;
 
 	ret = backlight_enable(panel->backlight);
 	if (ret < 0)
@@ -187,13 +215,22 @@ int drm_panel_disable(struct drm_panel *panel)
 	if (!panel)
 		return -EINVAL;
 
+	if (!panel->enabled) {
+		dev_warn(panel->dev, "Skipping disable of already disabled panel\n");
+		return 0;
+	}
+
 	ret = backlight_disable(panel->backlight);
 	if (ret < 0)
 		DRM_DEV_INFO(panel->dev, "failed to disable backlight: %d\n",
 			     ret);
 
-	if (panel->funcs && panel->funcs->disable)
-		return panel->funcs->disable(panel);
+	if (panel->funcs && panel->funcs->disable) {
+		ret = panel->funcs->disable(panel);
+		if (ret < 0)
+			return ret;
+	}
+	panel->enabled = false;
 
 	return 0;
 }
diff --git a/include/drm/drm_panel.h b/include/drm/drm_panel.h
index 432fab2347eb..c6cf75909389 100644
--- a/include/drm/drm_panel.h
+++ b/include/drm/drm_panel.h
@@ -198,6 +198,20 @@ struct drm_panel {
 	 * the panel is powered up.
 	 */
 	bool prepare_prev_first;
+
+	/**
+	 * @prepared:
+	 *
+	 * If true then the panel has been prepared.
+	 */
+	bool prepared;
+
+	/**
+	 * @enabled:
+	 *
+	 * If true then the panel has been enabled.
+	 */
+	bool enabled;
 };
 
 void drm_panel_init(struct drm_panel *panel, struct device *dev,
-- 
2.41.0.162.gfafddb0af9-goog

