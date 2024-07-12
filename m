Return-Path: <linux-input+bounces-4995-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FB1C92F629
	for <lists+linux-input@lfdr.de>; Fri, 12 Jul 2024 09:28:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D0FBE1C22BA1
	for <lists+linux-input@lfdr.de>; Fri, 12 Jul 2024 07:28:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DD0F13F454;
	Fri, 12 Jul 2024 07:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="UIL61AFC"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 149F113DDBD;
	Fri, 12 Jul 2024 07:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720769276; cv=none; b=EVD8t5+yDIikJNwTJQUmMBrv2A+PtO6f2QE9Qrpzdd//yG0VO+zRSVZ20jxKOc5J0eP607CfvZ22zK1LUKrZ98alBKUtZo/0RL3fo5oP1lZavZCXBX+HYhd7BlUzyHeNai2Uk/t07fRr4oQCniShjF6Qpq/5cgNq2Z6V+iCajjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720769276; c=relaxed/simple;
	bh=v9H4k+agOKBQTzRRfj/8IHMszwHmjLKJent2iDVGH1Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nJ+laMIe39JbwZDjoeRi9OeYGQxvmyiWLiQBmTGpafVo918AB7W2oQT/i/mbyKurxIat35LyRW38yFdxRtRG9/bCYyyibS8wdIYka+mYnJJSG2aqUEC5xQ8ISI2/ixgr4QhMorsTOwNGvpbmZD18bCmaDBS/FfcMcZmecglbYcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=UIL61AFC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C9DBC3277B;
	Fri, 12 Jul 2024 07:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1720769275;
	bh=v9H4k+agOKBQTzRRfj/8IHMszwHmjLKJent2iDVGH1Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UIL61AFCphLYjosca0V2Pm/X0Wuzh5BoGL3ZSFa3w0T2pDSlRhQIVmlVunMXv3g0e
	 vsODSwExALisB5US+i9IAgEMrJVw3EdqDIkDNkhP2B6lfmokcov6aSLwXqXWQi5xtJ
	 uVRLqgprdwwZWdnrD01IP0PTw4x8gZHOR3gbaUq0=
Date: Fri, 12 Jul 2024 09:27:53 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/8] Input: usbtouchscreen - use driver core to
 instantiate device attributes
Message-ID: <2024071248-modify-annotate-4188@gregkh>
References: <20240712051851.3463657-1-dmitry.torokhov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240712051851.3463657-1-dmitry.torokhov@gmail.com>

On Thu, Jul 11, 2024 at 10:18:43PM -0700, Dmitry Torokhov wrote:
> Instead of manually creating driver-specific device attributes
> set struct usb_driver->dev_groups pointer to have the driver core
> do it.
> 
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
>  drivers/input/touchscreen/usbtouchscreen.c | 31 +++++++++++++++-------
>  1 file changed, 21 insertions(+), 10 deletions(-)

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

