Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C17F2A2123
	for <lists+linux-input@lfdr.de>; Sun,  1 Nov 2020 20:35:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727422AbgKATfJ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 1 Nov 2020 14:35:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727417AbgKATfI (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 1 Nov 2020 14:35:08 -0500
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1801C061A04
        for <linux-input@vger.kernel.org>; Sun,  1 Nov 2020 11:35:08 -0800 (PST)
Received: by mail-yb1-xb49.google.com with SMTP id c9so12043277ybs.8
        for <linux-input@vger.kernel.org>; Sun, 01 Nov 2020 11:35:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:message-id:mime-version:subject:from:to:cc;
        bh=OuJr16cGdSeTRRY2e3lrFCZY64j7gnlLJ3xITCQ65aI=;
        b=YFpwJ3UOF81+JP7iceQKy3Qh1y5MnNdGDMMPvsERA2XcBJAHQLwLlZCt63RIFO+cj4
         J8QWp8xeCkdGtmPZYcOK36pGJDpAAf2j37sYFEKmdgFDDKXwvT9PSLU7bRrFSe2VB8Po
         GdukDKIo1ArMr5QolU5IcnDN37qMA/ajcWNqzhsOdk+4POC1WGuH3at1IHVceV//9vL/
         Z29hMH0JgLj8G+wAUgZDCDt3ms7qCnxSIqdU2S/mQ1mg9Cq9mAsUDKEVH+vJa9pMU5v4
         wFTzkOrpkZa1WN/5BU3YnWv+sBmM+LTlpog04lfIplKZ4gq9EQEWO8oY84wqxXCCuP0R
         ArHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
         :to:cc;
        bh=OuJr16cGdSeTRRY2e3lrFCZY64j7gnlLJ3xITCQ65aI=;
        b=K4wKwdZwbnH9BlN79/jBC1pjvAAQebBzHe1qAMU1MqL8uW0nLLbtxoq3OB88ppIIKB
         u9pxB72JwQ1yrE/m2lP5MriqcxvdCivGjVTVOAZEIlMWWUEWebxSWDYN9PyGrg9lmkNX
         0qTtPiVqRSzTDEoAoHJEC/UHnYK4tI6uwJVLCoXpt5e2HOKjThwXYzoT1TlOiC3utiH6
         p/zSb4hP6/c1E9WXV3tuCoSlgbX84cJBKBugd9udVozLn4vKc456paskUy6LIAgDs3h1
         weVM95i6dt89o6ROWJ6PxjoVf5iR6LOS4rMD6fmSGFXO3smnw0ceKdUBv6BctoKU3Hj4
         evNA==
X-Gm-Message-State: AOAM5318tTvexvdRbQyQx8hUqc8ICc7y351I9TvipIX66mVcMIk9le3t
        VMsrMB8AdwK2MAw1gjOM1OLdizR/
X-Google-Smtp-Source: ABdhPJyPXgtzkyOAwc9QnZonlkTWmEoFWPrjc3RdR5rN2DB7pAs27dj2y2XPFQBvm5wsmEt1GbCdCJu5
Sender: "lzye via sendgmr" <lzye@chrisye.mtv.corp.google.com>
X-Received: from chrisye.mtv.corp.google.com ([2620:15c:211:2:f693:9fff:fef4:4323])
 (user=lzye job=sendgmr) by 2002:a25:4113:: with SMTP id o19mr16612588yba.314.1604259307824;
 Sun, 01 Nov 2020 11:35:07 -0800 (PST)
Date:   Sun,  1 Nov 2020 11:35:04 -0800
Message-Id: <20201101193504.679934-1-lzye@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.29.1.341.ge80a0c044ae-goog
Subject: [PATCH v2] Input: Fix the HID usage of DPAD input event generation.
From:   Chris Ye <lzye@google.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
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

