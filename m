Return-Path: <linux-input+bounces-8948-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A82EBA01F87
	for <lists+linux-input@lfdr.de>; Mon,  6 Jan 2025 08:08:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 500F83A3B43
	for <lists+linux-input@lfdr.de>; Mon,  6 Jan 2025 07:08:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0E978BE7;
	Mon,  6 Jan 2025 07:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="NDh6Wl9p"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE5BE1925A2
	for <linux-input@vger.kernel.org>; Mon,  6 Jan 2025 07:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736147303; cv=none; b=iYmpgM9BbYL22g7PzgdkjWWVo3jErcoEUKZGSd8MW6kVm+XaIp5A+KhOibTTSK78KsRQKHF/36sZUWP8e1AY1VtOxZUPqpXgmRoKcpJCQb4rnlAOQzPyHBaIfb0x+k6Po081lCZ1dz2SEtH8qmqU2+Hy5oXci9mzjV33JdKdkeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736147303; c=relaxed/simple;
	bh=7jYRCL7ui45qrdSKaXAYKrhCtrmMiK1YR/6MH6l0v20=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MPSRCrv0yB5QblTtV/6gkIajbV6YFwbUgpJYJF1dZPgtUW13gXmTq0F19dgY1aVNmZAQc7KTa4iKKyPO9FzNXeQupc9OFsepCi5VDTZ5JNhI9ybLvCgnQX2GirVIvUhoocDf3CK2KGrkgbYApzGh1Sb9Sd1uESpPtjQ32S53nbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=NDh6Wl9p; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE884C4CED2;
	Mon,  6 Jan 2025 07:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1736147303;
	bh=7jYRCL7ui45qrdSKaXAYKrhCtrmMiK1YR/6MH6l0v20=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NDh6Wl9pf704uYKSl+xcbj6JZq0Z1Eo++xv7OrTxUsVB9c8xKhrp5U3t/5lmYrztd
	 UgweZytviaVn0xkqx03XZnz0o8fdRl1yveSuHumEYjI+tVky3GTDN11GQ/zzbKZPcO
	 FAuB7B9pYT/aSyzkrGiGvr3ZX+L5S9XnHcJqsPtQ=
Date: Mon, 6 Jan 2025 08:08:19 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Pavel Rojtberg <rojtberg@gmail.com>
Cc: linux-input@vger.kernel.org, dmitry.torokhov@gmail.com,
	Tobias =?iso-8859-1?Q?G=F6rgens?= <tobias@localhost.localdomain>
Subject: Re: [PATCH 05/13] Input: xpad - add Black Shark Green Ghost
 controller support
Message-ID: <2025010644-lustfully-flagstone-6984@gregkh>
References: <20250105193750.91460-1-rojtberg@gmail.com>
 <20250105193750.91460-6-rojtberg@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250105193750.91460-6-rojtberg@gmail.com>

On Sun, Jan 05, 2025 at 08:37:42PM +0100, Pavel Rojtberg wrote:
> From: Tobias Görgens <tobias@localhost.localdomain>

Obviously not a real email address :(

I understand the issues with syncing from github, but adding invalid
email addresses to the kernel git tree is not going to help out at all.

thanks,

greg k-h

