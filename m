Return-Path: <linux-input+bounces-5020-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CA84930456
	for <lists+linux-input@lfdr.de>; Sat, 13 Jul 2024 09:48:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 06E7D2844A6
	for <lists+linux-input@lfdr.de>; Sat, 13 Jul 2024 07:48:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52E681F5FD;
	Sat, 13 Jul 2024 07:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b="lNfbOrpT";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ZwNSv+6s"
X-Original-To: linux-input@vger.kernel.org
Received: from fhigh5-smtp.messagingengine.com (fhigh5-smtp.messagingengine.com [103.168.172.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 687B9101D5;
	Sat, 13 Jul 2024 07:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720856877; cv=none; b=iWJ4mZN12DCr3DizaeSQQbQh9UmQB8XIqCl7Bp+nu08B2L15xPsenSpZWoGeQZQM7fowXkEok606nRT5aaqoTbD+SZCuHn4xMNzIXbe5F5XSG4lu04/LuKK+ISAyA6O5IzWgRuA7Wxh3KrP5W6SMWM3wFSywcgEBD/91Y2xc+4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720856877; c=relaxed/simple;
	bh=hClNeZXf/HT0BsbMx7fG9NUOdX2m7PgVo+dYXWa77SM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LcRjzluPPlID98+iWsAoZ+otgB3M3YBQ3Hh2vpDumJGhsMm1UVppqaYA4v0gdeLiotJX+hNUEjLVzPSBUQ3QGT2UwjnRZJalSpen7ptQTzbXBke7WekJIl1LqficsRlOtU0SGlv+q8iL4yKVjfEHau83qoH+JCQGZ6GFo7F8GmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev; spf=none smtp.mailfrom=ljones.dev; dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b=lNfbOrpT; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ZwNSv+6s; arc=none smtp.client-ip=103.168.172.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ljones.dev
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 67D071141FAA;
	Sat, 13 Jul 2024 03:47:54 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Sat, 13 Jul 2024 03:47:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ljones.dev; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm1; t=1720856874; x=1720943274; bh=HRQNq8s9JmqkZ0Ob0Og2B
	8lcbEhlLJEuplxADn3x+wQ=; b=lNfbOrpTXvsnO/pjDqVHw87b1/xD3Y4ju7B9n
	EYfKWk3VNmvAhiSmw7pkMoqB5ApSkpgRPTKF6KGspYlBQ+5SOSK8AyDcm2tPi0Vs
	vlYSKdTVQqiHxLxx2sjROqxSPku7lJjM9u2atoTgjJnDOvPa7O1YxY2M/DNlz8HM
	JRRtxw97wLC8Mkam6aOvZo+JmFE61D+HuTZ3G7HeSe1D1lOFrgrazh/rVptvnz0M
	j2+rLCdeaLJuPkeb0Pcga53ANnv/Ew8qPgbkT1j9jBD9ubdU2OPyzCMSYUKApwfp
	0K2PdPGgt2240LwYtGakSq0r9wiL1qhs51iouFvs13KMvtfrA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1720856874; x=1720943274; bh=HRQNq8s9JmqkZ0Ob0Og2B8lcbEhl
	LJEuplxADn3x+wQ=; b=ZwNSv+6swRik7OGQY1p6BotOO1vJSNrUfVoHEU1VII/8
	xtoGT0xmtmDHfWFBs7zBLwJqBsOWvbdrOOHSTvJQ87lajfxQ5++lSRX/nRLQvK2u
	4lmih+B+gi+1eUsj57m6eDK9vS19IQvCt5s0FtNJEnNGHo2mdFlPqn5uadXeWahE
	TB+E/fk9qZtwC3JQRVuwgkJD+tB0i/LUSbyWPTUWbckBsOgkEoRJJafa3YefMpjJ
	2YwYdHZHYzhgsiJDJCwz9B90IG8M1Fq2ISXoNb3kKjZFWeBJ2ASZ3ebnr3zAZkMf
	I3QmxEeniyllTy7MDIuECoooejvPsARBZzT5cFmuBw==
X-ME-Sender: <xms:KTGSZh7913t_iWSKSPIZGdWQHoSkHyZXN3VQ6UgNXhP44JyCYMBP9Q>
    <xme:KTGSZu7V_Wtm-kfgkxwmY868z_aXRJoMGQhf9m3lCzqH7I8o2rl7dXCGdq5vO_Gle
    c-2V1MRt_vLWY5kAss>
X-ME-Received: <xmr:KTGSZodCEJzdSGaEpRho8Jq4PlM-StCZJSBF2p6CLr75PP3HPuUazRmFi3f0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrfeejgdduvdehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffoggfgsedtkeertd
    ertddtnecuhfhrohhmpedfnfhukhgvucffrdculfhonhgvshdfuceolhhukhgvsehljhho
    nhgvshdruggvvheqnecuggftrfgrthhtvghrnheptdehkeeigeeggfelkeeufeefjeduvd
    ejveduvdehtdegveeftdeugeetvdeltdejnecuffhomhgrihhnpehkvghrnhgvlhdrohhr
    ghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehluh
    hkvgeslhhjohhnvghsrdguvghv
X-ME-Proxy: <xmx:KTGSZqIJCbok3RF6_D8yqVYkavYZ3iAbPus54OSgXPvI-PFxq6u0FQ>
    <xmx:KTGSZlJqHO6Kyzq77rV-YrxEzN6HFKzcpEBiH-So5Z68oyzdjHb25w>
    <xmx:KTGSZjyNHYr6cCrA3h4M2JjpfWg9CZXzFS5fqQDksa47uVPHxyvYOw>
    <xmx:KTGSZhKcZglb3_a5gQ8mxmVG4lKgfvM9DrctfvKPZJ8p_jYcNGgbgQ>
    <xmx:KjGSZs_agL3dzYdiarjRW-FTLHP46mR1mn1EXh96eNBdgK1Iryly2GKw>
Feedback-ID: i5ec1447f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 13 Jul 2024 03:47:49 -0400 (EDT)
From: "Luke D. Jones" <luke@ljones.dev>
To: platform-driver-x86@vger.kernel.org
Cc: corentin.chary@gmail.com,
	hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	linux-kernel@vger.kernel.org,
	jikos@kernel.org,
	bentiss@kernel.org,
	linux-input@vger.kernel.org,
	"Luke D. Jones" <luke@ljones.dev>
Subject: [PATCH v3 0/1] hid-asus: use hid for keyboard brightness control
Date: Sat, 13 Jul 2024 19:47:32 +1200
Message-ID: <20240713074733.77334-1-luke@ljones.dev>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Refactored V1 of patch to remove the report_id change as it isn't required.

Changelog:
- V3
  - Fix an issue with array initialisation
- V2
  - Split patch in two (use hid, and change report_id)
  - Drop the report_id changing as not required
  - Use dmi_check_system() for DMI matching

History:
- https://lore.kernel.org/linux-input/20240528013959.14661-1-luke@ljones.dev/T/#u

Luke D. Jones (1):
  hid-asus: use hid for brightness control on keyboard

 drivers/hid/hid-asus.c                     |  7 +++++
 drivers/platform/x86/asus-wmi.c            |  3 +-
 include/linux/platform_data/x86/asus-wmi.h | 36 ++++++++++++++++++++++
 3 files changed, 45 insertions(+), 1 deletion(-)

-- 
2.45.2


