Return-Path: <linux-input+bounces-11955-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A6CCA9A7A8
	for <lists+linux-input@lfdr.de>; Thu, 24 Apr 2025 11:27:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 60F54443BE1
	for <lists+linux-input@lfdr.de>; Thu, 24 Apr 2025 09:27:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D024F215160;
	Thu, 24 Apr 2025 09:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sxQ/mh6M"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A67C133DF;
	Thu, 24 Apr 2025 09:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745486827; cv=none; b=GPsogRZPPg08jq7v6Uo3BeZbw/+bk2zwl95nyD5UnvotQ6cApFppEziDPuaBHO0fcc9IuJLYj3FcPyVMUr0cFJEW7vEeAxLjWtq873yN3Y2iZV9mTxwQDvaUkMALfp89qSVurpYCJCNgI0jf5XYPgyLHJgXVeYeMyAGCdCHPb0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745486827; c=relaxed/simple;
	bh=9VACCciYrYkXIhWtLX+mvujdaW6/q9C2OdTaob6ffwU=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=eXOun7saGhWbgtSc7LJuDWuKjlrreAX1rWP0BxIsk7MjT7NKxS7XQn+RKQ0hYybdVt4l5+5ZZoayh3V3JOVHuNa04EKAzgwVdJEFS5sDRpg5quqeL6pu32Kna1Ws7ce8nBRe7yOvoIn9capL2IcYl/1ccmYWHH7+HTsH/JYVEH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sxQ/mh6M; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A114BC4CEE3;
	Thu, 24 Apr 2025 09:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745486827;
	bh=9VACCciYrYkXIhWtLX+mvujdaW6/q9C2OdTaob6ffwU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=sxQ/mh6Mo2utIw/+VD8RDyoMbcKK/ymas3A+u3kRlnfSs0d1G02ITHmaH6CEO3NUQ
	 XDedq93lyreymmR/BbDFiDZCGUGU1IIpuhejgbBfVgh/hnNVczkmLKMfdAyiMB92Ey
	 bBlZHulDqjFllZO3OWXO8CVLt5D5RWALaYzNIag2BJvNb5NmDl/109VRdbzqFRDTkK
	 ddMu75xRAiaNxE/6cO4Dc7vRVOjNnp0cpAjvdNB2nRyCSIiaO7YDiP0KZIYLFZwZ+e
	 xALg+afSeUJdHYIRNp90ysm+sypZyIN5o43BAgd+QigUumE0EW9e3qQzbGUXK2Gg0I
	 lJAmZAujNoJjg==
Date: Thu, 24 Apr 2025 11:27:04 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Denis Benato <benato.denis96@gmail.com>, 
    Basavaraj Natikar <basavaraj.natikar@amd.com>
cc: Benjamin Tissoires <bentiss@kernel.org>, "Luke D. Jones" <luke@ljones.dev>, 
    Ivan Dovgal <iv.dovg@gmail.com>, Adrian Freund <adrian@freund.io>, 
    linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/1] HID: amd_sfh: Add support for tablet mode
In-Reply-To: <20250309194934.1759953-1-benato.denis96@gmail.com>
Message-ID: <19norq05-rp74-9qrr-382r-40q9r59p1pnn@xreary.bet>
References: <20250309194934.1759953-1-benato.denis96@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sun, 9 Mar 2025, Denis Benato wrote:

> Recently there has been a renewed interest in this patch: ASUS has launched a new z13 model
> and many more users requested tablet mode support for previous models.
> 
> I have made required adjustments to apply cleanly on top of linux-next:
> nothing substantial, a macro has been changed from 5 to 6 upstream as
> the previous patch also did and a few line changed their position.
> 
> Given there were no functional changes at all I took
> the liberty to retain previous tags.
> 
> Denis Benato (1):
>   HID: amd_sfh: Add support for tablet mode switch sensors
> 
>  drivers/hid/amd-sfh-hid/amd_sfh_client.c      |  2 ++
>  drivers/hid/amd-sfh-hid/amd_sfh_pcie.c        |  4 +++
>  drivers/hid/amd-sfh-hid/amd_sfh_pcie.h        |  1 +
>  .../hid_descriptor/amd_sfh_hid_desc.c         | 27 +++++++++++++++++++
>  .../hid_descriptor/amd_sfh_hid_desc.h         |  8 ++++++
>  .../hid_descriptor/amd_sfh_hid_report_desc.h  | 20 ++++++++++++++
>  6 files changed, 62 insertions(+)

Basavaraj, could you please provide your Acked-by/Reviewed-by: for this 
(or any other sort of feedback)?

Thanks,

-- 
Jiri Kosina
SUSE Labs


