Return-Path: <linux-input+bounces-12558-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C1A47AC31EF
	for <lists+linux-input@lfdr.de>; Sun, 25 May 2025 03:36:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AD3543BA4AA
	for <lists+linux-input@lfdr.de>; Sun, 25 May 2025 01:35:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1542829A9;
	Sun, 25 May 2025 01:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gUVCukkH"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C7BFA29;
	Sun, 25 May 2025 01:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748136959; cv=none; b=bqAOID6FggRLoQy3lt8S3NiVO+Y/22E56MAsk+IhZ+JfgVy0QwNXWh8+aoo1+QMDUZlHqDkiUvkzTGjluL0PxxUmjDMV1tD2+8eXpVOCkOMYC3yDRNk78mWg5mvzT7iQV1YGal29tbbKAKF5ORwDUcwsnXGa2fCNuyGVyzglj9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748136959; c=relaxed/simple;
	bh=zbyLaa5CcyJotLNKfpFphcN7vmdqU8V+LDQtWmoml+w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PraE8yujMR8GyPn4HxI1/GgTY3cE4FUh5zbKvG0hpYNEmFeKycEJcC26AoPlrls4n286ZSjch0XZYpHQxhdNrWiWKe1irzLQcUywnNU2Auk0gbC0UllRZG4+6+/reffXeblDZuTEl1ZlMtd3MzXbROE7XTdzEUSNTVG5gHINOzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gUVCukkH; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-22c33677183so6479355ad.2;
        Sat, 24 May 2025 18:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748136957; x=1748741757; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JHcFUx2KptDGDf+v+qnJBWxtjQrbz7AXfJTKLalZ0Ro=;
        b=gUVCukkHiXPVvGSDfLmWhVAbrAiJzgJKvVtAZMioc3hah2USxGSdCwRfzovqqLdT83
         NT3Oc2BD+hRoxp5RtKF/JGETm/oXsa+Uk0343q4qgTPvsLKH5x1ofR5UpKavwWXvd2zt
         8KrJNNU7dSogN8bPJgmhxjRIKtDg4f70qN7ciJCLgoE6XI/Mz5wGKJ4DUzgN8pfIYiRs
         /CCW+MJ3WKugBpL68Gc+lkeaf94CTh1R29M3ZAeLhZ2l5suUoQYTb2XjeKuj8uApovBZ
         2fpK9Tu2r4q+Vd18XiuCAxomdy4JG/MXdXc41veIJRtimznhzyDS6S/7dqceYoeaTjva
         x5TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748136957; x=1748741757;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JHcFUx2KptDGDf+v+qnJBWxtjQrbz7AXfJTKLalZ0Ro=;
        b=kQuBb9NYndMIsxx10/Ilo0d2T/qhTf8fXX83FFrlUSClpplRGHIEaJvo7ZXnpvdhUl
         VH3k9QRzAP8NpvIqH5vULMgwhepQJyWR0A6GfT+x767obp8uWcLV6zp1kBUJuZCDlEyc
         WMIGM9XjtOfVIIyHAMSSoVty/jIpKOkJ3xG+tsFgUn2VQLOJcb3bpvJRGoFB29MmeyHv
         XCV5rg+tB1AC0GQtt8V30OUeIDYoPXN5Sb18VO4se487xfMpPqC35OcjG2WI9pquKQgX
         GV0RJBKpGW91woqSdKStNjC/Kv18kce0YRL1S71XJ3f0RmjN6UmE2ZPxjJatbgkcKpzE
         v9dA==
X-Forwarded-Encrypted: i=1; AJvYcCXJb6/zW3YuCMg28E/l5tW1lldAJH9tzzLsvVGxa5HJzukTDpIgNqfpFAw64o02Cp480cLOtDVjSNWI4Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyHreQQ7PEQcYvrqqgzxinqVsCcxtGbX+680oFbaCgwN5Q89976
	vgoI5cqV/VNaeyY6SZFzhnqFDSfefQj25KI7d5MC6DkOj8I4kk29soS2
X-Gm-Gg: ASbGncsBubVUoua+TZ4MBY5BTmmdL9Bc1QTaSGNi5jYw7t9YxcH2K9XqZC4ybD4IC7E
	q008Hsaa+nE8pzfKg0pRz5gYMaG21IDe9X5ceTH3eQqpMsqX4KZZen8erCZSeNn5DXXrfI7AhkK
	orHBZVjSXy3z900Q5EVPtJs2Un/mvVv02grC3DFTTMK13jtV91pRvLkDCvLmP9/na0Lr19J+tQK
	SrvCHgBPVQFrVo5P5caJN5ZuK0ZiykX+ClwC1Hs9K9rHIMdfFIowJcGtwVA8q4VSSKDSYFd8/De
	QBUFWpJGXMvH0e7IAjOjXXdUHYXeCdA4OZgR3OsSi5icRyzo918k
X-Google-Smtp-Source: AGHT+IEJWuOBngN9++zXJ+pb3meJ/mRb/Yz78nOz52ag1+86FmkZxGINCRfzR/o1hyN/UHd0y/Azbw==
X-Received: by 2002:a17:903:1a67:b0:234:926:b4b6 with SMTP id d9443c01a7336-23414f3a89amr63922815ad.3.1748136956504;
        Sat, 24 May 2025 18:35:56 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:5778:6aed:151a:2d4a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2344990db31sm318955ad.55.2025.05.24.18.35.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 May 2025 18:35:55 -0700 (PDT)
Date: Sat, 24 May 2025 18:35:53 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Subject: [git pull] Input updates for v6.15-rc7
Message-ID: <7ev4nuc6gsaaybykmdtf4xufcxl46jjzj6qfgtgx5vjm3eowm7@w7wtvau36a3u>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,

Please pull from:

	git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git tags/input-for-v6.15-rc7

to receive updates for the input subsystem. You will get:

- even more Xbox controllers added to xpad driver: Turtle Beach Recon
  Wired Controller, Turtle Beach Stealth Ultra, and PowerA Wired
  Controller

- a fix to Synaptics RMI driver to not crash if controller reports
  unsupported version of F34 (firmware flash) function.

Changelog:
---------

Dmitry Torokhov (1):
      Input: synaptics-rmi - fix crash with unsupported versions of F34

Vicki Pfau (1):
      Input: xpad - add more controllers

Diffstat:
--------

 drivers/input/joystick/xpad.c |   3 +
 drivers/input/rmi4/rmi_f34.c  | 135 ++++++++++++++++++++++++------------------
 2 files changed, 79 insertions(+), 59 deletions(-)

Thanks.


-- 
Dmitry

