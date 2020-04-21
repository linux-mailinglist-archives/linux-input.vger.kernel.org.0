Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 641611B229C
	for <lists+linux-input@lfdr.de>; Tue, 21 Apr 2020 11:25:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726120AbgDUJZW (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 21 Apr 2020 05:25:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725920AbgDUJZV (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 21 Apr 2020 05:25:21 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7761CC061A0F;
        Tue, 21 Apr 2020 02:25:21 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id f18so7197406lja.13;
        Tue, 21 Apr 2020 02:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2eNqUxlHmQxZbjBzvIB+cVBxtzTHZdPGuWALU+1BuQc=;
        b=vXEjVxcORyaMBSTK1kx8PIUh5Fi/3zOokaX15T18YWg72ZNVunm119x10n0tH2VEIg
         mxiL49BkBqH3ETDrVH+7cpFbfIvkVx9dXxjm1WZkhI2qGUA+oQC2Wj24xCeQefbX2WkM
         +Z9Q0IanckD0dv7zXPi5a2VjACyhanlR746/9SA81lOvF0bxBaZppD+D9k3hkcSqQt5P
         LD0aHgiFpdayW/IRn8MpKjp0bPc0gEkzs/tFwhsroZmqLEhiIwvbwWODXWNp7rIXWcrt
         RjvpxscxU6Hzq3eZRBRXlenTm03NL4HY7qs3KRnrp++on+g0fBawizA5SvUcIjWEvDJs
         y6wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2eNqUxlHmQxZbjBzvIB+cVBxtzTHZdPGuWALU+1BuQc=;
        b=CwzTJI6pUDY3+hqMgEmBkfAwMwWh5PAJGDqcahHfACKDX0iIkZtmYK4V9KosEH9fhD
         8/xrLtmzZOMonO47H1uW3tWtbW/TgxKl4b708198++zPgfINiiSKmtu2wYywVtm9aeUK
         3P0t94hhwd58SJkhdTCqz0T6Flj06IZVPJ4bpfpkhn6pTIOfcrV65usGu1pO7HOUwO+k
         z6XHhIfHOYR6EGFqmvwZZUIG5i2W0OCGeHa0sXpyJfsazLg9slqlWTTqpOfuFr5ytNCh
         HcDtuloHuEENba6Tgjt5FTgCm9pgFx7LedDLXhHxghcfiDh64iG1Wbf/kRsUs1d09KHM
         Yqpg==
X-Gm-Message-State: AGi0Pubbqn/pUVk8I/a0rQAovkVdkRzX75wMH0Pd4C3Vi/QWT+RuleK8
        qDV9AFWap0rEqDvyfLhhPDQ=
X-Google-Smtp-Source: APiQypL4MV/KhiOjRRXGIdWeqiujdIveb9NTnyDSR5pHsTaz94rf55nsUVZl3Nwxl4VxUjkylkvAgg==
X-Received: by 2002:a2e:85d1:: with SMTP id h17mr8912054ljj.70.1587461119870;
        Tue, 21 Apr 2020 02:25:19 -0700 (PDT)
Received: from luk-pc.lan (host-46-186-7-151.dynamic.mm.pl. [46.186.7.151])
        by smtp.googlemail.com with ESMTPSA id c203sm1670534lfd.38.2020.04.21.02.25.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2020 02:25:19 -0700 (PDT)
From:   LuK1337 <priv.luk@gmail.com>
Cc:     =?UTF-8?q?=C5=81ukasz=20Patron?= <priv.luk@gmail.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Richard Fontana <rfontana@redhat.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Allison Randal <allison@lohutok.net>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] Input: xpad - Add custom init packet for Xbox One S controllers
Date:   Tue, 21 Apr 2020 11:24:33 +0200
Message-Id: <20200421092434.3360503-1-priv.luk@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <436c79ed-ca21-c075-e2da-0934da5000a2@gmail.com>
References: <436c79ed-ca21-c075-e2da-0934da5000a2@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Łukasz Patron <priv.luk@gmail.com>

Sending [ 0x05, 0x20, 0x02, 0x0f, 0x06 ] packet for
Xbox One S controllers fixes an issue where controller
is stuck in Bluetooth mode and not sending any inputs.

Signed-off-by: Łukasz Patron <priv.luk@gmail.com>
---
 drivers/input/joystick/xpad.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
index 6b40a1c68f9f..4e1781968411 100644
--- a/drivers/input/joystick/xpad.c
+++ b/drivers/input/joystick/xpad.c
@@ -458,6 +458,15 @@ static const u8 xboxone_fw2015_init[] = {
 	0x05, 0x20, 0x00, 0x01, 0x00
 };
 
+/*
+ * This packet is required for Xbox One S pads (0x045e:0x02ea)
+ * to initialize the controller that was previously used in
+ * Bluetooth mode.
+ */
+static const u8 xboxone_s_init[] = {
+	0x05, 0x20, 0x02, 0x0f, 0x06
+};
+
 /*
  * This packet is required for the Titanfall 2 Xbox One pads
  * (0x0e6f:0x0165) to finish initialization and for Hori pads
@@ -516,6 +525,7 @@ static const struct xboxone_init_packet xboxone_init_packets[] = {
 	XBOXONE_INIT_PKT(0x0e6f, 0x0165, xboxone_hori_init),
 	XBOXONE_INIT_PKT(0x0f0d, 0x0067, xboxone_hori_init),
 	XBOXONE_INIT_PKT(0x0000, 0x0000, xboxone_fw2015_init),
+	XBOXONE_INIT_PKT(0x045e, 0x02ea, xboxone_s_init),
 	XBOXONE_INIT_PKT(0x0e6f, 0x0000, xboxone_pdp_init1),
 	XBOXONE_INIT_PKT(0x0e6f, 0x0000, xboxone_pdp_init2),
 	XBOXONE_INIT_PKT(0x24c6, 0x541a, xboxone_rumblebegin_init),
-- 
2.26.0

