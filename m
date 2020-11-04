Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5235B2A6990
	for <lists+linux-input@lfdr.de>; Wed,  4 Nov 2020 17:26:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730922AbgKDQ0F (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 4 Nov 2020 11:26:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730933AbgKDQY4 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 4 Nov 2020 11:24:56 -0500
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA951C061A4A
        for <linux-input@vger.kernel.org>; Wed,  4 Nov 2020 08:24:55 -0800 (PST)
Received: by mail-wr1-x443.google.com with SMTP id c17so3339713wrc.11
        for <linux-input@vger.kernel.org>; Wed, 04 Nov 2020 08:24:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hwyOazzO/GQzyuqblzZOtq9SwXpd1xEL9uFxk2jvFF4=;
        b=Zo4HwqwMwEFUkSUixNvB41J5S0n/ImVso05y2fPLD//YtKZoVyJZRsOIzRR15+ueRx
         f+08bnoAreTE/Zhg0kiSmLb9NGmSpPepV3WbxvG25tFxr8hZY+2DXSiR/7G1CbDxKFCH
         5Rh3XQPBQwgHFwpUMdOCKhh8KLCZ6GJmjmlJ+CEOorScoa38PZNA9lMcnrnW35kBIpwY
         gcwdgojBD4Wr0Dn9cK4xJIBEY7xsPsBvA4A0CwgtBn5Ar7grsTDoz1y/ut5c0yhecUMu
         seB5bdhJBBHk53BYEVQf0k3NfMQfu/Y3onv5oGbMVcXYkFJqpVThXv50LoLr1hgJfNc6
         xZjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hwyOazzO/GQzyuqblzZOtq9SwXpd1xEL9uFxk2jvFF4=;
        b=lW0x2fuf5kAglMzX9QGjH5FLoguUMjG8NVQ35Yaz+mQ7pPvxRR7kr9eMdS9h/tEfPz
         pJESoijOi69MzPg09hsmdFW22G8/gEk4ff5GVtGpuCx5iiuqLECBxfgExb/vNXngFJdh
         qqJN871sab7xq9iku8jJ/UOmvihwEjbTBu0aa+rxvnJwEYm8V1hoDUSbu6pwC+qgHwnJ
         Oe1o8m4wc/tsWgXPELhgiAivOAlwQ6ADtpH3qGFJuabeEHdFZ0qMQrB/MVzPYnSMMxnl
         EHt/zm879tUNuVeKy2C/5ITxOX2aZFb3TUhY5P399dxWNXhaIYwFzAhx+T6SVcRz4YFa
         jLNw==
X-Gm-Message-State: AOAM532UwuVbJbi+vI8WCnlCq7xMlfWLcpDOpWkJVgiLw8p6EtuP3I0b
        bkWyfGRybe9VG/z7ajkWyGCLEPRKDY+jkOab
X-Google-Smtp-Source: ABdhPJwfuLiHj0uKdmCYgiPrFNhlKN1rGUHif2OjsyPaTaeOm2RMx7PaLn6wchUSsYtqNqeNBPpnrQ==
X-Received: by 2002:adf:80eb:: with SMTP id 98mr7667239wrl.101.1604507094427;
        Wed, 04 Nov 2020 08:24:54 -0800 (PST)
Received: from dell.default ([91.110.221.242])
        by smtp.gmail.com with ESMTPSA id o129sm3008564wmb.25.2020.11.04.08.24.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2020 08:24:53 -0800 (PST)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Henrik Rydberg <rydberg@bitmath.org>,
        Peter Osterlund <petero2@telia.com>,
        Stefan Gmeiner <riddlebox@freesurf.ch>,
        "C. Scott Ananian" <cananian@alumni.priceton.edu>,
        Bruce Kalk <kall@compass.com>,
        this to <linux-input@vger.kernel.org>
Subject: [PATCH 10/20] input: mouse: synaptics: Place braces around empty if() body
Date:   Wed,  4 Nov 2020 16:24:17 +0000
Message-Id: <20201104162427.2984742-11-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201104162427.2984742-1-lee.jones@linaro.org>
References: <20201104162427.2984742-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/input/mouse/synaptics.c: In function ‘synaptics_process_packet’:
 drivers/input/mouse/synaptics.c:1110:6: warning: suggest braces around empty body in an ‘if’ statement [-Wempty-body]

Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Henrik Rydberg <rydberg@bitmath.org>
Cc: Peter Osterlund <petero2@telia.com>
Cc: Stefan Gmeiner <riddlebox@freesurf.ch>
Cc: "C. Scott Ananian" <cananian@alumni.priceton.edu>
Cc: Bruce Kalk <kall@compass.com>
Cc: this to <linux-input@vger.kernel.org>
Cc: linux-input@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/input/mouse/synaptics.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/input/mouse/synaptics.c b/drivers/input/mouse/synaptics.c
index 82577095e175e..07835939d83b9 100644
--- a/drivers/input/mouse/synaptics.c
+++ b/drivers/input/mouse/synaptics.c
@@ -1106,8 +1106,9 @@ static void synaptics_process_packet(struct psmouse *psmouse)
 					num_fingers = hw.w + 2;
 				break;
 			case 2:
-				if (SYN_MODEL_PEN(info->model_id))
+				if (SYN_MODEL_PEN(info->model_id)) {
 					;   /* Nothing, treat a pen as a single finger */
+				}
 				break;
 			case 4 ... 15:
 				if (SYN_CAP_PALMDETECT(info->capabilities))
-- 
2.25.1

