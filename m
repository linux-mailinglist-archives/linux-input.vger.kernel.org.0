Return-Path: <linux-input+bounces-1683-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B39C84A412
	for <lists+linux-input@lfdr.de>; Mon,  5 Feb 2024 20:43:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B34111F265AC
	for <lists+linux-input@lfdr.de>; Mon,  5 Feb 2024 19:43:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 842401353FD;
	Mon,  5 Feb 2024 19:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="kuVtu3T9"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 564CF1353E5;
	Mon,  5 Feb 2024 19:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707159821; cv=none; b=B9vtVQ/dh461pw5qnDHstT1dc/ihFAJ85ANZOkwki7Kni8PfzbhiqGG/cuNAgkvlg6RRxxv6QdUkzKEjMnQdPF9OPoxAiuiLE6EtI6pGKzUVdQW2UfDGqLkSojDPwxm/oG8204geodoR/40zESTp+fIpnijaBcolxZ6cR3G6TTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707159821; c=relaxed/simple;
	bh=r76aFwVlhx0f6YcO/hvdE8UgF2/b55hZ9n+gn3+rVR4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bLLuv/FbXPsjIpFxowQERajfPfjp7RrHvyjFTTbn+og0ke7TlZWFrl3okQXnMo3nkfuuVC6Lya44TOIQcgjszp7/hZVS3fbG3GUYTvRP1c/D/qZMc6mURIiE95+NuBlJWF/7kZB1yGrM80e/czEX00aNgtdCgbHD/XmtluOSJs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=kuVtu3T9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF380C433C7;
	Mon,  5 Feb 2024 19:03:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1707159821;
	bh=r76aFwVlhx0f6YcO/hvdE8UgF2/b55hZ9n+gn3+rVR4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kuVtu3T9O9CIPHyw33GhhyB3qES1zln91hsN3uFYOPcjddK3JGn1cG+v75IimLA5p
	 p4EZoEhbt144naEm+pn875/zhFYfA2iRwxYMe+pZP5uqK8gc9fI74qKwjw6Flw9fLv
	 Zw5llLI8cvznhqMk+A2Hxiw3byN8I7VL9fHzuswk=
Date: Mon, 5 Feb 2024 04:49:11 -0800
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: "Ricardo B. Marliere" <ricardo@marliere.net>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] input: gameport: make gameport_bus const
Message-ID: <2024020506-update-hardiness-cfc6@gregkh>
References: <20240204-bus_cleanup-input-v1-1-74c2438801cf@marliere.net>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240204-bus_cleanup-input-v1-1-74c2438801cf@marliere.net>

On Sun, Feb 04, 2024 at 04:56:34PM -0300, Ricardo B. Marliere wrote:
> Now that the driver core can properly handle constant struct bus_type,
> move the gameport_bus variable to be a constant structure as well,
> placing it into read-only memory which can not be modified at runtime.
> 
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: Ricardo B. Marliere <ricardo@marliere.net>

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

