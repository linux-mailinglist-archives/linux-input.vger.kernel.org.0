Return-Path: <linux-input+bounces-11049-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A1F96A6B374
	for <lists+linux-input@lfdr.de>; Fri, 21 Mar 2025 04:51:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F38C17A25A1
	for <lists+linux-input@lfdr.de>; Fri, 21 Mar 2025 03:50:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FCF11C174A;
	Fri, 21 Mar 2025 03:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b="ylkhwt1O";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="JP1IQ9mp"
X-Original-To: linux-input@vger.kernel.org
Received: from fhigh-b8-smtp.messagingengine.com (fhigh-b8-smtp.messagingengine.com [202.12.124.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B76A73C00;
	Fri, 21 Mar 2025 03:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742529083; cv=none; b=KBQsonuB9a6qrFduSbwx5nAtZpOL0VoMF1mcb1f6rieB67YiBQ2BZRGLkAJgpFHb52ny8jzHHnGcrLF2dpgIKuc9BbLAuBzNeDZDzsK0gmGwlhlqCrBMGG4YNEHSOFx9dpkLAME77hGTBHWSojLMKX8jQl7jTCg2ot4ZaIVA/W8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742529083; c=relaxed/simple;
	bh=XPiO6G0833F7GRqDxmii6ZQ7poKytumJqsYIUggnEi8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OWMlj9uBejBlOZdQ65RemirqAUQOE1xdnG2pMaUi7Y6b31DvEV8/yqgFMjS3yG6PjB6cACXLIlE4uYgllxrzVFGt8lg3bYE2gNIJFw0oSA2QggmhkLC403NUXrNDHkMybwaP4GVOLGn9kcnFAnEHaUXLclaN3CdixMtO61aYS8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev; spf=none smtp.mailfrom=ljones.dev; dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b=ylkhwt1O; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=JP1IQ9mp; arc=none smtp.client-ip=202.12.124.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ljones.dev
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 7EB552540230;
	Thu, 20 Mar 2025 23:51:20 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-10.internal (MEProxy); Thu, 20 Mar 2025 23:51:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ljones.dev; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm3; t=1742529080; x=1742615480; bh=mW85KCD2LN3bpwEaQVUfe
	BloFko83f5uPiv7NnQDJks=; b=ylkhwt1OdB49FL/pk/Se6gczhYjYr7E5Yfgn4
	zZe7hNNZsEJwK657CGtc7a2/P4hzrodwZZtQuT/4EqjczTBVH1Hb5gnM8EZmNm/x
	RUoBiTVVzmaYShYQVJFrqS8w8i8JRGVcC0TqKNoEbqU0tfPLD0QkT8FaVcw676Wr
	p12UEULZ8uR5HalFQVsFgou09HdvJ9X0aYkXirrA/XqDa4hZEbbeYtVeJKlvjNle
	Rma5yHmhV1pIYi/VBA+lpoO1wTbYD2tq7JrQ5qd5Rkw041BLNEaGkK5XScg11Rni
	owMdtFyhU8q0jOIt6KpCZC8yFFtyduPb6xoKBjW8bNFlpBlBw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1742529080; x=1742615480; bh=mW85KCD2LN3bpwEaQVUfeBloFko83f5uPiv
	7NnQDJks=; b=JP1IQ9mpGHAeizF+CP48p6q6OQ0UC2gFdeuRe9SCp7ZgOzHFYdb
	VShgEmPjHP4exwzX3ZRKmTAGK6BNw0TQmNFbY24mtj+kk2md42ik0Tou+3HW60dd
	yWoVcl2ps9ArLqOZDu3NWfRd2cCi0SEf/hTb2PGKFlITA1kY5YhP2Lt0HK+baHDT
	m48SG7mq7ZIQs5IsoPwJTpAkmv898zLIMWvUQKu6mQLqVdYgoXfYFikpKXAw0+Wh
	Zt/N9MjqB7smmqd9zElxZFxGqyIMaJO7ptQT+/kPTenbuLV4b7Oz4bf5Druo6TY4
	WMAJd5bG39aTMPsTDIYy+e65oUFzEXprN1g==
X-ME-Sender: <xms:N-LcZ-W8cELH-1qoLbmSUA2d-Tp8ZecskNwQSH0Ruwx_AQL4y6V81Q>
    <xme:N-LcZ6lHyJRopdW4vcHVp2yPtUeWgQUGps8kde_kfgoC6rnhRX10JhxSbtI08mhs4
    6RbolR0ddvYe0N8CAs>
X-ME-Received: <xmr:N-LcZyax1N4E_23_EpzHTtFfZSrzbjZ_gSSvo3Aov0Cb2XMls0PvHDkp4Bx8QKSDsE2JRd7AHUu84iTsCw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduhedttdeiucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucenucfjughrpefhvf
    evufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefnuhhkvgculfhonhgvshcuoehl
    uhhkvgeslhhjohhnvghsrdguvghvqeenucggtffrrghtthgvrhhnpedtkedtiedtteeuhe
    euteetffffgefgfefhiedtvdegieefjeehleehffejgffgheenucevlhhushhtvghrufhi
    iigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehluhhkvgeslhhjohhnvghsrdguvg
    hvpdhnsggprhgtphhtthhopedutddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohep
    lhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoh
    ephhguvghgohgvuggvsehrvgguhhgrthdrtghomhdprhgtphhtthhopehilhhpohdrjhgr
    rhhvihhnvghnsehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepphhlrghtfh
    horhhmqdgurhhivhgvrhdqgiekieesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphht
    thhopehlihhnuhigqdhinhhpuhhtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpth
    htohepsggvnhhtihhssheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepjhhikhhoshes
    khgvrhhnvghlrdhorhhgpdhrtghpthhtohepmhgrrhhiohdrlhhimhhonhgtihgvlhhloh
    esrghmugdrtghomhdprhgtphhtthhopehlkhhmlhesrghnthhhvggrshdruggvvh
X-ME-Proxy: <xmx:N-LcZ1X9on_t5VnwC9VcPdXMl19F1p_2r6XILCxaSlMiXv2ZbfW1tw>
    <xmx:N-LcZ4n_n0RqkSe-LR-luUWdPd0B9FMGpq97VMNeavATEkiLvfHhoA>
    <xmx:N-LcZ6d_59gtv_dexH8F5ntTtd1gxhx_WWIjQGmhjxo5JB6dOsk8IA>
    <xmx:N-LcZ6H10kkII-lsPy8_de4FFHYlIz8tke0gXIPk8sT8_XfqIqwPAA>
    <xmx:OOLcZ1gd9nUYS2WUgSjSeucYLBnmRl9Ox_U0_8mcjjG2eQUTzcsFkXUE>
Feedback-ID: i5ec1447f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 20 Mar 2025 23:51:14 -0400 (EDT)
From: Luke Jones <luke@ljones.dev>
To: linux-kernel@vger.kernel.org
Cc: hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	platform-driver-x86@vger.kernel.org,
	linux-input@vger.kernel.org,
	bentiss@kernel.org,
	jikos@kernel.org,
	mario.limonciello@amd.com,
	lkml@antheas.dev,
	Luke Jones <luke@ljones.dev>
Subject: [PATCH v3 0/2] hid-asus: asus-wmi: refactor Ally suspend/resume
Date: Fri, 21 Mar 2025 16:51:04 +1300
Message-ID: <20250321035106.26752-1-luke@ljones.dev>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This short series refactors the Ally suspend/resume functionality in the
asus-wmi driver along with adding support for ROG Ally MCU version checking.

The version checking is then used to toggle the use of older CSEE call hacks
that were initially used to combat Ally suspend/wake issues arising from the MCU
not clearing a particular flag on resume. ASUS have since corrected this
especially for Linux in newer firmware versions.

- hid-asus requests the MCU version and displays a warning if the version is
  older than the one that fixes the issue.
- hid-asus awill also toggle the CSEE hack off, and mcu_powersave to on if the
version is high enough.

- Changelog:
  + V2:
    - Adjust warning message to explicitly mention suspend issues
    - Use switch/case block to set min_version
      - Set min_version to 0 by default and toggle hacks off
  + V3:
    - Fix errors picked up by test bot: incorrect return in the else block
      of `#if IS_REACHABLE(CONFIG_ASUS_WMI)`:
      - set_ally_mcu_hack()
      - set_ally_mcu_powersave()

Luke D. Jones (2):
  hid-asus: check ROG Ally MCU version and warn
  platform/x86: asus-wmi: Refactor Ally suspend/resume

 drivers/hid/hid-asus.c                     | 111 +++++++++++++++++-
 drivers/platform/x86/asus-wmi.c            | 130 ++++++++++++++-------
 include/linux/platform_data/x86/asus-wmi.h |  13 +++
 3 files changed, 213 insertions(+), 41 deletions(-)

-- 
2.49.0


