Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 642C525714B
	for <lists+linux-input@lfdr.de>; Mon, 31 Aug 2020 02:49:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726804AbgHaAtT (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 30 Aug 2020 20:49:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726179AbgHaAtR (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 30 Aug 2020 20:49:17 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA0CCC061573;
        Sun, 30 Aug 2020 17:49:16 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id p37so3394139pgl.3;
        Sun, 30 Aug 2020 17:49:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0Guz5EKXwEpkv/nUEhZYoZRJ0rFUuHiQDO00n0OIgRo=;
        b=RM5wdxd3U/Kntyhx05fMUd8Gxt0L9h/SAMglNvnLfGz/VT76untR5SYnEhS+4/fY7u
         fJ1BDdblWLIim8SdgS27vHtwVESsFxUSE7JoFAwcoRfQitfswP9Noudp0mv5lgIrvxdB
         fK4yeqHY0h5CPGOdN4xmjbWYCuQIHz9GfNkg37TphXOoCEk/QcWL94IsB4bQPamXZwlo
         ++yEGt4zzlJumb4UQTcct55YQImTa2CecIeSinDSIy5SwMtpywik1bL3E5ysMRdCxURb
         0kqaIqbxZUg3v3LDffYK9DMcvzMbizNLc+NY7JDKP2vVnLEKWo9Hg64YzZAx0Nul0YNI
         6IYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0Guz5EKXwEpkv/nUEhZYoZRJ0rFUuHiQDO00n0OIgRo=;
        b=Lh+Nz2ldqZkhfKmyGTDXz3QqZFNFLXNjgQH8LReFzDjUYoErDTTlO0F5zUPc2nY6eX
         TGW6/9id+ohmjfcf/o8sWburBP9qNoNr8h3cH8pqQg9S1lVe8hcAeKAISRyEjYcU1YE9
         5PnPkJIm/0DZvm2HPRLkseNrBhV4Jvfd3ZjaNHyIAGoSKCmWjgKVdhLl8WKI2nD0EmNd
         zjZnPqUIoHy2McXHvtJ/QDSgJ8yOr/Rx8ebk9psh5EMyv6SLjmeNttZWJNhf8qYa1xBz
         plL73n2K4sJnWLyZZOwRfIw/as6Nc0WFY3kfqo11+xMhc4nhEnN6XwgR2xoP/rEC6d4c
         3QqQ==
X-Gm-Message-State: AOAM532hOsXfoC/0DE58d9T8hj/qd1CkRQwlCAhi52mY0gu/16KH+ty4
        n/8Zj7fKiV1gxTXUo90JJIM=
X-Google-Smtp-Source: ABdhPJy9Q+ruWzENtv+aRxYGNyGKR9kqfdn/1y0GndRsWE4YuYVC8+GiQgMUvSrmaV8EqIh6pZ4qwA==
X-Received: by 2002:a63:3809:: with SMTP id f9mr6229037pga.18.1598834956476;
        Sun, 30 Aug 2020 17:49:16 -0700 (PDT)
Received: from billa.force10networks.com (c-73-231-197-145.hsd1.ca.comcast.net. [73.231.197.145])
        by smtp.gmail.com with ESMTPSA id u2sm5161140pjj.57.2020.08.30.17.49.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2020 17:49:15 -0700 (PDT)
From:   Nirenjan Krishnan <nirenjan@gmail.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Nirenjan Krishnan <nirenjan@gmail.com>
Subject: [PATCH] HID: quirks: Set INCREMENT_USAGE_ON_DUPLICATE for all Saitek X52 devices
Date:   Sun, 30 Aug 2020 17:48:59 -0700
Message-Id: <20200831004859.493827-2-nirenjan@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200831004859.493827-1-nirenjan@gmail.com>
References: <20200831004859.493827-1-nirenjan@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The Saitek X52 family of joysticks has a pair of axes that were
originally (by the Windows driver) used as mouse pointer controls. The
corresponding usage page is the Game Controls page, which is not
recognized by the generic HID driver, and therefore, both axes get
mapped to ABS_MISC. The quirk makes the second axis get mapped to
ABS_MISC+1, and therefore made available separately.

One Saitek X52 device is already fixed. This patch fixes the other two
known devices with VID/PID 06a3:0255 and 06a3:0762.

Signed-off-by: Nirenjan Krishnan <nirenjan@gmail.com>
---
 drivers/hid/hid-ids.h    | 2 ++
 drivers/hid/hid-quirks.c | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index 6f370e020..bc62537c4 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -1010,6 +1010,8 @@
 #define USB_DEVICE_ID_SAITEK_RAT9	0x0cfa
 #define USB_DEVICE_ID_SAITEK_MMO7	0x0cd0
 #define USB_DEVICE_ID_SAITEK_X52	0x075c
+#define USB_DEVICE_ID_SAITEK_X52_2	0x0255
+#define USB_DEVICE_ID_SAITEK_X52_PRO	0x0762
 
 #define USB_VENDOR_ID_SAMSUNG		0x0419
 #define USB_DEVICE_ID_SAMSUNG_IR_REMOTE	0x0001
diff --git a/drivers/hid/hid-quirks.c b/drivers/hid/hid-quirks.c
index 934fc0a79..6b82eda26 100644
--- a/drivers/hid/hid-quirks.c
+++ b/drivers/hid/hid-quirks.c
@@ -147,6 +147,8 @@ static const struct hid_device_id hid_quirks[] = {
 	{ HID_USB_DEVICE(USB_VENDOR_ID_RETROUSB, USB_DEVICE_ID_RETROUSB_SNES_RETROPORT), HID_QUIRK_INCREMENT_USAGE_ON_DUPLICATE },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_SAITEK, USB_DEVICE_ID_SAITEK_RUMBLEPAD), HID_QUIRK_BADPAD },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_SAITEK, USB_DEVICE_ID_SAITEK_X52), HID_QUIRK_INCREMENT_USAGE_ON_DUPLICATE },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_SAITEK, USB_DEVICE_ID_SAITEK_X52_2), HID_QUIRK_INCREMENT_USAGE_ON_DUPLICATE },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_SAITEK, USB_DEVICE_ID_SAITEK_X52_PRO), HID_QUIRK_INCREMENT_USAGE_ON_DUPLICATE },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_SEMICO, USB_DEVICE_ID_SEMICO_USB_KEYKOARD2), HID_QUIRK_NO_INIT_REPORTS },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_SEMICO, USB_DEVICE_ID_SEMICO_USB_KEYKOARD), HID_QUIRK_NO_INIT_REPORTS },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_SENNHEISER, USB_DEVICE_ID_SENNHEISER_BTD500USB), HID_QUIRK_NOGET },
-- 
2.25.1

