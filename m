Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C68761CEF5F
	for <lists+linux-input@lfdr.de>; Tue, 12 May 2020 10:44:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729047AbgELIod (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 12 May 2020 04:44:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725868AbgELIoc (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 12 May 2020 04:44:32 -0400
Received: from mail-qv1-xf41.google.com (mail-qv1-xf41.google.com [IPv6:2607:f8b0:4864:20::f41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35CC5C061A0E
        for <linux-input@vger.kernel.org>; Tue, 12 May 2020 01:44:32 -0700 (PDT)
Received: by mail-qv1-xf41.google.com with SMTP id a4so2734128qvj.3
        for <linux-input@vger.kernel.org>; Tue, 12 May 2020 01:44:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=00WvLbTJMjzGOjQ1qyn39xJkeLMGMArXryJMzS4F5zY=;
        b=mDpnNCEnntbLPPOqEyH++3/v5S5J8wunGMhsoJVsL22OejsGVS546FRlpJ/VplJ8L3
         jQjf2ybkjHeL+fLuOENkaACwE6kYLFbxCD1VOaxkW/7YP2187N+D3Zrg1ZmG2Gznetrs
         0triVvO+pdFjxRZCL7dFF3wk7UvSvEl0SWXKK+6acharKJ/yWwpwINbT37aZUgkJFp+A
         1o0Mh7DbjIkcOPLuo84/SFLFc7jILNhLNjvwcWVJ8Wjs+zCXodizzI6opo/s2dkE4NII
         DRP0JCxi9ZxI1CXTgqzJvidc2gYJvWV45yVAR2wSiRpnz5gNJlyUnhdSmR6yihi2glrP
         CSeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=00WvLbTJMjzGOjQ1qyn39xJkeLMGMArXryJMzS4F5zY=;
        b=LtvCRgH7t2LPTDkqJX0macJk7iiU9sbS4khA6bHYdOF9UACSJ75yHMR0J341apBnIF
         jY0J039tBYqN0MJWuDGjx/Y1asrqfapaL8rjH+i9VqDPACxoL4MDZgoQkvrm3KTlsxGv
         re43A9wpA8o7KyT17PeidV4GzEKOp3SJyUJyZaMvdncwpgrDlYwPZe9MXg1yueQt82Qa
         OC18DGYYvy2ksmcXIvyOBAx1BiXehzu5hQPqIdzErp7gSI+Nbt7aBIThO521O0v0EjLs
         MUM5X/CvRJqAH6pCld/7TRA264468AbEbkTZH76Ng9FYLQffkaDG5uLzSTtrwfGlzSk+
         sO8g==
X-Gm-Message-State: AOAM5334S/l0C+SgOeN5hOecMZEeMOZo6I/uCMRYhjb7EAnJALKuXe95
        KbE/JA6Smx7JVqBm/HArPhxGq1p6CPQ=
X-Google-Smtp-Source: ABdhPJw+hkU5Uw33Fax9t1um9bR8Aezcnp4X/N3e/0iSeeNpvb/55SET58l46JiJuxzF+MK9K9EFzQ==
X-Received: by 2002:a05:6214:18f3:: with SMTP id ep19mr832894qvb.45.1589273071364;
        Tue, 12 May 2020 01:44:31 -0700 (PDT)
Received: from localhost ([2601:483:4200:9113:fdae:121b:56a3:4870])
        by smtp.gmail.com with ESMTPSA id d7sm10610990qkk.26.2020.05.12.01.44.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2020 01:44:31 -0700 (PDT)
From:   =?UTF-8?q?Fran=C3=A7ois-Xavier=20Carton?= <fx.carton91@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     Ethan Lee <flibitijibibo@gmail.com>,
        Bastien Nocera <hadess@hadess.net>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Subject: [PATCH v2 3/4] HID: gamecube-adapter: add auto calibration
Date:   Tue, 12 May 2020 10:46:15 +0200
Message-Id: <20200512084616.32158-3-fx.carton91@gmail.com>
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

The axes do not cover the full 0-255 range, with different limit values
for each axis. The minimal and maximal values are recorded for each axis
and the values are remapped from that range to 0-255.

Signed-off-by: François-Xavier Carton <fx.carton91@gmail.com>
---
 drivers/hid/hid-gamecube-adapter.c | 23 +++++++++++++++++------
 1 file changed, 17 insertions(+), 6 deletions(-)

diff --git a/drivers/hid/hid-gamecube-adapter.c b/drivers/hid/hid-gamecube-adapter.c
index 028ce005c9e3..efcbd8f27b67 100644
--- a/drivers/hid/hid-gamecube-adapter.c
+++ b/drivers/hid/hid-gamecube-adapter.c
@@ -55,6 +55,8 @@ enum gamecube_btn {
 struct gamecube_ctrl {
 	struct input_dev __rcu *input;
 	enum gamecube_ctrl_flags flags;
+	u8 axis_min[6];
+	u8 axis_max[6];
 	u8 rumble;
 	struct gamecube_adapter *adpt;
 	struct work_struct work_connect;
@@ -258,6 +260,7 @@ static void gamecube_ctrl_handle_report(struct gamecube_ctrl *ctrl, u8 *data)
 	u16 btns = data[1] << 8 | data[2];
 	u8 old_flags, new_flags = data[0];
 	unsigned long irq_flags;
+	unsigned int i;
 
 	spin_lock_irqsave(&ctrl->flags_lock, irq_flags);
 	old_flags = ctrl->flags;
@@ -265,6 +268,11 @@ static void gamecube_ctrl_handle_report(struct gamecube_ctrl *ctrl, u8 *data)
 	spin_unlock_irqrestore(&ctrl->flags_lock, irq_flags);
 
 	if ((new_flags & GC_TYPES) != (old_flags & GC_TYPES)) {
+		// Reset min/max values. The default values were obtained empirically
+		for (i = 0; i < 6; i++) {
+			ctrl->axis_min[i] = 45; // max across all axes of min values
+			ctrl->axis_max[i] = 215; // min across all axes of max values
+		}
 		schedule_work(&ctrl->work_connect);
 		return;
 	}
@@ -288,12 +296,15 @@ static void gamecube_ctrl_handle_report(struct gamecube_ctrl *ctrl, u8 *data)
 	input_report_key(dev, BTN_DPAD_RIGHT, btns & GC_BTN_DPAD_RIGHT);
 	input_report_key(dev, BTN_DPAD_DOWN, btns & GC_BTN_DPAD_DOWN);
 	input_report_key(dev, BTN_DPAD_UP, btns & GC_BTN_DPAD_UP);
-	input_report_abs(dev, ABS_X, data[3]);
-	input_report_abs(dev, ABS_Y, 255 - data[4]);
-	input_report_abs(dev, ABS_RX, data[5]);
-	input_report_abs(dev, ABS_RY, 255 - data[6]);
-	input_report_abs(dev, ABS_Z, data[7]);
-	input_report_abs(dev, ABS_RZ, data[8]);
+	for (i = 0; i < 6; i++) {
+		u8 a, b, v = data[3 + i];
+		a = ctrl->axis_min[i] = min(ctrl->axis_min[i], v);
+		b = ctrl->axis_max[i] = max(ctrl->axis_max[i], v);
+		v = 255U * (v - a) / (b - a);
+		if (gamecube_axes[i] == ABS_Y || gamecube_axes[i] == ABS_RY)
+			v = 255U - v;
+		input_report_abs(dev, gamecube_axes[i], v);
+	}
 	input_sync(dev);
 
 unlock:
-- 
2.26.2

