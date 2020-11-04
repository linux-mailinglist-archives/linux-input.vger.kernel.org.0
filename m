Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E2D22A6971
	for <lists+linux-input@lfdr.de>; Wed,  4 Nov 2020 17:25:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730888AbgKDQY5 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 4 Nov 2020 11:24:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730919AbgKDQYx (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 4 Nov 2020 11:24:53 -0500
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F1F4C0613D4
        for <linux-input@vger.kernel.org>; Wed,  4 Nov 2020 08:24:53 -0800 (PST)
Received: by mail-wm1-x341.google.com with SMTP id 23so2210182wmg.1
        for <linux-input@vger.kernel.org>; Wed, 04 Nov 2020 08:24:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yOqqwbhs3ZFnypFgr81+FVo0+Ncb1joEEk3R1wcSBm8=;
        b=JGNHio/tzPkDy+/FyTCMGY/ssW2w/GQpFbLgWgw4NR8QApR1GggM30uCUKOV4eEZXp
         rILOPGM3qh9JetWxdtLK60SbE0JWyGkvi10rYTktKNMoePcY0aIYt3kQ0LeljkOSSx+A
         Exq53HV2ZKL2svrB4L98uT1ajW521U/Cv6TY8RHYdNwDUaTgcqh8VYJcVs5xfYHlFTzK
         cp3dqY6G4b8jU/EO7WWkOM9NzEbqKl6qlk+IDD2AqQWLrppkhC16HsoLDaNtq8CEYrqa
         XYXnZkvH0mMM+Nrn+WhFcZZ6HenlRsCM386vJmeGLUYhf75VgEEHlFrL1hJ7m5KsP9Wi
         Pb9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yOqqwbhs3ZFnypFgr81+FVo0+Ncb1joEEk3R1wcSBm8=;
        b=M01kJNTynE23d6u46b1eqSfr5xxQRufW019vWASorRwCFmcto+IopAFUOujkZVEA5z
         OAxQc19uO1q/offwv2S1a2pThusd4cYtOuxR0g01/A6bSbKNUOB0E1+G0yBm+QJwM0OD
         QUMlNO/tAR0aIgf6/Q6y0L1eVdBGs4d2kUZGUQtn1FDPQU8eX1q5HKTj6ZI+sdodSgyk
         qsiHm1AD4MAz/esY72mosMKSkiqkb6x12n/oLuMMCtgC0KvLdtjJiOQ7N4Aj9mHYChAg
         7nz5xSc+k8jK9ExuCswuD0nyQ7wnshBGsUuhJXmHi/ueOs/AGVXJTrhw6617h8sEEE+f
         L6cg==
X-Gm-Message-State: AOAM531LqDHgsvVlNlaLhu1Ca5OEfYzL69AiEv+iH4gc36TOa8qdXXCL
        vyrXirCMS/4Xpq4tSsKybY1KcQ==
X-Google-Smtp-Source: ABdhPJxjdksOfjG9itW3gMfgTXD935vSw7Mn9Npcixc/CseYuLHAQnNW+iYB0LibrjKy5joIoxc4WQ==
X-Received: by 2002:a1c:3d44:: with SMTP id k65mr5155183wma.147.1604507091818;
        Wed, 04 Nov 2020 08:24:51 -0800 (PST)
Received: from dell.default ([91.110.221.242])
        by smtp.gmail.com with ESMTPSA id o129sm3008564wmb.25.2020.11.04.08.24.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2020 08:24:51 -0800 (PST)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Henrik Rydberg <rydberg@bitmath.org>,
        Andrew Duggan <aduggan@synaptics.com>,
        linux-input@vger.kernel.org
Subject: [PATCH 08/20] input: rmi4: rmi_f11: Struct headers are expected to start with 'struct <name>'
Date:   Wed,  4 Nov 2020 16:24:15 +0000
Message-Id: <20201104162427.2984742-9-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201104162427.2984742-1-lee.jones@linaro.org>
References: <20201104162427.2984742-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/input/rmi4/rmi_f11.c:66: warning: Cannot understand  * @rezero - writing this to the F11 command register will cause the sensor to
 drivers/input/rmi4/rmi_f11.c:311: warning: cannot understand function prototype: 'struct f11_2d_sensor_queries '

Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Henrik Rydberg <rydberg@bitmath.org>
Cc: Andrew Duggan <aduggan@synaptics.com>
Cc: linux-input@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/input/rmi4/rmi_f11.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/input/rmi4/rmi_f11.c b/drivers/input/rmi4/rmi_f11.c
index ffa39ab153f2a..38baf39ce0916 100644
--- a/drivers/input/rmi4/rmi_f11.c
+++ b/drivers/input/rmi4/rmi_f11.c
@@ -62,7 +62,7 @@
 /* maximum ABS_MT_POSITION displacement (in mm) */
 #define DMAX 10
 
-/**
+/*
  * @rezero - writing this to the F11 command register will cause the sensor to
  * calibrate to the current capacitive state.
  */
@@ -178,7 +178,8 @@
 #define F11_UNIFORM_CLICKPAD 0x02
 
 /**
- * Query registers 1 through 4 are always present.
+ * struct f11_2d_sensor_queries - Query registers 1 through 4 are always
+ *				  present.
  *
  * @nr_fingers - describes the maximum number of fingers the 2-D sensor
  * supports.
-- 
2.25.1

