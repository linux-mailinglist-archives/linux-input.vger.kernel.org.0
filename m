Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A646D48EFEB
	for <lists+linux-input@lfdr.de>; Fri, 14 Jan 2022 19:32:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243011AbiANSc0 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 14 Jan 2022 13:32:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242991AbiANScZ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 14 Jan 2022 13:32:25 -0500
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16EAFC061574
        for <linux-input@vger.kernel.org>; Fri, 14 Jan 2022 10:32:25 -0800 (PST)
Received: by mail-wm1-x336.google.com with SMTP id l4so7656237wmq.3
        for <linux-input@vger.kernel.org>; Fri, 14 Jan 2022 10:32:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=L5oUo6fWhfami6YFCkAzy2ZN790EtzaP0uYG2BdwtUg=;
        b=s3LbRq8oqG3eFQroAxO+tshwzBVVVN+qeUQ5WjNjvYGstuXibA5bQYjS+OL99qspyd
         foJkryhuQMC0riYvrSl7Fenmk9uhTp19Z3LMizAQZIt/SQnPfPXtlkKcIFyj1/duhfhD
         k1mOBKVoGHpCRgEhfeMa1ZaXsv/Uckan/t8DPOqaF0mtZZ05nB/y6QrcNBjbSz5WC54X
         wCIYfPftL4zTplf5KDINWNHm9bTkfUYp9nDrw6lUKz9liA+pTVIpPLPZUn5n7zBv3OwA
         HLSbvuAvM3mv07R2c9PELGZoMY5d5YODRAEqFhy0FBCrGgJRdgG5gCi+fRTEDNYBt7bN
         v3Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=L5oUo6fWhfami6YFCkAzy2ZN790EtzaP0uYG2BdwtUg=;
        b=W+Ur1iP1umWyqudwyNTT0YQ4kobwrx3mK1OBg+9msurWSkmJ5V2Z2REtbqjQhsW8t5
         bPVcgp/pp8ZRZg0MEl3LobR9qGu1M8hQd+XjRh00f1DIjPOhpzzYvzxeQEwGhdjGUi5m
         nbCwvloH6scvV4rEqDxzsW9WOcqKwL4Zv4h6VDzGLXqQPWORgD2zNuzRBJlhqlBBLyFs
         kj9KQDuslvqZ9sj2+yx7vMUVkvC52O8+OI5XF7HMM+ZiGqVQYtraxen205c2wYHfNgXH
         6a+xRQMz7T/FHOABYL6ufJOEHbW7g6S+b28309R83t8kvhwz/r7fmCwS+3mNIkDVPWua
         WksA==
X-Gm-Message-State: AOAM530e/7tWlZvTkD7B0vZdy/xSeXnNx5zKHKYKkV6IDI6mxSvGfdx7
        TiUKK/S2+iXOAWabOXP45uHsZCFMofeD4oXeKzM=
X-Google-Smtp-Source: ABdhPJyabKcmWVX3JYnEj5fwzeu3LHcv/D6MxafUk8IyhEkvgHXMQZQBRgooKeoL/XJFJ49K7XuhyQ==
X-Received: by 2002:a5d:4c81:: with SMTP id z1mr9595190wrs.204.1642185143711;
        Fri, 14 Jan 2022 10:32:23 -0800 (PST)
Received: from aczubak.c.googlers.com.com (109.36.187.35.bc.googleusercontent.com. [35.187.36.109])
        by smtp.gmail.com with ESMTPSA id az4sm6410984wrb.14.2022.01.14.10.32.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jan 2022 10:32:23 -0800 (PST)
From:   Angela Czubak <acz@semihalf.com>
To:     linux-input@vger.kernel.org
Cc:     upstream@semihalf.com, dmitry.torokhov@gmail.com,
        benjamin.tissoires@redhat.com, jikos@kernel.org,
        Angela Czubak <acz@semihalf.com>
Subject: [PATCH v2 02/16] Input: add FF_HID effect type
Date:   Fri, 14 Jan 2022 18:31:38 +0000
Message-Id: <20220114183152.1691659-3-acz@semihalf.com>
X-Mailer: git-send-email 2.34.1.703.g22d0c6ccf7-goog
In-Reply-To: <20220114183152.1691659-1-acz@semihalf.com>
References: <20220114183152.1691659-1-acz@semihalf.com>
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
index ee3127461ee0..ccf43a21d43d 100644
--- a/include/uapi/linux/input.h
+++ b/include/uapi/linux/input.h
@@ -424,6 +424,24 @@ struct ff_rumble_effect {
 	__u16 weak_magnitude;
 };
 
+/**
+ * struct ff_hid_effect
+ * @hid_usage: hid_usage according to Haptics page (WAVEFORM_CLICK, etc.)
+ * @vendor_id: the waveform vendor ID if hid_usage is in the vendor-defined range
+ * @vendor_waveform_page: the vendor waveform page if hid_usage is in the vendor-defined range
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
2.34.1.703.g22d0c6ccf7-goog

