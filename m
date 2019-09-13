Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 26B65B27DD
	for <lists+linux-input@lfdr.de>; Sat, 14 Sep 2019 00:03:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403794AbfIMWDX (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 13 Sep 2019 18:03:23 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:37025 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389815AbfIMWDX (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 13 Sep 2019 18:03:23 -0400
Received: by mail-pf1-f196.google.com with SMTP id y5so16165267pfo.4
        for <linux-input@vger.kernel.org>; Fri, 13 Sep 2019 15:03:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5OuUUYePxpHluCqMl7cvfllWii8PgjzTxgE9+4rxXRM=;
        b=ZKFaxzvWbhRmu4uN/9qxncrxzMsoDyXA3zns7wrGS75pXmzy0AKIHEhTb5ikpfucyR
         c3XuA4tHbMivSmlOavtBIf/v8rQxgAgkdlQXPCd4heteRYJHEATd/4UlHvGJTngZjT87
         mZw6Po9kl50Ad/koB+J1mrjckoQCmoJ/0yadY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5OuUUYePxpHluCqMl7cvfllWii8PgjzTxgE9+4rxXRM=;
        b=mNPiZfOIl4n1baiyrwcc3u0uX8aIsPdoYloCvGihZTys2xEzr5syIMSD8EaoPsItN0
         3xH3sGCkNPUqadqmqqM5xnuWByUkVg3rba1M0RJVP4o2V8lsuktHzf7UcPFeLn2seBvT
         GxybyDKv+tk/AXuCCJUD8O+WNK5ZWpbdcUW/kqBwGqgrxmTtvDc3zBUUr4c5lEh1VGNp
         rVORCVekMmHrQTGFht+eN6kbQfMFUVOp+4DuG69nGtsfa2mYrNbNRAznnBdI7dyodFsn
         7A7LCzmhzZZ659AiuYDoS2B0TDeT8wOJu5YZWcuCol1ElHNLbz1Aqgu2QpU8a9N1Vjha
         Vhmg==
X-Gm-Message-State: APjAAAVECN38P7OjowMttQZres8a9xdpR55M/PicHx/P1PBDE9GaRdYu
        sXknXJMi1q+d+4aY9F4bnhw6IA==
X-Google-Smtp-Source: APXvYqzKmKHK77rdEuBzDi0l1gLCv207/3lzWYVAdIll1ShglSz2Vkv1JOJ6nXMEhcOaN+r8ppGAtw==
X-Received: by 2002:a63:29c7:: with SMTP id p190mr9445210pgp.124.1568412202462;
        Fri, 13 Sep 2019 15:03:22 -0700 (PDT)
Received: from dtor-ws.mtv.corp.google.com ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id o19sm2524486pjr.23.2019.09.13.15.03.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Sep 2019 15:03:21 -0700 (PDT)
From:   Dmitry Torokhov <dtor@chromium.org>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Nicolas Boichat <drinkcat@chromium.org>,
        Benson Leung <bleung@chromium.org>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] HID: google: whiskers: signal tablet mode switch on disconnect
Date:   Fri, 13 Sep 2019 15:03:16 -0700
Message-Id: <20190913220317.58289-2-dtor@chromium.org>
X-Mailer: git-send-email 2.23.0.237.gc6a4ce50a0-goog
In-Reply-To: <20190913220317.58289-1-dtor@chromium.org>
References: <20190913220317.58289-1-dtor@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Currently, the tablet mode switch that takes two signals as its input:
base attached switch from the EC and some GMR signal from whiskers when
it's folded over. This tablet mode switch is then sent to Chrome, which
changes the UI.

However, there are some units which have a lot of leakage on the ADC
pins that the EC uses to determine whether or not a base is attached.
This can result in the base being physically detached, but the EC
thinking that it's still attached. The user would then be stuck in
laptop mode and wouldn't be able to rotate their display.

To work around this let's send "tablet mode" signal when we remove HID
interface, which normally happens when we physically disconnect
whiskers.

Signed-off-by: Dmitry Torokhov <dtor@chromium.org>
---
 drivers/hid/hid-google-hammer.c | 24 +++++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/hid-google-hammer.c b/drivers/hid/hid-google-hammer.c
index 4f64f93ddfcb..3dc6116c8f76 100644
--- a/drivers/hid/hid-google-hammer.c
+++ b/drivers/hid/hid-google-hammer.c
@@ -498,11 +498,33 @@ static int hammer_probe(struct hid_device *hdev,
 
 static void hammer_remove(struct hid_device *hdev)
 {
+	unsigned long flags;
+
 	if (hdev->product == USB_DEVICE_ID_GOOGLE_WHISKERS &&
-			hammer_is_keyboard_interface(hdev))
+			hammer_is_keyboard_interface(hdev)) {
 		hid_hw_close(hdev);
 
+		/*
+		 * If we are disconnecting then most likely Whiskers is
+		 * being removed. Even if it is not removed, without proper
+		 * keyboard we should not stay in clamshell mode.
+		 *
+		 * The reason for doing it here and not waiting for signal
+		 * from EC, is that on some devices there are high leakage
+		 * on Whiskers pins and we do not detect disconnect reliably,
+		 * resulting in devices being stuck in clamshell mode.
+		 */
+		spin_lock_irqsave(&cbas_ec_lock, flags);
+		if (cbas_ec.input && cbas_ec.base_present) {
+			input_report_switch(cbas_ec.input, SW_TABLET_MODE, 1);
+			input_sync(cbas_ec.input);
+		}
+		cbas_ec.base_present = false;
+		spin_unlock_irqrestore(&cbas_ec_lock, flags);
+	}
+
 	hammer_unregister_leds(hdev);
+
 	hid_hw_stop(hdev);
 }
 
-- 
2.23.0.237.gc6a4ce50a0-goog

