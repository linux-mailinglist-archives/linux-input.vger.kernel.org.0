Return-Path: <linux-input+bounces-13733-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F2381B16F41
	for <lists+linux-input@lfdr.de>; Thu, 31 Jul 2025 12:13:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 075D17A2237
	for <lists+linux-input@lfdr.de>; Thu, 31 Jul 2025 10:12:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B771321A92F;
	Thu, 31 Jul 2025 10:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="S8FeTuc/"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C6A22A8C1
	for <linux-input@vger.kernel.org>; Thu, 31 Jul 2025 10:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753956832; cv=none; b=UchoQ7hFN3SS5quoCLa5xvdYWsywrxFr/MFz4jPmRNNxpTS7OEIvEx2j24ZMgQ8jkzNxMZegipZzn1rLvxaETKQoZUpthQjkgji3AjpPxH6CngWkYtborSIlKfjQejR4qzQ6Gk/Kb5r1n+sERZyt4ExVMnLR280w+f9HxdC8+dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753956832; c=relaxed/simple;
	bh=FnmfPNbVNSQFPhdxV9B7rJzmlGCSDcTpQmOmxfgDpxo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gZGegRxXuZIat75ygm0TC7KmMaRtieamgeVf6FsePeRGdNMQNIYwahcQnFjM6F74BhvmaQX8iyOe7JCY0S3RN763MYPR4NKyJcqkwm1iE66blFrhhnqMBq9/CA9XPQQzoMWpQHPc/wfEaTgbjlKrMqHn4DRWXoCM5u2kdJI+Ra0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=S8FeTuc/; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-76858e9e48aso179851b3a.2
        for <linux-input@vger.kernel.org>; Thu, 31 Jul 2025 03:13:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1753956830; x=1754561630; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tUEg3xcJ3jba8hnyoRSpTU/LFqclls7jlqdJpvyla9c=;
        b=S8FeTuc/HZZtFC+IU7ufAZ5rFK1NZJuejDtSfJEe7B/cWAkeT+DoW6BLJkEE+FYFKc
         ymHSWDszF8ngexBExRqp12+PUZG1tgR0JBSvt+bBkdv4IYHhIYaHmSMaMSpndv9RQblG
         q3/+Uos3SZx5CCnvAanSqls16tEqpL/6wd3NY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753956830; x=1754561630;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tUEg3xcJ3jba8hnyoRSpTU/LFqclls7jlqdJpvyla9c=;
        b=U/CjsENTZwr+6+vVMjbjDXaNUl1L6FTiUj4HbAgql1LKmdGBkKYRb7Dq5HR5tKUiG0
         eIemSbHCoCBA/txaEhqoDMPOZzRg1mgNT+8aL3QwQpTZTZb5KMSD2S5kp+4cJgBFQKSg
         TFxraqP9/jSrNhepv3lh8MicBX+wlNdRnatH6FGLcILRPEsAoxhke+gxWWTb3ZfSwVLm
         njY8UlF2538pUxWu9k2aV3aYM3rWsdQAj7fQf5fLl6v1QXeC4QCioJDziHaoZqNKvMy8
         a9KWe0RNk1/Dn1sjoBwzEdvGJ3XJQHnqAN4vvJnEbCVRgh8MLgfuwEVZ6xQyBiErYu7j
         asRg==
X-Forwarded-Encrypted: i=1; AJvYcCVjTz9f+oiolFspPjezJ+agevMjTgcR1XnsQkt6mtot8HpRpi6ziuszrZMa8eG8pynlJXQBjiqSe7gr+g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyXbVmohv2NSJ5BBrpbH+k6erNcDkMb8NOSLLGsVBcx3m1rmxsl
	5uZBCEm6V0oFPVKeKkMVzv+6PlEu9qRplW71gNoz0rgLC/ODbRs8gfVSn4FwNh85pQ==
X-Gm-Gg: ASbGncvDmK48Pwuvct737qWnrGa4GXGMjMCz98jGcrof8HayPiyAw86ke0Qy5X7A/Vg
	9i8btExS2v6Ks0697KHljnsGLiZLzX1D6LHN0t57DKEt4q2bCSGtfh6cg8JyRNCz60LSTq1JTxx
	k5kx4Pb2LZt0uIknL6+WwH2dFYX9roS+nINrHrhTmZ52E4TGMV5zrgASsxblrEl60CQTCpb5JrC
	xuKl9ZgdFtHzM9EnkXVBRYUqVlK3RDB9YaMQDB9lJG6OLGxy4DdzywuxIOlYpYsYtVChz0rOSUd
	RVHd4OFuoPg8FbIOq+yLL2bQtm6r/YneWxotyEI75djkWZpbQVz78kHEtzRHe1pc7BLSMqvNLx/
	3AiVvEKff1C/edCJygcRpfHBuMGPWs/LlQ48oJ1imWdw=
X-Google-Smtp-Source: AGHT+IFZAlHN/nIouijHXQyWsOYKKyTBnU+4hjJh++C618HZ1kK7LQSmICyL09/nAo527xH1aNU/Dw==
X-Received: by 2002:a05:6a20:7d9a:b0:238:3f54:78ec with SMTP id adf61e73a8af0-23dc0f6348emr10936788637.46.1753956830368;
        Thu, 31 Jul 2025 03:13:50 -0700 (PDT)
Received: from treapking.tpe.corp.google.com ([2401:fa00:1:10:8177:f5a7:88a1:4ed9])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76bcce6f5f5sm1229265b3a.10.2025.07.31.03.13.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Jul 2025 03:13:50 -0700 (PDT)
From: Pin-Yen Lin <treapking@chromium.org>
X-Google-Original-From: Pin-Yen Lin <treapking@google.com>
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
	linux-input@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	dri-devel@lists.freedesktop.org,
	Chen-Yu Tsai <wenst@chromium.org>,
	Pin-Yen Lin <treapking@google.com>
Subject: [PATCH 1/2] drm/panel: Allow powering on panel follower after panel is enabled
Date: Thu, 31 Jul 2025 18:13:14 +0800
Message-ID: <20250731101344.2761757-1-treapking@google.com>
X-Mailer: git-send-email 2.50.1.552.g942d659e1b-goog
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some touch controllers have to be powered on after the panel's backlight
is enabled. To support these controllers, introduce after_panel_enabled
flag to the panel follower and power on the device after the panel and
its backlight are enabled.

Signed-off-by: Pin-Yen Lin <treapking@google.com>
---

 drivers/gpu/drm/drm_panel.c | 47 +++++++++++++++++++++++++++++++++----
 include/drm/drm_panel.h     |  8 +++++++
 2 files changed, 51 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_panel.c b/drivers/gpu/drm/drm_panel.c
index 650de4da08537..58125f8418f37 100644
--- a/drivers/gpu/drm/drm_panel.c
+++ b/drivers/gpu/drm/drm_panel.c
@@ -133,6 +133,9 @@ void drm_panel_prepare(struct drm_panel *panel)
 	panel->prepared = true;
 
 	list_for_each_entry(follower, &panel->followers, list) {
+		if (follower->after_panel_enabled)
+			continue;
+
 		ret = follower->funcs->panel_prepared(follower);
 		if (ret < 0)
 			dev_info(panel->dev, "%ps failed: %d\n",
@@ -178,6 +181,9 @@ void drm_panel_unprepare(struct drm_panel *panel)
 	mutex_lock(&panel->follower_lock);
 
 	list_for_each_entry(follower, &panel->followers, list) {
+		if (follower->after_panel_enabled)
+			continue;
+
 		ret = follower->funcs->panel_unpreparing(follower);
 		if (ret < 0)
 			dev_info(panel->dev, "%ps failed: %d\n",
@@ -208,6 +214,7 @@ EXPORT_SYMBOL(drm_panel_unprepare);
  */
 void drm_panel_enable(struct drm_panel *panel)
 {
+	struct drm_panel_follower *follower;
 	int ret;
 
 	if (!panel)
@@ -218,10 +225,12 @@ void drm_panel_enable(struct drm_panel *panel)
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
 
@@ -229,6 +238,18 @@ void drm_panel_enable(struct drm_panel *panel)
 	if (ret < 0)
 		DRM_DEV_INFO(panel->dev, "failed to enable backlight: %d\n",
 			     ret);
+
+	list_for_each_entry(follower, &panel->followers, list) {
+		if (!follower->after_panel_enabled)
+			continue;
+
+		ret = follower->funcs->panel_prepared(follower);
+		if (ret < 0)
+			dev_info(panel->dev, "%ps failed: %d\n",
+				 follower->funcs->panel_prepared, ret);
+	}
+exit:
+	mutex_unlock(&panel->follower_lock);
 }
 EXPORT_SYMBOL(drm_panel_enable);
 
@@ -242,6 +263,7 @@ EXPORT_SYMBOL(drm_panel_enable);
  */
 void drm_panel_disable(struct drm_panel *panel)
 {
+	struct drm_panel_follower *follower;
 	int ret;
 
 	if (!panel)
@@ -261,6 +283,18 @@ void drm_panel_disable(struct drm_panel *panel)
 		return;
 	}
 
+	mutex_lock(&panel->follower_lock);
+
+	list_for_each_entry(follower, &panel->followers, list) {
+		if (!follower->after_panel_enabled)
+			continue;
+
+		ret = follower->funcs->panel_unpreparing(follower);
+		if (ret < 0)
+			dev_info(panel->dev, "%ps failed: %d\n",
+				 follower->funcs->panel_unpreparing, ret);
+	}
+
 	ret = backlight_disable(panel->backlight);
 	if (ret < 0)
 		DRM_DEV_INFO(panel->dev, "failed to disable backlight: %d\n",
@@ -269,9 +303,12 @@ void drm_panel_disable(struct drm_panel *panel)
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
 
@@ -537,7 +574,8 @@ int drm_panel_add_follower(struct device *follower_dev,
 	mutex_lock(&panel->follower_lock);
 
 	list_add_tail(&follower->list, &panel->followers);
-	if (panel->prepared) {
+	if ((panel->prepared && !follower->after_panel_enabled) ||
+	    (panel->enabled && follower->after_panel_enabled)) {
 		ret = follower->funcs->panel_prepared(follower);
 		if (ret < 0)
 			dev_info(panel->dev, "%ps failed: %d\n",
@@ -566,7 +604,8 @@ void drm_panel_remove_follower(struct drm_panel_follower *follower)
 
 	mutex_lock(&panel->follower_lock);
 
-	if (panel->prepared) {
+	if ((panel->prepared && !follower->after_panel_enabled) ||
+	    (panel->enabled && follower->after_panel_enabled)) {
 		ret = follower->funcs->panel_unpreparing(follower);
 		if (ret < 0)
 			dev_info(panel->dev, "%ps failed: %d\n",
diff --git a/include/drm/drm_panel.h b/include/drm/drm_panel.h
index 843fb756a2950..aa9b6218702fd 100644
--- a/include/drm/drm_panel.h
+++ b/include/drm/drm_panel.h
@@ -183,6 +183,14 @@ struct drm_panel_follower {
 	 * The panel we're dependent on; set by drm_panel_add_follower().
 	 */
 	struct drm_panel *panel;
+
+	/**
+	 * @after_panel_enabled
+	 *
+	 * If true then this panel follower should be powered after the panel
+	 * and the backlight are enabled, instead of after panel is prepared.
+	 */
+	bool after_panel_enabled;
 };
 
 /**
-- 
2.50.1.552.g942d659e1b-goog


