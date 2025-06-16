Return-Path: <linux-input+bounces-12916-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CA4DADA643
	for <lists+linux-input@lfdr.de>; Mon, 16 Jun 2025 04:18:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 36E21164D6A
	for <lists+linux-input@lfdr.de>; Mon, 16 Jun 2025 02:18:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EB5BBE65;
	Mon, 16 Jun 2025 02:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="YgTPvhJx"
X-Original-To: linux-input@vger.kernel.org
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 543A123A6
	for <linux-input@vger.kernel.org>; Mon, 16 Jun 2025 02:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750040286; cv=none; b=Eem3wZyAXXmJbv49wZziOKQ5nwWpptdvdfn7kPLEKBiIIYr80Dcry/SK7EnBj98mhuC+9J65le6KuHbJ9voeZ3TQnHpKBLE0/cSbIA3PNoMqv9m+o65rVXeb5rDeq0bl14En7konTZJDmi1I7NcanezNdoldJ2DDWZi6fMSBDxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750040286; c=relaxed/simple;
	bh=IVQwrjQoejLfIjUdNBbi0UVcGtHKBi/Nz1zhPsUbgwo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=amA0QA9RO9+JK16i7JA/sZMU5ohDLU25Y/F+337Vk1pXHeKMdZacCICJPf45+QoBFEShjbcCGeLDQLAqt84Hj9mFPg0GyKBE687InUePDrPu6iU25ERH/hPKMdnTdlUy2NZszutwhe1MvpZwTyvTEmkwGyBICgprJQ2xCSpiYIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=YgTPvhJx; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 55G2HdcjE3897086, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1750040259; bh=IVQwrjQoejLfIjUdNBbi0UVcGtHKBi/Nz1zhPsUbgwo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=YgTPvhJxhXKvj18ciAtyVFZ4k13atL1Uk1oyJ8fbQLSKSlqFSescEMw387OK38UGL
	 6W4dx/kvqFXDuZrmKfN1YfVO21iIGYQwEoRFCLV63MlXit2Mfj/iMIiskBi/C7/jUP
	 fOyTRjHtYfV0+dYjg2GgL1AvCI5ic579Z1mzVNW4HNXrGOGKOJRJgcF16dxPzpNq0C
	 v/JNNtieNTlxWsQmAMjOVlo45SK2iiAAmfk6BiSFl0RDKWWqnW8aKMXzGAOfqWcpdw
	 oCA290ymT7hAWhE5EFbhD/M2vD/GF0fYwaszKQROAeOWYw2fKFbd5bBfcH+gttfhzi
	 /toG3ms+AalDA==
Received: from mail.realtek.com (rtexh36505.realtek.com.tw[172.21.6.25])
	by rtits2.realtek.com.tw (8.15.2/3.13/5.93) with ESMTPS id 55G2HdcjE3897086
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 16 Jun 2025 10:17:39 +0800
Received: from RTEXMBS06.realtek.com.tw (172.21.6.99) by
 RTEXH36505.realtek.com.tw (172.21.6.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 16 Jun 2025 10:17:25 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXMBS06.realtek.com.tw (172.21.6.99) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 16 Jun 2025 10:17:25 +0800
Received: from RTEXMBS01.realtek.com.tw ([fe80::f5bd:6ac9:46d:9547]) by
 RTEXMBS01.realtek.com.tw ([fe80::f5bd:6ac9:46d:9547%5]) with mapi id
 15.01.2507.035; Mon, 16 Jun 2025 10:17:25 +0800
From: =?big5?B?U2h1bWluZyBbrVOu0bvKXQ==?= <shumingf@realtek.com>
To: Mark Brown <broonie@kernel.org>
CC: "jikos@kernel.org" <jikos@kernel.org>,
        "bentiss@kernel.org"
	<bentiss@kernel.org>,
        "linux-input@vger.kernel.org"
	<linux-input@vger.kernel.org>,
        "Flove(HsinFu)" <flove@realtek.com>,
        "Oder
 Chiou" <oder_chiou@realtek.com>, Jack Yu <jack.yu@realtek.com>,
        =?big5?B?RGVyZWsgW6TovHe4cV0=?= <derek.fang@realtek.com>,
        "ckeepax@opensource.cirrus.com" <ckeepax@opensource.cirrus.com>,
        "bard.liao@intel.com" <bard.liao@intel.com>
Subject: RE: [PATCH 2/3] HID: core: Add bus define for SoundWire bus
Thread-Topic: [PATCH 2/3] HID: core: Add bus define for SoundWire bus
Thread-Index: AQHb3Fgk5swCrzdC/Uq27XZE/O9NALQEisuw
Date: Mon, 16 Jun 2025 02:17:25 +0000
Message-ID: <9d09c040209c44a78552330dff255b5c@realtek.com>
References: <20250611102650.563137-1-shumingf@realtek.com>
 <b83b96db-b577-41db-8cf6-d7b3b75739b5@sirena.org.uk>
In-Reply-To: <b83b96db-b577-41db-8cf6-d7b3b75739b5@sirena.org.uk>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

PiA+IFNEQ0EgKFNvdW5kV2lyZSBEZXZpY2UgQ2xhc3MgZm9yIEF1ZGlvKSB1c2VzIEhJRCB0byBj
b252ZXkgaW5wdXQNCj4gPiBldmVudHMgZnJvbSBwZXJpcGhlcmFsIGRldmljZXMuIEFkZCBhIGJ1
cyBkZWZpbmUgZm9yIHRoZSBTb3VuZFdpcmUgYnVzDQo+ID4gdG8gcHJlcGFyZSBzdXBwb3J0IGZv
ciB0aGlzLg0KPiANCj4gUGF0Y2ggMyBkZXBlbmRzIG9uIHRoaXMgb25lIGFuZCBpdCBzZWVtcyBm
YWlybHkgc3RyYWlnaHRmb3J3YXJkIC0gaXQgc2VlbXMgbGlrZQ0KPiBpdCdkIG1ha2Ugc2Vuc2Ug
dG8gdGFrZSBpdCB0aHJvdWdoIHRoZSBBU29DIHRyZWU/DQoNCkFncmVlZC4gSSB3aWxsIHNlbmQg
dGhpcyBzZXJpZXMgdG8gdGhlIEFTb0MgdHJlZS4NCg==

