Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 83C8C254162
	for <lists+linux-input@lfdr.de>; Thu, 27 Aug 2020 11:02:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728074AbgH0JCJ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 27 Aug 2020 05:02:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726851AbgH0JCH (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 27 Aug 2020 05:02:07 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E243C061264;
        Thu, 27 Aug 2020 02:02:06 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id m71so3003911pfd.1;
        Thu, 27 Aug 2020 02:02:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=a7wfBcfmARfWTPt6sYN3Ma+Bz+TNjG1M1YjNUkmwtTY=;
        b=tweHP4xkQ5A+IRWIaYd3OyPfWO028bef7eOYx5dP4pFXkzzoDb/gd60G431mDS1gNk
         kvLDpW5C708Irzqyq+onWJwCh0un9cVutFI9qAh2I1Z0N46xa7Jxz3f51F5PQaIn0jfx
         /zCRYKVwVXSFimGudm3KO9s57IA0u2QWcIys8y+Izm0gtp9yVixeOeRHAgFo04QzujXC
         jzkzeNSC9bvkiLX6HpIi6kzJM9WLhnB4PHexdKbKHz4vHzBxxhVg1cncSHYALPh56FPT
         L5AEc9MERlxoM8+Gedo6vuoNV51bdkHjOYyYeSS1Tgg7SI4ESvkYf94WP8b60VJoAog4
         bhOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=a7wfBcfmARfWTPt6sYN3Ma+Bz+TNjG1M1YjNUkmwtTY=;
        b=jnvI5VtdqeWSAOxk4Jcys05Uw8mN46c0lWSN+XJiEU44DGE+rV1KStyV6kq11Z5aXY
         a2eIojRlRNqf0kzcNEzxnWZLsK8mMpAkMmmnOaGPzVJHhnxOJmVLRmiv9xiLoo1O7gkk
         wbucCXKvdrEn7Tk5k6zqeFvWHu2LL//qNleZArq+zFQzn072+ayg8mQLEdeAczkcB2Vl
         6XF8Mi0UpyKFMoczoqE2Y+SjB2LbfLolVu8q7gF8Mam1ppVivpTG+NAMu3UgfTXfR2fA
         Kqp4wUJWumL/witjsx827Lp/g14NzkgCZNEVj1BXtsuz723b5ko+jR+24TXuEQ90M6B5
         b7Lw==
X-Gm-Message-State: AOAM533RW0NiUa5Sx9IRrhzJsivF3YgKmPjYu3H5dM0g4mFm/2SDbUXb
        YeqeGKvBPXHDm0F5DsQyhL8=
X-Google-Smtp-Source: ABdhPJwG0dNDOh6QNx9RWwe1Ww05CiB8Ca2FB7gVHtFAqT/9IGtCo9FOiVHJ9izZtgN4oA0/eWCE5Q==
X-Received: by 2002:a65:468f:: with SMTP id h15mr13809707pgr.189.1598518925870;
        Thu, 27 Aug 2020 02:02:05 -0700 (PDT)
Received: from billa.force10networks.com (c-73-231-197-145.hsd1.ca.comcast.net. [73.231.197.145])
        by smtp.gmail.com with ESMTPSA id s67sm2002235pfs.117.2020.08.27.02.02.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2020 02:02:04 -0700 (PDT)
From:   nirenjan <nirenjan@gmail.com>
To:     jikos@kernel.org, benjamin.tissoires@redhat.com
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Nirenjan Krishnan <nirenjan@gmail.com>
Subject: [PATCH] HID: quirks: Set INCREMENT_USAGE_ON_DUPLICATE for all Saitek X52 devices
Date:   Thu, 27 Aug 2020 02:02:02 -0700
Message-Id: <20200827090202.336765-1-nirenjan@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200816102445.4928-1-nirenjan@gmail.com>
References: <20200816102445.4928-1-nirenjan@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Nirenjan Krishnan <nirenjan@gmail.com>

The Saitek X52 family of joysticks has a pair of axes that were
originally (by the Windows driver) used as mouse pointer controls. The
corresponding usage page is the Game Controls page, which is not
recognized by the generic HID driver, and therefore, both axes get
mapped to ABS_MISC. The quirk makes the second axis get mapped to
ABS_MISC+1, and therefore made available separately.

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

