Return-Path: <linux-input+bounces-14662-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 561EFB55486
	for <lists+linux-input@lfdr.de>; Fri, 12 Sep 2025 18:15:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D164417B7AA
	for <lists+linux-input@lfdr.de>; Fri, 12 Sep 2025 16:14:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 779BC3168EA;
	Fri, 12 Sep 2025 16:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eCtNvQzt"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DEA73164DC;
	Fri, 12 Sep 2025 16:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757693694; cv=none; b=i9YE6R7uCfD2/UZ3d2aG9bA8takl52AMzFZSEThXNomMKODlYewbdb2E0q3oR0Tac7ht2cCdRs+Xg0h/CkoKM19NiiFpXSzyvK9sKUknc8yX40xQ2LQYQTXJ8JenNZKQSYPiNt/xt5o1k32RpRanqEBA4dNZYmX5KW6kKrA6Zq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757693694; c=relaxed/simple;
	bh=apN7Uzrx30Vskl1nvqSzwHB00iLTqqOAeKmaDGKp/d4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GnywymrJHs5Vj+DGraY9ornnSkbBxdtq1NKHGdi/QvGmzH91HngUX9ifkNfAGdsA6aiSEQ+3XDj/E/rFrUcW0JbOtzQP5Yv65xIIDojpA3LWxDNoY7AFxoVnkqKj53ph+7z8MvqrGPZ3T2pWBxS8oCFy/IoJzWwCEeHAwHXA6vs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eCtNvQzt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27B84C4CEF1;
	Fri, 12 Sep 2025 16:14:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757693693;
	bh=apN7Uzrx30Vskl1nvqSzwHB00iLTqqOAeKmaDGKp/d4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eCtNvQztn9Dzg3IMUrjoWjTpNpfkMnjgSIgxmjmqRrcuvbe+zO2O0WfJVn93AWcif
	 AfJfrR91ft0gevSBETp1kC8pIiz38ot+d3VE+qLBEFjd0iESw4cfE7cKZjkhqvDY+8
	 p41ImxjnB/5VnG5MYicxKgJyObmd520w8J32USc2JILPPaUM6glRjJXJQMGVJSKL1w
	 uA5HgdvWK1we/YZV/iCqM9/TQexRh55YGsO5zmxsifDdc6roZfylIaI5VqwdRnFvnd
	 1D3YWlETgjUIu4Nkn94GmqbLZSLJ5mLF0BV/pJGsotomfkA/bllYbvmIJMhYA9j7Ll
	 Fja+zjyZ1SaMQ==
Date: Fri, 12 Sep 2025 18:14:49 +0200
From: Benjamin Tissoires <bentiss@kernel.org>
To: Jiri Kosina <jikos@kernel.org>
Cc: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, 
	Roderick Colenbrander <thunderbird2k@gmail.com>, Roderick Colenbrander <roderick.colenbrander@sony.com>, 
	Henrik Rydberg <rydberg@bitmath.org>, kernel@collabora.com, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 00/11] HID: playstation: Add support for audio jack
 handling on DualSense
Message-ID: <s3tus6usbokl5hpwlbzbxfqdqwnyxqqnjiwhzdbd5obvfxavvf@cwopa6fpjctb>
References: <s4596421-sr43-893r-o90r-86nr588sp32q@xreary.bet>
 <74d4675d-d6f5-41ed-b715-f62fb569df5d@collabora.com>
 <CAEc3jaAFV_PXdFAX9th4-hhKNAhBKdVCNP+Qf8nH=g8FwoCabQ@mail.gmail.com>
 <CAEc3jaAGP3HV_+tGLHWZXA-baD4HkA2nYWGxpmox4cuZMh+ksw@mail.gmail.com>
 <CAEc3jaD8tUNW6hkPHDp=iGmdwD5m3uKg0vNtyZr-u1mmPSAkVQ@mail.gmail.com>
 <ab1c06b1-9b79-426a-a43b-cf5a89688770@collabora.com>
 <CAEc3jaDsX8OSVskO6-Rsvn12BbV2-8ZjhV+tPaRpu9Nai3czEg@mail.gmail.com>
 <8f7242f0-c217-47e4-ad88-fc1481ca936f@collabora.com>
 <c6a16e71-e431-47dd-a3d1-6a79fd7e4a37@collabora.com>
 <r8qr0nrn-0n5r-6r96-7p26-q22ns73484np@xreary.bet>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <r8qr0nrn-0n5r-6r96-7p26-q22ns73484np@xreary.bet>

On Sep 12 2025, Jiri Kosina wrote:
> On Wed, 27 Aug 2025, Cristian Ciocaltea wrote:
> 
> > It's been over a month now since this was kind of blocked without any clear
> > reason, and by the end of next week I'll be on leave, which means we're
> > close to missing the merge window once again.
> > 
> > Considering the counterpart quirk in the generic USB audio driver has been
> > already merged since v6.17, I kindly ask for your support in getting this
> > into v6.18.
> 
> Roderick, do you have any word on this, please?

If this can help moving forward:
Patches 1-9 are:
Reviewed-by: Benjamin Tissoires <bentiss@kernel.org>
and can be merged right away

Cheers,
Benjamin

> 
> -- 
> Jiri Kosina
> SUSE Labs
> 

