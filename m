Return-Path: <linux-input+bounces-15799-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id C036CC1F9AA
	for <lists+linux-input@lfdr.de>; Thu, 30 Oct 2025 11:41:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 6B75934DFF0
	for <lists+linux-input@lfdr.de>; Thu, 30 Oct 2025 10:41:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0605E33F372;
	Thu, 30 Oct 2025 10:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TzqjmY1Q"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D09A9335066;
	Thu, 30 Oct 2025 10:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761820891; cv=none; b=oRILv6InX3eyaShJSOX9Imi4WcVpmR/ByH+r00G2e5qoElezJbgKcb/yozuLVp0FyzdKA+KhdJuPPQwJNN9rvOtP7vNygI5YA3OWoYqYuBUzWEO7LL2+37pNzVj91u/+tApNj8CjUJ7J48SfzjS6cnLBmVm0uTsCyqdAZPdoSZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761820891; c=relaxed/simple;
	bh=dste8dGV0spTsUvkMaIKH0b3wWJ6QY8iAPO5igecc28=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=QwpCs7x+jJk4orQOQyRQ+8LY/4QLaqb//GCSHm+ubDI6U7+WbNLU1GY9HXF9qX05UVYfimsB9myDlTxFCD09zAAmCOvtMNjBeSuq7EwAe+EZwPbUWJSUveBJdDDB02o+kLTJBR9Yn9F0K9IVUHmK184EYUcUXhmHdIsX2BgKHOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TzqjmY1Q; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECD67C4CEF1;
	Thu, 30 Oct 2025 10:41:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761820891;
	bh=dste8dGV0spTsUvkMaIKH0b3wWJ6QY8iAPO5igecc28=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=TzqjmY1Q1fDtD23WVfFm37sR4zoQ2O/bPp+u5S74vcEyvaFIcQR1KpbaqgfxGLF6I
	 +bxDmc7SCOMLLnlQIlSogDIz9a4j5vw5B5qgsnJrSNpL3/IvzglT3JkEhwogekf/ac
	 cEfdL06RbwEaEfkqWuQm6Xl5VhUHmmhV54DqpXef/wr/ljYQ7dBufFP/KfRf8nRj0d
	 kq5ROCPKAVcSKFQpTLWYgmaFp54TqfM02rU6eOjvVt41nB6kqhqADv3UhF2SlF2MF5
	 JBffLQwVrCET3WRWmvfm6x/1oM74te6Y0rSmsVHdH5F+WlhkmianY6ZfjjKv5eWqY1
	 38+2mIGEMfGdQ==
Date: Thu, 30 Oct 2025 11:41:28 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: Lauri Tirkkonen <lauri@hacktheplanet.fi>
cc: Benjamin Tissoires <bentiss@kernel.org>, linux-input@vger.kernel.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] HID: lenovo: fixup Lenovo Yoga Slim 7x Keyboard
 rdesc
In-Reply-To: <aPM1I35YXWlabuKQ@mail.hacktheplanet.fi>
Message-ID: <5r0q48r7-6o9s-0831-s9n8-8qo0q6140op6@xreary.bet>
References: <aPM1I35YXWlabuKQ@mail.hacktheplanet.fi>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 18 Oct 2025, Lauri Tirkkonen wrote:

> The keyboard of this device has the following in its report description
> for Usage (Keyboard) in Collection (Application):
> 
> 	# 0x15, 0x00,                    //  Logical Minimum (0)                52
> 	# 0x25, 0x65,                    //  Logical Maximum (101)              54
> 	# 0x05, 0x07,                    //  Usage Page (Keyboard)              56
> 	# 0x19, 0x00,                    //  Usage Minimum (0)                  58
> 	# 0x29, 0xdd,                    //  Usage Maximum (221)                60
> 	# 0x81, 0x00,                    //  Input (Data,Arr,Abs)               62
> 
> Since the Usage Min/Max range exceeds the Logical Min/Max range,
> keypresses outside the Logical range are not recognized. This includes,
> for example, the Japanese language keyboard variant's keys for |, _ and
> \.
> 
> Fixup the report description to make the Logical range match the Usage
> range, fixing the interpretation of keypresses above 101 on this device.
> 
> Signed-off-by: Lauri Tirkkonen <lauri@hacktheplanet.fi>
> ---
> v1 -> v2: moved to hid-lenovo from hid-i2c, renamed hid-ids macro to
> clarify the device only refers to the keyboard
> 
> v1: https://lore.kernel.org/all/aOdLxAEYQpV2zp77@mail.hacktheplanet.fi/

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs


