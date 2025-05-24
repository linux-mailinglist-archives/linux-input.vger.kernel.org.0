Return-Path: <linux-input+bounces-12546-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E7C3BAC30BF
	for <lists+linux-input@lfdr.de>; Sat, 24 May 2025 19:47:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6EE81189C21C
	for <lists+linux-input@lfdr.de>; Sat, 24 May 2025 17:47:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DCF11EA7D6;
	Sat, 24 May 2025 17:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QvmwjBpm"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EBD339FCE;
	Sat, 24 May 2025 17:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748108851; cv=none; b=hJPJi6OA4KtXdBwZXz8ycwD07t5xpKrOH8xnxo99om/2czN+hEETTzDgeFyzu5fogw2M9aZeOw63IjxxQBb4ZB2l9EAQjKoO2CKr9XoXcLZj7SLzHPsDJFfiKkzx6dIWoxW+RlpSZlwExi3et4TDrRZ2fmHtAk+2dodzAQbnYXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748108851; c=relaxed/simple;
	bh=x0E5DGVqKfB/iUeEjAOTTNa/XKeXqIHt3lekE3SnCkM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=UcQl6eNuM/EiOaGOlSfw7vnLECM1xDGuUQVDwt9aowU1lLUmzdYc9Z8blhW3pxIdHskjzQekRcZbh22v0xEHGwFWHJiX2F5PgoDwqwM0eq5Z2qe+/tmVnhpQUu6ru8iMoo2hwebHX/aW7rIkSuEfKJqSlHvkHvr3U/TOkChKGbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QvmwjBpm; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ad55ded6e84so27213866b.1;
        Sat, 24 May 2025 10:47:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748108847; x=1748713647; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Y7QmkZ9aBcAFeSJwrRw8XCG5zHKA5obBkWf3PVnTwhE=;
        b=QvmwjBpmXO9PM771unlHZKGoIo7GBiU2k9dcq7OlYub+O/pPfvLkaC6EsRN64s07p6
         czxPqGjEIAtPHFHnxSI3VwLYflAqLZ/FJpr7XDDM8vSl8AFVsyWYPjGpmEOq79ZS+lke
         J4JlWmRp0tYOKgLduGkkjMaNQDM6b/SPrKkuo1WsDvAyO2pC3KDLltGnVB6r3Gz4F8qL
         MkC+SYg2N43igAmJoGSPB24re9wWc1B2kfWjLbZNVnakNxRcCXQsPOsFkh9xRTR7n0Cx
         HTI/QwLyRSrhjJYskif2pyXsI8vgaTuZNwkIz+RuQVmHAB8FpgX2gUZDAo+Esph7f6F/
         novQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748108847; x=1748713647;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y7QmkZ9aBcAFeSJwrRw8XCG5zHKA5obBkWf3PVnTwhE=;
        b=hGtwMps2oniL1o20MQjQKXMRxhKc8GZQ2EWnwRXN8imfVIAzYHtfkwPGfTFpnBriZ9
         kWJKI3zdoMVfnvNVjhzts7nr2VmjpviGQYFleUyRTywocrjaJ3oA+jjOtn3/ePmUZm/D
         7PlPzRRKgVdHrwM+Dj1IKmam3RQyOvPc8DeDrz/BSDbQ6vUjX1djPhk+NSpU39qmeydz
         32d9nROWqc19iJfpkIVZAqn+/WMycjsCZd/O/ap0TWSrrbIog7SKD2Lrz7Pk2tRxxdvm
         S+m5mMShf0xmYoOWR4MATutsd6nJOtgCRcPn+lpJRrjImmP494lhBW58en9iV6/Cy8o1
         Pkcg==
X-Forwarded-Encrypted: i=1; AJvYcCXMc3/WLk3jGyeFHIawqSswszn9sUMZHcII3BeOz6A3dV0dvnuUiCOPvmZ9g9zf07598Z5YBsINgIJRBQ==@vger.kernel.org, AJvYcCXzRAPWe8ynO9hQswZmK5YILMW3Vs8rtKMUp6drHQyySYl0rSU8V+9NIi70mTdEukDakQkyjdfJ2nJ/@vger.kernel.org
X-Gm-Message-State: AOJu0YxgBfQm1z1Lez24DE2DzIwL0Iub/6yb+lBO1fiKNA5Xo2Ix9vKw
	pf/M4tPSchZK8q8QlpQfz8mqsCv3f0fF1E+bUzUTw7KvUWbXOuFwjxgSOu2PPw==
X-Gm-Gg: ASbGncsWbvcqzdPD16JEx5mhAq1UzzX8RpAer00w7S0Luw9MDAlVVTME6yHVmFZvQdt
	xRUj7l9kOEt+Suw5yGotatgZbbdvntASiR/QnfJ58L3qKDZUjZlh5BzUE6NNejfB1GPx9rTyKUg
	FyZBd6nYMIy3ve2o023lx9nDpVUVy0vIs0SEMbXu+C6oJk1To0uBhISroENLp6+YO8eiZfB1+CJ
	LScAwU2uVcaqf4iFOYdpEm6Y/A0oWhOOcJL69vwXCvVKLn91s+Ya1bBwO863P9pIU+QBWgW7C+z
	6ZWhm6o7hXn8+bUPhbrnGXN6ej/01VwyacjkpUKWBE7HUEClMnm1GTS5uGND2TobHA==
X-Google-Smtp-Source: AGHT+IHOWRJjsyG55FodwdKNEDx2upS1Wmjd/7yN9l51vKZtapsgiybn/PPJhw2Ow+8lc9cqsmS5xg==
X-Received: by 2002:a05:6402:4407:b0:5ee:497:5221 with SMTP id 4fb4d7f45d1cf-602daebc31fmr952251a12.11.1748108847259;
        Sat, 24 May 2025 10:47:27 -0700 (PDT)
Received: from laptok.lan ([89.64.31.142])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-602f11a0e0fsm1138789a12.13.2025.05.24.10.47.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 May 2025 10:47:26 -0700 (PDT)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: oleg@makarenk.ooo,
	linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v2 00/11] HID: pidff: checkpatch fixes
Date: Sat, 24 May 2025 19:47:13 +0200
Message-ID: <20250524174724.1379440-1-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fixes warning and errors from checkpatch script.
Also fixes the define name for LITE_STAR_GT987

Would be great if this could still somehow make it into 6.15

Changes in v2:
- Split fixes into multiple, smaller commits

Tomasz Pakuła (11):
  HID: universal-pidff: Fix missing blank lines
  HID: hid-ids.h: Fix LITE_STAR_GT987 device id define
  HID: hid-pidff.h: Fix comment styling
  HID: pidff: Fix missing blank lines after declarations
  HID: pidff: Remove unneeded debug from pidff_clamp()
  HID: pidff: Rework pidff_set_time() to fix warnings
  HID: pidff: Use __func__ in debugs
  HID: pidff: Remove unneeded else in pidff_find_special_field()
  HID: pidff: Move trailing statements in pidff_rescale_signed()
  HID: pidff: Add missing spaces
  HID: pidff: Move else if statements to follow closing braces

 drivers/hid/hid-ids.h             |  2 +-
 drivers/hid/hid-universal-pidff.c |  5 ++--
 drivers/hid/usbhid/hid-pidff.c    | 46 +++++++++++++++----------------
 drivers/hid/usbhid/hid-pidff.h    |  3 +-
 4 files changed, 28 insertions(+), 28 deletions(-)

-- 
2.49.0


