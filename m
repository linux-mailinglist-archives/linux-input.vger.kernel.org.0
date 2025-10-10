Return-Path: <linux-input+bounces-15351-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DE65BCB5A8
	for <lists+linux-input@lfdr.de>; Fri, 10 Oct 2025 03:22:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 106084EE7B7
	for <lists+linux-input@lfdr.de>; Fri, 10 Oct 2025 01:22:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B81882737E7;
	Fri, 10 Oct 2025 01:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="23tNBei7"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE22119EED3
	for <linux-input@vger.kernel.org>; Fri, 10 Oct 2025 01:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760059218; cv=none; b=kC5RtRxeE582u2lLKVFyKGA55XlEa+hSRmI7xE6M3srV03O8Y2Z+63LOgfuJgwpeP5aEb7VW832j1pZnU4/BATX6Kaacj6C+NWD3f2F5+IXqJg7YP93bYcDQLM4SZWTwEnFl2D06pttryt0GsRJxmpueUpj+VMD6Mkruc/h6VS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760059218; c=relaxed/simple;
	bh=zpsFxkYp7i/qFinpxTf4uQvjMjKAkyzUtADOVa7F/Rg=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=ND3k8diVFZ5FuxL1Vag/4mOjt6W4e33Cp3I4mCmyFs8OnT0g1CNrrWkGM4xl67nz1hNGasHIIlNIxBvqrode0U4aDRPkc2OVLqKUFdRgHuF24pdM+KIDEeFeJY/l+q4bHDJb7Dmbn1iJG/gYLc5AovL/2EKmotKNKz3udAQYX/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--svv.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=23tNBei7; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--svv.bounces.google.com
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-7810e5a22f3so5098273b3a.1
        for <linux-input@vger.kernel.org>; Thu, 09 Oct 2025 18:20:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760059215; x=1760664015; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Bkwp0xgfZSEd0BSxSFi0SgJuGdtO+jQeRTWHAgDhs58=;
        b=23tNBei7HNsVrsg5ueaNxPGKbOSl+1Y/5n59Opt0xXH41RZF0U7ZCqMpoilr2gZofN
         8cgsKL5IxUi+WhQrzZQQpOu52r/g9QNb/iYEd7m9lXE7GLtILXq+OX8wZxYChn0ua6co
         1DVShrwKEXhUhYDs9rOiW3tw0u4WrjVCS12VFRLXW4DP8AF0sA4adeX8bBKTlLbamuk5
         LBxXTnPmDuK6romnuz2Q15OkHeIUP0L92XFcxTCMof8/dPJbp/l2Le5KsRUzxUDMzEZ9
         SW43Yg7fw2PEidYHIZMjlLfaOB4+FWrEveW4TG4xRTHoHyOI5+xGRZehNcCnFsmHjKcM
         2xcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760059215; x=1760664015;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Bkwp0xgfZSEd0BSxSFi0SgJuGdtO+jQeRTWHAgDhs58=;
        b=LNUrPeTQyTkBujeFtIRD7GGnjZFDAYwN+Q9pDUyMFAnBwecNb9PpJzdxwiCrzRw9le
         JRoT6iDoUKbGOMathUpMcTp7wvBfaMRXAih+coFJc50bgaLCdI9A2uY6mLznRSE3td+6
         ZeMCMaG3og4vVQP+EN7xDvoTamg9IntGH6vF/GLWfTiBAc8FtCt77Jvra5w0Sn7VUzJo
         PBBNr4KNkMXVj06JrzFdfUsZh4sLBxiIUD7BZllGw7f7ltykFoH9/OjIlnugLeibHEBO
         ZyklH14PSW2Nuh3elYw7QgLni3k9wsemiyLV6yy1F+PMoMuzV36HFNQuGYX32uSU5ngH
         cONw==
X-Forwarded-Encrypted: i=1; AJvYcCW013qMQZcuXLlWQbMfeVxII8zo6SFpHadc3p5p6Mt6SzaaZMFwkhaKvwlfj24/FIgwMLdxL6UBksfC3g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwfjYvtbtqJ7yd8vJI/Pckm2Lz6N4NxtIrkMQn6NpEZ/z+kHVtQ
	e5SLSo3AJUhjUlsVVOYVvNm0Rjl4OzJ5kTOV4EXVXkakJc/sUpbd5gNKBhz4zzw8BcYvLQ==
X-Google-Smtp-Source: AGHT+IE/oYoGQXxn68i5qfazwIxY7OpJR/DN4zu7YepqEPWGgaKmJJzz1DQpi8EDScfHDcUOIuvIsCs=
X-Received: from pfx5.prod.google.com ([2002:a05:6a00:a445:b0:77e:468d:c50d])
 (user=svv job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:9a4:b0:77f:2de7:eef3
 with SMTP id d2e1a72fcca58-79385324dcamr11417351b3a.5.1760059214953; Thu, 09
 Oct 2025 18:20:14 -0700 (PDT)
Date: Fri, 10 Oct 2025 01:20:06 +0000
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.51.0.740.g6adb054d12-goog
Message-ID: <20251010012006.2282321-1-svv@google.com>
Subject: [PATCH] HID: playstation: Remap joystick axes to be centered at 0
From: Siarhei Vishniakou <svv@google.com>
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
	Roderick Colenbrander <roderick.colenbrander@sony.com>, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Cc: Siarhei Vishniakou <svv@google.com>
Content-Type: text/plain; charset="UTF-8"

The joystick axes (ABS_X, ABS_Y, ABS_RX, ABS_RY) for PlayStation
gamepads report a neutral state of 128 over HID, with a full range of
[0, 255]. The driver previously mapped this directly, resulting in an
evdev range of [0, 255] with a resting point of 128.

This approach is unconventional for Linux gamepad drivers and has several
drawbacks: it requires userspace applications to be aware of the
non-zero resting state, and it is incompatible with the input
subsystem's 'flat' (deadzone) logic, which assumes a resting point of 0.

This patch remaps the four joystick axes to the conventional signed
8-bit range of [-128, 127], with 0 as the neutral state. This is
accomplished by changing their evdev range in ps_gamepad_create() and
translating the incoming hardware value in the report parsing functions
by subtracting 128.

The analog trigger axes (ABS_Z, ABS_RZ) are handled separately. Their
resting state is 0 (un-pressed), and their hardware range of [0, 255]
is already the conventional representation. They are left unmodified by
this patch.

This makes the joystick behavior consistent with other gamepad drivers
while preserving the standard behavior for the triggers.

Signed-off-by: Siarhei Vishniakou <svv@google.com>
---
 drivers/hid/hid-playstation.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/hid/hid-playstation.c b/drivers/hid/hid-playstation.c
index 1468fb11e39d..ca5bca9c2654 100644
--- a/drivers/hid/hid-playstation.c
+++ b/drivers/hid/hid-playstation.c
@@ -718,11 +718,11 @@ static struct input_dev *ps_gamepad_create(struct hid_device *hdev,
 	if (IS_ERR(gamepad))
 		return ERR_CAST(gamepad);
 
-	input_set_abs_params(gamepad, ABS_X, 0, 255, 0, 0);
-	input_set_abs_params(gamepad, ABS_Y, 0, 255, 0, 0);
+	input_set_abs_params(gamepad, ABS_X, -128, 127, 0, 0);
+	input_set_abs_params(gamepad, ABS_Y, -128, 127, 0, 0);
 	input_set_abs_params(gamepad, ABS_Z, 0, 255, 0, 0);
-	input_set_abs_params(gamepad, ABS_RX, 0, 255, 0, 0);
-	input_set_abs_params(gamepad, ABS_RY, 0, 255, 0, 0);
+	input_set_abs_params(gamepad, ABS_RX, -128, 127, 0, 0);
+	input_set_abs_params(gamepad, ABS_RY, -128, 127, 0, 0);
 	input_set_abs_params(gamepad, ABS_RZ, 0, 255, 0, 0);
 
 	input_set_abs_params(gamepad, ABS_HAT0X, -1, 1, 0, 0);
@@ -1349,10 +1349,10 @@ static int dualsense_parse_report(struct ps_device *ps_dev, struct hid_report *r
 		return -1;
 	}
 
-	input_report_abs(ds->gamepad, ABS_X,  ds_report->x);
-	input_report_abs(ds->gamepad, ABS_Y,  ds_report->y);
-	input_report_abs(ds->gamepad, ABS_RX, ds_report->rx);
-	input_report_abs(ds->gamepad, ABS_RY, ds_report->ry);
+	input_report_abs(ds->gamepad, ABS_X,  ds_report->x - 128);
+	input_report_abs(ds->gamepad, ABS_Y,  ds_report->y - 128);
+	input_report_abs(ds->gamepad, ABS_RX, ds_report->rx - 128);
+	input_report_abs(ds->gamepad, ABS_RY, ds_report->ry - 128);
 	input_report_abs(ds->gamepad, ABS_Z,  ds_report->z);
 	input_report_abs(ds->gamepad, ABS_RZ, ds_report->rz);
 
@@ -2272,10 +2272,10 @@ static int dualshock4_parse_report(struct ps_device *ps_dev, struct hid_report *
 		return -1;
 	}
 
-	input_report_abs(ds4->gamepad, ABS_X,  ds4_report->x);
-	input_report_abs(ds4->gamepad, ABS_Y,  ds4_report->y);
-	input_report_abs(ds4->gamepad, ABS_RX, ds4_report->rx);
-	input_report_abs(ds4->gamepad, ABS_RY, ds4_report->ry);
+	input_report_abs(ds4->gamepad, ABS_X,  ds4_report->x - 128);
+	input_report_abs(ds4->gamepad, ABS_Y,  ds4_report->y - 128);
+	input_report_abs(ds4->gamepad, ABS_RX, ds4_report->rx - 128);
+	input_report_abs(ds4->gamepad, ABS_RY, ds4_report->ry - 128);
 	input_report_abs(ds4->gamepad, ABS_Z,  ds4_report->z);
 	input_report_abs(ds4->gamepad, ABS_RZ, ds4_report->rz);
 
-- 
2.51.0.740.g6adb054d12-goog


