Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE43C29F58B
	for <lists+linux-input@lfdr.de>; Thu, 29 Oct 2020 20:47:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726174AbgJ2Trg (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 29 Oct 2020 15:47:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726146AbgJ2Trg (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 29 Oct 2020 15:47:36 -0400
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 161B0C0613D2
        for <linux-input@vger.kernel.org>; Thu, 29 Oct 2020 12:47:36 -0700 (PDT)
Received: by mail-yb1-xb4a.google.com with SMTP id l23so3781944ybl.23
        for <linux-input@vger.kernel.org>; Thu, 29 Oct 2020 12:47:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:message-id:mime-version:subject:from:to:cc;
        bh=OuJr16cGdSeTRRY2e3lrFCZY64j7gnlLJ3xITCQ65aI=;
        b=mRBiru9bKQ8H7OIKP2wk7/7jYdaUvQCKVnAZG3PEe9QwZte2v00DMCh90xfZYmOCGS
         6cxCgcKBu5N7/FfyT87zTGt3ar3qItyRGaNn1N8wOthCUiAuppfC6gIs0KZmaIpA5yFq
         Ik0LSzUi6uEPEfREI6pbK4SsHeqmlspqX9aO+efxDsmThbRpQMLOMnz0Jin+xiEOUtUv
         QS5sVIeqxc9luhCUN5+ppW4gUIXs/DHa6Kmm2clhmnGjjhk8GGmkGQ/l9Ina8gB7uKKF
         edX7J0JeVgN27rDNeLm77M09wFRCParf9w2p0alrAL3XoQ2GIaHqkVC1sDYLBUNhA/6z
         fLxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
         :to:cc;
        bh=OuJr16cGdSeTRRY2e3lrFCZY64j7gnlLJ3xITCQ65aI=;
        b=RbyhXD+juX7fKBTTWEmRfpljDFIiVGClDYbCPCLGHCg/KdTooKCg5m8hCn4g/abm71
         liKFSw//7f6lZhTRBbc2O1sU0KkGimMEAE7sszfuuNyDAoM2ArWXMdOOlufkWpfI4QAZ
         902O1kbP8f0EFWpgkVMA1SVVKW7H2uBfWrLzJr3lRTGjX3pb/48ikAnAl5wF86nuE6bd
         qT6BA9s07VLFiNsqUpiHk+helyOcC4gQNAhg3CdoMzj+80/ucQWmU6ekibwt5rD9ABeF
         vJD8f4qDOwnn3OfYIFJ0C+645KNNvYk+9h84/S4e0PNzP4198JTl0pb9+I26+lx9aNG4
         uYyA==
X-Gm-Message-State: AOAM531pn/PUsEZ2/mnCVDVZNGYwTak+ZNBneLNA92bOccjXh6XwkbgK
        nPSXkvU+qNykuFQo9CkJZWafELdp
X-Google-Smtp-Source: ABdhPJyibp/8MRZ03uFNH2K7UJYyrLBfJXZ6SPg+5oSGvhikGPO6Q3wrWr7cwnzCiBqm+Rk0wPGtAqFu
Sender: "lzye via sendgmr" <lzye@chrisye.mtv.corp.google.com>
X-Received: from chrisye.mtv.corp.google.com ([2620:15c:211:2:f693:9fff:fef4:4323])
 (user=lzye job=sendgmr) by 2002:a25:3bd0:: with SMTP id i199mr8949465yba.70.1604000855284;
 Thu, 29 Oct 2020 12:47:35 -0700 (PDT)
Date:   Thu, 29 Oct 2020 12:47:30 -0700
Message-Id: <20201029194730.1615465-1-lzye@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.29.1.341.ge80a0c044ae-goog
Subject: [PATCH] ANDROID: Fix the HID usage of DPAD input event generation.
From:   Chris Ye <lzye@google.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Alexandru Ardelean <alexandru.ardelean@analog.com>,
        Mark Brown <broonie@kernel.org>
Cc:     linux-kernel@vger.kernel.org, trivial@kernel.org,
        linux-input@vger.kernel.org, linzhao.ye@gmail.com,
        Chris Ye <lzye@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Generic Desktop DPAD usage is mapped by hid-input, that only the first
DPAD usage maps to usage type EV_ABS and code of an axis. If HID
descriptor has DPAD UP/DOWN/LEFT/RIGHT HID usages and each of usage size
is 1 bit, then only the first one will generate input event, the rest of
the HID usages will be assigned to hat direction only.
The hid input event should check the HID report value and generate
HID event for its hat direction.

Test: Connect HID device with Generic Desktop DPAD usage and press the
DPAD to generate input events.

Signed-off-by: Chris Ye <lzye@google.com>
---
 drivers/hid/hid-input.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/hid/hid-input.c b/drivers/hid/hid-input.c
index 9770db624bfa..6c1007de3409 100644
--- a/drivers/hid/hid-input.c
+++ b/drivers/hid/hid-input.c
@@ -1269,7 +1269,7 @@ void hidinput_hid_event(struct hid_device *hid, struct hid_field *field, struct
 	struct input_dev *input;
 	unsigned *quirks = &hid->quirks;
 
-	if (!usage->type)
+	if (!usage->type && !field->dpad)
 		return;
 
 	if (usage->type == EV_PWR) {
@@ -1286,9 +1286,17 @@ void hidinput_hid_event(struct hid_device *hid, struct hid_field *field, struct
 		int hat_dir = usage->hat_dir;
 		if (!hat_dir)
 			hat_dir = (value - usage->hat_min) * 8 / (usage->hat_max - usage->hat_min + 1) + 1;
-		if (hat_dir < 0 || hat_dir > 8) hat_dir = 0;
-		input_event(input, usage->type, usage->code    , hid_hat_to_axis[hat_dir].x);
-		input_event(input, usage->type, usage->code + 1, hid_hat_to_axis[hat_dir].y);
+		if (hat_dir < 0 || hat_dir > 8 || value == 0)
+			hat_dir = 0;
+		if (field->dpad) {
+			input_event(input, EV_ABS, field->dpad, hid_hat_to_axis[hat_dir].x);
+			input_event(input, EV_ABS, field->dpad + 1, hid_hat_to_axis[hat_dir].y);
+		} else {
+			input_event(input, usage->type, usage->code,
+				hid_hat_to_axis[hat_dir].x);
+			input_event(input, usage->type, usage->code + 1,
+				hid_hat_to_axis[hat_dir].y);
+		}
 		return;
 	}
 
-- 
2.29.1.341.ge80a0c044ae-goog

