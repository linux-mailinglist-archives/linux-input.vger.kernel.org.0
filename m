Return-Path: <linux-input+bounces-10406-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 17A79A47869
	for <lists+linux-input@lfdr.de>; Thu, 27 Feb 2025 09:58:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D2BBB3AD9A7
	for <lists+linux-input@lfdr.de>; Thu, 27 Feb 2025 08:58:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEEEE226183;
	Thu, 27 Feb 2025 08:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b="WKNzkHH7";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="TkEJ1wjw"
X-Original-To: linux-input@vger.kernel.org
Received: from fout-a5-smtp.messagingengine.com (fout-a5-smtp.messagingengine.com [103.168.172.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B84CD225403;
	Thu, 27 Feb 2025 08:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740646707; cv=none; b=rhCrDEgHRuOxXuZrFvKNqMKI7xsw8Z48VxY4mquzQx9cwRkPG7WNs9vm8Y+SJUabG3Nc9Ul/u0ZpPT6YwxkUenhySGR6gandO0u1DDiNTVZn5Qb/8+DqUke+iDVrGmjEoRaLoD7tzXUAAhwkpCrUf/w9kxCFLWAN7M1VvLluo6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740646707; c=relaxed/simple;
	bh=EQ3MlbKxDtR5dd2Px0qRSamaBS7FsofcEx3iJRs0w9Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=feAHYvYhUKjWddEAXhQUTJ2spg5juBMs4w5fZlEZOXvmrHsmYgJkpaaorsWlPsYdmRDjVCHEkpzYRS/5Zw7t6a1CmFhip++Yvk+wEnuxxVs13czlK6VM6RRPe3qqRIQF72fAdUoIKBJxlauO4auQDp7Y6L4G1b4+4YO/YZwLYKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev; spf=none smtp.mailfrom=ljones.dev; dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b=WKNzkHH7; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=TkEJ1wjw; arc=none smtp.client-ip=103.168.172.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ljones.dev
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfout.phl.internal (Postfix) with ESMTP id 97E951382F4C;
	Thu, 27 Feb 2025 03:58:24 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Thu, 27 Feb 2025 03:58:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ljones.dev; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm2; t=1740646704; x=1740733104; bh=7xLUD2jiu5StKBefCueNi
	IqULkTWQovFAKg6LQiBsz0=; b=WKNzkHH7dpZ/zouawKUjq795KLzxdOQTd1P3d
	g2gooYJRJKNgJL062YJP63poUPw1/eeYzIuSe7KvI+dA5zwrA/sMC8sa4hScUNuP
	3m10G7JF9YG3mvSLjf2C63Py/emahjMpEwh0OQZaOtxjGmvQm3h/r/jD8Dfx38Qy
	+gMeJkLFpltFWY0ltXtzmMz2jnSEzXk5wuMW+kCEsqU/5SeQaXifh73joSgz3ot7
	xNG4563jUMVDRzHALXyIJFcR7av5mlszpHpfrYJ+2BLtBEefunloLbErtPlDmQy2
	Fys1uZG0PDo0B4bcFdJ2Us4BBDGN2UZWrlxYbY9jmG3z49/qg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1740646704; x=1740733104; bh=7xLUD2jiu5StKBefCueNiIqULkTWQovFAKg
	6LQiBsz0=; b=TkEJ1wjw9CPpeJZB/8OglXhW3c8mlGaFPTKGF8CbN34kKAH2fvF
	/6VXfsWzDIJn1L3dtEQP6811vUUEwdFafFN2MkxbHxaS7aXF3rEOqbfQdXpvqTuW
	Nno7zp95EkrRNwqLlJQlPfX+qxTrsGqZ/R9tXdKheJg7x2FIfikEHXMxuUzNe5TF
	/zTY7twfxSK9ljKrn9DMMpAmPX6HpDZZP21JdWag0VxKV3KFGZeetYVrudFCfSVA
	D3UULl8VcteepVupv4WodqcNYy+U0OpFZHjS+jT2s5T2M+311J+Xj++Miiwn8uUj
	OBpN+iGWcuoCLvGudISPklSeDyjQPMgXcvQ==
X-ME-Sender: <xms:MCnAZ1lvyf5o0KUfgwMq0DiNJwHCxNd_73cBVw6Nw5JC8uz3hdyXbQ>
    <xme:MCnAZw170JEKUgQqmaQiJHSuzoHFi_7eUbCAOvWWqrY-zYxwdc5G4JfWNTh2oXLyy
    Aqj1jkdIcZx50QDrHE>
X-ME-Received: <xmr:MCnAZ7pqrhHhAUd7M3iIqiyQCdyhesr2ZOpDI3AHvmaPGnvfiSuo-JtteMIRtvRw4xsqVbQz7APON0wRLA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdekjedtgecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecunecujfgurhephffvve
    fufffkofgggfestdekredtredttdenucfhrhhomhepnfhukhgvucflohhnvghsuceolhhu
    khgvsehljhhonhgvshdruggvvheqnecuggftrfgrthhtvghrnheptdehueelkeegheduud
    efuddvveffleegffejkeeiffeugfehvdektefgfffgieefnecuffhomhgrihhnpehkvghr
    nhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
    hrohhmpehluhhkvgeslhhjohhnvghsrdguvghvpdhnsggprhgtphhtthhopeelpdhmohgu
    vgepshhmthhpohhuthdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrd
    hkvghrnhgvlhdrohhrghdprhgtphhtthhopehhuggvghhovgguvgesrhgvughhrghtrdgt
    ohhmpdhrtghpthhtohepihhlphhordhjrghrvhhinhgvnheslhhinhhugidrihhnthgvlh
    drtghomhdprhgtphhtthhopehplhgrthhfohhrmhdqughrihhvvghrqdigkeeisehvghgv
    rhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqihhnphhuthesvhhgvg
    hrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopegsvghnthhishhssehkvghrnhgvlhdr
    ohhrghdprhgtphhtthhopehjihhkohhssehkvghrnhgvlhdrohhrghdprhgtphhtthhope
    hmrghrihhordhlihhmohhntghivghllhhosegrmhgurdgtohhmpdhrtghpthhtoheplhhu
    khgvsehljhhonhgvshdruggvvh
X-ME-Proxy: <xmx:MCnAZ1n5gS_fuK8rx-dAvetKCsBEQt0E4CZflkJLIxgXNL12oWY90A>
    <xmx:MCnAZz3lrEhdcTp2iqABLrlbNfcmSIXm-f3B_5pB1iNwGXspHU3awQ>
    <xmx:MCnAZ0sFtQIFQnUVsryTDvcqu3mDO3ygj8WW3yvQUi2m6BIy0TikSA>
    <xmx:MCnAZ3U0liexQ8a6mAaqitkmmyY29wSuTz9rhy7WtBqjtwZ4GpBlLg>
    <xmx:MCnAZ1wiXI28zuoy3vjKTNuXkrb-M8-eZlEaTVxQ3WCDPhbPXcdZoy1n>
Feedback-ID: i5ec1447f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 27 Feb 2025 03:58:21 -0500 (EST)
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
Subject: [PATCH v3 0/2] hid-asus: asus-wmi: refactor Ally suspend/resume
Date: Thu, 27 Feb 2025 21:58:15 +1300
Message-ID: <20250227085817.1007697-1-luke@ljones.dev>
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

Luke D. Jones (2):
  hid-asus: check ROG Ally MCU version and warn
  platform/x86: asus-wmi: Refactor Ally suspend/resume

 drivers/hid/hid-asus.c                     | 111 +++++++++++++++++-
 drivers/platform/x86/asus-wmi.c            | 130 ++++++++++++++-------
 include/linux/platform_data/x86/asus-wmi.h |  15 +++
 3 files changed, 215 insertions(+), 41 deletions(-)

-- 
2.48.1


