Return-Path: <linux-input+bounces-15803-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E9587C20832
	for <lists+linux-input@lfdr.de>; Thu, 30 Oct 2025 15:12:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 122FA3B9DE7
	for <lists+linux-input@lfdr.de>; Thu, 30 Oct 2025 14:10:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27AEA25334B;
	Thu, 30 Oct 2025 14:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="IWfxwbVr"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-io1-f74.google.com (mail-io1-f74.google.com [209.85.166.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89C391DDC2C
	for <linux-input@vger.kernel.org>; Thu, 30 Oct 2025 14:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761833444; cv=none; b=S9b0Zy0o9QzdflwmLDL1e+/Ut3HkQDTfXJwP4m5eW7K4l2xh66e6iLnVeobiJBkf5GskTxefYHT67tfOd8sWCNraxXDUVKA3N3EsU7+m+9qq8LAsZ1CSj2v5AaAe5Oikt7jMfOX0r1qponKBeQdRSRl2ki2Js51xB65Ezkpnkgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761833444; c=relaxed/simple;
	bh=32A5mTQIFQqIRmuiveRMDxfYCcVj1v+1jARbyBaUep8=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=g+g29KzMdTYWH0Hn2yVL9aj3PC9wPQ5/cYM4PuxqzfE4XIi4cj/k/P0I3auk1OwjoI5oKzHc3nK7RCxlYs13Ozblv10l4SkFDfqWYPMYCJHuEYZrqoc1MurmRfqapErz8KWSpgpwWAGtMLnq+MB1eqsb1CkzyfbzHmwKCJm2+Ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jdenose.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=IWfxwbVr; arc=none smtp.client-ip=209.85.166.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jdenose.bounces.google.com
Received: by mail-io1-f74.google.com with SMTP id ca18e2360f4ac-940e4cf730aso314787739f.1
        for <linux-input@vger.kernel.org>; Thu, 30 Oct 2025 07:10:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761833441; x=1762438241; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=VSxg1CJj702cZRnaY/bjV5foeoJDmE4hP+GaVTsBCwc=;
        b=IWfxwbVr4cs7+E7k9EHRkn8YlayiII0tBRqaDd0R5F9eKq4GYhLWSfCL3z9uRClTQM
         7Sz+oZAKQQVx5MX6bg6cmCLNXE2ZjGABnvqUI5vHc05ursb1b6G0jktBpIYI+7eOq49w
         MrZUjmGsG3w4mgZ/uf1xrAt0geQigJTvjB2ffUCX7BXOx/WN55OF7xscttqPCfAgH8PQ
         ZCTlXYMDBR8mAazR3L0Y6ogOfwZY8EPMswmXkCZGSOhxAZNcfM/IwWzrwzRUhYhYizPy
         6v7AqfOWaX6wQxRDC1voe2NgJOy680Y1UedHpZ+dEjOIEmuaz94dDvgbrAR4icrY18U7
         JztQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761833442; x=1762438242;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VSxg1CJj702cZRnaY/bjV5foeoJDmE4hP+GaVTsBCwc=;
        b=tnpQfL+It7HqSC9oelkqDOnwMR+RO0518sWcl1bXjZaAT2m+MudHYL7wDt6rwPIglO
         YWXKDbYxkHG8bJF3AuL8aR2rne0/2ypfCOJXTLOlE3BUksk1Yxf0ym+7yWJlAD1zecHv
         qDXv/ti5BVBoBwMlGKNsDQxkoC7vCM7JG1NK70HkdrqhMFz9ezp1e59vpdSx1XpUBvOE
         Prw+uT4DPKwaBGs5Fw8WILbvobgclqiAlr6MqUnt2YK480HYOElcrEFoeic8ZGgph3Jw
         V/ZZ9jcaByjEhHiHphf6USag7RrmlxX8gsJWaIVcPqGWwBQLxS05b/BCALe4jxea0xRe
         MAYw==
X-Gm-Message-State: AOJu0YzMRyeF0oS3+p3pES05xUyug+SNU4pymn6kkioC9v6H2fvlbuFi
	wqesS3+mXI2kbZ/RDixl/ygSqv/elaTTuYSKadgG7vsMopyHxnevhBBA7BlNb6iN/eK2PuZxcrg
	i4jaeyQADZA==
X-Google-Smtp-Source: AGHT+IFnx04JeabFm4OR25zruKYKaEs0deWaj6RdMcsqBHXcbL07NdiER+pdzK8yjhGOz5z/mZWvrRQCoO3a
X-Received: from iobbi6.prod.google.com ([2002:a05:6602:3586:b0:945:a07e:808c])
 (user=jdenose job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6602:2d85:b0:940:d4e8:4717
 with SMTP id ca18e2360f4ac-948152a45demr504512939f.13.1761833441652; Thu, 30
 Oct 2025 07:10:41 -0700 (PDT)
Date: Thu, 30 Oct 2025 14:10:39 +0000
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAN9xA2kC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDA0MT3ZzMFN3i8syS5AzdvPySzLTM1CJdw+QkS0tDixQzc9MUJaDOgqL UtMwKsKnRsbW1ABWdUxVlAAAA
X-Change-Id: 20251014-lid-switch-notifier-1cb9918d675d
X-Mailer: b4 0.14.2
Message-ID: <20251030-lid-switch-notifier-v1-0-c58dc9b1439d@google.com>
Subject: [PATCH 0/2] Implement notifier chain for lid switch events
From: Jonathan Denose <jdenose@google.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Jiri Kosina <jikos@kernel.org>, 
	Benjamin Tissoires <bentiss@kernel.org>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Jonathan Denose <jdenose@google.com>
Content-Type: text/plain; charset="utf-8"

To circumvent a hardware issue where the touchpad is not physically
connected to the lid angle sensor, implement a notifier chain which
broadcasts lid switch events and a notifier_block which can be enabled
via a quirk to listen for those events turning the touchpad surface
on or off based on if the lid is open or closed. This will prevent
issues resulting from interference between the laptop lid and the
touchpad.

Signed-off-by: Jonathan Denose <jdenose@google.com>
---
Jonathan Denose (2):
      Input: Create input notifier chain in input.c
      HID: multitouch: Toggle touch surface on Elan touchpad on lid event

 drivers/hid/hid-multitouch.c | 32 +++++++++++++++++++++++++++++++-
 drivers/input/input.c        | 13 +++++++++++++
 include/linux/input.h        |  7 +++++++
 3 files changed, 51 insertions(+), 1 deletion(-)
---
base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
change-id: 20251014-lid-switch-notifier-1cb9918d675d

Best regards,
-- 
Jonathan Denose <jdenose@google.com>


