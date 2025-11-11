Return-Path: <linux-input+bounces-16007-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CCD0C4FDD3
	for <lists+linux-input@lfdr.de>; Tue, 11 Nov 2025 22:34:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id EB8B74E1B37
	for <lists+linux-input@lfdr.de>; Tue, 11 Nov 2025 21:34:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9C5D326939;
	Tue, 11 Nov 2025 21:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RTP36pAB"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-io1-f74.google.com (mail-io1-f74.google.com [209.85.166.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C481281508
	for <linux-input@vger.kernel.org>; Tue, 11 Nov 2025 21:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762896855; cv=none; b=RxpJ09jLOr/Aes0bnmzNx1Qz09HuXbn5ndUgPK3oYM6i5+kmM0Wf6rZFBJ21SUhpjmM3oDkToflpFQU4thNvCqLgZCP+DORzBKNR3IPTmIJRGy7jBeZtd05UPc/WtQjgC+w7/uDm/1foLMU5XQHVf+lRSBHRI1cJzIKBXNtRoVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762896855; c=relaxed/simple;
	bh=EpsHWbCPS9QBJDYgd2PMk6G793IhLD6U7GlG4xPdmcs=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=exXwILuO48EJnWeQbKTteoQ323xWchMFa46PDciMRbd/PAhM8yr4FqADtpe0q/PBiPbFgfhE48zycdb4zeYy5Gv8QMEQibekuJG5+6lCcvhG0LV3B1EH+Nnx+HZRXjQ3OgpTI2qxDSz0jhI6GmOF9TZnkXSsXtvBJUD2gSuGkqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jdenose.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RTP36pAB; arc=none smtp.client-ip=209.85.166.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jdenose.bounces.google.com
Received: by mail-io1-f74.google.com with SMTP id ca18e2360f4ac-9489c833d89so16047039f.2
        for <linux-input@vger.kernel.org>; Tue, 11 Nov 2025 13:34:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762896853; x=1763501653; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=faoL/581sKLIsYsWqc2fTjhaZ/7dqlOr2SS7YQEysnk=;
        b=RTP36pABvNesvLLaLW+q4Ft6in/TEzB+g25EuSsaawLo2+L8l9FnOTWJw0MfiRz+yk
         QbYVKaWFcaMOO+AUEw7VKeGvaPqOG4h6lDSwfcObx+8o9vbCMnDS5Xm8CWDsu8evuciO
         em78SWtKRIHTtIgGeYHzjWell0SJExtTHChQ8nN57K3y8olvpd0opN7oMn4Q9rCbERG/
         FIwaP/i6X2zAV03PlPynPuXOWemBzkYpbOBvfWUqtpVQbxiZU9cgJn2O0EhMnDA2BHrS
         +2/ltbDrkTvHriwA0SBu6cG948Zjslo+XC53tRu9nqjniZJhT8swOC/L4Tji4BRL4bLc
         +5Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762896853; x=1763501653;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=faoL/581sKLIsYsWqc2fTjhaZ/7dqlOr2SS7YQEysnk=;
        b=swLpwgijr+gA9DzmR3aCRa3ErEPrBng2QXM+AALspVz66ozHIfsmnv88GgOjrxxauk
         Ks3PWkRaL5Be8n03CYTKIsUfS+Zk/dpska8vDHzyYfTXhEyvjiHz2/g7lSls88EP1m81
         7WCsd+UGHoGmLq8RIliaZAOom4E4YxngInZ+1M8Vh81cqhwvgcrD+WQQEasjzMIvvnrY
         ds/LzkvUUuYOxihjf3C8hwO4HtLqD/WHEIbqzBuwl4gthGgk2q8Tlbwr4ir/Zy2EnP9t
         FawZwPuxe9iS4gTcm3DSNb/2V2GITYHsw3KoRVK6tpcSLRzgaPOhvVcvIzD2VA3eM/wO
         OWng==
X-Gm-Message-State: AOJu0YxyOTvpnEJ+wCZovOL7rRtWJiJSYnvH5/3jpG1sLGqNhMjtIoFd
	czYmZIU0sv6DWrl9FwjMknKPXL3fjt2jpC/EBPUAF6FrPwpyBCzb+ozP4xxlxroyiJ1knQHNfya
	RFN+HvA3y4g==
X-Google-Smtp-Source: AGHT+IG/aZ9go7ZOrpCGgjTMFHeYQjMInmzwgOFE9yrvISrzaBcnwr39cpcFXvyVvz87vkDjNUO/YT25zrlI
X-Received: from iota25.prod.google.com ([2002:a5d:8159:0:b0:945:a6dd:926f])
 (user=jdenose job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6602:2770:b0:948:3f60:a625
 with SMTP id ca18e2360f4ac-948c4551927mr87902539f.3.1762896853288; Tue, 11
 Nov 2025 13:34:13 -0800 (PST)
Date: Tue, 11 Nov 2025 21:34:05 +0000
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAM2rE2kC/22Nyw6CMBBFf4XM2jEdHkpd+R+GhbQDTIKUtAQ1p
 P9uJS5dnpPcczcI7IUDXLINPK8SxE0J8kMGZrhPPaPYxJCrvCJFJY5iMTxlMQNObpFO2COZVmu
 q7elcWUjL2XMnr716axIPEhbn3/vJSl/76xXqb28lVGiq2hrdUlloe+2d60c+GveAJsb4AUwjq Di3AAAA
X-Change-Id: 20251014-lid-switch-notifier-1cb9918d675d
X-Mailer: b4 0.14.2
Message-ID: <20251111-lid-switch-notifier-v2-0-789723d78d89@google.com>
Subject: [PATCH v2 0/2] Implement lid-notifier for lid switch events
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
Changes in v2:
- Remove notifier logic from input core and add lid-notifier module which exposes lid events
- Kconfig: Add CONFIG_INPUT_LID_NOTIFIER option to include lid-notifier
- Link to v1: https://lore.kernel.org/r/20251030-lid-switch-notifier-v1-0-c58dc9b1439d@google.com

---
Jonathan Denose (2):
      Input: Add lid switch notifier
      HID: multitouch: Toggle touch surface on Elan touchpad on lid event

 drivers/hid/hid-multitouch.c | 32 ++++++++++++++-
 drivers/input/Kconfig        | 11 +++++
 drivers/input/Makefile       |  1 +
 drivers/input/lid-notifier.c | 98 ++++++++++++++++++++++++++++++++++++++++++++
 include/linux/input.h        |  2 +
 5 files changed, 143 insertions(+), 1 deletion(-)
---
base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
change-id: 20251014-lid-switch-notifier-1cb9918d675d

Best regards,
-- 
Jonathan Denose <jdenose@google.com>


