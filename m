Return-Path: <linux-input+bounces-16012-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CB4FC50135
	for <lists+linux-input@lfdr.de>; Wed, 12 Nov 2025 00:38:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CEE4C3A4A51
	for <lists+linux-input@lfdr.de>; Tue, 11 Nov 2025 23:38:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B6902F363F;
	Tue, 11 Nov 2025 23:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lkSteknn"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B5A52F1FD1
	for <linux-input@vger.kernel.org>; Tue, 11 Nov 2025 23:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762904328; cv=none; b=ig8yiVgaozTO8N1NbQaD3+/rRb7dU1g4QUAacsTQu2FScGrdXWrfQEfw813lbpix0a3TBXTETymgg/uy7EVp7+YvFIp4QYv0AN1GUS3fb3VUsre2+ujvLjrrAyYOW38vVhwWAniQ82qWoJYmQ6I38X1MNdta5pVrMBibaPLmJ7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762904328; c=relaxed/simple;
	bh=IigiDIMijXZfeHUvlRiSrhA3g7xJSSMPOXKOot4Hqt4=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=rQO07CTm6ppQaS5Y7zmykzwJoOJxV8akFkaxVJmEUaNT0JCMWi8p8ZCjqMtBUi/YyvRhsxGgQ2d3YqsqS+Hpfnxbexp/qoC5U0sYMvklYRPhpgKeeTNcQMxtQX4OkWMFUQbRstWHuBqPpRu5PazgVK1qZ/mMHnhJ4/yLYk7kkfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--svv.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lkSteknn; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--svv.bounces.google.com
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-295915934bfso3834475ad.0
        for <linux-input@vger.kernel.org>; Tue, 11 Nov 2025 15:38:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762904326; x=1763509126; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=o08iiA1oF5jn1Mz6FqaTpqVxHBWX2moQi08U6ejuhRg=;
        b=lkSteknn1F2rSCBy3vHP99VBZFH3GYtMwPYRK3qPrLdwtF+dXnZDNLZAYMhJITrSkA
         xvEtIgMl6hhJ/hYKuTRavkbTd+5+FHvvYNrIJBWBANXVbPqkRNdPPc/vbsEc3uNQq8sm
         7zd+c+B24UYnFUw6c9Z4YtWxYqj06ffCOQTK5/2JiQQ4S7qgAfaN54WNA5XO8uMCrKml
         m0PJ8CXVLI3XKN3kr1vV4/U8YVU5NYsZ83/00jZNEka2467ZSrBkKIbK27OKm81GAWgf
         wVuFYaT+rIPmLIGUwyRIIiVMdap2Y7BWZ+IpoP6zqjQ8yYQq9X/iifUHyx7nzdV0O+uN
         AwRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762904326; x=1763509126;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o08iiA1oF5jn1Mz6FqaTpqVxHBWX2moQi08U6ejuhRg=;
        b=BUYFRCVVrznWa5ki2iWcQVPHGCwVLhZbvh27TgM35Rh1uzL2ivlwOL8D332wduSa7i
         GnGpNms5Xn1Ilcw4KnvEzyoY+JHVx9IV3KpAJx6MMNl825lbLtT/Ca97OzpKtxPCKjf9
         vC6boWLkjYW+b09hpm2kh4oc43hg0VaXKnwdFLM8DmnH4PaguYU66Prk7Aymq/69MWYd
         iebTIjMvvVYcHqa1cwZjdvEepvV89JQefVr/ME4xKGtCha63oxMtPSNR1Er2pmiXB81D
         eBrPMA5Tyr3e4sCUAtMVsCzP6FL0oh81oPAQE/fDqLdqZI0gxvrpzuPnzqd2yHEnm4mJ
         8N7A==
X-Forwarded-Encrypted: i=1; AJvYcCUpc3TSf/L0YUW+fyMTVvNhcfvQkfQJLDG7z6CqTooAT0w2x2Q+5RCrzyd1UG/tdGJk7T/pEHkVF78D/g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxA6+Mm24p4S3j95r9MapSVywNVw/NbcEY5EPKPMKf67PX46pXX
	6uUcleCIk5I43xt+RGi6aNg3EY6Y48Zqbc7l2SxqPX6rSkBDH12goPY/3swxYV69G9H53A==
X-Google-Smtp-Source: AGHT+IGg+nufIR9VQY7v3jtSQChGQNOiUiFWaFk2h22Va9xsDUuDikugcVDg/5K7wISAywmJpXvdKPs=
X-Received: from dlbqc13.prod.google.com ([2002:a05:7023:a8d:b0:119:49ca:6bb0])
 (user=svv job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:288:b0:295:2276:6704
 with SMTP id d9443c01a7336-2984edeeda1mr12663315ad.51.1762904325926; Tue, 11
 Nov 2025 15:38:45 -0800 (PST)
Date: Tue, 11 Nov 2025 15:38:18 -0800
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.51.2.1041.gc1ab5b90ca-goog
Message-ID: <20251111233818.4155828-1-svv@google.com>
Subject: [PATCH] HID: playstation: Center initial joystick axes to prevent
 spurious events
From: Siarhei Vishniakou <svv@google.com>
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
	Roderick Colenbrander <roderick.colenbrander@sony.com>, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Cc: Siarhei Vishniakou <svv@google.com>
Content-Type: text/plain; charset="UTF-8"

When a new PlayStation gamepad (DualShock 4 or DualSense) is initialized,
the input subsystem sets the default value for its absolute axes (e.g.,
ABS_X, ABS_Y) to 0.

However, the hardware's actual neutral/resting state for these joysticks
is 128 (0x80). This creates a mismatch.

When the first HID report arrives from the device, the driver sees the
resting value of 128. The kernel compares this to its initial state of 0
and incorrectly interprets this as a delta (0 -> 128). Consequently, it
generates EV_ABS events for this initial, non-existent movement.

This behavior can fail userspace 'sanity check' tests (e.g., in
Android CTS) that correctly assert no motion events should be generated
from a device that is already at rest.

This patch fixes the issue by explicitly setting the initial value of the
main joystick axes (e.g., ABS_X, ABS_Y, ABS_RX, ABS_RY) to 128 (0x80)
in the common ps_gamepad_create() function.

This aligns the kernel's initial state with the hardware's expected
neutral state, ensuring that the first report (at 128) produces no
delta and thus, no spurious event.

Signed-off-by: Siarhei Vishniakou <svv@google.com>
---
 drivers/hid/hid-playstation.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/hid/hid-playstation.c b/drivers/hid/hid-playstation.c
index 1468fb11e39d..fd9d3c901743 100644
--- a/drivers/hid/hid-playstation.c
+++ b/drivers/hid/hid-playstation.c
@@ -718,12 +718,19 @@ static struct input_dev *ps_gamepad_create(struct hid_device *hdev,
 	if (IS_ERR(gamepad))
 		return ERR_CAST(gamepad);
 
+	/* Set initial resting state for joysticks to 128 (center) */
 	input_set_abs_params(gamepad, ABS_X, 0, 255, 0, 0);
+	gamepad->absinfo[ABS_X].value = 128;
 	input_set_abs_params(gamepad, ABS_Y, 0, 255, 0, 0);
+	gamepad->absinfo[ABS_Y].value = 128;
 	input_set_abs_params(gamepad, ABS_Z, 0, 255, 0, 0);
+	gamepad->absinfo[ABS_Z].value = 128;
 	input_set_abs_params(gamepad, ABS_RX, 0, 255, 0, 0);
+	gamepad->absinfo[ABS_RX].value = 128;
 	input_set_abs_params(gamepad, ABS_RY, 0, 255, 0, 0);
+	gamepad->absinfo[ABS_RY].value = 128;
 	input_set_abs_params(gamepad, ABS_RZ, 0, 255, 0, 0);
+	gamepad->absinfo[ABS_RZ].value = 128;
 
 	input_set_abs_params(gamepad, ABS_HAT0X, -1, 1, 0, 0);
 	input_set_abs_params(gamepad, ABS_HAT0Y, -1, 1, 0, 0);
-- 
2.51.0.536.g15c5d4f767-goog


