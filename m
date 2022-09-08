Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 95CB05B24F8
	for <lists+linux-input@lfdr.de>; Thu,  8 Sep 2022 19:41:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232358AbiIHRlj (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 8 Sep 2022 13:41:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232228AbiIHRlH (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 8 Sep 2022 13:41:07 -0400
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A46312A708
        for <linux-input@vger.kernel.org>; Thu,  8 Sep 2022 10:39:44 -0700 (PDT)
Received: by mail-pg1-x531.google.com with SMTP id q9so17426611pgq.6
        for <linux-input@vger.kernel.org>; Thu, 08 Sep 2022 10:39:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=yocom-org.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=GeBUNt6iKyKVMJSNccGv5u8JOw8oNIwF9ROYFrWs1lE=;
        b=lWs9gg2J19N5dbtQLQWBSb3sLJ3t1w4TFIYRGfoDqPXPEVoivSpbx5UQ9qgmujKzgu
         NnWTpLY80/UFs8SAUEBLLxMIiVczzQ+iU6QRk1ksLMsb99zF+ifqBbY+qryKRzXlnENO
         VAfmYtFIRRQDTW8Yrs6UENPQ6w9fQWlQ6dAOx2zgIxhLANluskFsVs67k3cP+3+BTvBA
         LgeAU1eZ3Q+ocKS62yYFpAhCLA70LyEZdRAZQx6nuvpPWPJpRxbgAjRJDqyiGtUylOPm
         ZCru2H9eydaN38FdeH0wBkFAFLvxXxxMQxKWsCorDdDhc6VBaCqNrjUB7k+u4e1sacM1
         LrqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=GeBUNt6iKyKVMJSNccGv5u8JOw8oNIwF9ROYFrWs1lE=;
        b=OS5QKu1CphxtJP4NmQulKnMraSm3AvpSzboznySKOfQxifg1JQqSIeHX6qx+M5MiZN
         FScSnEuGz+DD3xISCYOu0JslmCV74UwbT/9r1ZMyZVOE+1AlnX1niHDxH2m4u+sOUQZs
         6TYzBPsYM2HrfR4KKajxBvsN5bPqt7PRMNeECeP20bADr7PMPDwen2FHFWex73YTq14f
         rXiYUIN58aha/BSC0eq6mbhvZi0r4rzCVX1Xk37FArXC1ASWSEH1VibwMmWkXhlsMTFa
         wZuerqer0MMJTeOCRizTdB1JWZ+VDycisw8CEiAhm7QVjUrBPe+/KBikIY1wZnJD2ZMK
         BKRA==
X-Gm-Message-State: ACgBeo0vFnZbEaqTIOBjTS8d/eYLfZCcKHTEK1Ox5mH0F4te9MNVZ0Q4
        vKyiW+6M7xjf7fmIAJWlDfMNUw==
X-Google-Smtp-Source: AA6agR6tiJC1rmPcCLUUwaBgsmPk3YCf2zQZ9QkGf5dpF1S5Zn7EcATRPlxTiKvKKhQoxj55DgpmYQ==
X-Received: by 2002:a63:f74c:0:b0:42b:77c2:ce7c with SMTP id f12-20020a63f74c000000b0042b77c2ce7cmr8962778pgk.473.1662658779211;
        Thu, 08 Sep 2022 10:39:39 -0700 (PDT)
Received: from ghaven-kernel.yocom.org.beta.tailscale.net ([2601:600:8f80:973::5f])
        by smtp.gmail.com with ESMTPSA id x76-20020a62864f000000b0052d4b0d0c74sm15166767pfd.70.2022.09.08.10.39.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Sep 2022 10:39:38 -0700 (PDT)
From:   Nate Yocom <nate@yocom.org>
To:     dmitry.torokhov@gmail.com
Cc:     nate@yocom.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, hadess@hadess.net,
        benjamin.tissoires@redhat.com
Subject: [PATCH v6 4/5] Input: joystick: xpad: Add ABS_PROFILE to Docs
Date:   Thu,  8 Sep 2022 10:39:29 -0700
Message-Id: <20220908173930.28940-5-nate@yocom.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220908173930.28940-1-nate@yocom.org>
References: <20220908173930.28940-1-nate@yocom.org>
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

Add ABS_PROFILE description to Documentation/input/

Signed-off-by: Nate Yocom <nate@yocom.org>
---
 Documentation/input/event-codes.rst | 6 ++++++
 Documentation/input/gamepad.rst     | 6 ++++++
 2 files changed, 12 insertions(+)

diff --git a/Documentation/input/event-codes.rst b/Documentation/input/event-codes.rst
index 8741d390b184..b4557462edd7 100644
--- a/Documentation/input/event-codes.rst
+++ b/Documentation/input/event-codes.rst
@@ -235,6 +235,12 @@ A few EV_ABS codes have special meanings:
     BTN_TOOL_<name> signals the type of tool that is currently detected by the
     hardware and is otherwise independent of ABS_DISTANCE and/or BTN_TOUCH.
 
+* ABS_PROFILE:
+
+  - Used to describe the state of a multi-value profile switch.  An event is
+    emitted only when the selected profile changes, indicating the newly
+    selected profile value.
+
 * ABS_MT_<name>:
 
   - Used to describe multitouch input events. Please see
diff --git a/Documentation/input/gamepad.rst b/Documentation/input/gamepad.rst
index 4d5e7fb80a84..71019de46036 100644
--- a/Documentation/input/gamepad.rst
+++ b/Documentation/input/gamepad.rst
@@ -189,3 +189,9 @@ Gamepads report the following events:
 - Rumble:
 
   Rumble is advertised as FF_RUMBLE.
+
+- Profile:
+
+  Some pads provide a multi-value profile selection switch.  An example is the
+  XBox Adaptive and the XBox Elite 2 controllers.  When the active profile is
+  switched, its newly selected value is emitted as an ABS_PROFILE event.
-- 
2.30.2

