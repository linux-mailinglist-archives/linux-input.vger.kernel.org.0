Return-Path: <linux-input+bounces-11296-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A3F59A71533
	for <lists+linux-input@lfdr.de>; Wed, 26 Mar 2025 12:00:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9A38A7A5889
	for <lists+linux-input@lfdr.de>; Wed, 26 Mar 2025 10:59:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86D0B1A8F60;
	Wed, 26 Mar 2025 11:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dhqGxkjw"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59677BA50;
	Wed, 26 Mar 2025 11:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742986848; cv=none; b=VS5mXW1r3dQ3c6aoQI76KAnxHTBRBJ7KEZbOb9n7/WWf4T95K9iSypRie57CgSH23RGT/mwRKYsylJm/n27atjpgfKf7QUU4sYFVv+w/KZdmDqvaKHSHa9aKPumBAnnAOkCZ9MkZPWZQLs6W+e/Z9kqknP0Ubb6r4THrqWbX18g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742986848; c=relaxed/simple;
	bh=w5ZDeSrpmvoiPAO5YbWZhVqSkFMVenT7cq89xSyl3iE=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=JQHUrWBus9BmeNDS4KgkXRm7y71Q4A3UDnqiU1nQh7PO/DC1ShYF4TbfgJ1GTqUdQNPlCBTK9iea7JPbdJdNcoAofV0xucPBpiFJ1WVWOkun2yuakFagLWoAbo73SHDJ0aSW9j+oSYtw++6KvnR757T/5P5Gh63Wby3KyOhnNt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dhqGxkjw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D4FCC4CEE2;
	Wed, 26 Mar 2025 11:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742986847;
	bh=w5ZDeSrpmvoiPAO5YbWZhVqSkFMVenT7cq89xSyl3iE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=dhqGxkjwiExuPEr0Bgdsh/uea3lnohLdHmo0TBARQaeud4YiM9KI8tOcvqgUlhVNl
	 HYjrA+ZauGKfmLV5l2FN/D/vf/bux88e6pahHuNSu9vxGwXef0DNt0HOHJmR/SQDaj
	 lrGnaRPzB+qSzQ9ymHB6RhxZzLGItYxPTZsQSgIxFN18z1reKMa+oxqG/VeM4dJlUJ
	 CR6M02KNLO7TI/7pbmkwQm6Yae4t6TMTBpVeL6QolYAz6qSXJ07T3gOULd7dp2C29S
	 QStAnDLLGYDX/uCgyzwjyo1VxaVA2z+AIegcESVC1w2YHFBMZ5kb4rxHAlyoIXuFAs
	 I0P/4iuj3W5kg==
Date: Wed, 26 Mar 2025 12:00:45 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
cc: Antheas Kapenekakis <lkml@antheas.dev>, 
    platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>, 
    Benjamin Tissoires <bentiss@kernel.org>, 
    Corentin Chary <corentin.chary@gmail.com>, 
    "Luke D . Jones" <luke@ljones.dev>, Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v5 09/11] HID: asus: add basic RGB support
In-Reply-To: <43c4dd17-de34-804f-7080-b287ac4a0cac@linux.intel.com>
Message-ID: <26s13395-1ro2-37o8-01q5-6r4p09p69174@xreary.bet>
References: <20250325184601.10990-1-lkml@antheas.dev> <20250325184601.10990-10-lkml@antheas.dev> <f04e6a59-cb72-9ca9-2c98-85702b6194fa@linux.intel.com> <CAGwozwF8PZczpqOFm3ONDdJTVCgcWOZ8mXrASbmiAXUhQvOhdg@mail.gmail.com>
 <43c4dd17-de34-804f-7080-b287ac4a0cac@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Wed, 26 Mar 2025, Ilpo J=C3=A4rvinen wrote:

> You don't need to "pause" for the merge window, in some subsystem=20
> there's mandatory pause during merge window but I find that unnecessary.
> I know people on pdx86 do review during merge window so no need to wait=
=20
> when working with patches related to pdx86. Just don't expect patches=20
> get applied during the merge window or right after it (the latter tends t=
o=20
> be the most busiest time of cycle for me) :-).
>=20
> It's more about the frequency, how often to send a series which is=20
> relatively large. Large number of versions end up just filling inboxes=20
> (and patchwork's pending patches list) and we don't have time to read the=
m=20
> all through so I suggest waiting like 3 days at minimum between versions=
=20
> when the series is large or complex to give time to go through the series=
=2E
>=20
> This is not a hard rule, so if there are e.g. many significant changes,=
=20
> feel free to "violate" it in that case.

Exactly. I am unlikely to do much review during the merge window myself,=20
but I'll pick up the patchset and followup once the merge window is over,=
=20
so feel free to keep discussing and polishing it with me on CC :)

Thanks,

--=20
Jiri Kosina
SUSE Labs


