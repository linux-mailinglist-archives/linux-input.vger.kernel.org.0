Return-Path: <linux-input+bounces-12778-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A579AD42E5
	for <lists+linux-input@lfdr.de>; Tue, 10 Jun 2025 21:29:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2BE8C163B34
	for <lists+linux-input@lfdr.de>; Tue, 10 Jun 2025 19:29:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF5942620F1;
	Tue, 10 Jun 2025 19:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hcmHPabQ"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B68AE2F2F;
	Tue, 10 Jun 2025 19:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749583781; cv=none; b=c+SKbcqWFl28G6UWn+y72HOIX+YexF+4hN9lt5B4nkUc7bWEK5V8yAJvHYiOM5nh64W99Sxs0mxdfzMJ4AM04iR5LclFK1MWeQ0EoZCiGH/BKl+QO3cwx6POL929BYUuqli3daOb/HuaeZ9taF/tSMVWe+sS4Pn5+xKfEQOl2xs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749583781; c=relaxed/simple;
	bh=2qXomGps+wD1Ybpiwg/uCGOYalSFX3fQkhdN1D3yszk=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=N4VwfAWTCqMU1IqaKA6kYNsDHGLIUlCU4Z4qzyyYoBWXyLVN47MlDPzEZm67Y1X9veU7Kv3mEkQ1FuilfRR/fopijn8bhPEZ1oWXeg+obvpDzcnP+8tOPZdMLKwKbJ8CXG3IWkVdt4/p0HKe9Ux40w/StJ8nQF7EHHapyGvTexg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hcmHPabQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7616C4CEED;
	Tue, 10 Jun 2025 19:29:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749583781;
	bh=2qXomGps+wD1Ybpiwg/uCGOYalSFX3fQkhdN1D3yszk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=hcmHPabQpWjUyLz+nqKlwfKWZBZ5RS6rC6lio0FSrYk9uu1DORt6RsBssevvT3xOq
	 DbWFI1dMG5D9FErQNFfPZHY9pTK5uhux2bO2Uur2ZoFMQfhdrRIPHIWDaTi0w8bdNU
	 8BSang9hGpRXMYn/CfX8kaTHp7+Rw6dkH0Am7gfQgwg7y1m5nZQxEtSJbojy/QdOzY
	 VHW3MCJIL4D2RjpP7tEpNhdb9PE3AyQM6ewhCxUkoNKBdnefNJ3Jl6DN+kcNPYV8XL
	 uSk+rDGKRQP3PUUcr2nJUWxwI45orGn7E2jrmrqPr5X//+eB+LSeECRvK3UNJohCJ2
	 v1YMF9QJkSmGw==
Date: Tue, 10 Jun 2025 21:29:38 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: =?ISO-8859-2?Q?Tomasz_Paku=B3a?= <tomasz.pakula.oficjalny@gmail.com>
cc: bentiss@kernel.org, oleg@makarenk.ooo, linux-input@vger.kernel.org, 
    linux-usb@vger.kernel.org
Subject: Re: [PATCH v2 00/11] HID: pidff: checkpatch fixes
In-Reply-To: <20250524174724.1379440-1-tomasz.pakula.oficjalny@gmail.com>
Message-ID: <57084nn1-q930-5p4r-r2s4-sr7s7109494q@xreary.bet>
References: <20250524174724.1379440-1-tomasz.pakula.oficjalny@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Sat, 24 May 2025, Tomasz Paku=C5=82a wrote:

> Fixes warning and errors from checkpatch script.
> Also fixes the define name for LITE_STAR_GT987
>=20
> Would be great if this could still somehow make it into 6.15

Sorry, that didn't work, I was overly busy over the past few weeks.

On the other hand, I don't really think there is any imminent need to rush=
=20
this in, as there are no functional fixes.

Now queued in hid.git#for-6.17/pidff.

Thanks,

--=20
Jiri Kosina
SUSE Labs


