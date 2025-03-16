Return-Path: <linux-input+bounces-10863-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 87338A63353
	for <lists+linux-input@lfdr.de>; Sun, 16 Mar 2025 03:20:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0184A7A71BC
	for <lists+linux-input@lfdr.de>; Sun, 16 Mar 2025 02:19:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F88A5672;
	Sun, 16 Mar 2025 02:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="K3Mx80VS"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1F08322A;
	Sun, 16 Mar 2025 02:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742091652; cv=none; b=R+Tfpd38Ykouadg/WK9+fdQakjHneF/lmHPMiHyj7UDfBzhHUEHvI4TadwCVY91n4txXzr4fol6hne2spcxiuVYT/+MdnlKm2wLq2I/k4zusgWDzu60GRu3UM0/nko9gwPlj2oQ2Bz7zR2EBtlb4snL7Qra3VehDzf8N5r9KTM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742091652; c=relaxed/simple;
	bh=KkBO96VC2Ajl9ONruM05l7E3RGo1jmxFIu3LiHOqDxY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=O5g/dvw12xIDF7VwIVfHdixfkU4BpVpVx+8Ap26PPWz9xvJaeyG27qq3nonGZN47MIrEZp+K/vNsdQICiyHR+rQ2uGp0Zd9f/kfdPGngt8azqbHueDa9e7gODnFm992ntv1GHXz9m0wZau57Pxr8fSdFChDvfYplhPA4+wstl4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=K3Mx80VS; arc=none smtp.client-ip=185.70.43.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1742091648; x=1742350848;
	bh=KkBO96VC2Ajl9ONruM05l7E3RGo1jmxFIu3LiHOqDxY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=K3Mx80VSnZPWn0drq3jeNdrbw4DjDTQ8f4VrtBAJ3PfAjR9jqmAfvdTM6XJ5JdW3j
	 M+0+jhfXdk7Bxi0o/6VYStF/hCnPXMvZgM1ORyCoyHVQexdiZAkhDNwvYrvw4dHZBz
	 aMHadawZKTcEtI7vEMZuMHSbxWdJxvkBl+QCI0PliIVNASW61kTxYif8GXgHBVrDbe
	 jzSAx7WqQNST1c+bkPeqCJtIa4HwykRjcrulHzh7P3lQiFhVTCKCPkn51yxFmZqAGz
	 zBM4SazogYEGa0i1Y0PcFvAUnNxKNidoEPLi2fxxidEH/oieES5BxN58PKc0P5TQ/V
	 6tiTqk72KOCVg==
Date: Sun, 16 Mar 2025 02:20:44 +0000
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
From: Rahul Rameshbabu <sergeantsagara@protonmail.com>
Cc: Benjamin Tissoires <bentiss@kernel.org>, linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, linux-input@vger.kernel.org, dri-devel@lists.freedesktop.org, Jiri Kosina <jikos@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Julius Zint <julius@zint.sh>
Subject: Re: [PATCH RFC 2/3] rust: hid: USB Monitor Control Class driver
Message-ID: <87msdlhg2a.fsf@protonmail.com>
In-Reply-To: <CANiq72njsmokSeQG=nzRDUUmYHnpRCGNwWJ1ZXj_khxXwrZxEQ@mail.gmail.com>
References: <20250313160220.6410-2-sergeantsagara@protonmail.com> <20250313160220.6410-5-sergeantsagara@protonmail.com> <7ajr2aukrd7bdnns34ur7d37xk4aibaqsjyuoc334uiclay3yt@qiym6ju2kn3c> <CANiq72njsmokSeQG=nzRDUUmYHnpRCGNwWJ1ZXj_khxXwrZxEQ@mail.gmail.com>
Feedback-ID: 26003777:user:proton
X-Pm-Message-ID: 3b508d8e81a47104014adc6c6acf04d2783efd94
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Fri, 14 Mar, 2025 15:41:02 +0100 "Miguel Ojeda" <miguel.ojeda.sandonis@g=
mail.com> wrote:
> On Thu, Mar 13, 2025 at 5:58=E2=80=AFPM Benjamin Tissoires <bentiss@kerne=
l.org> wrote:
>>
>> skeletons are good for documentation, but not really for code review as
>> they can not compile.
>>
>> You should make this patch part of a documentation in
>> Documentation/hid/, and squash it with the next one (having a minimal
>> full driver instead of skeleton+fill in the voids).
>
> It could be part of the documentation of the `module_hid_driver!` for
> instance, like we have done for other of those macros.
>
> (In general, we try to use `Documentation/` for things that do not fit
> as documentation for any of the code "items".)
>
> Cheers,
> Miguel

In general, I will add a lot more documentation in my next revision. For
example, I have a bunch of unsafe usage right now without any SAFETY
comments.

Thanks for the review,
Rahul Rameshbabu


