Return-Path: <linux-input+bounces-6859-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E19BB9893ED
	for <lists+linux-input@lfdr.de>; Sun, 29 Sep 2024 11:08:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 63FE42856B7
	for <lists+linux-input@lfdr.de>; Sun, 29 Sep 2024 09:08:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48B7C13C827;
	Sun, 29 Sep 2024 09:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b="QTNcf13l";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="WShh+UoX"
X-Original-To: linux-input@vger.kernel.org
Received: from fhigh-a1-smtp.messagingengine.com (fhigh-a1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FEE3BE4E;
	Sun, 29 Sep 2024 09:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727600906; cv=none; b=mePrMm9vvlVZfVvLfpfivbQPSBV+IpkB6OrIZVuf/bm4qLFG1URvmF4RcMbgKn+rOVhuYqeRaGspEJvX5GNmsc7P8qNz/lkX24Yptbr5XEkJuEYB5Kd+JiiwSj7yaipcWnl4kLcDOOzUSOftYhUKyev8UhS5hnWw5ZWsktBdQLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727600906; c=relaxed/simple;
	bh=xnDFiabEk69Po+MvjTq9CM7sxXe/ExuzYKh1epqLd0M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=rNa65sGNzDAwhsmzt7vGXhPIkblVr82Uz9hV29HGpVoBTPf5kHdh4jnwUqAgtz0UGZM2SMwg2sEXMLAOlDkT6Ok5PfxB1MCRTmT5qQzobBonziLeVHwXZS9oAncSuJ/AvnWqz8uH9zW73PSsB64eWOcKbTScyxRP20lvgzqytCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev; spf=none smtp.mailfrom=ljones.dev; dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b=QTNcf13l; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=WShh+UoX; arc=none smtp.client-ip=103.168.172.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ljones.dev
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 1FEE911402B4;
	Sun, 29 Sep 2024 05:08:23 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Sun, 29 Sep 2024 05:08:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ljones.dev; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm3; t=1727600903; x=1727687303; bh=lD
	LppKylPcOQYxfSUN7v5KQuANoHXnuf7/vFLyeTwlw=; b=QTNcf13lfZMeKGyprR
	HwOnhDEQQjg6EJNPV5ZdSi1KZ/TDOds7gGJ7zmOaE9W4oEcR6ugpABcetu+qqTmc
	3q7IjW99hGCC9uiTJJjeu91EJt5Gj+j1ADeyiRh6eWab27xifLF3GlGkG11/5PQ3
	KisZI5UKihOhShTWG7q4DeCHQmXdew/vaz1atocQk0zaM5/+KPZ+LEroiVzId0RX
	KMOo/H4R900FoG2TJ1qIIbbod6UvO6kOwp94wamEGfv4Zne+UkVAkhkNgeCQzqbG
	ikqdlv0gxyKPaZPPTQdCCzfsJ5CDdFCE+fXcggkwdP3amzTDV1a35ic2yYNJsIlD
	4nBg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1727600903; x=1727687303; bh=lDLppKylPcOQY
	xfSUN7v5KQuANoHXnuf7/vFLyeTwlw=; b=WShh+UoXR4GiU4esCwXgiNJiEgyAY
	8MaPxMxgpIcbB5AT9QqfhNvwEY3PAzXdn2O/sdFG8/FiX1c++XNoYIuPeTCD9Swh
	pe4ZokKcebnLturgMfN3g1R+T3hqg1GHDkd5li9zz+RhPUXvGI2sGk5i2uXGzBON
	BuMeuvGIPZ0QULH3ZtEFzXTVUkOjfdXKyfbahxKekHhoRmdrgia1eFb6Kwy6Z4JK
	5K0lpy7LIRU0szSDHo/M1vFgnPpY0I95UTuPi1fgKt72S88K3L9GX+cV+0GeYxnR
	QRoaD7awDlTa5y6xk6nDiMTzhYVaVK9OSRSmRJVLx0U6JNCual5YGwGEw==
X-ME-Sender: <xms:Bhn5ZgeaJUh53iiiCCwJD-bhcbPuk2JlNdUUcg3xjLpSzOC7irGMkw>
    <xme:Bhn5ZiP7zthT_ksSSIjHVE6T3p0b6-aW3iJMcHrzqP-KYLXcyjmsWLyjZ5OHNkwrA
    OSlNAl8GYxLnD3tRFI>
X-ME-Received: <xmr:Bhn5Zhi4ZhtXziA2QqkmwuspPkd1zJzMzAs9rbqvllFHMLUqtxaEPTaLcrqh4w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvddufedgudefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevuf
    ffkffogggtgfesthekredtredtjeenucfhrhhomhepfdfnuhhkvgcuffdrucflohhnvghs
    fdcuoehluhhkvgeslhhjohhnvghsrdguvghvqeenucggtffrrghtthgvrhhnpeejtdfhhe
    ffkefhteekleduteegudfgleekheejuedvueefvdeltdehuefgveekkeenucffohhmrghi
    nhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomheplhhukhgvsehljhhonhgvshdruggvvhdpnhgspghrtghpthhtohep
    ledpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlse
    hvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqihhnphhuthes
    vhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehjihhkohhssehkvghrnhgvlh
    drohhrghdprhgtphhtthhopehplhgrthhfohhrmhdqughrihhvvghrqdigkeeisehvghgv
    rhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepihhlphhordhjrghrvhhinhgvnheslh
    hinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehhuggvghhovgguvgesrhgvughh
    rghtrdgtohhmpdhrtghpthhtoheptghorhgvnhhtihhnrdgthhgrrhihsehgmhgrihhlrd
    gtohhmpdhrtghpthhtohepshhuphgvrhhmudeskhgvrhhnvghlrdhorhhgpdhrtghpthht
    oheplhhukhgvsehljhhonhgvshdruggvvh
X-ME-Proxy: <xmx:Bhn5Zl9eJb9uUAeHEpb0kbxWWXS6ufAVg9NkOLE2naXyweosAu_X_g>
    <xmx:Bhn5ZstMipMA5HlI4jjE879U2ZYCiaWkEvNtzekPvf5_Re9QYvO29A>
    <xmx:Bhn5ZsGw62iO-EBoujTakVcCwW4Zg3ABqyZIm0XlG3CYkLX13Mwprg>
    <xmx:Bhn5ZrM5sS-A7x_GGhxq9P0FE4M0yrfdBcSy66Rtf5viKm-nzot1vQ>
    <xmx:Bxn5ZqDWE2WoW4LgggbrogBek1UZNdn17qgDMRgdVd-Wy653c8RPgb8X>
Feedback-ID: i5ec1447f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 29 Sep 2024 05:08:18 -0400 (EDT)
From: "Luke D. Jones" <luke@ljones.dev>
To: linux-kernel@vger.kernel.org
Cc: linux-input@vger.kernel.org,
	jikos@kernel.org,
	platform-driver-x86@vger.kernel.org,
	ilpo.jarvinen@linux.intel.com,
	hdegoede@redhat.com,
	corentin.chary@gmail.com,
	superm1@kernel.org,
	"Luke D. Jones" <luke@ljones.dev>
Subject: [PATCH v3 0/5] platform/x86: introduce asus-armoury driver
Date: Sun, 29 Sep 2024 22:08:04 +1300
Message-ID: <20240929090813.7888-1-luke@ljones.dev>
X-Mailer: git-send-email 2.46.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This is the first major patch I've ever done with the intention of
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
- v5
  - deprecate patch: cleanup ``#if`, ``#endif` statements, edit kconfig detail, edit commit msg
  - cleanup ppt* tuning patch
  - proper error handling in module init, plus pr_err()
  - ppt tunables have a notice if there is no match to get defaults
  - better error handling in cpu core handling
    - don't continue if failure
  - use the mutex to gate WMI writes

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
 drivers/platform/x86/Kconfig                  |   21 +
 drivers/platform/x86/Makefile                 |    1 +
 drivers/platform/x86/asus-armoury.c           | 1088 +++++++++++++++++
 drivers/platform/x86/asus-armoury.h           |  257 ++++
 drivers/platform/x86/asus-wmi.c               |  189 ++-
 include/linux/platform_data/x86/asus-wmi.h    |   22 +
 8 files changed, 1559 insertions(+), 37 deletions(-)
 create mode 100644 drivers/platform/x86/asus-armoury.c
 create mode 100644 drivers/platform/x86/asus-armoury.h

-- 
2.46.1


