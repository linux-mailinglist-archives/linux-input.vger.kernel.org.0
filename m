Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 38ED01C5B70
	for <lists+linux-input@lfdr.de>; Tue,  5 May 2020 17:33:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730347AbgEEPdi (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 5 May 2020 11:33:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729250AbgEEPdh (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 5 May 2020 11:33:37 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CAE67C061A0F;
        Tue,  5 May 2020 08:33:37 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id t40so1250824pjb.3;
        Tue, 05 May 2020 08:33:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=K45WauttThvvJZYIBOgON+J2UV9mJIBfT5/f4RIS0HA=;
        b=DdR1dvS5/ImeMjt8XY4oGRVkc+pac6cXfU8CQHQaQB8a05i2g+Iti/jKndedRkkrgf
         KnBS0K06302+iRQNVFI/yxA+C99XDRulMqeH5R/4N1m1BLczLGZJtjMFs8Jy8WRyTwm8
         2+9HTOUrlXblAC7JrolcSn51LBR5n91xjT98wAbZpMHI9Y3FJN2LkZKoZPfHcF15BjSy
         kmo+d5kImY8mzeTYnSMvpNdQJGFl0n2i/PW6SDGl/b5CEqu/NuuHJhqWxHRXb6ZP7+6r
         +bhCgbDvjp7hfOV5y9V9V3vd9pGaJ6cMTVjQ6pQ7mJSfcKNTZvsTyb2eG5s5r6fY3vdV
         KsZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=K45WauttThvvJZYIBOgON+J2UV9mJIBfT5/f4RIS0HA=;
        b=qEzb5gSKVaNfWtj46zv2zj3iQYspy06+AADRdHyzR/Ixr/3aD0/HeYDRfakZm5NpOC
         U4al36p8f3eQro1iTXe1l/dDZ8dLQRji0AkwL2kWo9MtqUHBZIWisH7kDDCQ7wRyYqPX
         PwOrH7DdHB+DC86ZCEJY6Hnr3J6ReAGGlGFFLjJMuw7sCV7juiaaMwtN4bz+hUwlqM+S
         F/zA1opdr9f7kMtqcy3tgBleu9jX627nHnQT9ZmNdj9XPqWP+G7MTi35cV2USxce6QfI
         Ol1tXjRkcOazBj28TUGOCXThfdLzXjcgPW6T0+UbgfwshtPwtzjUocu+PHcjdlUJm35a
         /VDw==
X-Gm-Message-State: AGi0PubMD3D/AhOXIiAE579NxIHCXrNrpwES0t5X5CxsJBPMAt5V3tOt
        yOvpZPpPEa7uGPPEFQhXQY0=
X-Google-Smtp-Source: APiQypIc3+DX9p4fb8nDlwCpu7fJA9hacLoAULqXEpwjWIEDmZXFZaf0bjy1gLs78Dlxczs7z649Zw==
X-Received: by 2002:a17:902:bd07:: with SMTP id p7mr3233441pls.293.1588692817311;
        Tue, 05 May 2020 08:33:37 -0700 (PDT)
Received: from localhost.localdomain ([2409:4072:60b:fcd9:7c28:bcca:10e4:5523])
        by smtp.gmail.com with ESMTPSA id w126sm2323033pfb.117.2020.05.05.08.33.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2020 08:33:36 -0700 (PDT)
From:   Aishwarya Ramakrishnan <aishwaryarj100@gmail.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        =?UTF-8?q?Myl=C3=A8ne=20Josserand?= <mylene.josserand@bootlin.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     aishwaryarj100@gmail.com
Subject: [PATCH] Input: edt-ft5x06: Use DEFINE_DEBUGFS_ATTRIBUTE to define debugfs fops
Date:   Tue,  5 May 2020 21:03:24 +0530
Message-Id: <20200505153325.20113-1-aishwaryarj100@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

It is more clear to use DEFINE_DEBUGFS_ATTRIBUTE to define debugfs file
operation rather than DEFINE_SIMPLE_ATTRIBUTE.

Signed-off-by: Aishwarya Ramakrishnan <aishwaryarj100@gmail.com>
---
 drivers/input/touchscreen/edt-ft5x06.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/touchscreen/edt-ft5x06.c b/drivers/input/touchscreen/edt-ft5x06.c
index d2587724c52a..7f2070fde2ae 100644
--- a/drivers/input/touchscreen/edt-ft5x06.c
+++ b/drivers/input/touchscreen/edt-ft5x06.c
@@ -676,7 +676,7 @@ static int edt_ft5x06_debugfs_mode_set(void *data, u64 mode)
 	return retval;
 };
 
-DEFINE_SIMPLE_ATTRIBUTE(debugfs_mode_fops, edt_ft5x06_debugfs_mode_get,
+DEFINE_DEBUGFS_ATTRIBUTE(debugfs_mode_fops, edt_ft5x06_debugfs_mode_get,
 			edt_ft5x06_debugfs_mode_set, "%llu\n");
 
 static ssize_t edt_ft5x06_debugfs_raw_data_read(struct file *file,
-- 
2.17.1

