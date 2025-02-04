Return-Path: <linux-input+bounces-9754-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A4B0CA27421
	for <lists+linux-input@lfdr.de>; Tue,  4 Feb 2025 15:10:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4B0983A22E1
	for <lists+linux-input@lfdr.de>; Tue,  4 Feb 2025 14:07:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5A0720E305;
	Tue,  4 Feb 2025 14:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="dSY8PCBs"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66CC520DD60;
	Tue,  4 Feb 2025 14:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738678054; cv=none; b=N74Kgyk5VoV9hMykMEb+3VrXpjso6JKNU7o9mZO8ERSfGGAniG73rTCzaOZQ8SlI7f2x6K3z5Sqoud90/CCQmISOJcAdzEegksJd+S2Bnom7IYjHoT2VlFYpKvqo7uDjUOHpv1XTtNZxJULjdOPW2B+LSJ6ylJ3durqs6Dzcb5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738678054; c=relaxed/simple;
	bh=DXy3zcOIszbtR+6ZTz9kj/erD3peAa/YBoPDnuXm3Tk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u2k+5Tv6wpLyzoaVGHewJ+iNYAzGtPJb2MQIOVDbGhM1spEUlGszj3FcKiFq915Pqx5r90wF6jhN9vt2ZRnk4Iq06UOKtBqSfC799zWyUyQMfLcyPiFROa5yygg1pr95WaR7cttVUR+4TTUGfYxDOGxHAIx4+sL5Qv43weA4QOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=dSY8PCBs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67633C4CEDF;
	Tue,  4 Feb 2025 14:07:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1738678053;
	bh=DXy3zcOIszbtR+6ZTz9kj/erD3peAa/YBoPDnuXm3Tk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dSY8PCBsHk2S42+/2ww9mGPVbyWmYXO4P3Y4GjUV3iYbHHVlmypzBKHNsCen0X4/x
	 CZF59DOTpGF9GBXJn8/THXhTIljKgjHdIjYIs8mqb5wf7BhpqVF77oBsRJoDjgP0eH
	 /vzLlihuUbtVcYLmu2z3p9VchfADUIvzCd/Rdse8=
Date: Tue, 4 Feb 2025 15:07:30 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Purva Yeshi <purvayeshi550@gmail.com>
Cc: jikos@kernel.org, bentiss@kernel.org, corbet@lwn.net, jdelvare@suse.com,
	linux@roeck-us.net, skhan@linuxfoundation.org,
	linux-usb@vger.kernel.org, linux-input@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org
Subject: Re: [PATCH] docs: Fix spelling and grammatical issues
Message-ID: <2025020411-ravine-stand-530a@gregkh>
References: <20250204134806.28218-1-purvayeshi550@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250204134806.28218-1-purvayeshi550@gmail.com>

On Tue, Feb 04, 2025 at 07:18:06PM +0530, Purva Yeshi wrote:
> Fix several spelling and grammatical errors across multiple
> documentation files.
> 
> Signed-off-by: Purva Yeshi <purvayeshi550@gmail.com>

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- Your patch did many different things all at once, making it difficult
  to review.  All Linux kernel patches need to only do one thing at a
  time.  If you need to do multiple things (such as clean up all coding
  style issues in a file/driver), do it in a sequence of patches, each
  one doing only one thing.  This will make it easier to review the
  patches to ensure that they are correct, and to help alleviate any
  merge issues that larger patches can cause.


If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot

