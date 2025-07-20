Return-Path: <linux-input+bounces-13605-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EB60B0B705
	for <lists+linux-input@lfdr.de>; Sun, 20 Jul 2025 18:44:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CC6D93B499E
	for <lists+linux-input@lfdr.de>; Sun, 20 Jul 2025 16:44:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A929218593;
	Sun, 20 Jul 2025 16:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="cBXI5JAW"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-10628.protonmail.ch (mail-10628.protonmail.ch [79.135.106.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFF1619E7F9
	for <linux-input@vger.kernel.org>; Sun, 20 Jul 2025 16:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753029873; cv=none; b=jatbuHSFGDObgVeFrm0ckdkgob5VJmoMREL4jVBtS4I2CqWl0u6i2GVHcC3KColAhcBobKIzF1l8Ech7RC3T7K2mtG+5tSLO+1nDgTvxTC4MjDBNjrxtlC6xbxPhSESVY6CUME99L8mrAsQXXmNGqZ7ECWyRqhJt7/d0RJOVIag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753029873; c=relaxed/simple;
	bh=qh+GvFzinSFnMqEm7gSFiBDrgcPsDhuxKpbQOeXxUo4=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gYpLOEBI/eyudxoucXuUsRY0DM9yz/qzAW7qHuoRSGDSBX11cFBJBP1hLAeyQ70knk7gGtALp1ui98MhbVo/hLeqYrlbSxczwEwut0dj7pE2328QsUXaSLbZcEgNrNsESztKWRuygeQ/xmMib4JZ17H7RrO2iAJL5t50XmmfnPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=cBXI5JAW; arc=none smtp.client-ip=79.135.106.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1753029869; x=1753289069;
	bh=IYED6AgoqeXMLSrrVNfUGjYtQksbwFsWBe298tj6Qug=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=cBXI5JAWd+XK7HGyhVFVIqvT3HNGyhd7dBHUYl0uLa9aEZZ+nj7mW/O/SXnTEr27w
	 20Vr6hDEQ/imsPea0wfvMm59DRUkYTSRo8pGVDnd9IyaY3En2EDRdCbMwlLr1WyrAc
	 zYjJuvvkLGikHirVic04RBr5N5R14HTKW+DIbmm2vY60oQxBNBL/fNznjE+KF36Hmb
	 5f4ZHFc5/wgjXFyf++3Jg9RjQ7ThULIRc3kP4GWRviTAKcMwGTDtVK6DP9cxK+iw5u
	 k1pe91j5gwqKQTatMunlK0HScp0exhDxEfUkLWgJcUSQg9MOZ0AkpEy/xr2F76GRek
	 RcXsDaiQ0++Iw==
Date: Sun, 20 Jul 2025 16:44:26 +0000
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
From: Rahul Rameshbabu <sergeantsagara@protonmail.com>
Cc: rust-for-linux@vger.kernel.org, linux-input@vger.kernel.org, Jiri Kosina <jikos@kernel.org>, a.hindborg@kernel.org, alex.gaynor@gmail.com, aliceryhl@google.com, benno.lossin@proton.me, Benjamin Tissoires <benjamin.tissoires@redhat.com>, bjorn3_gh@protonmail.com, boqun.feng@gmail.com, dakr@kernel.org, db48x@db48x.net, gary@garyguo.net, ojeda@kernel.org, tmgross@umich.edu, peter.hutterer@who-t.net
Subject: Re: [PATCH v2 3/4] rust: core abstractions for HID drivers
Message-ID: <87o6testga.fsf@protonmail.com>
In-Reply-To: <CANiq72m1itFYJgtyG02qnW1qyZU9UEo6OSLfzkXGesXNggxyBA@mail.gmail.com>
References: <20250713211012.101476-4-sergeantsagara@protonmail.com> <20250713211012.101476-10-sergeantsagara@protonmail.com> <CANiq72m1itFYJgtyG02qnW1qyZU9UEo6OSLfzkXGesXNggxyBA@mail.gmail.com>
Feedback-ID: 26003777:user:proton
X-Pm-Message-ID: 5f8b50a2c120dd1d8a3fb39812c3489d8a1d148d
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Sun, 13 Jul, 2025 23:57:38 +0200 "Miguel Ojeda" <miguel.ojeda.sandonis@g=
mail.com> wrote:
>> +    /// Returns the HID report group.
>> +    pub fn group(&self) -> u16 {
>> +        // SAFETY: `self.as_raw` is a valid pointer to a `struct hid_de=
vice`
>> +        unsafe { *self.as_raw() }.group
>> +    }
>
> Do you need to expose the group as a raw integer?
>
> Also, are these used currently?

Hi Miguel,

I originally did not expose the report group in the Rust bindings since
I did not make use of them. Benjamin has a preference access to them be
exposed in the initial bindings. I exposed this before implementing the
enum in a later revision. I agree that we should wrap this using the
enum now.

Thanks,
Rahul Rameshbabu


