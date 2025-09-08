Return-Path: <linux-input+bounces-14550-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F7F2B49BF4
	for <lists+linux-input@lfdr.de>; Mon,  8 Sep 2025 23:30:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8AA751B27536
	for <lists+linux-input@lfdr.de>; Mon,  8 Sep 2025 21:30:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6263413A86C;
	Mon,  8 Sep 2025 21:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="h5Q03jf9"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-24417.protonmail.ch (mail-24417.protonmail.ch [109.224.244.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15E251F4191
	for <linux-input@vger.kernel.org>; Mon,  8 Sep 2025 21:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757367022; cv=none; b=icSUtfihqgO6Pmz+yZqyQyu7mJUhaE8N5GksibYtQkici1JocCbmWb9xZkw5hY4ieb4QOKG0HXy9DocYDWO2CbXSrP2aRTj5g5ixHbHteb2+SwIN1ccv1fHK79S30qXmYC+NCT8/FNVo8aYZuktf1QLrQJvTDB+5RX1RYfO0FkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757367022; c=relaxed/simple;
	bh=dOZx6Ii+vLzqab2+5Zuyh7uLYoLsMui4e7Gjgg9J5Rs=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qMr/ZW0KXPiBKGojU2ws5NFLXTHpMfF93dCRaAaYLVGylKu/mtoaMmRDAIlHfOR7OSFNiEuR0+q+P2TVQ/DA/RM9iySLt6V6Kqo+0NQlJhERhz1Jnd2xTNi2HjejlTE2Ed81IgMGXPjvR3Poz4gYSLnkY9GaU3vwfrh0IacI/iM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=h5Q03jf9; arc=none smtp.client-ip=109.224.244.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1757367011; x=1757626211;
	bh=Jf+GQ/Y7E80d5MojwTmsRrPCl65ft11Uy5VFxV/a1p0=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=h5Q03jf9LyRtnCkNegw2FKNsRYWK5mRJ++LMVz4Y49KND5w0C6XzbZtckwC978Uof
	 8UKPtTsWv15PxSQocF6PQIWie4IiDBhG/3AdgdI9Tjv3EmVbDdcZjXQi89kwkrgLZ9
	 L2EJEiNqtqDYpZZsIMPyTUnXpyYu/mQtC9+TBNzsJfpj1sPxYcSmqXvq2TA4L2SJNn
	 ztgGXAwcRfO+RNl+LRu+v7vF1Cw8rpID3WzztBy1yRDqoM2u6BwxM5trerv/9sbjPC
	 oN1LAzscJI04qT2oTnMkkYl/H4jJIwHinPPcEd4BbOmVhHap4ARCGrmEyz9vKnmgJ6
	 +ftD/zLJKYehA==
Date: Mon, 08 Sep 2025 21:30:07 +0000
To: Stuart <stuart.a.hayhurst@gmail.com>
From: Mavroudis Chatzilazaridis <mavchatz@protonmail.com>
Cc: jikos@kernel.org, linux-input@vger.kernel.org, benjamin.tissoires@redhat.com, hadess@hadess.net, lains@riseup.net
Subject: Re: [PATCH v4] HID: logitech-dj: Add support for a new lightspeed receiver iteration
Message-ID: <93bf9cfc-29ca-40e4-baef-47c5bd0e9cee@protonmail.com>
In-Reply-To: <CALTg27=uP+jCU7oog41GiZrw7LX_mSfrQtKbDW+xpAHzN7_6cQ@mail.gmail.com>
References: <20250902184128.4100275-1-mavchatz@protonmail.com> <CALTg27=fZ+_2b2AXmKk5UcZG_2-zm2XP3+xzbSUrWdahD7ShaA@mail.gmail.com> <20d3b05b-dbe0-4802-b724-fe4ab5e279d6@protonmail.com> <CALTg27=Q6a2yJK6y3MUSzngsbnpXhv6vwtS_Y-t0LaKg1kK7Ag@mail.gmail.com> <f92cda21-12d2-4e4d-ae84-666c6f8dce77@protonmail.com> <CALTg27=vaZK6ksriDDoN71pqr0VEbvxAz7Dp1w1toG+tO71Ldg@mail.gmail.com> <12899c24-a16f-4d64-bc40-a06b4c5c3e6f@protonmail.com> <CALTg27=uP+jCU7oog41GiZrw7LX_mSfrQtKbDW+xpAHzN7_6cQ@mail.gmail.com>
Feedback-ID: 20039310:user:proton
X-Pm-Message-ID: 8a24a104d758272f1a864bf30c2559a37471fe3e
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 04/09/2025 16.12, Stuart wrote:
>> Hm. It appears I may have misunderstood how this works. Please undo the
>> previous diff and apply the following on top instead:
>=20
> Done, still no change :(

Unfortunately I'm out of ideas for now. Looking at it again, I think the
first approach seemed more promising. Perhaps I missed something.

>> I think it happens when the devices paired to it disconnect/reconnect.
>=20
> Yep, that matches
>=20
>> Can you also dump the HID report descriptors when the keyboard is
>> plugged in directly via USB?
>=20
> Sure (046d:c343):
>=20
> 003:007:002:DESCRIPTOR         1756991366.823468
>  06 00 FF 09 01 A1 01 85 10 95 06 75 08 15 00 26
>  FF 00 09 01 81 00 09 01 91 00 C0 06 00 FF 09 02
>  A1 01 85 11 95 13 75 08 15 00 26 FF 00 09 02 81
>  00 09 02 91 00 C0
>=20
> 003:007:001:DESCRIPTOR         1756991366.827464
>  05 01 09 02 A1 01 85 02 09 01 A1 00 95 10 75 01
>  15 00 25 01 05 09 19 01 29 10 81 02 95 02 75 10
>  16 01 80 26 FF 7F 05 01 09 30 09 31 81 06 95 01
>  75 08 15 81 25 7F 09 38 81 06 95 01 05 0C 0A 38
>  02 81 06 C0 C0 05 0C 09 01 A1 01 85 03 95 02 75
>  10 15 01 26 FF 02 19 01 2A FF 02 81 00 C0 05 01
>  09 80 A1 01 85 04 95 01 75 02 15 01 25 03 09 82
>  09 81 09 83 81 00 75 06 81 03 C0
>=20
> 003:007:000:DESCRIPTOR         1756991366.831465
>  05 01 09 06 A1 01 05 07 19 E0 29 E7 15 00 25 01
>  75 01 95 08 81 02 95 05 05 08 19 01 29 05 91 02
>  95 01 75 03 91 03 95 70 75 01 05 07 19 04 29 73
>  81 02 95 05 19 87 29 8B 81 02 95 03 19 90 29 92
>  81 02 C0

I was hoping that would give me a clue, but unfortunately it did not.

I suspect simply sending the LED report to the receiver itself with
Report ID 1 is not enough, which is what the first diff does.

Perhaps you could try a packet capture with the Logitech provided driver
in a VM running a well known commercial operating system + usbmon on the
host to see what HID report actually gets sent.


