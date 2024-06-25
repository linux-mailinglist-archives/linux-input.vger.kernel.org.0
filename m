Return-Path: <linux-input+bounces-4609-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F0AC91659D
	for <lists+linux-input@lfdr.de>; Tue, 25 Jun 2024 12:56:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B8263B23344
	for <lists+linux-input@lfdr.de>; Tue, 25 Jun 2024 10:56:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40A8114A4EB;
	Tue, 25 Jun 2024 10:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A2RLIpQk"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4CE053370;
	Tue, 25 Jun 2024 10:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719312975; cv=none; b=X6nFVAJA9fTrQM2LmkXW2V0bOx6QCD77r6pO4JEP1F6i1GVDcGPpb/Q+jBU3d3Hw9vqw0G4YyEGbMv1PxMouss9e2dReRYgJisnanrSlb1QCBsJ9ADW+3815A7AsDj3DNJ9n4Mj6/p+uMWHO/9gH1IbUTxNIYYhoyECXXaHIIQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719312975; c=relaxed/simple;
	bh=hTNAj3/Oja0HKxdIRA7PqTbQQGTuCEMxvkrEXUfSFao=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CnlTbf/YKFMuaeORLnsWNFUEGztlL7kTlTgjQh/jj6Ve3smSuNA6MRSCCt428c1/bC6udxc+mefViiTDbLGBN+XRGeiWIVasDR4qo+BxuSLQxKns15otKlTWdxpIPmE73Jp6P9ztKU552cxvsp0iT7+U51tdsfqruoA2mkVE2Dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A2RLIpQk; arc=none smtp.client-ip=209.85.217.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-48f49d1e660so918893137.0;
        Tue, 25 Jun 2024 03:56:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719312972; x=1719917772; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ppyxY5z+fhazOwe4ttxmX4yNRD5oIeZ1CdOSpo77Chs=;
        b=A2RLIpQknaGpz6Js4ldziet9HCQFiWFzOdQ6dbtvAhHewNraZqILThMIOrhcJq2KMe
         lPTS0syj+nj2ZWb7LFNhZ5mFf0dlTuhUpYu0Ma+/R7ZO9IwbnjS03+wpj82Eroxmd4sC
         L7DPaQQiz00jxA106lBIA+HYEDyBZBQUIvYjpcsafzFJfA3R9yZBCXz8GwRl2+W+nIpE
         EaxT0iTKtTNZRjK38+USnUQyP8o3jd1wa8SRLqzawle09nzHFxO7m+FdY7AtdPeEUpBq
         Sobe8w7QpcECHFAeJx5W9d5WQmC+FgMW3MIqluEf01VSBH6hkllsBT7aKwQbgeila4sb
         Ygxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719312972; x=1719917772;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ppyxY5z+fhazOwe4ttxmX4yNRD5oIeZ1CdOSpo77Chs=;
        b=i0W36HD+QtDOBgXj4JhBi7P/HmOjE0uLIrXLUUQyhUmalRu219XrFBGY+4zsc/iIt0
         h7U1vEAMW39Nf8HAlvwKCjfbuT3aFBTKD5SRroI00i3+ulkI6EHBSrxYXy+sXpmBf1xl
         4rAGsI2e5XASq4j/WB/9hk7YHdsBH7z2y8I3clRO1BlkuEwRDx5zlZylL8JkR2lrKjd7
         KJ/WdFHGpMdstrOXIGGxc9ssurR+CoxqlxzXQY4rl25g8GDu5fnZWHFmi88aXNIMO2Yg
         Ys9/TGF6f6rw+OAh8jmo8IwIwspNO3ThG9H46OC8N2Yns7sAEKoicNqFAavIDV5+0VWl
         CUDw==
X-Forwarded-Encrypted: i=1; AJvYcCVvpKKyGBx/itCQpX9fnm2sVCMwETYNwxOJK3YPd2g7pt/zAT3TAvDH12t4Flk9ivdWwC83YWwEpG6ljC0S+TT+R3H6kwT5BwCOAxUo+NNETo5sArJFfuh4FdiS6ztL7p0vy/NH2JvYPo0=
X-Gm-Message-State: AOJu0YynBUHFWV3looMR5Yx/HSmuAhkgGG/ERNTol8HWga0PseO+07Ih
	mqmMlgL8RwQrlmaneDNZu5N/h5855VC0db6JJ+epBtJLdCVGQAqP
X-Google-Smtp-Source: AGHT+IEgeMrXNRaNQ180Aiaut0pkPbBUrOhOWB98dPWzqkh+hAlX0ONFQcOtPzs5digetMcmsz4k3A==
X-Received: by 2002:a67:f84b:0:b0:48f:4218:4cff with SMTP id ada2fe7eead31-48f5295763amr6688347137.4.1719312972490;
        Tue, 25 Jun 2024 03:56:12 -0700 (PDT)
Received: from x13.lan (2603-9001-5c02-c5bc-0000-0000-0000-1b5d.inf6.spectrum.com. [2603:9001:5c02:c5bc::1b5d])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-48f6946f67esm387996137.29.2024.06.25.03.56.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 03:56:12 -0700 (PDT)
From: Luis Felipe Hernandez <luis.hernandez093@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: Luis Felipe Hernandez <luis.hernandez093@gmail.com>,
	skhan@linuxfoundation.org,
	ricardo@marliere.net,
	linux-kernel-mentees@lists.linuxfoundation.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND] hid: bpf: Fix grammar
Date: Tue, 25 Jun 2024 06:55:51 -0400
Message-ID: <20240625105553.50830-1-luis.hernandez093@gmail.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

* spelling fix: XBox -> Xbox, lowercase 'b' as per Microsoft branding
* rephrase: paddle -> paddles, the controller itself has more than one paddle
* rephrase: replace usage of "those" in favor of explicitly making reference
  to the paddles
* grammatical fix: report -> reports, use present tense verb. 
* spelling fix: interpret
* consistency: capitalize the first word in bullet points

Signed-off-by: Luis Felipe Hernandez <luis.hernandez093@gmail.com>
---
 .../hid/bpf/progs/Microsoft__XBox-Elite-2.bpf.c   | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/hid/bpf/progs/Microsoft__XBox-Elite-2.bpf.c b/drivers/hid/bpf/progs/Microsoft__XBox-Elite-2.bpf.c
index c04abecab8ee..858cf20ebe2c 100644
--- a/drivers/hid/bpf/progs/Microsoft__XBox-Elite-2.bpf.c
+++ b/drivers/hid/bpf/progs/Microsoft__XBox-Elite-2.bpf.c
@@ -15,20 +15,19 @@ HID_BPF_CONFIG(
 );
 
 /*
- * When using the XBox Wireless Controller Elite 2 over Bluetooth,
- * the device exports the paddle on the back of the device as a single
+ * When using the Xbox Wireless Controller Elite 2 over Bluetooth,
+ * the device exports the paddles on the back of the device as a single
  * bitfield value of usage "Assign Selection".
  *
- * The kernel doesn't process those usages properly and report KEY_UNKNOWN
- * for it.
+ * The kernel doesn't process the paddles usage properly and reports KEY_UNKNOWN.
  *
- * SDL doesn't know how to interprete that KEY_UNKNOWN and thus ignores the paddles.
+ * SDL doesn't know how to interpret KEY_UNKNOWN and thus ignores the paddles.
  *
  * Given that over USB the kernel uses BTN_TRIGGER_HAPPY[5-8], we
- * can tweak the report descriptor to make the kernel interprete it properly:
- * - we need an application collection of gamepad (so we have to close the current
+ * can tweak the report descriptor to make the kernel interpret it properly:
+ * - We need an application collection of gamepad (so we have to close the current
  *   Consumer Control one)
- * - we need to change the usage to be buttons from 0x15 to 0x18
+ * - We need to change the usage to be buttons from 0x15 to 0x18
  */
 
 #define OFFSET_ASSIGN_SELECTION		211
-- 
2.45.1


