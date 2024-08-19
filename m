Return-Path: <linux-input+bounces-5687-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BA77957440
	for <lists+linux-input@lfdr.de>; Mon, 19 Aug 2024 21:17:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 19D651F2465D
	for <lists+linux-input@lfdr.de>; Mon, 19 Aug 2024 19:17:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF58D1DB449;
	Mon, 19 Aug 2024 19:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JUAcuyu6"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F3C2186E56;
	Mon, 19 Aug 2024 19:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724095023; cv=none; b=dSaBC6tMnS/JlPJrkGGMt1i1iVq56uRRIerNTmLj8kMbU5vaZ5WB+FXXdsUiOZAF+dVn3apGUp+4vtQbf6Q3IRPnCigoXjzLpGucB2WovxQe/ytg3LDWeo8YEesdG39UCMlCSSx+6fmSwfT2NA44GKTtw67xeF7IrhQn6WDTnBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724095023; c=relaxed/simple;
	bh=wyni4SQymmhEdI0hHv2ZuqZldHiADsjbDaFR8QbjdkU=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=roIRTX+kD5f87fbDqDFMPXAa4FBU2JYo6ZV+q7/LZEXGViWdRTKO6MsHERiSIJWhXuav2HMwy7I6U2jiPdkPo5Vr/nCSBl7wVHljuxMCw37xX3wQdpYnPFDPZpRHBqjPwkRZC469u65AgaMHFhEgevSgX29OlkkzWCVCNIK7lCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JUAcuyu6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93546C32782;
	Mon, 19 Aug 2024 19:17:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724095023;
	bh=wyni4SQymmhEdI0hHv2ZuqZldHiADsjbDaFR8QbjdkU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=JUAcuyu6WcEWVo4UhuzTUmHHgtmmnGz8kSNnL5AtXaSZ/pVHyfHpzY4jnIIX5e/Xx
	 3FwQXznOcU4kRFPGdOLcMA/xbnawcCclDlNuVOIldMAmaSmHC8x6z0xbnRFy5nHXQT
	 b4KcckYrHsSqWrbInqSsBEPWofYspGyuNVx7kMNv8KxMmCKxALLxlmaqOS1JQbmSCT
	 9F4ygu8T2x/VZya2QiaIo2bBDL4P0Qa+v0KsCjCQTM/SArZ0/oqBPSgMG5FcZ9qUlY
	 y6sDEKN9z5nT00tfDCdZD0mCsIeqGBkpp8j+UGPx9UnFxkMiM/+dyC6UishkE1Iiqg
	 25i9d9dcVnaPg==
Date: Mon, 19 Aug 2024 21:17:00 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Charles Wang <charles.goodix@gmail.com>
cc: dmitry.torokhov@gmail.com, dianders@chromium.org, dan.carpenter@linaro.org, 
    conor@kernel.org, robh@kernel.org, krzk+dt@kernel.org, bentiss@kernel.org, 
    hbarnor@chromium.org, linux-input@vger.kernel.org, 
    devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 0/2] HID: add initial support for Goodix HID-over-SPI
 touchscreen
In-Reply-To: <20240814024513.164199-1-charles.goodix@gmail.com>
Message-ID: <nycvar.YFH.7.76.2408192116440.12664@cbobk.fhfr.pm>
References: <20240814024513.164199-1-charles.goodix@gmail.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 14 Aug 2024, Charles Wang wrote:

> This patch introduces a new driver to support the Goodix GT7986U
> touch controller. This device is not compatible with Microsoft's
> HID-over-SPI protocol and therefore needs to implement its own
> flavor. The data reported is packaged according to the HID
> protocol but uses SPI for communication to improve speed. This
> enables the device to transmit not only coordinate data but also
> corresponding raw data that can be accessed by user-space programs
> through the hidraw interface. The raw data can be utilized for
> functions like palm rejection, thereby improving the touch experience.
> 
> Key features:
> - Device connection confirmation and initialization
> - IRQ-based event reporting to the input subsystem
> - Support for HIDRAW operations (GET_REPORT and SET_REPORT)
> 
> Signed-off-by: Charles Wang <charles.goodix@gmail.com>

Now queued in hid.git#for-6.12/goodix-spi. Thanks,

-- 
Jiri Kosina
SUSE Labs


