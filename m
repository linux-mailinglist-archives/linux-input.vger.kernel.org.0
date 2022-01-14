Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F053E48EFEC
	for <lists+linux-input@lfdr.de>; Fri, 14 Jan 2022 19:32:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243022AbiANSc0 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 14 Jan 2022 13:32:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242991AbiANSc0 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 14 Jan 2022 13:32:26 -0500
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D9FCC061574
        for <linux-input@vger.kernel.org>; Fri, 14 Jan 2022 10:32:26 -0800 (PST)
Received: by mail-wm1-x329.google.com with SMTP id n19-20020a7bc5d3000000b003466ef16375so8865621wmk.1
        for <linux-input@vger.kernel.org>; Fri, 14 Jan 2022 10:32:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Abe1KfF+lJ/PybXuWerxm4ZC1PLP/89AOoSNsN3Hla0=;
        b=4Jfa4HP8Uu+mME3E7E5ygZltxj0CTwO5kEfCCcOb1o64YCBWqQBuiD8ikSsMlJY5Co
         LE7qDMIe2lmdB9to+ToUbCYUELvR0PnA69kh0MXP2ntE8y2qpEWUFIpr0sG09Jc8VZyR
         Kd4gYEqR9RN+uCrXJiK2O4pfrHs3ASDx+7NXGnIfhahNXlJIOCXVgbpOaYF8HTmAO2LF
         tih8cnexU74DTs/1a4suN3tqxir93gvkICfnZjpAvJR0R6j67t1Oxtcdwqi5y3+FpSvb
         0xInqhHMqLRzpbhs+H/1SFvHNXIpMGr4X1PEFNMPx11vGn6yXz6x1T4dOWomLUocDFnh
         us2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Abe1KfF+lJ/PybXuWerxm4ZC1PLP/89AOoSNsN3Hla0=;
        b=WlCBm3kim32fMSy4iW3tLnza2DM9mbROEsNDJotqURfcL+ORNPb5mnaP1UeuWsFqf+
         bBPco9WWAN6XyMDPSCx4GotCgqWRL4hhLGiG2ikNsASx+OFheWacAmsoAt6SfEhcI3Cn
         5wuH5GM5QHHrbf4Mfgon7sVcTBC1wT/oTYaEV0H/NX7Egd6XalW6MV9q88WC3v/jHmHl
         7zaZD5plHXgdOXFbtIOg6qw+DgunTxEnimEv3Bd9lXWugtWvLwIJBTyVqAW3TN8NQ59C
         HCfeFBqTsCSY+Xu02FtHeJYJlNRBvr6y8ZNxr1vaOIfhdp4U+SiB+VWf+rWX5aPzK4hm
         MebQ==
X-Gm-Message-State: AOAM530T3OSYcRADszpsB+cKlJQaY1Bo9oKyRjuaBO5wye2PE1awIL/S
        WQhObUdkVEr/BPf3MftByXLqB6PiRnUDhnEGxBI=
X-Google-Smtp-Source: ABdhPJzFK66wNPvM9JVuDTuZIlGmuFKcBCZxuVRGV+8ZwehFJnfFxx9msA512GelRP1IATLLBeSyIw==
X-Received: by 2002:a05:600c:3ac8:: with SMTP id d8mr9619818wms.72.1642185144683;
        Fri, 14 Jan 2022 10:32:24 -0800 (PST)
Received: from aczubak.c.googlers.com.com (109.36.187.35.bc.googleusercontent.com. [35.187.36.109])
        by smtp.gmail.com with ESMTPSA id az4sm6410984wrb.14.2022.01.14.10.32.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jan 2022 10:32:24 -0800 (PST)
From:   Angela Czubak <acz@semihalf.com>
To:     linux-input@vger.kernel.org
Cc:     upstream@semihalf.com, dmitry.torokhov@gmail.com,
        benjamin.tissoires@redhat.com, jikos@kernel.org,
        Angela Czubak <acz@semihalf.com>
Subject: [PATCH v2 03/16] Input: add INPUT_PROP_HAPTIC_TOUCHPAD
Date:   Fri, 14 Jan 2022 18:31:39 +0000
Message-Id: <20220114183152.1691659-4-acz@semihalf.com>
X-Mailer: git-send-email 2.34.1.703.g22d0c6ccf7-goog
In-Reply-To: <20220114183152.1691659-1-acz@semihalf.com>
References: <20220114183152.1691659-1-acz@semihalf.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

INPUT_PROP_HAPTIC_TOUCHPAD property is to be set for a device with simple
haptic capabilities.

Signed-off-by: Angela Czubak <acz@semihalf.com>
---
 Documentation/input/event-codes.rst    | 14 ++++++++++++++
 include/uapi/linux/input-event-codes.h |  1 +
 2 files changed, 15 insertions(+)

diff --git a/Documentation/input/event-codes.rst b/Documentation/input/event-codes.rst
index b24ae7d292cc..bbf2510c2b1a 100644
--- a/Documentation/input/event-codes.rst
+++ b/Documentation/input/event-codes.rst
@@ -390,6 +390,20 @@ can report through the rotational axes (absolute and/or relative rx, ry, rz).
 All other axes retain their meaning. A device must not mix
 regular directional axes and accelerometer axes on the same event node.
 
+INPUT_PROP_HAPTIC_TOUCHPAD
+--------------------------
+
+The INPUT_PROP_HAPTIC_TOUCHPAD property indicates that device:
+- supports simple haptic auto and manual triggering
+- can differentiate between at least 5 fingers
+- uses correct resolution for the X/Y (units and value)
+- report correct force per touch, and correct units for them (newtons or grams)
+- follows the MT protocol type B
+
+Summing up, such devices follow the MS spec for input devices in
+Win8 and Win8.1, and in addition support the Simple haptic controller HID table,
+and report correct units for the pressure.
+
 Guidelines
 ==========
 
diff --git a/include/uapi/linux/input-event-codes.h b/include/uapi/linux/input-event-codes.h
index 225ec87d4f22..df2ba5da4eaa 100644
--- a/include/uapi/linux/input-event-codes.h
+++ b/include/uapi/linux/input-event-codes.h
@@ -27,6 +27,7 @@
 #define INPUT_PROP_TOPBUTTONPAD		0x04	/* softbuttons at top of pad */
 #define INPUT_PROP_POINTING_STICK	0x05	/* is a pointing stick */
 #define INPUT_PROP_ACCELEROMETER	0x06	/* has accelerometer */
+#define INPUT_PROP_HAPTIC_TOUCHPAD	0x07	/* is a haptic touchpad */
 
 #define INPUT_PROP_MAX			0x1f
 #define INPUT_PROP_CNT			(INPUT_PROP_MAX + 1)
-- 
2.34.1.703.g22d0c6ccf7-goog

