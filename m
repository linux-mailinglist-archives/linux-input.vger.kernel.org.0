Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 67C41525F1C
	for <lists+linux-input@lfdr.de>; Fri, 13 May 2022 12:07:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1379113AbiEMJjx (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 13 May 2022 05:39:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353324AbiEMJjr (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 13 May 2022 05:39:47 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0022291CE2
        for <linux-input@vger.kernel.org>; Fri, 13 May 2022 02:39:46 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id w4so10611534wrg.12
        for <linux-input@vger.kernel.org>; Fri, 13 May 2022 02:39:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WdwIy7/v1iTivZ6vsqK8ZiirGRhaJyIa1aow2Y2Yi8k=;
        b=Qg3wANH1Qb/PtBHYcIfr7H9phP7hhfq0/RipbnXyavLe33we8flBJurKgI8lSOsxRd
         G79KvZaF1IVMRLSupFAF+SGcEafpOSZrNpMP0GqyY6vN/Cqlk0wX8TszBmeUQ6HBF+jT
         7vdPoiiERlsqb+MCytJgvtdXF5aSOwQ+PjBehoxd8eB/r6G8ejiFZGH4t4Q3aJHw6+na
         U2OKw7014xDtl3N1sorn5vvEfXdrdQcpWMMXUcVKwBtK3agay/1NIiujuM9zT64JNJRf
         DJE4AsiP+2Bm15FxUPqJYYKD6WwYN8ckgsNZPlSV4h87e7I3jMO5R0xW1uhbPKO0MF71
         AmWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WdwIy7/v1iTivZ6vsqK8ZiirGRhaJyIa1aow2Y2Yi8k=;
        b=TLFrkUMovm28ffJssvMHcox5h1UicSiVQRTNRqYiB3dkQVS4i7IHwZMsaYagbRm2ev
         nz8pH1yshEA8sCj8tG+e93L99+fCeTlQrSoPIwDbUrp4lUf255FXOOV8uCDhjjJGYtn6
         js2NRM7sKDAxhbT64pbRsal9Hckmg6qJIZUwG1slOPHhjH5SswKK4CJXhDpoVokSdMyK
         SgO5CNDH4+59ZxcWhmegUXScHPc6kZcE1LBvrM7T8XOP1MMUrnh1PxggA8nLNp6gYzRB
         mrowWPIZs184x8EHsi/EdtkRu4yUvvk2YW1v9P2JPCGRLpjPpsCWG53uh3HivtiqwcFy
         chnA==
X-Gm-Message-State: AOAM532evhcEeyLpgv5aB4oJicvpihOpEKZl8X8/6M59bBbTDLWeOqGJ
        a5ex8MiHWciIi7/Y0Ef01uqcQ3Ygg1SYWRhno0w=
X-Google-Smtp-Source: ABdhPJylgszupHn+IFWAFeAJkrRzCl6Rbv5/5o46ai5vKkDnNLcqS1QHKLr2CuKlR2kWGtig4E+WDQ==
X-Received: by 2002:a05:6000:1f0f:b0:20c:87b6:df9d with SMTP id bv15-20020a0560001f0f00b0020c87b6df9dmr3345602wrb.115.1652434785220;
        Fri, 13 May 2022 02:39:45 -0700 (PDT)
Received: from aczubak.c.googlers.com.com (88.140.78.34.bc.googleusercontent.com. [34.78.140.88])
        by smtp.gmail.com with ESMTPSA id l5-20020adfa385000000b0020ce015ed48sm1631404wrb.103.2022.05.13.02.39.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 May 2022 02:39:44 -0700 (PDT)
From:   Angela Czubak <acz@semihalf.com>
To:     linux-input@vger.kernel.org
Cc:     upstream@semihalf.com, benjamin.tissoires@redhat.com,
        jikos@kernel.org, dmitry.torokhov@gmail.com,
        Angela Czubak <acz@semihalf.com>
Subject: [PATCH v3 01/17] HID: add haptics page defines
Date:   Fri, 13 May 2022 09:39:11 +0000
Message-Id: <20220513093927.1632262-2-acz@semihalf.com>
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

Introduce haptic usages as defined in HID Usage Tables specification.
Add HID units for newton and gram.

Signed-off-by: Angela Czubak <acz@semihalf.com>
---
 include/linux/hid.h | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/include/linux/hid.h b/include/linux/hid.h
index 4363a63b9775..3f5899c62821 100644
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
2.36.0.550.gb090851708-goog

