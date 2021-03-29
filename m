Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD71534D48B
	for <lists+linux-input@lfdr.de>; Mon, 29 Mar 2021 18:11:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229468AbhC2QKd (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 29 Mar 2021 12:10:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229689AbhC2QKd (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 29 Mar 2021 12:10:33 -0400
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EED22C061574;
        Mon, 29 Mar 2021 09:10:32 -0700 (PDT)
Received: by mail-pl1-x630.google.com with SMTP id o2so4620325plg.1;
        Mon, 29 Mar 2021 09:10:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GLY3ymCl5yT9GXpslLzZrF5s6T8lhJSvt/auSZruXfQ=;
        b=SS7rYxURdRFmyT8+DqnMEGRlWazLI0t4f4bknpfN6C/T7fb7ZG5GkDwSDJk/g86UdC
         uLSUuXZuovWKry6ythBCWhXmDZsqYI47o4fyMI0iZOASm8XuIGaAn7DFaSwS0uUQtVO4
         +fawJ6vWw1MsFMxpmeDB4eaWX3O97dqoF+8sw23w8b0vsmENlArckSF7dpYcvMC7qLNy
         B87Y++pNVXcXExCeXKKaT+hMivd1/vgNR5nVXohUwSYzKTb95Krf1VCxURT4eR/YlFh8
         ZEwx4zDPjyr5SdyaEblR/dpKIjtmrK3uV2IF8vQmpz//pUNICuzpyC6uSbqIqy5RAI+v
         1vmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GLY3ymCl5yT9GXpslLzZrF5s6T8lhJSvt/auSZruXfQ=;
        b=QUxJ+qny7WuIiD/4vhmJJ8fqUgEwsOUSZjK6RCWM4+HTK7WbDrrvss/pGIyQUniI1G
         9oXNGDIOCpKeCuQfkmDm3e4DCLaoXBk7EJ+/OaI9F1Tw9vc2s8XBPoKH5QU6mKC3v62s
         eHB4FIHe94J/n7awFq1bxskRtn3MaMhMPf7AUSZ7PC8IwqGpPoXj+4mxsHYkvCoO/1v1
         CvzQ0ZAgQ0CbOuN+gtaPFTLoEp9UHpKkp0zAnbkpl3zZdQNYA+NJijhbLfaKga3SThZT
         o9ipK5yiy8M6t7fLQoTQQXNdHie8HvuGAPrppy6JXDBtViwRXKJy+MaEH1Uxqn59co+C
         hdHw==
X-Gm-Message-State: AOAM531kSYJ+AF28KRRNs98HrsdGZBDbIxOYorlE0tPI/pv6JYeIwrQW
        ngLjpgc0CrqGjLW35K9ZNUg=
X-Google-Smtp-Source: ABdhPJx8fWM+QByHKswdlWX1ZeEgyyPCiXaQbkm41Iv2W6QvvMrGpHB700aH6K1vE4LDLHOmowI1Wg==
X-Received: by 2002:a17:90a:7186:: with SMTP id i6mr28458814pjk.191.1617034232430;
        Mon, 29 Mar 2021 09:10:32 -0700 (PDT)
Received: from nirenjan.com ([138.68.227.108])
        by smtp.gmail.com with ESMTPSA id q1sm8403016pgf.20.2021.03.29.09.10.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Mar 2021 09:10:31 -0700 (PDT)
From:   Nirenjan Krishnan <nirenjan@gmail.com>
To:     jikos@kernel.org, benjamin.tissoires@redhat.com
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Nirenjan Krishnan <nirenjan@gmail.com>
Subject: [PATCH] HID: quirks: Set INCREMENT_USAGE_ON_DUPLICATE for Saitek X65
Date:   Mon, 29 Mar 2021 09:10:02 -0700
Message-Id: <20210329161002.13202-1-nirenjan@gmail.com>
In-Reply-To: <20210323053511.17887-1-nirenjan@gmail.com>
References: <20210323053511.17887-1-nirenjan@gmail.com>
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

