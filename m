Return-Path: <linux-input+bounces-13573-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 98E11B0813A
	for <lists+linux-input@lfdr.de>; Thu, 17 Jul 2025 02:03:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 926F23B20A8
	for <lists+linux-input@lfdr.de>; Thu, 17 Jul 2025 00:02:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EF99F9CB;
	Thu, 17 Jul 2025 00:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=endrift.com header.i=@endrift.com header.b="KxxNp9/6"
X-Original-To: linux-input@vger.kernel.org
Received: from endrift.com (endrift.com [173.255.198.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95DD7BE5E
	for <linux-input@vger.kernel.org>; Thu, 17 Jul 2025 00:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=173.255.198.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752710572; cv=none; b=TlqqppiQ6QfYeFgVtx0jsPLlF5i+kt7x7whKKQHSLuYxnP9f/5xs+3kYhfCIlkN39OHjpjsszKCLvfj5Po/JUetNbUoE0a2EpqquorodCiAnj7wOJKda6BoMriE4AdncuivgDDE6BzW47e/qACta8GEqHHRqm1HyBZSEF4hKzXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752710572; c=relaxed/simple;
	bh=iiAtvaqZ/enuNhmMlxNPuZ3hXsvK2P3+jyO9Z6jRCZw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aU4Dxec4NO6HmHCVMJp9Ok7rTSrsHwAGHk/hMiF1/sM8nvy0Ex5Ni/HKeRgf+q46NUDCnD/z8SdYRQcMOzqRjP9KRr+kUyKnE5Y50ReT9AetylvOJvseHOEgAKtdIEk3J5yoAawoMsLLGOTdxMg7m3fP8W5liC/wc+vWPxcm1wY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=endrift.com; spf=pass smtp.mailfrom=endrift.com; dkim=pass (2048-bit key) header.d=endrift.com header.i=@endrift.com header.b=KxxNp9/6; arc=none smtp.client-ip=173.255.198.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=endrift.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=endrift.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=endrift.com; s=2020;
	t=1752710570; bh=iiAtvaqZ/enuNhmMlxNPuZ3hXsvK2P3+jyO9Z6jRCZw=;
	h=From:To:Cc:Subject:Date:From;
	b=KxxNp9/6Mipi5EeFumvCBrUpmEiL3UIGDLdBNG86cqXn+yYtPA8hNHsb1bn8hqqB5
	 UaO032lOq8UtG47s7eC4e4CZ8MSFiloSzkcH7CUvBRcnoVoMTb9aAUbV4eZV6ttWQ/
	 WMHnfVPOTombdAwiCuXEZLkIJj2kQ+NY0S9ybtlIVJce1YCoPTQmUEAP5MOgBmGr3t
	 vfh1Kfl/mZywX0Bml7czn1VI3Hw51RN6fYoDI2e/T9xW1CXtRrKMunBsfz45PJGFEr
	 8jdHnaNYA7E3d5B0zpWFkSF6vggjE2SIcv7z8etxs/pFcuPvU3cGOVmj5UywITt7oI
	 lim2G/v37axyw==
Received: from microtis.vulpes.eutheria.net (71-212-74-234.tukw.qwest.net [71.212.74.234])
	by endrift.com (Postfix) with ESMTPSA id 88F65A053;
	Wed, 16 Jul 2025 17:02:50 -0700 (PDT)
From: Vicki Pfau <vi@endrift.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	linux-input@vger.kernel.org
Cc: Vicki Pfau <vi@endrift.com>
Subject: [PATCH v2 0/3] Input: Add BTN_GRIP*
Date: Wed, 16 Jul 2025 17:01:37 -0700
Message-ID: <20250717000143.1902875-1-vi@endrift.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Many controllers these days have started including grip buttons. As there has
been no particular assigned BTN_* constants for these, they've been
hapharzardly assigned to BTN_TRIGGER_HAPPY*. Unfortunately, the assignemnt of
these has varied significantly between drivers.

This series adds, documents, and uses those buttons in the xpad and hid-steam
drivers. The only other driver I was able to find that supports grip buttons
was the BPF patch for the Xbox Elite 2 controller. Unfortunately, I'm not sure
how to clean that up and add support in HID descriptor parsing, so I'll have
to leave that to Benjamin.

Version 2 changes the hid-steam patch to use BTN_GRIPL/BTN_GRIPR for the Steam
Controller, not just the Steam Deck. All other patches are unchanged.

Vicki Pfau (3):
  Input: Add and document BTN_GRIP*
  Input - xpad: Use new BTN_GRIP* buttons
  HID: hid-steam: Use new BTN_GRIP* buttons

 Documentation/input/gamepad.rst        | 13 ++++++++++
 drivers/hid/hid-debug.c                |  2 ++
 drivers/hid/hid-steam.c                | 35 ++++++++++++-------------
 drivers/input/joystick/xpad.c          | 36 +++++++++++++-------------
 include/uapi/linux/input-event-codes.h |  5 ++++
 5 files changed, 54 insertions(+), 37 deletions(-)

-- 
2.49.0


