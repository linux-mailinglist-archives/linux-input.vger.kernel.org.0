Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F364F29E534
	for <lists+linux-input@lfdr.de>; Thu, 29 Oct 2020 08:55:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731229AbgJ2Hw6 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 29 Oct 2020 03:52:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731164AbgJ2Hw4 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 29 Oct 2020 03:52:56 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CAC77C0613D5;
        Thu, 29 Oct 2020 00:52:55 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id x13so1663208pgp.7;
        Thu, 29 Oct 2020 00:52:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=A6ZAU5wa9ktX7c0HRJNZhphUVL9FdXUzKFXAk/wiNZE=;
        b=pWwyVCfcqtvuuSvNpcb3W905YuK6YN4Vs0GmSelVFFzIYqY7r+8kpqouaKp34xOsz/
         vG3VPU7cyL3uzNkb6zDxsKPoXawhXS+N2Em60JBvP/pazRB2OVOO5uPWthZ1ber4XWe2
         uFUKdGro/DCp87x0M2PwHoCsY9a5s9gsjjD/7lnuQQ/ughA6pvU8L9QNR9cklVHVo5/c
         3ozVn+sj5I7U2y6YC4/YjJGFExpWrmnwywxQDD/ouDu3yAvAfab+qP49j78xFgWbttwl
         bVKvyqF3GSNiQCMHlNUmTQxERO7g1JOPrqyoQi6eVfTkPlwUr4VET0pR4AZgN4pB6rNk
         CUUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=A6ZAU5wa9ktX7c0HRJNZhphUVL9FdXUzKFXAk/wiNZE=;
        b=JQTvzG8+Gw3zz0odlDZ45HqkDzI3l23sUAbjV2uGjXZ/MOzw/YcYe0I6y1ftWp2o94
         /KmKPCcmAOgJin9SWE61AXU5uVTVHIuzgqn5NaqUkpPXR44Xhc/iyc7s6o6oHvOjDW8g
         aL+HMQJrAaygV+OsB8kZPG59U3MGDdjXN7SxkufKlDd+OA4NUWOMxNqCVp1IYDbZ8FhI
         nosqIJ9+Jhg54nNFHZFmjYIYGLUiHXt5jGC6L6ZjnWuBvuZweJALO5rMKcklgSawrS//
         M2M1HAgrBmlk30CiyEXh5Of/k4D69daSYqHsM0a63Yznq/lUUNauF5DfHigwX4AO7bg3
         hBYQ==
X-Gm-Message-State: AOAM533Amc/h/3k3hkGM2ciq5TGWqgPVejftpOkgr7rT4qjTebGJiqdc
        h6LjO4qPSmaSm7er+WKFr69LOGiSquhRjA1x
X-Google-Smtp-Source: ABdhPJz+UxQ1qQpxbyFfwZ0co2YJt3B91TFCx7Ov0UnSgqOpkyvuwRwJ5MilZjvbxQqBA4NjBU8O7A==
X-Received: by 2002:a63:4c5b:: with SMTP id m27mr3040343pgl.211.1603957975477;
        Thu, 29 Oct 2020 00:52:55 -0700 (PDT)
Received: from localhost ([2409:8a28:3c42:6840:9efc:e8ff:fef2:1cdc])
        by smtp.gmail.com with ESMTPSA id n7sm1627259pgk.70.2020.10.29.00.52.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2020 00:52:55 -0700 (PDT)
From:   Coiby Xu <coiby.xu@gmail.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org (open list:INPUT (KEYBOARD, MOUSE, JOYSTICK
        , TOUCHSCREEN)...), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 1/3] Input: pmic8xxx-keypad: remove unnecessary CONFIG_PM_SLEEP
Date:   Thu, 29 Oct 2020 15:52:34 +0800
Message-Id: <20201029075236.228335-1-coiby.xu@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

SIMPLE_DEV_PM_OPS has already took good care of CONFIG_PM_CONFIG.

Signed-off-by: Coiby Xu <coiby.xu@gmail.com>
---
 drivers/input/keyboard/pmic8xxx-keypad.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/input/keyboard/pmic8xxx-keypad.c b/drivers/input/keyboard/pmic8xxx-keypad.c
index 91d5811d6f0e..c04ab04331b2 100644
--- a/drivers/input/keyboard/pmic8xxx-keypad.c
+++ b/drivers/input/keyboard/pmic8xxx-keypad.c
@@ -621,7 +621,6 @@ static int pmic8xxx_kp_probe(struct platform_device *pdev)
 	return 0;
 }
 
-#ifdef CONFIG_PM_SLEEP
 static int pmic8xxx_kp_suspend(struct device *dev)
 {
 	struct platform_device *pdev = to_platform_device(dev);
@@ -661,7 +660,6 @@ static int pmic8xxx_kp_resume(struct device *dev)
 
 	return 0;
 }
-#endif
 
 static SIMPLE_DEV_PM_OPS(pm8xxx_kp_pm_ops,
 			 pmic8xxx_kp_suspend, pmic8xxx_kp_resume);
-- 
2.28.0

