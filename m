Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 75C9F4C6420
	for <lists+linux-input@lfdr.de>; Mon, 28 Feb 2022 08:54:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233616AbiB1Hz3 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 28 Feb 2022 02:55:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230255AbiB1Hz3 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 28 Feb 2022 02:55:29 -0500
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB48844740
        for <linux-input@vger.kernel.org>; Sun, 27 Feb 2022 23:54:50 -0800 (PST)
Received: by mail-pf1-x433.google.com with SMTP id p8so10368846pfh.8
        for <linux-input@vger.kernel.org>; Sun, 27 Feb 2022 23:54:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vrd7ZMK2HJx8mTUbXpFQ6ImFpZR65YLtxpbaMPSGe2E=;
        b=a09wK/W/bqeRshn1Sj/YctuXljmODYuQpA7t61F4W8NlIuUrUZx558XTqKloXod4G6
         xhREutLo3+Kw9XYFOTiS4S9nJduimzyx/2tJ3YJczLZicnbi5DRoyzGOP9TMPUjxouHY
         NrCgBChC4MZ8mCknIsoP4dIm6ElSNc+R2GWO+SYsuys47C4gk9O3gp3clWtJcJB/F4+f
         gz9yHEdqlSgOz+7Xu4q4hh0WD9D+8LT/PXsb2fZ3qAknzAT/DG20dJ4r6PqWL6c7WkrN
         monzVv/2nRowd7MM4B34Sb+ypNQqCXZub57nX8QiHfEJQ81hx2HN/o4UMwZqKlKJ0Ryl
         eKpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vrd7ZMK2HJx8mTUbXpFQ6ImFpZR65YLtxpbaMPSGe2E=;
        b=DPaxum2VWS6faaIArbc8Xi5ccjrmV0DnRkXAR95bbs4f3lIiCM+XjhtWFA0myjzfzW
         PFXjZ/c3hsrrSDRiuqvM7nY7mzSfsRUD6c6o3VAQ2qnv24JyCKASIvTHScrYQrmZFXCf
         QWCxBzLRffnhe8JYzKEFhtimcG2h3S6EC/6++ynzYnR3zekdjp3YJ6N4cewIo16dSeiB
         WLN5lhV2+8gzoG4Y3HBzWHBeE4WFT262okgtICqUqxc0Y2TRB2lmsFV3d0TDbjxoHH0h
         GVpxS/grKUSBpa6mY9JaRqXHe/tkbqcEHyT2oK6vQXc8Y87m8PUIIeWB43IX6/tNdHZH
         nD3g==
X-Gm-Message-State: AOAM531QXmko8G3EqUXu9m07VKJxTaPktjOn7OmjfFswHbij2dSgw2Bi
        OYjiLR0Aqwe04gknMDzi+N7s47H3Wm4=
X-Google-Smtp-Source: ABdhPJwRewbErx8UptzYCx9t1hJcv6wJBhpMPzkgivT+9KSUXvPQJ9Ftkf64goVU0XNkbQbiHpRzWA==
X-Received: by 2002:a05:6a00:1797:b0:4e1:935f:94b3 with SMTP id s23-20020a056a00179700b004e1935f94b3mr19899909pfg.75.1646034889643;
        Sun, 27 Feb 2022 23:54:49 -0800 (PST)
Received: from dtor-ws.mtv.corp.google.com ([2620:15c:202:201:43a2:93b6:ebd7:94fd])
        by smtp.gmail.com with ESMTPSA id d13-20020a17090ac24d00b001bcd7c2b2c3sm10718517pjx.16.2022.02.27.23.54.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Feb 2022 23:54:48 -0800 (PST)
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     Stephen Boyd <swboyd@chromium.org>, benjamin.tissoires@redhat.com,
        Jiri Kosina <jikos@kernel.org>,
        Sean O'Brien <seobrien@chromium.org>,
        "Douglas Anderson linux-kernel @ vger . kernel . org" 
        <dianders@chromium.org>
Subject: [PATCH v5 0/5] Input/HID: Consolidate ChromeOS Vivaldi keyboard logic 
Date:   Sun, 27 Feb 2022 23:54:41 -0800
Message-Id: <20220228075446.466016-1-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.35.1.574.g5d30c73bfb-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This is a follow-on to this thread[1] where we discussed the need to
support the vivaldi keyboard function row keys in the google hammer
driver. I've extracted the common code into a new vivaldi-fmap.c file
that can be used by the various keyboard drivers used on ChromeOS
devices to expose the function_row_physmap sysfs attribute. Then we make
another file to keep the HID parsing logic common for the vivaldi and
hammer keyboards. Finally, we add support for the function row physmap
attribute to the hammer driver.

NOTE: I dropped Tested-by and Acked-by as patches have been reworked,
please give them another spin.

Changed from v4 (dtor):
(https://lore.kernel.org/r/20220216195901.1326924-1-swboyd@chromium.org):
 * The series is on top of [PATCH] HID: vivaldi: fix sysfs attributes
   leak (https://lore.kernel.org/r/YhmAAjNeTjiNoLlJ@google.com)
 * Added patch to used devm for keyboard backlight LED in hammer driver
 * Avoid putting HID-specific stuff in input header, instead introduce
   new private hid-vivaldi-common.h
 * More code sharing between hid-google-hammer.c and hid-vivaldi.c by
   mandating that vivaldi data instance should be the very first or the
   only driver-private data.

Changes from v3
(https://lore.kernel.org/r/20220211012510.1198155-1-swboyd@chromium.org):
 * Changed vivaldi-keymap to vivaldi-fmap

Changes from v2
(https://lore.kernel.org/r/20220209225556.3992827-1-swboyd@chromium.org):
 * Drop first patch to change to u16
 * Change array type to u32 in vivaldi_data

Changes from v1
(https://lore.kernel.org/r/20220204202021.895426-1-swboyd@chromium.org):
 * Yet another new file for HID part to fix compilation problems

Dmitry Torokhov (1):
  HID: google: switch to devm when registering keyboard backlight LED

Stephen Boyd (3):
  Input: extract ChromeOS vivaldi physmap show function
  HID: google: extract Vivaldi hid feature mapping for use in hid-hammer
  HID: google: Add support for vivaldi to hid-hammer

Zhengqiao Xia (1):
  HID: google: modify HID device groups of eel

 drivers/hid/Kconfig                   |  11 ++
 drivers/hid/Makefile                  |   1 +
 drivers/hid/hid-google-hammer.c       |  51 +++++-----
 drivers/hid/hid-vivaldi-common.c      | 140 ++++++++++++++++++++++++++
 drivers/hid/hid-vivaldi-common.h      |  16 +++
 drivers/hid/hid-vivaldi.c             | 121 +---------------------
 drivers/input/Kconfig                 |   7 ++
 drivers/input/Makefile                |   1 +
 drivers/input/keyboard/Kconfig        |   2 +
 drivers/input/keyboard/atkbd.c        |  27 ++---
 drivers/input/keyboard/cros_ec_keyb.c |  43 +++-----
 drivers/input/vivaldi-fmap.c          |  39 +++++++
 include/linux/input/vivaldi-fmap.h    |  27 +++++
 13 files changed, 296 insertions(+), 190 deletions(-)
 create mode 100644 drivers/hid/hid-vivaldi-common.c
 create mode 100644 drivers/hid/hid-vivaldi-common.h
 create mode 100644 drivers/input/vivaldi-fmap.c
 create mode 100644 include/linux/input/vivaldi-fmap.h

-- 
2.35.1.574.g5d30c73bfb-goog

