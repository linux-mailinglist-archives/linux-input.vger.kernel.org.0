Return-Path: <linux-input+bounces-13610-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C55C5B0B9DF
	for <lists+linux-input@lfdr.de>; Mon, 21 Jul 2025 04:04:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8B72F18935D3
	for <lists+linux-input@lfdr.de>; Mon, 21 Jul 2025 02:04:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1315F13D246;
	Mon, 21 Jul 2025 02:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="FfsDjEKr"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-10630.protonmail.ch (mail-10630.protonmail.ch [79.135.106.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B6F5288AD;
	Mon, 21 Jul 2025 02:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753063440; cv=none; b=W6rs/rmEQjm9hvhgY9XyZBtYnyKTIz1W0MSQhpVWEi9CfH5Vasj2e7rkJm9Weapdd06zhJ/SELv7814XQKNX/rBhj21HBZXHRqXtL7dY6QT++B50poFN66dhm/q1rnwqruRTWqobsOvnfu3g7DK48gaxDxqYGN3bQIs+s6GRnAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753063440; c=relaxed/simple;
	bh=iIl5EyeM55qf/uAV/LYntoj/WlZGNA6grO46DUPqR3E=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=TESNAjf4DbDyi1q7uIlQ/I8BNWyZj6P8GjSSfqM0FAzlrq0rw06+NZl6fys3BdxYvrAv+2bGnhximm0l3pKaHPwnUxGHG5yvIEKSzU0jh8xZkqOrCRJ0tMZ4dbPZ11dxhkt+r51lNWRd+nN49ucOj11Vf/Dpgi4seZenBcmmHZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=FfsDjEKr; arc=none smtp.client-ip=79.135.106.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1753063432; x=1753322632;
	bh=q4ZGtcFD6ceObPLOKRJv6XuEnkjX0E7DbVfM453OPFY=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=FfsDjEKrKOMT1f1ZQWU0MV8FbqUyYZUdkAolGJzNdnULuZ6QTPomayO1c5E8hTE1Y
	 4iNOkxds8wXz3byd9xve4bDG7ySJkFfxwEPLqbhmvSPtyF9W5GSJd5/fW6SQ3nUguO
	 R1ZG8tklLMpQ9Nnk5eJABwlbWBYgfEPTHuRN2m6r85DLxVQM1N0BkAyOcZWt/2bLXB
	 rdhy6zKb/BqVCES4rUa/27VHTfwvZJGT2tRVnEYG34ltJCBmyFIRe3tnTqpVE0VfXZ
	 i9CT9nwvkNnPBVbP2u1F59MEwhyVTKv7/+5EauErro6gl8AHQGtTq2DbiAdkR5jUiy
	 C1jjI6h3CTvKA==
Date: Mon, 21 Jul 2025 02:03:45 +0000
To: linux-input@vger.kernel.org, rust-for-linux@vger.kernel.org
From: Rahul Rameshbabu <sergeantsagara@protonmail.com>
Cc: a.hindborg@kernel.org, alex.gaynor@gmail.com, aliceryhl@google.com, benjamin.tissoires@redhat.com, benno.lossin@proton.me, bjorn3_gh@protonmail.com, boqun.feng@gmail.com, dakr@kernel.org, db48x@db48x.net, gary@garyguo.net, jikos@kernel.org, ojeda@kernel.org, peter.hutterer@who-t.net, tmgross@umich.edu, Rahul Rameshbabu <sergeantsagara@protonmail.com>
Subject: [PATCH v3 0/3] Initial work for Rust abstraction for HID device driver development
Message-ID: <20250721020211.196394-2-sergeantsagara@protonmail.com>
Feedback-ID: 26003777:user:proton
X-Pm-Message-ID: eb05ed3d2a0a5ce9648888d56a0251307a9e9511
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hello again,

I incorporated Danilo's and Miguel's feedback from my v2. Additionally, I
noticed I had basic formatting issues when running scripts/checkpatch.pl.
I made sure to check the generated rustdocs and that the Rust examples
compile as part of the kunit infrastructure. I dropped the kref bindings
as they are no longer needed for this series.

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



