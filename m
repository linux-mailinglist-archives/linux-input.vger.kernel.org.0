Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2B26A762375
	for <lists+linux-input@lfdr.de>; Tue, 25 Jul 2023 22:37:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231149AbjGYUhJ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 25 Jul 2023 16:37:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231195AbjGYUhG (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 25 Jul 2023 16:37:06 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A99821BFF
        for <linux-input@vger.kernel.org>; Tue, 25 Jul 2023 13:37:02 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-26814f65d7fso1338370a91.0
        for <linux-input@vger.kernel.org>; Tue, 25 Jul 2023 13:37:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1690317422; x=1690922222;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=df8uPWWKgNUJNGqmzE4JLwOSLgI3EOexaoTRxYQ2qW0=;
        b=euQ1y1eLLNbwUWa7hQ4JpJoVBvc7HkJwBCYVUNIdu0ZtCaRRUsWWjo8I3ugR7b7s2J
         NXU/kDcTyLZqp57G70Q9vDfqVZ7mSCBQCjbgayS2CXGcavEGibZjpxrX9J5vVHZe3z0e
         DmTbIoTmq5RWLSwBEpu9qYhe6eUQJvu0V4J6w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690317422; x=1690922222;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=df8uPWWKgNUJNGqmzE4JLwOSLgI3EOexaoTRxYQ2qW0=;
        b=Jl+ApCvZK/bYa0+acsyXWIZkfDZl7kQdgIt1tpzmYGh8BiYUtzvyyQn8b2FSV7Zusl
         MbVUNh8lU4g59NDg7P4w62V+kN7b8pX/9DQYXM+DKqctM6oSGI5wFPLOYADZKJEbsp7F
         hqLeQbCq0SnZUzOwYAs4OMoBKeKxS1zaAAv43aGHP7Wku31inQpHqD5KxVD5K6yv4YqP
         arc6GvmW4UegRqkGxlp4F9BisBBufT+b3kSIKYJEPb3jxbegTKPSdx94lFi5w/XI+Ne0
         dI/ZnU4Mf1O08GkSl22dZsJdxlNCKPQUIbhOVFDBiGeoZYbnr0OcaRKLs4oeE91q4WUY
         Z9Pw==
X-Gm-Message-State: ABy/qLZWN9+vkU1EER732VlM9+e35KrrXmDx8JMYv4yO3RaE+C6b2L9K
        NbOTAm/wF6SDplRwoqki0sIfvw==
X-Google-Smtp-Source: APBJJlF3xUd0ARTsRpabDeEseTYSN4MKt938MMdpUlhTVTcqP3CRpZTXQo0sTusSb24DTfa6NLQ6fg==
X-Received: by 2002:a17:90a:f191:b0:268:a26:d9ee with SMTP id bv17-20020a17090af19100b002680a26d9eemr196450pjb.46.1690317421952;
        Tue, 25 Jul 2023 13:37:01 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:9d:2:c363:4681:f5b8:301])
        by smtp.gmail.com with ESMTPSA id bg1-20020a17090b0d8100b002676e961261sm1396951pjb.1.2023.07.25.13.36.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jul 2023 13:37:01 -0700 (PDT)
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
Cc:     cros-qcom-dts-watchers@chromium.org,
        Chris Morgan <macroalpha82@gmail.com>,
        linux-input@vger.kernel.org, hsinyi@google.com,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        devicetree@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
        yangcong5@huaqin.corp-partner.google.com,
        Douglas Anderson <dianders@chromium.org>
Subject: [PATCH v3 03/10] drm/panel: Add a way for other devices to follow panel state
Date:   Tue, 25 Jul 2023 13:34:38 -0700
Message-ID: <20230725133443.v3.3.Icd5f96342d2242051c754364f4bee13ef2b986d4@changeid>
X-Mailer: git-send-email 2.41.0.487.g6d72f3e995-goog
In-Reply-To: <20230725203545.2260506-1-dianders@chromium.org>
References: <20230725203545.2260506-1-dianders@chromium.org>
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

These days, it's fairly common to see panels that have touchscreens
attached to them. The panel and the touchscreen can somewhat be
thought of as totally separate devices and, historically, this is how
Linux has treated them. However, treating them as separate isn't
necessarily the best way to model the two devices, it was just that
there was no better way. Specifically, there is little practical
reason to have the touchscreen powered on when the panel is turned
off, but if we model the devices separately we have no way to keep the
two devices' power states in sync with each other.

The issue described above makes it sound as if the problem here is
just about efficiency. We're wasting power keeping the touchscreen
powered up when the screen is off. While that's true, the problem can
go deeper. Specifically, hardware designers see that there's no reason
to have the touchscreen on while the screen is off and then build
hardware assuming that software would never turn the touchscreen on
while the screen is off.

In the very simplest case of hardware designs like this, the
touchscreen and the panel share some power rails. In most cases, this
turns out not to be terrible and is, again, just a little less
efficient. Specifically if we tell Linux that the touchscreen and the
panel are using the same rails then Linux will keep the rails on when
_either_ device is turned on. That ends to work OK-ish, but now if you
turn the panel off not only will the touchscreen remain powered, but
the power rails for the panel itself won't be switched off, burning
extra power.

The above two inefficiencies are _extra_ minor when you consider the
fact that laptops rarely spend much time with the screen off. The main
use case would be when an external screen (and presumably a power
supply) is attached.

Unfortunately, it gets worse from here. On sc7180-trogdor-homestar,
for instance, the display's TCON (timing controller) sometimes crashes
if you don't power cycle it whenever you stop and restart the video
stream (like during a modeset). The touchscreen keeping the power
rails on causes real problems. One proposal in the homestar timeframe
was to move the touchscreen to an always-on rail, dedicating the main
power rail to the panel. That caused _different_ problems as talked
about in commit 557e05fa9fdd ("HID: i2c-hid: goodix: Stop tying the
reset line to the regulator"). The end result of all of this was to
add an extra regulator to the board, increasing cost.

Recently, Cong Yang posted a patch [1] where things are even worse.
The panel and touch controller on that system seem even more
intimately tied together and really can't be thought of separately.

To address this issue, let's start allowing devices to register
themselves as "panel followers". These devices will get called after a
panel has been powered on and before a panel is powered off. This
makes the panel the primary device in charge of the power state, which
matches how userspace uses it.

The panel follower API should be fairly straightforward to use. The
current code assumes that panel followers are using device tree and
have a "panel" property pointing to the panel to follow. More
flexibility and non-DT implementations could be added as needed.

Right now, panel followers can follow the prepare/unprepare functions.
There could be arguments made that, instead, they should follow
enable/disable. I've chosen prepare/unprepare for now since those
functions are guaranteed to power up/power down the panel and it seems
better to start the process earlier.

A bit of explaining about why this is a roll-your-own API instead of
using something more standard:
1. In standard APIs in Linux, parent devices are automatically powered
   on when a child needs power. Applying that here, it would mean that
   we'd force the panel on any time someone was listening to the
   touchscreen. That, unfortunately, would have broken homestar's need
   (if we hadn't changed the hardware, as per above) where the panel
   absolutely needs to be able to power cycle itself. While one could
   argue that homestar is broken hardware and we shouldn't have the
   API do backflips for it, _officially_ the eDP timing guidelines
   agree with homestar's needs and the panel power sequencing diagrams
   show power going off. It's nice to be able to support this.
2. We could, conceibably, try to add a new flag to device_link causing
   the parent to be in charge of power. Then we could at least use
   normal pm_runtime APIs. This sounds great, except that we run into
   problems with initial probe. As talked about in the later patch
   ("HID: i2c-hid: Support being a panel follower") the initial power
   on of a panel follower might need to do things (like add
   sub-devices) that aren't allowed in a runtime_resume function.

The above complexities explain why this API isn't using common
functions. That being said, this patch is very small and
self-contained, so if someone was later able to adapt it to using more
common APIs while solving the above issues then that could happen in
the future.

[1] https://lore.kernel.org/r/20230519032316.3464732-1-yangcong5@huaqin.corp-partner.google.com

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v3:
- Add is_panel_follower() as a convenience for clients.

Changes in v2:
- Add even more text to the commit message.
- A few comment cleanups.

 drivers/gpu/drm/drm_panel.c | 173 +++++++++++++++++++++++++++++++++++-
 include/drm/drm_panel.h     |  80 +++++++++++++++++
 2 files changed, 249 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_panel.c b/drivers/gpu/drm/drm_panel.c
index 4e1c4e42575b..e814020bbcd3 100644
--- a/drivers/gpu/drm/drm_panel.c
+++ b/drivers/gpu/drm/drm_panel.c
@@ -58,6 +58,8 @@ void drm_panel_init(struct drm_panel *panel, struct device *dev,
 		    const struct drm_panel_funcs *funcs, int connector_type)
 {
 	INIT_LIST_HEAD(&panel->list);
+	INIT_LIST_HEAD(&panel->followers);
+	mutex_init(&panel->follower_lock);
 	panel->dev = dev;
 	panel->funcs = funcs;
 	panel->connector_type = connector_type;
@@ -105,6 +107,7 @@ EXPORT_SYMBOL(drm_panel_remove);
  */
 int drm_panel_prepare(struct drm_panel *panel)
 {
+	struct drm_panel_follower *follower;
 	int ret;
 
 	if (!panel)
@@ -115,14 +118,27 @@ int drm_panel_prepare(struct drm_panel *panel)
 		return 0;
 	}
 
+	mutex_lock(&panel->follower_lock);
+
 	if (panel->funcs && panel->funcs->prepare) {
 		ret = panel->funcs->prepare(panel);
 		if (ret < 0)
-			return ret;
+			goto exit;
 	}
 	panel->prepared = true;
 
-	return 0;
+	list_for_each_entry(follower, &panel->followers, list) {
+		ret = follower->funcs->panel_prepared(follower);
+		if (ret < 0)
+			dev_info(panel->dev, "%ps failed: %d\n",
+				 follower->funcs->panel_prepared, ret);
+	}
+
+	ret = 0;
+exit:
+	mutex_unlock(&panel->follower_lock);
+
+	return ret;
 }
 EXPORT_SYMBOL(drm_panel_prepare);
 
@@ -139,6 +155,7 @@ EXPORT_SYMBOL(drm_panel_prepare);
  */
 int drm_panel_unprepare(struct drm_panel *panel)
 {
+	struct drm_panel_follower *follower;
 	int ret;
 
 	if (!panel)
@@ -149,14 +166,27 @@ int drm_panel_unprepare(struct drm_panel *panel)
 		return 0;
 	}
 
+	mutex_lock(&panel->follower_lock);
+
+	list_for_each_entry(follower, &panel->followers, list) {
+		ret = follower->funcs->panel_unpreparing(follower);
+		if (ret < 0)
+			dev_info(panel->dev, "%ps failed: %d\n",
+				 follower->funcs->panel_unpreparing, ret);
+	}
+
 	if (panel->funcs && panel->funcs->unprepare) {
 		ret = panel->funcs->unprepare(panel);
 		if (ret < 0)
-			return ret;
+			goto exit;
 	}
 	panel->prepared = false;
 
-	return 0;
+	ret = 0;
+exit:
+	mutex_unlock(&panel->follower_lock);
+
+	return ret;
 }
 EXPORT_SYMBOL(drm_panel_unprepare);
 
@@ -342,6 +372,141 @@ int of_drm_get_panel_orientation(const struct device_node *np,
 EXPORT_SYMBOL(of_drm_get_panel_orientation);
 #endif
 
+/**
+ * drm_is_panel_follower() - Check if the device is a panel follower
+ * @dev: The 'struct device' to check
+ *
+ * This checks to see if a device needs to be power sequenced together with
+ * a panel using the panel follower API.
+ * At the moment panels can only be followed on device tree enabled systems.
+ * The "panel" property of the follower points to the panel to be followed.
+ *
+ * Return: true if we should be power sequenced with a panel; false otherwise.
+ */
+bool drm_is_panel_follower(struct device *dev)
+{
+	/*
+	 * The "panel" property is actually a phandle, but for simplicity we
+	 * don't bother trying to parse it here. We just need to know if the
+	 * property is there.
+	 */
+	return of_property_read_bool(dev->of_node, "panel");
+}
+EXPORT_SYMBOL(drm_is_panel_follower);
+
+/**
+ * drm_panel_add_follower() - Register something to follow panel state.
+ * @follower_dev: The 'struct device' for the follower.
+ * @follower:     The panel follower descriptor for the follower.
+ *
+ * A panel follower is called right after preparing the panel and right before
+ * unpreparing the panel. It's primary intention is to power on an associated
+ * touchscreen, though it could be used for any similar devices. Multiple
+ * devices are allowed the follow the same panel.
+ *
+ * If a follower is added to a panel that's already been turned on, the
+ * follower's prepare callback is called right away.
+ *
+ * At the moment panels can only be followed on device tree enabled systems.
+ * The "panel" property of the follower points to the panel to be followed.
+ *
+ * Return: 0 or an error code. Note that -ENODEV means that we detected that
+ *         follower_dev is not actually following a panel. The caller may
+ *         choose to ignore this return value if following a panel is optional.
+ */
+int drm_panel_add_follower(struct device *follower_dev,
+			   struct drm_panel_follower *follower)
+{
+	struct device_node *panel_np;
+	struct drm_panel *panel;
+	int ret;
+
+	panel_np = of_parse_phandle(follower_dev->of_node, "panel", 0);
+	if (!panel_np)
+		return -ENODEV;
+
+	panel = of_drm_find_panel(panel_np);
+	of_node_put(panel_np);
+	if (IS_ERR(panel))
+		return PTR_ERR(panel);
+
+	get_device(panel->dev);
+	follower->panel = panel;
+
+	mutex_lock(&panel->follower_lock);
+
+	list_add_tail(&follower->list, &panel->followers);
+	if (panel->prepared) {
+		ret = follower->funcs->panel_prepared(follower);
+		if (ret < 0)
+			dev_info(panel->dev, "%ps failed: %d\n",
+				 follower->funcs->panel_prepared, ret);
+	}
+
+	mutex_unlock(&panel->follower_lock);
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_panel_add_follower);
+
+/**
+ * drm_panel_remove_follower() - Reverse drm_panel_add_follower().
+ * @follower:     The panel follower descriptor for the follower.
+ *
+ * Undo drm_panel_add_follower(). This includes calling the follower's
+ * unprepare function if we're removed from a panel that's currently prepared.
+ *
+ * Return: 0 or an error code.
+ */
+void drm_panel_remove_follower(struct drm_panel_follower *follower)
+{
+	struct drm_panel *panel = follower->panel;
+	int ret;
+
+	mutex_lock(&panel->follower_lock);
+
+	if (panel->prepared) {
+		ret = follower->funcs->panel_unpreparing(follower);
+		if (ret < 0)
+			dev_info(panel->dev, "%ps failed: %d\n",
+				 follower->funcs->panel_unpreparing, ret);
+	}
+	list_del_init(&follower->list);
+
+	mutex_unlock(&panel->follower_lock);
+
+	put_device(panel->dev);
+}
+EXPORT_SYMBOL(drm_panel_remove_follower);
+
+static void drm_panel_remove_follower_void(void *follower)
+{
+	drm_panel_remove_follower(follower);
+}
+
+/**
+ * devm_drm_panel_add_follower() - devm version of drm_panel_add_follower()
+ * @follower_dev: The 'struct device' for the follower.
+ * @follower:     The panel follower descriptor for the follower.
+ *
+ * Handles calling drm_panel_remove_follower() using devm on the follower_dev.
+ *
+ * Return: 0 or an error code.
+ */
+int devm_drm_panel_add_follower(struct device *follower_dev,
+				struct drm_panel_follower *follower)
+{
+	int ret;
+
+	ret = drm_panel_add_follower(follower_dev, follower);
+	if (ret)
+		return ret;
+
+	return devm_add_action_or_reset(follower_dev,
+					drm_panel_remove_follower_void, follower);
+}
+EXPORT_SYMBOL(devm_drm_panel_add_follower);
+
 #if IS_REACHABLE(CONFIG_BACKLIGHT_CLASS_DEVICE)
 /**
  * drm_panel_of_backlight - use backlight device node for backlight
diff --git a/include/drm/drm_panel.h b/include/drm/drm_panel.h
index c6cf75909389..5ac67eeb0860 100644
--- a/include/drm/drm_panel.h
+++ b/include/drm/drm_panel.h
@@ -27,12 +27,14 @@
 #include <linux/err.h>
 #include <linux/errno.h>
 #include <linux/list.h>
+#include <linux/mutex.h>
 
 struct backlight_device;
 struct dentry;
 struct device_node;
 struct drm_connector;
 struct drm_device;
+struct drm_panel_follower;
 struct drm_panel;
 struct display_timing;
 
@@ -144,6 +146,45 @@ struct drm_panel_funcs {
 	void (*debugfs_init)(struct drm_panel *panel, struct dentry *root);
 };
 
+struct drm_panel_follower_funcs {
+	/**
+	 * @panel_prepared:
+	 *
+	 * Called after the panel has been powered on.
+	 */
+	int (*panel_prepared)(struct drm_panel_follower *follower);
+
+	/**
+	 * @panel_unpreparing:
+	 *
+	 * Called before the panel is powered off.
+	 */
+	int (*panel_unpreparing)(struct drm_panel_follower *follower);
+};
+
+struct drm_panel_follower {
+	/**
+	 * @funcs:
+	 *
+	 * Dependent device callbacks; should be initted by the caller.
+	 */
+	const struct drm_panel_follower_funcs *funcs;
+
+	/**
+	 * @list
+	 *
+	 * Used for linking into panel's list; set by drm_panel_add_follower().
+	 */
+	struct list_head list;
+
+	/**
+	 * @panel
+	 *
+	 * The panel we're dependent on; set by drm_panel_add_follower().
+	 */
+	struct drm_panel *panel;
+};
+
 /**
  * struct drm_panel - DRM panel object
  */
@@ -189,6 +230,20 @@ struct drm_panel {
 	 */
 	struct list_head list;
 
+	/**
+	 * @followers:
+	 *
+	 * A list of struct drm_panel_follower dependent on this panel.
+	 */
+	struct list_head followers;
+
+	/**
+	 * @followers_lock:
+	 *
+	 * Lock for followers list.
+	 */
+	struct mutex follower_lock;
+
 	/**
 	 * @prepare_prev_first:
 	 *
@@ -246,6 +301,31 @@ static inline int of_drm_get_panel_orientation(const struct device_node *np,
 }
 #endif
 
+#if defined(CONFIG_DRM_PANEL)
+bool drm_is_panel_follower(struct device *dev);
+int drm_panel_add_follower(struct device *follower_dev,
+			   struct drm_panel_follower *follower);
+void drm_panel_remove_follower(struct drm_panel_follower *follower);
+int devm_drm_panel_add_follower(struct device *follower_dev,
+				struct drm_panel_follower *follower);
+#else
+static inline bool drm_is_panel_follower(struct device *dev)
+{
+	return false;
+}
+static inline int drm_panel_add_follower(struct device *follower_dev,
+					 struct drm_panel_follower *follower)
+{
+	return -ENODEV;
+}
+static inline void drm_panel_remove_follower(struct drm_panel_follower *follower) { }
+static inline int devm_drm_panel_add_follower(struct device *follower_dev,
+					      struct drm_panel_follower *follower)
+{
+	return -ENODEV;
+}
+#endif
+
 #if IS_ENABLED(CONFIG_DRM_PANEL) && (IS_BUILTIN(CONFIG_BACKLIGHT_CLASS_DEVICE) || \
 	(IS_MODULE(CONFIG_DRM) && IS_MODULE(CONFIG_BACKLIGHT_CLASS_DEVICE)))
 int drm_panel_of_backlight(struct drm_panel *panel);
-- 
2.41.0.487.g6d72f3e995-goog

