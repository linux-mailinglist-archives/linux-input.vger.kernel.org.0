Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4BE062CF85F
	for <lists+linux-input@lfdr.de>; Sat,  5 Dec 2020 01:49:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728033AbgLEAri (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 4 Dec 2020 19:47:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726917AbgLEArh (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 4 Dec 2020 19:47:37 -0500
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93F1EC061A52
        for <linux-input@vger.kernel.org>; Fri,  4 Dec 2020 16:47:11 -0800 (PST)
Received: by mail-pl1-x642.google.com with SMTP id t18so4090055plo.0
        for <linux-input@vger.kernel.org>; Fri, 04 Dec 2020 16:47:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hKog1Hk16Zy0NdqkYsbCRJ/dEKa5FrvxxIb/RYLHAXI=;
        b=WktJLgTUFGljAC5G3dVtGLjO+z2ENnXC/JEA8X/zrq5znM3Qir98xuDVfIeaMyGWcN
         tuNslHFgshzhGe8rexyvu8OvmLiOUyIamPBCzR09xj6TV+k/ntq+9QEzVyK0ui9nS0nw
         bB+xMKJyhMtIcnAdTGlXm81oQvzazia2ucSgI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hKog1Hk16Zy0NdqkYsbCRJ/dEKa5FrvxxIb/RYLHAXI=;
        b=DzJOJEObtkTqnFtb/sS332wPl72/BYd3YLyFPaT8LWqxjGAe3rsd66fVdK7tO8W6o8
         Hqyp6S72+uMz/wzWfsoIDjGOxVsVpEyOpBPhyyn41njpThaLc9pGRWwJIEx4kbb9Qfnq
         bngCxDTLDY4vUjUsFbhQcTe8nFbxJ2CSSH2W2meikyVepeJN3+qacpw3qp4dm7H4L2El
         GjW3wUotk2sMnVGIWouZAHRJHhFr3gv3twFgUZAVjw/l0+NR9VMMRUHqJ2lnfeJbi5IY
         QzoPVpTCT3wtyszte8dF5IHkypIbDsUu9nLYItbyHYUhGASM7K94a9/ruZjEvHJVsg7s
         yOow==
X-Gm-Message-State: AOAM530jV2dOHzqkYyzwuP+CGU7r9sJlOtH04in/O4exHriMHC0A7HoC
        tASJTGBfKKCMI/48uGeUkI/2Gw==
X-Google-Smtp-Source: ABdhPJy3ItCkWQH2TofMljBMQOS57N42E7QhPEdASieFslwrxqQX4/xxmVMX0DeLVF+Z4h07FO8kfQ==
X-Received: by 2002:a17:90b:117:: with SMTP id p23mr6430244pjz.111.1607129231180;
        Fri, 04 Dec 2020 16:47:11 -0800 (PST)
Received: from smtp.gmail.com ([2620:15c:202:201:3e52:82ff:fe6c:83ab])
        by smtp.gmail.com with ESMTPSA id jz7sm3146227pjb.14.2020.12.04.16.47.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Dec 2020 16:47:10 -0800 (PST)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Enric Balletbo i Serra <enric.balletbo@collabora.com>
Cc:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Benson Leung <bleung@chromium.org>,
        Guenter Roeck <groeck@chromium.org>
Subject: [PATCH] Input: cros_ec_keyb: Add support for a front proximity switch
Date:   Fri,  4 Dec 2020 16:47:09 -0800
Message-Id: <20201205004709.3126266-1-swboyd@chromium.org>
X-Mailer: git-send-email 2.29.2.576.ga3fc446d84-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Some cros ECs support a front proximity MKBP event via
'EC_MKBP_FRONT_PROXIMITY'. Map this to the 'SW_FRONT_PROXIMITY' input
event code so it can be reported up to userspace.

Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Benson Leung <bleung@chromium.org>
Cc: Guenter Roeck <groeck@chromium.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/input/keyboard/cros_ec_keyb.c          | 5 +++++
 include/linux/platform_data/cros_ec_commands.h | 1 +
 2 files changed, 6 insertions(+)

diff --git a/drivers/input/keyboard/cros_ec_keyb.c b/drivers/input/keyboard/cros_ec_keyb.c
index 15d17c717081..9d05e9192a10 100644
--- a/drivers/input/keyboard/cros_ec_keyb.c
+++ b/drivers/input/keyboard/cros_ec_keyb.c
@@ -107,6 +107,11 @@ static const struct cros_ec_bs_map cros_ec_keyb_bs[] = {
 		.code		= SW_TABLET_MODE,
 		.bit		= EC_MKBP_TABLET_MODE,
 	},
+	{
+		.ev_type	= EV_SW,
+		.code		= SW_FRONT_PROXIMITY,
+		.bit		= EC_MKBP_FRONT_PROXIMITY,
+	},
 };
 
 /*
diff --git a/include/linux/platform_data/cros_ec_commands.h b/include/linux/platform_data/cros_ec_commands.h
index a3a9a878415f..d9dc5e30e59e 100644
--- a/include/linux/platform_data/cros_ec_commands.h
+++ b/include/linux/platform_data/cros_ec_commands.h
@@ -3455,6 +3455,7 @@ struct ec_response_get_next_event_v1 {
 #define EC_MKBP_LID_OPEN	0
 #define EC_MKBP_TABLET_MODE	1
 #define EC_MKBP_BASE_ATTACHED	2
+#define EC_MKBP_FRONT_PROXIMITY	3
 
 /* Run keyboard factory test scanning */
 #define EC_CMD_KEYBOARD_FACTORY_TEST 0x0068

base-commit: b65054597872ce3aefbc6a666385eabdf9e288da
-- 
https://chromeos.dev

