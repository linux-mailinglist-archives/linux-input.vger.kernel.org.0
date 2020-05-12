Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3EF51CEF5D
	for <lists+linux-input@lfdr.de>; Tue, 12 May 2020 10:44:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725868AbgELIod (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 12 May 2020 04:44:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728990AbgELIoc (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 12 May 2020 04:44:32 -0400
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com [IPv6:2607:f8b0:4864:20::741])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1AA2FC061A0C
        for <linux-input@vger.kernel.org>; Tue, 12 May 2020 01:44:31 -0700 (PDT)
Received: by mail-qk1-x741.google.com with SMTP id b6so11648775qkh.11
        for <linux-input@vger.kernel.org>; Tue, 12 May 2020 01:44:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZBg2JvBUuK9lhnmNPNdV7qJYa4iJD3u/t2MGwMiaIpA=;
        b=K+C/czIteS41ccvjzXhfIzCqwcrnWoKXhBjyQv9WfnDoV7Ht1FXq1eeLowRajuYHWC
         CEtpDhzpkHNexc+acU98HAPPRbwKD9uabvRwpK3AzzLu3EFT1Kc3XfarfnS+l9cTbHNg
         I8gPbXNqWt9hyWphgGT+7j8kqaO7SmFBARWMr57lD11NNRSSZiGTQcHfCivgiH60Smn3
         OLDarzr5yen8/c00d5IoM9KH6dWOjWfWUB0P4t2P7hYQpE2fBeMDxROYpSnEdCGon2le
         n9IWqG3mqee2e3glkqzREKjQ6QUbnOuKFDuYFI3WWyJh+fb8fExE98Kw15yQAmxLeMDy
         WnhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZBg2JvBUuK9lhnmNPNdV7qJYa4iJD3u/t2MGwMiaIpA=;
        b=Th3H4inYbD2KRtZUIHxhp7Y7Duj0d19UN9gpOyTt31ldxQQyI1rPINDbGKJ/DeVpDS
         nnxdhhUsHqsO7HKk0Y+fnkB00thWXpXjeqv0uJ74XosmR1AIypY6m5H/LUYJ5ZXCkIvk
         vQw6uwaYhwgG0GTL1k3ALW0DWmADuyAgRtTfY0DNRc1ixejN1m9CPGRNgIQZeGxC+NpC
         7cCjYzpB/7PwLqptOe8IKTTuZN8KqWb/CB1g/7ejLwXlByYw0yeIl4yymDKCgsrkY4Us
         GWkBuwQL2uqKOvX40e9b8GRnaWSA10X0L9RHRMdWiC2GCzMXS9Gb0x20tqzZkPIAwHCD
         48vw==
X-Gm-Message-State: AGi0PuZhj9inP/TYqnQnJ+jcO2ylC7TeZr2qOmC1Y6Y+yNSqqM9UN16n
        46RX+OGpD79+FUDu5GAx6YlNOF0fdDw=
X-Google-Smtp-Source: APiQypIOJlb/p/QoNfzGc+rEoNz6EAyxkcu5AKKkC0lmTsHgVUmIvKAuMeB9NjXHlsoMRHTHqiYo/g==
X-Received: by 2002:a37:b44:: with SMTP id 65mr21096063qkl.368.1589273070132;
        Tue, 12 May 2020 01:44:30 -0700 (PDT)
Received: from localhost ([2601:483:4200:9113:fdae:121b:56a3:4870])
        by smtp.gmail.com with ESMTPSA id 74sm10658643qke.71.2020.05.12.01.44.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2020 01:44:29 -0700 (PDT)
From:   =?UTF-8?q?Fran=C3=A7ois-Xavier=20Carton?= <fx.carton91@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     Ethan Lee <flibitijibibo@gmail.com>,
        Bastien Nocera <hadess@hadess.net>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Subject: [PATCH v2 2/4] HID: gamecube-adapter: add rumble support
Date:   Tue, 12 May 2020 10:46:14 +0200
Message-Id: <20200512084616.32158-2-fx.carton91@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200512084616.32158-1-fx.carton91@gmail.com>
References: <20200512084616.32158-1-fx.carton91@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add rumble support for the hid-gamecube-adapter driver. Rumble is
reported with a single output report for all four controllers.

Signed-off-by: François-Xavier Carton <fx.carton91@gmail.com>
---
 drivers/hid/Kconfig                |  8 ++++
 drivers/hid/hid-gamecube-adapter.c | 75 +++++++++++++++++++++++++++++-
 2 files changed, 82 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
index d49e261a74f6..324981308783 100644
--- a/drivers/hid/Kconfig
+++ b/drivers/hid/Kconfig
@@ -360,6 +360,14 @@ config HID_GAMECUBE_ADAPTER
 	To compile this driver as a module, choose M here: the
 	module will be called hid-gamecube-adapter.
 
+config HID_GAMECUBE_ADAPTER_FF
+	bool "Nintendo Gamecube Controller Adapter force feedback"
+	depends on HID_GAMECUBE_ADAPTER
+	select INPUT_FF_MEMLESS
+	---help---
+	Say Y here if you want to enable force feedback support for Nintendo
+	Gamecube Controller Adapters.
+
 config HID_GEMBIRD
 	tristate "Gembird Joypad"
 	depends on HID
diff --git a/drivers/hid/hid-gamecube-adapter.c b/drivers/hid/hid-gamecube-adapter.c
index b1268339889e..028ce005c9e3 100644
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
@@ -54,14 +55,18 @@ enum gamecube_btn {
 struct gamecube_ctrl {
 	struct input_dev __rcu *input;
 	enum gamecube_ctrl_flags flags;
+	u8 rumble;
 	struct gamecube_adapter *adpt;
 	struct work_struct work_connect;
 	spinlock_t flags_lock;
+	spinlock_t rumble_lock;
 };
 
 struct gamecube_adapter {
 	struct gamecube_ctrl ctrls[4];
 	struct hid_device *hdev;
+	struct work_struct work_rumble;
+	u8 rumble;
 };
 
 static int gamecube_hid_send(struct hid_device *hdev, const u8 *data, size_t n)
@@ -83,6 +88,59 @@ static int gamecube_send_cmd_init(struct hid_device *hdev)
 	return gamecube_hid_send(hdev, initcmd, sizeof(initcmd));
 }
 
+#ifdef CONFIG_HID_GAMECUBE_ADAPTER_FF
+static int gamecube_send_cmd_rumble(struct gamecube_adapter *adpt)
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
+		rumble_ok = (ctrls[i].flags & GC_TYPES) && (ctrls[i].flags & GC_FLAG_EXTRAPOWER);
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
+	struct gamecube_adapter *adpt = container_of(work, struct gamecube_adapter,
+						  work_rumble);
+
+	gamecube_send_cmd_rumble(adpt);
+}
+
+static int gamecube_rumble_play(struct input_dev *dev, void *data,
+							 struct ff_effect *eff)
+{
+	struct gamecube_ctrl *ctrl = input_get_drvdata(dev);
+	struct gamecube_adapter *adpt = ctrl->adpt;
+	unsigned long flags;
+
+	if (eff->type != FF_RUMBLE)
+		return 0;
+
+	spin_lock_irqsave(&ctrl->rumble_lock, flags);
+	ctrl->rumble = (eff->u.rumble.strong_magnitude || eff->u.rumble.weak_magnitude);
+	spin_unlock_irqrestore(&ctrl->rumble_lock, flags);
+	schedule_work(&adpt->work_rumble);
+	return 0;
+}
+#endif
+
 static const unsigned int gamecube_buttons[] = {
 	BTN_START, BTN_TR2, BTN_TR, BTN_TL,
 	BTN_SOUTH, BTN_WEST, BTN_EAST, BTN_NORTH,
@@ -134,6 +192,13 @@ static int gamecube_ctrl_create(struct gamecube_ctrl *ctrl, u8 type)
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
@@ -269,7 +334,12 @@ static struct gamecube_adapter *gamecube_adpt_create(struct hid_device *hdev)
 		adpt->ctrls[i].adpt = adpt;
 		INIT_WORK(&adpt->ctrls[i].work_connect, gamecube_work_connect_cb);
 		spin_lock_init(&adpt->ctrls[i].flags_lock);
+		spin_lock_init(&adpt->ctrls[i].rumble_lock);
 	}
+#ifdef CONFIG_HID_GAMECUBE_ADAPTER_FF
+	INIT_WORK(&adpt->work_rumble, gamecube_rumble_worker);
+	adpt->rumble = 0;
+#endif
 
 	return adpt;
 }
@@ -281,6 +351,9 @@ static void gamecube_adpt_destroy(struct gamecube_adapter *adpt)
 	for (i = 0; i < 4; i++) {
 		gamecube_ctrl_destroy(adpt->ctrls + i);
 	}
+#ifdef CONFIG_HID_GAMECUBE_ADAPTER_FF
+	cancel_work_sync(&adpt->work_rumble);
+#endif
 	hid_hw_close(adpt->hdev);
 	hid_hw_stop(adpt->hdev);
 	kfree(adpt);
-- 
2.26.2

