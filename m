Return-Path: <linux-input+bounces-1460-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D8B683BBDF
	for <lists+linux-input@lfdr.de>; Thu, 25 Jan 2024 09:25:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0F59E1F23D67
	for <lists+linux-input@lfdr.de>; Thu, 25 Jan 2024 08:25:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B171517BBD;
	Thu, 25 Jan 2024 08:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h7WAuKja"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A86C17BA7;
	Thu, 25 Jan 2024 08:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706171076; cv=none; b=nDCrwaq4Is7do4BslaPZRBvPQ0JUX+z/vynVILdKq4kTYMQIVWrSytIYI+ZGjMmvDJPbifaRg3HugOjfPUzqFcspClgsE5O/mNXLGAie6d66x3PgB0ws7XXAmxWNoRsLAap6oA4PgcRKQ13IYaaNdv23mSwk0OAgcf8u8eiB01o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706171076; c=relaxed/simple;
	bh=3zNlbd8PduFZgHgRqRDR6eQAK2IpX1losQe5ElPbCnI=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=aHPMA3NoXTI0aWkqWs7xxUwQb0B1543VAsmDKroUCKNpxE9xVlPiXK5l1O+HpAPVhqmvHwrXi+VXSZGFKuzisjwmUNq7xi64ZXZ6sM8C5jqALKSUa9resatkGGFQfn1cvpH6SaFafPm2HdBGcxDOQY51hlSqyOpkadxKMp8GOlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h7WAuKja; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDA5DC433F1;
	Thu, 25 Jan 2024 08:24:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706171076;
	bh=3zNlbd8PduFZgHgRqRDR6eQAK2IpX1losQe5ElPbCnI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=h7WAuKjaT3m0WoZdGO1jwpBxK3emP8j44Tz/ewqRjUkBpIaDdA0txnDhnfX7sO1ry
	 ZotIW50wAmw0ouARr+M8An2Hopz+GJOehRXUH5OhupQjBg9kul5Y5JnLV75hQV2rBh
	 2JKgx7QgspI5IKDkvgdYEX14JHj5Hn9XfMi59KDBlkJymInIguW1/H2SrbadMeSRPU
	 98++x9HDsE4Ryfvy9ihXWk25UNwpVYz3Wv646xUhvdUTEu4ruOoIbMj676/8Am4WdF
	 PO50yo9xxW1RBr/A8ZElecfp91s6l06zWPjJrbJkv+F5v+bw9ZuoahW7Uf0Q61HDRV
	 pZU1w+fRb0vnQ==
Date: Thu, 25 Jan 2024 09:24:36 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: Sandeep C S <sandeep.cs@samsung.com>
cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>, 
    gaudium.lee@samsung.com, ih0923.kim@samsung.com, suhyun_.kim@samsung.com, 
    jitender.s21@samsung.com, junwan.cho@samsung.com, 
    linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [HID Patchsets for Samsung driver v4 0/6] Patchsets for Samsung
 driver
In-Reply-To: <20240125043630.4031634-1-sandeep.cs@samsung.com>
Message-ID: <nycvar.YFH.7.76.2401250923470.29548@cbobk.fhfr.pm>
References: <CGME20240125043646epcas5p1d599fecff0fc37926295fc5260a80682@epcas5p1.samsung.com> <20240125043630.4031634-1-sandeep.cs@samsung.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 25 Jan 2024, Sandeep C S wrote:

> Dear Jiri & Team,
> 
> I hope this email finds you well.  As per the review comments given by 
> Mr. Jiri and Mr. Joe Perches in our last converstaion over mail. We have 
> incorporated the feedback on our driver. Please check this set of series 
> and help us to improve samsung driver.
> 
> As of today, Opensource kernel Samsung driver only supports USB HID 
> devices and do not have support for Bluetooth HID devices. Samsung would 
> like to improve the samsung driver and extend it's support for bluetooth 
> devices as well.
> 
> Summary of changes in Samsung driver:
>  1. Add support for below bluetooth devices
> 
> 	Samsung wireless Keyboard
> 	Samsung wireless GamePad
> 	Samsung Wireless Action Mouse
> 	Samsung Wireless Book Cover
> 	Samsung Wireless Universal Keyboard
> 	Samsung Wireless HOGP Keyboard
>  2. Add support for Special key processing on each of the above devices.

I have updated the changelogs so that they are up to the subsystem 
standards (please check the git tree and try to adhere to similar format 
for your next submissions), and applied, thanks for the patches!

-- 
Jiri Kosina
SUSE Labs


