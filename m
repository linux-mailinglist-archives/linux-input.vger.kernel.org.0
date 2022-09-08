Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DA8DF5B24EC
	for <lists+linux-input@lfdr.de>; Thu,  8 Sep 2022 19:41:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231347AbiIHRlJ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 8 Sep 2022 13:41:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232241AbiIHRk0 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 8 Sep 2022 13:40:26 -0400
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C656CB27
        for <linux-input@vger.kernel.org>; Thu,  8 Sep 2022 10:39:36 -0700 (PDT)
Received: by mail-pl1-x62d.google.com with SMTP id p18so18608736plr.8
        for <linux-input@vger.kernel.org>; Thu, 08 Sep 2022 10:39:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=yocom-org.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=rU5trKe3Yoy2Ehis4NGQlVoaD7BHhUK/1S8Lg+uYpCo=;
        b=TGRoxee7ib22Hu/bEhSHvSDvJVsO5n0bOkdRVANYV3o29bn+BOe5CM798GhVk4wcho
         4+rd0dTJ5zhfYqmXNgw047iHF1tA2ZZCc3PSoA/5KW9+DM5zvtbGmgyi4SxiA0OfONH2
         3kg2I38HZWHdwY0JFwZcor+HuiYF2gIYXwmVcPKWgGW098UehwcVQMrNxxivQBo2Fp9P
         O/7XJf5e1fsSjDXdaKaSp9cYt3Qqt8c4Fwhgv/6Kzwwf7py2XIGugghgC/xUcFM0NUTB
         Q2xCH+DOQNChuHvPTy/EN7xrvzAR8HlMcfiwqw61QZ+vh3rlu6QhMT/XpiH96+lHDZXA
         MaaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=rU5trKe3Yoy2Ehis4NGQlVoaD7BHhUK/1S8Lg+uYpCo=;
        b=XgNQ5uPYYBiSBo7skrBbI4EjEyKR1YWmHbxNKupSwKqUDCz5Ujd4q/N8BJlJvKGc17
         24rMcxpXITHIBBlGcid1Hew0dIE21j5pCe+XYjIMbOLA/cYDv+zJ12c3jyFOcHFuFgZ0
         P/JB3BARehB2BwvR9J2x0UETpOPyR+DTVG+eAbebE7laIFQEBkxvpi/LA6MxNVZTJE1m
         LXirAeAWotqf94CW+2ryW/nzyJb2XLOni6xvCkFNCElth0a1BywLcry9XzxU7bzo/qYc
         XtbwiEjrCEZjVc8clzPMnKwp+9AhcVqLsIbFzklvYumTc0rLdzREdt4XjDSiXmtxlnYG
         DA/A==
X-Gm-Message-State: ACgBeo3eTRINieV6Pa+AmyVzeagbl2abIr3cYdSiYrxZn8XEzooHjgvo
        0BZDkTrxOS3ApN7VGi29M0y4jA==
X-Google-Smtp-Source: AA6agR4UXvmZTkIPHXdo3TexkqBBdQT9rCCVFrsBsPlZp+rXOZ56j1lHaj2cWA+P2vg76kn7b78m1w==
X-Received: by 2002:a17:90a:74c5:b0:200:2d89:ef13 with SMTP id p5-20020a17090a74c500b002002d89ef13mr5295554pjl.81.1662658773528;
        Thu, 08 Sep 2022 10:39:33 -0700 (PDT)
Received: from ghaven-kernel.yocom.org.beta.tailscale.net ([2601:600:8f80:973::5f])
        by smtp.gmail.com with ESMTPSA id x76-20020a62864f000000b0052d4b0d0c74sm15166767pfd.70.2022.09.08.10.39.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Sep 2022 10:39:33 -0700 (PDT)
From:   Nate Yocom <nate@yocom.org>
To:     dmitry.torokhov@gmail.com
Cc:     nate@yocom.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, hadess@hadess.net,
        benjamin.tissoires@redhat.com
Subject: [PATCH v6 0/5] Input: joystick: xpad: Add X-Box Adaptive Controller support
Date:   Thu,  8 Sep 2022 10:39:25 -0700
Message-Id: <20220908173930.28940-1-nate@yocom.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Adds support for the X-Box Adaptive Controller, which is protocol
compatible with the XTYPE_XBOXONE support in the driver with two deltas:

 - The X-Box button sets 0x02 as its activation ID, where others set
   0x01
 - The controller has an additional Profile button with 4 active states,
   which this change maps to an Axis control with 4 possible values

Patch series adds device to the supported table, adds support for the
Profile button, and adds support for the X-Box button as distinct
changes.

Signed-off-by: Nate Yocom <nate@yocom.org>

Nate Yocom (5):
  Input: joystick: xpad: Add X-Box Adaptive support
  Input: joystick: xpad: Add X-Box Adaptive XBox button
  Input: joystick: xpad: Add ABS_PROFILE to uapi
  Input: joystick: xpad: Add ABS_PROFILE to Docs
  Input: joystick: xpad: Add X-Box Adaptive Profile button

 v2: Fix warning Reported-by: kernel test robot <lkp@intel.com>
 v3: Break into multi-part and remove VID/PID check for XBox button
 v4: Rename Layer -> Profile as suggested by Bastien Nocera
 v5: Add new ABS_PROFILE axis to uapi and use it for the profile button
 v6: Add ABS_PROFILE to absolutes array and docs as requested by Dmitry

 Documentation/input/event-codes.rst    |  6 ++++++
 Documentation/input/gamepad.rst        |  6 ++++++
 drivers/hid/hid-debug.c                |  3 ++-
 drivers/input/joystick/xpad.c          | 15 ++++++++++++++-
 include/uapi/linux/input-event-codes.h |  1 +
 5 files changed, 29 insertions(+), 2 deletions(-)


base-commit: 26b1224903b3fb66e8aa564868d0d57648c32b15
-- 
2.30.2

