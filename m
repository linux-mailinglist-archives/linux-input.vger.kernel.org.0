Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 136D6765A06
	for <lists+linux-input@lfdr.de>; Thu, 27 Jul 2023 19:19:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233378AbjG0RTr (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 27 Jul 2023 13:19:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233003AbjG0RTV (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 27 Jul 2023 13:19:21 -0400
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A88253C22
        for <linux-input@vger.kernel.org>; Thu, 27 Jul 2023 10:18:52 -0700 (PDT)
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-686efa1804eso951711b3a.3
        for <linux-input@vger.kernel.org>; Thu, 27 Jul 2023 10:18:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1690478331; x=1691083131;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qTjLKvAJKRYARtxEGmXcmS+50e9KsZIDbmBVT+yTLd4=;
        b=cgjtau07EB0L6iScTKTIih4sOJB9Qgk5TRR4QAZD/n6xFBTa6Q/I1/Kp8GsZwqJaCR
         j2AG93azPjA0+fI3WkkkKmR28V0z1yAfhfmGrDP66ebj/n0ORbWtzf19QnPY7cWcR8Sw
         H4z9yKbtbuyblDD5QpYqt8tjkhs2xkseOZWZE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690478331; x=1691083131;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qTjLKvAJKRYARtxEGmXcmS+50e9KsZIDbmBVT+yTLd4=;
        b=Ex6OBapaA0iEACQ/K55JEEbL1BwXYVNXB8RObrBsn1Sv6vcro24ZVpUjoWqlMlhSuP
         1VHvScKgTeay7ngOrUF5JrwVagYeAr0vQ4L5cM4+J2Hi/YBEIMf1+TM0UEmFNN4+Xmuz
         7gO0s+tbm2UxJOMScV3bX9pwogy0Y19ffofAnsoBj22cClrHsf34gSRFIW071YjSX9j8
         VyAqczdoF09uAFsyNhjWv5Z/QG/hjtx2Y8+dFLXQs5foRpuyT/1mUrK80ZQRBYyKvSmO
         3bG93OTn1CQdBfj6k+nHY+zVskPtu7NVTglom15Igjc6zmDc/+/LS8/QMtb5XtFDwdLQ
         yHcQ==
X-Gm-Message-State: ABy/qLa3vddcDQlNxofwy8MoOP4ViSdnZklcJ5K0zQ9vYbkOevgJAIgj
        y8EzV72d21vbtVDPxCWwqwqAWg==
X-Google-Smtp-Source: APBJJlF5O5qMkAetDXxY84TEieeBDDuvvsjnnVkfJZ7tsdf256XvH96+hofEBj9f9uqEiOSkUEc7gA==
X-Received: by 2002:a05:6a00:a1b:b0:684:b886:e392 with SMTP id p27-20020a056a000a1b00b00684b886e392mr6173282pfh.25.1690478331424;
        Thu, 27 Jul 2023 10:18:51 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:9d:2:2339:954b:b98f:611a])
        by smtp.gmail.com with ESMTPSA id 17-20020aa79111000000b0064f76992905sm1702524pfh.202.2023.07.27.10.18.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jul 2023 10:18:50 -0700 (PDT)
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
Cc:     linux-arm-msm@vger.kernel.org,
        yangcong5@huaqin.corp-partner.google.com,
        devicetree@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
        hsinyi@google.com, Chris Morgan <macroalpha82@gmail.com>,
        linux-input@vger.kernel.org, cros-qcom-dts-watchers@chromium.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Douglas Anderson <dianders@chromium.org>
Subject: [PATCH v4 09/11] HID: i2c-hid: Support being a panel follower
Date:   Thu, 27 Jul 2023 10:16:36 -0700
Message-ID: <20230727101636.v4.9.Ib1a98309c455cd7e26b931c69993d4fba33bbe15@changeid>
X-Mailer: git-send-email 2.41.0.487.g6d72f3e995-goog
In-Reply-To: <20230727171750.633410-1-dianders@chromium.org>
References: <20230727171750.633410-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

As talked about in the patch ("drm/panel: Add a way for other devices
to follow panel state"), we really want to keep the power states of a
touchscreen and the panel it's attached to in sync with each other. In
that spirit, add support to i2c-hid to be a panel follower. This will
let the i2c-hid driver get informed when the panel is powered on and
off. From there we can match the i2c-hid device's power state to that
of the panel.

NOTE: this patch specifically _doesn't_ use pm_runtime to keep track
of / manage the power state of the i2c-hid device, even though my
first instinct said that would be the way to go. Specific problems
with using pm_runtime():
* The initial power up couldn't happen in a runtime resume function
  since it create sub-devices and, apparently, that's not good to do
  in your resume function.
* Managing our power state with pm_runtime meant fighting to make the
  right thing happen at system suspend to prevent the system from
  trying to resume us only to suspend us again. While this might be
  able to be solved, it added complexity.
Overall the code without pm_runtime() ended up being smaller and
easier to understand.

Reviewed-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v4:
- Move panel follower alternative checks to wrapper functions.
- Rebase atop ("Suspend i2c-hid devices in remove").

Changes in v3:
- Add "depends on DRM || !DRM" to Kconfig to avoid randconfig error.
- Split more of the panel follower code out of the core.

Changes in v2:
- i2c_hid_core_panel_prepared() and ..._unpreparing() are now static.

 drivers/hid/i2c-hid/Kconfig        |  2 +
 drivers/hid/i2c-hid/i2c-hid-core.c | 93 +++++++++++++++++++++++++++++-
 2 files changed, 92 insertions(+), 3 deletions(-)

diff --git a/drivers/hid/i2c-hid/Kconfig b/drivers/hid/i2c-hid/Kconfig
index 3be17109301a..2bdb55203104 100644
--- a/drivers/hid/i2c-hid/Kconfig
+++ b/drivers/hid/i2c-hid/Kconfig
@@ -70,5 +70,7 @@ config I2C_HID_OF_GOODIX
 
 config I2C_HID_CORE
 	tristate
+	# We need to call into panel code so if DRM=m, this can't be 'y'
+	depends on DRM || !DRM
 endif
 
diff --git a/drivers/hid/i2c-hid/i2c-hid-core.c b/drivers/hid/i2c-hid/i2c-hid-core.c
index 46658ed6380f..fc3087a983f5 100644
--- a/drivers/hid/i2c-hid/i2c-hid-core.c
+++ b/drivers/hid/i2c-hid/i2c-hid-core.c
@@ -38,6 +38,8 @@
 #include <linux/mutex.h>
 #include <asm/unaligned.h>
 
+#include <drm/drm_panel.h>
+
 #include "../hid-ids.h"
 #include "i2c-hid.h"
 
@@ -107,6 +109,8 @@ struct i2c_hid {
 	struct mutex		reset_lock;
 
 	struct i2chid_ops	*ops;
+	struct drm_panel_follower panel_follower;
+	bool			is_panel_follower;
 };
 
 static const struct i2c_hid_quirks {
@@ -993,7 +997,7 @@ static int i2c_hid_core_resume(struct i2c_hid *ihid)
 }
 
 /**
- * i2c_hid_core_initial_power_up() - First time power up of the i2c-hid device.
+ * __do_i2c_hid_core_initial_power_up() - First time power up of the i2c-hid device.
  * @ihid: The ihid object created during probe.
  *
  * This function is called at probe time.
@@ -1004,7 +1008,7 @@ static int i2c_hid_core_resume(struct i2c_hid *ihid)
  *
  * Return: 0 or error code.
  */
-static int i2c_hid_core_initial_power_up(struct i2c_hid *ihid)
+static int __do_i2c_hid_core_initial_power_up(struct i2c_hid *ihid)
 {
 	struct i2c_client *client = ihid->client;
 	struct hid_device *hid = ihid->hid;
@@ -1058,6 +1062,83 @@ static int i2c_hid_core_initial_power_up(struct i2c_hid *ihid)
 	return ret;
 }
 
+static int i2c_hid_core_panel_prepared(struct drm_panel_follower *follower)
+{
+	struct i2c_hid *ihid = container_of(follower, struct i2c_hid, panel_follower);
+	struct hid_device *hid = ihid->hid;
+
+	/*
+	 * hid->version is set on the first power up. If it's still zero then
+	 * this is the first power on so we should perform initial power up
+	 * steps.
+	 */
+	if (!hid->version)
+		return __do_i2c_hid_core_initial_power_up(ihid);
+
+	return i2c_hid_core_resume(ihid);
+}
+
+static int i2c_hid_core_panel_unpreparing(struct drm_panel_follower *follower)
+{
+	struct i2c_hid *ihid = container_of(follower, struct i2c_hid, panel_follower);
+
+	return i2c_hid_core_suspend(ihid, true);
+}
+
+static const struct drm_panel_follower_funcs i2c_hid_core_panel_follower_funcs = {
+	.panel_prepared = i2c_hid_core_panel_prepared,
+	.panel_unpreparing = i2c_hid_core_panel_unpreparing,
+};
+
+static int i2c_hid_core_register_panel_follower(struct i2c_hid *ihid)
+{
+	struct device *dev = &ihid->client->dev;
+	int ret;
+
+	ihid->is_panel_follower = true;
+	ihid->panel_follower.funcs = &i2c_hid_core_panel_follower_funcs;
+
+	/*
+	 * If we're not in control of our own power up/power down then we can't
+	 * do the logic to manage wakeups. Give a warning if a user thought
+	 * that was possible then force the capability off.
+	 */
+	if (device_can_wakeup(dev)) {
+		dev_warn(dev, "Can't wakeup if following panel\n");
+		device_set_wakeup_capable(dev, false);
+	}
+
+	ret = drm_panel_add_follower(dev, &ihid->panel_follower);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static int i2c_hid_core_initial_power_up(struct i2c_hid *ihid)
+{
+	/*
+	 * If we're a panel follower, we'll register and do our initial power
+	 * up when the panel turns on; otherwise we do it right away.
+	 */
+	if (drm_is_panel_follower(&ihid->client->dev))
+		return i2c_hid_core_register_panel_follower(ihid);
+	else
+		return __do_i2c_hid_core_initial_power_up(ihid);
+}
+
+static void i2c_hid_core_final_power_down(struct i2c_hid *ihid)
+{
+	/*
+	 * If we're a follower, the act of unfollowing will cause us to be
+	 * powered down. Otherwise we need to manually do it.
+	 */
+	if (ihid->is_panel_follower)
+		drm_panel_remove_follower(&ihid->panel_follower);
+	else
+		i2c_hid_core_suspend(ihid, true);
+}
+
 int i2c_hid_core_probe(struct i2c_client *client, struct i2chid_ops *ops,
 		       u16 hid_descriptor_address, u32 quirks)
 {
@@ -1143,7 +1224,7 @@ void i2c_hid_core_remove(struct i2c_client *client)
 	struct i2c_hid *ihid = i2c_get_clientdata(client);
 	struct hid_device *hid;
 
-	i2c_hid_core_suspend(ihid, true);
+	i2c_hid_core_final_power_down(ihid);
 
 	hid = ihid->hid;
 	hid_destroy_device(hid);
@@ -1171,6 +1252,9 @@ static int i2c_hid_core_pm_suspend(struct device *dev)
 	struct i2c_client *client = to_i2c_client(dev);
 	struct i2c_hid *ihid = i2c_get_clientdata(client);
 
+	if (ihid->is_panel_follower)
+		return 0;
+
 	return i2c_hid_core_suspend(ihid, false);
 }
 
@@ -1179,6 +1263,9 @@ static int i2c_hid_core_pm_resume(struct device *dev)
 	struct i2c_client *client = to_i2c_client(dev);
 	struct i2c_hid *ihid = i2c_get_clientdata(client);
 
+	if (ihid->is_panel_follower)
+		return 0;
+
 	return i2c_hid_core_resume(ihid);
 }
 
-- 
2.41.0.487.g6d72f3e995-goog

