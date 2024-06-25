Return-Path: <linux-input+bounces-4616-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 91397916BE5
	for <lists+linux-input@lfdr.de>; Tue, 25 Jun 2024 17:07:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4F3BE28319D
	for <lists+linux-input@lfdr.de>; Tue, 25 Jun 2024 15:07:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2863817E47E;
	Tue, 25 Jun 2024 15:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g/FAZIg5"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02BEB17E45F;
	Tue, 25 Jun 2024 15:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719327749; cv=none; b=kRIK1UyOQgBuAaxoa+L+HVpi6uOoKIDn98wWr7KNZ/fAlT0kfpDCbgNT/xfRTaoS8OEhl7I81q/tTj05tCWppSUXmdMKA927CLLiU/vTdytAg+P+AJd59NyW4qNyfn+IzdTfP38p81NdUkgswJCkpbs0gFhWNO9tTaQE12IygHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719327749; c=relaxed/simple;
	bh=cQwiOqtjV6/LzwjVLbeFZMGFz4XLbTBs1wQo2HzADdc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZA5QymXGU/kPiERDPkrey4xYyiYCXHDJn+nWbFWTUN6F9uYnn/b25YzzFPZQ2zsmTnAtwET5mEUXwTe7wxLiU8LgtTXEcv1A+fTvHc0yyZEFzDFMnCyq1OWlnOkOufJ7mjeQpvzyEROyulqy6NXM0oEr7HxHVMCIZZwEAZnTRHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g/FAZIg5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1F0FC4AF09;
	Tue, 25 Jun 2024 15:02:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719327748;
	bh=cQwiOqtjV6/LzwjVLbeFZMGFz4XLbTBs1wQo2HzADdc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=g/FAZIg5g9GspsRS1oZEUx1XMb7JnV6OPKtwjj7pzqlVVTB1YRhHRxjcWtSMN9o7Y
	 cxRrgpPomRRAopypxPfFIGKcXfiaUB6xmCM3j0WDYtCQsN5QKB2ISGDa5JFrbfKpjj
	 GvwNiLfqWihb+V3LHzIknd7QAMIXwU0KP/blfj3kogEzfR8tmV/gXL5sS0w8G9hUNV
	 car9avFTq71nw51eIbox7DSAU9X+SiyW+fqDAwpaftpWSxmUhY2PQBOwOhOcgVUqVc
	 1Yh01wHIcKzraKAbm9DqLSdA9q96hiVWbzR+VEvJdANSF8KcHuUHpnUdJgMxxJ30vo
	 8pP5iKqEvd3lw==
Date: Tue, 25 Jun 2024 17:02:25 +0200
From: Benjamin Tissoires <bentiss@kernel.org>
To: Jiri Kosina <jikos@kernel.org>
Cc: Luke Jones <luke@ljones.dev>, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/1] hid-asus: use hid for brightness control on
 keyboard
Message-ID: <efd7izqwobohv644j63oeruf5suwo4gcw7r5wvvh5koqn7lwgu@3m3aczbbwhrg>
References: <20240607040532.1074379-1-luke@ljones.dev>
 <20240607040532.1074379-2-luke@ljones.dev>
 <dd0a211a-bef1-4eb2-8d1f-2d63799af94c@app.fastmail.com>
 <9e4ee526-2b94-45f3-9fe9-0f1d0918916b@app.fastmail.com>
 <nycvar.YFH.7.76.2406191639360.24940@cbobk.fhfr.pm>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <nycvar.YFH.7.76.2406191639360.24940@cbobk.fhfr.pm>

On Jun 19 2024, Jiri Kosina wrote:
> On Sun, 16 Jun 2024, Luke Jones wrote:
> 
> > > I thought this was finalised but I'm still getting conflicting 
> > > reports. Please don't merge until I confirm the fix.
> > 
> > This is ready for merge now. I have more confirmation that the single 
> > patch with no adjustment to report_id works well.
> 
> Applied, thanks.

This patch should have been taken through the platform x86 tree [0].

I have now reverted it (and it was buggy, it failed to compile on
linux-next).

Cheers,
Benjamin

[0] https://lore.kernel.org/all/b0d8eebc-5abb-4ec0-898c-af7eedc730d9@redhat.com/

> 
> -- 
> Jiri Kosina
> SUSE Labs
> 

