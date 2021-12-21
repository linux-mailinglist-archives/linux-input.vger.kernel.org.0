Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C27C47C753
	for <lists+linux-input@lfdr.de>; Tue, 21 Dec 2021 20:17:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241720AbhLUTRu (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 21 Dec 2021 14:17:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229436AbhLUTRt (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 21 Dec 2021 14:17:49 -0500
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 721B8C06173F
        for <linux-input@vger.kernel.org>; Tue, 21 Dec 2021 11:17:49 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id c4so26506wrd.9
        for <linux-input@vger.kernel.org>; Tue, 21 Dec 2021 11:17:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dFKe64RHn+wfMjnj0soDOjBJv32ROQQmXkTlTsTSnnA=;
        b=BScRZICxkSWZm8rKyB6dB9mtpKEjfKFX2gMG4w1gQDx4WsjLnPXNMlQCWN+aoPdNG2
         SjRYgeSy/Zz/fV1IG6rVeFOAz82D3u629kz2l9WnE7gn1droxzVhMbQqiobPxP58DEv4
         SP5/H4OcXSfKLMBFcxemv4jtL7dXthMfhZ7THP60i2NDCcemnNRpqaCkdzNCyOGemFHC
         5gIYPJ2t+SO4Mk2i6/4arwoxQ+rlk/JZkdDNl9zKGRAmtdRkEcEe5jqiWVfziQ6sJIkC
         ltjMIrIQO+dnOjhjSZpSiXRCDm2AERXqCunJftEH8zJDs8W1bKTfdcTZs39sep7sf3Et
         bo6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dFKe64RHn+wfMjnj0soDOjBJv32ROQQmXkTlTsTSnnA=;
        b=afHCceMfLwXxLCNEm1v1+t0aqm3hFCgIGezMi2vAH2EkPPokbXlBY+6/nfvrIHZ/UE
         rPw4GU6Ug+Uu4ppC1iNeUZon6H1m8B8TGdaW5XDanGecteAiROfGejmU6hzT9PpwfnPH
         PakqymvkCbaClMoqrwWFJiDPOt9s62EAoIHWrnFFRLfw+zhojUxh9k+jZFCAYf/IJH8Q
         BchdVA55PWs+PLn3NIzdnriMAQN87AgzGE02lPhB7twsz4iy1SuWBITJ0nrodkY55+Qr
         UoJbrETA/kOXVddbA4PCT2Evq2UtTXxv2+B3IOl3IcrRZUGAFpUl/gkMGw5yJGc0tOZa
         9y+g==
X-Gm-Message-State: AOAM532nFpIzVR2M+Uvb/CaknHTHURdG+GDU6imAbb6quzPd0CoYjdZO
        QPSLrK5A5w3wOOnCQAr7B1bAYTSrBW2OWT9Bn2E=
X-Google-Smtp-Source: ABdhPJyJovZQf7ZtOfG85bG5HDLw5Bzct2ZGl60DQzN3WOw61tNEHYWxVAManOb+XX0LNyp4l+63fA==
X-Received: by 2002:a05:6000:108a:: with SMTP id y10mr1014072wrw.335.1640114268029;
        Tue, 21 Dec 2021 11:17:48 -0800 (PST)
Received: from aczubak.c.googlers.com.com (109.36.187.35.bc.googleusercontent.com. [35.187.36.109])
        by smtp.gmail.com with ESMTPSA id t8sm3994846wmq.32.2021.12.21.11.17.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Dec 2021 11:17:47 -0800 (PST)
From:   Angela Czubak <acz@semihalf.com>
To:     linux-input@vger.kernel.org
Cc:     upstream@semihalf.com, dmitry.torokhov@gmail.com,
        Angela Czubak <acz@semihalf.com>
Subject: [PATCH 01/18] HID: add haptics page defines
Date:   Tue, 21 Dec 2021 19:17:26 +0000
Message-Id: <20211221191743.1893185-2-acz@semihalf.com>
X-Mailer: git-send-email 2.34.1.307.g9b7440fafd-goog
In-Reply-To: <20211221191743.1893185-1-acz@semihalf.com>
References: <20211221191743.1893185-1-acz@semihalf.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Introduce haptic usages as defined in HID Usage Tables specification.

Signed-off-by: Angela Czubak <acz@semihalf.com>
---
 include/linux/hid.h | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/include/linux/hid.h b/include/linux/hid.h
index f453be385bd4..70679bf820ce 100644
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
@@ -301,6 +302,28 @@ struct hid_item {
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
-- 
2.34.1.307.g9b7440fafd-goog

