Return-Path: <linux-input+bounces-9836-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F6F1A2C335
	for <lists+linux-input@lfdr.de>; Fri,  7 Feb 2025 14:04:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 49A76188D50E
	for <lists+linux-input@lfdr.de>; Fri,  7 Feb 2025 13:05:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5F291E00A0;
	Fri,  7 Feb 2025 13:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZJa4zIS/"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D6B12417C9;
	Fri,  7 Feb 2025 13:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738933492; cv=none; b=OJvo4wUV94rtXFRAQVnZ6cjyiDYxnqdo1Easr3DiDr9XAcZrRk5G8eTSge5lnm31aBgIMzbL9UgfxSUUeYAtup/wwxaky8oKrIo9QZNIRneIeBq2R5LGIvWeEf7wVdfTDrgcfL+Qs58L56IY5eMbL/nsf8DhAKORshEdfAJuC+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738933492; c=relaxed/simple;
	bh=2Wm7yhjrV8kBL3GSqK0lXx4pISUYrPrALXpQctK7KXI=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=X0lAC4OIGFPC1C810mQUEXM+On3+GnVnb5ZoRmmkl8UnreIdt/Kj58EBke3JsN82wQSms/tPsRcaYp00PEVvjk9bhsZcLpLDxtRjVCHh0TuC1sc3LJWSwJCrTje/I72Y+3MF9AlVxCojPP8eZoIvwLnlADy4hn3XM+T30G5OEIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZJa4zIS/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9898C4CED1;
	Fri,  7 Feb 2025 13:04:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738933492;
	bh=2Wm7yhjrV8kBL3GSqK0lXx4pISUYrPrALXpQctK7KXI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ZJa4zIS/t0YVKLltmPpKE9VHLY+4HPQP6OvcjWhtOwCOiSQI44GqY+lo6ECEvfWEb
	 w1kJLXrZnuOS/3x/PwNf6H2/UwhsDXzKU725BkqzxaVqG0T3xB6ffuVnS4aeilZBqU
	 BunObboFiv2U/rn5wDcR8dOSx3H0MCCIwct/G25jooaNldtQBdN5jYSrU48dVdm29/
	 a9Le84gfSsGKH+C9/T7H+c6XtljXB7nogE0MfWaCoVwVB6+DoABY5Y1lncGqYG24R+
	 GRK2w00W1onA3c6cAJ4ph4C10AmwJx57Oz7lzX1qPlLJkJNQxsPabxOXGElMGJeQwv
	 YiEeJ/SYQSArQ==
Date: Fri, 7 Feb 2025 14:04:49 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: Aditya Garg <gargaditya08@live.com>
cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>, 
    "bentiss@kernel.org" <bentiss@kernel.org>, 
    Kerem Karabay <kekrby@gmail.com>, 
    Orlando Chamberlain <orlandoch.dev@gmail.com>, 
    "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>, 
    Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 0/4] Touch Bar driver for Apple Macs with T2 Security
 Chip
In-Reply-To: <E5CC067F-5CC8-4B33-B50C-40163C8A46E8@live.com>
Message-ID: <9nrp7513-r931-12ro-5565-76p2835p02pr@xreary.bet>
References: <E5CC067F-5CC8-4B33-B50C-40163C8A46E8@live.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 31 Dec 2024, Aditya Garg wrote:

> From: Aditya Garg <gargaditya08@live.com>
> 
> This patch series adds support for Touch Bar on found on MacBook Pro
> models with T2 Security Chip. These drivers support the mode found on
> Windows Bootcamp drivers.
> 
> V2: Added checks to the keyboard driver to ensure backlight driver is
> initialised first.
> 
> Aditya Garg (2):
>   HID: hid-appletb-kbd: add support for fn toggle between media and
>     function mode
>   HID: hid-appletb-kbd: add support for automatic brightness control
>     while using the touchbar
> 
> Kerem Karabay (2):
>   HID: hid-appletb-bl: add driver for the backlight of Apple Touch Bars
>   HID: hid-appletb-kbd: add driver for the keyboard mode of Apple Touch
>     Bars

Applied now to hid.git#for-6.15/apple. Thanks,

-- 
Jiri Kosina
SUSE Labs


