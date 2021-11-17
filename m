Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6598D4550B8
	for <lists+linux-input@lfdr.de>; Wed, 17 Nov 2021 23:49:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241443AbhKQWwM (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 17 Nov 2021 17:52:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241317AbhKQWwI (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 17 Nov 2021 17:52:08 -0500
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97740C061200
        for <linux-input@vger.kernel.org>; Wed, 17 Nov 2021 14:49:09 -0800 (PST)
Received: by mail-pg1-x533.google.com with SMTP id s138so3543706pgs.4
        for <linux-input@vger.kernel.org>; Wed, 17 Nov 2021 14:49:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PRAN3rr2nPVo3gIjlESQaB8ebBDc+D/e6ANLJIK5y4s=;
        b=BcR+4Lz3vAnsR3uoPEuqtYS/bHo6Vvi8O1qPuLresu/Y5qW84EQaQdowja+Qzu250b
         EL34dpX72GmpldCBF3QbRbZO4y2+Yjdxv/nvbFhKVNffI+7PUmwqBHafNjTlbfq3EbfP
         2ymP/ibAW7xVQ6UT2l2HanNP+pWtwU6rygk5I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PRAN3rr2nPVo3gIjlESQaB8ebBDc+D/e6ANLJIK5y4s=;
        b=40Ulyj28lwVUVcHLT0cES/ssTR8SjsPOffGBZJ11RR4Ok5OyJwMDM3yLKEEJTuvGRW
         HsC+Yco5+5NaJXpVo5czeOUtH3vt098jr3/Gn4CBqAN8qPBsQNeHFxwN+aoL5GsP1tBh
         50A97wxmS9aLYy6m9gkMKxk8KrhSBUh2aA1D+R5GTLWqUqQg6Si+Ls29n8wb6aWYewdG
         A8Guetxpa1+IOKA7w+xYNKXrJyulhL80SgL63IYK2NlQoalrEkHZkFjZQNjjnLWv6Uv+
         2JFF2HREBsRFGWtkMMn/QtYmSRKgDMPbHYFF12pHNiD0uuhZto4Ck6pGFUs2LU0xB/yF
         7abw==
X-Gm-Message-State: AOAM531PxyIuDcuiMSj5b4hCOqcSPsRq7k5tyUgVSJ0B0GCilfNE4UD8
        xiATto+G65yAStQ8ZWOpDS7dcQ==
X-Google-Smtp-Source: ABdhPJxaitq98GLKg68E2jnoQ7v3i9kV5Qhy51dVJ9vt8oTBXNj7KdRjTAyA98irH+itT7XU42Xz5Q==
X-Received: by 2002:a05:6a00:10c5:b0:49f:de2c:1b23 with SMTP id d5-20020a056a0010c500b0049fde2c1b23mr10358091pfu.41.1637189348986;
        Wed, 17 Nov 2021 14:49:08 -0800 (PST)
Received: from localhost ([2620:15c:202:201:896b:df38:4eae:c568])
        by smtp.gmail.com with UTF8SMTPSA id h8sm702003pfh.10.2021.11.17.14.49.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Nov 2021 14:49:08 -0800 (PST)
From:   Brian Norris <briannorris@chromium.org>
To:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
Cc:     "Kristian H . Kristensen" <hoegsberg@google.com>,
        linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Doug Anderson <dianders@chromium.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Rob Clark <robdclark@gmail.com>, linux-input@vger.kernel.org,
        Rob Clark <robdclark@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        dri-devel@lists.freedesktop.org,
        Brian Norris <briannorris@chromium.org>
Subject: [PATCH v2 2/2] drm/self_refresh: Disable self-refresh on input events
Date:   Wed, 17 Nov 2021 14:48:41 -0800
Message-Id: <20211117144807.v2.2.Ie6c485320b35b89fd49e15a73f0a68e3bb49eef9@changeid>
X-Mailer: git-send-email 2.34.0.rc1.387.gb447b232ab-goog
In-Reply-To: <20211117224841.3442482-1-briannorris@chromium.org>
References: <20211117224841.3442482-1-briannorris@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

To improve panel self-refresh exit latency, we speculatively start
exiting when we
receive input events. Occasionally, this may lead to false positives,
but most of the time we get a head start on coming out of PSR. Depending
on how userspace takes to produce a new frame in response to the event,
this can completely hide the exit latency.

In local tests on Chrome OS (Rockchip RK3399 eDP), we've found that the
input notifier gives us about a 50ms head start over the
fb-update-initiated exit.

Leverage a new drm_input_helper library to get easy access to
likely-relevant input event callbacks.

Inspired-by: Kristian H. Kristensen <hoegsberg@google.com>
Signed-off-by: Brian Norris <briannorris@chromium.org>
---
This was in part picked up from:

  https://lore.kernel.org/all/20180405095000.9756-25-enric.balletbo@collabora.com/
  [PATCH v6 24/30] drm/rockchip: Disable PSR on input events

with significant rewrites/reworks:

 - moved to common drm_input_helper and drm_self_refresh_helper
   implementation
 - track state only through crtc->state->self_refresh_active

Note that I'm relatively unfamiliar with DRM locking expectations, but I
believe access to drm_crtc->state (which helps us track redundant
transitions) is OK under the locking provided by
drm_atomic_get_crtc_state().

Changes in v2:
 - Delay PSR re-entry, when already disabled
 - Allow default configuration via Kconfig and modparam
 - Replace void* with container_of()

 drivers/gpu/drm/Kconfig                   | 16 ++++
 drivers/gpu/drm/drm_self_refresh_helper.c | 98 +++++++++++++++++++----
 2 files changed, 100 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 381476b10a9d..698924ed9b6b 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -84,6 +84,22 @@ config DRM_INPUT_HELPER
 	depends on DRM_KMS_HELPER
 	depends on INPUT
 
+config DRM_SELF_REFRESH_INPUT_BOOST_DEFAULT
+	bool "Preemptively exit panel self-refresh on input device activity" if EXPERT
+	default y
+	depends on DRM_INPUT_HELPER
+	help
+	  Allows the generic DRM panel self-refresh helpers to factor in user
+	  input activity to preemptively exit panel self-refresh, in order to
+	  reduce potentially-visible latency when displaying new display
+	  content. This is an optimization which often will do the right thing,
+	  but can be disabled for experimentation or similar.
+
+	  Saying Y enables the feature by default; this can also be configured
+	  by module parameter, drm_kms_helper.self_refresh_input_boost.
+
+	  If in doubt, say "Y".
+
 config DRM_KMS_HELPER
 	tristate
 	depends on DRM
diff --git a/drivers/gpu/drm/drm_self_refresh_helper.c b/drivers/gpu/drm/drm_self_refresh_helper.c
index dd33fec5aabd..ba4881e683b7 100644
--- a/drivers/gpu/drm/drm_self_refresh_helper.c
+++ b/drivers/gpu/drm/drm_self_refresh_helper.c
@@ -8,6 +8,7 @@
 #include <linux/average.h>
 #include <linux/bitops.h>
 #include <linux/slab.h>
+#include <linux/stringify.h>
 #include <linux/workqueue.h>
 
 #include <drm/drm_atomic.h>
@@ -15,6 +16,7 @@
 #include <drm/drm_connector.h>
 #include <drm/drm_crtc.h>
 #include <drm/drm_device.h>
+#include <drm/drm_input_helper.h>
 #include <drm/drm_mode_config.h>
 #include <drm/drm_modeset_lock.h>
 #include <drm/drm_print.h>
@@ -58,17 +60,41 @@ DECLARE_EWMA(psr_time, 4, 4)
 struct drm_self_refresh_data {
 	struct drm_crtc *crtc;
 	struct delayed_work entry_work;
+	struct work_struct exit_work;
+	struct drm_input_handler input_handler;
+	bool input_handler_registered;
 
 	struct mutex avg_mutex;
 	struct ewma_psr_time entry_avg_ms;
 	struct ewma_psr_time exit_avg_ms;
 };
 
-static void drm_self_refresh_helper_entry_work(struct work_struct *work)
+static bool self_refresh_input_boost =
+	IS_ENABLED(CONFIG_DRM_SELF_REFRESH_INPUT_BOOST_DEFAULT);
+#if defined(CONFIG_DRM_INPUT_HELPER)
+module_param(self_refresh_input_boost, bool, 0644);
+MODULE_PARM_DESC(self_refresh_input_boost,
+		 "Enable panel self-refresh input boost [default="
+		 __stringify(CONFIG_DRM_SELF_REFRESH_INPUT_BOOST_DEFAULT) "]");
+#endif /* CONFIG_DRM_INPUT_HELPER */
+
+
+static void drm_self_refresh_reschedule(struct drm_self_refresh_data *sr_data)
+{
+	unsigned int delay;
+
+	mutex_lock(&sr_data->avg_mutex);
+	delay = (ewma_psr_time_read(&sr_data->entry_avg_ms) +
+		 ewma_psr_time_read(&sr_data->exit_avg_ms)) * 2;
+	mutex_unlock(&sr_data->avg_mutex);
+
+	mod_delayed_work(system_wq, &sr_data->entry_work,
+			 msecs_to_jiffies(delay));
+}
+
+static void drm_self_refresh_transition(struct drm_self_refresh_data *sr_data,
+					bool enable)
 {
-	struct drm_self_refresh_data *sr_data = container_of(
-				to_delayed_work(work),
-				struct drm_self_refresh_data, entry_work);
 	struct drm_crtc *crtc = sr_data->crtc;
 	struct drm_device *dev = crtc->dev;
 	struct drm_modeset_acquire_ctx ctx;
@@ -95,6 +121,14 @@ static void drm_self_refresh_helper_entry_work(struct work_struct *work)
 		goto out;
 	}
 
+	if (crtc->state->self_refresh_active == enable) {
+		/* Exiting SR; delay re-entry for at least one more cycle. */
+		if (!enable)
+			drm_self_refresh_reschedule(sr_data);
+
+		goto out;
+	}
+
 	if (!crtc_state->enable)
 		goto out;
 
@@ -107,8 +141,8 @@ static void drm_self_refresh_helper_entry_work(struct work_struct *work)
 			goto out;
 	}
 
-	crtc_state->active = false;
-	crtc_state->self_refresh_active = true;
+	crtc_state->active = !enable;
+	crtc_state->self_refresh_active = enable;
 
 	ret = drm_atomic_commit(state);
 	if (ret)
@@ -129,6 +163,15 @@ static void drm_self_refresh_helper_entry_work(struct work_struct *work)
 	drm_modeset_acquire_fini(&ctx);
 }
 
+static void drm_self_refresh_helper_entry_work(struct work_struct *work)
+{
+	struct drm_self_refresh_data *sr_data = container_of(
+				to_delayed_work(work),
+				struct drm_self_refresh_data, entry_work);
+
+	drm_self_refresh_transition(sr_data, true);
+}
+
 /**
  * drm_self_refresh_helper_update_avg_times - Updates a crtc's SR time averages
  * @state: the state which has just been applied to hardware
@@ -202,7 +245,6 @@ void drm_self_refresh_helper_alter_state(struct drm_atomic_state *state)
 
 	for_each_new_crtc_in_state(state, crtc, crtc_state, i) {
 		struct drm_self_refresh_data *sr_data;
-		unsigned int delay;
 
 		/* Don't trigger the entry timer when we're already in SR */
 		if (crtc_state->self_refresh_active)
@@ -212,17 +254,26 @@ void drm_self_refresh_helper_alter_state(struct drm_atomic_state *state)
 		if (!sr_data)
 			continue;
 
-		mutex_lock(&sr_data->avg_mutex);
-		delay = (ewma_psr_time_read(&sr_data->entry_avg_ms) +
-			 ewma_psr_time_read(&sr_data->exit_avg_ms)) * 2;
-		mutex_unlock(&sr_data->avg_mutex);
-
-		mod_delayed_work(system_wq, &sr_data->entry_work,
-				 msecs_to_jiffies(delay));
+		drm_self_refresh_reschedule(sr_data);
 	}
 }
 EXPORT_SYMBOL(drm_self_refresh_helper_alter_state);
 
+static void drm_self_refresh_helper_exit_work(struct work_struct *work)
+{
+	struct drm_self_refresh_data *sr_data = container_of(
+			work, struct drm_self_refresh_data, exit_work);
+
+	drm_self_refresh_transition(sr_data, false);
+}
+
+static void drm_self_refresh_input_event(struct drm_input_handler *handler)
+{
+	struct drm_self_refresh_data *sr_data = container_of(
+			handler, struct drm_self_refresh_data, input_handler);
+
+	schedule_work(&sr_data->exit_work);
+}
 /**
  * drm_self_refresh_helper_init - Initializes self refresh helpers for a crtc
  * @crtc: the crtc which supports self refresh supported displays
@@ -232,6 +283,7 @@ EXPORT_SYMBOL(drm_self_refresh_helper_alter_state);
 int drm_self_refresh_helper_init(struct drm_crtc *crtc)
 {
 	struct drm_self_refresh_data *sr_data = crtc->self_refresh_data;
+	int ret;
 
 	/* Helper is already initialized */
 	if (WARN_ON(sr_data))
@@ -243,6 +295,7 @@ int drm_self_refresh_helper_init(struct drm_crtc *crtc)
 
 	INIT_DELAYED_WORK(&sr_data->entry_work,
 			  drm_self_refresh_helper_entry_work);
+	INIT_WORK(&sr_data->exit_work, drm_self_refresh_helper_exit_work);
 	sr_data->crtc = crtc;
 	mutex_init(&sr_data->avg_mutex);
 	ewma_psr_time_init(&sr_data->entry_avg_ms);
@@ -256,8 +309,22 @@ int drm_self_refresh_helper_init(struct drm_crtc *crtc)
 	ewma_psr_time_add(&sr_data->entry_avg_ms, SELF_REFRESH_AVG_SEED_MS);
 	ewma_psr_time_add(&sr_data->exit_avg_ms, SELF_REFRESH_AVG_SEED_MS);
 
+	if (self_refresh_input_boost) {
+		sr_data->input_handler.callback = drm_self_refresh_input_event;
+		ret = drm_input_handle_register(crtc->dev,
+						&sr_data->input_handler);
+		if (ret)
+			goto err;
+		sr_data->input_handler_registered = true;
+	}
+
 	crtc->self_refresh_data = sr_data;
+
 	return 0;
+
+err:
+	kfree(sr_data);
+	return ret;
 }
 EXPORT_SYMBOL(drm_self_refresh_helper_init);
 
@@ -275,7 +342,10 @@ void drm_self_refresh_helper_cleanup(struct drm_crtc *crtc)
 
 	crtc->self_refresh_data = NULL;
 
+	if (sr_data->input_handler_registered)
+		drm_input_handle_unregister(&sr_data->input_handler);
 	cancel_delayed_work_sync(&sr_data->entry_work);
+	cancel_work_sync(&sr_data->exit_work);
 	kfree(sr_data);
 }
 EXPORT_SYMBOL(drm_self_refresh_helper_cleanup);
-- 
2.34.0.rc1.387.gb447b232ab-goog

