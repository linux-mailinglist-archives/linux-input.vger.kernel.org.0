Return-Path: <linux-input+bounces-13505-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 76F1FB032FA
	for <lists+linux-input@lfdr.de>; Sun, 13 Jul 2025 23:11:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C52C1176F45
	for <lists+linux-input@lfdr.de>; Sun, 13 Jul 2025 21:11:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 671652E36F9;
	Sun, 13 Jul 2025 21:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="Gz0KQTus"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A26161D6193
	for <linux-input@vger.kernel.org>; Sun, 13 Jul 2025 21:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752441092; cv=none; b=jB0GcptOIORXwb+IBMji7OFFLoGT0WM8RElQ5o6DFC9g8LVsxzkIkIlOg5mu7q+o1L8OSnX6cB463GTg1q60LwXoATuDY6aJrOR7PbGUNKMXODkxhj1ET08QiKj2JLXN3N0Os18v2NGk9L0HIsp4P17Iztpf+7jEF5KTuNip24M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752441092; c=relaxed/simple;
	bh=EBANmE8Tz5X2Y3eEDiLkuZ3rA3BG2whh4De4T84Wb4k=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Q/BGe5r9dhrQ4u4j/j307UGdm+WOlcCyqUcpbSXxtqC9eHXngDg1xCbQaU2vX7I9H1oMFa7TW0SPCnK7mZbn0ZmIhzePF42gBUeR1OAaXFcsCVerFhDeF6+N5f9YC4fbj/JybVu/njTeA6BTbm7IpULY+lMPz6uV8ygLxHloK6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=Gz0KQTus; arc=none smtp.client-ip=185.70.43.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1752441083; x=1752700283;
	bh=3pTokk4KJ2mKwd22kxH2uGEjSSthsLoaPeScCOi1nNI=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=Gz0KQTusA9C7PAMZptKnCf6od4qjmmZaPBZv+5gYVx0DduKTlqPbaY3MKJbWETfgz
	 v76KaWfbahXGvHwwNhGEmjlZnltKGvgSp3jAT9MShxUo45mYEWSRHYORAd00+Zfn24
	 Ms/Fc3q/LiI1OMtNp4wABC/7yyt8NB4oQ6iHcoZbXbxOsJi6MGP1Kb0zV+0HbEO0ET
	 8B+bOuaqBqo6KH5YHrB9bUKgtR9izuHDjgNoRF7iVP3z+ofj9qzDS7Yo9bRWcWBms3
	 rmFJY8TDmIUfLtQ8zJg9BzrzqK4wEaXZIJJOj1w7c35H4XbtQgvFiz+k5L3r8JZrjY
	 cYxxPuF6isJsA==
Date: Sun, 13 Jul 2025 21:11:17 +0000
To: rust-for-linux@vger.kernel.org, linux-input@vger.kernel.org
From: Rahul Rameshbabu <sergeantsagara@protonmail.com>
Cc: Jiri Kosina <jikos@kernel.org>, a.hindborg@kernel.org, alex.gaynor@gmail.com, aliceryhl@google.com, benno.lossin@proton.me, Benjamin Tissoires <benjamin.tissoires@redhat.com>, bjorn3_gh@protonmail.com, boqun.feng@gmail.com, dakr@kernel.org, db48x@db48x.net, gary@garyguo.net, ojeda@kernel.org, tmgross@umich.edu, peter.hutterer@who-t.net, Rahul Rameshbabu <sergeantsagara@protonmail.com>
Subject: [PATCH v2 0/4] Initial work for Rust abstraction for HID device driver development
Message-ID: <20250713211012.101476-4-sergeantsagara@protonmail.com>
Feedback-ID: 26003777:user:proton
X-Pm-Message-ID: f1ce38ddbfc13b7f430a916822e99508193e7a4f
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hello again,

I incorporated Danilo's and Peter's feedback from my v1. Additionally, I
implemented the AlwaysRefCounted trait for kernel::hid::Device and needed s=
ome
bindings from kref.

Link: https://lore.kernel.org/rust-for-linux/20250629045031.92358-2-sergean=
tsagara@protonmail.com/
Link: https://lore.kernel.org/rust-for-linux/20250313160220.6410-2-sergeant=
sagara@protonmail.com/
Link: https://binary-eater.github.io/tags/usb-monitor-control/

Rahul Rameshbabu (4):
  HID: core: Change hid_driver to use a const char* for name
  rust: add kref bindings
  rust: core abstractions for HID drivers
  rust: hid: Glorious Gaming PC Race Model O and O- mice reference
    driver

 MAINTAINERS                      |  15 +
 drivers/hid/Kconfig              |  16 ++
 drivers/hid/Makefile             |   1 +
 drivers/hid/hid-glorious.c       |   2 +
 drivers/hid/hid_glorious_rust.rs |  59 ++++
 include/linux/hid.h              |   2 +-
 rust/bindings/bindings_helper.h  |   3 +
 rust/helpers/helpers.c           |   1 +
 rust/helpers/kref.c              |  13 +
 rust/kernel/hid.rs               | 458 +++++++++++++++++++++++++++++++
 rust/kernel/lib.rs               |   2 +
 11 files changed, 571 insertions(+), 1 deletion(-)
 create mode 100644 drivers/hid/hid_glorious_rust.rs
 create mode 100644 rust/helpers/kref.c
 create mode 100644 rust/kernel/hid.rs


base-commit: 2009a2d5696944d85c34d75e691a6f3884e787c0
--=20
2.47.2



