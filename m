Return-Path: <linux-input+bounces-4959-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 979AC92E104
	for <lists+linux-input@lfdr.de>; Thu, 11 Jul 2024 09:42:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 53040282002
	for <lists+linux-input@lfdr.de>; Thu, 11 Jul 2024 07:42:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BF22148FE8;
	Thu, 11 Jul 2024 07:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="d1L2Uyvp"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AB2512EBCE;
	Thu, 11 Jul 2024 07:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720683735; cv=none; b=gF15NMVBK5+wWv0dTQSVm0j/nH3YVxC0e4w5VUw7YBU/wCXz3TMH42pSKVY4cHiNqejAW0Fvh+K8GIFWKc4dUpiwkcJsk6+iBHMN6mnzvQvtkVbHNhA+NBgbfRGs+kBvD3Pkkt/PAUz4BBMuBhWdqUG/p4oBdrJwCTi2CIce2Ig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720683735; c=relaxed/simple;
	bh=srVf0WlK0TqEXKiOUeFnP8lZxyYPDYdOAoFPRJajxtc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JxwNkpLqjkxztflGzaApOiQYtJg0+vQ9TiIJ4mHC6EgPt7BxmHlFcjcXgk3Zt47ks9X0Jnz8ILwfoJsefE0GOqfM09yY32p91ea3ZSfeseoUWZ36W2OTZXRTo0uyemLZ50wRJ8Myw05BoufCIJud7h3VrLT7+Lu0yplGcjgNgO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=d1L2Uyvp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9778AC116B1;
	Thu, 11 Jul 2024 07:42:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1720683735;
	bh=srVf0WlK0TqEXKiOUeFnP8lZxyYPDYdOAoFPRJajxtc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d1L2UyvpEytgjTHmwdjc2o7LvtdYK/+6UsogGR/J8dosOhfA3Lw9euXMBuI4mQgHr
	 xhHDxzf20la0P7wRuW14iDx1kLO6q2rnK4h8WwKhXX+GRZuDwnLzskZP0ohSznB4/O
	 DMYcS2vhfv+QChhTf3JDLb+Edu25RQVgAqG1iPcw=
Date: Thu, 11 Jul 2024 09:42:12 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org, usbb2k-api-dev@nongnu.org,
	linux-kernel@vger.kernel.org,
	Henk Vergonet <Henk.Vergonet@gmail.com>
Subject: Re: [PATCH 1/2] Input: yealink - use driver core to instantiate
 device attributes
Message-ID: <2024071157-cognitive-gradually-9ded@gregkh>
References: <20240710234855.311366-1-dmitry.torokhov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240710234855.311366-1-dmitry.torokhov@gmail.com>

On Wed, Jul 10, 2024 at 04:48:53PM -0700, Dmitry Torokhov wrote:
> Instead of manually creating driver-specific device attributes
> set struct usb_driver->dev_groups pointer to have the driver core
> do it.
> 
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---

Thanks for doing these cleanups!

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

