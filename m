Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 844564B1B2D
	for <lists+linux-input@lfdr.de>; Fri, 11 Feb 2022 02:25:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238761AbiBKBZP (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 10 Feb 2022 20:25:15 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:38910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346764AbiBKBZO (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 10 Feb 2022 20:25:14 -0500
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C38E26F3
        for <linux-input@vger.kernel.org>; Thu, 10 Feb 2022 17:25:13 -0800 (PST)
Received: by mail-pf1-x42f.google.com with SMTP id n23so13506809pfo.1
        for <linux-input@vger.kernel.org>; Thu, 10 Feb 2022 17:25:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ngaqHPp+mHFgAd8ydACOrFgey3e3QYlFhVVNxg0id6g=;
        b=JpX0EYic3lHfq9f1fS/m7SKposKOSM9gY3BIC8ML/Fy6Vca958NmQx+tWIvZeUOLXb
         A+yonWn92d76XwIluL1GgJ0zaFFn2L0YXusROUAzIKtux4tNTpEB4A3PhBPwkDJ3V47B
         fg3oiUfazN+OdfGW03X1Z7pbgY5uDhAHq4C/s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ngaqHPp+mHFgAd8ydACOrFgey3e3QYlFhVVNxg0id6g=;
        b=AIlhZfnPp+uhXHfKiAZZRLD47pMjggpC5g45rEWYqrr+uXuLEW89003k6ZJKM2ctNV
         v3GymWXAz+CumqesAEaRTleG2KDGOd/JKz8r4LHwAAMhbWlfEqa7mxP4bCaEjSNruSsz
         DjKfndldMASGTUjZdCO9Kgv2/0rUpmGNQMjj4Pw5GhI9NCaagdqX+tewEdbKYUQOTw+G
         UCksi6B+iZ2QQavSju3tnPlwY3Iad748LKpOqnNKrcYYnWEz2ejTOBUABa4aWMFLikCX
         26usC/drkiP+r3XtcZksvOa2VReQrcejOl8YJKVn/ZpML0KCrlfQLLDqvIC6GDqafOnh
         bWXQ==
X-Gm-Message-State: AOAM531d2UsZjURBZxr1x2TuanGmbCgu2E3btEkCfmOdze3XZDR5b4ee
        VKCzpye772ZFrkhUiZp5V5rzECAt1i9MLQ==
X-Google-Smtp-Source: ABdhPJwlO0O0U0xtSGpCR+y8J56KkRgAN0o4ZboElDszY2L5t4/LWN3em2n+QulDTZxu3AWKcouh4g==
X-Received: by 2002:aa7:9acb:: with SMTP id x11mr10093118pfp.82.1644542712788;
        Thu, 10 Feb 2022 17:25:12 -0800 (PST)
Received: from smtp.gmail.com ([2620:15c:202:201:fb9d:6747:c0b4:f7ee])
        by smtp.gmail.com with ESMTPSA id m13sm23260146pfh.197.2022.02.10.17.25.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Feb 2022 17:25:12 -0800 (PST)
From:   Stephen Boyd <swboyd@chromium.org>
To:     benjamin.tissoires@redhat.com,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Jiri Kosina <jikos@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Subject: [PATCH v3 0/4] Input/HID: Consolidate ChromeOS Vivaldi keyboard logic
Date:   Thu, 10 Feb 2022 17:25:06 -0800
Message-Id: <20220211012510.1198155-1-swboyd@chromium.org>
X-Mailer: git-send-email 2.35.1.265.g69c8d7142f-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This is a follow-on to this thread[1] where we discussed the need to
support the vivaldi keyboard function row keys in the google hammer
driver. I've extracted the common code into a new vivaldi-keymap.c file
that can be used by the various keyboard drivers used on ChromeOS
devices to expose the function_row_physmap sysfs attribute. That's a
good place to keep the HID parsing logic for the vivaldi and hammer
keyboards too, so one function goes there for that as well. Finally, we
add support for the function row physmap attribute to the hammer driver.

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
 drivers/input/vivaldi-keymap.c        | 39 +++++++++++
 include/linux/input/vivaldi-keymap.h  | 37 ++++++++++
 12 files changed, 292 insertions(+), 142 deletions(-)
 create mode 100644 drivers/hid/hid-vivaldi-common.c
 create mode 100644 drivers/input/vivaldi-keymap.c
 create mode 100644 include/linux/input/vivaldi-keymap.h

[1] https://lore.kernel.org/r/nycvar.YFH.7.76.2201140935460.28059@cbobk.fhfr.pm

base-commit: dfd42facf1e4ada021b939b4e19c935dcdd55566
-- 
https://chromeos.dev

