Return-Path: <linux-input+bounces-4960-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EF7192E106
	for <lists+linux-input@lfdr.de>; Thu, 11 Jul 2024 09:42:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2F98BB20C95
	for <lists+linux-input@lfdr.de>; Thu, 11 Jul 2024 07:42:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53148148FE8;
	Thu, 11 Jul 2024 07:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ye5oJ9Yr"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2275412EBCE;
	Thu, 11 Jul 2024 07:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720683769; cv=none; b=S5oM3xzXngdE1xmHL0D5RBlBquU5/9TGttbJZspUJBjOKAj1YGszSB2ghqEf/EwoR2qbyd3jUSJbmI600ZT30js/6hkZcDv4TZfsIpxlJM9i4VpxzEJqcf5XiaT34icbAvKRjXTDC4GTZhZ+EO4kxZAeIysLFWQpye1yKe5+GsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720683769; c=relaxed/simple;
	bh=Cl7EluWTXUIOQ+BxRAROM+06mcHQbB6ZaDL7XkjkDck=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FWBqFtuAvb8EfU6exhxEAn+zKouOG9iHhB3cn3wbYkH4FeL+eTMR+Q+5+vN3+/bwmVYOZbVAYSRHu35gVk/rEJJQwASZoD35kdUW6r6HinsaUGg2CWlDUSjcE64B4cQrjo6Az1Pa7IsrpRdC9wQeK+N4lKJZvULCXSA60B7zCFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ye5oJ9Yr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36C20C116B1;
	Thu, 11 Jul 2024 07:42:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1720683768;
	bh=Cl7EluWTXUIOQ+BxRAROM+06mcHQbB6ZaDL7XkjkDck=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ye5oJ9Yr2Nt/MO69OPsCa5+s/4vs8OOfN+nQIpU34aSLbyFkUyZQaFCVTL67Bb7hl
	 gDWUQNnRAsuKQ5KVMP1+buDxEBSm8jM7zF6nZx0b5I89RCEHLZWwtUCwSVQE/dni6I
	 MiVky8cyR9IaYfkEYrogOJbVwzpjk/m6Wnt2T7tk=
Date: Thu, 11 Jul 2024 09:42:45 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org, usbb2k-api-dev@nongnu.org,
	linux-kernel@vger.kernel.org,
	Henk Vergonet <Henk.Vergonet@gmail.com>
Subject: Re: [PATCH 2/2] Input: yealink - simplify locking in sysfs attribute
 handling
Message-ID: <2024071141-fester-astronaut-96a6@gregkh>
References: <20240710234855.311366-1-dmitry.torokhov@gmail.com>
 <20240710234855.311366-2-dmitry.torokhov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240710234855.311366-2-dmitry.torokhov@gmail.com>

On Wed, Jul 10, 2024 at 04:48:54PM -0700, Dmitry Torokhov wrote:
> The locking rules in the driver came from era when sysfs attributes
> could live past the point of time when device would be unbound from
> the driver, and so used module-global semaphore (potentially shared
> between multiple yealink devices). Thankfully these times are long
> gone and attributes will not be accessible once they are removed.
> 
> Simplify the logic by moving to per-device mutex, stop checking if
> there is driver data instance attached to the interface, and use
> guard notation to acquire the mutex.
> 
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

