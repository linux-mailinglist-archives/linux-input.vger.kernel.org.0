Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1CCA652E7F1
	for <lists+linux-input@lfdr.de>; Fri, 20 May 2022 10:45:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344162AbiETIp1 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 20 May 2022 04:45:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345445AbiETIp0 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 20 May 2022 04:45:26 -0400
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCCD79E9F9
        for <linux-input@vger.kernel.org>; Fri, 20 May 2022 01:45:25 -0700 (PDT)
Received: by mail-yb1-xb49.google.com with SMTP id g7-20020a5b0707000000b0064f39e75da4so3426707ybq.17
        for <linux-input@vger.kernel.org>; Fri, 20 May 2022 01:45:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=2AIe/VeGdIiReIfTW2LnPKUFsZ3r9rMTVy/lVEdOtX4=;
        b=AhLElKNYBuzvTuhuW5eNIfTg/L6Xo6NzdRFGHz1/ynAXFQIFAP+J2shsPX5TTppCEc
         h9bH0ZIGOdwlH+Y8d2LegQJ28u1fWnlFVdIhP3FVvqWKRSJklgSNFI8zagdU4QMiSP7g
         LDEel08ACxpf48/CDZSDA9YiP/NLAJehqLF1ueuMmbW7HBlvuxEz1+mtubdsebOUHmrU
         T2x0Rg6y6b5b7Ois3lZ8i7QrMw46aUU+IBFm1UgOJc6RSIgHxD7258teyCg1yy/+sas9
         3xlbQUc06pW/UlgpO7AEmxqxt9qy6JZnYHqlpsYBXixfDI4Ud9MJ2bJs6O0ONRgo2gsb
         TniQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=2AIe/VeGdIiReIfTW2LnPKUFsZ3r9rMTVy/lVEdOtX4=;
        b=jSPlEyWcYq/Dzt17zj1NfNYIGkxqiGKn/x8vwjTiyomhNlbL4AD37KiMDFgf6tp5Vd
         j9pAHCVM20zkgsiQCTAxYGGUkC+cN3bHJAaM7ZzNkerFlgaBhZvGaZja4PegrYb/ZKda
         SiiZZ7MVt/vEL21Y6v2vUvc4nn5Dp9POPSp1YaowTNKaBcH6G6uB7CMXYOzQMaBIACrH
         0WuqpXR5MK2nNIygUiVhtq/YOhbgSpa17X5p/Ge3m/04PgpjwSFmMXLdsgQ3tXIuNRds
         /MtlgHS6bMUeCOYniSTDLBbXXfnGQk6qGrmoLkoGrXUYJ6PxLu0+FR5aBkMI/Yjm2VeX
         phEg==
X-Gm-Message-State: AOAM533BpShzA6D0fx1gdI6j7uVt5c5YHX8uBdVq5AVgKI3Pdes92V/r
        wMufUpclILN1Sh4st7jaEUYoPyk=
X-Google-Smtp-Source: ABdhPJwPA9zDuo5vpWQ0XqBPTRU/po67+hUnaM7l27eA/Zn/N+6SxWEEc+HWWu3Iuvy3aLeROWrShO0=
X-Received: from svv2.mtv.corp.google.com ([2620:15c:211:202:2912:90d1:c7a0:4cd2])
 (user=svv job=sendgmr) by 2002:a25:2e42:0:b0:64d:dc33:f6ba with SMTP id
 b2-20020a252e42000000b0064ddc33f6bamr8188916ybn.158.1653036325090; Fri, 20
 May 2022 01:45:25 -0700 (PDT)
Date:   Fri, 20 May 2022 01:45:14 -0700
Message-Id: <20220520084514.3451193-1-svv@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.36.1.124.g0e6072fb45-goog
Subject: [PATCH] Document the units for resolution of size axes
From:   Siarhei Vishniakou <svv@google.com>
To:     dmitry.torokhov@gmail.com
Cc:     rydberg@bitmath.org, linux-input@vger.kernel.org,
        Siarhei Vishniakou <svv@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Today, the resolution of size axes is not documented. As a result, it's
not clear what the canonical interpretation of this value should be. On
Android, there is a need to calculate the size of the touch ellipse in
physical units (millimeters).

After reviewing linux source, it turned out that most of the existing
usages are already interpreting this value as "units/mm". This
documentation will make it explicit. This will help device
implementations with correctly following the linux specs, and will
ensure that the devices will work on Android without needing further
customized parameters for scaling of major/minor values.

Signed-off-by: Siarhei Vishniakou <svv@google.com>
Change-Id: I4a2de9e6d02e5fd707e5d312f5c3325734266a6e
---
 include/uapi/linux/input.h | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/include/uapi/linux/input.h b/include/uapi/linux/input.h
index ee3127461ee0..328cf545c029 100644
--- a/include/uapi/linux/input.h
+++ b/include/uapi/linux/input.h
@@ -78,10 +78,13 @@ struct input_id {
  * Note that input core does not clamp reported values to the
  * [minimum, maximum] limits, such task is left to userspace.
  *
- * The default resolution for main axes (ABS_X, ABS_Y, ABS_Z)
- * is reported in units per millimeter (units/mm), resolution
- * for rotational axes (ABS_RX, ABS_RY, ABS_RZ) is reported
- * in units per radian.
+ * The default resolution for main axes (ABS_X, ABS_Y, ABS_Z,
+ * ABS_MT_POSITION_X, ABS_MT_POSITION_Y) is reported in units
+ * per millimeter (units/mm), resolution for rotational axes
+ * (ABS_RX, ABS_RY, ABS_RZ) is reported in units per radian.
+ * The resolution for the size axes (ABS_MT_TOUCH_MAJOR,
+ * ABS_MT_TOUCH_MINOR, ABS_MT_WIDTH_MAJOR, ABS_MT_WIDTH_MINOR)
+ * is reported in units per millimeter (units/mm).
  * When INPUT_PROP_ACCELEROMETER is set the resolution changes.
  * The main axes (ABS_X, ABS_Y, ABS_Z) are then reported in
  * units per g (units/g) and in units per degree per second
-- 
2.36.1.124.g0e6072fb45-goog

