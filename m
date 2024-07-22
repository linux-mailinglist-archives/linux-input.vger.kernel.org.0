Return-Path: <linux-input+bounces-5118-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 563319392B5
	for <lists+linux-input@lfdr.de>; Mon, 22 Jul 2024 18:46:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DEC18B21D75
	for <lists+linux-input@lfdr.de>; Mon, 22 Jul 2024 16:46:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F0EF16DC3B;
	Mon, 22 Jul 2024 16:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o+SaYC96"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 570AB16DC0C;
	Mon, 22 Jul 2024 16:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721666797; cv=none; b=UR4r8D7k4qwiZrlUwM5Iqs9QFv3NdgLHhickZiZNCrM+p9yZkNRGQuyBQl+YnKsGYDGYHLT0SRch93PVKM3Iavso7pz/v9V9fH8UVKQpKk4LjSAXoBxNT4GDPL5EKJyRZGtvq3beLOBFydndd7gBz4k2Jc2kvrlpDox7MIm5XpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721666797; c=relaxed/simple;
	bh=rjcrEEtcXwXyHhqYVN5lI0ecjsvaW2zSIiDc/gTcPfI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YHG4esnxcJ3J6ItK68c8QroQsUDeR7cqUfWvmvwg3e5C+l24RpL0Z8BunU9S+8Wjq1j09hyAwCD42ZXpP6zmVgH8rFDAofRZ/Ue9FUHSX2nGHWwsln4cjECyO+s/TYdVAOMRN+kiNv8WSjQJF5ZjlL+viN7vn2VZqnnkIrLbuTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o+SaYC96; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1ECECC116B1;
	Mon, 22 Jul 2024 16:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721666796;
	bh=rjcrEEtcXwXyHhqYVN5lI0ecjsvaW2zSIiDc/gTcPfI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=o+SaYC96QBviGLQj8+NaRhqSgmPBfhI9KgDXp9p1WD0HfLAztz671XH8Xt3oy/D7m
	 PcoHJLIh0fIqDrFLi58yhleS4B0gImZbUjfeMoJJG0sRHP7l7m7wFRZbhIjfY15ncg
	 caF6krT7YYYHVgpdBdbSwovp9jjt6qv6zdTeqtAEoGBfYm579Ilqo8Ci8goYCff0U5
	 KX4AckU1uvjvdTdWtXEW1VCtNThyyx5ozRwtxK4U4O11TzFQnFqk6NAKWRSjLG+N5C
	 P6Z+dAbrHXfPJ49r9sAj3f/YVIRCXzMS53CeFM/YMCuKJhgd9egCevs2ngCzlv2Iwu
	 BKZRupF6LD5BA==
Date: Mon, 22 Jul 2024 18:46:32 +0200
From: Benjamin Tissoires <bentiss@kernel.org>
To: Max Staudt <max@enpas.org>
Cc: Roderick Colenbrander <thunderbird2k@gmail.com>, 
	Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <benjamin.tissoires@redhat.com>, 
	Roderick Colenbrander <roderick.colenbrander@sony.com>, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] hid-playstation: DS4: Update rumble and lightbar
 together
Message-ID: <4olssbvj6iap42kqycdnvpibiufemz5hhwjw65aj3qqeuzrib5@467sqzfl53vt>
References: <20240616163055.75174-1-max@enpas.org>
 <CAEc3jaCkH5JwNTpHRZYsekbwX+G6T5tMTLD0+O6E7Q2hqcAFHw@mail.gmail.com>
 <dedb2c39-fc28-4cba-802f-5d56f23db722@enpas.org>
 <CAEc3jaC-Tmd2XtK9H2sipBJAhCf16dMWx46r8Hs4p9At3LC_Jg@mail.gmail.com>
 <afda41dc-7b36-4ddd-abfc-c9430d8c9503@enpas.org>
 <CAEc3jaB7ijeXCUKOhpORx4Omf8edSmc1HKe9bk22V1mz=cLa+g@mail.gmail.com>
 <5b42961b-8ca6-4245-b16c-d703255e5aea@enpas.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5b42961b-8ca6-4245-b16c-d703255e5aea@enpas.org>

On Jul 21 2024, Max Staudt wrote:
> On 7/17/24 09:26, Roderick Colenbrander wrote:
> > > If not, then maybe there is protocol documentation that could help
> > > test writers in creating more precise tests?
> > 
> > Unfortunately none of the documentation for our controllers is public.
> > Just read between the lines in the code, which we cover with some clues
> > here and there :)
> 
> I've seen the clues and they are certainly an improvement of
> hid-playstation over hid-sony that I am grateful for :)
> 
> As for the documentation, I didn't mean that you should open it to the
> wide public (although that would be fabulous!). Rather, I suggested
> providing what's needed to the people writing the downstream tests that
> we've been going on about for a while now.
> 
> The utility of tests is... rather limited, if they don't verify an
> actual specification, but just a specific code's behaviour. After all,
> these tests would fail even when talking to a real PlayStation 4.
> 
> 
> > > > (The official Android tests are kind of kernel version agnostic
> > > > as they work across multiple kernel and Android versions.
> > > 
> > > Hm, sounds to me like the Android test framework is broken if it
> > > cannot be kernel-specific in such cases. What's required in order to
> > > improve this?
> > 
> > It is a bit of a long process we work on with Google. Some initial
> > fixing of some of the bugs will be for this year to make sure the 6.6
> > tests pass properly. But any work to maybe handle multiple behaviors,
> > that's quite tricky and would take quite a bit of time to be honest.
> 
> Sure, time is not the issue, as long as there is a clear light of
> correct software at the end of the tunnel :)
> 
> Are these tests open source?
> 
> Can kernel patchers run the tests easily (without installing a full
> Android SDK) and see which tests their patches would break?
> 
> 
> > Considering how widely Android and all these devices are used, I'm
> > hesitant to make changes to not cause regressions. Even just a simple
> > one can take forever to trickle down.
> 
> Apologies, I am still confused.
> 
> With v6.2, hid-playstation gained DS4 support. With v6.3, hid-sony lost
> DS4 support.
> 
> DS4 support was removed from hid-sony just one minor release after it
> was included in hid-playstation. I didn't see any hesitation there,
> despite the wire protocol seeing significant changes compared to
> hid-sony, which had been deployed for almost a decade.
> 
> Given how quickly the DS4 code was removed from hid-sony, why are fixes
> suddenly difficult, less than two years into the hid-playstation era, after
> around 8 years of DS4 support in hid-sony?

Ouch, that is worrisome.

> 
> 
> The change from hid-sony to hid-playstation caused a regression on a
> real-world device, on Android phones:
> 
> I have an 8BitDo controller that quirkily emulates a DS4, and which
> worked fine with my old Android phone, with a kernel from the hid-sony
> days. With v6.3, this controller broke, and this went into LTS v6.6.
> 
> Does this kind of regression, which has clearly spread across the Android
> ecosystem with v6.6, deserve to be fixed?

it does, yeah.

> 
> 
> As a generalised question, how about controllers that work on Android phones
> with kernel v6.1 (hid-sony), but not with v6.6 (hid-playstation), because of
> protocol changes that don't affect first-party controllers. Do we accept
> upstream regressions on actual, physical devices for the sake of passing
> downstream tests?

The upstream rule is simple: no regressions (that we know about). The
argument that downstream tests are hard to do is not correct for
upstream. As a general rule of thumb, upstream doesn't care about
downstream at all. Regressions is all we care, and a bad test from
downstream is not a correct justification to reject a fix upstream.

Please understand Roderick that I am not taking side. I perfectly
understand the downstream challenges, but we can not refuse a regression
fix because the new patch breaks a downstream test.

I followed the thread and Max seemed to be OK with waiting and I assumed
it was not critical. But if we know about a regression in a device we
supported, we should find a solution for it.

BTW, that's the reason why I finally managed to push the hid-tools tests
in the seftests dir of the kernel directly. Now each kernel has its own
set of tests, and there is no more discrepancies between tests and
regressions that are found.

Cheers,
Benjamin

> 
> 
> 
> Max

