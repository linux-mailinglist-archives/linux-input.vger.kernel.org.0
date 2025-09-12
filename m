Return-Path: <linux-input+bounces-14667-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 92D02B55550
	for <lists+linux-input@lfdr.de>; Fri, 12 Sep 2025 19:05:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B4837AC42E6
	for <lists+linux-input@lfdr.de>; Fri, 12 Sep 2025 17:04:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA9E93112CF;
	Fri, 12 Sep 2025 17:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uiHOQnR6"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0C31258ED9;
	Fri, 12 Sep 2025 17:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757696684; cv=none; b=RnVBvp3MmI4OYEmUnUWVS/Z+X5PTx2DgSdtzZOlu03BWEJ3anhO7LX1y3QVFrD+INvLRJUD2a8O0wKjiU1DAQKoVNkOd8bsEoNFovHDc8y5taKl37nvwKpxqQMiUA/l9mQQvtq9/pYQPwY7KQq1/MWckBCNbtHfbe4EImtjXboo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757696684; c=relaxed/simple;
	bh=o/2riuH6Vl3CWoq2pt1e4/nCTOT1wbTb7SSUZSgH3Ig=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=riVNpRRQP2DFKefrCgM8NAX5CdQPWLtp9XfBWcecp1MQPFDPx2BvZQgwFuFiQDNgoWVaDAtQorOAaEeFFvSGWiZPMrPnrOGpV0eFUHWkd449g99S98LQQymC36s21ZuGpg0/H5aRDVOg1uAatLCdTt3EMhRTFTCCXaVmi3xdaoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uiHOQnR6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C772C4CEF1;
	Fri, 12 Sep 2025 17:04:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757696684;
	bh=o/2riuH6Vl3CWoq2pt1e4/nCTOT1wbTb7SSUZSgH3Ig=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uiHOQnR6jtwNSiM7Zgds4T97jwn0xtaOY0I9LZbHyMiOIHh1hJmzPUsrkoiZeTxia
	 UFwpINRFCpk+Ssgo9toZtf6Fdcn6sgDHaiUPp3Bsr9wR2UrLzbEI2zWSfGiGJqlESy
	 piJZqYUzM0CQXuvRN57AOUFvIQvxGgbzAZeauZ/dM7zR2uZH91PI3K4pLFHJuQz8b2
	 QjR3TC73StyV+07d1eP6cuiJoDZifFJOolBnwstZQAJ0MfXBq26x5qFXBgfhtH0ZuJ
	 7Rnv8fBMk2U+xhyJ3ulhbMngGGHULv15GVEKAT4MmOhvOEEGpopbkn0+TrP/SPsHET
	 pOCklBmRHASOA==
Date: Fri, 12 Sep 2025 19:04:39 +0200
From: Benjamin Tissoires <bentiss@kernel.org>
To: Jiri Kosina <jikos@kernel.org>
Cc: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, 
	Roderick Colenbrander <thunderbird2k@gmail.com>, Roderick Colenbrander <roderick.colenbrander@sony.com>, 
	Henrik Rydberg <rydberg@bitmath.org>, kernel@collabora.com, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 00/11] HID: playstation: Add support for audio jack
 handling on DualSense
Message-ID: <4yeyp7a2vn67qeclcn3kbzdaxltg4roct3wjvt4fsarjseuidf@zxzt6nftohtl>
References: <74d4675d-d6f5-41ed-b715-f62fb569df5d@collabora.com>
 <CAEc3jaAFV_PXdFAX9th4-hhKNAhBKdVCNP+Qf8nH=g8FwoCabQ@mail.gmail.com>
 <CAEc3jaAGP3HV_+tGLHWZXA-baD4HkA2nYWGxpmox4cuZMh+ksw@mail.gmail.com>
 <CAEc3jaD8tUNW6hkPHDp=iGmdwD5m3uKg0vNtyZr-u1mmPSAkVQ@mail.gmail.com>
 <ab1c06b1-9b79-426a-a43b-cf5a89688770@collabora.com>
 <CAEc3jaDsX8OSVskO6-Rsvn12BbV2-8ZjhV+tPaRpu9Nai3czEg@mail.gmail.com>
 <8f7242f0-c217-47e4-ad88-fc1481ca936f@collabora.com>
 <c6a16e71-e431-47dd-a3d1-6a79fd7e4a37@collabora.com>
 <r8qr0nrn-0n5r-6r96-7p26-q22ns73484np@xreary.bet>
 <s3tus6usbokl5hpwlbzbxfqdqwnyxqqnjiwhzdbd5obvfxavvf@cwopa6fpjctb>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <s3tus6usbokl5hpwlbzbxfqdqwnyxqqnjiwhzdbd5obvfxavvf@cwopa6fpjctb>

On Sep 12 2025, Benjamin Tissoires wrote:
> On Sep 12 2025, Jiri Kosina wrote:
> > On Wed, 27 Aug 2025, Cristian Ciocaltea wrote:
> > 
> > > It's been over a month now since this was kind of blocked without any clear
> > > reason, and by the end of next week I'll be on leave, which means we're
> > > close to missing the merge window once again.
> > > 
> > > Considering the counterpart quirk in the generic USB audio driver has been
> > > already merged since v6.17, I kindly ask for your support in getting this
> > > into v6.18.
> > 
> > Roderick, do you have any word on this, please?
> 
> If this can help moving forward:
> Patches 1-9 are:
> Reviewed-by: Benjamin Tissoires <bentiss@kernel.org>
> and can be merged right away

Also, to add a little bit more of confidence, I've just ran the
test_sony.py regression tests on the full series and no regressions have
been detected. (those will be run anyway after the series is accepted)

It would be nice to have new tests for this feature but I'm not sure
it'll be easy to add given that we are talking about new interaction
with other parts of the kernel.


Cheers,
Benjamin

