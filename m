Return-Path: <linux-input+bounces-13968-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3916BB248C5
	for <lists+linux-input@lfdr.de>; Wed, 13 Aug 2025 13:48:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6E1E35A2AC1
	for <lists+linux-input@lfdr.de>; Wed, 13 Aug 2025 11:47:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F4DB2FA0FF;
	Wed, 13 Aug 2025 11:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PJBWw+G9"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B9CC2FA0F7
	for <linux-input@vger.kernel.org>; Wed, 13 Aug 2025 11:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755085626; cv=none; b=nzCtPaMaPgILXIDI0nJ5g4eM2hEW8S63r0rpm+O3/LsST2G1A+K2Rz3AQu6MK9f78M5LKyGt2jA+2HxbrmykJOdfHr9gWw8F2XeNAyFyfRZ3y4M0qBn9NW8AL9WTr9UIwRMsjceW83YDixDGmgMrxaaEgRQhEpN9AC9pybZkdII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755085626; c=relaxed/simple;
	bh=kV2lKnW1Lf0MttZfamQo9vY/gomEcOJ91hMvQ4BnLh0=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=sfSgtY9sQTDWLaG6rxjTE4yoResR9yQFpPAthDpjTziZ2ItlTKJRCe0JPqfC8eNTcUIzDz54KXK25NvqaX2oi4MX4LGxbukNO55hivWvZeNKTErqaidyERE+5hwkYElWSZd+r8sriXEW6IbKiljJ3cnkDSgxUHyrfs3RfVZhqjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PJBWw+G9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E590C4CEF5;
	Wed, 13 Aug 2025 11:47:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755085624;
	bh=kV2lKnW1Lf0MttZfamQo9vY/gomEcOJ91hMvQ4BnLh0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=PJBWw+G9VC0wqwZYbptGfJBFleKimQecL2u5jfS3veK1OTiuCMysZjvKtKc1T0DcU
	 bdWtLazHfh5ka6TZH6kwHyG2vwbTQfckhg5ludyS5k5x/BQ8j/aLcBWKNqEOKQ/wRN
	 wWCbM9o26U8C51bDDBThNU6gYJXAK0GjkOdXcwMDMGOrtQw7fG1X+Y7y3QTr/oRMaa
	 ILb+c4zt5wwWg+3POWiAFF0W2Utk0W8QmEiq1ZONYT6bWFw5600XBp83xiAHwtUoSK
	 /GiJ69spTXfCDyLAh/elnwAePp1buOTN78BwoRYqWR9EAm5UGmCux9Gg9NnVn44FmI
	 KHEEYPT+4z9Hw==
Date: Wed, 13 Aug 2025 13:47:02 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: =?ISO-8859-2?Q?Tomasz_Paku=B3a?= <tomasz.pakula.oficjalny@gmail.com>
cc: bentiss@kernel.org, oleg@makarenk.ooo, linux-input@vger.kernel.org
Subject: Re: [PATCH 09/17] HID: pidff: Update debug messages
In-Reply-To: <20250803181354.60034-10-tomasz.pakula.oficjalny@gmail.com>
Message-ID: <p1n92po0-341s-rp0q-p41n-76r92n9658p5@xreary.bet>
References: <20250803181354.60034-1-tomasz.pakula.oficjalny@gmail.com> <20250803181354.60034-10-tomasz.pakula.oficjalny@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Sun, 3 Aug 2025, Tomasz Paku=C5=82a wrote:

> Signed-off-by: Tomasz Paku=C5=82a <tomasz.pakula.oficjalny@gmail.com>
> ---
>  drivers/hid/usbhid/hid-pidff.c | 15 +++++++++++----
>  1 file changed, 11 insertions(+), 4 deletions(-)

At least some changelog (what motivates the update, how is this making=20
anything better?) would be nice here as well.

Thanks,

--=20
Jiri Kosina
SUSE Labs


