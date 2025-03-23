Return-Path: <linux-input+bounces-11114-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AC45EA6CDB8
	for <lists+linux-input@lfdr.de>; Sun, 23 Mar 2025 03:35:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0030B1894F12
	for <lists+linux-input@lfdr.de>; Sun, 23 Mar 2025 02:34:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73BE31F9F73;
	Sun, 23 Mar 2025 02:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b="gP7dpyR/";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="XDON8f9I"
X-Original-To: linux-input@vger.kernel.org
Received: from fout-b4-smtp.messagingengine.com (fout-b4-smtp.messagingengine.com [202.12.124.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 066F4FC08;
	Sun, 23 Mar 2025 02:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742697274; cv=none; b=qVcld8CbsZGoC9jL1I94A1VetrQMyC8VOQargoW5A9zbFChOX5WzOSSqtfiHQVwVNEqorRFmVIcCWC9oWO4nwiseh3f4mJkVwAzqwD+PkGRNDujTqFF1QBVhjsgcsn2cUF9DUKtgi0xy/IKwJ3uqqxi3E2iZR5DYLl2CnI0M6B4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742697274; c=relaxed/simple;
	bh=tqNUBKfJs6VrEwaQwi1yE2Cu7ZKjHLdCh7GouijZFHw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=vBDXK4VGBEmSxpichy37Cy6VX9BDtNacQN058+d95HQrrJclI9+xqWKzBWPTxpU5dZYJuNyJjyhbdWPV3ZDpDbP3nojsOiO2N+fLw4VsSpJ/oFz8KPNBO+17nI9HGhNe+yuMhmeCZVBFTVDMgebNClCHinSsyclVeXGBSNzXhOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev; spf=none smtp.mailfrom=ljones.dev; dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b=gP7dpyR/; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=XDON8f9I; arc=none smtp.client-ip=202.12.124.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ljones.dev
Received: from phl-compute-07.internal (phl-compute-07.phl.internal [10.202.2.47])
	by mailfout.stl.internal (Postfix) with ESMTP id ACB4A11400AD;
	Sat, 22 Mar 2025 22:34:30 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-07.internal (MEProxy); Sat, 22 Mar 2025 22:34:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ljones.dev; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm3; t=1742697270; x=1742783670; bh=1eF9uC0DFW6sxuK63cmCj
	1nHFDHjzBIOVvMZQecvkPI=; b=gP7dpyR/Q5HljTVuuJP5rdoraRb36hjW8mMsv
	6flEevdHJRyZXYBbt9Q3btis5++3Zbf91cGcykwgM9UD6Pyr3ADlgEoGLv4d+40i
	rR4HCsKYY4hzf985j+9Ms/7iwACFh2sI0IlvX/n2ea9yhrfNLsU1RHd6wl0L5YE3
	ntLajZlSqBYxR1KIW6miM4SEHFdrVQxPISMgo8CMx38XVEJRnFKPz2Ixd1jz9XZd
	593Mx89M85w5aF4+EFAzHKM6kAzVcvvD6eOnB+jvvE7R4roi18CEYKA99UtF6Mg7
	NT3Jn4bg9rcBDBJtTAbBOXZ61f9E93rsAWWrormRUTJZso/4A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1742697270; x=1742783670; bh=1eF9uC0DFW6sxuK63cmCj1nHFDHjzBIOVvM
	ZQecvkPI=; b=XDON8f9ICbRoGB576/pwY0kClguJ6Z04CtkBpLvWrNHZ0skRpfL
	FwYneLNHubwMyaW/yb06PpUT/l1Wq3fUS+B9GyAZxW0YLfa5JBH3U/R5b48wiaSh
	Jtaq1NBY2fbPPJmAVrUOrkTaUhNR39XFGVJSjwkJi1gOH4S827rU4ZeaDQsXYht6
	R93xkClUFn/rB+hIZkTGU2vM8EixOsfblZ6aUr++GPQQ5O+kK07IqNSRKB415mHl
	tQBPBCVjGdrj+/Ghk+McxOSHu8OBhrCIb7vOhRiyEqQkDzYxxZCIedVrXf9o7z5z
	M85YyNH0Frsb68uSrcATLA3ZEKM85oyj8Og==
X-ME-Sender: <xms:NnPfZ9Wft_PeZMCuysXj-A4lLPKQnRS2XeGtBNZGEQxpROPJ4p-7JQ>
    <xme:NnPfZ9mHGhWM8bpDrFUgkqv4UZPJliK9vAoHK-Kf6omf1fqZkVNOIfhaC9oQ1H8NT
    IQ1dgmU6uNv0GfOSGE>
X-ME-Received: <xmr:NnPfZ5YlxTN3EiFDv2BbD6iBvh3AlMPNBTBkgv-TcO7xMi6RJAyLMRUJM-Q2_0yHrCI8n2i6z7jfqF50pw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduheehieejucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucenucfjughrpefhvf
    evufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefnuhhkvgculfhonhgvshcuoehl
    uhhkvgeslhhjohhnvghsrdguvghvqeenucggtffrrghtthgvrhhnpedtheeuleekgeehud
    dufeduvdevffelgeffjeekieffuefghedvkeetgfffgfeifeenucffohhmrghinhepkhgv
    rhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomheplhhukhgvsehljhhonhgvshdruggvvhdpnhgspghrtghpthhtohepuddtpdhm
    ohguvgepshhmthhpohhuthdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvg
    hrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehhuggvghhovgguvgesrhgvughhrght
    rdgtohhmpdhrtghpthhtohepihhlphhordhjrghrvhhinhgvnheslhhinhhugidrihhnth
    gvlhdrtghomhdprhgtphhtthhopehplhgrthhfohhrmhdqughrihhvvghrqdigkeeisehv
    ghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqihhnphhuthesvh
    hgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopegsvghnthhishhssehkvghrnhgv
    lhdrohhrghdprhgtphhtthhopehjihhkohhssehkvghrnhgvlhdrohhrghdprhgtphhtth
    hopehmrghrihhordhlihhmohhntghivghllhhosegrmhgurdgtohhmpdhrtghpthhtohep
    lhhkmhhlsegrnhhthhgvrghsrdguvghv
X-ME-Proxy: <xmx:NnPfZwUx4SmoiymXxADCbo4JJunCYHWm0c7BDIClY-VPq1ONvAr5xA>
    <xmx:NnPfZ3khzOm_TVnAfBSYcQWWl1wFti-jv60ivsIMxKwiH8K2jeoVKA>
    <xmx:NnPfZ9eSbzyoiiRw1V91O1zPwA10b_LJrYflv0sIySB93ZNWOK6wFw>
    <xmx:NnPfZxFBQDwM7soNpVaNC9a77u_GolI3C4f--kgY4z0P-5RIkFTY2w>
    <xmx:NnPfZwid6Jfyxbo2zzMyagyQAwg4i0PtAdZvvMcW4jqUKzlstEm-lYdw>
Feedback-ID: i5ec1447f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 22 Mar 2025 22:34:25 -0400 (EDT)
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
Subject: [PATCH v4 0/2] hid-asus: asus-wmi: refactor Ally suspend/resume
Date: Sun, 23 Mar 2025 15:34:19 +1300
Message-ID: <20250323023421.78012-1-luke@ljones.dev>
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

*Note: In review it was requested by Mario that I try strsep() for parsing
the version. I did try this and a few variations but the result was much
more code due to having to check more edge cases due to the input being
raw bytes. In the end the cleaned up while loop proved more robust.

- Changelog:
  + V2: https://lore.kernel.org/platform-driver-x86/20250226010129.32043-1-luke@ljones.dev/T/#t
    - Adjust warning message to explicitly mention suspend issues
    - Use switch/case block to set min_version
      - Set min_version to 0 by default and toggle hacks off
  + V3
    - Remove noise (excess pr_info)
    - Use kstrtoint, not kstrtolong
    - Use __free(kfree) for allocated mem and drop goto + logging
    - Use print_hex_dump() to show failed data after pr_err in mcu_request_version()
    - Use pr_debug in set_ally_mcu_hack() and set_ally_mcu_powersave() plus
      correct the message.
  + V4
    - Change use_ally_mcu_hack var to enum to track init state and
      prevent a race condition

Luke D. Jones (2):
  hid-asus: check ROG Ally MCU version and warn
  platform/x86: asus-wmi: Refactor Ally suspend/resume

 drivers/hid/hid-asus.c                     | 111 ++++++++++++++++-
 drivers/platform/x86/asus-wmi.c            | 133 +++++++++++++++------
 include/linux/platform_data/x86/asus-wmi.h |  19 +++
 3 files changed, 222 insertions(+), 41 deletions(-)

-- 
2.49.0


