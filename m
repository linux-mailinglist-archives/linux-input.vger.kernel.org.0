Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 01B3A5F7D59
	for <lists+linux-input@lfdr.de>; Fri,  7 Oct 2022 20:30:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229790AbiJGSaX (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 7 Oct 2022 14:30:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229703AbiJGSaV (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 7 Oct 2022 14:30:21 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C3B6A3F4D
        for <linux-input@vger.kernel.org>; Fri,  7 Oct 2022 11:30:14 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id a10so8444130wrm.12
        for <linux-input@vger.kernel.org>; Fri, 07 Oct 2022 11:30:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gNcP0V+BsO+JizwSO2P7jcmp++wZlZAJV8zZGust2kg=;
        b=cEX7SqM7ui53mq1DSd3t8StextmPdA0twE5fmK/Y2571DdumhdZGb3akgjL3BHIwbk
         QIeyKyrBA1i7lUjurtewy5rqAita6GAaUUVZUjlRHWftMZyxBp2EZrV/UKjtXYWf2kg1
         +8e6MIbN+Z82fID29R5qqinWlJbSReRKc7lJcDmlHEIAitQksafsZHXIVwh5V9Iollvf
         S56SzdLeUoFXm0+amQl9XctpKtRFxn4/geM0cGPAuFL4+tUYwUkk+pkiKHjOjgdtiTCt
         cWoBpbAidhuEe2GNSFN4TrrerirrbgWxD5bpSRsq353aRembmJEilqCJMzxSXNGCflrv
         fgww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gNcP0V+BsO+JizwSO2P7jcmp++wZlZAJV8zZGust2kg=;
        b=gz58wKzv+mArWWj61q4vJ20hGhNM6bJq4bOLJPFFZcMTdxfWcQcTRRKeJKr7R3tW6p
         01mnx3HTACudc2ljbjD+AiIqjOkn8Gwo9vsKbnaRE3h+3IVisHwdnyf7aBzaEFCOIZu8
         TjLeoUUJ1HD3AUDuyQjalmKfbARN3mSk+oLzSnGeIb0vRr1s3KXzb4tcI2XSshPECr23
         /uLU1fz09tKXoSW8bGw4HUCpX+bkX9r9WD3HNWVUF40ecJx7Wp+ZTD9xzRUr6lxYuFu/
         WmkKdsO5nRpaj47dtOEAOQ0HAzjxvGiF0QdT8e81JCLZ1l/c7U+YpnEj2hvtf/zziEzl
         6g+Q==
X-Gm-Message-State: ACrzQf23vR/bt1h3Pt/mX6bvXP70m0I3tqg7IcpzPPdG2p/eCUkLo/h5
        dPp7EzUo1jEwM58qYARjIl+J0KbSEq4mfT7I
X-Google-Smtp-Source: AMsMyM6Q0qjzv2tC3lUhwqTXYBxMzabtlBqu8vXLnWIzSbecI/HiKhh66pDDI7ZCrmNAU6JTkANVFQ==
X-Received: by 2002:adf:f5c5:0:b0:22e:264b:2179 with SMTP id k5-20020adff5c5000000b0022e264b2179mr4070028wrp.386.1665167412969;
        Fri, 07 Oct 2022 11:30:12 -0700 (PDT)
Received: from aczubak.c.googlers.com.com (230.213.79.34.bc.googleusercontent.com. [34.79.213.230])
        by smtp.gmail.com with ESMTPSA id l10-20020a05600012ca00b002258235bda3sm2573627wrx.61.2022.10.07.11.30.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Oct 2022 11:30:12 -0700 (PDT)
From:   Angela Czubak <acz@semihalf.com>
To:     linux-input@vger.kernel.org
Cc:     upstream@semihalf.com, benjamin.tissoires@redhat.com,
        jikos@kernel.org, dmitry.torokhov@gmail.com,
        Angela Czubak <acz@semihalf.com>
Subject: [PATCH v4 02/17] Input: add FF_HID effect type
Date:   Fri,  7 Oct 2022 18:29:30 +0000
Message-Id: <20221007182945.1654046-3-acz@semihalf.com>
X-Mailer: git-send-email 2.38.0.rc1.362.ged0d419d3c-goog
In-Reply-To: <20221007182945.1654046-1-acz@semihalf.com>
References: <20221007182945.1654046-1-acz@semihalf.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
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
index 2557eb7b05617..3ea7c826c6fb2 100644
--- a/include/uapi/linux/input.h
+++ b/include/uapi/linux/input.h
@@ -428,6 +428,24 @@ struct ff_rumble_effect {
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
@@ -464,6 +482,7 @@ struct ff_effect {
 		struct ff_periodic_effect periodic;
 		struct ff_condition_effect condition[2]; /* One for each axis */
 		struct ff_rumble_effect rumble;
+		struct ff_hid_effect hid;
 	} u;
 };
 
@@ -471,6 +490,7 @@ struct ff_effect {
  * Force feedback effect types
  */
 
+#define FF_HID		0x4f
 #define FF_RUMBLE	0x50
 #define FF_PERIODIC	0x51
 #define FF_CONSTANT	0x52
@@ -480,7 +500,7 @@ struct ff_effect {
 #define FF_INERTIA	0x56
 #define FF_RAMP		0x57
 
-#define FF_EFFECT_MIN	FF_RUMBLE
+#define FF_EFFECT_MIN	FF_HID
 #define FF_EFFECT_MAX	FF_RAMP
 
 /*
-- 
2.38.0.rc1.362.ged0d419d3c-goog

