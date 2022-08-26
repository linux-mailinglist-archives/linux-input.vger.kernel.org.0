Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B7EE65A1C3A
	for <lists+linux-input@lfdr.de>; Fri, 26 Aug 2022 00:24:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244357AbiHYWYl (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 25 Aug 2022 18:24:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242426AbiHYWYj (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 25 Aug 2022 18:24:39 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65633C5795
        for <linux-input@vger.kernel.org>; Thu, 25 Aug 2022 15:24:38 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id p9-20020a17090a2d8900b001fb86ec43aaso6266972pjd.0
        for <linux-input@vger.kernel.org>; Thu, 25 Aug 2022 15:24:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=yocom-org.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=fNEsgZ1Ns/g0prglNDQsUbLzaltKYTohJK8Yy9WMqdY=;
        b=TKL3A+eMM2fTtq6szDteKKLdwDi7eZV+SVsC26hkah3dD/l21vHMuPpRrQSbAzS2Be
         JfeS9XOpBSVZPzXNDT7/qD4DSeRqYElL72rBVZ00+lIp3rqcBE0biZGURsS5IvwmrIrQ
         /KlWwFu+r98vzqKSVMxoGNouh/FnuHWxmaSjjXrnY+LpqHt2nuzvZLhOgcGQz48Pt1+W
         a2Qiz4yNK0Xw9wp+D618awmXkENmwiVPRhUEPL/MLTnUbhGYsQIQTeFoyiYOrrklYhLO
         I/b4TcU00Bus4ew0DkAJEYfEkpHD3i8hfbX0ZiBBf2kbbTDL5cs+mO17CU8AJ7WM4xyP
         HF/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=fNEsgZ1Ns/g0prglNDQsUbLzaltKYTohJK8Yy9WMqdY=;
        b=v1L3DXNv3J2bXtNV7OJPggx9WwDEiLjuf4qL66CZqwdzz9CUYIuXZFoViOm4aBV4QQ
         ncJPUMsXdlIyiMCe23nHnGuKoSkDec1MDTK63L+KeFreeWHf4U5NaNXU7Osd7pfCU3qv
         XnT7nMM6C1jTiDcJD05KqXQOU+Hr5noxft+7rCJzfjSDhYev3p/lmeZC5s27ETjajbgo
         ADTFBiiNGPdRfq5Qmv19wayIioLTUtfMtPNazoukrvhQ3qoauDqjeJhaik/kPJdF16/t
         Mcn5Gma7tmXbFjk+wuwz/LKK/S1pkqhDpUY1MhnZBEKhXW5Rwk6DH+MrRZlLEu0odvTs
         5aYg==
X-Gm-Message-State: ACgBeo1cdUaIEcIWAjAe323x/lfNS/qsjbbb2unW/PnuE9WSmyhT2Ihz
        rVQxBOqqRPWCe9SL3m+lJAVM6Q==
X-Google-Smtp-Source: AA6agR4X2tsIMZYrg95n+CjTbebFE1XszyaKqu0/9LhagIPxG7iSOoPoQfOyNxjnlWo6shvlYMKe9Q==
X-Received: by 2002:a17:90a:ee96:b0:1fa:af87:95f9 with SMTP id i22-20020a17090aee9600b001faaf8795f9mr1128961pjz.243.1661466277948;
        Thu, 25 Aug 2022 15:24:37 -0700 (PDT)
Received: from localhost.localdomain ([2601:600:8f80:973::5f])
        by smtp.gmail.com with ESMTPSA id e23-20020a63db17000000b00429b6e6c539sm81820pgg.61.2022.08.25.15.24.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Aug 2022 15:24:37 -0700 (PDT)
From:   Nate Yocom <nate@yocom.org>
To:     dmitry.torokhov@gmail.com
Cc:     nate@yocom.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, hadess@hadess.net,
        benjamin.tissoires@redhat.com
Subject: [PATCH v5 2/4] Input: joystick: xpad: Add ABS_PROFILE axis value to uapi
Date:   Thu, 25 Aug 2022 15:24:18 -0700
Message-Id: <20220825222420.6833-3-nate@yocom.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220825222420.6833-1-nate@yocom.org>
References: <20220825222420.6833-1-nate@yocom.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add an ABS_PROFILE axis for input devices which need it, e.g. X-Box
Adaptive Controller and X-Box Elite 2.
---
 include/uapi/linux/input-event-codes.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/uapi/linux/input-event-codes.h b/include/uapi/linux/input-event-codes.h
index dff8e7f17074..7ad931a32970 100644
--- a/include/uapi/linux/input-event-codes.h
+++ b/include/uapi/linux/input-event-codes.h
@@ -862,6 +862,7 @@
 #define ABS_TOOL_WIDTH		0x1c
 
 #define ABS_VOLUME		0x20
+#define ABS_PROFILE		0x21
 
 #define ABS_MISC		0x28
 
-- 
2.30.2

