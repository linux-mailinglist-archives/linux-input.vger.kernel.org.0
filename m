Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C4EF151046
	for <lists+linux-input@lfdr.de>; Mon, 24 Jun 2019 17:28:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729698AbfFXP2U (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 24 Jun 2019 11:28:20 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:38303 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726708AbfFXP2U (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 24 Jun 2019 11:28:20 -0400
Received: by mail-lj1-f193.google.com with SMTP id r9so13019571ljg.5
        for <linux-input@vger.kernel.org>; Mon, 24 Jun 2019 08:28:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=qrnfsS2lwdOZWe7YvWF1jaXXFiMLMIhvN2nuXpYmtpk=;
        b=X2LStSvRQEgQeZ45LyTdvHSj1NT0rVkeOEOdoMwhhAmVvABcH03ZY/QvPvCXUj9w++
         EKBXPq4RVAlfNCCC925tsAisrx7KW8pk2SMcIraaca+n4pl+h5h8JvZT6scXhyIlI7Li
         Z1WQ3MF7mN8fITfH4JCJdm8dFnSfm5uXlQE+MWpri8lN81yY1ileVrOi5QCXR4ttESIJ
         /JUVoVGudFI000HvrIyyC+se32hLD/n3ngRYKoTGkiabYUyLyG6eOi72/TYdTGLilLEk
         F3vhCMzUa/5mgl8LWQDAPgEvn2Ek+aI6eXRCzQNaLxQEA+Uyp4uIjimGq5zK0Xfl70AV
         ZNgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=qrnfsS2lwdOZWe7YvWF1jaXXFiMLMIhvN2nuXpYmtpk=;
        b=KYwFyeYfyXDgcBOKJlamotK1yp4thXUsU6J8mLe+Hmf4HqpPqPeictvFl6UJyiHME2
         dRUTr/1bElUeTjlegX+zu36fXGy8BBHEogy9gFNERvp4pnTwWyhcdbz6aAA3PL37InP5
         r1s9dGxU5hibKjLmD4ffDezVt3yCIPakb9g5Z1xZJH7GkoHacfK5gdOv7c4mVJa7+x59
         UxnnMFqq98CIGk4tu4IehEe/T2TrYsOBc4MnbHoLNxkrqn0FhIufqxkzir5FjJIdelyp
         E6glr3zy5kWZVEUCaUPMYkFbW6+vNIoYWCIMQT6cZeKXJSALHjh75qdU4L+wRbZgunyz
         jiXA==
X-Gm-Message-State: APjAAAU5LbLnjKiKp1k1sAX22KnVIAB/CXczU4evk2zTh0HxmWKLTOmP
        3Ev9DhTmN+BX+YxVi87DkQHPoO6mhSI=
X-Google-Smtp-Source: APXvYqz6rab3DFL5LXcaPTI7/CTXkjpJLHktSObDh2gUqJisC3pYzjLbsPo9cu1rAiEv+MvcCF9CAA==
X-Received: by 2002:a2e:8007:: with SMTP id j7mr35939527ljg.191.1561390098137;
        Mon, 24 Jun 2019 08:28:18 -0700 (PDT)
Received: from lahvuun.homenetwork ([93.76.175.10])
        by smtp.gmail.com with ESMTPSA id a17sm1571054lfg.73.2019.06.24.08.28.17
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Jun 2019 08:28:17 -0700 (PDT)
From:   Ilya Trukhanov <lahvuun@gmail.com>
X-Google-Original-From: Ilya Trukhanov <lahvuun@protonmail.com>
Date:   Mon, 24 Jun 2019 18:28:16 +0300
To:     linux-input@vger.kernel.org
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Subject: [PATCH] HID: Add 044f:b320 ThrustMaster, Inc. 2 in 1 DT
Message-ID: <20190624152816.xbo2oqyviqbrpkur@lahvuun.homenetwork>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: NeoMutt/20180716
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Enable force feedback for the Thrustmaster Dual Trigger 2 in 1 Rumble Force
gamepad. Compared to other Thrustmaster devices, left and right rumble
motors here are swapped.

Signed-off-by: Ilya Trukhanov <lahvuun@protonmail.com>
---
 drivers/hid/hid-quirks.c |  1 +
 drivers/hid/hid-tmff.c   | 10 ++++++++++
 2 files changed, 11 insertions(+)

diff --git a/drivers/hid/hid-quirks.c b/drivers/hid/hid-quirks.c
index e5ca6fe2ca57..7408a4759b35 100644
--- a/drivers/hid/hid-quirks.c
+++ b/drivers/hid/hid-quirks.c
@@ -638,6 +638,7 @@ static const struct hid_device_id hid_have_special_driver[] = {
 #if IS_ENABLED(CONFIG_HID_THRUSTMASTER)
 	{ HID_USB_DEVICE(USB_VENDOR_ID_THRUSTMASTER, 0xb300) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_THRUSTMASTER, 0xb304) },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_THRUSTMASTER, 0xb320) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_THRUSTMASTER, 0xb323) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_THRUSTMASTER, 0xb324) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_THRUSTMASTER, 0xb605) },
diff --git a/drivers/hid/hid-tmff.c b/drivers/hid/hid-tmff.c
index e12f2588ddeb..78b931d8617f 100644
--- a/drivers/hid/hid-tmff.c
+++ b/drivers/hid/hid-tmff.c
@@ -76,6 +76,7 @@ static int tmff_play(struct input_dev *dev, void *data,
 	struct hid_field *ff_field = tmff->ff_field;
 	int x, y;
 	int left, right;	/* Rumbling */
+	int motor_swap;
 
 	switch (effect->type) {
 	case FF_CONSTANT:
@@ -100,6 +101,13 @@ static int tmff_play(struct input_dev *dev, void *data,
 					ff_field->logical_minimum,
 					ff_field->logical_maximum);
 
+		/* 2-in-1 strong motor is left */
+		if (hid->product == 0xb320) {
+			motor_swap = left;
+			left = right;
+			right = motor_swap;
+		}
+
 		dbg_hid("(left,right)=(%08x, %08x)\n", left, right);
 		ff_field->value[0] = left;
 		ff_field->value[1] = right;
@@ -226,6 +234,8 @@ static const struct hid_device_id tm_devices[] = {
 		.driver_data = (unsigned long)ff_rumble },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_THRUSTMASTER, 0xb304),   /* FireStorm Dual Power 2 (and 3) */
 		.driver_data = (unsigned long)ff_rumble },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_THRUSTMASTER, 0xb320),   /* Dual Trigger 2-in-1 */
+		.driver_data = (unsigned long)ff_rumble },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_THRUSTMASTER, 0xb323),   /* Dual Trigger 3-in-1 (PC Mode) */
 		.driver_data = (unsigned long)ff_rumble },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_THRUSTMASTER, 0xb324),   /* Dual Trigger 3-in-1 (PS3 Mode) */
-- 
2.22.0

