Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0DB9C1C6533
	for <lists+linux-input@lfdr.de>; Wed,  6 May 2020 02:46:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729657AbgEFAq0 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 5 May 2020 20:46:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729677AbgEFAqZ (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 5 May 2020 20:46:25 -0400
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com [IPv6:2607:f8b0:4864:20::841])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A595C061A10
        for <linux-input@vger.kernel.org>; Tue,  5 May 2020 17:46:25 -0700 (PDT)
Received: by mail-qt1-x841.google.com with SMTP id g16so35947qtp.11
        for <linux-input@vger.kernel.org>; Tue, 05 May 2020 17:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TJ3Z5URSGRj1N2bEPpJHBNw4yHLCdrfa3AgxTKKb1i4=;
        b=WCHPKK2NsujLVk/cT6IMSGMyL3PJVOvlX7nha8gtNkGi7kIxk1QygVuNvKDWOyLuma
         Z/2yan8ZQeR2W10ls++dYrxBao2AUvKxoRedit2L7mTvRd8fxtuEGqQeCpUX8ugROdjo
         fVO6jPpmjuZ9UMaU9LzdqQDbov+GwwFzwymRVIO1QZrT+HXcgqCGtyRGT6kXXhElQ6Yk
         jGSkKRLYCgA+PZ2uy+MJP75SI32a90bq4QAeEFR/m+C/I7RpeZ1XbHZta/XhuGwsujQB
         F5ZcV4HnZ2gQlnaLAAr3CdedD+L3S07OVZHD1kKL5UowR/KSfTX8G7euwSnk0sOhLkh2
         VsAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TJ3Z5URSGRj1N2bEPpJHBNw4yHLCdrfa3AgxTKKb1i4=;
        b=sVX4VrbvkFeTWrawcAgdW7oSYru97IKyjrZVUB4jq1HSQlkv6d8oOn89M62IuQdQvX
         2MKXVnS6wweyM6YjFm956g8o35orvyE/JC0DXIX/2Dd/WDx9ylVGQE7Tj7VJYLf4DgCS
         3xm7+hDs1sgha5MbPRD0YiFxmgk2QZohMNTTaEHvxdfxkztFuYTB6RLWcw1OKv3PDQDb
         nGrYCtMzK1SBDXoquLOvdPKv947QDpRt2hc+TYNPFolZrTjUm36VJz/TesVsSsh4jqZz
         h+zSiisCqZaN8669qhzkn6rxAL0yHCA4MSAmo1nNMlkrtfPQCAMNZpwSDJ5M5FK/AJdo
         /geg==
X-Gm-Message-State: AGi0PuawrrMw7V0rDRanEila8VubLKh+9G7FFaHwRmUFC/2h9+k+rt6A
        HNbfuuCidPfZgedWM9p1aI5K9Uay
X-Google-Smtp-Source: APiQypKJ+HG/KGfWVpAyAUbUMDsVyqdRiMGj+gRMG1o1SVcmYGy5Kw2HoE0McKQuYON1KOWhTpIhmg==
X-Received: by 2002:aed:374a:: with SMTP id i68mr5598938qtb.69.1588725984763;
        Tue, 05 May 2020 17:46:24 -0700 (PDT)
Received: from localhost ([2601:483:4200:9113:fdae:121b:56a3:4870])
        by smtp.gmail.com with ESMTPSA id k2sm124009qte.16.2020.05.05.17.46.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2020 17:46:24 -0700 (PDT)
From:   =?UTF-8?q?Fran=C3=A7ois-Xavier=20Carton?= <fx.carton91@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     =?UTF-8?q?Fran=C3=A7ois-Xavier=20Carton?= <fx.carton91@gmail.com>
Subject: [PATCH 3/3] HID: gamecube-adapter: make axis limits parameters
Date:   Wed,  6 May 2020 02:48:01 +0200
Message-Id: <20200506004801.9478-3-fx.carton91@gmail.com>
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

The axes do not cover the full 0-255 range, with different limit values
for each axis. The limits are made module parameters so they can be
configured.

Signed-off-by: François-Xavier Carton <fx.carton91@gmail.com>
---
 drivers/hid/hid-gamecube-adapter.c | 36 +++++++++++++++++++++++++-----
 1 file changed, 30 insertions(+), 6 deletions(-)

diff --git a/drivers/hid/hid-gamecube-adapter.c b/drivers/hid/hid-gamecube-adapter.c
index b4022ff5b4b4..6a2fb908de3c 100644
--- a/drivers/hid/hid-gamecube-adapter.c
+++ b/drivers/hid/hid-gamecube-adapter.c
@@ -19,6 +19,30 @@
 #include <linux/usb.h>
 #include "usbhid/usbhid.h"
 
+static unsigned int left_stick_min = 0;
+module_param(left_stick_min, uint, 0644);
+MODULE_PARM_DESC(left_stick_min, "Minimum value for left stick.");
+
+static unsigned int left_stick_max = 255;
+module_param(left_stick_max, uint, 0644);
+MODULE_PARM_DESC(left_stick_max, "Maximum value for left stick.");
+
+static unsigned int right_stick_min = 0;
+module_param(right_stick_min, uint, 0644);
+MODULE_PARM_DESC(right_stick_min, "Minimum value for right stick (C stick).");
+
+static unsigned int right_stick_max = 255;
+module_param(right_stick_max, uint, 0644);
+MODULE_PARM_DESC(right_stick_max, "Maximum value for right stick (C stick).");
+
+static unsigned int shoulder_min = 0;
+module_param(shoulder_min, uint, 0644);
+MODULE_PARM_DESC(shoulder_min, "Minimum value for shoulders.");
+
+static unsigned int shoulder_max = 255;
+module_param(shoulder_max, uint, 0644);
+MODULE_PARM_DESC(shoulder_max, "Maximum value for shoulders.");
+
 enum gamecube_output {
 	GC_CMD_INIT = 0x13,
 	GC_CMD_RUMBLE = 0x11
@@ -136,10 +160,6 @@ static const unsigned int gamecube_buttons[] = {
 	BTN_DPAD_LEFT, BTN_DPAD_RIGHT, BTN_DPAD_DOWN, BTN_DPAD_UP
 };
 
-static const unsigned int gamecube_axes[] = {
-	ABS_X, ABS_Y, ABS_RX, ABS_RY, ABS_Z, ABS_RZ
-};
-
 static const char* gamecube_ctrl_name(enum gamecube_ctrl_flags flags)
 {
 	switch (flags & GC_TYPES) {
@@ -179,8 +199,12 @@ static int gamecube_ctrl_create(struct gamecube_ctrl *ctrl)
 
 	for (i = 0; i < ARRAY_SIZE(gamecube_buttons); i++)
 		input_set_capability(input, EV_KEY, gamecube_buttons[i]);
-	for (i = 0; i < ARRAY_SIZE(gamecube_axes); i++)
-		input_set_abs_params(input, gamecube_axes[i], 0, 255, 0, 0);
+	input_set_abs_params(input, ABS_X, left_stick_min, left_stick_max, 0, 0);
+	input_set_abs_params(input, ABS_Y, left_stick_min, left_stick_max, 0, 0);
+	input_set_abs_params(input, ABS_RX, right_stick_min, right_stick_max, 0, 0);
+	input_set_abs_params(input, ABS_RY, right_stick_min, right_stick_max, 0, 0);
+	input_set_abs_params(input, ABS_Z, shoulder_min, shoulder_max, 0, 0);
+	input_set_abs_params(input, ABS_RZ, shoulder_min, shoulder_max, 0, 0);
 #ifdef CONFIG_HID_GAMECUBE_ADAPTER_FF
 	input_set_capability(input, EV_FF, FF_RUMBLE);
 	if (input_ff_create_memless(input, NULL, gamecube_rumble_play))
-- 
2.26.2

