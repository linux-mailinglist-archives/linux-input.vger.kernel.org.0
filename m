Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E486444BB6
	for <lists+linux-input@lfdr.de>; Thu,  4 Nov 2021 00:40:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229561AbhKCXnH (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 3 Nov 2021 19:43:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230084AbhKCXnG (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 3 Nov 2021 19:43:06 -0400
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB558C061714
        for <linux-input@vger.kernel.org>; Wed,  3 Nov 2021 16:40:29 -0700 (PDT)
Received: by mail-pl1-x631.google.com with SMTP id f8so4138668plo.12
        for <linux-input@vger.kernel.org>; Wed, 03 Nov 2021 16:40:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QxbqjTO208Tp9bbu5s5JfebK5TOoEtl+5aj9wB4A0g4=;
        b=hijd8YRz8C5CK0K8HvC0xv0bXYWZzC0zu3gnXub+ovysDjq+jctJCe+BIbKe1sQDid
         VpcdpGWpzkoLlMJJr03q3zC6CcK2cXNnzJSGjVlfeQE/gK+tlGugZ/i3xlJI7Yl1O3oc
         TnvdBnUb6wBURqEmPzOHweuDsH9cW+/OlAJ/4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QxbqjTO208Tp9bbu5s5JfebK5TOoEtl+5aj9wB4A0g4=;
        b=CIoEwpgCgceznfwuhPFTFCLMtKMUJD3If7kfvGOPWHQXmMIA0IPj7p/CJWjBlnfUlq
         49gJPIeGqvE+jw737daIuSH8+YKkLqprKnhQUQ5VNEkaq+VxeSoFCmpqV6Y5kc6eXjYe
         djZ99gjU5BM88SI5m2P6puLU+oCMQRKE3aKPF2sloonY3xvJOx0ANqwRTjrSR1iChYhF
         CknIxphjoymjyaSMko9NTOz12tfewOZBIh+X35RUgkvXYUPneM10ITXXuBSF//Cvx5zg
         lSXT02NlkxHV9WojUfBd2TuPt+vaPaKWCulLBBS+OL53yo9urqGDgZu9Pvvh+sk7I0JN
         sdKA==
X-Gm-Message-State: AOAM530hzgAzQvmWRkv5IYRnJbos6DMELJ50Eqi7Y0V8OuQWsD9XUG7K
        3wUvkGuxgrZw+naCVwg9Rx0+vA==
X-Google-Smtp-Source: ABdhPJy48kt3OT63G5eA1HEkPwnQyIDFaENRLCTSsXk+A+NAlL7gpyJJpm+b6qj09YEgnGq7lGvvUQ==
X-Received: by 2002:a17:90a:3e09:: with SMTP id j9mr17938624pjc.24.1635982829432;
        Wed, 03 Nov 2021 16:40:29 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:49a7:f0ba:24b0:bc39])
        by smtp.gmail.com with UTF8SMTPSA id l11sm6000252pjg.22.2021.11.03.16.40.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Nov 2021 16:40:28 -0700 (PDT)
From:   Brian Norris <briannorris@chromium.org>
To:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
Cc:     Andrzej Hajda <andrzej.hajda@intel.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        David Airlie <airlied@linux.ie>,
        linux-rockchip@lists.infradead.org,
        "Kristian H . Kristensen" <hoegsberg@google.com>,
        Doug Anderson <dianders@chromium.org>,
        Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Brian Norris <briannorris@chromium.org>
Subject: [PATCH 1/2] drm/input_helper: Add new input-handling helper
Date:   Wed,  3 Nov 2021 16:40:17 -0700
Message-Id: <20211103164002.1.I09b516eff75ead160a6582dd557e7e7e900c9e8e@changeid>
X-Mailer: git-send-email 2.34.0.rc0.344.g81b53c2807-goog
In-Reply-To: <20211103234018.4009771-1-briannorris@chromium.org>
References: <20211103234018.4009771-1-briannorris@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

A variety of applications have found it useful to listen to
user-initiated input events to make decisions within a DRM driver, given
that input events are often the first sign that we're going to start
doing latency-sensitive activities:

 * Panel self-refresh: software-directed self-refresh (e.g., with
   Rockchip eDP) is especially latency sensitive. In some cases, it can
   take 10s of milliseconds for a panel to exit self-refresh, which can
   be noticeable. Rockchip RK3399 Chrome OS systems have always shipped
   with an input_handler boost, that preemptively exits self-refresh
   whenever there is input activity.

 * GPU drivers: on GPU-accelerated desktop systems, we may need to
   render new frames immediately after user activity. Powering up the
   GPU can take enough time that it is worthwhile to start this process
   as soon as there is input activity. Many Chrome OS systems also ship
   with an input_handler boost that powers up the GPU.

This patch provides a small helper library that abstracts some of the
input-subsystem details around picking which devices to listen to, and
some other boilerplate. This will be used in the next patch to implement
the first bullet: preemptive exit for panel self-refresh.

Bits of this are adapted from code the Android and/or Chrome OS kernels
have been carrying for a while.

Signed-off-by: Brian Norris <briannorris@chromium.org>
---

 drivers/gpu/drm/Makefile           |   3 +-
 drivers/gpu/drm/drm_input_helper.c | 143 +++++++++++++++++++++++++++++
 include/drm/drm_input_helper.h     |  22 +++++
 3 files changed, 167 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/drm_input_helper.c
 create mode 100644 include/drm/drm_input_helper.h

diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 0dff40bb863c..378761685b47 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -49,7 +49,8 @@ drm_kms_helper-y := drm_bridge_connector.o drm_crtc_helper.o drm_dp_helper.o \
 		drm_scdc_helper.o drm_gem_atomic_helper.o \
 		drm_gem_framebuffer_helper.o \
 		drm_atomic_state_helper.o drm_damage_helper.o \
-		drm_format_helper.o drm_self_refresh_helper.o
+		drm_format_helper.o drm_self_refresh_helper.o \
+		drm_input_helper.o
 
 drm_kms_helper-$(CONFIG_DRM_PANEL_BRIDGE) += bridge/panel.o
 drm_kms_helper-$(CONFIG_DRM_FBDEV_EMULATION) += drm_fb_helper.o
diff --git a/drivers/gpu/drm/drm_input_helper.c b/drivers/gpu/drm/drm_input_helper.c
new file mode 100644
index 000000000000..a31efc0d3030
--- /dev/null
+++ b/drivers/gpu/drm/drm_input_helper.c
@@ -0,0 +1,143 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2021 Google, Inc.
+ */
+#include <linux/input.h>
+#include <linux/slab.h>
+
+#include <drm/drm_device.h>
+#include <drm/drm_input_helper.h>
+
+/**
+ * DOC: overview
+ *
+ * This helper library provides a thin wrapper around input handles, so that
+ * DRM drivers can easily perform domain-specific actions in response to user
+ * activity. e.g., if someone is moving a mouse, we're likely to want to
+ * display something soon, and we should exit panel self-refresh.
+ */
+
+static void drm_input_event(struct input_handle *handle, unsigned int type,
+			    unsigned int code, int value)
+{
+	struct drm_input_handler *handler = handle->handler->private;
+
+	handler->callback(handler->priv);
+}
+
+static int drm_input_connect(struct input_handler *handler,
+			     struct input_dev *dev,
+			     const struct input_device_id *id)
+{
+	struct input_handle *handle;
+	int error;
+
+	handle = kzalloc(sizeof(struct input_handle), GFP_KERNEL);
+	if (!handle)
+		return -ENOMEM;
+
+	handle->dev = dev;
+	handle->handler = handler;
+	handle->name = "drm-input-helper";
+
+	error = input_register_handle(handle);
+	if (error)
+		goto err2;
+
+	error = input_open_device(handle);
+	if (error)
+		goto err1;
+
+	return 0;
+
+err1:
+	input_unregister_handle(handle);
+err2:
+	kfree(handle);
+	return error;
+}
+
+static void drm_input_disconnect(struct input_handle *handle)
+{
+	input_close_device(handle);
+	input_unregister_handle(handle);
+	kfree(handle);
+}
+
+static const struct input_device_id drm_input_ids[] = {
+	{
+		.flags = INPUT_DEVICE_ID_MATCH_EVBIT |
+			 INPUT_DEVICE_ID_MATCH_ABSBIT,
+		.evbit = { BIT_MASK(EV_ABS) },
+		.absbit = { [BIT_WORD(ABS_MT_POSITION_X)] =
+			    BIT_MASK(ABS_MT_POSITION_X) |
+			    BIT_MASK(ABS_MT_POSITION_Y) },
+	}, /* multi-touch touchscreen */
+	{
+		.flags = INPUT_DEVICE_ID_MATCH_EVBIT,
+		.evbit = { BIT_MASK(EV_ABS) },
+		.absbit = { [BIT_WORD(ABS_X)] = BIT_MASK(ABS_X) }
+
+	}, /* stylus or joystick device */
+	{
+		.flags = INPUT_DEVICE_ID_MATCH_EVBIT,
+		.evbit = { BIT_MASK(EV_KEY) },
+		.keybit = { [BIT_WORD(BTN_LEFT)] = BIT_MASK(BTN_LEFT) },
+	}, /* pointer (e.g. trackpad, mouse) */
+	{
+		.flags = INPUT_DEVICE_ID_MATCH_EVBIT,
+		.evbit = { BIT_MASK(EV_KEY) },
+		.keybit = { [BIT_WORD(KEY_ESC)] = BIT_MASK(KEY_ESC) },
+	}, /* keyboard */
+	{
+		.flags = INPUT_DEVICE_ID_MATCH_EVBIT |
+			 INPUT_DEVICE_ID_MATCH_KEYBIT,
+		.evbit = { BIT_MASK(EV_KEY) },
+		.keybit = {[BIT_WORD(BTN_JOYSTICK)] = BIT_MASK(BTN_JOYSTICK) },
+	}, /* joysticks not caught by ABS_X above */
+	{
+		.flags = INPUT_DEVICE_ID_MATCH_EVBIT |
+			 INPUT_DEVICE_ID_MATCH_KEYBIT,
+		.evbit = { BIT_MASK(EV_KEY) },
+		.keybit = { [BIT_WORD(BTN_GAMEPAD)] = BIT_MASK(BTN_GAMEPAD) },
+	}, /* gamepad */
+	{ },
+};
+
+int drm_input_handle_register(struct drm_device *dev,
+			      struct drm_input_handler *handler)
+{
+	int ret;
+
+	if (!handler->callback)
+		return -EINVAL;
+
+	handler->handler.event = drm_input_event;
+	handler->handler.connect = drm_input_connect;
+	handler->handler.disconnect = drm_input_disconnect;
+	handler->handler.name = kasprintf(GFP_KERNEL, "drm-input-helper-%s",
+					  dev_name(dev->dev));
+	if (!handler->handler.name)
+		return -ENOMEM;
+
+	handler->handler.id_table = drm_input_ids;
+	handler->handler.private = handler;
+
+	ret = input_register_handler(&handler->handler);
+	if (ret)
+		goto err;
+
+	return 0;
+
+err:
+	kfree(handler->handler.name);
+	return ret;
+}
+EXPORT_SYMBOL(drm_input_handle_register);
+
+void drm_input_handle_unregister(struct drm_input_handler *handler)
+{
+	input_unregister_handler(&handler->handler);
+	kfree(handler->handler.name);
+}
+EXPORT_SYMBOL(drm_input_handle_unregister);
diff --git a/include/drm/drm_input_helper.h b/include/drm/drm_input_helper.h
new file mode 100644
index 000000000000..b4d68896830c
--- /dev/null
+++ b/include/drm/drm_input_helper.h
@@ -0,0 +1,22 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2021 Google, Inc.
+ */
+#ifndef __DRM_INPUT_HELPER_H__
+#define __DRM_INPUT_HELPER_H__
+
+#include <linux/input.h>
+
+struct drm_device;
+
+struct drm_input_handler {
+	struct input_handler handler;
+	void *priv;
+	void (*callback)(void *priv);
+};
+
+int drm_input_handle_register(struct drm_device *dev,
+			      struct drm_input_handler *handler);
+void drm_input_handle_unregister(struct drm_input_handler *handler);
+
+#endif /* __DRM_INPUT_HELPER_H__ */
-- 
2.34.0.rc0.344.g81b53c2807-goog

