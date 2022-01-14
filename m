Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C97748EFEA
	for <lists+linux-input@lfdr.de>; Fri, 14 Jan 2022 19:32:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243007AbiANScY (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 14 Jan 2022 13:32:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242991AbiANScY (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 14 Jan 2022 13:32:24 -0500
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5EEFC061574
        for <linux-input@vger.kernel.org>; Fri, 14 Jan 2022 10:32:23 -0800 (PST)
Received: by mail-wm1-x32f.google.com with SMTP id p1-20020a1c7401000000b00345c2d068bdso8840560wmc.3
        for <linux-input@vger.kernel.org>; Fri, 14 Jan 2022 10:32:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Sz6tgUi+1lixPu1s8iY/vOhgmToeWlY9JUjdC2Z9s5w=;
        b=lkhgaiqkgO/6KMIZ+NRyolQdiRweXZqmCGKnd8XykoSt7gVlGjTrD6m2qTJsbGiAAG
         PhzJV9LyUEjM0eqfXl5H8jL4SPeKVwvZFfRVpkkpASSgruXS/eiA+edkfvhTeY/59XOF
         gHsWIE5np8nAT8cVT7JtKgFgY0/M0KKo+YG8ujlJVTywfUw4MH8XTW1ckZ2SdEkHoWdv
         bWLhKul4BA9uH/sQ103dBcao6Lp4XK1Kujo5zKKTTkC30AnsadvG3/SVVF8QHPF/h2+N
         KrGKGoYWx7B+HeskZ2m//+sgHRz3O47NPJU4NWnahNI6yZ9+innxIkYKDMUwwJt178GH
         kIZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Sz6tgUi+1lixPu1s8iY/vOhgmToeWlY9JUjdC2Z9s5w=;
        b=nWK5oNd/jmOd+DG/Ncd6FX7+2qQX2rRCiZGwCCW/1ZytLdnqynSdlxTRcrNI2CbvuL
         AP9z/zp1KGlTaVQmM3az1DeFk17oAQAg7d6722tRMX46ibNWg4bTdKNe+u4l3hhn1Luk
         VjcDdlYkr/uMbG+Bq2in3/T+7CxF9otJj0sXYGPKF8Kw6fWnNJ/UjFthvykhr+jbxW0T
         03YZhr5rnzSzY6GoqUYEeOU3MJdJtVAdAaZ7gi/afJ/zXH6r7o6HPXWArF9VRt0o/jzC
         Od85kSG4YwaXXzfGCcoistGEZ/BJ4jtXFbkk/PdjaCt63Pcs5s0cDvTe5Lwxtfx+47ZN
         exWQ==
X-Gm-Message-State: AOAM530FchQU0ogl8W5U7DYBIYi1I+Ee+wvyQMWHYxTAXVMw9rIzgkuJ
        PDlVkFQXFlgor+dCvoGv+9zQJq2y9z6fsTMq4Ws=
X-Google-Smtp-Source: ABdhPJwjZ2BsPpbnRl5pRs0+jBVUZvEVqhbgzTloQOp9BOwRrlbCtlYMK/QksbvnpMa2M9pl9NZQAA==
X-Received: by 2002:a05:600c:1c9f:: with SMTP id k31mr5674211wms.40.1642185142255;
        Fri, 14 Jan 2022 10:32:22 -0800 (PST)
Received: from aczubak.c.googlers.com.com (109.36.187.35.bc.googleusercontent.com. [35.187.36.109])
        by smtp.gmail.com with ESMTPSA id az4sm6410984wrb.14.2022.01.14.10.32.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jan 2022 10:32:22 -0800 (PST)
From:   Angela Czubak <acz@semihalf.com>
To:     linux-input@vger.kernel.org
Cc:     upstream@semihalf.com, dmitry.torokhov@gmail.com,
        benjamin.tissoires@redhat.com, jikos@kernel.org,
        Angela Czubak <acz@semihalf.com>
Subject: [PATCH v2 01/16] HID: add haptics page defines
Date:   Fri, 14 Jan 2022 18:31:37 +0000
Message-Id: <20220114183152.1691659-2-acz@semihalf.com>
X-Mailer: git-send-email 2.34.1.703.g22d0c6ccf7-goog
In-Reply-To: <20220114183152.1691659-1-acz@semihalf.com>
References: <20220114183152.1691659-1-acz@semihalf.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Introduce haptic usages as defined in HID Usage Tables specification.
Add HID units for newton and gram.

Signed-off-by: Angela Czubak <acz@semihalf.com>
---
 include/linux/hid.h | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/include/linux/hid.h b/include/linux/hid.h
index 7487b0586fe6..4584ce744d02 100644
--- a/include/linux/hid.h
+++ b/include/linux/hid.h
@@ -153,6 +153,7 @@ struct hid_item {
 #define HID_UP_TELEPHONY	0x000b0000
 #define HID_UP_CONSUMER		0x000c0000
 #define HID_UP_DIGITIZER	0x000d0000
+#define HID_UP_HAPTIC		0x000e0000
 #define HID_UP_PID		0x000f0000
 #define HID_UP_BATTERY		0x00850000
 #define HID_UP_HPVENDOR         0xff7f0000
@@ -311,6 +312,28 @@ struct hid_item {
 #define HID_DG_TOOLSERIALNUMBER	0x000d005b
 #define HID_DG_LATENCYMODE	0x000d0060
 
+#define HID_HP_SIMPLECONTROLLER	0x000e0001
+#define HID_HP_WAVEFORMLIST	0x000e0010
+#define HID_HP_DURATIONLIST	0x000e0011
+#define HID_HP_AUTOTRIGGER	0x000e0020
+#define HID_HP_MANUALTRIGGER	0x000e0021
+#define HID_HP_AUTOTRIGGERASSOCIATEDCONTROL 0x000e0022
+#define HID_HP_INTENSITY	0x000e0023
+#define HID_HP_REPEATCOUNT	0x000e0024
+#define HID_HP_RETRIGGERPERIOD	0x000e0025
+#define HID_HP_WAVEFORMVENDORPAGE	0x000e0026
+#define HID_HP_WAVEFORMVENDORID	0x000e0027
+#define HID_HP_WAVEFORMCUTOFFTIME	0x000e0028
+#define HID_HP_WAVEFORMNONE	0x000e1001
+#define HID_HP_WAVEFORMSTOP	0x000e1002
+#define HID_HP_WAVEFORMCLICK	0x000e1003
+#define HID_HP_WAVEFORMBUZZCONTINUOUS	0x000e1004
+#define HID_HP_WAVEFORMRUMBLECONTINUOUS	0x000e1005
+#define HID_HP_WAVEFORMPRESS	0x000e1006
+#define HID_HP_WAVEFORMRELEASE	0x000e1007
+#define HID_HP_VENDORWAVEFORMMIN	0x000e2001
+#define HID_HP_VENDORWAVEFORMMAX	0x000e2fff
+
 #define HID_BAT_ABSOLUTESTATEOFCHARGE	0x00850065
 
 #define HID_VD_ASUS_CUSTOM_MEDIA_KEYS	0xff310076
@@ -398,6 +421,12 @@ struct hid_item {
 #define HID_REPORT_PROTOCOL	1
 #define HID_BOOT_PROTOCOL	0
 
+/*
+ * HID units
+ */
+#define HID_UNIT_GRAM		0x0101
+#define HID_UNIT_NEWTON		0xe111
+
 /*
  * This is the global environment of the parser. This information is
  * persistent for main-items. The global environment can be saved and
-- 
2.34.1.703.g22d0c6ccf7-goog

