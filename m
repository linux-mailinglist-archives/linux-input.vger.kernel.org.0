Return-Path: <linux-input+bounces-14763-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B5F0EB598F3
	for <lists+linux-input@lfdr.de>; Tue, 16 Sep 2025 16:11:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7188C5211D3
	for <lists+linux-input@lfdr.de>; Tue, 16 Sep 2025 14:09:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 781911EA7C9;
	Tue, 16 Sep 2025 14:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="Iiv8Wr6J"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-24418.protonmail.ch (mail-24418.protonmail.ch [109.224.244.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DF621078F
	for <linux-input@vger.kernel.org>; Tue, 16 Sep 2025 14:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758031555; cv=none; b=V9O9AkzLIAMfiNLk7gigGwvJR/XOMTBMigbeHE5+iJ6+vu+flMMza7Y9VfRtaXLoNnvB+XPyT1mhWMNyr7Id/LXTJhWEAiVTHtL7soY2k1lcw2gqfFzUfBylmSeC7IrhmhqIY45TLdmHYbBrCIqyAVpPr0CkVSh9wkPsuPAk3e4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758031555; c=relaxed/simple;
	bh=Ixs3zqxwvhBoquOWZBAZq9H7U+yTV1SqSDMf8FreR/M=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=vEGoiMfnsYnTkxAQfB5ufklBlqojBWQ39iLpnUeWGECOH58VCNxgaWu9VG4l712W4w2Zmahtd3E57t2Qjj3zStHuMGLG3UCCVLqnsiwp9Exsism31bd7NDVlfaE5Nq+DNGFkgdpppGhEv6MLPM4pm3XP2sXwCoU7w3+gtN2SUO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=Iiv8Wr6J; arc=none smtp.client-ip=109.224.244.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1758031545; x=1758290745;
	bh=Ixs3zqxwvhBoquOWZBAZq9H7U+yTV1SqSDMf8FreR/M=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=Iiv8Wr6JPIRczq5zr9uOdEVSN5U+RTNHnV4vgeYPhIdSXoxgSDALs9zs0SjZCJEKC
	 73MtagMcVMsjFkOoYruPoLRZMjasfK5L8S4vdDeEPPpLIMjqkA9bIkeyJNv2U06R7n
	 LInr+QSp1dNhKn1ORKxpTUy5U35/i9UoB9Lr9b1x4o7/IrQWjds/v8HYiXH707aT2z
	 tLvA4Qzr46HQOYt1+TTtBW04o0TJOy7dC8WgSI/yXMOd0pbKkGioq3/Pu95MD3xgU0
	 lBdKsIlLkuVbaR4H0DfpVHxVa9Wlm0wgdeWpWW6fIsPfXIXxZGmVF0e8WAGYsl3kXw
	 YZkzjOfmG3aVw==
Date: Tue, 16 Sep 2025 14:05:42 +0000
To: Stuart <stuart.a.hayhurst@gmail.com>
From: Mavroudis Chatzilazaridis <mavchatz@protonmail.com>
Cc: jikos@kernel.org, linux-input@vger.kernel.org, hadess@hadess.net, lains@riseup.net, benjamin.tissoires@redhat.com
Subject: Re: [PATCH v4] HID: logitech-dj: Add support for a new lightspeed receiver iteration
Message-ID: <848a3c8d-5f0b-409c-b394-1cce6a4c1e62@protonmail.com>
In-Reply-To: <CALTg27kat6CReAvU8nXsVzqKEtzytT+_wf9dZ07OFSke=ipYLQ@mail.gmail.com>
References: <20250902184128.4100275-1-mavchatz@protonmail.com> <12899c24-a16f-4d64-bc40-a06b4c5c3e6f@protonmail.com> <CALTg27=uP+jCU7oog41GiZrw7LX_mSfrQtKbDW+xpAHzN7_6cQ@mail.gmail.com> <93bf9cfc-29ca-40e4-baef-47c5bd0e9cee@protonmail.com> <CALTg27mj+XcOmnMcH8vo5Bos+HxoWes-XW1eqfKDjnj5uqCc5w@mail.gmail.com> <cc2e6e2d-1b42-444a-9f8e-153fa898be44@protonmail.com> <CALTg27mH1rzyaNXEq7SowZcVYMiWUgejQCFgdDCHACUm9j+3SQ@mail.gmail.com> <7a4c4678-bb75-4aa7-8f4f-706deba7e72b@protonmail.com> <CALTg27kat6CReAvU8nXsVzqKEtzytT+_wf9dZ07OFSke=ipYLQ@mail.gmail.com>
Feedback-ID: 20039310:user:proton
X-Pm-Message-ID: a8e55ebffef24890596d8d0508d1418c577f2866
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 2025-09-16 15:30, Stuart wrote:
>> Can you also try the following on top of v4?
>=20
> Working just as well as the previous patch, compiled on top of the
> latest hid.git

Great!

>> Please test this one thoroughly (modifiers, lock keys, ISO backslash/
>> Intl keys) as I've modified the keyboard report descriptor.
>=20
> Tested every key and alternate key shown, modifier keys, function keys,
> media keys, lock keys. All working, including the battery reporting.
> I don't really know what you mean by ISO backslash or international keys,
> but the backslash on my UK layout works just fine.

Yes, the UK slash key is what I had in mind. It is only present on ISO
layout keyboards, the UK layout being ISO. I wasn't sure what layout
your keyboard was.

>> If this works as well, I will submit a v5, and you can send a Tested-by
>> on that one.
>=20
> Sure
>=20
> I'm heading back to uni in a few days, so I might not be able to test
> revisions as quickly, but I'm still happy to test anything that's require=
d.

Thanks a lot, I appreciate all the help. Good luck with your studies!

>=20
> Thanks,
> Stuart




