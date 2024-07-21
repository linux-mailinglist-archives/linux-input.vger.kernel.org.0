Return-Path: <linux-input+bounces-5112-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 32CD29385BB
	for <lists+linux-input@lfdr.de>; Sun, 21 Jul 2024 19:47:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DA106280E68
	for <lists+linux-input@lfdr.de>; Sun, 21 Jul 2024 17:47:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D07C1DFE4;
	Sun, 21 Jul 2024 17:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sigxcpu.org header.i=@sigxcpu.org header.b="Sgu3+6TU";
	dkim=pass (2048-bit key) header.d=sigxcpu.org header.i=@sigxcpu.org header.b="JG7lptBq"
X-Original-To: linux-input@vger.kernel.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E164E4400;
	Sun, 21 Jul 2024 17:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=24.134.29.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721584046; cv=none; b=UwJYE6AvOSHoaNkOGIrb9BfAzvgxWaHtt5+lhvCDCgs+VrHEtdwwq9bnx/fa9arQdGiviNWAXylvFM6nipxI4iUJq7oSf7/Xh2KXuaqE21fIGvjrOUr7HYiIuxeBo8kqNjYBtmcUKtDboB9RqJTD2Gj4sjb/nk8vslTTIV7nZHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721584046; c=relaxed/simple;
	bh=RZon+HaTRspbfsNQYgDOXZSmPHwso9QGn5LD+NN6eHg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ryM5VHEQO1y8osePLI5ZM49qlwfCIBgCtThvy23y5RzOolnFCo8QCpOILWBQOfu8Ez7RamJV8AK9yqDkhp7dM47Y535K8Bz6VddkDclO3TduToFEaJUsdqYwFrTgm6x3umt4kIBED0gbUVjnO8YMF9178EugS5EKTkZ6vwNWook=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sigxcpu.org; spf=pass smtp.mailfrom=sigxcpu.org; dkim=pass (2048-bit key) header.d=sigxcpu.org header.i=@sigxcpu.org header.b=Sgu3+6TU; dkim=pass (2048-bit key) header.d=sigxcpu.org header.i=@sigxcpu.org header.b=JG7lptBq; arc=none smtp.client-ip=24.134.29.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sigxcpu.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sigxcpu.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=sigxcpu.org; s=2024;
	t=1721583606; bh=RZon+HaTRspbfsNQYgDOXZSmPHwso9QGn5LD+NN6eHg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Sgu3+6TUeBs+SpS0KIiuym/svV7vKmdzh0FMv7dw+unTmpBdSdnw2shBF1xwZQFby
	 GWNpXf5ceCVDIL1+LqZirojLCDOvbcVKUF2Kn5I+sWaupLuzob0k7GYV1Q6lZj2ofX
	 9cHSdFDxroWIyJmhe5AcYeI7XdlX75Sb+1CDNPdN6gaZywKYo4OHDpHWqrvTsOwy8m
	 FAMQziD4rAYwWOUa5M8oqxJskf/Tf76ONvBW2Tuh9/N2q86b1+fw2pDRsjMJsU0toB
	 vMkdC359yVpUCGB+1gqzFjBIiFngUdxd/IYSzvDfWLNwMLaOi2+056j4tVD6u9iJsB
	 SFJe82Id1M16w==
Received: from localhost (localhost [127.0.0.1])
	by honk.sigxcpu.org (Postfix) with ESMTP id 87768FB03;
	Sun, 21 Jul 2024 19:40:06 +0200 (CEST)
Received: from honk.sigxcpu.org ([127.0.0.1])
	by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7RSxfV_Cfwjt; Sun, 21 Jul 2024 19:40:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=sigxcpu.org; s=2024;
	t=1721583603; bh=RZon+HaTRspbfsNQYgDOXZSmPHwso9QGn5LD+NN6eHg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JG7lptBq5VbklQ71l4pTx+U9PtHQB+rI0ClnYKKGMgR4Ot5nexQEddlITanvYyt1L
	 xjEbhl7DEXg153uZOzv7HjwrlWJjNGPuai0oGPjNlvIkmzHaAD9/ylzQ5+6hVvBQIt
	 DkASeega108UvNt8Ak8qnVr4NIBBSRkJXkvNyXK5Wc4NAZaos5g2BFSGrawI2DTcjB
	 oU0GYHw7XFu59wfZdeeHM612IxUk+OL0Z/KLLT2MxPtFNJ6qTS5gsnb9HG13Rpd8XK
	 i3Aow+SociT+UaeCv9GnySWshfex5db8QgYdq1IWcBRx1bubzuDDMhyoGZkOJYPzwy
	 xNrDKkGxnmcmw==
Date: Sun, 21 Jul 2024 19:40:01 +0200
From: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Hermes Zhang <chenhuiz@axis.com>, Tony Lindgren <tony@atomide.com>,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	phone-devel@vger.kernel.org
Subject: Re: [PATCH v1 1/1] Input: gpio-keys - expose wakeup keys in sysfs
Message-ID: <Zp1H8UC2MLZizjHn@qwark.sigxcpu.org>
References: <cover.1715255980.git.agx@sigxcpu.org>
 <2b6eb6c3f68509aa35cdf2e2a586689ae97681ab.1715255980.git.agx@sigxcpu.org>
 <ZkKQoTq2xyNvJlHE@google.com>
 <ZkOLwIEuZ8hfzO4M@qwark.sigxcpu.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZkOLwIEuZ8hfzO4M@qwark.sigxcpu.org>

Hi,
On Tue, May 14, 2024 at 06:05:20PM +0200, Guido Günther wrote:
> Hi,
> On Mon, May 13, 2024 at 03:13:53PM -0700, Dmitry Torokhov wrote:
> > Hi Guido,
> > 
> > On Thu, May 09, 2024 at 02:00:28PM +0200, Guido Günther wrote:
> > > This helps user space to figure out which keys should be used to unidle a
> > > device. E.g on phones the volume rocker should usually not unblank the
> > > screen.
> > 
> > How exactly this is supposed to be used? We have "disabled" keys and
> > switches attribute because this function can be controlled at runtime
> > from userspace while wakeup control is a static device setting.
> 
> Current Linux userspace usually unblanks/unidles a device on every
> keypress. That is usually not the expected result on phones where often
> only the power button and e.g. some home buttons should do this.
> 
> These keys usually match the keys that are used as wakeup sources to
> bring a device out of suspend. So if we export the wakeup keys to
> userspace we can pick some sensible defaults (overridable via hwdb¹).
> 
> > Kernel also does not really know if the screen should be unblanked or
> > not, if a button or switch is configured for wake up the kernel will go
> > through wakeup process all the same and then userspace can decide if it
> > should stay woken up or not.
> 
> Yes, we merely want that as a hint to figure out sensible defaults in
> userspace (which might be a subset of the wakeup keys).

Is there anything I can do to get this applied (currently we play
catchup per device when the wakup keys change) ?

Cheers,
 -- Guido

> 
> Cherrs,
>  -- Guido
> 
> ¹) See https://gitlab.gnome.org/World/Phosh/gmobile/-/blob/main/data/61-gmobile-wakeup.hwdb?ref_type=heads#L57-L59
> 
> > 
> > Thanks.
> > 
> > -- 
> > Dmitry
> > 

