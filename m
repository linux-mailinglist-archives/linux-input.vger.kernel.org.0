Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8603934575D
	for <lists+linux-input@lfdr.de>; Tue, 23 Mar 2021 06:36:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229472AbhCWFfd (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 23 Mar 2021 01:35:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229452AbhCWFfX (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 23 Mar 2021 01:35:23 -0400
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8A60C061574;
        Mon, 22 Mar 2021 22:35:22 -0700 (PDT)
Received: by mail-pf1-x42c.google.com with SMTP id l123so13130431pfl.8;
        Mon, 22 Mar 2021 22:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GLY3ymCl5yT9GXpslLzZrF5s6T8lhJSvt/auSZruXfQ=;
        b=orFLt0F0qgN/aGMGyrs/We8qyALwk99UUVUHdrDv0NgSa5zdlwMIKJaQStT1vx7/MW
         bhq9CAFtGTkCPIM0IE9nuERpK4b0Ca0mHEncTonil1OX4aAIsRoaY87FSEuHbk4DbIyj
         eFelw2hshSxFC6UFtMtXJ6C6ylC2WCPNs+mBDPvkmiL8yO4NZfh+/+DKANeKUaEeeJLl
         I7qlMiksgpb0UYOYLJxNMKqYNzfXqvFvHxdWBkVHiaC4tywmVUP2heI3h+JiyKB6VKZs
         e8/1Pii8PJgFa/I9694AC73QkiK/aIV0nHI8WulYj2Ywvu02qPfDDfDC3YkQqhFQcmP/
         ef/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GLY3ymCl5yT9GXpslLzZrF5s6T8lhJSvt/auSZruXfQ=;
        b=hKA/czLYD3+84GG9R0WNvjyz4Rpi06g+65yAmqonyaBLocHskXIcNVs6rZv5kdcaZs
         S5P5B1cJKH7TQ/I4DyjMlbX3gE1aS9cnLDFq1ZdN3CHgGk6FpQsggKiFozEeqq87O4UA
         jc+a4VFWpfIT4md6bu3QPDCESHUtrqfHb4rIDHGxJrYnRI15wYu5O/Q1HYDsGJflJaxT
         Qa1rLnwcu4F9ZIk0l7/5IEVnDHvuFze1ms+7CVQOgZyAV1UyT9l2foWHcftQHr1wyHdo
         QjG03OyWsGTcrjnm+5GieXT/b/eWhgkgqEJ5iIjXrochFWaMeN4ZS9EsYuD7yM5/1/hl
         ru9Q==
X-Gm-Message-State: AOAM5314csmTqIvNKztYVTg+x6cek8O4VMvh7/UoDfc5ZW47/DdualUf
        0Ls1P5QC3jtYzzstALW+uhM=
X-Google-Smtp-Source: ABdhPJwcW3bHQ54Ai8D9mH5k0CgMAuFEsYrliBGNRjV6P5oxPNZ6wFo2L0GIRNEMm1FfTDZbYBRaBA==
X-Received: by 2002:a63:fe14:: with SMTP id p20mr2527186pgh.85.1616477722298;
        Mon, 22 Mar 2021 22:35:22 -0700 (PDT)
Received: from nirenjan.com ([138.68.227.108])
        by smtp.gmail.com with ESMTPSA id f135sm15230111pfa.102.2021.03.22.22.35.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Mar 2021 22:35:21 -0700 (PDT)
From:   Nirenjan Krishnan <nirenjan@gmail.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Nirenjan Krishnan <nirenjan@gmail.com>
Subject: [PATCH] HID: quirks: Set INCREMENT_USAGE_ON_DUPLICATE for Saitek X65
Date:   Mon, 22 Mar 2021 22:35:11 -0700
Message-Id: <20210323053511.17887-1-nirenjan@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The Saitek X65 joystick has a pair of axes that were used as mouse
pointer controls by the Windows driver. The corresponding usage page is
the Game Controls page, which is not recognized by the generic HID
driver, and therefore, both axes get mapped to ABS_MISC. The quirk makes
the second axis get mapped to ABS_MISC+1, and therefore made available
separately.

Signed-off-by: Nirenjan Krishnan <nirenjan@gmail.com>
---
 drivers/hid/hid-ids.h    | 1 +
 drivers/hid/hid-quirks.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index e42aaae..413a06a0 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -1039,6 +1039,7 @@
 #define USB_DEVICE_ID_SAITEK_X52	0x075c
 #define USB_DEVICE_ID_SAITEK_X52_2	0x0255
 #define USB_DEVICE_ID_SAITEK_X52_PRO	0x0762
+#define USB_DEVICE_ID_SAITEK_X65	0x0b6a
 
 #define USB_VENDOR_ID_SAMSUNG		0x0419
 #define USB_DEVICE_ID_SAMSUNG_IR_REMOTE	0x0001
diff --git a/drivers/hid/hid-quirks.c b/drivers/hid/hid-quirks.c
index 1a9daf0..df68dd7 100644
--- a/drivers/hid/hid-quirks.c
+++ b/drivers/hid/hid-quirks.c
@@ -158,6 +158,7 @@ static const struct hid_device_id hid_quirks[] = {
 	{ HID_USB_DEVICE(USB_VENDOR_ID_SAITEK, USB_DEVICE_ID_SAITEK_X52), HID_QUIRK_INCREMENT_USAGE_ON_DUPLICATE },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_SAITEK, USB_DEVICE_ID_SAITEK_X52_2), HID_QUIRK_INCREMENT_USAGE_ON_DUPLICATE },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_SAITEK, USB_DEVICE_ID_SAITEK_X52_PRO), HID_QUIRK_INCREMENT_USAGE_ON_DUPLICATE },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_SAITEK, USB_DEVICE_ID_SAITEK_X65), HID_QUIRK_INCREMENT_USAGE_ON_DUPLICATE },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_SEMICO, USB_DEVICE_ID_SEMICO_USB_KEYKOARD2), HID_QUIRK_NO_INIT_REPORTS },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_SEMICO, USB_DEVICE_ID_SEMICO_USB_KEYKOARD), HID_QUIRK_NO_INIT_REPORTS },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_SENNHEISER, USB_DEVICE_ID_SENNHEISER_BTD500USB), HID_QUIRK_NOGET },
-- 
2.7.4

