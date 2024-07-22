Return-Path: <linux-input+bounces-5119-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A0449392B7
	for <lists+linux-input@lfdr.de>; Mon, 22 Jul 2024 18:49:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 79A132817F4
	for <lists+linux-input@lfdr.de>; Mon, 22 Jul 2024 16:49:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CEAC16DC3B;
	Mon, 22 Jul 2024 16:49:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rGP1SUMh"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1268216DC0C;
	Mon, 22 Jul 2024 16:49:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721666947; cv=none; b=Ozk3+D+hqV679xPFic3SOAZi8nBTyXguBx2wVR6XXjikHDLgzIunL0etJ1FI9EjUPEzbLaHMKBomIv2cXhvKZvDH0NW+K+5phfuxGcfUJowr3eethKfAFRWScJKDw0AdJnjLm4MuB3hGe+ud7Endp2CaTvXK5T2ZWgSjMVl5n/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721666947; c=relaxed/simple;
	bh=lwT6yoa7LAGT+UOAWQREXS5bH6RNFTC3ASuLyDlr318=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aAF4MXAWKiIs1/WFc/cncz96+YSnmao28AVCij32SsJBgsPkj+DGEH3YdiTKcfOtFkOhCiF7on6z4HR4qkZw1eRXSyyS2pJzxQhKMel4/OrubFi7wLf9g0i8wJ1tA9MJp4AAQ2t0jN6TJGfZu00lJpgQHx4sS10AlNnE++4M3Jo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rGP1SUMh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29881C116B1;
	Mon, 22 Jul 2024 16:49:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721666946;
	bh=lwT6yoa7LAGT+UOAWQREXS5bH6RNFTC3ASuLyDlr318=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rGP1SUMhwkk5MC5W+Y7YWIa/lLnf7s2FXq+n4sOzdvqoqE30c1dLKmQ1cZ/5Fp16T
	 6I9Upt6ND6mvp9NNahairtLTS1MUNpoJga327+RW12jyqONZITGtokVdH1g7NemlXc
	 MtrNzLYZYGHJeNnMMqFhdRnDBoKx4r5CLCHESV0B33xhuNObfnLo+ge5buM0vDC/xU
	 y6JJDycZsduZco1PKCy8GxRvuaPpW2q0bHFYaJSTUPzCE6jzDlOJrVS6eJWFo5FOBA
	 SBP1Kacmk8D00kGNO6rZCIyGGGRUi8lsuTJ64HXQX7EEIJWkNXjmImq4s69y8BydJu
	 Zk5gi0jlXVFMw==
Date: Mon, 22 Jul 2024 18:49:02 +0200
From: Benjamin Tissoires <bentiss@kernel.org>
To: Max Staudt <max@enpas.org>
Cc: Roderick Colenbrander <thunderbird2k@gmail.com>, 
	Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <benjamin.tissoires@redhat.com>, 
	Roderick Colenbrander <roderick.colenbrander@sony.com>, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] hid-playstation: DS4: Update rumble and lightbar
 together
Message-ID: <rktgvill7zgcggiir54ixh3ele4zeqatoxwshamebtvvcnz4z5@nmmh5wgwnqmf>
References: <20240616163055.75174-1-max@enpas.org>
 <CAEc3jaCkH5JwNTpHRZYsekbwX+G6T5tMTLD0+O6E7Q2hqcAFHw@mail.gmail.com>
 <dedb2c39-fc28-4cba-802f-5d56f23db722@enpas.org>
 <CAEc3jaC-Tmd2XtK9H2sipBJAhCf16dMWx46r8Hs4p9At3LC_Jg@mail.gmail.com>
 <afda41dc-7b36-4ddd-abfc-c9430d8c9503@enpas.org>
 <CAEc3jaB7ijeXCUKOhpORx4Omf8edSmc1HKe9bk22V1mz=cLa+g@mail.gmail.com>
 <5b42961b-8ca6-4245-b16c-d703255e5aea@enpas.org>
 <bf096319-c44d-4bbf-bbcb-374d3cce0ca7@enpas.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bf096319-c44d-4bbf-bbcb-374d3cce0ca7@enpas.org>

On Jul 22 2024, Max Staudt wrote:
> On second thought, maybe we can sidestep this discussion entirely by using a
> new Kconfig to have both states configurable.
> 
> Something like:
> 
>   CONFIG_HID_PLAYSTATION_V6_6_ANDROID_TEST_COMPAT

Please don't. As explained in the other email, we don't care about
downstream, so we can not take these never ending ifdef.

> 
> Improvements such as my patch would be turned off when this flag is enabled,
> and the driver behaviour reverted to the v6.6 LTS behaviour. So Android
> kernels would enable it, and everyone else (especially desktop
> distributions) can leave it off.
> 
> Then, once the Android test suite is fixed, the Kconfig can be removed.
> Looking at the Android release cadence in recent years, and the timeline of
> DS4 support in hid-playstation and in the v6.6 LTS kernel, I presume this
> would be in 1-2 years.
> 
> This way, upstream can continue improving the driver, without triggering
> Android test failures.

Is there anyway to detect that the device can not support the current
behavior? And if so then dynamically switch to the new behaviour?

Cheers,
Benjamin

> 
> 
> How does this sound?
> 
> Max
> 

