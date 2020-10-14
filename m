Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6424228DCD9
	for <lists+linux-input@lfdr.de>; Wed, 14 Oct 2020 11:21:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731086AbgJNJUn (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 14 Oct 2020 05:20:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731034AbgJNJUm (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 14 Oct 2020 05:20:42 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4735BC004589
        for <linux-input@vger.kernel.org>; Tue, 13 Oct 2020 18:31:14 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id k18so826018wmj.5
        for <linux-input@vger.kernel.org>; Tue, 13 Oct 2020 18:31:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WL3sng7QpX7QEjacraery+XHjV5uiZdX8/M9YtCJ40U=;
        b=uP4qxdwvfRVNf62JlK+s86IKNbOWfbt6XnO9M1ib/vynnVdxXpk1w190GhY/CEYdbq
         LpFUDwop3bLpisWJDSNhjJn34m91sJh35bmrhcaissjB7vtfzPrib6JqRZBKcKaJLeIh
         rfrZznhSdXeLRfI30dYc0DK8/KZZZ0nRg7wQpy8h2iJ3WR49buRPAr7TM7VRAQIMTcC8
         lG9LX4o0XMls+4nM0rQZyqygV/QKNmvxKj2kEiFzUPO7NHRGTSPBLqpQsIyp2Eo/rDzH
         2/CpEWebwALp3IPz0fjrGWzXIXvkRFfjWyphYzQbU3zAZa4Ofvd32xtkONHAPNQau/C3
         LLWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WL3sng7QpX7QEjacraery+XHjV5uiZdX8/M9YtCJ40U=;
        b=o/yERbmQD1hnBSsNIcB6n5AilA+BqiOoJBqBPSFNt4dmDdnsws3KpIMCdrRKWfcG6b
         ZYBcG5/ZJIsknk76aybxAfnTAQOGbAJccFvRblDUWAhDnua25ZNCaEIpVPbbL5B0t3KR
         I4S669sXqakD5xsYYHIsQOhaVDHJ0Be/N77RrYT3b3q7V9eKxKzqf3URPmCOsZQfF6TW
         76JaMctlNOIDOJYcCeh/O4pzzTlcYIiXDiDsGfZrlf0ZyD9w4BzYgtQVQxwSbe9BMatk
         w2bCD0EpzHexxZppdJYWMiLG5meYVU85eTLAlysM0mdaN2kj7XMT89NBhjHy4KVCj/JF
         QDtg==
X-Gm-Message-State: AOAM530XZ22GU9141H6Av7VKHN1xf/lDXcUyK6to0lBTUm8N0FKp31lp
        qz9hOkTuYMNtaLOaHsDDbZFrYvyUlx+hV53a
X-Google-Smtp-Source: ABdhPJyxO8ent/w225W1Sda2hOqgHab4aWzQVGXuXd12TC0zQ86KMvpSJUNCYR28ar1dlTdRQCHl4w==
X-Received: by 2002:a1c:ed19:: with SMTP id l25mr896019wmh.49.1602639072783;
        Tue, 13 Oct 2020 18:31:12 -0700 (PDT)
Received: from localhost (242.19.86.79.rev.sfr.net. [79.86.19.242])
        by smtp.gmail.com with ESMTPSA id b25sm1052752wmj.21.2020.10.13.18.31.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2020 18:31:12 -0700 (PDT)
From:   =?UTF-8?q?Fran=C3=A7ois-Xavier=20Carton?= <fx.carton91@gmail.com>
To:     linux-input@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     =?UTF-8?q?Fran=C3=A7ois-Xavier=20Carton?= <fx.carton91@gmail.com>,
        Ethan Lee <flibitijibibo@gmail.com>,
        Bastien Nocera <hadess@hadess.net>
Subject: [PATCH v3 3/4] HID: gamecube-adapter: add auto calibration
Date:   Wed, 14 Oct 2020 03:30:22 +0200
Message-Id: <20201014013023.23078-4-fx.carton91@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201014013023.23078-1-fx.carton91@gmail.com>
References: <20201014013023.23078-1-fx.carton91@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The axes do not cover the full 0-255 range, with different limit values
for each axis. The minimal and maximal values are recorded for each axis
and the values are remapped from that range to 0-255.

Signed-off-by: François-Xavier Carton <fx.carton91@gmail.com>
---
 drivers/hid/hid-gamecube-adapter.c | 24 ++++++++++++++++++------
 1 file changed, 18 insertions(+), 6 deletions(-)

diff --git a/drivers/hid/hid-gamecube-adapter.c b/drivers/hid/hid-gamecube-adapter.c
index d0bf09ba2762..53d372a24277 100644
--- a/drivers/hid/hid-gamecube-adapter.c
+++ b/drivers/hid/hid-gamecube-adapter.c
@@ -56,6 +56,8 @@ struct gamecube_ctrl {
 	struct input_dev __rcu *input;
 	struct gamecube_adpt *adpt;
 	enum gamecube_ctrl_flags flags;
+	u8 axis_min[6];
+	u8 axis_max[6];
 	u8 rumble;
 	struct work_struct work_connect;
 	spinlock_t flags_lock;
@@ -264,6 +266,7 @@ static void gamecube_ctrl_handle_report(struct gamecube_ctrl *ctrl, u8 *data)
 	u16 btns = data[1] << 8 | data[2];
 	u8 old_flags, new_flags = data[0];
 	unsigned long irq_flags;
+	unsigned int i;
 
 	spin_lock_irqsave(&ctrl->flags_lock, irq_flags);
 	old_flags = ctrl->flags;
@@ -271,6 +274,11 @@ static void gamecube_ctrl_handle_report(struct gamecube_ctrl *ctrl, u8 *data)
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
@@ -294,12 +302,16 @@ static void gamecube_ctrl_handle_report(struct gamecube_ctrl *ctrl, u8 *data)
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
+
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

