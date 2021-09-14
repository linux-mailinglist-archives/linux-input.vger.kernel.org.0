Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E5E1C40B5E3
	for <lists+linux-input@lfdr.de>; Tue, 14 Sep 2021 19:29:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229728AbhINRah (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 14 Sep 2021 13:30:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229464AbhINRag (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 14 Sep 2021 13:30:36 -0400
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40937C061574
        for <linux-input@vger.kernel.org>; Tue, 14 Sep 2021 10:29:19 -0700 (PDT)
Received: by mail-pl1-x632.google.com with SMTP id f21so6482553plb.4
        for <linux-input@vger.kernel.org>; Tue, 14 Sep 2021 10:29:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joshua-dickens-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JkWGvTXIfHwXYlRW95rJ+kaH4qIJRS5GMFx/d+Fn9jo=;
        b=xGFJnbOlEhdGoeRhOqQ0Zkpkvrd2AY9AlEa8m4pY8Ntu/tQzhDWF2u1IUcAcfm4VmK
         fMNSsSrLngXEwD0FlnjYCrr33TOb+JHKxMSFL0EyfdpzS4VjyCBzg4BvuNw0+pFebWD/
         3IWZTBnhBtJXEQFzjESknf0R55fVamtrJIa8GxU8deLP9fpxoA37AIFi+xa96h5PplyI
         1MqsIKMhz3ZYfS5msNGfGZxXV+loMy5pGAkbLrdt4KKukdd0j9PRgyYzSFSArGb33uio
         LbM81ZF+bGKptcXIPO+wqCoAEqZLxP32W4fqF1hcmf5cVq8hjPCWVEyS6bEwI/cRWrV2
         e5Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JkWGvTXIfHwXYlRW95rJ+kaH4qIJRS5GMFx/d+Fn9jo=;
        b=Rjq8ymdfxppx0W21ufR1rGUX42OplYZaXPWDoegUAroZrb5OFWcPPemTqa+2AarKwn
         p61EK7I8Q8PgPENC1YIdqHoCem28V1fxr5EPgyChHOeiuiSS/XruRhrJcQmV23uvI+YX
         AFiX8MyRoCtwX1dgGQd18AkHqDF7P3ZE7OmL30/A2jdSr5Whw1H51MqnS3onx/HCpZKI
         k5CX3f74lGhCJdAUumhniYYSUN11JFpqxu+Oc2VCBqSuK6f+myeY7QWfOZluMwC63qJQ
         16W24j+UgtoyzuoQ9BeIYgvfhcUmjt3MU0Lib/2lI9svpSJ5jFR/trOBoNA2N/QFWbTg
         089w==
X-Gm-Message-State: AOAM531Es4wHepc7SZMOl7IDvAXFCBO7nBR/p9+MnyqNcFqzeNzLvDsq
        uIEqVfSeUcdkIuIfED3kQ22hsYomNoylzMKEXmY=
X-Google-Smtp-Source: ABdhPJzeuT6vfrLqX3JUCMgu38duKAUO6s7kWrx9/Kj1x/TGoPUn9iHhYVjud0UKMwOAOYlThHs2ig==
X-Received: by 2002:a17:90a:ab86:: with SMTP id n6mr3311531pjq.159.1631640558390;
        Tue, 14 Sep 2021 10:29:18 -0700 (PDT)
Received: from localhost.localdomain (c-73-96-148-93.hsd1.or.comcast.net. [73.96.148.93])
        by smtp.gmail.com with ESMTPSA id 126sm13479820pgi.86.2021.09.14.10.29.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Sep 2021 10:29:17 -0700 (PDT)
From:   Joshua Dickens <joshua@joshua-dickens.com>
X-Google-Original-From: Joshua Dickens <Joshua@Joshua-Dickens.com>
To:     linux-input@vger.kernel.org
Cc:     jkosina@suse.cz, ping.cheng@wacom.com,
        Joshua-Dickens <Joshua@Joshua-Dickens.com>,
        Joshua Dickens <joshua.dickens@wacom.com>
Subject: [PATCH] HID: wacom: Add new Intuos BT (CTL-4100WL/CTL-6100WL) support Added the new PID's to wacom_wac.c to support the new models in the Intuos series
Date:   Tue, 14 Sep 2021 13:28:25 -0400
Message-Id: <20210914172825.63335-1-Joshua@Joshua-Dickens.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Joshua-Dickens <Joshua@Joshua-Dickens.com>

Signed-off-by: Joshua Dickens <joshua.dickens@wacom.com>
---
 drivers/hid/wacom_wac.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/hid/wacom_wac.c b/drivers/hid/wacom_wac.c
index fd51769d0994..33a6908995b1 100644
--- a/drivers/hid/wacom_wac.c
+++ b/drivers/hid/wacom_wac.c
@@ -4746,6 +4746,12 @@ static const struct wacom_features wacom_features_0x393 =
 	{ "Wacom Intuos Pro S", 31920, 19950, 8191, 63,
 	  INTUOSP2S_BT, WACOM_INTUOS3_RES, WACOM_INTUOS3_RES, 7,
 	  .touch_max = 10 };
+static const struct wacom_features wacom_features_0x3c6 =
+	{ "Wacom Intuos BT S", 15200, 9500, 4095, 63,
+	  INTUOSHT3_BT, WACOM_INTUOS_RES, WACOM_INTUOS_RES, 4 };
+static const struct wacom_features wacom_features_0x3c8 =
+	{ "Wacom Intuos BT M", 21600, 13500, 4095, 63,
+	  INTUOSHT3_BT, WACOM_INTUOS_RES, WACOM_INTUOS_RES, 4 };
 
 static const struct wacom_features wacom_features_HID_ANY_ID =
 	{ "Wacom HID", .type = HID_GENERIC, .oVid = HID_ANY_ID, .oPid = HID_ANY_ID };
@@ -4919,6 +4925,8 @@ const struct hid_device_id wacom_ids[] = {
 	{ USB_DEVICE_WACOM(0x37A) },
 	{ USB_DEVICE_WACOM(0x37B) },
 	{ BT_DEVICE_WACOM(0x393) },
+	{ BT_DEVICE_WACOM(0x3c6) },
+	{ BT_DEVICE_WACOM(0x3c8) },
 	{ USB_DEVICE_WACOM(0x4001) },
 	{ USB_DEVICE_WACOM(0x4004) },
 	{ USB_DEVICE_WACOM(0x5000) },
-- 
2.31.1

