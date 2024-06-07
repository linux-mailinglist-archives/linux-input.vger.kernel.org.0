Return-Path: <linux-input+bounces-4189-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A4348FFA51
	for <lists+linux-input@lfdr.de>; Fri,  7 Jun 2024 06:05:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AEA491C22714
	for <lists+linux-input@lfdr.de>; Fri,  7 Jun 2024 04:05:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C9C211184;
	Fri,  7 Jun 2024 04:05:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b="EGAK9kQB";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="qveaYSAB"
X-Original-To: linux-input@vger.kernel.org
Received: from wfhigh6-smtp.messagingengine.com (wfhigh6-smtp.messagingengine.com [64.147.123.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D798714F90;
	Fri,  7 Jun 2024 04:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717733146; cv=none; b=B3Fct5Bc5stjqdRVTqGAUj4iveUKtxKZghlMRVQXcsW0djlmMsGOWzga93kpNvWNATEdJoTUNn6ZJxh5nPBXZ3RqxA1JkzaTtlICt5o15FgvX0Zmvdy6pEj+zYtNuY4/SvgSAbXG4R4epXKs99Q/vKN8d7mLafG4LktyWU0V0tY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717733146; c=relaxed/simple;
	bh=efz9/JYrJBpRgTo7Zp/WkBQ7rJq+Q6gpwT9dt3IzBeY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eUq75D9G7toQb+PIIVwomg24trMK2Qan0HIs+lGFMg3wJc7cpHx+iKYiJiRM/B+8LWDAt5FpFpoxzNbguA+Aryk9hyPdzmPD/2BOe5LbLel+/392cO83KQlQ7AydgXtBFGF+L3ql/bgpCOSEHpeR8gCbn9Ap8e4yjgz8/Bf0M0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev; spf=none smtp.mailfrom=ljones.dev; dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b=EGAK9kQB; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=qveaYSAB; arc=none smtp.client-ip=64.147.123.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ljones.dev
Received: from compute7.internal (compute7.nyi.internal [10.202.2.48])
	by mailfhigh.west.internal (Postfix) with ESMTP id BD11018000B4;
	Fri,  7 Jun 2024 00:05:42 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute7.internal (MEProxy); Fri, 07 Jun 2024 00:05:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ljones.dev; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm2; t=1717733142; x=1717819542; bh=4oB+kyg0b2Wdav/ClAUzK
	Dw2tnYfTAFZx6Y2yc0OHks=; b=EGAK9kQBUY4eg2bHc4oNAT/Rt0JB3BngxoAbV
	/TSeiTzaOFZmZP6dqDmzJwzvgCv0tLnY4Qz5ciSUXczCNCibwhi0lOQiqJfsU5K7
	TS6BBIb0mecE6Orka0dmkGFzMjpmuO+p3CyoWwp6h9FHN2gS6QJcZr7MVXA8gN9l
	uZ7McBoQP0JWenGHP/QycEryxV3P09a99Svuln140UySdPZAKEO8lYzqjuuTVkOt
	MWbwZlB37naf6h2jpI39mjIyYS+2NOL+DXM0/9b2XappxxT8lvxXxrzaYaeMsyRu
	/46U53ZM4ZMp47qOt2t0c6nTYSkmwgDCYcx3kMC3Bbtdt2D+A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1717733142; x=1717819542; bh=4oB+kyg0b2Wdav/ClAUzKDw2tnYf
	TAFZx6Y2yc0OHks=; b=qveaYSAB3PaFaBlVLEPJRHbyayAISDJqw8gT4fcSImyt
	c1muTLjkbouAPwygvPiSzNb9y/YDlY6Y6aIsCZVXgsO0LrGXsoVjpxhKl8NWVjZa
	QN/Mmt+vZ0M/Ih0H/CsI+4f0qjDFFyaYUIKAUKoKkMC17/QmKHnjXZC+uTkjZohl
	ZcAcSCqwXcvKUz8vy2PFk0cei+8V21frPe4itUf0xyEhiQjBpSYE7+65zT5OSp7m
	WlZeSKGtgOBYWzUYO1jXwPcm2Pwjne3H1NMVvTuTbqoe48umVqfEWSlHcqrPHEUj
	ZIH1F+S5svLC1gaY+6wav6mSoFj8cn/3VZBb6cWUAw==
X-ME-Sender: <xms:FodiZr86mhNojVHgJebBcbG1UPkyEl1WvFobEZyhX_pmqK-_4kZMYw>
    <xme:FodiZnu5fPs4RJI3z2_vn0K1voD_fkLIFWt1BvSkMzS_bZmgETJtgB4vMDznQwSYv
    Fh_5jmpQPFUt0a_SoM>
X-ME-Received: <xmr:FodiZpDTg8HSpH_Jf7X1hWIxBmdEc5dcooyqBWQ9cqAI30u846HAjyQiN1IN>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdelledgjeekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffoggfgsedtkeertd
    ertddtnecuhfhrohhmpedfnfhukhgvucffrdculfhonhgvshdfuceolhhukhgvsehljhho
    nhgvshdruggvvheqnecuggftrfgrthhtvghrnheptdehkeeigeeggfelkeeufeefjeduvd
    ejveduvdehtdegveeftdeugeetvdeltdejnecuffhomhgrihhnpehkvghrnhgvlhdrohhr
    ghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehluh
    hkvgeslhhjohhnvghsrdguvghv
X-ME-Proxy: <xmx:FodiZnfg1wKaUDJ9jDvz3T3vqQj-gyEE8_L7BcyLyeLPi0ninRrjbQ>
    <xmx:FodiZgNBjYURmWkqFDKJnDHNzfCM8YNB5lGBEAe5CW4xYeT0559mOQ>
    <xmx:FodiZpn8N88ZHpCgOCslNaRubbrT0gJyOau9TC-YmbPxFFjmr92sqA>
    <xmx:FodiZquUcYVrHHlQGqYc8rAVQOCzDuqE-BgmMxi7vgLx7-rjMkzQTQ>
    <xmx:FodiZtrtosVi1Pub_L7ABRyQma_QSAuVon8jiSr0Qxf7AtJfUv2BXlP9>
Feedback-ID: i5ec1447f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 7 Jun 2024 00:05:39 -0400 (EDT)
From: "Luke D. Jones" <luke@ljones.dev>
To: jikos@kernel.org
Cc: bentiss@kernel.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Luke D. Jones" <luke@ljones.dev>
Subject: [PATCH v2 0/1] hid-asus: use hid for keyboard brightness control
Date: Fri,  7 Jun 2024 16:05:31 +1200
Message-ID: <20240607040532.1074379-1-luke@ljones.dev>
X-Mailer: git-send-email 2.45.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Refactored V1 of patch to remove the report_id changing as it isn't required.

Changelog:
- V2
  - Split patch in two (use hid, and change report_id)
  - Drop the report_id changing as not required
  - Use dmi_check_system() for DMI matching

History:
- https://lore.kernel.org/linux-input/20240528013959.14661-1-luke@ljones.dev/T/#u

Luke D. Jones (1):
  hid-asus: use hid for brightness control on keyboard

 drivers/hid/hid-asus.c                     |  7 ++++
 drivers/platform/x86/asus-wmi.c            |  3 +-
 include/linux/platform_data/x86/asus-wmi.h | 45 ++++++++++++++++++++++
 3 files changed, 54 insertions(+), 1 deletion(-)

-- 
2.45.1


