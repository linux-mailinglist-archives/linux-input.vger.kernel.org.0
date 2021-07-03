Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C49FD3BAA69
	for <lists+linux-input@lfdr.de>; Sun,  4 Jul 2021 00:02:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229909AbhGCWFG (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 3 Jul 2021 18:05:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229829AbhGCWFE (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sat, 3 Jul 2021 18:05:04 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64BD6C061762;
        Sat,  3 Jul 2021 15:02:29 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id bu12so22684410ejb.0;
        Sat, 03 Jul 2021 15:02:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+O8+Zi9puyRTTAamekj8g8xOH1F+G/ZtA4Tok7ByIfU=;
        b=ULOlkg/UY/F+BgGVRQHa5EkdnzLJuQtQFByY+4VGQoSs+vSEEMnncy28a8ECZK/ura
         /1sN4zzTjkdx8Q95CWpmD3Q01evgSX+xAh1yueFvmGIZdwra21w7iV/rNSt3xwLnAxbG
         3c8s3QR8Mdi8d9Z8eRxgdJ/zf2zXZ3VHoNjgPeoVTxSHvAxLXJPDoTu6ckSO6TGUpUK1
         +KbsQWDwXqilFoxYWgPhCnOHNY6FgIspcV9YIGtG1tFzXtrxSdRHj6+1Sq5Tk8aNrhIH
         qXsmNaarr4mFz9rFDn3dqKeURjKmdUVdTzWe51qlWffZIt4h7UmAMs0nMdPRcnzg0407
         Yu6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+O8+Zi9puyRTTAamekj8g8xOH1F+G/ZtA4Tok7ByIfU=;
        b=fQfXTEmy+DduBG2wV2QGuxJcXngbpIm/abehPvHCag0wpdBjQ9PwM3B3AUBclC2zl8
         kLZOMSf3HabKu2wRD6OxN2mMkpn+/59g/KQC8PjrKsF91TFasR0RT++sKJkgBeRkXVil
         ZkNGow5Y+a2xz00xkYrXbBNBVVfkPUxCShlvXxRHo8Evvwo9artyHeV6jUkseC4OdxBt
         e7B36nXu0FOQKi4O06tlcDMLcQR047I3PEGh5BGOp2rT05p4Hln05b9wxK+xz0y63V1F
         FibkOK3WjtDkqX7dQttDGC/dlq1Z9Auzfn4nqUsQyy9Q2vNXWjhmESMWqQVgY39u8qqp
         j1zg==
X-Gm-Message-State: AOAM532xJahj96PMkG0II8xYXiewb5bYntW4HO2U/7LuO4gBeIPutebf
        44ioUyf05Y7D2KJ9SQVj0GY=
X-Google-Smtp-Source: ABdhPJzJ7K4mhloNSty6ggf/97FhlNrNAlsrWISaRetPeTAvablVzrF3VRhJcB3iVt0bHEBjpl2iSA==
X-Received: by 2002:a17:907:3da7:: with SMTP id he39mr1745718ejc.512.1625349747961;
        Sat, 03 Jul 2021 15:02:27 -0700 (PDT)
Received: from warrior.lan ([2a03:7380:2407:bc63:7e28:eb67:305b:8ba0])
        by smtp.gmail.com with ESMTPSA id b25sm3186110edv.9.2021.07.03.15.02.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Jul 2021 15:02:27 -0700 (PDT)
From:   Maxim Mikityanskiy <maxtram95@gmail.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Daniel Kurtz <djkurtz@chromium.org>,
        Oliver Neukum <oneukum@suse.de>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Maxim Mikityanskiy <maxtram95@gmail.com>
Subject: [PATCH 3/6] HID: plantronics: Expose headset LEDs
Date:   Sun,  4 Jul 2021 01:01:59 +0300
Message-Id: <20210703220202.5637-4-maxtram95@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210703220202.5637-1-maxtram95@gmail.com>
References: <20210703220202.5637-1-maxtram95@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

hid-plantronics uses a custom input mapping, where unhandled usages get
ignored. Although these headsets have LEDs, they aren't handled in
plantronics_input_mapping, hence not exposed to the userspace. This
commit fixes it by adding a case for HID_UP_LED.

Tested with Plantronics Blackwire 3220 Series (047f:c056).

Signed-off-by: Maxim Mikityanskiy <maxtram95@gmail.com>
---
 drivers/hid/hid-plantronics.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/hid/hid-plantronics.c b/drivers/hid/hid-plantronics.c
index e81b7cec2d12..ea056235a591 100644
--- a/drivers/hid/hid-plantronics.c
+++ b/drivers/hid/hid-plantronics.c
@@ -61,6 +61,10 @@ static int plantronics_input_mapping(struct hid_device *hdev,
 	if (field->application == HID_GD_JOYSTICK)
 		goto defaulted;
 
+	/* expose LEDs */
+	if ((usage->hid & HID_USAGE_PAGE) == HID_UP_LED)
+		goto defaulted;
+
 	/* handle volume up/down mapping */
 	/* non-standard types or multi-HID interfaces - plt_type is PID */
 	if (!(plt_type & HID_USAGE_PAGE)) {
-- 
2.32.0

