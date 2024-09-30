Return-Path: <linux-input+bounces-6875-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AE67989885
	for <lists+linux-input@lfdr.de>; Mon, 30 Sep 2024 02:01:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ECB371F2177F
	for <lists+linux-input@lfdr.de>; Mon, 30 Sep 2024 00:01:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 458C32570;
	Mon, 30 Sep 2024 00:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b="fvD8XAUg";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Ew3AXCv/"
X-Original-To: linux-input@vger.kernel.org
Received: from fhigh-a3-smtp.messagingengine.com (fhigh-a3-smtp.messagingengine.com [103.168.172.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08E0B8F6D;
	Mon, 30 Sep 2024 00:00:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727654458; cv=none; b=FtSqf/0PaFEdkGhxp7nm7fkMWXmMS+MtiyaucXFcOpyseg2YaKTRg0mik92gE33lEL1++u4FSlJ1aQtADhomfUjadiuIfW0016zQ1N/cLFnE7VLDOooJQSC+eRSbxTHUiB7OmsXqHUoZDDLUPq6ve/Wzf5vXbBGYNxdxl+TAWhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727654458; c=relaxed/simple;
	bh=huu/jTgPUqdc/lcToSoXiMIQfrxOVPin7vFHDswNONw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=h6naOv3k8drS8EfxQSg6tLHfWG2zMJGhLRpZXAqPInjLbk6YDsPiGKiuVvDkApghgbPZe1IPEIXi2xBL9Jc3HXfbxiUFTLwE5Yjx95tDLrOYsHp51o3XZsBHirYxAR3faNIp+Lt7YBQJqa7a5C/cq/NZvFmEhxucGkXWR9HIgVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev; spf=none smtp.mailfrom=ljones.dev; dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b=fvD8XAUg; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Ew3AXCv/; arc=none smtp.client-ip=103.168.172.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ljones.dev
Received: from phl-compute-08.internal (phl-compute-08.phl.internal [10.202.2.48])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 0CCA611400D9;
	Sun, 29 Sep 2024 20:00:55 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-08.internal (MEProxy); Sun, 29 Sep 2024 20:00:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ljones.dev; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm3; t=1727654455; x=1727740855; bh=Ot
	drO02qeG4U0Zxl1YZVt0wLU7Sl/L11oehQcK/1GVY=; b=fvD8XAUgNKIfWl5fDo
	6qiruXhRGhPeEQ6Pa5BmCwrijoEoV4+TvksiPY8VcsHbUnlphY47j8phNyP5rj8m
	G3iLhQUl0YYHWzeChs/n7oGrXmDiR2IdIw/TIAO+N0/ybxKq+YqmzBL4VvSc4Gkz
	9w9qp4UPPiUPlXFqiJPE6UwyXzgT68SpCa+hKkdDUJGAl5WgBgwRqKqW+AMcii46
	6xfQLoqYtdtCiQ4I3HCh0RYosK2SI1xLwdDotiiokh41nfqwkNXWsXYka+Z3rhMR
	F74xI280rX9u12pLbJIfC/OuCpDQrsspYUk45oM8t6JD8cPZjL1Atm14Y9XMpVj8
	HSBA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1727654455; x=1727740855; bh=OtdrO02qeG4U0
	Zxl1YZVt0wLU7Sl/L11oehQcK/1GVY=; b=Ew3AXCv/VpsmT31tTrZdqn0KC7soK
	34vYzPLGYZwsFDbaDY4IGI8CpfdeORQdWAQrx4JvjQN9RXGAKLKA/PL0GDm1GRD4
	RAwC8RuYIDVRJeeYJIuK3SsfWLeD8OcUN19X2pg1Z8iINl/9kQgDCR+6CH6PFFGr
	/P+cWgVCL/1x7+RtoNn5EWPWepamKevb6PStpRuCRTjUXUKeKnJzBv8J25IrRU1d
	j4XbID+eNz/LJ1rPVaTMJdpXUBypEUpB6ZI7Pn3/2Jf/S7FhSFrf8itcmetWUTNL
	EjSb/mPjkUlpeq4o194pdxlxBgvGvJ+1JHGOC4V1fdppc/mS2HiEuqtVw==
X-ME-Sender: <xms:Nur5ZuXmAjkLRNsgTEbCZd9SHoE1zQkhhXr_KcsqmB5d_mBmQzaMLA>
    <xme:Nur5ZqkpwJqwtSZ9NLpSO2rFbXbKZ8Fkndu5tTDN2KFdYuH4Vi2F1Jj0I89mrXMPj
    wPX4sWP8FI6iEkv2mU>
X-ME-Received: <xmr:Nur5Zibra3a_FRwE21GAHt4rR4EgxzSCNlrnY8m3LeLYQJ9wv5WPwZAMcMw_nQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvddugedgvdelucetufdoteggodetrfdotf
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
X-ME-Proxy: <xmx:Nur5ZlWvImFxMz-lVp9bqqY5SS1GQE0O6zs2C6C19xPN3_1HpIfnHA>
    <xmx:Nur5ZonJ6hlI02YKCxedXGlYyaCw0LjBN94rhg49K6-C09LVIV6gtw>
    <xmx:Nur5ZqeBOxOOXZaKnxIcwPva86uS7z3X_cxBtGsv91v9yno97qwDwg>
    <xmx:Nur5ZqHPY3Gh9acP2mBRyPFqqDAbvDej2e0xw_6F3djbtYLkKwAHNA>
    <xmx:N-r5Zi7pI-5aY5orF76FfH16YAL6tgmugso1Vu2uMKOiypTLlWieYo8U>
Feedback-ID: i5ec1447f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 29 Sep 2024 20:00:51 -0400 (EDT)
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
Subject: [PATCH v6 0/9] platform/x86: introduce asus-armoury driver
Date: Mon, 30 Sep 2024 13:00:37 +1300
Message-ID: <20240930000046.51388-1-luke@ljones.dev>
X-Mailer: git-send-email 2.46.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

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
- V6
  - correctly cleanup/unwind if module init fails
  
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
 drivers/platform/x86/asus-armoury.c           | 1093 +++++++++++++++++
 drivers/platform/x86/asus-armoury.h           |  257 ++++
 drivers/platform/x86/asus-wmi.c               |  189 ++-
 include/linux/platform_data/x86/asus-wmi.h    |   22 +
 8 files changed, 1564 insertions(+), 37 deletions(-)
 create mode 100644 drivers/platform/x86/asus-armoury.c
 create mode 100644 drivers/platform/x86/asus-armoury.h

-- 
2.46.1


