Return-Path: <linux-input+bounces-3774-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 776D88CC58E
	for <lists+linux-input@lfdr.de>; Wed, 22 May 2024 19:32:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 133AB1F2220E
	for <lists+linux-input@lfdr.de>; Wed, 22 May 2024 17:32:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 832A8537E9;
	Wed, 22 May 2024 17:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GZHpb5c+"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 022E576048;
	Wed, 22 May 2024 17:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716399150; cv=none; b=HA1RJRdRaoczphHsaFlWS01tTDv7pv8G9CHJGUqeuVO5uNiDIeQrdaRBfnuDinjJzQ5vGABzG8zRUJNOUnPNXln/UInZ1llosNUbISTyv6bcPlybGTcNjQbxK2jw5Jk9YillAieoDYV25Hg07uFzw6pfKyd64kMLrPdTq6Qzyiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716399150; c=relaxed/simple;
	bh=mWrCECWP2Ja7WFtRVbyR5oeOzXIhWB9l1tn+yGrpBZE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=t0ss0PhlZD0Qs1rmuXejk0AkF3az9fOvs4lEElxZ/1LiOS1M/cShvvbdEKOTittxOnkx0frh8iYzSvNzQzi/iyg7m3f5vaw5EYl0t+t2fHmFazC3qjW0KcrPNWgBiHq59R535VDUslMLu0Pmsygi7YRF3Qk4Iu72mkly1YWIKoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GZHpb5c+; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-4e15ac35809so1774886e0c.2;
        Wed, 22 May 2024 10:32:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716399148; x=1717003948; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bZ/q3U1UJT4wlFXYPXdxRRy8JpDcn2n2sx8wZZMODq8=;
        b=GZHpb5c+VOewkJXufbmciRVVktHhZmQSRPDo7eId6f432NNcShw1rdNg6AnirkjFUg
         zweirt1tJ/PszClyIh23dqdaVebGAHceJJkItYNpLJsprstFLHZGWJiXNCOX4srsU+Ri
         aChOQC9ViWdR+76dyKfSqIwF7tLZQ/eZUrYDOEZSyFWbZSoO7CSgRbBZGTVIDnaUwBI3
         3DAWb2C0/XNpIFx/+ozpUQC+SC0o0gvq1V0Duc9oMOizSBbAaAilEySOCtuUAxDzfe9w
         dhGYO1NvzXtZVFhjv2SrBB6kwEC2EGvn/GD2Wd9b01trTDwW2/a4n+P3IoZmejHzC6DL
         v3yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716399148; x=1717003948;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bZ/q3U1UJT4wlFXYPXdxRRy8JpDcn2n2sx8wZZMODq8=;
        b=jk99X6C1q7oAKwvRES9fwMXiWhJHTxxwGY99qyGafuXYaE7t8YbTepmxYDz91gA1WA
         cUe8IxdKbJRTO2OUd2B7j0ILKgAY3uIXCburh6qZhdqo/U9k5gBMdvDSX/gc/4XEzxjV
         kodPuvsb+LNZlhJBSfZ18PywOSIuAg11UHmBcpaEJbgoInOorcQVFVqH9XEVMZlLzY+a
         w3lZCMj2wdplnZiX/PynJlr7h833vY3F5Ufe5v5NEROFVkeMhH1+JCKqaWuhnkaSyxDL
         xlCrDOM8nvpOhOPPUIlOItzM6EqGRngm6fAl3WXb7WS+sjWxsPfFo851OXKijBRyO0Q7
         qpXQ==
X-Forwarded-Encrypted: i=1; AJvYcCWfEQr3Q2rHoGJ7VcURK77hdBnWdQ+ACnZiVsBVISrlMTmzxSHo24bgA/SaBfhNSZHHlhges5IR0ISy8qOKmTF8kXSaFLu1rbfedoSVo/FCWqt0ywtfWiUcwoeG+bzvJ+sy/FoRsFuoNZM=
X-Gm-Message-State: AOJu0Yy4BQc8OA9Ke/C9V0caQSzKlwyK4y5sxOLctYZ2nyqSqMdE5UMT
	E5BBbOpk5V7Y0TaVyHQrR3jVHuWKWbs7rYfq6n3urcZJVCQQGn8Z
X-Google-Smtp-Source: AGHT+IF9+hubiYH33sZJMZsgeXxn+KNANzDpPanTvX7E1MvR5CY9FyS5duW0zBDyqv7tPqUM/15Xtw==
X-Received: by 2002:a05:6122:2a15:b0:4df:2137:e929 with SMTP id 71dfb90a1353d-4e218614d9fmr2346705e0c.15.1716399147906;
        Wed, 22 May 2024 10:32:27 -0700 (PDT)
Received: from x13.. ([156.146.54.84])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-4df7bf45412sm3752513e0c.9.2024.05.22.10.32.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 May 2024 10:32:27 -0700 (PDT)
From: Luis Felipe Hernandez <luis.hernandez093@gmail.com>
To: skhan@linuxfoundation.org,
	jikos@kernel.org,
	bentiss@kernel.org
Cc: Luis Felipe Hernandez <luis.hernandez093@gmail.com>,
	linux-kernel-mentees@lists.linuxfoundation.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] Fix spelling and grammar in driver doc
Date: Wed, 22 May 2024 13:31:48 -0400
Message-ID: <20240522173218.6103-1-luis.hernandez093@gmail.com>
X-Mailer: git-send-email 2.45.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

* XBox -> Xbox (lowercase 'b') as per official Microsoft branding
* the controller itself has more than one paddle, hence rephrasing
  "exports the paddle" to reflext this
* rephrase the description of "those" usage to explicitly make reference
  to the paddles which lends itself to replace the SDL statement to
them
* report -> reports grammatical fix in favor of present tense verb. Reports is refering to the act the action being performed by
the subject, in this case the kernel
* spelling fix: interpret
* capitalized first word in bullet points for consistency

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
+ * SDL doesn't know how to interpret KEY_UNKNOWN and thus ignores them.
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


