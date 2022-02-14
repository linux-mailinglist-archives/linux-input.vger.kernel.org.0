Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 22A0C4B5D44
	for <lists+linux-input@lfdr.de>; Mon, 14 Feb 2022 22:51:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231578AbiBNVvl (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 14 Feb 2022 16:51:41 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:33342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229634AbiBNVvk (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 14 Feb 2022 16:51:40 -0500
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF48536B79
        for <linux-input@vger.kernel.org>; Mon, 14 Feb 2022 13:51:31 -0800 (PST)
Received: by mail-yb1-xb49.google.com with SMTP id b12-20020a056902030c00b0061d720e274aso36611222ybs.20
        for <linux-input@vger.kernel.org>; Mon, 14 Feb 2022 13:51:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=Xf8JDRtmOERvQq31mnv0C9Avnh5TjTmRNlIzhR/WubQ=;
        b=ru5cLCIYOfLAdmh5RwEnbbwc5D8xScrTMriA9X5fds5+q0ZzzXB94rj57B6ww3uOPV
         cCSmQCpCjyNBA1Fv37J+GmS8y3+zxSQJsVaheF6vJHkrFjH/Gu73mrXYZfjeuPj1FQw5
         +kAtV87MNNwNAVmxFiWdo67ohla5xtxUG99lovhSmP6Zh5P1JSz0NF/Z7qFyvTt4CXTi
         M0p5R8s1r/R/KAnDGrRs4W7mIySTGWCHsKyBFJIs6QXqW0UlEnQQIsoWJe34UImfhCvV
         UAMnlm+s98oarC9g1sDfHdurG6mP5/1LiZultWzZyjs8U5psi7LrHfW1oZHyltNU0A2U
         2F2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=Xf8JDRtmOERvQq31mnv0C9Avnh5TjTmRNlIzhR/WubQ=;
        b=5SjzuJj1lrP6z7iovkK9G/OdKRhwi195KQYt3258NfWCvpYxVkrPBdjUhaNBJ25Q4c
         phZBzK26VTucC2yljHJWrZ94NjLwbNZH6IHqI9opzguhzmZ8bzOInueP+mq9cA5GCamA
         /bzZFVuk7vh8qAIb5AmpAWui8f1bVB+MhHM/rlYZOjYnlcmLO4LNZtyW/Exxmlc4tVyz
         U7ZFfRjgUky2msGZeE5VRbZGNBoxQ4PR4c2ckaEoustJ/vNmmmuVlrbhLjdKMaVgB+F4
         NXmcUopYZrPPrb0wvK5sM70MgQT3AL/36QLveqqX+IHKpnDGdl1WRR2R75xwb3S15sBM
         4A6w==
X-Gm-Message-State: AOAM532SmamGIuIVCkqF750gNFw9UAjZj2L6iuoOIx9F0WOwpUM8DyDi
        pyNk55ZLlQ/9udhM92r1EmsRP/G4Y+ugGP4=
X-Google-Smtp-Source: ABdhPJxRbk09j8fYydUoLEqfYa8vF+S8gVzTcUcJNHbdDKWpgO6Gn5cTlMBMX+OPcfAr08Cjbqe/SlYCjLSlaqg=
X-Received: from pceballos.nyc.corp.google.com ([2620:0:1003:510:3a64:2f02:b766:d7b5])
 (user=pceballos job=sendgmr) by 2002:a25:cb08:: with SMTP id
 b8mr1113987ybg.236.1644875491130; Mon, 14 Feb 2022 13:51:31 -0800 (PST)
Date:   Mon, 14 Feb 2022 16:51:02 -0500
Message-Id: <20220214165021.1.I89632f95e6af380102cdb1ec9f7a6d5cb948b029@changeid>
Mime-Version: 1.0
X-Mailer: git-send-email 2.35.1.265.g69c8d7142f-goog
Subject: [PATCH] HID: input: Handle OOC toggle switches mapped to keys
From:   Pablo Ceballos <pceballos@google.com>
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Jiri Kosina <jikos@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        Pablo Ceballos <pceballos@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Section 3.4.1.2 of the HID Usage Tables specification describes an
on/off control (OOC) implemented as a toggle switch that maintains its
state. This is encoded as a 1-bit absolute value with a logical minimum
of 0 and a logical maximum of 1.

The telephony device usage page (0x0B) defines a "Phone Mute" usage
(0x2F) with an OOC usage type. The hid-input driver currently maps this
usage to input event code KEY_MICMUTE, which is an EV_KEY event type.

EV_KEY events are expected to be emitted with a value of 1 when a key is
depressed, and a value of 0 when a key is released.

This patch emits a key depress and release event when an OOC toggle
switch that is mapped to an EV_KEY event type is toggled.

Signed-off-by: Pablo Ceballos <pceballos@google.com>

---
I'm not sure if this is the best way to resolve this issue that's
happening with the "Phone Mute" HID usage. Or if this approach will
cause issues with other HID devices.

 drivers/hid/hid-input.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/hid/hid-input.c b/drivers/hid/hid-input.c
index 112901d2d8d2a..102150bde4e72 100644
--- a/drivers/hid/hid-input.c
+++ b/drivers/hid/hid-input.c
@@ -1450,6 +1450,17 @@ void hidinput_hid_event(struct hid_device *hid, struct hid_field *field, struct
 	    (!test_bit(usage->code, input->key)) == value)
 		input_event(input, EV_MSC, MSC_SCAN, usage->hid);
 
+	if (usage->type == EV_KEY &&
+	    (field->flags & HID_MAIN_ITEM_VARIABLE) &&
+	   !(field->flags & HID_MAIN_ITEM_RELATIVE) &&
+	   field->logical_minimum == 0 &&
+	   field->logical_maximum == 1) {
+		input_event(input, EV_KEY, usage->code, 1);
+		input_sync(input);
+		input_event(input, EV_KEY, usage->code, 0);
+		return;
+	}
+
 	input_event(input, usage->type, usage->code, value);
 
 	if ((field->flags & HID_MAIN_ITEM_RELATIVE) &&
-- 
2.35.1.265.g69c8d7142f-goog

