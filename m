Return-Path: <linux-input+bounces-10332-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D9487A43776
	for <lists+linux-input@lfdr.de>; Tue, 25 Feb 2025 09:22:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D5613189C941
	for <lists+linux-input@lfdr.de>; Tue, 25 Feb 2025 08:21:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99FA6266F0E;
	Tue, 25 Feb 2025 08:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b="QX/Bvna7";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="LP3VBxZg"
X-Original-To: linux-input@vger.kernel.org
Received: from fout-a7-smtp.messagingengine.com (fout-a7-smtp.messagingengine.com [103.168.172.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9744D261360;
	Tue, 25 Feb 2025 08:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740471475; cv=none; b=goesgCRCGaYVRsNA1JUiQ6N4rhXlSK8pThVxbXXZf1uSwOHbJ+cMpg/lBChcDSxP93RsUPiFR29hU+u3vPc3j0ACe7s+Vs1Y5Ix6nZzWpHZF+TmQEcp/l0xSQR5uyxBJ6kpISYvcfHntJWvbElRd1ihoBQxt/JR7jFdo/xIJ214=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740471475; c=relaxed/simple;
	bh=+U8N0q/4tVwBbUeq2+WhDUghvs71woUXYAKsqO4KBIw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TBajCOqQ45l9y/ijWFttli6JfBN3CJPJ0WA7QJWce1Zwj5810aDsYAF4snIKhuW5pi4NkiOLnC1V8vR8PZQrGGkhLY3Nl9ZvI7Ynt0J8qK62jm2VcsAxClNSWXhtwUOvPENDyI6s1XdClWr5RIjOQ9L+knnst9PjMp5ntw84VPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev; spf=none smtp.mailfrom=ljones.dev; dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b=QX/Bvna7; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=LP3VBxZg; arc=none smtp.client-ip=103.168.172.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ljones.dev
Received: from phl-compute-06.internal (phl-compute-06.phl.internal [10.202.2.46])
	by mailfout.phl.internal (Postfix) with ESMTP id 626F31381684;
	Tue, 25 Feb 2025 03:17:52 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Tue, 25 Feb 2025 03:17:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ljones.dev; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm2; t=1740471472; x=1740557872; bh=bdIllsSKWBpK9vaOW5DvD
	l4NNgJuhqdEomPLmN+ytAA=; b=QX/Bvna7Q5Bk650sS0FtRueZco53KDOdvjtmP
	ROtsXWCvYEjuV+IA7tZgh320E12GYd+ErtPVXqVkQWFzYZiqCpwpgTBx04uKwaeE
	wlGaC5psouT3Qn1Oc+P+Z5T+WGWU6FPBLk5d/9Rc1U+BDyp7VHbDE4ZOXUE84Cxf
	T7uS8aLW9ntYgtqHAYit72x65KinpPgLGv5mVUJK0jtwihn/On/zjJZB0nGd5UX4
	2E/NwaHrB6hxovB+qwCxJ06G05i91vYAdaP9usklR+KF/z/j7eld4ZYO9pDYwZhs
	0qZuAgifZtnpxNzLQCjPNzDBCxvjKhckm5FgraqBbKekOLlBQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1740471472; x=1740557872; bh=bdIllsSKWBpK9vaOW5DvDl4NNgJuhqdEomP
	LmN+ytAA=; b=LP3VBxZgDQ+OK0y2CZotJg2dzv2SMvMaYa6yV05y9s7KyYSLbLw
	6nnapv/oA/Pmf4X57M+8gG6pZ7vCLAvPLtbFuoysdW1Tu+kH7zQcCyMZs3ms05Xn
	5yGDwxZwRdr8ZJlZNBRGiselYFQkZJ+M/Lv/iweOX6eSMxzdUNTOkrLgcUi/j4FL
	kKiRpATgJZLnUY4hRJYAXffDepdrgDXcS6E95MNNDXjbvt0GkBILwMGqkOKKHykZ
	gHH8Po28YAUd8HQWwhK6mT1PNV8upaEvn0AlbevXvj0WLwWIhHpHk8bwPcxaMwhR
	4D2o1YKlJucvYUzAcQYxGU6DmxXAF5BL+YQ==
X-ME-Sender: <xms:r3y9Z747xVkjSwoKD1mfX8K0QkpQhVqf5SKYHDQoYNsjSgrF7D9b_Q>
    <xme:r3y9Zw5AxYtavcuVhw9jG4PtcDEJq8ze6kv67hAW-DzZFSZxK2jVPSuTCwZw4g_Zx
    K3NZPcsFQF-MFOpqAI>
X-ME-Received: <xmr:r3y9Zycy0eJqZqnGS-9INZvYSfoVj2gWcJ_Z-CK95Z88FGAkixHYyEjTLeQH4cqa4WhtY9MPZ0oUM9Sgyw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdekuddvtdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecunecujfgurhephffvve
    fufffkofgggfestdekredtredttdenucfhrhhomhepnfhukhgvucflohhnvghsuceolhhu
    khgvsehljhhonhgvshdruggvvheqnecuggftrfgrthhtvghrnheptdektdeitdetueehue
    etteffffeggfefhfeitddvgeeifeejheelheffjefggfehnecuvehluhhsthgvrhfuihii
    vgeptdenucfrrghrrghmpehmrghilhhfrhhomheplhhukhgvsehljhhonhgvshdruggvvh
    dpnhgspghrtghpthhtohepkedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheplhhi
    nhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohephh
    guvghgohgvuggvsehrvgguhhgrthdrtghomhdprhgtphhtthhopehilhhpohdrjhgrrhhv
    ihhnvghnsehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepphhlrghtfhhorh
    hmqdgurhhivhgvrhdqgiekieesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthho
    pehlihhnuhigqdhinhhpuhhtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoh
    epsggvnhhtihhssheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepjhhikhhosheskhgv
    rhhnvghlrdhorhhgpdhrtghpthhtoheplhhukhgvsehljhhonhgvshdruggvvh
X-ME-Proxy: <xmx:r3y9Z8LQ-NjSBWs7btz_OQi93yjr0wsYVuhWKvfowFf3e8hzNe3ZeQ>
    <xmx:r3y9Z_Lymtivsx3a4kfMmAiPsxjivQB1Gt1pVbZPPA9ZQGoY9-47tg>
    <xmx:r3y9Z1x5PcRS0wc01Xi3Irq48tk3_9Q2gy5-e-S5XnRnUHqCXJH_Lg>
    <xmx:r3y9Z7LlouR3llojwESBJN7jh7SQb2Oi6uoFD9g4BsYFLuSD-90MHw>
    <xmx:sHy9Z8rpVkA8w7Z-S9UgUweEOeMyic2PMHFOY3ZeaHNVy49GORCy9uXZ>
Feedback-ID: i5ec1447f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 25 Feb 2025 03:17:48 -0500 (EST)
From: Luke Jones <luke@ljones.dev>
To: linux-kernel@vger.kernel.org
Cc: hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	platform-driver-x86@vger.kernel.org,
	linux-input@vger.kernel.org,
	bentiss@kernel.org,
	jikos@kernel.org,
	Luke Jones <luke@ljones.dev>
Subject: [PATCH 0/2] hid-asus: asus-wmi: refactor Ally suspend/resume
Date: Tue, 25 Feb 2025 21:17:42 +1300
Message-ID: <20250225081744.92841-1-luke@ljones.dev>
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

Luke D. Jones (2):
  hid-asus: check ROG Ally MCU version and warn
  platform/x86: asus-wmi: Refactor Ally suspend/resume

 drivers/hid/hid-asus.c                     | 101 ++++++++++++++++-
 drivers/platform/x86/asus-wmi.c            | 124 ++++++++++++++-------
 include/linux/platform_data/x86/asus-wmi.h |  15 +++
 3 files changed, 199 insertions(+), 41 deletions(-)

--
2.48.1

