Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 13B784B91F9
	for <lists+linux-input@lfdr.de>; Wed, 16 Feb 2022 20:59:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238480AbiBPT7t (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 16 Feb 2022 14:59:49 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:52950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236174AbiBPT7t (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 16 Feb 2022 14:59:49 -0500
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96392224968
        for <linux-input@vger.kernel.org>; Wed, 16 Feb 2022 11:59:36 -0800 (PST)
Received: by mail-pg1-x533.google.com with SMTP id f8so3047317pgc.8
        for <linux-input@vger.kernel.org>; Wed, 16 Feb 2022 11:59:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KOW8KncrPYELlG9/KnR0G2/xdI6rCPXfYFHOdIuOXYI=;
        b=TwRTJrMXz0wlfYfIu4m7Nbsx6U0O/zfzV4jLd9GhNlikQWl/xtysdmikOyuy/ksMIf
         bjS4V5v2zHTyNLpGuVflCtWLJYT3aO4fhY96EjMOjGd1PdzAvUjiJUtdabq7Nx2OD6gn
         nCYWFFtVVi4H9c/4OE6/ip67j68Px+MBu1fcg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KOW8KncrPYELlG9/KnR0G2/xdI6rCPXfYFHOdIuOXYI=;
        b=uCkGiDXRgugieVXuilWyyw5r0X9H1bZ/24mZm8BjAfTRpm4S1jLRi2D7eZIJwV26Ja
         vhKrZ9d2qu66F1DGhI2776LLcLzj8Y5QT5AKOZWFF1hMwp6qw45IcrBA88le8j14fDBk
         PzClhPUuYN+bT7CKPbLr73y7ZPzvUJiPo0FK5q1E2r1KAYSpvgG2w5OiqabXdU+E8qR0
         hEl9GCiHzpC3FIFTeE0G+4HYSPZSsY2L0F05yD6pMjmqNy5IY0oxLarU7Ieay8jYJR3b
         5uxJp/e6Hw1htQo9IFplsx/MveDMGSIW5gtWV8ZITrjkiGBGohGsU255lqcobo/HSx6a
         9qlg==
X-Gm-Message-State: AOAM533VTdhZQP8s4Dm1t4Wl5iyzajwyv9RbNMz5733vhsdPxQGi6i+5
        NKrKhB8EI502WgsOeCjF1xhsN8GHU644Wg==
X-Google-Smtp-Source: ABdhPJyC040lMHgIswGaaM6ri7M3n9kEVhetEUn157SfN1FdrmyG+PlFV+lDiKahPzhOckwHx4+O6A==
X-Received: by 2002:a63:d4e:0:b0:34d:fedc:46e1 with SMTP id 14-20020a630d4e000000b0034dfedc46e1mr3605693pgn.407.1645041576132;
        Wed, 16 Feb 2022 11:59:36 -0800 (PST)
Received: from smtp.gmail.com ([2620:15c:202:201:5f39:68a1:3c2b:3486])
        by smtp.gmail.com with ESMTPSA id u16sm6078840pgh.54.2022.02.16.11.59.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Feb 2022 11:59:35 -0800 (PST)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-kernel@vger.kernel.org, benjamin.tissoires@redhat.com,
        Jiri Kosina <jikos@kernel.org>, linux-input@vger.kernel.org
Subject: [PATCH v4 0/4] Input/HID: Consolidate ChromeOS Vivaldi keyboard logic
Date:   Wed, 16 Feb 2022 11:58:57 -0800
Message-Id: <20220216195901.1326924-1-swboyd@chromium.org>
X-Mailer: git-send-email 2.35.1.265.g69c8d7142f-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
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

Changes from v3 (https://lore.kernel.org/r/20220211012510.1198155-1-swboyd@chromium.org):
 * Changed vivaldi-keymap to vivaldi-fmap

Changes from v2 (https://lore.kernel.org/r/20220209225556.3992827-1-swboyd@chromium.org):
 * Drop first patch to change to u16
 * Change array type to u32 in vivaldi_data

Changes from v1 (https://lore.kernel.org/r/20220204202021.895426-1-swboyd@chromium.org):
 * Yet another new file for HID part to fix compilation problems

Stephen Boyd (3):
  Input: Extract ChromeOS vivaldi physmap show function
  HID: Extract vivaldi hid feature mapping for use in hid-hammer
  HID: google: Add support for vivaldi to hid-hammer

Zhengqiao Xia (1):
  HID: google: modify HID device groups of eel

 drivers/hid/Kconfig                   | 11 +++
 drivers/hid/Makefile                  |  1 +
 drivers/hid/hid-google-hammer.c       | 97 +++++++++++++++++++++------
 drivers/hid/hid-vivaldi-common.c      | 97 +++++++++++++++++++++++++++
 drivers/hid/hid-vivaldi.c             | 88 ++----------------------
 drivers/input/Kconfig                 |  7 ++
 drivers/input/Makefile                |  1 +
 drivers/input/keyboard/Kconfig        |  2 +
 drivers/input/keyboard/atkbd.c        | 22 ++----
 drivers/input/keyboard/cros_ec_keyb.c | 32 +++------
 drivers/input/vivaldi-fmap.c          | 39 +++++++++++
 include/linux/input/vivaldi-fmap.h    | 37 ++++++++++
 12 files changed, 292 insertions(+), 142 deletions(-)
 create mode 100644 drivers/hid/hid-vivaldi-common.c
 create mode 100644 drivers/input/vivaldi-fmap.c
 create mode 100644 include/linux/input/vivaldi-fmap.h

[1] https://lore.kernel.org/r/nycvar.YFH.7.76.2201140935460.28059@cbobk.fhfr.pm

base-commit: dfd42facf1e4ada021b939b4e19c935dcdd55566
-- 
https://chromeos.dev

