Return-Path: <linux-input+bounces-9949-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 04FD2A30D98
	for <lists+linux-input@lfdr.de>; Tue, 11 Feb 2025 15:03:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0631D167064
	for <lists+linux-input@lfdr.de>; Tue, 11 Feb 2025 14:03:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B520424C676;
	Tue, 11 Feb 2025 14:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A8fxZlaP"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E258D1F891F;
	Tue, 11 Feb 2025 14:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739282582; cv=none; b=T/4RxXf5G6XzEx73UoleYxl0M49zX5NcwmsxamqUGb6fVdfldn/O18iFJBjLaOjBYx55Ht/bolWIbWFQsgIVv913Ztard6e6dcSVu9WZuuMOhWeK4KsIPOtJdgQ1MU0F3LyjdRlueEGXdYTQqiqmIwE7v75AanDm6VJMaNsN5+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739282582; c=relaxed/simple;
	bh=i37bDM/NP23sG4VVLtINRdWq9LHfOqmlTcCOF0TXxMk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=G9xIGN+iA8ORSzG5C7CN+t/Kfn5ub/kujeNiclvDHLsZy0D/ablnc/yOdPVxzvKGT3arCjiYwbMgxLvRUfLmUZdwKkWQF2HBIh/7zS949T3L2hYX234p/eEd4/WKzqEHCR33VUzD8kgYHVSGrvo3PscANw9/W4MY4+F0AEtMZxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A8fxZlaP; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5450e08f300so283300e87.0;
        Tue, 11 Feb 2025 06:03:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739282579; x=1739887379; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OVCrMiBqPPejeHJ4wtIOJH7A67ULW6+KotaTwKpouuM=;
        b=A8fxZlaP3sO0SoHskh/8JOmC4DP/PuFwu+pscweYbQl06sQE7VlhekW90vKTAIF+V/
         VvxZh/DPHyH45CfljAUucz+kzXIzH4fsYTEzLrAqNGOn+j5PM6UqDjVk1Pvn/z4LiZE2
         Qm6jnpSn3z+4F4Wr/XcCYaT5xikks3HwpMBagXwohdnnLyXmGlqn7KAOoRle0F7bA044
         6go581+hXVHBjQkzHyo/gdSFqMfTWIIRPNOu7dBxw6jM0/uOj9/lrjjJtwkENOZ7B6+T
         DE8z09tfBUNrhMBZcbaJVQLhMyW5HkIGk2jceU0HNqWjQhrQnf0dbsLTqcqkUfdrcIE7
         HubA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739282579; x=1739887379;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OVCrMiBqPPejeHJ4wtIOJH7A67ULW6+KotaTwKpouuM=;
        b=jpzyePUbeY4RN3ZP2GZczYRdZZll+0rHtG67dbMvONQvR6bg0S3GzLqSKqPlcQCH0I
         4aCx/W30SOciHsPF2Y7W3EQQFCe5mPBBjbgR+eZn8dta1c4B5vQyq4cwJADKox1ZvrzN
         ObxjVRmjv1a/G6DsUgb/2VbMK5ued1elt9od/hzT2iVgMjLsBLNHQaMgA42yYgVEd7SC
         CmnYLVo/p07C39nvXZG7kZ3TNAD2dW8kMnCVWNljtzOwrJBVdXlJ8oSKdY25WwuTmSd8
         wQ+8P9vwUy/+l0dss6joBhXe3DDDvfUS6VxThFx3S4d7Ie9A1Hz7RVxW16RXUUZK4Wjb
         BZ5A==
X-Forwarded-Encrypted: i=1; AJvYcCVqd2mGBiH5f9dxuRJOiPD9ES7KVp0OU/YPKEhRE5JeBojh/DG4GOdVznw87fNeWXsLxJPsZxD15MAM@vger.kernel.org, AJvYcCWxE4uurRqOfbdFhE2hREpNYMGBcvGSfhgSy29e5Oy6a+rhyJruhOO9b7KhvXBbD+9vewQgKxQ9OKUFpQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1qQYgVAmJ4Z4Cc6KeDQ892cVremI4jEJYpxK8huDi+JZuof+y
	yy6i1VqBsRP2MSyceXlQ+t2TI13DYBc23rmX12maJjldAqlTSUDh
X-Gm-Gg: ASbGncskP3t7TS472J3QCHhICzRUFD6osyRc4FuJ7XygfdlUt+vSA2gB/eLMumkss/U
	sJ48WKX6lL75uopa+N1/nNI4l7rrD9l4Rrl5LGuYVHj5n653iRVMeEuVOOlAnzIFxwIhO8c+Y5Q
	hPirr/SGOK5HSa6gEFYaCA5/5vHUaTTiWodf1EJusmeopqnW/M6cFMGFvmVDBGzaLtppboLfuYz
	73VnrVem7Xr8Qb+FI0wKsv40DqcQAbI+5vZobpm6uefj77w2z9r4OS7SSwDqfYuyV3J1n4KWfsw
	BBeGYz8hJjHEUC4jd8KsUSyHnwEouGcO+mcdPLCFfNlzVI/s50rIxuWCfRFEtg==
X-Google-Smtp-Source: AGHT+IFO2vvvp47S79o9qf9Kuf+uPfqbEfx8aevn/+wDSdL/Qf4ndxh/ExMGiCXFTMJvZ4NHyJ8RGg==
X-Received: by 2002:a05:6512:230a:b0:542:1b63:141a with SMTP id 2adb3069b0e04-54414aa2239mr2024517e87.6.1739282578539;
        Tue, 11 Feb 2025 06:02:58 -0800 (PST)
Received: from laptok.lan (89-64-31-140.dynamic.chello.pl. [89.64.31.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-545014af0d0sm1118721e87.184.2025.02.11.06.02.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 06:02:57 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: anssi.hannula@gmail.com,
	oleg@makarenk.ooo,
	linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v3 0/6] HID: pidff: Compatibility update and new devices
Date: Tue, 11 Feb 2025 15:02:46 +0100
Message-ID: <20250211140252.702104-1-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This is a small series based on top of hid.git#for-6.15/pidff.
Add Oleg Makarenko as hid-universal-pidff co-maintainer as he fixed
his email server and will be able to respond to LKML inquiries.

Small compatibility patch for situations, where POOL report haven't
been properly initiated and adding Asetek vendor and 4 of their
wheelbases.

Oleg requested me to change his name order to be in line with
western style.

Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>

---
Changes in v3:
- Change Oleg's name order on request

Changes in v2:
- Updated comments and code to conform with Linux style guide
- Define 0 duration as FF_INFINITE (PID_INFINITE analog)
- Support device error response from PID_BLOCK_LOAD
- Remove redundant call to pidff_find_special_keys

Tomasz Pakuła (6):
  MAINTAINERS: Update hid-universal-pidff entry
  HID: pidff: Make sure to fetch pool before checking SIMULTANEOUS_MAX
  HID: hid-universal-pidff: Add Asetek wheelbases support
  HID: pidff: Comment and code style update
  HID: pidff: Support device error response from PID_BLOCK_LOAD
  HID: pidff: Remove redundant call to pidff_find_special_keys

 MAINTAINERS                       |  3 +-
 drivers/hid/hid-ids.h             |  6 ++
 drivers/hid/hid-universal-pidff.c | 10 +++-
 drivers/hid/usbhid/hid-pidff.c    | 98 ++++++++++++++-----------------
 4 files changed, 60 insertions(+), 57 deletions(-)


base-commit: 5d98079b2d0186e1f586301a9c00144a669416a8
-- 
2.48.1


