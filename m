Return-Path: <linux-input+bounces-13770-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EEF1B194B7
	for <lists+linux-input@lfdr.de>; Sun,  3 Aug 2025 20:14:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2D1DC3B5801
	for <lists+linux-input@lfdr.de>; Sun,  3 Aug 2025 18:14:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7AA21DF72C;
	Sun,  3 Aug 2025 18:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TYm4IafS"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5A2519D8A3
	for <linux-input@vger.kernel.org>; Sun,  3 Aug 2025 18:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754244840; cv=none; b=GtOsQmg/fDXW4MMLt3vqbFxjTn2DCNnXSFCbyWIveWe7qejJDtLRJNSiKze3fgHlDYAj+R6SrHtkfrnhRikMn1cIXDwNpKsPijlafSG1yDI4BK4sZqZ+lUVZzhiPrOt3kONIWbGU6ba256g+uvE+kCx1WWKyr1RxE/mDODHqUK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754244840; c=relaxed/simple;
	bh=S9nqapKEb01tvGddhOh2batSc2hAenpmMBoDiGsZnbE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=kbx5aytfIqHvZrFNHxMSxKloa4TINoizwbl1dJOweC32f+M4Qhyf9yLLnogcYSVMihDUo8J7uu887DYwsi8wdj8DG7k9E1XL3WyK022ZLpTIuPdLTlPoQlFfeR939ykY5PgxSE0+jnQT+BBWAZLISImst4CuNCbtCDzhkQaLK/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TYm4IafS; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6155527ab87so535361a12.1
        for <linux-input@vger.kernel.org>; Sun, 03 Aug 2025 11:13:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754244837; x=1754849637; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RipzPtmmlLLMnb92JmHaTNr1wJqUK0wFfhtRRvlUP5M=;
        b=TYm4IafSYLjoKhJDxHZk6R4U37ssFiWS0efLYI+aMrr7b7YBkaJn4gLDjt36qTDQkY
         H2VkQAilpyT1fJQkRZozSdoT/C7283+BmOT8YONuva5deeY/f2Iai4LbYGUeGnlAJlRr
         YUICtC/OKjQuK3e0cz7yZwKfUYlskWIxH3AsLZoTl5tne0zvcGFzWiP5/wD8ILwQsGed
         HlUIzqOMZQcUjSU3ekjhmg6pSO7JkUEtFHiCdo272yAAzhzAm33k25mFoBJ4HUuJm4MM
         AIsXuRDvp1YG/m8YZtAOIfw4p2JB9+DNrzFZKhCql74081H9Hqwb+U+mVPjBksy5j8WH
         LpQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754244837; x=1754849637;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RipzPtmmlLLMnb92JmHaTNr1wJqUK0wFfhtRRvlUP5M=;
        b=GAltx31aaXLOm36eOksTT7s+JMay7AocKTcjFZr6OVwp7BQHC6bXdCqz3heiVxR1cQ
         ECExzcrcb+R31jVFeVYzSptpmmd6wSBAkBv3MQsb/j+6Qu9sgx46upJXDTbMsuTayuFt
         pMTsZpLd6HFP5xYVskJpgzQ/DAVXYLqHYmwxzTF4oW+hyoGzGst/+YWVbFHTXstUp5jD
         gei0e1cAEUvSo74SClOffqboQq+teeTEvS72bAYEKuRTuTHEkNiKO6wiiF/2SoEVGOe4
         4J5qYCCCJVyObkj6ZboHEWprL3ZkpEuzTXwybkhAcz0uSgvGDc23xt7AZP0TanyMudma
         kq0w==
X-Forwarded-Encrypted: i=1; AJvYcCWcNn1DX3aE8+wLA/a32b4wM8Lh6a42IBsi9o3lCkUpKvwhyMJR+3FtYtZHt+euCMKLA2MDj4vPMB3hPQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzevZNoKEciNYifEx/xNZrahal1iChsXG2yWSlp7S6rU09VrGHR
	1T7NidOlQMnQvOD+SWwZBqyGElYDEZ3qEcr1YPCADbdyXuQS03IRI/mx4j4oEw==
X-Gm-Gg: ASbGnctttUatE328wcMRHR/RSv1PkFR/FI7jUY+55c86faFGJbQ16DhVv1dTTNNzW5X
	oS2eh0NifNIn3vMIpS0QGOupbuEFZGx654QgbitFzT0nWJ5oDu0CkDNw6p/y68EHBMOXpyzbxWd
	crHDrXxp7JjVde7EPgH6LlXSkLP1ns7QT8FHQbcA/hW65G7Ud5Qx/w/++PretZgg71EtAmMnSM1
	afdKbOdQPXBp+dASZBgLC7XlNX1SwJ7Rmd4xMGFPP91MV5wajaFpO5iYYKauXrF1S5ZbzGSenZQ
	TA6/3CNLVUUHq0oa+ErHYgHrc2uIWG6HJyJQylCrzSlsZvepJbKWpEU2k00e7Q68i+ExPE0OPMQ
	DkM+8F3pmy9vtbJPT9id+3gFIpDODwbQEMyQY3J+eeyE0qeYwI6HubamyhqpwG3XKny3tc4cmka
	1ajD+gSZrntw==
X-Google-Smtp-Source: AGHT+IFiVQ27wSLYwhwskzMRjLLXMa4SsgIlxUrzBp1JbKk1hrgxpMF6Bp04KpgUxWyeQSlsQKdt+A==
X-Received: by 2002:a17:907:3f2a:b0:ae3:bd92:e6aa with SMTP id a640c23a62f3a-af9400097ebmr281386666b.6.1754244836971;
        Sun, 03 Aug 2025 11:13:56 -0700 (PDT)
Received: from laptok.lan (87-205-5-123.static.ip.netia.com.pl. [87.205.5.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a750253sm614570366b.86.2025.08.03.11.13.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Aug 2025 11:13:56 -0700 (PDT)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: oleg@makarenk.ooo,
	linux-input@vger.kernel.org
Subject: [PATCH 00/17] Further hid-pidff improvements and fixes
Date: Sun,  3 Aug 2025 20:13:37 +0200
Message-ID: <20250803181354.60034-1-tomasz.pakula.oficjalny@gmail.com>
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


