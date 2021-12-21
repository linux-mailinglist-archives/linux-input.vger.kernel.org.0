Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD20247C754
	for <lists+linux-input@lfdr.de>; Tue, 21 Dec 2021 20:17:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241721AbhLUTRv (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 21 Dec 2021 14:17:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229436AbhLUTRu (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 21 Dec 2021 14:17:50 -0500
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E952C061574
        for <linux-input@vger.kernel.org>; Tue, 21 Dec 2021 11:17:50 -0800 (PST)
Received: by mail-wr1-x42a.google.com with SMTP id a9so35983wrr.8
        for <linux-input@vger.kernel.org>; Tue, 21 Dec 2021 11:17:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=z4kqxZftMv6A3T258Gb1J2+2xP5Vkofn4t2RzIfnSy8=;
        b=vWGs6hmKsDVYa1V9SAmwXeuvlScoZ/Nn9pRTK26NEScWU12ea5l+N3PXAFkCVEkShT
         DO/plGb+fRHctJ958FH9bJHWrW6Ql8i0Iy7PZjgWwtJADUP20ndUwBi8uc3PlKO6B74D
         i7SmRpcF0oKPgj763ooGn9zbkWb1EsdJRaoxpxctqZdGlExAklk4NQKLixqOlsrChT0k
         r8E/NFMd/VtdawQF4ruqSlCz+EihMwa5kvnUrjNbsgron6WW8bTVmQcPU2JXNd+cwxKT
         Q2vMjJ8Kc0Vtxi2DLkdWFqO3hDS2OFXLMWuoSypn+xeRyvc8T9gBOJ/vSAs5/ylCQD09
         u/5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=z4kqxZftMv6A3T258Gb1J2+2xP5Vkofn4t2RzIfnSy8=;
        b=ksB0budGsXaBaW3wcwSl6YBFWGP+PJVKk2UoHZbvT1wivj7PabSYDaUETU/SxH5kMK
         DyZncdVfXWxuVXmJ+cccHDYU24ome3GlvVDWI8G0fqf0YuwQ7VUFVqRWF1PpSJryf1BP
         8NGkVjtdi4UHLC3qEpjdbR7YRZGnH596YfrPMeNsc3o4R6LFGbYiYbj1vrGuUyFH/bQ/
         IoLXacgyMudapZRUH4SkEzBj8aTC9K8ldQi2UVksnnxHx+GSLV6pvBJih4wtWPG3Nckw
         WU/NaLX7ggLUGdOXQlHPaUiFJT4ZjNgskz2Nu9St6Y84sOLMherq3c6+jEsFOYN5082D
         oCfw==
X-Gm-Message-State: AOAM533D7Jp933LBEbaihnNaCpvPkyZf2T2AaSFRHbQktvaOtET/AhIV
        2id+3OXsiLx+sIqeO1h9KqN+KBcP4DF9Eptp4A8=
X-Google-Smtp-Source: ABdhPJwlOdiY5JOlQuHZt+zo8RMFYlWw9nkgNtxuYU0pmvDN+H/MXygWq6iBbKiLJK7B1BzLLKoOdA==
X-Received: by 2002:adf:f252:: with SMTP id b18mr3862936wrp.341.1640114268946;
        Tue, 21 Dec 2021 11:17:48 -0800 (PST)
Received: from aczubak.c.googlers.com.com (109.36.187.35.bc.googleusercontent.com. [35.187.36.109])
        by smtp.gmail.com with ESMTPSA id t8sm3994846wmq.32.2021.12.21.11.17.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Dec 2021 11:17:48 -0800 (PST)
From:   Angela Czubak <acz@semihalf.com>
To:     linux-input@vger.kernel.org
Cc:     upstream@semihalf.com, dmitry.torokhov@gmail.com,
        Angela Czubak <acz@semihalf.com>
Subject: [PATCH 02/18] Input: add FF_HID effect type
Date:   Tue, 21 Dec 2021 19:17:27 +0000
Message-Id: <20211221191743.1893185-3-acz@semihalf.com>
X-Mailer: git-send-email 2.34.1.307.g9b7440fafd-goog
In-Reply-To: <20211221191743.1893185-1-acz@semihalf.com>
References: <20211221191743.1893185-1-acz@semihalf.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

FF_HID effect type can be used to trigger haptic feedback with HID simple
haptic usages.

Signed-off-by: Angela Czubak <acz@semihalf.com>
---
 include/uapi/linux/input.h | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/include/uapi/linux/input.h b/include/uapi/linux/input.h
index ee3127461ee0..0d4d426cf75a 100644
--- a/include/uapi/linux/input.h
+++ b/include/uapi/linux/input.h
@@ -424,6 +424,24 @@ struct ff_rumble_effect {
 	__u16 weak_magnitude;
 };
 
+/**
+ * struct ff_hid_effect
+ * @hid_usage: hid_usage according to Haptics page (WAVEFORM_CLICK, etc.)
+ * @vendor_id: the waveform vendor ID if hid_usage is in the vendor-defined range
+ * @vendor_id: the vendor waveform page if hid_usage is in the vendor-defined range
+ * @intensity: strength of the effect as percentage
+ * @repeat_count: number of times to retrigger effect
+ * @retrigger_period: time before effect is retriggered (in ms)
+ */
+struct ff_hid_effect {
+	__u16 hid_usage;
+	__u16 vendor_id;
+	__u8  vendor_waveform_page;
+	__u16 intensity;
+	__u16 repeat_count;
+	__u16 retrigger_period;
+};
+
 /**
  * struct ff_effect - defines force feedback effect
  * @type: type of the effect (FF_CONSTANT, FF_PERIODIC, FF_RAMP, FF_SPRING,
@@ -460,6 +478,7 @@ struct ff_effect {
 		struct ff_periodic_effect periodic;
 		struct ff_condition_effect condition[2]; /* One for each axis */
 		struct ff_rumble_effect rumble;
+		struct ff_hid_effect hid;
 	} u;
 };
 
@@ -467,6 +486,7 @@ struct ff_effect {
  * Force feedback effect types
  */
 
+#define FF_HID		0x4f
 #define FF_RUMBLE	0x50
 #define FF_PERIODIC	0x51
 #define FF_CONSTANT	0x52
@@ -476,7 +496,7 @@ struct ff_effect {
 #define FF_INERTIA	0x56
 #define FF_RAMP		0x57
 
-#define FF_EFFECT_MIN	FF_RUMBLE
+#define FF_EFFECT_MIN	FF_HID
 #define FF_EFFECT_MAX	FF_RAMP
 
 /*
-- 
2.34.1.307.g9b7440fafd-goog

