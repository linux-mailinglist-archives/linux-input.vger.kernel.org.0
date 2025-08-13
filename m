Return-Path: <linux-input+bounces-13971-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 97E6AB249D8
	for <lists+linux-input@lfdr.de>; Wed, 13 Aug 2025 14:53:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9F91B5A0E86
	for <lists+linux-input@lfdr.de>; Wed, 13 Aug 2025 12:51:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A37CE272802;
	Wed, 13 Aug 2025 12:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="FHoaliMj"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC97915A87C
	for <linux-input@vger.kernel.org>; Wed, 13 Aug 2025 12:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755089503; cv=none; b=HYWZN4SrCKmyBoFGYCFVA161UjVM+PaATvSsY+85KBzDpc0sPiRwM3SUQCY0dn7tabvLLeVIp8HgBhd+oWSQ8dwLXfoZRM0E1y+OPa3hJ5fyX3qFLtuMYKXsbaUA0tDIdBVx3bGUmvn0a1Xs2n35ytBV2BA1XN+tgNpM2mgfCwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755089503; c=relaxed/simple;
	bh=HjraFinK8S+wxCrFTQ7qGhdHuAkjg13+OfaV22qEhNE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gFbsyDBNZY+BEP8gxaK+T5+IidVRLhqFLp0hibK4O/F9kxQxuIYA86GfoEEz1RN8LsOD4KbzxR1aB0Ouzw49CM7F8SXyW0voi19Eaw698gbGbHyEL4OnTPeNmNYvzz5EtwRJrdbKG1awRwTj5rR/RdAMRXgc6UOqoSngpyNVSOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=FHoaliMj; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-76bc68cc9e4so6677791b3a.2
        for <linux-input@vger.kernel.org>; Wed, 13 Aug 2025 05:51:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1755089501; x=1755694301; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OaCY6QygZSY7gwTjhsexWl1g6lEhtuzBso3q62sP80I=;
        b=FHoaliMjf41VU5hZTgGiLNMvQrqFvSpHRQSwaHAShXiAK+5I6yOfFboMU5Eqi/mR9c
         pmK3v7kdBK4e03WdUU1xE2o10xq4BIa4Vuh/7QRuCHoAiCpzYAfxjrq9LLacWG5/Vzen
         uE00//CNQsbGwg3fUDgOd4F7ziUDRLLtHCvGw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755089501; x=1755694301;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OaCY6QygZSY7gwTjhsexWl1g6lEhtuzBso3q62sP80I=;
        b=onDl6TXLx9p/AlfNhF8VkVQduZBuY6bq76TQzLaLjJjc1JlJrFxuqOYjmIoJzjHqRN
         hqfubdmQg725E5SeB3LNg2DGIUVWdyMzS1AfXZyoh9a/DE7BSyL3lp3BzFa7MrzPoeAT
         TpDTt4URXULudQ/bUJrebaKeSPd1X4ZIe9BqRjNbGtmWGwX9U2FPbASuK5aHlj1ekc5l
         gV3zuEagH9Pg/xu8du3jYWduoLI5KOOc6zOj0HL+Mi/imKt7735Lpkc9DSaKNhCafTby
         txBkG8MY6dCi2YgNNSKaxBFaHBEAwcKTFV5S6bHnQULFlfRRs4Lco33TJhEXqfnCRLn5
         1e7Q==
X-Forwarded-Encrypted: i=1; AJvYcCWuL35Mtb0IOKbRwfMOPNARQN5QauEilCiuN+Q1U7c2K8NgVX2iDXrvfYJjemzpY02SYcuePdKsXlvKcA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzNgbC2YXu5OTHK95h6Cko0W47UVO1wjTj0UbBBtXOCfP+aH9/k
	x5x4mVbV06k7kbGzh0NAacKYX7cZI+KVvpeaQM3RzUmyZ1caDm3bqL+sR+/Dzbo2uQ==
X-Gm-Gg: ASbGncvnGB+KbSg6mXozgByJazER5ki96yYYr8g9KMmGba9IHdTiPksNOENW4l5ZB/s
	YwF00Nm6lnesURo4m37gdo8KQCD8AgcudbguI16e5jgCYhe5Ua+HM6zuK6EphCSbUqZZ88k1Eqe
	DHU+qC6xCK+ke1qrYsEGrL86YuYwZRlXsLVXr7qaqltpKu81yMRuM7TVdSzSAmhqkZA1gDqbQGb
	rWn0lTWZm5huOuQOMvotn4+YHsp+jRe7pks/GIWRrL7aH+gG3ZSy7/7vGKTx2isZnSxOPOUBUST
	O1JHFzpv0moLxPHS7D9YfnHuOENOSicyziRdJ+Da/USr1r8DNkNlVBbAHT3XmEraohtNb7t6Yfv
	q/HvOZP97fYNaouHimTac13iTdJhv0YfU7ZRfboZGJjkySNIVLEVZiwHu
X-Google-Smtp-Source: AGHT+IHvOWzR+m64NjcSp9Sio+ZwCY5wgCmmRripn14ZHanao1N4GJSYFMYpw0majecA30pcR6AfLQ==
X-Received: by 2002:a05:6a20:7f96:b0:233:4862:753a with SMTP id adf61e73a8af0-240a889f530mr5133358637.0.1755089501234;
        Wed, 13 Aug 2025 05:51:41 -0700 (PDT)
Received: from treapking.tpe.corp.google.com ([2401:fa00:1:10:99fd:826e:7963:bbb0])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b470fd547d0sm740613a12.4.2025.08.13.05.51.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 05:51:40 -0700 (PDT)
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
Cc: dri-devel@lists.freedesktop.org,
	Douglas Anderson <dianders@chromium.org>,
	linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org,
	Chen-Yu Tsai <wenst@chromium.org>,
	Pin-yen Lin <treapking@chromium.org>
Subject: [PATCH v2 1/2] drm/panel: Allow powering on panel follower after panel is enabled
Date: Wed, 13 Aug 2025 20:51:24 +0800
Message-ID: <20250813125132.1319482-1-treapking@chromium.org>
X-Mailer: git-send-email 2.51.0.rc0.205.g4a044479a3-goog
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

Changes in v2:
- Replace after_panel_enabled flag with enabled/disabling callbacks

 drivers/gpu/drm/drm_panel.c | 57 ++++++++++++++++++++++++++++++++++---
 include/drm/drm_panel.h     | 14 +++++++++
 2 files changed, 67 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_panel.c b/drivers/gpu/drm/drm_panel.c
index c8bb28dccdc1b..e3682c22c4dd2 100644
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
 
@@ -230,6 +239,18 @@ void drm_panel_enable(struct drm_panel *panel)
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
+exit:
+	mutex_unlock(&panel->follower_lock);
 }
 EXPORT_SYMBOL(drm_panel_enable);
 
@@ -243,6 +264,7 @@ EXPORT_SYMBOL(drm_panel_enable);
  */
 void drm_panel_disable(struct drm_panel *panel)
 {
+	struct drm_panel_follower *follower;
 	int ret;
 
 	if (!panel)
@@ -262,6 +284,18 @@ void drm_panel_disable(struct drm_panel *panel)
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
@@ -270,9 +304,12 @@ void drm_panel_disable(struct drm_panel *panel)
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
 
@@ -569,12 +606,18 @@ int drm_panel_add_follower(struct device *follower_dev,
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
 
@@ -598,12 +641,18 @@ void drm_panel_remove_follower(struct drm_panel_follower *follower)
 
 	mutex_lock(&panel->follower_lock);
 
-	if (panel->prepared) {
+	if (panel->prepared && follower->funcs->panel_unpreparing) {
 		ret = follower->funcs->panel_unpreparing(follower);
 		if (ret < 0)
 			dev_info(panel->dev, "%ps failed: %d\n",
 				 follower->funcs->panel_unpreparing, ret);
 	}
+	if (panel->enabled && follower->funcs->panel_disabling) {
+		ret = follower->funcs->panel_disabling(follower);
+		if (ret < 0)
+			dev_info(panel->dev, "%ps failed: %d\n",
+				 follower->funcs->panel_disabling, ret);
+	}
 	list_del_init(&follower->list);
 
 	mutex_unlock(&panel->follower_lock);
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
2.51.0.rc0.205.g4a044479a3-goog


