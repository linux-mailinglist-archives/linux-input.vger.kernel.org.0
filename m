Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 11E025F7D58
	for <lists+linux-input@lfdr.de>; Fri,  7 Oct 2022 20:30:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229694AbiJGSaX (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 7 Oct 2022 14:30:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229688AbiJGSaR (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 7 Oct 2022 14:30:17 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA372A2A95
        for <linux-input@vger.kernel.org>; Fri,  7 Oct 2022 11:30:13 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id w18so8476136wro.7
        for <linux-input@vger.kernel.org>; Fri, 07 Oct 2022 11:30:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6jkGo1OIbnjIVX1JbkUMDvAp+56f3Eb6cx0364sTMGE=;
        b=qodRW/rtlsgXyqqaQEHEagLuyZ1hwS2l1r0QDHHqHulJwMVbrSkmjHHoUKaJVB/Ec1
         WK4MyLcGF7piu7XQkqW8viKVGA9/Ge4bIfF7tjIS4MIUYA5//FQgn3C/DjkLQhBQ1v4B
         be7maIZTZIiWLGqaYyL3wIvh+k8319JeaL374N3N4x2kpdYhI2O9W6gF/wiILFMz5GVy
         6CRhb5FeGIa+Z14MWajBgbfmn2mTvp4imSGPLCUTCiEZIZpCpNTtImWVSuBG5+gdt1Xi
         peZObQHPOyy8nIZryTE7j+o4XEriSo1PKDGCeF0DKQ5Fw4h199oeN52R/4AEiqzD2dr+
         caMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6jkGo1OIbnjIVX1JbkUMDvAp+56f3Eb6cx0364sTMGE=;
        b=cYa10YDw9dTEPZv2BeoFehHqoyq/cNeawJheIrroC4zoC1yI2x+MyeKPZ2Ys4zAPaM
         kW4xdN4cYC3z7jqsBNgLpmE917ULU0wxoZJY4/Ck1KiD75O8Jj7REDBCn94xzYxeoeNp
         914rcs6Vs87gadfmv4EREVAoD/YFeK/lE2n0W20FTU9uMk3e9+8IthjMb10MvEBEEsNX
         guL5pjrF8B3TpMRFFAN96r2D++jsxr/n08XKlGhLyyP2cUR3n5FV1wrPGY7at89oFEfp
         a1fqm165ffCG76+mEUsjuZ2XO/te6C3k/NfHNmkl8Ui15bxAgXlrHlgfAKR2qZYGzHxn
         ztmg==
X-Gm-Message-State: ACrzQf2bHxlopsyur67QOii5XuYC2EJFvhmh3fryso8j/fSjTtVINGhF
        o6c6KyABKMobl/JAxRkHOFKm65422iY9onLS
X-Google-Smtp-Source: AMsMyM7lsPO+aZsIWlnd43JjRF3RqEBmxMBAlJVNwRm6yAuO2Qcfy+12rPUYc8sZH6xsnI2KGpAsDQ==
X-Received: by 2002:a5d:5306:0:b0:22c:d927:fc8a with SMTP id e6-20020a5d5306000000b0022cd927fc8amr4128192wrv.700.1665167412378;
        Fri, 07 Oct 2022 11:30:12 -0700 (PDT)
Received: from aczubak.c.googlers.com.com (230.213.79.34.bc.googleusercontent.com. [34.79.213.230])
        by smtp.gmail.com with ESMTPSA id l10-20020a05600012ca00b002258235bda3sm2573627wrx.61.2022.10.07.11.30.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Oct 2022 11:30:11 -0700 (PDT)
From:   Angela Czubak <acz@semihalf.com>
To:     linux-input@vger.kernel.org
Cc:     upstream@semihalf.com, benjamin.tissoires@redhat.com,
        jikos@kernel.org, dmitry.torokhov@gmail.com,
        Angela Czubak <acz@semihalf.com>
Subject: [PATCH v4 01/17] HID: add haptics page defines
Date:   Fri,  7 Oct 2022 18:29:29 +0000
Message-Id: <20221007182945.1654046-2-acz@semihalf.com>
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

Introduce haptic usages as defined in HID Usage Tables specification.
Add HID units for newton and gram.

Signed-off-by: Angela Czubak <acz@semihalf.com>
---
 include/linux/hid.h | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/include/linux/hid.h b/include/linux/hid.h
index 4363a63b9775e..3f5899c628211 100644
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
2.38.0.rc1.362.ged0d419d3c-goog

