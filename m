Return-Path: <linux-input+bounces-7285-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 814639995D3
	for <lists+linux-input@lfdr.de>; Fri, 11 Oct 2024 01:55:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2AC351F23759
	for <lists+linux-input@lfdr.de>; Thu, 10 Oct 2024 23:55:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 751211C1AD8;
	Thu, 10 Oct 2024 23:55:27 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DA891C9B93;
	Thu, 10 Oct 2024 23:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728604527; cv=none; b=jzgNEk2sHkke0wY589BJDgP38SRws1Ae3VnU5j/NncsBcZlPHF+EC3NWisimqIwT2+tAgWEoPKB/1+n49gqAN7VWB+UMbVbDZujXz12wjdhoBFHqmBPl5l+DMOBZiM3kn9kFWgzLBjBeJygf4nkX6abhxr/CVgn7H/Nsg9bcq58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728604527; c=relaxed/simple;
	bh=v+lNuRF2L41ArRRP7m2nyXqLXAxyeod16CAMjkS/guI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EJh6z9d/n5CBSyjtQsTX+emZJmC1CREnW6rvTms9Jk9mNguvCuoBRMs6AbMwpEPGbbOETjIP/v1FYJKpUQwjoVY/mLw+ynTg16e/3qAsWKfFMsIIxvm2al0xW7uaW1N7RnExZmbopk5ariclHuxvq9ufFcPBe16PMdUSsruHaoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=uejji.net; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=uejji.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-287ca01c15fso819818fac.0;
        Thu, 10 Oct 2024 16:55:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728604525; x=1729209325;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uffE7lhssR7TofnNDEI23gKMjzxpFClWEWuQEUFTdV8=;
        b=t6talnzLOSPU8tI03jRw9L8y2GJdQWjd628UETBEb/HNtBruLL7ry4Rhq87XUSWqmX
         JCb9B8KflnqBQZAgqL+8QH2AotakF2750sGDzDs7R94xw9p3u5HxDqMrH8ietn3kD0HS
         pAaTWmeUqNURK9TTLmgEch0mD8KmmbdA7ibSO+phtrVMfEpbWu5ce3svjAENhXCWBrA0
         mYzKrQg/7Hkxv02lEm0yqMIgtoN75NcugVnc3jUIG14+5nh5sVkopAi/fOwbJq+xHqUD
         YRSMeZEX9/C4DPJ5HjiozOeUr5IcdFeSEdC5SOhJ3jkg6b7eBwWQQE8LmLy5eRpAk+74
         vZjA==
X-Forwarded-Encrypted: i=1; AJvYcCWBpRbyjE9Tp8oWwQOqfmS6p7MUsqjCJAe7gL5QvkRScseRZS9j7CBC8DbulcxExdcheECTqzD9n3EzPes=@vger.kernel.org
X-Gm-Message-State: AOJu0YxVIkNu+NkMwApy07/+GAPVI1E6mUokwNkkfWeXIr16KaONJImZ
	0lfkN00Fs/f3AGvxjt0ijgRHjf4p+7/aF276wxUf0J+CL79fPhol
X-Google-Smtp-Source: AGHT+IEGR67M6+nmdkC4F2UMVfbnetdRHzFKx8CUijLoZKYJQbqFgxuWW+CRKKhvlRA8Bs15lGoKZw==
X-Received: by 2002:a05:6870:2b18:b0:288:2906:6882 with SMTP id 586e51a60fabf-2886e01ababmr575417fac.29.1728604524697;
        Thu, 10 Oct 2024 16:55:24 -0700 (PDT)
Received: from muster.uejji.net ([47.188.205.107])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-28857ff0620sm577541fac.25.2024.10.10.16.55.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2024 16:55:23 -0700 (PDT)
From: John Edwards <uejji@uejji.net>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Derek J . Clark" <derekjohn.clark@gmail.com>,
	John Edwards <uejji@uejji.net>
Subject: [PATCH v1 0/1] Input: xpad - add support for MSI Claw A1M
Date: Thu, 10 Oct 2024 23:54:24 +0000
Message-ID: <20241010235449.3292656-1-uejji@uejji.net>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello.

This is my very first time submitting a patch to the Linux kernel.  Please
forgive any mistakes I may have made in the process.

The MSI Claw A1M is a handheld gaming PC.  The built-in controls have a
number of modes that can be switched between.  One of these modes is an xinput
mode which expectedly emulates an Xbox controller.

When the appropriate device and vendor information is added to xpad.c, the
controls work as expected in xinput mode.  All functionality was tested as
working, including analog sticks, analog triggers, all buttons and rumble.

Thank you for your consideration and for taking the time to review my work.

John Edwards

---
 drivers/input/joystick/xpad.c | 2 ++
 1 file changed, 2 insertions(+)

-- 
2.43.0


