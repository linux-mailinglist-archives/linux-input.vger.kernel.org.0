Return-Path: <linux-input+bounces-8026-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CB4E9C48D0
	for <lists+linux-input@lfdr.de>; Mon, 11 Nov 2024 23:09:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9BBD2B2289C
	for <lists+linux-input@lfdr.de>; Mon, 11 Nov 2024 21:50:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA6161A76DD;
	Mon, 11 Nov 2024 21:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l8XONRfQ"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B286B38F83;
	Mon, 11 Nov 2024 21:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731361836; cv=none; b=DgyaY0HMI3YpEpCYb51zHDdBOswvP99+C99icSt+VQukPGs+9PKgFCCR1Y6ea9qEEUxb9KBoMrZJljvkWgcuNQ1K/SXwY6ZE/BjXwcpp8MJgntvcJJf3R/4luV6uuXC4Nk+1aU2MJ2o+aNrk6i5z2umOtsCu0c84zfakql5mJfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731361836; c=relaxed/simple;
	bh=t4d/nEobsFekE7C1jMiWvcDchlls80EWaT/fBrpvbmM=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=nJ1JcOlJZdyAgefWJT5e6LW+aQHMsV80sNk9pwZrI3ASgO/Q26MOSpefGRWv2gdEfllUN6Aemk7babkEyoOAFq/3/644q4W/jR4CFj9VlDn0N1qXwS6btD5MUA3a7dKdz28/PsTdpekQ5xKY+NQ4uNfUJAgAA0ETot2b6bNHBM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l8XONRfQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A5CDC4CECF;
	Mon, 11 Nov 2024 21:50:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731361836;
	bh=t4d/nEobsFekE7C1jMiWvcDchlls80EWaT/fBrpvbmM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=l8XONRfQPX8yuudW1XrevS/rEbA1F+cUrmZMCMvx1d3cNTNt0F2U2zD58Ny9ymIO0
	 wWxp6Ggxmf3hRKmNy15wAj9rSR84MsMmu2f8/+AjmvixluTKFZiw1ACly2xzPGqugp
	 lZckqZSlnyHLPrXPZctfe0TRuE07aDysIWT7S2KrkvrIxmVZemCjcuogJCyo8e16g4
	 24dvRwsJQIllS2kpjeYap+6m6ahPOjTuW6CF2VOHBFTnHwC128SSI3s0b6wNfZs7z5
	 7VTSfE0dBInfHwQP69FRQsUY++BsrFsOie1IfYOuMIw7eLE65T8pskuRO7l8wN82/7
	 Et9joHZfhuOLg==
Date: Mon, 11 Nov 2024 22:50:33 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: Callahan Kovacs <callahankovacs@gmail.com>
cc: visitorckw@gmail.com, bentiss@kernel.org, linux-input@vger.kernel.org, 
    linux-kernel@vger.kernel.org, jose.exposito89@gmail.com
Subject: Re: [PATCH] HID: magicmouse: Apple Magic Trackpad 2 USB-C driver
 support
In-Reply-To: <20241110175003.13210-1-callahankovacs@gmail.com>
Message-ID: <nycvar.YFH.7.76.2411112250040.20286@cbobk.fhfr.pm>
References: <ZzDHrOr43KO+CtuL@visitorckw-System-Product-Name> <20241110175003.13210-1-callahankovacs@gmail.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sun, 10 Nov 2024, Callahan Kovacs wrote:

> Adds driver support for the USB-C model of Apple's Magic Trackpad 2.
> 
> The 2024 USB-C model is compatible with the existing Magic Trackpad 2
> driver but has a different hardware ID.
> 
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=219470
> 
> Signed-off-by: Callahan Kovacs <callahankovacs@gmail.com>

Thanks for the fix.

I've moved the 'Link:' tag to the SOB area, and applied to 
hid.git#for-6.12/upstream-fixes.

-- 
Jiri Kosina
SUSE Labs


