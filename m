Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0DB3A455597
	for <lists+linux-input@lfdr.de>; Thu, 18 Nov 2021 08:30:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243802AbhKRHdW (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 18 Nov 2021 02:33:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234915AbhKRHdU (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 18 Nov 2021 02:33:20 -0500
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 061E5C061570;
        Wed, 17 Nov 2021 23:30:21 -0800 (PST)
Received: by mail-wm1-x333.google.com with SMTP id p18so4368276wmq.5;
        Wed, 17 Nov 2021 23:30:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wU3oYnRWk+ze/aN5QHbzFunFhAo2vHz07PWw6Mo4JL8=;
        b=K4wsurAGD0ZdLo+kuZWQvOGsDX/PeZdM/m+Mq3Q0omnZ4h6eiG+Iv3vVhkCqBAx9A0
         1GWYZS3klwh+w0E5yuxUjQqksiGXJ1EJRAzwMWwRu1B6xseTrCPX2Bm5+mfvYZ9JaGag
         xKwgJ4y7bPLuPbBj2WqgOiJx4p9XROgajV0wc+rrlhem022JCtm8eZo7hb1J4cP+vjcV
         7HP5gl0O6qGHdfjZAfOCMU2HMJ81hEI7XZKaS+hL6QLap6i3L0bbOq9DUuxy4n9lEyJa
         5aTbJIqHOWBopsch/3UqLz/7g1u1Bk6ALcX1lAwKQoj3NugFQe845mTKwx1FjMb6uBdj
         npXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wU3oYnRWk+ze/aN5QHbzFunFhAo2vHz07PWw6Mo4JL8=;
        b=rS0zu4ISqTf5iMFX5c+uatRwGnZ1le+a0wTCMESejoxidKHOWnkBV+4DlScz50DyaZ
         bI4lI5F13c6sUDeZWTRs4JxvAzmtBVD99bgBVwP2cNJfJ4qhAju452r72X9c7XiK54Vb
         kgSGF6j3JMuCXrsFFU7R7ARvNvDHFBw/KTnoIgyCEPCS57rni1jj9Qc2usQAg9l2RyML
         miciO80Z412hhJcGZiAxtjK33JjQaOBnyxtAd0NNY6KG3uWOoG+fU8f/ABNqyb7jV/T9
         WFOdS1taBwOh2Km1kKRecDj1IgU9Vjye3Ro/71v9yFaD5F7FG4RYaf6i5714OdJjOQlp
         zloA==
X-Gm-Message-State: AOAM530dTVT6owjaW6c38t3fHwEOPOCVmQjSluVUeJ2uyiOCHpQ6Btgz
        nnVFht2da2JoxeDP9NwQr/s=
X-Google-Smtp-Source: ABdhPJz3KZkd6Y2aRKKdZRsePmdgw/TYYaKCZEv+AVztl5cpmhd2Qbs8zHQ6lGuPgnjywFkJntfTEA==
X-Received: by 2002:a05:600c:4e51:: with SMTP id e17mr7657363wmq.127.1637220619625;
        Wed, 17 Nov 2021 23:30:19 -0800 (PST)
Received: from localhost.localdomain ([94.73.39.244])
        by smtp.gmail.com with ESMTPSA id p12sm2223438wro.33.2021.11.17.23.30.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Nov 2021 23:30:19 -0800 (PST)
From:   =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To:     jikos@kernel.org
Cc:     benjamin.tissoires@redhat.com, alexhenrie24@gmail.com,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH 2/3] HID: apple: Use BIT to define quirks
Date:   Thu, 18 Nov 2021 08:29:54 +0100
Message-Id: <20211118072955.29708-2-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211118072955.29708-1-jose.exposito89@gmail.com>
References: <20211118072955.29708-1-jose.exposito89@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Replace the existing quirk hardcoded values with the BIT macro in order
to simplify including new quirks.

Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 drivers/hid/hid-apple.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/hid/hid-apple.c b/drivers/hid/hid-apple.c
index a4ca5ed00e5f..b34aeed292a2 100644
--- a/drivers/hid/hid-apple.c
+++ b/drivers/hid/hid-apple.c
@@ -21,15 +21,15 @@
 
 #include "hid-ids.h"
 
-#define APPLE_RDESC_JIS		0x0001
-#define APPLE_IGNORE_MOUSE	0x0002
-#define APPLE_HAS_FN		0x0004
-/* 0x0008 reserved, was: APPLE_HIDDEV */
-#define APPLE_ISO_TILDE_QUIRK	0x0010
-#define APPLE_MIGHTYMOUSE	0x0020
-#define APPLE_INVERT_HWHEEL	0x0040
-/* 0x0080 reserved, was: APPLE_IGNORE_HIDINPUT */
-#define APPLE_NUMLOCK_EMULATION	0x0100
+#define APPLE_RDESC_JIS		BIT(0)
+#define APPLE_IGNORE_MOUSE	BIT(1)
+#define APPLE_HAS_FN		BIT(2)
+/* BIT(3) reserved, was: APPLE_HIDDEV */
+#define APPLE_ISO_TILDE_QUIRK	BIT(4)
+#define APPLE_MIGHTYMOUSE	BIT(5)
+#define APPLE_INVERT_HWHEEL	BIT(6)
+/* BIT(7) reserved, was: APPLE_IGNORE_HIDINPUT */
+#define APPLE_NUMLOCK_EMULATION	BIT(8)
 
 #define APPLE_FLAG_FKEY		0x01
 
-- 
2.25.1

