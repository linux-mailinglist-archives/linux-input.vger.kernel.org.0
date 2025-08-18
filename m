Return-Path: <linux-input+bounces-14086-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F0E60B2A0D8
	for <lists+linux-input@lfdr.de>; Mon, 18 Aug 2025 13:57:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 795C9196172E
	for <lists+linux-input@lfdr.de>; Mon, 18 Aug 2025 11:50:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8059B30E82E;
	Mon, 18 Aug 2025 11:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="MFPgcHIn"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAEE1319874
	for <linux-input@vger.kernel.org>; Mon, 18 Aug 2025 11:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755517824; cv=none; b=qemagYisQR7j3I2mlYX3V0TodcrTAcXMIfnq+Yno7qZHKnauhquYtxH3tPmaTc0bVY+7GBaWy2N376zfrW/QqrRYaTN9nTOdxb+nUTAcRz1m4pqL1+egckbr6jcZKiaQ2IDw/I1nXbqOjXVBghFfLDIZtO2/TdAgo5FZCJnctuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755517824; c=relaxed/simple;
	bh=6NluitXyXQGcxffxnMqCUpCBrGcquTGzvvkkc9bRe0U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VpC1r9rSB8uzxkfVHvw6R4Q2LFn6dJVE740JrUTvbfB59n3jPgt7ipTgBEWQiZg31Rn4JPFf2W7jUDKTc0RMlcQ+B+6qxNV5EzXkJAGxFDJTWQ4HmIseXv+c1X6E+nPkCIOrftBZ74X3h5ST3Ni0TMiY7P0c4O0S5XmbLc1X8Bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=MFPgcHIn; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-b47174c3817so2912326a12.2
        for <linux-input@vger.kernel.org>; Mon, 18 Aug 2025 04:50:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1755517822; x=1756122622; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UulYzIy5HqPnDw6udvrknuDDM9ViKLj7nBVeIIxwUb4=;
        b=MFPgcHInslJQXjz1Rk/v0emLAOfZQeQb9BiYzeRz4Hc7ShgoxpYQ/tq5gPN1bwbT+E
         9wBP6qY2TEQ9D4LTlmZKCcfg3tspYkuPjC4Q9Q+iIsWjq85gR8BAM1BaEpZX9oumhfLo
         ihNHtyxgkvaFuFVM85EojofDY53H6IWqF4hgY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755517822; x=1756122622;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UulYzIy5HqPnDw6udvrknuDDM9ViKLj7nBVeIIxwUb4=;
        b=Vjxut/ofo6ZMuh5UoPY8ipz7dLLqAOQKTD1MYFyp9mMP/bvnIoMRCe6lxjY3iBcR8P
         HM8Zi963J24nMwl3/ErSNtSOJHA1GrQTQWsUjkc5sVs+321O68Yp0zydxkIEJoe/xmCO
         cPxof2MdlpALdqn5hPH3TCXK/5x3fZI2pet0a1VuVCPUw1QF97H+ZUTLPJcXi/ryeG1y
         DbqOC6HBllg0r/V6vbcpGvy/Vep7bweCGWvr+POnT5tFO/d85Z2qTO8PFnHxspkBHknD
         /UoEwOqO6IS/My8n2a5a2zSk3HElnHHMPOs8UQuRXabniX0g4QnJ9nxbbRx9wV6n5l3L
         MM7g==
X-Forwarded-Encrypted: i=1; AJvYcCUNcyVyhbEyqId4Z3HJXI23mDRt+2aqIcRs4L+0CfpJThm3xdUu9x3uRIUMqJRVbZ/WJFnHhEYxi2XPLQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwOfRgk+zj++5Ubau5BdLfUAOUEdshI1smmKN7lJFXcyZpJ1WjR
	3kzE2o0HMqoxTcQTVyPnnGSTDpM2ZqUHh+lOWw85X1OldKBdLCJVj+I8pY8cteY5VQ==
X-Gm-Gg: ASbGncsCZKlURAG3D0p/Iy1SfFFSp+Dt/uFDSEVaY2x1joYt4ANIRtXw8VQJRZCnN5r
	TVSRZlxBzqmVozimTAhzyczZsbTiirWK5m8PYZr0zf3PShFfFoXLIis/99A83/HOBXf6LTdMPcL
	f2lPouDCK6TkEn2QwxHEtIVG8BFkWavVKrxvkX999h9aZXVyLjV9CC2Xt1fy7DacHQfG/eIfAaM
	hvqGC+TE7xkBSBRMqEXGLzkq0s5yAAvBkm7GBtlrj+zYSa900MiiDjQ1Mi9Up2K6mQm++Uyuuq5
	+T/8Di54MjUlgV063Ppend3K57WiAQrQyi2Vu2BP4J0H0YFEVS6c9gWDtr2hcdqCTJfebnXosz3
	0ZT3CthozYnJYpKrH+FsWI11aZBQPMpTjO/i8sfoLNmitvg==
X-Google-Smtp-Source: AGHT+IG4EnK+v1tzuHZnBIDFTu0lhfCNM/6uvRmVxQYPJatcyzYjE+EpdXCPSuVW/Awh7uepbmS4mQ==
X-Received: by 2002:a17:903:4b2f:b0:240:127:85f1 with SMTP id d9443c01a7336-2446d722288mr152747785ad.18.1755517821926;
        Mon, 18 Aug 2025 04:50:21 -0700 (PDT)
Received: from treapking.tpe.corp.google.com ([2401:fa00:1:10:5130:767b:3a09:59d6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2446ca9ee03sm78997715ad.15.2025.08.18.04.50.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 04:50:21 -0700 (PDT)
From: Pin-yen Lin <treapking@chromium.org>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <quic_jesszhan@quicinc.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	linux-input@vger.kernel.org,
	Chen-Yu Tsai <wenst@chromium.org>,
	dri-devel@lists.freedesktop.org,
	Pin-yen Lin <treapking@chromium.org>
Subject: [PATCH v3 1/2] drm/panel: Allow powering on panel follower after panel is enabled
Date: Mon, 18 Aug 2025 19:49:33 +0800
Message-ID: <20250818115015.2909525-1-treapking@chromium.org>
X-Mailer: git-send-email 2.51.0.rc1.163.g2494970778-goog
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some touch controllers have to be powered on after the panel's backlight
is enabled. To support these controllers, introduce .panel_enabled() and
.panel_disabling() to panel_follower_funcs and use them to power on the
device after the panel and its backlight are enabled.

Signed-off-by: Pin-yen Lin <treapking@chromium.org>

---

Changes in v3:
- Update kernel-docs of drm_panel_add_follower() and drm_panel_remove_follower()
- Fix the order of calling .panel_disabling() and .panel_unpreparing()
- Add a blank line before the goto label

Changes in v2:
- Replace after_panel_enabled flag with enabled/disabling callbacks

 drivers/gpu/drm/drm_panel.c | 73 +++++++++++++++++++++++++++++++------
 include/drm/drm_panel.h     | 14 +++++++
 2 files changed, 76 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/drm_panel.c b/drivers/gpu/drm/drm_panel.c
index c8bb28dccdc1b..d1e6598ea3bc0 100644
--- a/drivers/gpu/drm/drm_panel.c
+++ b/drivers/gpu/drm/drm_panel.c
@@ -134,6 +134,9 @@ void drm_panel_prepare(struct drm_panel *panel)
 	panel->prepared = true;
 
 	list_for_each_entry(follower, &panel->followers, list) {
+		if (!follower->funcs->panel_prepared)
+			continue;
+
 		ret = follower->funcs->panel_prepared(follower);
 		if (ret < 0)
 			dev_info(panel->dev, "%ps failed: %d\n",
@@ -179,6 +182,9 @@ void drm_panel_unprepare(struct drm_panel *panel)
 	mutex_lock(&panel->follower_lock);
 
 	list_for_each_entry(follower, &panel->followers, list) {
+		if (!follower->funcs->panel_unpreparing)
+			continue;
+
 		ret = follower->funcs->panel_unpreparing(follower);
 		if (ret < 0)
 			dev_info(panel->dev, "%ps failed: %d\n",
@@ -209,6 +215,7 @@ EXPORT_SYMBOL(drm_panel_unprepare);
  */
 void drm_panel_enable(struct drm_panel *panel)
 {
+	struct drm_panel_follower *follower;
 	int ret;
 
 	if (!panel)
@@ -219,10 +226,12 @@ void drm_panel_enable(struct drm_panel *panel)
 		return;
 	}
 
+	mutex_lock(&panel->follower_lock);
+
 	if (panel->funcs && panel->funcs->enable) {
 		ret = panel->funcs->enable(panel);
 		if (ret < 0)
-			return;
+			goto exit;
 	}
 	panel->enabled = true;
 
@@ -230,6 +239,19 @@ void drm_panel_enable(struct drm_panel *panel)
 	if (ret < 0)
 		DRM_DEV_INFO(panel->dev, "failed to enable backlight: %d\n",
 			     ret);
+
+	list_for_each_entry(follower, &panel->followers, list) {
+		if (!follower->funcs->panel_enabled)
+			continue;
+
+		ret = follower->funcs->panel_enabled(follower);
+		if (ret < 0)
+			dev_info(panel->dev, "%ps failed: %d\n",
+				 follower->funcs->panel_enabled, ret);
+	}
+
+exit:
+	mutex_unlock(&panel->follower_lock);
 }
 EXPORT_SYMBOL(drm_panel_enable);
 
@@ -243,6 +265,7 @@ EXPORT_SYMBOL(drm_panel_enable);
  */
 void drm_panel_disable(struct drm_panel *panel)
 {
+	struct drm_panel_follower *follower;
 	int ret;
 
 	if (!panel)
@@ -262,6 +285,18 @@ void drm_panel_disable(struct drm_panel *panel)
 		return;
 	}
 
+	mutex_lock(&panel->follower_lock);
+
+	list_for_each_entry(follower, &panel->followers, list) {
+		if (!follower->funcs->panel_disabling)
+			continue;
+
+		ret = follower->funcs->panel_disabling(follower);
+		if (ret < 0)
+			dev_info(panel->dev, "%ps failed: %d\n",
+				 follower->funcs->panel_disabling, ret);
+	}
+
 	ret = backlight_disable(panel->backlight);
 	if (ret < 0)
 		DRM_DEV_INFO(panel->dev, "failed to disable backlight: %d\n",
@@ -270,9 +305,12 @@ void drm_panel_disable(struct drm_panel *panel)
 	if (panel->funcs && panel->funcs->disable) {
 		ret = panel->funcs->disable(panel);
 		if (ret < 0)
-			return;
+			goto exit;
 	}
 	panel->enabled = false;
+
+exit:
+	mutex_unlock(&panel->follower_lock);
 }
 EXPORT_SYMBOL(drm_panel_disable);
 
@@ -539,13 +577,13 @@ EXPORT_SYMBOL(drm_is_panel_follower);
  * @follower_dev: The 'struct device' for the follower.
  * @follower:     The panel follower descriptor for the follower.
  *
- * A panel follower is called right after preparing the panel and right before
- * unpreparing the panel. It's primary intention is to power on an associated
- * touchscreen, though it could be used for any similar devices. Multiple
- * devices are allowed the follow the same panel.
+ * A panel follower is called right after preparing/enabling the panel and right
+ * before unpreparing/disabling the panel. It's primary intention is to power on
+ * an associated touchscreen, though it could be used for any similar devices.
+ * Multiple devices are allowed the follow the same panel.
  *
- * If a follower is added to a panel that's already been turned on, the
- * follower's prepare callback is called right away.
+ * If a follower is added to a panel that's already been prepared/enabled, the
+ * follower's prepared/enabled callback is called right away.
  *
  * The "panel" property of the follower points to the panel to be followed.
  *
@@ -569,12 +607,18 @@ int drm_panel_add_follower(struct device *follower_dev,
 	mutex_lock(&panel->follower_lock);
 
 	list_add_tail(&follower->list, &panel->followers);
-	if (panel->prepared) {
+	if (panel->prepared && follower->funcs->panel_prepared) {
 		ret = follower->funcs->panel_prepared(follower);
 		if (ret < 0)
 			dev_info(panel->dev, "%ps failed: %d\n",
 				 follower->funcs->panel_prepared, ret);
 	}
+	if (panel->enabled && follower->funcs->panel_enabled) {
+		ret = follower->funcs->panel_enabled(follower);
+		if (ret < 0)
+			dev_info(panel->dev, "%ps failed: %d\n",
+				 follower->funcs->panel_enabled, ret);
+	}
 
 	mutex_unlock(&panel->follower_lock);
 
@@ -587,7 +631,8 @@ EXPORT_SYMBOL(drm_panel_add_follower);
  * @follower:     The panel follower descriptor for the follower.
  *
  * Undo drm_panel_add_follower(). This includes calling the follower's
- * unprepare function if we're removed from a panel that's currently prepared.
+ * unpreparing/disabling function if we're removed from a panel that's currently
+ * prepared/enabled.
  *
  * Return: 0 or an error code.
  */
@@ -598,7 +643,13 @@ void drm_panel_remove_follower(struct drm_panel_follower *follower)
 
 	mutex_lock(&panel->follower_lock);
 
-	if (panel->prepared) {
+	if (panel->enabled && follower->funcs->panel_disabling) {
+		ret = follower->funcs->panel_disabling(follower);
+		if (ret < 0)
+			dev_info(panel->dev, "%ps failed: %d\n",
+				 follower->funcs->panel_disabling, ret);
+	}
+	if (panel->prepared && follower->funcs->panel_unpreparing) {
 		ret = follower->funcs->panel_unpreparing(follower);
 		if (ret < 0)
 			dev_info(panel->dev, "%ps failed: %d\n",
diff --git a/include/drm/drm_panel.h b/include/drm/drm_panel.h
index 843fb756a2950..2407bfa60236f 100644
--- a/include/drm/drm_panel.h
+++ b/include/drm/drm_panel.h
@@ -160,6 +160,20 @@ struct drm_panel_follower_funcs {
 	 * Called before the panel is powered off.
 	 */
 	int (*panel_unpreparing)(struct drm_panel_follower *follower);
+
+	/**
+	 * @panel_enabled:
+	 *
+	 * Called after the panel and the backlight have been enabled.
+	 */
+	int (*panel_enabled)(struct drm_panel_follower *follower);
+
+	/**
+	 * @panel_disabling:
+	 *
+	 * Called before the panel and the backlight are disabled.
+	 */
+	int (*panel_disabling)(struct drm_panel_follower *follower);
 };
 
 struct drm_panel_follower {
-- 
2.51.0.rc1.163.g2494970778-goog


