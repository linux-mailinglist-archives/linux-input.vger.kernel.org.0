Return-Path: <linux-input+bounces-16687-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 83EFECDE0DB
	for <lists+linux-input@lfdr.de>; Thu, 25 Dec 2025 20:08:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3FA793000FA3
	for <lists+linux-input@lfdr.de>; Thu, 25 Dec 2025 19:08:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14E552749DF;
	Thu, 25 Dec 2025 19:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SaM+g8M9"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 124492264B8
	for <linux-input@vger.kernel.org>; Thu, 25 Dec 2025 19:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766689726; cv=none; b=S8kb2NUEWVo1svZwSxQPqSLILOQeln8Tw/mU2dJ4CiOiP7MAWydGgjMvfLdgfqk6vTNDBaB/1rUh//Rl3pqsZBLva5uAViO7lCl+QaAuIWTxSPmdrFjYyCFKJqmVdP3zRJvF+ogIGbNcAba5oURxk491tVMgDpX7VkJ2G4q3CWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766689726; c=relaxed/simple;
	bh=O7OV29LqOFkYYxef7WbBIg0MkhpiAae+ITkzeUz+7OU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Us9LDCnjaIK2Y1w65G8oyLRm4vqv/GgFRWRJdkZdl71/xMKTd/RCnLlHLaN5iYHaLBpK+NCgcjJCuIv7gK8gA/YBPFSgoODisRIdZTrEkdFwTcWHKJBGrdYIjeQq5TLLaAqqPr0+1/auyveuwttqjpEEx+ph2Lc/gS+xxUY5joI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SaM+g8M9; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-34e90f7b49cso5091761a91.3
        for <linux-input@vger.kernel.org>; Thu, 25 Dec 2025 11:08:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766689723; x=1767294523; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=X3ORFj2N4UWrYCvvX94DX724F6eVqFBGFwWbgNVtV/g=;
        b=SaM+g8M9Bx80scYGA9JE5avyFO4oxnKrjLK1eP20fZ25ysXv6ehh9D5x0gx4Lg7eea
         0PmxPtzDZ5419wdU3TvTH8Nw5yruBICosBGohS0BcHMF1NIGCHS0Ay5rJqP+BINZY5GF
         csqzgo2IQDPuNV+3uvRCcs/2n1tGxjFgUNXFadpzGt9IADvkWennTDKawrVeKm/v0GXO
         TyihyWegI1MqTUV24Uf2MWkSvhJCUvWjja4kBTWqovG5+m2QUCRrx8G3tuvvYUlGDcYX
         2upKKcnBMUM7E5u4fuOjfyvg226vG5vy5kzjoBedj3/pZnouexaXFrPt4/6lRSGCIxFA
         9zbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766689723; x=1767294523;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X3ORFj2N4UWrYCvvX94DX724F6eVqFBGFwWbgNVtV/g=;
        b=jsdBlONxeH0krwIiivj/PT6t9nfun1eqo/SXhTCORHfcK+q5MBzMCUhHWY2+xsHUzb
         nGr34pjTluMgcEOfjHFZ5wCBfrwq7it54RDjN3p3KUL3R5REiCVwNHW6pOlqc/xu/qV7
         LLeNcDg5S7Ngw8pgQ+90QpkurGkOphGMySZvmRq0078NB58S1q613BLIldeb1xDUqPb7
         6BXLPOeANBfrJLqk/F0JgtdZMnen0QdT+8wh/fQ1RjSM27tI2Cxnqpmlr7oL7vUERT25
         UpCywDQZ+IolOBMW/DkbyNEw10qcnF3SWIJQxRodLoM8CRccMuRIs/ly99Yylndq7JyT
         581Q==
X-Gm-Message-State: AOJu0YyAVb1dktctUrLUnMtF95Y5T+yrpKhcy+mPLSmJD+TiBP5BYg2O
	X3z/G1Qd1f+OeRmGehRlpmyuv300B1JyQNxzglhKl1cRVObY6sqz+K4h
X-Gm-Gg: AY/fxX5s8oXMdijL/cwFKPCo2nRVpuHSHUSuPiOnpN8VB4yKFHWm5xuaP0IgSUpbFFY
	co1dMEuACPAc4hfvvKiBs7+UypBeZo8f3MY3PLVrZGcumXRkwpFPHHxu1foPjbJhlQwxqBjeBOD
	s4c0NK391g7M+wKC1yuWJCB+g9F4cPts0H9nTNqQIZ9dc9CtPQWxjK10Jcz9ckx0hx7fx3fU1if
	9TUT+wAAsWmCD0jUoA/WHUGqD2TAw8/Xh7hg0Nfd/myMtaczuzSqm75qq1f1hMagPOsVRGvvf5A
	DbTzdW3RzqLOrZs4ZvKh5AhHfjsxxUvDTMWLVhC3YCmEN0XakV7qgGuUzq/CRQvFXsOu+qPOba1
	qbAaNlRS7D6BpRKQB4ulI4W/6jH819NyILPTzcLsC940a3GRX99P1twVmDHmoKK5olMU19tLdZN
	H9w4LVV6MMHCnGL3PTHDsJmBUVErjuQlmO5DjkuLVIVH4DU8dUUMYMfWhV3blYw4LHQME6ZOvk2
	Lwhy+tjB0OP85v+QSjDs20RmRQekfdyMcF8dU5Q6rSQu44XglfqRTpKCAYe
X-Google-Smtp-Source: AGHT+IFxIHTSSEEeM3o1DmcOPfS9sy+kJJEduNpLEoFxfiFhjcZJLxcdrmKAIZh0Lkkr5YCaralzWA==
X-Received: by 2002:a17:90b:2584:b0:32e:7c34:70cf with SMTP id 98e67ed59e1d1-34e9220204dmr16657680a91.36.1766689723176;
        Thu, 25 Dec 2025 11:08:43 -0800 (PST)
Received: from anonymous ([113.252.77.195])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34ed530475bsm4013132a91.8.2025.12.25.11.08.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Dec 2025 11:08:42 -0800 (PST)
From: Kwok Kin Ming <kenkinming2002@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kwok Kin Ming <kenkinming2002@gmail.com>
Subject: [PATCH] HID: i2c-hid: override HID descriptors for some Haptick 5288 touchpads
Date: Fri, 26 Dec 2025 03:08:22 +0800
Message-ID: <20251225190822.150872-1-kenkinming2002@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On some Samsung laptops (750XFG) with Haptick 5288 touchpads over
designware i2c bus, the supplied HID descriptors and report descriptors
can become partially corrupted under some circumstances.

In particular, this can happen if the touchpad attempts to generate
input reports while we try to retrieve the HID descriptors or the Report
descriptor. This can be reproduced by repeatedly reloading the relevant
kernel modules (i2c_hid_acpi and i2c_hid) and attempting to use the
touchpad at the same time. The usage of a script is suggested for the
reproduction of the issue.

Since it is a race condition, one of the symptom of the issue is that it
will eventually resolve itself after repeated rebooting.

There is currently no way of handling malformed HID descriptors and
report descriptors and per the I2C HID spec, it is not necessary for the
HOST to re-retrieve a report descriptor under such circumstances.
Instead of having a system to deal with malformed HID descriptors and
report descriptors, we simply hard-code them.

A related issues on another samsung laptop (750XED) have been reported
on the archlinux forum.

Links: https://bbs.archlinux.org/viewtopic.php?id=289627
Signed-off-by: Kwok Kin Ming <kenkinming2002@gmail.com>
---
Other fixes were attempted at the issue but none of them work. In
summary, they included:

1: Remove I2C_HID_QUIRK_NO_IRQ_AFTER_RESET quirk.
2: Do not send power on command to the device before reset.
3: Detect if any interrupts have fired when we are reading HID
   descriptors and report descriptors in a racy manner.

Other suggestions are welcomed.

The patch triggers style check warnings due to long line but it should
sitll be readable. The comments could be removed if necessary.

Other samsung laptops affected by the issue could also be added if it
can be confirmed.

 drivers/hid/i2c-hid/i2c-hid-dmi-quirks.c | 262 +++++++++++++++++++++++
 1 file changed, 262 insertions(+)

diff --git a/drivers/hid/i2c-hid/i2c-hid-dmi-quirks.c b/drivers/hid/i2c-hid/i2c-hid-dmi-quirks.c
index 210f17c3a0be..befec7a0c2fd 100644
--- a/drivers/hid/i2c-hid/i2c-hid-dmi-quirks.c
+++ b/drivers/hid/i2c-hid/i2c-hid-dmi-quirks.c
@@ -290,6 +290,260 @@ static const struct i2c_hid_desc_override sipodev_desc = {
 	.i2c_name = "SYNA3602:00"
 };

+static const struct i2c_hid_desc_override hantick5288_desc = {
+	.i2c_hid_desc_buffer = (uint8_t [])
+	{0x1e, 0x00,             /* Length of descriptor          */
+	 0x00, 0x01,             /* Version of descriptor         */
+	 0xe2, 0x01,             /* Length of report descriptor   */
+	 0x21, 0x00,             /* Location of report descriptor */
+	 0x24, 0x00,             /* Location of input report      */
+	 0x1f, 0x00,             /* Max input report length       */
+	 0x25, 0x00,             /* Location of output report     */
+	 0x11, 0x00,             /* Max output report length      */
+	 0x22, 0x00,             /* Location of command register  */
+	 0x23, 0x00,             /* Location of data register     */
+	 0x11, 0x09,             /* Vendor ID                     */
+	 0x88, 0x52,             /* Product ID                    */
+	 0x06, 0x00,             /* Version ID                    */
+	 0x00, 0x00, 0x00, 0x00, /* Reserved                      */
+	},
+	.hid_report_desc = (uint8_t [])
+	{0x05, 0x01,                   /* Usage Page (Generic Desktop Ctrls)                                                       */
+	 0x09, 0x02,                   /* Usage (Mouse)                                                                            */
+	 0xA1, 0x01,                   /* Collection (Application)                                                                 */
+	 0x85, 0x01,                   /*   Report ID (1)                                                                          */
+	 0x09, 0x01,                   /*   Usage (Pointer)                                                                        */
+	 0xA1, 0x00,                   /*   Collection (Physical)                                                                  */
+	 0x05, 0x09,                   /*     Usage Page (Button)                                                                  */
+	 0x19, 0x01,                   /*     Usage Minimum (0x01)                                                                 */
+	 0x29, 0x02,                   /*     Usage Maximum (0x02)                                                                 */
+	 0x25, 0x01,                   /*     Logical Maximum (1)                                                                  */
+	 0x75, 0x01,                   /*     Report Size (1)                                                                      */
+	 0x95, 0x02,                   /*     Report Count (2)                                                                     */
+	 0x81, 0x02,                   /*     Input (Data,Var,Abs,No Wrap,Linear,Preferred State,No Null Position)                 */
+	 0x95, 0x06,                   /*     Report Count (6)                                                                     */
+	 0x81, 0x01,                   /*     Input (Const,Array,Abs,No Wrap,Linear,Preferred State,No Null Position)              */
+	 0x05, 0x01,                   /*     Usage Page (Generic Desktop Ctrls)                                                   */
+	 0x09, 0x30,                   /*     Usage (X)                                                                            */
+	 0x09, 0x31,                   /*     Usage (Y)                                                                            */
+	 0x15, 0x81,                   /*     Logical Minimum (-127)                                                               */
+	 0x25, 0x7F,                   /*     Logical Maximum (127)                                                                */
+	 0x75, 0x08,                   /*     Report Size (8)                                                                      */
+	 0x95, 0x02,                   /*     Report Count (2)                                                                     */
+	 0x81, 0x06,                   /*     Input (Data,Var,Rel,No Wrap,Linear,Preferred State,No Null Position)                 */
+	 0xC0,                         /*   End Collection                                                                         */
+	 0xC0,                         /* End Collection                                                                           */
+	 0x05, 0x0D,                   /* Usage Page (Digitizer)                                                                   */
+	 0x09, 0x05,                   /* Usage (Touch Pad)                                                                        */
+	 0xA1, 0x01,                   /* Collection (Application)                                                                 */
+	 0x95, 0x01,                   /*   Report Count (1)                                                                       */
+	 0x55, 0x0E,                   /*   Unit Exponent (-2)                                                                     */
+	 0x65, 0x11,                   /*   Unit (System: SI Linear, Length: Centimeter)                                           */
+	 0x15, 0x00,                   /*   Logical Minimum (0)                                                                    */
+	 0x85, 0x04,                   /*   Report ID (4)                                                                          */
+	 0x05, 0x0D,                   /*   Usage Page (Digitizer)                                                                 */
+	 0x09, 0x22,                   /*   Usage (Finger)                                                                         */
+	 0xA1, 0x02,                   /*   Collection (Logical)                                                                   */
+	 0x25, 0x01,                   /*     Logical Maximum (1)                                                                  */
+	 0x75, 0x01,                   /*     Report Size (1)                                                                      */
+	 0x09, 0x47,                   /*     Usage (0x47)                                                                         */
+	 0x81, 0x02,                   /*     Input (Data,Var,Abs,No Wrap,Linear,Preferred State,No Null Position)                 */
+	 0x09, 0x42,                   /*     Usage (Tip Switch)                                                                   */
+	 0x81, 0x02,                   /*     Input (Data,Var,Abs,No Wrap,Linear,Preferred State,No Null Position)                 */
+	 0x75, 0x06,                   /*     Report Size (6)                                                                      */
+	 0x25, 0x05,                   /*     Logical Maximum (5)                                                                  */
+	 0x09, 0x51,                   /*     Usage (0x51)                                                                         */
+	 0x81, 0x02,                   /*     Input (Data,Var,Abs,No Wrap,Linear,Preferred State,No Null Position)                 */
+	 0x05, 0x01,                   /*     Usage Page (Generic Desktop Ctrls)                                                   */
+	 0x75, 0x10,                   /*     Report Size (16)                                                                     */
+	 0x26, 0x44, 0x0A,             /*     Logical Maximum (2628)                                                               */
+	 0x46, 0xB0, 0x04,             /*     Physical Maximum (1200)                                                              */
+	 0x09, 0x30,                   /*     Usage (X)                                                                            */
+	 0x81, 0x02,                   /*     Input (Data,Var,Abs,No Wrap,Linear,Preferred State,No Null Position)                 */
+	 0x26, 0x34, 0x05,             /*     Logical Maximum (1332)                                                               */
+	 0x46, 0x38, 0x03,             /*     Physical Maximum (824)                                                               */
+	 0x09, 0x31,                   /*     Usage (Y)                                                                            */
+	 0x81, 0x02,                   /*     Input (Data,Var,Abs,No Wrap,Linear,Preferred State,No Null Position)                 */
+	 0xC0,                         /*   End Collection                                                                         */
+	 0x05, 0x0D,                   /*   Usage Page (Digitizer)                                                                 */
+	 0x09, 0x22,                   /*   Usage (Finger)                                                                         */
+	 0xA1, 0x02,                   /*   Collection (Logical)                                                                   */
+	 0x25, 0x01,                   /*     Logical Maximum (1)                                                                  */
+	 0x75, 0x01,                   /*     Report Size (1)                                                                      */
+	 0x09, 0x47,                   /*     Usage (0x47)                                                                         */
+	 0x81, 0x02,                   /*     Input (Data,Var,Abs,No Wrap,Linear,Preferred State,No Null Position)                 */
+	 0x09, 0x42,                   /*     Usage (Tip Switch)                                                                   */
+	 0x81, 0x02,                   /*     Input (Data,Var,Abs,No Wrap,Linear,Preferred State,No Null Position)                 */
+	 0x75, 0x06,                   /*     Report Size (6)                                                                      */
+	 0x25, 0x05,                   /*     Logical Maximum (5)                                                                  */
+	 0x09, 0x51,                   /*     Usage (0x51)                                                                         */
+	 0x81, 0x02,                   /*     Input (Data,Var,Abs,No Wrap,Linear,Preferred State,No Null Position)                 */
+	 0x05, 0x01,                   /*     Usage Page (Generic Desktop Ctrls)                                                   */
+	 0x75, 0x10,                   /*     Report Size (16)                                                                     */
+	 0x26, 0x44, 0x0A,             /*     Logical Maximum (2628)                                                               */
+	 0x46, 0xB0, 0x04,             /*     Physical Maximum (1200)                                                              */
+	 0x09, 0x30,                   /*     Usage (X)                                                                            */
+	 0x81, 0x02,                   /*     Input (Data,Var,Abs,No Wrap,Linear,Preferred State,No Null Position)                 */
+	 0x26, 0x34, 0x05,             /*     Logical Maximum (1332)                                                               */
+	 0x46, 0x38, 0x03,             /*     Physical Maximum (824)                                                               */
+	 0x09, 0x31,                   /*     Usage (Y)                                                                            */
+	 0x81, 0x02,                   /*     Input (Data,Var,Abs,No Wrap,Linear,Preferred State,No Null Position)                 */
+	 0xC0,                         /*   End Collection                                                                         */
+	 0x05, 0x0D,                   /*   Usage Page (Digitizer)                                                                 */
+	 0x09, 0x22,                   /*   Usage (Finger)                                                                         */
+	 0xA1, 0x02,                   /*   Collection (Logical)                                                                   */
+	 0x25, 0x01,                   /*     Logical Maximum (1)                                                                  */
+	 0x75, 0x01,                   /*     Report Size (1)                                                                      */
+	 0x09, 0x47,                   /*     Usage (0x47)                                                                         */
+	 0x81, 0x02,                   /*     Input (Data,Var,Abs,No Wrap,Linear,Preferred State,No Null Position)                 */
+	 0x09, 0x42,                   /*     Usage (Tip Switch)                                                                   */
+	 0x81, 0x02,                   /*     Input (Data,Var,Abs,No Wrap,Linear,Preferred State,No Null Position)                 */
+	 0x75, 0x06,                   /*     Report Size (6)                                                                      */
+	 0x25, 0x05,                   /*     Logical Maximum (5)                                                                  */
+	 0x09, 0x51,                   /*     Usage (0x51)                                                                         */
+	 0x81, 0x02,                   /*     Input (Data,Var,Abs,No Wrap,Linear,Preferred State,No Null Position)                 */
+	 0x05, 0x01,                   /*     Usage Page (Generic Desktop Ctrls)                                                   */
+	 0x75, 0x10,                   /*     Report Size (16)                                                                     */
+	 0x26, 0x44, 0x0A,             /*     Logical Maximum (2628)                                                               */
+	 0x46, 0xB0, 0x04,             /*     Physical Maximum (1200)                                                              */
+	 0x09, 0x30,                   /*     Usage (X)                                                                            */
+	 0x81, 0x02,                   /*     Input (Data,Var,Abs,No Wrap,Linear,Preferred State,No Null Position)                 */
+	 0x26, 0x34, 0x05,             /*     Logical Maximum (1332)                                                               */
+	 0x46, 0x38, 0x03,             /*     Physical Maximum (824)                                                               */
+	 0x09, 0x31,                   /*     Usage (Y)                                                                            */
+	 0x81, 0x02,                   /*     Input (Data,Var,Abs,No Wrap,Linear,Preferred State,No Null Position)                 */
+	 0xC0,                         /*   End Collection                                                                         */
+	 0x05, 0x0D,                   /*   Usage Page (Digitizer)                                                                 */
+	 0x09, 0x22,                   /*   Usage (Finger)                                                                         */
+	 0xA1, 0x02,                   /*   Collection (Logical)                                                                   */
+	 0x25, 0x01,                   /*     Logical Maximum (1)                                                                  */
+	 0x75, 0x01,                   /*     Report Size (1)                                                                      */
+	 0x09, 0x47,                   /*     Usage (0x47)                                                                         */
+	 0x81, 0x02,                   /*     Input (Data,Var,Abs,No Wrap,Linear,Preferred State,No Null Position)                 */
+	 0x09, 0x42,                   /*     Usage (Tip Switch)                                                                   */
+	 0x81, 0x02,                   /*     Input (Data,Var,Abs,No Wrap,Linear,Preferred State,No Null Position)                 */
+	 0x75, 0x06,                   /*     Report Size (6)                                                                      */
+	 0x25, 0x05,                   /*     Logical Maximum (5)                                                                  */
+	 0x09, 0x51,                   /*     Usage (0x51)                                                                         */
+	 0x81, 0x02,                   /*     Input (Data,Var,Abs,No Wrap,Linear,Preferred State,No Null Position)                 */
+	 0x05, 0x01,                   /*     Usage Page (Generic Desktop Ctrls)                                                   */
+	 0x75, 0x10,                   /*     Report Size (16)                                                                     */
+	 0x26, 0x44, 0x0A,             /*     Logical Maximum (2628)                                                               */
+	 0x46, 0xB0, 0x04,             /*     Physical Maximum (1200)                                                              */
+	 0x09, 0x30,                   /*     Usage (X)                                                                            */
+	 0x81, 0x02,                   /*     Input (Data,Var,Abs,No Wrap,Linear,Preferred State,No Null Position)                 */
+	 0x26, 0x34, 0x05,             /*     Logical Maximum (1332)                                                               */
+	 0x46, 0x38, 0x03,             /*     Physical Maximum (824)                                                               */
+	 0x09, 0x31,                   /*     Usage (Y)                                                                            */
+	 0x81, 0x02,                   /*     Input (Data,Var,Abs,No Wrap,Linear,Preferred State,No Null Position)                 */
+	 0xC0,                         /*   End Collection                                                                         */
+	 0x05, 0x0D,                   /*   Usage Page (Digitizer)                                                                 */
+	 0x55, 0x0C,                   /*   Unit Exponent (-4)                                                                     */
+	 0x66, 0x01, 0x10,             /*   Unit (System: SI Linear, Time: Seconds)                                                */
+	 0x47, 0xFF, 0xFF, 0x00, 0x00, /*   Physical Maximum (65534)                                                               */
+	 0x27, 0xFF, 0xFF, 0x00, 0x00, /*   Logical Maximum (65534)                                                                */
+	 0x09, 0x56,                   /*   Usage (0x56)                                                                           */
+	 0x81, 0x02,                   /*   Input (Data,Var,Abs,No Wrap,Linear,Preferred State,No Null Position)                   */
+	 0x25, 0x05,                   /*   Logical Maximum (5)                                                                    */
+	 0x09, 0x54,                   /*   Usage (0x54)                                                                           */
+	 0x75, 0x04,                   /*   Report Size (4)                                                                        */
+	 0x81, 0x02,                   /*   Input (Data,Var,Abs,No Wrap,Linear,Preferred State,No Null Position)                   */
+	 0x05, 0x09,                   /*   Usage Page (Button)                                                                    */
+	 0x09, 0x01,                   /*   Usage (0x01)                                                                           */
+	 0x25, 0x01,                   /*   Logical Maximum (1)                                                                    */
+	 0x25, 0x01,                   /*   Logical Maximum (1)                                                                    */
+	 0x75, 0x01,                   /*   Report Size (1)                                                                        */
+	 0x95, 0x01,                   /*   Report Count (1)                                                                       */
+	 0x81, 0x02,                   /*   Input (Data,Var,Abs,No Wrap,Linear,Preferred State,No Null Position)                   */
+	 0x06, 0x01, 0xFF,             /*   Usage Page (Vendor Defined 0xFF01)                                                     */
+	 0x95, 0x01,                   /*   Report Count (1)                                                                       */
+	 0x75, 0x03,                   /*   Report Size (3)                                                                        */
+	 0x09, 0x41,                   /*   Usage (0x41)                                                                           */
+	 0x81, 0x02,                   /*   Input (Data,Var,Abs,No Wrap,Linear,Preferred State,No Null Position)                   */
+	 0x09, 0x42,                   /*   Usage (0x42)                                                                           */
+	 0x81, 0x02,                   /*   Input (Data,Var,Abs,No Wrap,Linear,Preferred State,No Null Position)                   */
+	 0x75, 0x01,                   /*   Report Size (1)                                                                        */
+	 0x09, 0x40,                   /*   Usage (0x40)                                                                           */
+	 0x81, 0x02,                   /*   Input (Data,Var,Abs,No Wrap,Linear,Preferred State,No Null Position)                   */
+	 0x75, 0x24,                   /*   Report Size (36)                                                                       */
+	 0x81, 0x03,                   /*   Input (Const,Var,Abs,No Wrap,Linear,Preferred State,No Null Position)                  */
+	 0x05, 0x0D,                   /*   Usage Page (Digitizer)                                                                 */
+	 0x85, 0x02,                   /*   Report ID (2)                                                                          */
+	 0x25, 0x0F,                   /*   Logical Maximum (15)                                                                   */
+	 0x75, 0x04,                   /*   Report Size (4)                                                                        */
+	 0x09, 0x55,                   /*   Usage (0x55)                                                                           */
+	 0xB1, 0x02,                   /*   Feature (Data,Var,Abs,No Wrap,Linear,Preferred State,No Null Position,Non-volatile)    */
+	 0x09, 0x59,                   /*   Usage (0x59)                                                                           */
+	 0xB1, 0x02,                   /*   Feature (Data,Var,Abs,No Wrap,Linear,Preferred State,No Null Position,Non-volatile)    */
+	 0x85, 0x06,                   /*   Report ID (6)                                                                          */
+	 0x06, 0x00, 0xFF,             /*   Usage Page (Vendor Defined 0xFF00)                                                     */
+	 0x09, 0xC5,                   /*   Usage (0xC5)                                                                           */
+	 0x26, 0xFF, 0x00,             /*   Logical Maximum (255)                                                                  */
+	 0x75, 0x08,                   /*   Report Size (8)                                                                        */
+	 0x96, 0x00, 0x01,             /*   Report Count (256)                                                                     */
+	 0xB1, 0x02,                   /*   Feature (Data,Var,Abs,No Wrap,Linear,Preferred State,No Null Position,Non-volatile)    */
+	 0xC0,                         /* End Collection                                                                           */
+	 0x05, 0x0D,                   /* Usage Page (Digitizer)                                                                   */
+	 0x09, 0x0E,                   /* Usage (0x0E)                                                                             */
+	 0xA1, 0x01,                   /* Collection (Application)                                                                 */
+	 0x85, 0x03,                   /*   Report ID (3)                                                                          */
+	 0x09, 0x22,                   /*   Usage (Finger)                                                                         */
+	 0xA1, 0x02,                   /*   Collection (Logical)                                                                   */
+	 0x09, 0x52,                   /*     Usage (0x52)                                                                         */
+	 0x25, 0x0A,                   /*     Logical Maximum (10)                                                                 */
+	 0x95, 0x01,                   /*     Report Count (1)                                                                     */
+	 0xB1, 0x02,                   /*     Feature (Data,Var,Abs,No Wrap,Linear,Preferred State,No Null Position,Non-volatile)  */
+	 0xC0,                         /*   End Collection                                                                         */
+	 0x09, 0x22,                   /*   Usage (Finger)                                                                         */
+	 0xA1, 0x00,                   /*   Collection (Physical)                                                                  */
+	 0x85, 0x05,                   /*     Report ID (5)                                                                        */
+	 0x25, 0x01,                   /*     Logical Maximum (1)                                                                  */
+	 0x75, 0x01,                   /*     Report Size (1)                                                                      */
+	 0x09, 0x57,                   /*     Usage (0x57)                                                                         */
+	 0xB1, 0x02,                   /*     Feature (Data,Var,Abs,No Wrap,Linear,Preferred State,No Null Position,Non-volatile)  */
+	 0x09, 0x58,                   /*     Usage (0x58)                                                                         */
+	 0xB1, 0x02,                   /*     Feature (Data,Var,Abs,No Wrap,Linear,Preferred State,No Null Position,Non-volatile)  */
+	 0x75, 0x06,                   /*     Report Size (6)                                                                      */
+	 0xB1, 0x03,                   /*     Feature (Const,Var,Abs,No Wrap,Linear,Preferred State,No Null Position,Non-volatile) */
+	 0xC0,                         /*   End Collection                                                                         */
+	 0xC0,                         /* End Collection                                                                           */
+	 0x06, 0x01, 0xFF,             /* Usage Page (Vendor Defined 0xFF01)                                                       */
+	 0x09, 0x02,                   /* Usage (0x02)                                                                             */
+	 0xA1, 0x01,                   /* Collection (Application)                                                                 */
+	 0x75, 0x08,                   /*   Report Size (8)                                                                        */
+	 0x85, 0x0D,                   /*   Report ID (13)                                                                         */
+	 0x09, 0xD5,                   /*   Usage (0xD5)                                                                           */
+	 0x95, 0x18,                   /*   Report Count (24)                                                                      */
+	 0xB1, 0x02,                   /*   Feature (Data,Var,Abs,No Wrap,Linear,Preferred State,No Null Position,Non-volatile)    */
+	 0x85, 0x0C,                   /*   Report ID (12)                                                                         */
+	 0x09, 0xD6,                   /*   Usage (0xD6)                                                                           */
+	 0x96, 0x91, 0x00,             /*   Report Count (145)                                                                     */
+	 0xB1, 0x02,                   /*   Feature (Data,Var,Abs,No Wrap,Linear,Preferred State,No Null Position,Non-volatile)    */
+	 0x09, 0x30,                   /*   Usage (0x30)                                                                           */
+	 0x85, 0x07,                   /*   Report ID (7)                                                                          */
+	 0x95, 0x07,                   /*   Report Count (7)                                                                       */
+	 0x81, 0x02,                   /*   Input (Data,Var,Abs,No Wrap,Linear,Preferred State,No Null Position)                   */
+	 0x09, 0x70,                   /*   Usage (0x70)                                                                           */
+	 0x85, 0x0E,                   /*   Report ID (14)                                                                         */
+	 0x95, 0xC9,                   /*   Report Count (-55)                                                                     */
+	 0x81, 0x02,                   /*   Input (Data,Var,Abs,No Wrap,Linear,Preferred State,No Null Position)                   */
+	 0x09, 0x71,                   /*   Usage (0x71)                                                                           */
+	 0x85, 0x08,                   /*   Report ID (8)                                                                          */
+	 0x95, 0x97,                   /*   Report Count (-105)                                                                    */
+	 0x81, 0x02,                   /*   Input (Data,Var,Abs,No Wrap,Linear,Preferred State,No Null Position)                   */
+	 0x09, 0x72,                   /*   Usage (0x72)                                                                           */
+	 0x85, 0x09,                   /*   Report ID (9)                                                                          */
+	 0x95, 0xFD,                   /*   Report Count (-3)                                                                      */
+	 0x81, 0x02,                   /*   Input (Data,Var,Abs,No Wrap,Linear,Preferred State,No Null Position)                   */
+	 0x09, 0x73,                   /*   Usage (0x73)                                                                           */
+	 0x85, 0x0A,                   /*   Report ID (10)                                                                         */
+	 0x95, 0x20,                   /*   Report Count (32)                                                                      */
+	 0x91, 0x02,                   /*   Output (Data,Var,Abs,No Wrap,Linear,Preferred State,No Null Position,Non-volatile)     */
+	 0xC0,                         /* End Collection                                                                           */
+	},
+	.hid_report_desc_size = 482,
+	.i2c_name = "SPPT2600:00"
+};

 static const struct dmi_system_id i2c_hid_dmi_desc_override_table[] = {
 	{
@@ -415,6 +669,14 @@ static const struct dmi_system_id i2c_hid_dmi_desc_override_table[] = {
 		},
 		.driver_data = (void *)&sipodev_desc
 	},
+	{
+		.ident = "Samsung 750XFG",
+		.matches = {
+			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "SAMSUNG ELECTRONICS CO., LTD."),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "750XFG"),
+		},
+		.driver_data = (void *)&hantick5288_desc
+	},
 	{ }	/* Terminate list */
 };

--
2.52.0


