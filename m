Return-Path: <linux-input+bounces-9116-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B5904A078D0
	for <lists+linux-input@lfdr.de>; Thu,  9 Jan 2025 15:13:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EBC703A8B23
	for <lists+linux-input@lfdr.de>; Thu,  9 Jan 2025 14:12:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80868219A95;
	Thu,  9 Jan 2025 14:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kcSS7QXf"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56767219A74;
	Thu,  9 Jan 2025 14:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736431960; cv=none; b=JYvqHvflK3VC9XbII8tJRaC3j3rHdM2wGRPWxUtVRu1keBTo7RjeWD/ENsvUP5PAynVmsIWsY+oiPDupWNwMlSw1h9/NmcvzliiO/PkiTi1iaWUzl4aUIfOrCcCaycnnOb5343ZsI0kzFqfq+Uy+JbFCqBoL9cLmBNU18yAF6u8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736431960; c=relaxed/simple;
	bh=aLvrL479BWvOS+pH61RodUuuH79O4Ayu76EobzTE43k=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=bCOhxIw3tHYjWofwcJ0T9ziB92mD2DvUbUUMo+u+P9UfxvkbYbAWQFtHu2JBD/ay71IilodLTbRUj6CsPtoVWXz0k30pW+4eUT+F6qik/Noc3u7U3JLWNilEAYPueJPh22I4LLYzodINEio84YhAwYCRh+4lRfK/5zfbjcgFdEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kcSS7QXf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FCCDC4CED2;
	Thu,  9 Jan 2025 14:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736431959;
	bh=aLvrL479BWvOS+pH61RodUuuH79O4Ayu76EobzTE43k=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=kcSS7QXf7tWzp0jCBaiX33Z/ucsbkfagXQ4nKU4W8ZSU65IfdL389c9BOYcaDENWf
	 ay6pE76haPI/2BkHSZXn8+UiMUP6KC3KcfXzirpekv2IziKj/TjFBUCo1pSFypxXZK
	 vyopOzbgBHoXp26Bq1Sxzsxz5bPDsUNX3ZwbSmUOdfuHZ2jlrYhmAIWP0UKJryH3Fw
	 fAJIq8eeuhBtHjBnIphpwMwxZN2O9LnSwFJd4lt+czxYtMKA8AKHCMxdjVO3Pb2Idu
	 A8oyIYjvpClob+UYFgae3KmIpUqpViZM81nlf0/esfFOPmb/Wdj/nkE+H6/NhcAWgU
	 xIj3EgCxBAWAg==
Date: Thu, 9 Jan 2025 15:12:37 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: Benjamin Tissoires <bentiss@kernel.org>
cc: Vishnu Sankar <vishnuocv@gmail.com>, linux-input@vger.kernel.org, 
    linux-kernel@vger.kernel.org, mpearson-lenovo@squebb.ca, 
    vsankar@lenovo.com
Subject: Re: [PATCH v3] HID: lenovo: Support for ThinkPad-X12-TAB-1/2 Kbd Fn
 keys
In-Reply-To: <dytaipha7hln7ktsh3qpwrtlygtn44bv6y2kqr4nuao6ozfd4s@txduug3hioo3>
Message-ID: <r9p69o0r-626q-950r-o73r-p67r88nrp70n@xreary.bet>
References: <20241218143309.86811-1-vishnuocv@gmail.com> <dytaipha7hln7ktsh3qpwrtlygtn44bv6y2kqr4nuao6ozfd4s@txduug3hioo3>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 9 Jan 2025, Benjamin Tissoires wrote:

> > +		/* Power-mode or Airplane mode will be called based on the device*/
> > +		case TP_X12_RAW_HOTKEY_FN_F8:
> > +			/*
> > +			 * TP X12 TAB uses Fn-F8 calls Airplanemode
> > +			 * Whereas TP X12 TAB2 uses Fn-F8 for toggling
> > +			 * Power modes
> > +			 */
> > +			(hdev->product == USB_DEVICE_ID_LENOVO_X12_TAB) ?
> > +				report_key_event(input, KEY_RFKILL) :
> > +				platform_profile_cycle();
> 
> Hey,
> 
> FWIW, this broke the CI with [0]:
> ERROR: modpost: "platform_profile_cycle" [drivers/hid/hid-lenovo.ko] undefined!
> 
> We are likely missing a DEPENDS or a SELECT in the Kconfig

Thanks for catching it!

Alternatively, we can just make the TP_X12_RAW_HOTKEY_FN_F8 case 
conditional on CONFIG_ACPI_PLATFORM_PROFILE.

Vishnu, can you please send a fixup patch?

Thanks,

-- 
Jiri Kosina
SUSE Labs


