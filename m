Return-Path: <linux-input+bounces-10382-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E1F6A451D1
	for <lists+linux-input@lfdr.de>; Wed, 26 Feb 2025 02:01:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9FF483B0CF2
	for <lists+linux-input@lfdr.de>; Wed, 26 Feb 2025 01:01:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA0C7154423;
	Wed, 26 Feb 2025 01:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b="GLvHVOmn";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="gxlvKd8K"
X-Original-To: linux-input@vger.kernel.org
Received: from fout-a2-smtp.messagingengine.com (fout-a2-smtp.messagingengine.com [103.168.172.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3803C2F5B;
	Wed, 26 Feb 2025 01:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740531699; cv=none; b=KZPo0Hd1Zn8MYQHsilkMYBI7fDdvoiK9yDWoGpbwTNHP1a9NaziIOWO9gwa0RKFerS6rjkRt/12zK1/Gs8rg1nrYtI5rFJHOZrvmg5oQIfJThuL6F3yNOangkD3MO+FzuuBBvSyMMOo7/CZVI1t65ihsdQJk8SKz6puFZyknZZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740531699; c=relaxed/simple;
	bh=oGp+5M4xZB2gOFdlrSB87UxRxduer68ts5XpIxT5JCs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=n2ZlDmuKmVHZO5Ja4iVy+0SrL6yrNn/dxlJFwOwLu7cfo2SPE7B4k1PCDZGfF7M3X5xb1DYkOXSGJ8IknhQKoRN5PRUER5mz8HmGny4C07FZOsGbcbWFh1wiv6bFUnPN83vyko4Bo7Q5GYc01t6dA16j/1gFwTAaynYF5+HDQMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev; spf=none smtp.mailfrom=ljones.dev; dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b=GLvHVOmn; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=gxlvKd8K; arc=none smtp.client-ip=103.168.172.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ljones.dev
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfout.phl.internal (Postfix) with ESMTP id 25FEC13809A0;
	Tue, 25 Feb 2025 20:01:37 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Tue, 25 Feb 2025 20:01:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ljones.dev; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm2; t=1740531697; x=1740618097; bh=uOBtnsr8m7MEc5OT9LdwT
	DTHNoNArdUK+3ce1Qs/bmc=; b=GLvHVOmn7ng17L06yZYg2VLAw1RMbM/9xB8Qt
	p50MEOER4hXlMkFzVsasUVJKdkvXNLOXzlrh/BjWlfXFp7mfBrf14m7OzEobuc6M
	gt0YBORGtgaM4V6nDlarI1WXiug1QmdeycCehhI+ReOZDLbquJ6YJxCRfNqDCIIk
	gEMIs9Tnlb7ba3mAToGK+609zG95ePhRedcz50nqB7WJZK/9ZHyRyB6w1ykbhhAh
	zKVdgmibEIeVcmSURtTntfOa/nm+S4D8b0WwjT9m+Sa+AJBmJZE848fxHEANu5LK
	k5RizWYEzx0V9J5EpD5ioQkKFGxAkdMztFNw+GpvQy4NHTPfw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1740531697; x=1740618097; bh=uOBtnsr8m7MEc5OT9LdwTDTHNoNArdUK+3c
	e1Qs/bmc=; b=gxlvKd8KydAE9JYeNv4+BlbE09rWxrkZnHjv3lqH4ZRntIXi4PH
	P6EEwgKu62/UH0S6AUZ1jSbzbRb38WfbA4EBVhC3yTPDwaW48o6klJ/KFn11rAWD
	zMmAbQQJxqlws/j8ICuJ5WN+CQ6LWO4uP+qS5RDxaopEgGgQKetmumdTyeyRtaJ3
	aDmqUj9w+bO788lwfYnMCW0csJt0SstaIzIlRhM+Qy0LyuvHFi2lEIzC22rRUrzf
	wT+pFKlzjrHJgiyAtLNeX//tlPFoqnvDeEaxW6OKuHcbhvrFTHhlYNsdlpqc5es4
	X5Dti9DT2q81xSo1hs3cgx/TXVLzK24P5pg==
X-ME-Sender: <xms:8Ge-Z-bNp0siyrk7LGf9MKrRDIUiN1wwjSYGYzRUump-S9A9wgvqcg>
    <xme:8Ge-ZxZrbYXOlfKfg1Cg-cE0rpz-6xCR4c1maDCaB9410ktnIvjx01pqdMp9qlUaO
    zce9c_ur7dvCMD9eCo>
X-ME-Received: <xmr:8Ge-Z4-0dOENfy4qriltVtgssicryhMvqYzg8_jtzDdJRjQnea-K2qiGp53zroGcX8eEW4aya2UDogyDWA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdekfedvudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecunecujfgurhephffvve
    fufffkofgggfestdekredtredttdenucfhrhhomhepnfhukhgvucflohhnvghsuceolhhu
    khgvsehljhhonhgvshdruggvvheqnecuggftrfgrthhtvghrnheptdektdeitdetueehue
    etteffffeggfefhfeitddvgeeifeejheelheffjefggfehnecuvehluhhsthgvrhfuihii
    vgeptdenucfrrghrrghmpehmrghilhhfrhhomheplhhukhgvsehljhhonhgvshdruggvvh
    dpnhgspghrtghpthhtohepledpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheplhhi
    nhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohephh
    guvghgohgvuggvsehrvgguhhgrthdrtghomhdprhgtphhtthhopehilhhpohdrjhgrrhhv
    ihhnvghnsehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepphhlrghtfhhorh
    hmqdgurhhivhgvrhdqgiekieesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthho
    pehlihhnuhigqdhinhhpuhhtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoh
    epsggvnhhtihhssheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepjhhikhhosheskhgv
    rhhnvghlrdhorhhgpdhrtghpthhtohepmhgrrhhiohdrlhhimhhonhgtihgvlhhlohesrg
    hmugdrtghomhdprhgtphhtthhopehluhhkvgeslhhjohhnvghsrdguvghv
X-ME-Proxy: <xmx:8Ge-ZwrHoJNiRA4wdUMwCGMZ1oWYLhCe2WbJjuhxKL-5eBM73zzN0g>
    <xmx:8Ge-Z5p_w7PJimgTv5qipRzLakne2lRjhMNzMnp7GM_RvsMkcCquWw>
    <xmx:8Ge-Z-RMwN37cu1Vq9uWb5s9Gj2dH_ZmkboDM_hTOtU-3WDrhqaUWA>
    <xmx:8Ge-Z5omwzw4OV0U6j1qgcnWpswxb6Q_DlJRViIb6NlqGj-_z9W_-g>
    <xmx:8We-Z9fehdBVG94la113bbW5A-G-59hohOcGwujcE6cvs3qcBVpLL-mF>
Feedback-ID: i5ec1447f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 25 Feb 2025 20:01:33 -0500 (EST)
From: Luke Jones <luke@ljones.dev>
To: linux-kernel@vger.kernel.org
Cc: hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	platform-driver-x86@vger.kernel.org,
	linux-input@vger.kernel.org,
	bentiss@kernel.org,
	jikos@kernel.org,
	mario.limonciello@amd.com,
	Luke Jones <luke@ljones.dev>
Subject: [PATCH v2 0/2] hid-asus: asus-wmi: refactor Ally suspend/resume
Date: Wed, 26 Feb 2025 14:01:27 +1300
Message-ID: <20250226010129.32043-1-luke@ljones.dev>
X-Mailer: git-send-email 2.48.1
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

Luke D. Jones (2):
  hid-asus: check ROG Ally MCU version and warn
  platform/x86: asus-wmi: Refactor Ally suspend/resume

 drivers/hid/hid-asus.c                     | 107 +++++++++++++++++-
 drivers/platform/x86/asus-wmi.c            | 124 ++++++++++++++-------
 include/linux/platform_data/x86/asus-wmi.h |  15 +++
 3 files changed, 205 insertions(+), 41 deletions(-)

-- 
2.48.1


