Return-Path: <linux-input+bounces-5853-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1095095E2D9
	for <lists+linux-input@lfdr.de>; Sun, 25 Aug 2024 11:09:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C1E011F21485
	for <lists+linux-input@lfdr.de>; Sun, 25 Aug 2024 09:09:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77277537F5;
	Sun, 25 Aug 2024 09:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bitmath.se header.i=@bitmath.se header.b="SgC3p5dZ";
	dkim=permerror (0-bit key) header.d=bitmath.se header.i=@bitmath.se header.b="Lgzmk+KD"
X-Original-To: linux-input@vger.kernel.org
Received: from mailrelay3-2.pub.mailoutpod2-cph3.one.com (mailrelay3-2.pub.mailoutpod2-cph3.one.com [46.30.211.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FC384F602
	for <linux-input@vger.kernel.org>; Sun, 25 Aug 2024 09:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.30.211.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724576939; cv=none; b=Ay22ikoj3ADNt+FTGct8l5Lrud1sXCGJSS2aNVi41VLNIc1G/GtfbKnQ+l31Zxc0vZrRJIUNqJX7pVL+evkV/vmG5yD6BnOPkNvTdFsTzpY4x8mx66bBBIpwkH5WmYdDGKxQnAWtI2L5EZKJnjiSd5I97UG1/Tc72y1myzQ7oOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724576939; c=relaxed/simple;
	bh=oWyvZcv3KLB75n2dWGYT4ymEiqc/u5pAQQBhAFTAM8A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EWXHyFIILeEa1b2jnZlpL9vDmGw6rqYUIycHMgGoUiQH7xSp+Dad66VF92bgbMp/KfwFsTI0iM795oxhP3x/3nMCdfMXbTtN0YkdoWZi1hJcmnIfxxF1IoTy2Sg11/PKeSW1vxzsatJTL12RRjPP1OFCtkzf5+JL0LthIkxGYSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bitmath.se; spf=none smtp.mailfrom=bitmath.se; dkim=pass (2048-bit key) header.d=bitmath.se header.i=@bitmath.se header.b=SgC3p5dZ; dkim=permerror (0-bit key) header.d=bitmath.se header.i=@bitmath.se header.b=Lgzmk+KD; arc=none smtp.client-ip=46.30.211.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bitmath.se
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bitmath.se
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bitmath.se; s=rsa1;
	h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
	 from:date:from;
	bh=i86L5iceR2GEC+0H4NBgHtzszPbBP2XN5/nrKvH6uPc=;
	b=SgC3p5dZk60KFmgxNyGsWXXqX5ugO72WD0hd3IPgh0+Yjz3PncrD+D3qMk14Dyv0wa29TQl7aVbjB
	 afH9Erlmz+OvAei+ydGsqThLxUAp8YJ4AJso0JF0z+gdKpMRoc2yAuuRCfPLK9WGhKm+KceP5Z2/1E
	 RMxiiDATy4GeNI8wrixNh4c2+6zwP74t38kJZ+grR1a6szeDagjwkIgMV/m+PW6dYye1DAhRBpQfUh
	 GEzXr2UkwCzM3Bj5/jSrZDfGgqaBKTYHntHM/i0zd+eErWRJWtLXbIXb63ObLruo+oOGNz3ML+BGnk
	 0bxObXNjlZ4mT18VW+4ef5rx2Ly58GA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
	d=bitmath.se; s=ed1;
	h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
	 from:date:from;
	bh=i86L5iceR2GEC+0H4NBgHtzszPbBP2XN5/nrKvH6uPc=;
	b=Lgzmk+KDhIvgf1o21TuLrldDVvYdskJlgaydN5C3RSjI8/vO9ET/EpnU4cdqMva1o++n9FnizpO87
	 CzwwNaVDA==
X-HalOne-ID: 7c98b066-62c1-11ef-9176-dd3f8b2e2fd4
Received: from localhost (h-94-254-62-230.na.cust.bahnhof.se [94.254.62.230])
	by mailrelay3.pub.mailoutpod2-cph3.one.com (Halon) with ESMTPSA
	id 7c98b066-62c1-11ef-9176-dd3f8b2e2fd4;
	Sun, 25 Aug 2024 09:07:44 +0000 (UTC)
Date: Sun, 25 Aug 2024 11:09:42 +0200
From: rydberg@bitmath.se
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org,
	Javier Carrasco <javier.carrasco.cruz@gmail.com>,
	Erick Archer <erick.archer@outlook.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: bcm5974 - use guard notation when acquiring mutex
Message-ID: <Zsr01pEW0Y-F1Hbf@mars.bitmath.org>
References: <ZsrBVO2w9WwX73iU@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZsrBVO2w9WwX73iU@google.com>

On Sat, Aug 24, 2024 at 10:29:56PM -0700, Dmitry Torokhov wrote:
> This makes the code more compact and error handling more robust
> by ensuring that mutexes are released in all code paths when control
> leaves critical section.
> 
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
>  drivers/input/mouse/bcm5974.c | 35 +++++++++++++----------------------
>  1 file changed, 13 insertions(+), 22 deletions(-)
> 

Thanks Dmitry,

Acked-by: Henrik Rydberg <rydberg@bitmath.org>

