Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ACF05525F0D
	for <lists+linux-input@lfdr.de>; Fri, 13 May 2022 12:07:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1379121AbiEMJjy (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 13 May 2022 05:39:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1379069AbiEMJjs (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 13 May 2022 05:39:48 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13B3F291CF2
        for <linux-input@vger.kernel.org>; Fri, 13 May 2022 02:39:47 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id j25so9637267wrc.9
        for <linux-input@vger.kernel.org>; Fri, 13 May 2022 02:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QukRnRADZ2W2DS8/08MZQ2pgAnb2HoWz6ujhm4UEe6Y=;
        b=p7C+6AaxZIeKWHY4ODqC1K1iJga/xJSEr6qjTvWk9tiASXJ0uViCUXSOmj9lCbfa6U
         C6jlMn9W0IMmueeSAwDKrTv6DV7YgWiXaTC7Z1oEaEfWloFyQCvmSVmaPwEJhuh5s0Wm
         jNlItCAMFsDAKCnFsKaV86D8QUccAKQcfh28qN1psWPp5+UhELX4xcY5dfrUV3hKa4lQ
         7tHYOcajaKy0P5F8q8cyFymaZPsJvOCYtJOVKQ2UXr7TXSpHTyzzUZazshVdRy6gywZv
         1JncAeRc2+5wRVrHwi6w//PMexatze8tN8cKgLmgyH7lPZUuvN1E1Csu8l0ZpfhMzbeN
         QohA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QukRnRADZ2W2DS8/08MZQ2pgAnb2HoWz6ujhm4UEe6Y=;
        b=iPoAyJjNv72tpbKmPv025+pffRsh9Lh8CHZBG/H8HwrAwMgBJI4A5HDlpsACod7qEL
         iKdcM1/g3ItlfNo8vPQWBJkMtnf6YpIi/W9yGEStMBBQIu9Gr4DyS63KHvL6RHqMWt8a
         an2oyrUg8Iq/HbN7KNmHjh/jOB8RV3bnjjl7Ywy6vONgUMDAdFjlAUZYBLB0wk4x8jiH
         C2giawE2iODWwzSl9hHOjwboSH5iPZU/R9WVFICyPEPVsdwhh6HI6Rs3IarCvF1KgJQs
         gJEU7GcQ9LG817pr4Q87rjNu25BaAaLJlOQP8Xu2miU2oSVuZ6KP6u0viMBj/l0rNnKz
         9JJw==
X-Gm-Message-State: AOAM531AOHMvDR3NQGrfyvbv8g4VU0dwr9BvuGgpHFH6hZtchCjyt96f
        ITgiIWzu3odtl/L9jtMvCPQUgy8TwIsyGDT2/WE=
X-Google-Smtp-Source: ABdhPJz6LhRZnfA+rfbN45Xc9amhu84y8YvzqsHUb/AOPKUu9JvtOFd1aXRIHYbkcKw8ApDcXC2I6g==
X-Received: by 2002:a5d:5228:0:b0:20a:d7e9:7ed8 with SMTP id i8-20020a5d5228000000b0020ad7e97ed8mr3000474wra.687.1652434785699;
        Fri, 13 May 2022 02:39:45 -0700 (PDT)
Received: from aczubak.c.googlers.com.com (88.140.78.34.bc.googleusercontent.com. [34.78.140.88])
        by smtp.gmail.com with ESMTPSA id l5-20020adfa385000000b0020ce015ed48sm1631404wrb.103.2022.05.13.02.39.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 May 2022 02:39:45 -0700 (PDT)
From:   Angela Czubak <acz@semihalf.com>
To:     linux-input@vger.kernel.org
Cc:     upstream@semihalf.com, benjamin.tissoires@redhat.com,
        jikos@kernel.org, dmitry.torokhov@gmail.com,
        Angela Czubak <acz@semihalf.com>
Subject: [PATCH v3 02/17] Input: add FF_HID effect type
Date:   Fri, 13 May 2022 09:39:12 +0000
Message-Id: <20220513093927.1632262-3-acz@semihalf.com>
X-Mailer: git-send-email 2.36.0.550.gb090851708-goog
In-Reply-To: <20220513093927.1632262-1-acz@semihalf.com>
References: <20220513093927.1632262-1-acz@semihalf.com>
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
2.36.0.550.gb090851708-goog

