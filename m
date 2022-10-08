Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B41955F872F
	for <lists+linux-input@lfdr.de>; Sat,  8 Oct 2022 21:43:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229634AbiJHTnY (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 8 Oct 2022 15:43:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229597AbiJHTnX (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sat, 8 Oct 2022 15:43:23 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB9552ED66
        for <linux-input@vger.kernel.org>; Sat,  8 Oct 2022 12:43:22 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id ay36so4688493wmb.0
        for <linux-input@vger.kernel.org>; Sat, 08 Oct 2022 12:43:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:date:from
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dENEKygRwSDGf9BtYiof9f1e4xEx6iQUvp8M7Xgg++w=;
        b=qMX66aAP31wBN0iSW8w04jvqvUZ3sgREynEjfMxED3SFrHIi/er8oMOlTk87GSrtcd
         BE+28pZGpASQFXC1h9DQMxrib5RS2k/zCaIzytBglgBJQnMHRs4p+r92PaEfs1r2A8w9
         rXJ7sdHoglc1WM+PUTwzHomtRvN234xwW/4pjU8Xd4jHVY6odqC0U7tjVl8oWBiKd5Dx
         1L/wsYCTZXhrd4shy/OUmFCBt/t/zoJIOuA37ewwvJTrAEecOlhYUJodT8pXXqYBx8Wp
         hEoeLtaInNuimpvXGY53153+FRUzvTki+BLA+FVDcruhxlHORxXhkesp2hqnIJ4Eu61J
         1Vyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dENEKygRwSDGf9BtYiof9f1e4xEx6iQUvp8M7Xgg++w=;
        b=dw2aHlJQWfSDbHhFSi9hY2/xZ3D9W8M38NUD1LmYwnOVaTOHoWJdmm7gxsMF5TKnw5
         LVb94EdgUvZWGpWZrT4CTlHK0CE9UikV7X+Jh9KMMmORQOclzm+cJ8JIvz/lRXp1dKfa
         Y/tzjwd7Qcwn6ZoXa1HLdZKxk7g5h2zl/YWRE45FTqTRLDSg5JNQrUC//jwrPJ1SadZz
         5oM9vDf6frRsYzVA6cW44SpB99tVtgHME+FEoqUExFC0SvSdvaYKr5yHS/m4wQMWNUUi
         chlkUnUKpVDeIu2v9rMa+jJFQAl582593tO/UwwR8TGxRxByek2F+hNog/uJM0rvIruL
         ASvw==
X-Gm-Message-State: ACrzQf22H5wEqtjdYGa3H1SYhOsYP+MH0yBu61tQEj5aozcHgl+YA7xy
        BgGJdm/0OUGGhpDzw75vsjMVF5nH+A==
X-Google-Smtp-Source: AMsMyM60orbbNN8EDUUKHY3pf/y3yOZ24xmSKbXo8tor5kX1Lgo+7cjdaZwULTUGW3yi6reDMWMLTQ==
X-Received: by 2002:a05:600c:a4b:b0:3b9:859d:7ed6 with SMTP id c11-20020a05600c0a4b00b003b9859d7ed6mr14653521wmq.169.1665258201143;
        Sat, 08 Oct 2022 12:43:21 -0700 (PDT)
Received: from octinomon ([2a00:23c8:2f02:3b01:3ea1:40:8650:189])
        by smtp.gmail.com with ESMTPSA id p17-20020a05600c1d9100b003b47a99d928sm5239179wms.18.2022.10.08.12.43.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Oct 2022 12:43:20 -0700 (PDT)
From:   Jules Irenge <jbi.octave@gmail.com>
X-Google-Original-From: Jules Irenge <jules.irenge@postgrad.manchester.ac.uk>
Date:   Sat, 8 Oct 2022 20:43:19 +0100
To:     erazor_de@users.sourceforge.net
Cc:     jikos@kernel.org, benjamin.tissoires@redhat.com,
        linux-input@vger.kernel.org
Subject: [PATCH 1/2] HID: roccat: Convert snprintf() to sysfs_emit()
Message-ID: <Y0HS17bvjmMd2wNm@octinomon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Coccinnelle reports a warning
Warning: Use scnprintf or sprintf

Following the advice on kernel documentation
https://www.kernel.org/doc/html/latest/filesystems/sysfs.html

For show(device *...) functions we should only use sysfs_emit() or sysfs_emit_at()
especially when formatting the value to be returned to user space.

Convert snprintf() to sysfs_emit()

Signed-off-by: Jules Irenge <jules.irenge@postgrad.manchester.ac.uk>
---
 drivers/hid/hid-roccat-pyra.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/hid/hid-roccat-pyra.c b/drivers/hid/hid-roccat-pyra.c
index 4fcc8e7d276f..8b4d2519d4c4 100644
--- a/drivers/hid/hid-roccat-pyra.c
+++ b/drivers/hid/hid-roccat-pyra.c
@@ -286,7 +286,7 @@ static ssize_t pyra_sysfs_show_actual_cpi(struct device *dev,
 {
 	struct pyra_device *pyra =
 			hid_get_drvdata(dev_get_drvdata(dev->parent->parent));
-	return snprintf(buf, PAGE_SIZE, "%d\n", pyra->actual_cpi);
+	return sysfs_emit(buf, "%d\n", pyra->actual_cpi);
 }
 static DEVICE_ATTR(actual_cpi, 0440, pyra_sysfs_show_actual_cpi, NULL);
 
@@ -303,7 +303,7 @@ static ssize_t pyra_sysfs_show_actual_profile(struct device *dev,
 			&settings, PYRA_SIZE_SETTINGS);
 	mutex_unlock(&pyra->pyra_lock);
 
-	return snprintf(buf, PAGE_SIZE, "%d\n", settings.startup_profile);
+	return sysfs_emit(buf, "%d\n", settings.startup_profile);
 }
 static DEVICE_ATTR(actual_profile, 0440, pyra_sysfs_show_actual_profile, NULL);
 static DEVICE_ATTR(startup_profile, 0440, pyra_sysfs_show_actual_profile, NULL);
@@ -324,7 +324,7 @@ static ssize_t pyra_sysfs_show_firmware_version(struct device *dev,
 			&info, PYRA_SIZE_INFO);
 	mutex_unlock(&pyra->pyra_lock);
 
-	return snprintf(buf, PAGE_SIZE, "%d\n", info.firmware_version);
+	return sysfs_emit(buf, "%d\n", info.firmware_version);
 }
 static DEVICE_ATTR(firmware_version, 0440, pyra_sysfs_show_firmware_version,
 		   NULL);
-- 
2.37.3

