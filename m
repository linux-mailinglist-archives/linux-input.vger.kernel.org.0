Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5318A28DCDB
	for <lists+linux-input@lfdr.de>; Wed, 14 Oct 2020 11:21:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387731AbgJNJUo (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 14 Oct 2020 05:20:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731048AbgJNJUm (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 14 Oct 2020 05:20:42 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E77AC004588
        for <linux-input@vger.kernel.org>; Tue, 13 Oct 2020 18:31:13 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id j136so845851wmj.2
        for <linux-input@vger.kernel.org>; Tue, 13 Oct 2020 18:31:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qTJiqCV4nGMQfwQum1sczy2PyeNWAiQMSu7nh+u9sFU=;
        b=cNOvXrO4d8krwfdEeQd2PSB9lmQE8aPeU/MPo+JOiKppiluREzgNyRtTIv9ZAeA0EF
         0nA7AeWyiTHn2E6Qjv7jcV+L69Rl/yjXvvI0Z25sT1FGS3zYu40AnNr8m4Sa/qqSF9vP
         4fpWsWQWXtmTnfb0brZsMQMFN7rvlr9kx2EZWePlUl8meNkwTRTjaejl+rxUHQ98JQZk
         8mEfEULg4TV6/+w1FPJXVBcEe6sleE9cs8WMchpy8a9gmsKyipoUdcrJWokXSvLPlHfg
         5b22hgB/XVTvm+Tryb+3910j8S+ayIM7SEPnJR1e/PFq67ei17Pf9Tg10UQT2FXayJwd
         9BCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qTJiqCV4nGMQfwQum1sczy2PyeNWAiQMSu7nh+u9sFU=;
        b=qS4bkam5rCRyZJC5ZjsIIOfs2RNkI65N+Viq2OpfqIJRi9Tb6cARZRheWB4Zi2jzpW
         /eojm8XpsEk2Bt2gZqyIQX1cChV5tE/wgml/1xf271xl9H0+vdC9ZxO1/FEtm3pOdQ4v
         mW1ZDJBSLIA+g/S2TEKWXIddjPUpjBVrOWSWQKsnPFp9eE/y+sCHYUfgqJFjkx8Co01d
         EL6VYHQK+0ZSdmOZyXu/lKCGgbSI6Z7lJMomicYFNuXVuQ1XYkckr6LYuq0gHliYjoH0
         hTgOR6fToGvI3vtNYxSXk3QxcTmfeBBdbK7OcAByzlOdtFdhqzCC3xx2pICYDmA5Do8/
         bvjg==
X-Gm-Message-State: AOAM5305mAqlLZ1fGLuzWN64QjOl4KZNKFfkC7Px53FA/NXsRSMB9k+Y
        pEw6VGJ67pRU3Q4nxgO3WPXSXsnya9DLsupW
X-Google-Smtp-Source: ABdhPJxFWnV4syoOJEKpM8FrhHA2vA15MIYflau2FEhjTPc3nwiUqIWktAAUORCAurM8rQDE9syOmw==
X-Received: by 2002:a7b:c14f:: with SMTP id z15mr942344wmi.73.1602639071776;
        Tue, 13 Oct 2020 18:31:11 -0700 (PDT)
Received: from localhost (242.19.86.79.rev.sfr.net. [79.86.19.242])
        by smtp.gmail.com with ESMTPSA id x3sm1048887wmi.45.2020.10.13.18.31.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2020 18:31:11 -0700 (PDT)
From:   =?UTF-8?q?Fran=C3=A7ois-Xavier=20Carton?= <fx.carton91@gmail.com>
To:     linux-input@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     =?UTF-8?q?Fran=C3=A7ois-Xavier=20Carton?= <fx.carton91@gmail.com>,
        Ethan Lee <flibitijibibo@gmail.com>,
        Bastien Nocera <hadess@hadess.net>
Subject: [PATCH v3 2/4] HID: gamecube-adapter: add rumble support
Date:   Wed, 14 Oct 2020 03:30:21 +0200
Message-Id: <20201014013023.23078-3-fx.carton91@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201014013023.23078-1-fx.carton91@gmail.com>
References: <20201014013023.23078-1-fx.carton91@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add rumble support for the hid-gamecube-adapter driver. Rumble is
reported with a single output report for all four controllers.

Signed-off-by: François-Xavier Carton <fx.carton91@gmail.com>
---
 drivers/hid/Kconfig                |  8 ++++
 drivers/hid/hid-gamecube-adapter.c | 77 +++++++++++++++++++++++++++++-
 2 files changed, 84 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
index c2bb95bda44d..04cbaa2625db 100644
--- a/drivers/hid/Kconfig
+++ b/drivers/hid/Kconfig
@@ -360,6 +360,14 @@ config HID_GAMECUBE_ADAPTER
 	  To compile this driver as a module, choose M here: the
 	  module will be called hid-gamecube-adapter.
 
+config HID_GAMECUBE_ADAPTER_FF
+	bool "Nintendo Gamecube Controller Adapter force feedback"
+	depends on HID_GAMECUBE_ADAPTER
+	select INPUT_FF_MEMLESS
+	help
+	  Say Y here if you want to enable force feedback support for Nintendo
+	  Gamecube Controller Adapters.
+
 config HID_GEMBIRD
 	tristate "Gembird Joypad"
 	depends on HID
diff --git a/drivers/hid/hid-gamecube-adapter.c b/drivers/hid/hid-gamecube-adapter.c
index 7193db1a0782..d0bf09ba2762 100644
--- a/drivers/hid/hid-gamecube-adapter.c
+++ b/drivers/hid/hid-gamecube-adapter.c
@@ -20,7 +20,8 @@
 #include "usbhid/usbhid.h"
 
 enum gamecube_output {
-	GC_CMD_INIT = 0x13
+	GC_CMD_INIT = 0x13,
+	GC_CMD_RUMBLE = 0x11
 };
 
 enum gamecube_input {
@@ -55,13 +56,17 @@ struct gamecube_ctrl {
 	struct input_dev __rcu *input;
 	struct gamecube_adpt *adpt;
 	enum gamecube_ctrl_flags flags;
+	u8 rumble;
 	struct work_struct work_connect;
 	spinlock_t flags_lock;
+	spinlock_t rumble_lock;
 };
 
 struct gamecube_adpt {
 	struct gamecube_ctrl ctrls[4];
 	struct hid_device *hdev;
+	struct work_struct work_rumble;
+	u8 rumble;
 };
 
 static int gamecube_hid_send(struct hid_device *hdev, const u8 *data, size_t n)
@@ -84,6 +89,61 @@ static int gamecube_send_cmd_init(struct hid_device *hdev)
 	return gamecube_hid_send(hdev, initcmd, sizeof(initcmd));
 }
 
+#ifdef CONFIG_HID_GAMECUBE_ADAPTER_FF
+static int gamecube_send_cmd_rumble(struct gamecube_adpt *adpt)
+{
+	struct gamecube_ctrl *ctrls = adpt->ctrls;
+	u8 cmd[5] = {GC_CMD_RUMBLE};
+	unsigned long flags;
+	unsigned int i;
+	int rumble_ok;
+	u8 rumble = 0;
+
+	for (i = 0; i < 4; i++) {
+		spin_lock_irqsave(&ctrls[i].flags_lock, flags);
+		rumble_ok = (ctrls[i].flags & GC_TYPES)
+			&& (ctrls[i].flags & GC_FLAG_EXTRAPOWER);
+		spin_unlock_irqrestore(&ctrls[i].flags_lock, flags);
+		if (!rumble_ok)
+			continue;
+		spin_lock_irqsave(&ctrls[i].rumble_lock, flags);
+		cmd[i + 1] = ctrls[i].rumble;
+		rumble |= (ctrls[i].rumble & 1U) << i;
+		spin_unlock_irqrestore(&ctrls[i].rumble_lock, flags);
+	}
+	if (rumble == adpt->rumble)
+		return 0;
+	adpt->rumble = rumble;
+	return gamecube_hid_send(adpt->hdev, cmd, sizeof(cmd));
+}
+
+static void gamecube_rumble_worker(struct work_struct *work)
+{
+	struct gamecube_adpt *adpt = container_of(work, struct gamecube_adpt,
+						  work_rumble);
+
+	gamecube_send_cmd_rumble(adpt);
+}
+
+static int gamecube_rumble_play(struct input_dev *dev, void *data,
+							 struct ff_effect *eff)
+{
+	struct gamecube_ctrl *ctrl = input_get_drvdata(dev);
+	struct gamecube_adpt *adpt = ctrl->adpt;
+	unsigned long flags;
+
+	if (eff->type != FF_RUMBLE)
+		return 0;
+
+	spin_lock_irqsave(&ctrl->rumble_lock, flags);
+	ctrl->rumble = (eff->u.rumble.strong_magnitude
+			|| eff->u.rumble.weak_magnitude);
+	spin_unlock_irqrestore(&ctrl->rumble_lock, flags);
+	schedule_work(&adpt->work_rumble);
+	return 0;
+}
+#endif
+
 static const unsigned int gamecube_buttons[] = {
 	BTN_START, BTN_TR2, BTN_TR, BTN_TL,
 	BTN_SOUTH, BTN_WEST, BTN_EAST, BTN_NORTH,
@@ -136,6 +196,13 @@ static int gamecube_ctrl_create(struct gamecube_ctrl *ctrl, u8 type)
 		input_set_capability(input, EV_KEY, gamecube_buttons[i]);
 	for (i = 0; i < ARRAY_SIZE(gamecube_axes); i++)
 		input_set_abs_params(input, gamecube_axes[i], 0, 255, 0, 0);
+#ifdef CONFIG_HID_GAMECUBE_ADAPTER_FF
+	if (type == GC_TYPE_NORMAL) {
+		input_set_capability(input, EV_FF, FF_RUMBLE);
+		if (input_ff_create_memless(input, NULL, gamecube_rumble_play))
+			hid_warn(hdev, "failed to create ff memless\n");
+	}
+#endif
 
 	ret = input_register_device(input);
 	if (ret)
@@ -278,7 +345,12 @@ static struct gamecube_adpt *gamecube_adpt_create(struct hid_device *hdev)
 		ctrl->adpt = adpt;
 		INIT_WORK(&ctrl->work_connect, gamecube_work_connect_cb);
 		spin_lock_init(&ctrl->flags_lock);
+		spin_lock_init(&ctrl->rumble_lock);
 	}
+#ifdef CONFIG_HID_GAMECUBE_ADAPTER_FF
+	INIT_WORK(&adpt->work_rumble, gamecube_rumble_worker);
+	adpt->rumble = 0;
+#endif
 
 	return adpt;
 }
@@ -289,6 +361,9 @@ static void gamecube_adpt_destroy(struct gamecube_adpt *adpt)
 
 	for (i = 0; i < 4; i++)
 		gamecube_ctrl_destroy(adpt->ctrls + i);
+#ifdef CONFIG_HID_GAMECUBE_ADAPTER_FF
+	cancel_work_sync(&adpt->work_rumble);
+#endif
 	hid_hw_close(adpt->hdev);
 	hid_hw_stop(adpt->hdev);
 	kfree(adpt);
-- 
2.26.2

