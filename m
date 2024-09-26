Return-Path: <linux-input+bounces-6738-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F0DC5987025
	for <lists+linux-input@lfdr.de>; Thu, 26 Sep 2024 11:30:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 89290285D04
	for <lists+linux-input@lfdr.de>; Thu, 26 Sep 2024 09:30:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDA3A1A42AB;
	Thu, 26 Sep 2024 09:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b="BveS5WCI";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="YZEQu2z3"
X-Original-To: linux-input@vger.kernel.org
Received: from fout-a7-smtp.messagingengine.com (fout-a7-smtp.messagingengine.com [103.168.172.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58AE01AB6EE;
	Thu, 26 Sep 2024 09:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727343005; cv=none; b=s7WhLbUqXRlnoCFsxnkF0DxJeByW2DSR7xqzC32xkrT596rIXlFh70iC/JenQzg76HLybDBH2wvRazFN8MzDyEY7ejpUvy/dKy8uKBfhsXaJqhXJPNypqRNZvbNzBkoU1Qe5RVMhF2ULZey9uxgE/367hfc6gLbdKW/0WXQl4Kw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727343005; c=relaxed/simple;
	bh=iIHzXOx0pFk7jwvksvnKP2lN8/sMzdyxEPKPJMcowRA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ByE33WWF91lG6QjsIGGQHHCKby+FgOUNfXIWkKyuVWoDeLw1UQ4u68ty7wjtj+Jp8UtwGt223Z+PBIoW7lqM2aVCij0bMQN/mgDjg7cdUCFm4aTDP1HGzC261MpPyNrJO30BFuG44Hl/8ddVNhMuA74stjkzBuoX5/129BDYblQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev; spf=none smtp.mailfrom=ljones.dev; dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b=BveS5WCI; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=YZEQu2z3; arc=none smtp.client-ip=103.168.172.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ljones.dev
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfout.phl.internal (Postfix) with ESMTP id 591181380552;
	Thu, 26 Sep 2024 05:30:02 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Thu, 26 Sep 2024 05:30:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ljones.dev; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm3; t=1727343002; x=1727429402; bh=3p
	y0WN0ig/hJCQGZ38PUAlfLE4IxkpXsSiSv6aahmBE=; b=BveS5WCIFwJPubF9rx
	XRf3i1SEUACtQsVMpHIcaDdXcIs8jn3+TW9ndjSDyaQDBZI+HAlbl/SsuQe6VH0Q
	XKgB/2fZH1VO3UemV3ZUkDYRlGyY57K7UINWOoTdeXvv99U+QaG8k4kAZOooqszb
	gPU6BTcegBSJSv+8Y4cKik75V0LADj/z10yx1MOEsdwDX7aHgv9uSqGUFZxSNg+o
	cGeQ1BdXKH9dv+k+XpJ59np5DADHHVhIldJFPNS3kfrjSo0Wh8k/NchORj0X7F9B
	KKdwRQlH2AkivYtc58ziiVDtmCgLpFtCUbPrFCqFQJkajdOIYOzUrBbiXcRXjU54
	2HwQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1727343002; x=1727429402; bh=3py0WN0ig/hJC
	QGZ38PUAlfLE4IxkpXsSiSv6aahmBE=; b=YZEQu2z36daOhKyJthLN1pf1pOjG8
	xs4MBhVLCy1SZ9N9Wx1TFr/DA/V1P0/lTGw1R4guTEI3wpBLSxcEpBDRbC4Q3AHw
	vT0qwwO54FzlvIsq4aZ0iIrW3V8r7L5eRvkpwK+bMSFCzqTYddzEnTWFehzM3gFg
	GulTD6XOnNvj6Ijk3YhPlYe2e3AVCp4HfYf17PNwK7dkK7EsI7wV1INn3KfSRolH
	0W3CQx428hilx3hvQ5Qcjud30XWL0TPFYoBvFczmmeCSX2810WjSF/9Lg3Ne5Ql1
	rTcoGM+pc9X8r8giYlk6K4EC8t8bV0b47yebfoWH2t5gMy+TavoZUQSyA==
X-ME-Sender: <xms:mSn1Ziqmx7_hhixfCPuBm-dpb02hHxcykObpeA5WZRxSnaPYnVFKoA>
    <xme:mSn1ZgqY-ekks4ihwtdogkE8py5V2m_wHr7WNBDJDJPEYn-UwLx9glTWuTl1sI_AF
    q94h91MUvLSlGfLPLU>
X-ME-Received: <xmr:mSn1ZnMQd6ptm0b6m4t283huGKrg-VIgv9TCWmW7doyRg7JITGnZ369gsEkOJA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvddtjedgudeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevuf
    ffkffogggtgfesthekredtredtjeenucfhrhhomhepfdfnuhhkvgcuffdrucflohhnvghs
    fdcuoehluhhkvgeslhhjohhnvghsrdguvghvqeenucggtffrrghtthgvrhhnpeejtdfhhe
    ffkefhteekleduteegudfgleekheejuedvueefvdeltdehuefgveekkeenucffohhmrghi
    nhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomheplhhukhgvsehljhhonhgvshdruggvvhdpnhgspghrtghpthhtohep
    uddtpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlh
    esvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhinhhpuhht
    sehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepsggvnhhtihhssheskhgvrh
    hnvghlrdhorhhgpdhrtghpthhtohepjhhikhhosheskhgvrhhnvghlrdhorhhgpdhrtghp
    thhtohepphhlrghtfhhorhhmqdgurhhivhgvrhdqgiekieesvhhgvghrrdhkvghrnhgvlh
    drohhrghdprhgtphhtthhopehilhhpohdrjhgrrhhvihhnvghnsehlihhnuhigrdhinhht
    vghlrdgtohhmpdhrtghpthhtohephhguvghgohgvuggvsehrvgguhhgrthdrtghomhdprh
    gtphhtthhopegtohhrvghnthhinhdrtghhrghrhiesghhmrghilhdrtghomhdprhgtphht
    thhopehsuhhpvghrmhdusehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:mSn1Zh6_YLYj9xDW1Gjt7rDQWrQoQg5VK0q6ktvzov3BWQ4tgeYeww>
    <xmx:mSn1Zh4Y0gKR0ldA1o41dItM0TIAsNF3YyrCcLKhEJ6qFb--Xwq4iw>
    <xmx:mSn1ZhjVrbXJdPQjyxOswnywbs7o8H0xWsyw1AUY6cMmEZ_bUKTa-g>
    <xmx:mSn1Zr7cND1GULWxVthATwouowaexuo_s-iYyxB7ygs-wjm33HqLSw>
    <xmx:min1ZmHjuwa5xvoicyz-0LQ9-qdTTSbkHcnCfHSdNyKT94SoRfYeIXva>
Feedback-ID: i5ec1447f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 26 Sep 2024 05:29:57 -0400 (EDT)
From: "Luke D. Jones" <luke@ljones.dev>
To: linux-kernel@vger.kernel.org
Cc: linux-input@vger.kernel.org,
	bentiss@kernel.org,
	jikos@kernel.org,
	platform-driver-x86@vger.kernel.org,
	ilpo.jarvinen@linux.intel.com,
	hdegoede@redhat.com,
	corentin.chary@gmail.com,
	superm1@kernel.org,
	"Luke D. Jones" <luke@ljones.dev>
Subject: [PATCH v4 0/9] platform/x86: introduce asus-armoury driver
Date: Thu, 26 Sep 2024 21:29:43 +1200
Message-ID: <20240926092952.1284435-1-luke@ljones.dev>
X-Mailer: git-send-email 2.46.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

his is the first major patch I've ever done with the intention of
introducing a new module, so it's highly likely I've made some mistakes
or misunderstood something.

TL;DR:
1. introduce new module to contain bios attributes, using fw_attributes_class
2. deprecate all possible attributes from asus-wmi that were added ad-hoc
3. remove those in the next LTS cycle

The idea for this originates from a conversation with Mario Limonciello
https://lore.kernel.org/platform-driver-x86/371d4109-a3bb-4c3b-802f-4ec27a945c99@amd.com/

It is without a doubt much cleaner to use, easier to discover, and the
API is well defined as opposed to the random clutter of attributes I had
been placing in the platform sysfs.

There is some discussion on-going regarding the way tuning knobs such as
the PPT_* should work with platform_profile. This may result in the creation
of an extra profile type "Custom" to signify that the user has adjusted
things away from the defaults used by profiles such as "balanced" or "quiet".

Regards,
Luke

Changelog:
- v1
  - Initial submission
- v2
  - Too many changes to list, but all concerns raised in previous submission addressed.
  - History: https://lore.kernel.org/platform-driver-x86/20240716051612.64842-1-luke@ljones.dev/
- v3
  - All concerns addressed.
  - History: https://lore.kernel.org/platform-driver-x86/20240806020747.365042-1-luke@ljones.dev/
- v4
  - Use EXPORT_SYMBOL_NS_GPL() for the symbols required in this patch series
  - Add patch for hid-asus due to the use of EXPORT_SYMBOL_NS_GPL()
  - Split the PPT knobs out to a separate patch
  - Split the hd_panel setting out to a new patch
  - Clarify some of APU MEM configuration and convert int to hex
  - Rename deprecated Kconfig option to ASUS_WMI_DEPRECATED_ATTRS
  - Fixup cyclic dependency in Kconfig

Luke D. Jones (9):
  platform/x86: asus-wmi: export symbols used for read/write WMI
  hid-asus: Add MODULE_IMPORT_NS(ASUS_WMI)
  platform/x86: asus-armoury: move existing tunings to asus-armoury
    module
  platform/x86: asus-armoury: add panel_hd_mode attribute
  platform/x86: asus-armoury: add the ppt_* and nv_* tuning knobs
  platform/x86: asus-armoury: add dgpu tgp control
  platform/x86: asus-armoury: add apu-mem control support
  platform/x86: asus-armoury: add core count control
  platform/x86: asus-wmi: deprecate bios features

 .../ABI/testing/sysfs-platform-asus-wmi       |   17 +
 drivers/hid/hid-asus.c                        |    1 +
 drivers/platform/x86/Kconfig                  |   22 +
 drivers/platform/x86/Makefile                 |    1 +
 drivers/platform/x86/asus-armoury.c           | 1051 +++++++++++++++++
 drivers/platform/x86/asus-armoury.h           |  257 ++++
 drivers/platform/x86/asus-wmi.c               |  185 ++-
 include/linux/platform_data/x86/asus-wmi.h    |   19 +
 8 files changed, 1520 insertions(+), 33 deletions(-)
 create mode 100644 drivers/platform/x86/asus-armoury.c
 create mode 100644 drivers/platform/x86/asus-armoury.h

-- 
2.46.1


