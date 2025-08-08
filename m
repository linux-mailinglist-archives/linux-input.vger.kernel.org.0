Return-Path: <linux-input+bounces-13865-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 61E0DB1E1FE
	for <lists+linux-input@lfdr.de>; Fri,  8 Aug 2025 08:13:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2357E722823
	for <lists+linux-input@lfdr.de>; Fri,  8 Aug 2025 06:13:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 137A621FF4B;
	Fri,  8 Aug 2025 06:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="xQMWmw5o"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-0201.mail-europe.com (mail-0201.mail-europe.com [51.77.79.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EC561F8908;
	Fri,  8 Aug 2025 06:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.77.79.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754633616; cv=none; b=GdrCkFt/cf+K8NsxwjC5jYJQhtg62xgUzUOnyXOLZdwNWgzZbRmWkxzrCz0KNs9UgU+SzCug1wC2hB+GqjYUy9+tEr74buKM2zV+r1uCwj5/Aj9b7VA86ui00/3hoHgE1FFt4BQVgogGt3RrbQ3XHr2y++tmCmy+w59PKtosEyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754633616; c=relaxed/simple;
	bh=RW/+MXjPz9yw52dNq/b2NMwsPADNmlDo9sHa2L2vMnk=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=e85M/bHMk4Y0p2+upBELZ5yZuJYfAqlOUUM/QUdVEv0216Y2loTU/7wljqmcqbLqVx0egzhWwSCg0l8J8oyAd0/lri4mACNpi39wBxsnX+G7CM4NuxZfyA2aUeWnw2hkhA/4oJUR3LTxs5c4epNit4rjkNbn3HeJ+vwILpY+kKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=xQMWmw5o; arc=none smtp.client-ip=51.77.79.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1754633597; x=1754892797;
	bh=olI09SugawDKfJcQxlungsaydOwqngqlWT2xBUq9KWo=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=xQMWmw5oD5yUg0gtWkRaaem2NwYeycMerqcjY8hptVTVQJEYO3ZI6n3S0jTg+DUx5
	 0Rw0H5aRXH9Crux59haO6qwhilPTZc2QdR7PVUgxIQhsKxhsQeVZkSTifhf3U+5+zp
	 RSTShYz4r2Z1viWFzepr5bU34uaEwRj1JwFC7+qXQBA+PbmbEkP32taHOrkBq7zuNz
	 9s+hFBlTBAxSvDCFcSZzXhljYS8tnva/g42KldtK2zjsVPoIeV3ilO+nUxm1GBaQfr
	 pacSSXH/EWaLtrwEAaAZUFetCbs2DuijttTcSryWcUuAIZa0X3Yxm2uIrUiRizHHbt
	 EIkZM/xn5d7Qg==
Date: Fri, 08 Aug 2025 06:13:12 +0000
To: linux-input@vger.kernel.org, rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
From: Rahul Rameshbabu <sergeantsagara@protonmail.com>
Cc: Jiri Kosina <jikos@kernel.org>, a.hindborg@kernel.org, alex.gaynor@gmail.com, aliceryhl@google.com, benno.lossin@proton.me, Benjamin Tissoires <benjamin.tissoires@redhat.com>, bjorn3_gh@protonmail.com, boqun.feng@gmail.com, dakr@kernel.org, db48x@db48x.net, gary@garyguo.net, ojeda@kernel.org, tmgross@umich.edu, peter.hutterer@who-t.net, Rahul Rameshbabu <sergeantsagara@protonmail.com>
Subject: [PATCH v3 RESEND 0/3] Initial work for Rust abstraction for HID device driver development
Message-ID: <20250808061223.3770-1-sergeantsagara@protonmail.com>
Feedback-ID: 26003777:user:proton
X-Pm-Message-ID: e156a16662aa01983d000b3fda77faf3d833d929
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hello again,

Resending my patches for review.

https://lore.kernel.org/rust-for-linux/20250721020211.196394-2-sergeantsaga=
ra@protonmail.com/

I incorporated Danilo's and Miguel's feedback from my v2. Additionally, I
noticed I had basic formatting issues when running scripts/checkpatch.pl.
I made sure to check the generated rustdocs and that the Rust examples
compile as part of the kunit infrastructure. I dropped the kref bindings
as they are no longer needed for this series.

Link: https://lore.kernel.org/rust-for-linux/20250721020211.196394-2-sergea=
ntsagara@protonmail.com/
Link: https://lore.kernel.org/rust-for-linux/20250713211012.101476-4-sergea=
ntsagara@protonmail.com/
Link: https://lore.kernel.org/rust-for-linux/20250629045031.92358-2-sergean=
tsagara@protonmail.com/
Link: https://lore.kernel.org/rust-for-linux/20250313160220.6410-2-sergeant=
sagara@protonmail.com/
Link: https://binary-eater.github.io/tags/usb-monitor-control/

Rahul Rameshbabu (3):
  HID: core: Change hid_driver to use a const char* for name
  rust: core abstractions for HID drivers
  rust: hid: Glorious PC Gaming Race Model O and O- mice reference
    driver

 MAINTAINERS                      |  16 +
 drivers/hid/Kconfig              |  16 +
 drivers/hid/Makefile             |   1 +
 drivers/hid/hid-glorious.c       |   2 +
 drivers/hid/hid_glorious_rust.rs |  60 ++++
 include/linux/hid.h              |   2 +-
 rust/bindings/bindings_helper.h  |   3 +
 rust/kernel/hid.rs               | 503 +++++++++++++++++++++++++++++++
 rust/kernel/lib.rs               |   2 +
 9 files changed, 604 insertions(+), 1 deletion(-)
 create mode 100644 drivers/hid/hid_glorious_rust.rs
 create mode 100644 rust/kernel/hid.rs


base-commit: 1523590203786bf4e1d29b7d08a7100c783f20ba
--=20
2.47.2



