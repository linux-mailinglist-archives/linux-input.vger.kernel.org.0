Return-Path: <linux-input+bounces-7024-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BA30C98DDB8
	for <lists+linux-input@lfdr.de>; Wed,  2 Oct 2024 16:51:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6962B1F26F9C
	for <lists+linux-input@lfdr.de>; Wed,  2 Oct 2024 14:51:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AFF11D0E09;
	Wed,  2 Oct 2024 14:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=trvn.ru header.i=@trvn.ru header.b="DY1HOEfW"
X-Original-To: linux-input@vger.kernel.org
Received: from box.trvn.ru (box.trvn.ru [45.141.101.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D61A1D1752;
	Wed,  2 Oct 2024 14:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.141.101.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727880546; cv=none; b=C2zIfT6JYFRRM42GGI/xSYkCvaMY1lyH6UQAY4vyukyIdTCC/LqUtiywB160B/8HgeNrMdMUAIkiSVoBR/agFxGBuCCnx5QxW3IOJbysD+0xSLc6jFQEY/2F4Mxo5UCB9EZ4rax+IAEfGXpFWnLl/WiPYLIX1cBBdHwOaZ063yA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727880546; c=relaxed/simple;
	bh=unNzVMgZLa9b7qANAQd3QzB2JJ6EBwVxrZ1b1UrD0qI=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=P3gca0Sc8zQ0ylnf4Fy8DpYps0fdRi7SUy+1j4JCPwjuKdj1+u3scZFQyPckJZw7Eqgnz0V7GXBeOCFWp39RZOzzGFm7HlAcgs2cLedYfdqnrAICLj8nomn5+rfQrn37nsAgIlRKrtn8qjR16Pxk875PRoXH+IAAkn45/NI+AJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=trvn.ru; spf=pass smtp.mailfrom=trvn.ru; dkim=pass (2048-bit key) header.d=trvn.ru header.i=@trvn.ru header.b=DY1HOEfW; arc=none smtp.client-ip=45.141.101.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=trvn.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trvn.ru
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=trvn.ru; s=mail;
	t=1727880537; bh=unNzVMgZLa9b7qANAQd3QzB2JJ6EBwVxrZ1b1UrD0qI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=DY1HOEfWOWpnjofIy45tq76qo8M8U4tEYeeJcOhDZx7i0eGri2Oyn7UHh60uGzf6R
	 PYYNy0KFRCw3pjRkK4wYH/YhjkX/dnJgG+Q75aDud/R2hslHEy2JmmZQKV1w6is9pP
	 FbkaigTdFei9HvvmBbAQConiyQAaVu4SojLUbq/5qRvfq2Q04CIz1sF6Aku1wSPHDs
	 jwN9G9lO0/AJJ7bvzBPnG/SkaM1pV2QYN/DlkJEzbqMyAHARCcLpWJk/SjPDV1BEJC
	 HC8s2XQF+ibjP4xX+0ExdIKSU6ybuE/sbceLeTQJqZIZwhkiUWuPYVcU3SXYxoJvGp
	 kfDuMqWeHrhwg==
Received: from authenticated-user (box.trvn.ru [45.141.101.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by box.trvn.ru (Postfix) with ESMTPSA id 565BD18832;
	Wed,  2 Oct 2024 19:48:57 +0500 (+05)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 02 Oct 2024 19:48:57 +0500
From: Nikita Travkin <nikita@trvn.ru>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, Jakob Hauser
 <jahau@rocketmail.com>
Subject: Re: [PATCH] Input: zinitix - Don't fail if linux,keycodes prop is
 absent
In-Reply-To: <CACRpkdZj57_jGDJiXgeatntUMKLdUV-GWCN=crkDRD2sUgQ95w@mail.gmail.com>
References: <20241002-zinitix-no-keycodes-v1-1-e84029601491@trvn.ru>
 <CACRpkdZj57_jGDJiXgeatntUMKLdUV-GWCN=crkDRD2sUgQ95w@mail.gmail.com>
Message-ID: <4b37b70b52234017e0ade2710c276f3f@trvn.ru>
X-Sender: nikita@trvn.ru
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Linus Walleij писал(а) 02.10.2024 19:11:
> On Wed, Oct 2, 2024 at 3:02 PM Nikita Travkin <nikita@trvn.ru> wrote:
> 
>> When initially adding the touchkey support, a mistake was made in the
>> property parsing code. The possible negative errno from
>> device_property_count_u32() was never checked, which was an oversight
>> left from converting to it from the of_property as part of the review
>> fixes.
>>
>> Re-add the correct handling of the absent property, in which case zero
>> touchkeys should be assumed, which would disable the feature.
>>
>> Reported-by: Jakob Hauser <jahau@rocketmail.com>
>> Tested-by: Jakob Hauser <jahau@rocketmail.com>
>> Fixes: 075d9b22c8fe ("Input: zinitix - add touchkey support")
>> Signed-off-by: Nikita Travkin <nikita@trvn.ru>
> 
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> 
> BTW: Nikita have you noticed and weird offsets in your Zinitix
> touchscreens? Mine seem to be off and I need to put my
> fingers a bit below the actual target on the screen, consistently.
> I was thinking maybe calibration support is necessary.

I for sure noticed this in the context of touchkeys: On the device I
have, if you don't enable the touchkeys, the controller assigns
the lines connected to them to the touch grid, which offsets
the real touchscreen by two lines. Effectively this means that
touch surface is stretched a bit below the screen, and i.e. touching
at the very bottom will produce a touch event a bit above
the actual touch point. Enabling touchkeys reassigns those lines
and then the display is working correctly.

This was the prime reason why I've even made the tkey series in
the first place :D

> 
> Yours,
> Linus Walleij

