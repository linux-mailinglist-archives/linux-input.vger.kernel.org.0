Return-Path: <linux-input+bounces-14803-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AE403B7C893
	for <lists+linux-input@lfdr.de>; Wed, 17 Sep 2025 14:05:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3D36B5880A8
	for <lists+linux-input@lfdr.de>; Wed, 17 Sep 2025 11:59:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62B213728AC;
	Wed, 17 Sep 2025 11:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="F9GvnpNG"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-24417.protonmail.ch (mail-24417.protonmail.ch [109.224.244.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 893D6371EBC;
	Wed, 17 Sep 2025 11:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758110371; cv=none; b=A5JK6Xx7qrT6NaDGJD38wMltAu9IovJ132voiYVOFIuCRaE6PSlkFADmqKyWy05Ibh+ySXcwReHtncvZ+AfbFWhTDz9lHQq5fvgUGlCc0OPptOefm6C1QQrch0yBr2lLfxUyRyl4SrwuQmcKrl8iUZQ2QG7MkvU33mdVL8Yjt4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758110371; c=relaxed/simple;
	bh=o9fgsweKF8PJgKSOc9c3OGlMDVuqLQuNlhUk/jq7D9o=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hSMeLvN7m5wKEE898tNttL01lzeWYSdoSePG+BHVXOZGHBslHDMpcEIfroIEhll2LQ9E33pEbx4RBGvt5Z4bE27atVBwVwvdiL6ks1MiCb+qMOHfVq9eSuJOK2wqm6Na16f3e62hdzIOmXa/YR41VWanNTPW+nqOzmpPo0JurNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=F9GvnpNG; arc=none smtp.client-ip=109.224.244.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1758110361; x=1758369561;
	bh=8G1gjeOhH6z3jjCnLYhJiil7bybWOrf0uRdC8hU2GC0=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=F9GvnpNG4Gt6Sebr4WS2hF9E2Jzupev462Q9GCTDLgm8G5bOfPCz1HQK9DaCpQJvf
	 YxEfOnaFzh6J2fXYCz371HliTSEGiaB5juDF/11mrAEvEONxHneitPHr8uYbvjCwlJ
	 7Oo+OKMCh8VxmeL9tESfGiPLlFYCOwZLvecntXNATyPPZGP9YhRh43dLfL4XOoLBAf
	 y2koRlmKQRyN8y3KRVEsxcud3Ymy/UGWIBtdpXqqvcUOvRB7lnxYvUbTMJWh7LhPPj
	 BgylIcza2DZTSB7W4Hp5tfOgBjxSloN+sFgkVe/L7zT+HwPGP8ctcLcIYIkEt7qZZt
	 Un6knHsfDjMsQ==
Date: Wed, 17 Sep 2025 11:59:14 +0000
To: Benjamin Tissoires <bentiss@kernel.org>
From: Rahul Rameshbabu <sergeantsagara@protonmail.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, Jiri Kosina <jikos@kernel.org>, a.hindborg@kernel.org, alex.gaynor@gmail.com, aliceryhl@google.com, bjorn3_gh@protonmail.com, boqun.feng@gmail.com, dakr@kernel.org, db48x@db48x.net, gary@garyguo.net, ojeda@kernel.org, tmgross@umich.edu, peter.hutterer@who-t.net, Benno Lossin <lossin@kernel.org>
Subject: Re: (subset) [PATCH v3 RESEND RESEND 0/3] Initial work for Rust abstraction for HID device driver development
Message-ID: <87segljnn7.fsf@protonmail.com>
In-Reply-To: <175810473311.3076338.14309101339951114135.b4-ty@kernel.org>
References: <20250913161222.3889-1-sergeantsagara@protonmail.com> <175810473311.3076338.14309101339951114135.b4-ty@kernel.org>
Feedback-ID: 26003777:user:proton
X-Pm-Message-ID: ff945701f6055e226f1457b6efdd478dc6562136
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wed, 17 Sep, 2025 12:25:33 +0200 "Benjamin Tissoires" <bentiss@kernel.or=
g> wrote:
> On Sat, 13 Sep 2025 16:12:43 +0000, Rahul Rameshbabu wrote:
>> I am doing another resend. Let me know if it makes sense to start sendin=
g out
>> work I have on top of these changes. I wanted to wait till these changes=
 got
>> merged first but maybe that is not the right strategy?
>>
>> https://lore.kernel.org/rust-for-linux/20250721020211.196394-2-sergeants=
agara@protonmail.com/
>>
>> I incorporated Danilo's and Miguel's feedback from my v2. Additionally, =
I
>> noticed I had basic formatting issues when running scripts/checkpatch.pl=
.
>> I made sure to check the generated rustdocs and that the Rust examples
>> compile as part of the kunit infrastructure. I dropped the kref bindings
>> as they are no longer needed for this series.
>>
>> [...]
>
> Applied to hid/hid.git (for-6.18/core), thanks!
>
> [1/3] HID: core: Change hid_driver to use a const char* for name
>       https://git.kernel.org/hid/hid/c/d1dd75c6500c
>

Thanks!

It will be nice not having to carry around that small cleanup patch.

-- Rahul Rameshbabu


