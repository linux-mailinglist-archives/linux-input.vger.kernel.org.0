Return-Path: <linux-input+bounces-3710-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 624388C594F
	for <lists+linux-input@lfdr.de>; Tue, 14 May 2024 18:05:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 93F781C21F1E
	for <lists+linux-input@lfdr.de>; Tue, 14 May 2024 16:05:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66B4817F384;
	Tue, 14 May 2024 16:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sigxcpu.org header.i=@sigxcpu.org header.b="ip6XRIMP";
	dkim=pass (2048-bit key) header.d=sigxcpu.org header.i=@sigxcpu.org header.b="C3mQK4qN"
X-Original-To: linux-input@vger.kernel.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 413AC1448C0;
	Tue, 14 May 2024 16:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=24.134.29.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715702740; cv=none; b=Wq6UVVMxsCm0maCk1XBcmYuwyUA8xNKQS9yLtRw00rrxZvgvQpEoVzuIISMCfFhT3JTpTAWCeJXUHCEmfToqPUdekgJKH6flkpGw2iteoxugtQ2xDtGtmTX7jmuyhCMMbVEttQZ+e/HEmErxmX0Iv/i1+3UBUTFMpVkc9c87iv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715702740; c=relaxed/simple;
	bh=/1oqQZPs3WqoeEwclXSM+7tygrmu8dr8chc8eGTmRQM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KefMuqedRW8JrJIGCgyAR6ITeS8YqLf5k63DdCKd9O6SZStORAvZO9RMGqcpWaxjVmxPG+aF6QAb6uavEnF7m0e3NendOoh+0Cg+wUazRMB3TVCluIXNXmkx27LuCtpEv/xKq/DEVDql26xVpvT6gdfbJ0WVziCi6hwAYsmMhtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sigxcpu.org; spf=pass smtp.mailfrom=sigxcpu.org; dkim=pass (2048-bit key) header.d=sigxcpu.org header.i=@sigxcpu.org header.b=ip6XRIMP; dkim=pass (2048-bit key) header.d=sigxcpu.org header.i=@sigxcpu.org header.b=C3mQK4qN; arc=none smtp.client-ip=24.134.29.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sigxcpu.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sigxcpu.org
Received: from localhost (localhost [127.0.0.1])
	by honk.sigxcpu.org (Postfix) with ESMTP id 4B17AFB03;
	Tue, 14 May 2024 18:05:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=sigxcpu.org; s=2024;
	t=1715702726; bh=/1oqQZPs3WqoeEwclXSM+7tygrmu8dr8chc8eGTmRQM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ip6XRIMPsGM47s+BdcpcMTS9Kd8139GHXiF2LOQ01E8wd5g4jMsbR2f6ECSzHb73c
	 WTOURN2sgR+hw5qYKoLVH7V/Ry0QB3IIrjPgCVMCkhCDWVVp8uHfJw+c804sL1RCGk
	 IDohlwBqa2HR2jFIWw9MWoEPldI/ti1N7jHdQQREA13wFwO6z89PB4BIyc8fjb81hg
	 7q9zCeQXc+RiDJ7NVIuM+MW99+WCFJaw7VxuytOSUdFEa9/Kjp2XvGvUOqwtw6IHOO
	 9jcEYBVT8lNKaz1y2oefRaMSXJ2GJdQ5TZoavMhaM24hOC1u3l6ub01zM8ZVa0Dv9t
	 3IlQKB9W6T7vQ==
Received: from honk.sigxcpu.org ([127.0.0.1])
	by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id K40O2fvKpbDj; Tue, 14 May 2024 18:05:24 +0200 (CEST)
Date: Tue, 14 May 2024 18:05:20 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=sigxcpu.org; s=2024;
	t=1715702723; bh=/1oqQZPs3WqoeEwclXSM+7tygrmu8dr8chc8eGTmRQM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=C3mQK4qNLh8xnbfsvV/nLhpxRj3AC2XHxmsan7Z5CuYvUkqp9Xr24/rjQhBRky2vP
	 NxuxXAz7xabdDB0j9mN5Ca8NdxQPaPQO22Tfa9nVyuew/N9sii+z2ELVWI07yz2f3z
	 e9zougneAV2JoSUeZI6IymzJ1TMO+pEsB7S0iCWxxyXOAQig3OMcRE14zW1xD6yHKP
	 tSaHzlGx6ePIwlYEKVwnFRK/3eHoDHG1eb5Vfx5eLEFt8ZqwJrRjWhgK430feuAyYR
	 kan9mfzy0LqtVxoEwVECXMytou6ePJNv6zBPPU30cHL+FQZNcmFls+yRF1rlAtogi/
	 BP7QlxbvTU/NA==
From: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Hermes Zhang <chenhuiz@axis.com>, Tony Lindgren <tony@atomide.com>,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	phone-devel@vger.kernel.org
Subject: Re: [PATCH v1 1/1] Input: gpio-keys - expose wakeup keys in sysfs
Message-ID: <ZkOLwIEuZ8hfzO4M@qwark.sigxcpu.org>
References: <cover.1715255980.git.agx@sigxcpu.org>
 <2b6eb6c3f68509aa35cdf2e2a586689ae97681ab.1715255980.git.agx@sigxcpu.org>
 <ZkKQoTq2xyNvJlHE@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZkKQoTq2xyNvJlHE@google.com>

Hi,
On Mon, May 13, 2024 at 03:13:53PM -0700, Dmitry Torokhov wrote:
> Hi Guido,
> 
> On Thu, May 09, 2024 at 02:00:28PM +0200, Guido Günther wrote:
> > This helps user space to figure out which keys should be used to unidle a
> > device. E.g on phones the volume rocker should usually not unblank the
> > screen.
> 
> How exactly this is supposed to be used? We have "disabled" keys and
> switches attribute because this function can be controlled at runtime
> from userspace while wakeup control is a static device setting.

Current Linux userspace usually unblanks/unidles a device on every
keypress. That is usually not the expected result on phones where often
only the power button and e.g. some home buttons should do this.

These keys usually match the keys that are used as wakeup sources to
bring a device out of suspend. So if we export the wakeup keys to
userspace we can pick some sensible defaults (overridable via hwdb¹).

> Kernel also does not really know if the screen should be unblanked or
> not, if a button or switch is configured for wake up the kernel will go
> through wakeup process all the same and then userspace can decide if it
> should stay woken up or not.

Yes, we merely want that as a hint to figure out sensible defaults in
userspace (which might be a subset of the wakeup keys).

Cherrs,
 -- Guido

¹) See https://gitlab.gnome.org/World/Phosh/gmobile/-/blob/main/data/61-gmobile-wakeup.hwdb?ref_type=heads#L57-L59

> 
> Thanks.
> 
> -- 
> Dmitry
> 

