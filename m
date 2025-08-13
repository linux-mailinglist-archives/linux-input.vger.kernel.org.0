Return-Path: <linux-input+bounces-13979-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 844BAB2545F
	for <lists+linux-input@lfdr.de>; Wed, 13 Aug 2025 22:11:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 89E569A5D74
	for <lists+linux-input@lfdr.de>; Wed, 13 Aug 2025 20:10:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7E612FD7AC;
	Wed, 13 Aug 2025 20:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UA0ZlSoA"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDF4C2FD7BA
	for <linux-input@vger.kernel.org>; Wed, 13 Aug 2025 20:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755115810; cv=none; b=KZr91kAMeo74OVTejsx9UQ37Xnzuw7xogoaKcA6PvfmiWeBSr4/HWdkKfSzgdbrhvVknUVJtzfX+kfa4/0NmPbUSNG0ISLMOHKshbWCX4PttnMWdylo5pZg3PnC2sKzNuk1k8AK2QBSibqVzjSAfTJ9lAWDAnNQ+O/1+jYj0fvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755115810; c=relaxed/simple;
	bh=QgeeThYZXVZ7Vk5QEaDm9DHAXPDD2zFG2mqbjY/TGRU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=JpEaaNIbAVMMvCG1X9B+YQDc1QoOS0rgxWT/sJ1BSk1JawB4wMg/VPbnq+f/5gKWOszP+Ihrw0KXKdv0oUfBgLfqGMGU9cZLE+LvmZOxlm/Y+urc+1INXWmQQzoQwCag4lYqnOK5KHDs1uFxOvbd79c3vyTJVq3YL8dasVRUkj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UA0ZlSoA; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-afcb79fb221so3174566b.2
        for <linux-input@vger.kernel.org>; Wed, 13 Aug 2025 13:10:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755115807; x=1755720607; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=S1NHV43XXtddRU+Ekga5dRrnBWmF/7p9aMPlBdkJvnI=;
        b=UA0ZlSoAQcGUZYeBlGayNIwQugQKA+5et48ohclqSntzzx8hLYMYvtSiCAYHjWiGwE
         xKjhq5gJSK0uMpunNTJ9Uk4Rg2pDQh8RhkqcJVO+ne7Ovq9zic/WfjeSdnd2EhXNzKFK
         KCOfL+gFEM70OorqC/IwdPOa/TcC5KV67d02+ZCqIiwoqZNXn0973AQdcKyBy2OYMj65
         pShGQqZmtDkozVus75fRrrx5X195QXczXbo/enTrYmdCBEd9eTEqmydxVuebkxJGCaMY
         ZHssRd/Sx9BWepKz1Q/ixQ9xtuYYYfvIeGCwOg90EvIc+GmzBTiIB5i7RNxD0rf9T3Z9
         FOSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755115807; x=1755720607;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S1NHV43XXtddRU+Ekga5dRrnBWmF/7p9aMPlBdkJvnI=;
        b=rnLEMuP9O1s8loq38qMKX1jjmHcFM0hVDtwQKgGYPWxIiDImTRv6e3Q++VGMRB2a3e
         9mAmh0rv3bhZFysDJTRM5wpMc7YRUlPxOO02BAR8OWI5LTp9sub6bPxzs3iTWiBx6QDw
         XFvvQ7t/bMp59H02jN3DR6qqu7A9IAPC7EbPmKdJYp5dp8BIWzbJKWOGIFclyXnNBrFl
         e1U3FEHZEtoevPw/m0Yd0CfIoVwQHlQRXSVC6+oYl3zsgn2huGP2eSE0I1n3P3gpupuF
         S/LM9BZa3r9N+fbCROpu9aHJgFJQG/x1FwqMATP5ho3Z0xjHtw3T3MGAOcHTtWpgMZTi
         vILw==
X-Forwarded-Encrypted: i=1; AJvYcCUyE7NC0oyQ9tvYheLOV9nuwbDvYr6VBBEzWf1n/27i+LrkLewOm3BjG3JhcEq9G+zOgN1OzjI1M8T88A==@vger.kernel.org
X-Gm-Message-State: AOJu0YyTlCFj0kUuzDOufRikEeNNE2jdWq7W2pdvavRB7k1nLiOGRrLs
	WrQ45jeGrO0yp3VcMfO39MOvQEIkvsk9DMu3XwSdkFY5YdDKqaZ3X0crSxhD7A==
X-Gm-Gg: ASbGncuPMHSJ/pOdES6Lw+iYCAr1y2+MoEytORpBJr5xpnm7k09g2svt8Rx4MTzcKZW
	/22Fy/Vv9dfQ7raBMoObBhytWIZX+P1JDQtjC5AncMZAqxJtpmj2zurMzq0pAVUiijPIGDApO1N
	3rFnpLG4O1Dmx1QQheDN2OclRV3AHNFxjDBcqIWVks0PDVFbJ2CEhiwIMvfKcXhhof/EXBklFP/
	bQ+tXpBtii6xa1ArIwRblsZD76R4sMhp53h56M/IGoQFjYx4Esv9B0ez1U6bqkZzKrUfCKklgvf
	G6OCfk7HRjH42mIL542UXsZMaLCOljz+mJhYgDuR1AVJ3IFEqe/bc8ZrGI6Vr7JqwrzghFKqgbZ
	MK4KNFV/Me6fPnhgpvCNPgIEQoOhsbsbPWLE9jz6KrP8b/QJi/l/7eN9y6KLQ9mnhrFJ0y48nkA
	o=
X-Google-Smtp-Source: AGHT+IHuLnowhYvTdvV2h9OwIvUv+0/33hmo+O5l/Z3IosUHk6L3mqQM67sdHH/hex11vaGUBsCBNQ==
X-Received: by 2002:a17:907:7204:b0:af9:5903:3696 with SMTP id a640c23a62f3a-afcb97cb358mr21028066b.2.1755115807074;
        Wed, 13 Aug 2025 13:10:07 -0700 (PDT)
Received: from laptok.lan (87-205-5-123.static.ip.netia.com.pl. [87.205.5.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a21c0ccsm2454092266b.111.2025.08.13.13.10.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 13:10:06 -0700 (PDT)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: oleg@makarenk.ooo,
	linux-input@vger.kernel.org
Subject: [PATCH v2 00/17] Further hid-pidff improvements and fixes
Date: Wed, 13 Aug 2025 22:09:48 +0200
Message-ID: <20250813201005.17819-1-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Another batch of improvements/fixes/updates to the hid-pidff driver. A lot of
code quality improvements with probably more to come as we better understand the
driver and strive to simplify it's inner workings. I think we're currently past
75% of touchups + Oleg is working on some compatibility changes for Simagic
support in a "pass-through" mode.

Direction fix only for conditional effects fixes FFB in Forza games on Moza.

I removed Anssi's email from the "welcome message" that appears on succesful
PID init to make sure people will look for LKML to send in bug reports.

Changes in v2:
- Added changelogs to commits changing debug messages

Tomasz Pakuła (17):
  HID: pidff: Use direction fix only for conditional effects
  HID: pidff: Remove unhelpful pidff_set_actuators helper
  HID: pidff: Remove unneeded debug
  HID: pidff: Use ARRAY_SIZE macro instead of sizeof
  HID: pidff: Treat PID_REQUIRED_REPORTS as count, not max
  HID: pidff: Better quirk assigment when searching for fields
  HID: pidff: Simplify HID field/usage searching logic
  HID: pidff: Add support for AXES_ENABLE field
  HID: pidff: Update debug messages
  HID: pidff: Rework pidff_upload_effect
  HID: pidff: Separate check for infinite duration
  HID: pidff: PERMISSIVE_CONTROL quirk autodetection
  HID: pidff: Remove Anssi's email address from info msg
  HID: pidff: Define all cardinal directions
  HID: pidff: clang-format pass
  HID: universal-pidff: clang-format pass
  HID: pidff: Reduce PID_EFFECT_OPERATION spam

 drivers/hid/hid-universal-pidff.c |  57 +--
 drivers/hid/usbhid/hid-pidff.c    | 711 +++++++++++++++++-------------
 drivers/hid/usbhid/hid-pidff.h    |   2 +-
 3 files changed, 439 insertions(+), 331 deletions(-)

-- 
2.50.1


