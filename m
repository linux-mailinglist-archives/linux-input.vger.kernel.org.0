Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E33B8227915
	for <lists+linux-input@lfdr.de>; Tue, 21 Jul 2020 08:54:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728427AbgGUGyQ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 21 Jul 2020 02:54:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726152AbgGUGyP (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 21 Jul 2020 02:54:15 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85317C0619D6
        for <linux-input@vger.kernel.org>; Mon, 20 Jul 2020 23:54:15 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id k1so1095477pjt.5
        for <linux-input@vger.kernel.org>; Mon, 20 Jul 2020 23:54:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TKKm6YpP+t24KaEGvVnFezAziarJpY1n41mTUUnSIuw=;
        b=RjCfYNg5BpAkXqtvjcR5YuEy8jfQvxW70xmJB+s/q3CR0CGy9KTZJYZK3slKSTwTcm
         QbdKoOUZwWV9AN/qtDWCPIq0T82/eMwG8eXroGgaBWZwihGDGwLu9phylx5dvKxiK4gy
         HkQ/0o2K2XYOIJOQ6usvrWtrpVBGgdHSLTaSU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TKKm6YpP+t24KaEGvVnFezAziarJpY1n41mTUUnSIuw=;
        b=Im8moGxnPeCYuhIAQBcyJpw2VDJ0RVkgwPHE7XHO8k/bi5tfc3mY+Xez/6390pspn3
         VPb83NTJhf5+RJPTAZVJq8EVWkycdVzT0zoyHEy7EJZAfmYrQi1Y24Lu6I8IQRdnStTM
         ZikFhf6zs88PFwM/XcFJk1fBMBxxZ9jDBsEkohxe7s1JrnEvBYKPagy/KB+BGHRh/DCD
         0VXE3vPT66FCVwAK2SzvYSOgaE8eav8k45ZnSEoFRvKhZ7IomnytCvmoCtnnWdWn3WGF
         /z9HUkmqPD1CVbPyfHRjJVlkmWNXgSNXgUIMaHb8QoUCHDdzbUBjVZRoW8DoGLlGcpT5
         A0oQ==
X-Gm-Message-State: AOAM5321j2OFIEcr3jAK/RhGA/ntPYYcfKADpFTrazkVBlNWbnfS95U7
        1gAemKOqT+YYlxrwNt24BDvrVWEde0U=
X-Google-Smtp-Source: ABdhPJxf/4wfg5dkyjKB7Wv7+FGC8zy3o9YXav5MSyWU17Oxl1U207xGU6H+adFOa89+NBJmWZyBCg==
X-Received: by 2002:a17:90a:e48:: with SMTP id p8mr3246698pja.210.1595314454687;
        Mon, 20 Jul 2020 23:54:14 -0700 (PDT)
Received: from ikjn-p920.tpe.corp.google.com ([2401:fa00:1:10:f693:9fff:fef4:a8fc])
        by smtp.gmail.com with ESMTPSA id o42sm1902825pje.10.2020.07.20.23.54.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2020 23:54:14 -0700 (PDT)
From:   Ikjoon Jang <ikjn@chromium.org>
To:     linux-input@vger.kernel.org
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-kernel@vger.kernel.org, Ikjoon Jang <ikjn@chromium.org>
Subject: [PATCH] HID: quirks: add NOGET quirk for Logitech GROUP
Date:   Tue, 21 Jul 2020 14:54:09 +0800
Message-Id: <20200721065409.1508737-1-ikjn@chromium.org>
X-Mailer: git-send-email 2.28.0.rc0.105.gf9edc3c819-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add HID_QUIRK_NOGET for Logitech GROUP device.

Logitech GROUP is a compound with camera and audio.
When the HID interface in an audio device is requested to get
specific report id, all following control transfers are stalled
and never be restored back.

BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=203419
Signed-off-by: Ikjoon Jang <ikjn@chromium.org>
---
 drivers/hid/hid-ids.h    | 1 +
 drivers/hid/hid-quirks.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index 2615bf17a50c..cfb75b4cb724 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -758,6 +758,7 @@
 #define USB_DEVICE_ID_LOGITECH_G27_WHEEL	0xc29b
 #define USB_DEVICE_ID_LOGITECH_WII_WHEEL	0xc29c
 #define USB_DEVICE_ID_LOGITECH_ELITE_KBD	0xc30a
+#define USB_DEVICE_ID_LOGITECH_GROUP_AUDIO	0x0882
 #define USB_DEVICE_ID_S510_RECEIVER	0xc50c
 #define USB_DEVICE_ID_S510_RECEIVER_2	0xc517
 #define USB_DEVICE_ID_LOGITECH_CORDLESS_DESKTOP_LX500	0xc512
diff --git a/drivers/hid/hid-quirks.c b/drivers/hid/hid-quirks.c
index ad1a61929548..da9763e60091 100644
--- a/drivers/hid/hid-quirks.c
+++ b/drivers/hid/hid-quirks.c
@@ -177,6 +177,7 @@ static const struct hid_device_id hid_quirks[] = {
 	{ HID_USB_DEVICE(USB_VENDOR_ID_WISEGROUP_LTD2, USB_DEVICE_ID_SMARTJOY_DUAL_PLUS), HID_QUIRK_NOGET | HID_QUIRK_MULTI_INPUT },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_WISEGROUP, USB_DEVICE_ID_QUAD_USB_JOYPAD), HID_QUIRK_NOGET | HID_QUIRK_MULTI_INPUT },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_XIN_MO, USB_DEVICE_ID_XIN_MO_DUAL_ARCADE), HID_QUIRK_MULTI_INPUT },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, USB_DEVICE_ID_LOGITECH_GROUP_AUDIO), HID_QUIRK_NOGET },
 
 	{ 0 }
 };
-- 
2.28.0.rc0.105.gf9edc3c819-goog

