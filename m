Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 94BEF1C6532
	for <lists+linux-input@lfdr.de>; Wed,  6 May 2020 02:46:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729678AbgEFAq0 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 5 May 2020 20:46:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729657AbgEFAqZ (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 5 May 2020 20:46:25 -0400
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com [IPv6:2607:f8b0:4864:20::743])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50369C061A0F
        for <linux-input@vger.kernel.org>; Tue,  5 May 2020 17:46:24 -0700 (PDT)
Received: by mail-qk1-x743.google.com with SMTP id n14so301068qke.8
        for <linux-input@vger.kernel.org>; Tue, 05 May 2020 17:46:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yH6IUrcOkMLVUkK39uCSBsn0Q2jTsofq3xWsFnossNc=;
        b=sDwhp5/vx5Ey8OWWE4i9HSZuu2qtJP8bQeUsFb2D0fo9uZw19hQ9RskQ7m6Fw0groZ
         F46TT0LOqg9WAh/LPA9yYFLUt22GFJbj5jgPsPfgdiss+z/yUWh4iRacTr/ZKNX7EXOa
         B9eovFnP96hR4fIAWOA0N/T++WI2VpB4ylUjC3q3+y/ImsYUpGpkuxdywhfxXGruhmWf
         cyowU2jPDdH2Xe45PXvbODuCtf0vUs3Y4MBY2GBVKSptIjRbMrKVEfqnntuPJ0Uni0iR
         RWSf0Yq24PoU0N03N9IhoO5OBk7a6UVShF+SOUgEsQjxOQPGrwgkZ32aPWf416mDOgKq
         G9/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yH6IUrcOkMLVUkK39uCSBsn0Q2jTsofq3xWsFnossNc=;
        b=WQhyPIjoGkUJ/6ATgxKg7cu5dpEDWW0wNfNVNxHQ3/iGSmOHLocoob7Q1Skhwr6A5Z
         HFR8+mYAv1ruZZ0vnNSihnpPIbhnh8T26VCUGQxRqFGjCykkMqWdOpoELqmS5Eb0VCTH
         CEpSfLnJGXuDHaBHFhga3RfUHKqABCCcLMWOCprT+XQgwwgbYeWrDrPMTUb0XT243xLk
         LTLnjlgJv4fb4mBMHxj8h41IsPTb9VRmE/eGFDbWDzws44ralGdVl540Pfg2Ehxdpp1a
         auXaTHZlNmUiyc/SCsOlkkkrYSNwNzP1sbVkCUW9KFhv8zPA169GxhjUGBPxk+pOeUf4
         Ig3w==
X-Gm-Message-State: AGi0PubuJ/MeQ6LLjPBkgzYoTHCqclC3XEyyqDC/ASn8sezlMJKD3smG
        C53La/4+5sc2oEQGGiHuKTcAkrIO
X-Google-Smtp-Source: APiQypKsSrn0LwCQcyCA/NFgRTlzDY2sL+uomgmBrOaxpllr4vf8Y1b7LGA1eC9s/tx3tPUP6ah27w==
X-Received: by 2002:a05:620a:16d1:: with SMTP id a17mr6073606qkn.111.1588725983407;
        Tue, 05 May 2020 17:46:23 -0700 (PDT)
Received: from localhost ([2601:483:4200:9113:fdae:121b:56a3:4870])
        by smtp.gmail.com with ESMTPSA id a17sm488148qka.37.2020.05.05.17.46.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2020 17:46:23 -0700 (PDT)
From:   =?UTF-8?q?Fran=C3=A7ois-Xavier=20Carton?= <fx.carton91@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     =?UTF-8?q?Fran=C3=A7ois-Xavier=20Carton?= <fx.carton91@gmail.com>
Subject: [PATCH 2/3] HID: gamecube-adapter: add rumble support
Date:   Wed,  6 May 2020 02:48:00 +0200
Message-Id: <20200506004801.9478-2-fx.carton91@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200506004801.9478-1-fx.carton91@gmail.com>
References: <20200506004801.9478-1-fx.carton91@gmail.com>
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
 drivers/hid/hid-gamecube-adapter.c | 61 +++++++++++++++++++++++++++++-
 2 files changed, 68 insertions(+), 1 deletion(-)

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
index 0537ece0979a..b4022ff5b4b4 100644
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
@@ -54,14 +55,17 @@ enum gamecube_btn {
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
 };
 
 static int gamecube_hid_send(struct hid_device *hdev, const u8 *data, size_t n)
@@ -83,6 +87,49 @@ static int gamecube_send_cmd_init(struct hid_device *hdev)
 	return gamecube_hid_send(hdev, initcmd, sizeof(initcmd));
 }
 
+#ifdef CONFIG_HID_GAMECUBE_ADAPTER_FF
+static int gamecube_send_cmd_rumble(struct hid_device *hdev, struct gamecube_ctrl *ctrls)
+{
+	u8 cmd[5] = {GC_CMD_RUMBLE};
+	unsigned long flags;
+	unsigned int i;
+
+	for (i = 0; i < 4; i++) {
+		if (!(ctrls[i].flags & GC_TYPES) || !(ctrls[i].flags & GC_FLAG_EXTRAPOWER))
+			continue;
+		spin_lock_irqsave(&ctrls[i].rumble_lock, flags);
+		cmd[i + 1] = ctrls[i].rumble;
+		spin_unlock_irqrestore(&ctrls[i].rumble_lock, flags);
+	}
+	return gamecube_hid_send(hdev, cmd, sizeof(cmd));
+}
+
+static void gamecube_rumble_worker(struct work_struct *work)
+{
+	struct gamecube_adapter *adpt = container_of(work, struct gamecube_adapter,
+						  work_rumble);
+
+	gamecube_send_cmd_rumble(adpt->hdev, adpt->ctrls);
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
@@ -134,6 +181,11 @@ static int gamecube_ctrl_create(struct gamecube_ctrl *ctrl)
 		input_set_capability(input, EV_KEY, gamecube_buttons[i]);
 	for (i = 0; i < ARRAY_SIZE(gamecube_axes); i++)
 		input_set_abs_params(input, gamecube_axes[i], 0, 255, 0, 0);
+#ifdef CONFIG_HID_GAMECUBE_ADAPTER_FF
+	input_set_capability(input, EV_FF, FF_RUMBLE);
+	if (input_ff_create_memless(input, NULL, gamecube_rumble_play))
+		hid_warn(hdev, "failed to create ff memless\n");
+#endif
 
 	ret = input_register_device(input);
 	if (ret)
@@ -269,7 +321,11 @@ static struct gamecube_adapter* gamecube_adpt_create(struct hid_device *hdev)
 		adpt->ctrls[i].adpt = adpt;
 		INIT_WORK(&adpt->ctrls[i].work_connect, gamecube_work_connect_cb);
 		spin_lock_init(&adpt->ctrls[i].flags_lock);
+		spin_lock_init(&adpt->ctrls[i].rumble_lock);
 	}
+#ifdef CONFIG_HID_GAMECUBE_ADAPTER_FF
+	INIT_WORK(&adpt->work_rumble, gamecube_rumble_worker);
+#endif
 
 	return adpt;
 }
@@ -281,6 +337,9 @@ static void gamecube_adpt_destroy(struct gamecube_adapter* adpt)
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

