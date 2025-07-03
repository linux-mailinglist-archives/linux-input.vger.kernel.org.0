Return-Path: <linux-input+bounces-13354-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 96D4DAF6BCF
	for <lists+linux-input@lfdr.de>; Thu,  3 Jul 2025 09:43:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4B75F4E26BB
	for <lists+linux-input@lfdr.de>; Thu,  3 Jul 2025 07:42:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3334A29A9E1;
	Thu,  3 Jul 2025 07:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aZQ449BD"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0849B224AF3;
	Thu,  3 Jul 2025 07:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751528564; cv=none; b=tT1QZawoZu8peD4VAqE5qIEyYeX8fj0lBVP3yktHEqSlEqDjLzbOR/ufeMVLqYGbw8t1nj5vO1NMIx2p/qwbJTbnsJc4QQaffAKnZh9nAcmC73mqKWT+Za4a+Q9LXuEiQ5DC01DSik0eP7zsC3BZ1x+CDvXfbTNH/itaBcdTh48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751528564; c=relaxed/simple;
	bh=cF8Ua7YJaZbM5bwnuzDzNl9ZXP/Z8Hj6fkb5ybjwmtU=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=i4RITrKZwvbZpq/rSvusbG01f3hqMwygUiq7elhNlcR1J1Y6yozps4Rp6kOatpkWK6K2WsJl88yzH88h7fP4ofiADcwPOVey85WWxoACh4Zu82YzPggUsIv6x/CCswA7jOo9d7Q7kfiNpGYTmqLQwiEuOYzbrm0l+Fq1tiV2luQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aZQ449BD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30284C4CEF1;
	Thu,  3 Jul 2025 07:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751528563;
	bh=cF8Ua7YJaZbM5bwnuzDzNl9ZXP/Z8Hj6fkb5ybjwmtU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=aZQ449BDgfQl4baEb6f0MYVTl+I4xys59DPYWmOAayE0YX+4pdNJQWRFrKFySCS7+
	 0mYN3/vr94A4U6/mpZukbFHWglSw/pdKZEhzoFXCZZvrClYjzYniuKSfbe925EkN38
	 juanfQg7ybvyphBqatvro7pJAEdSeGStMgd6gF3qSQv6xZDy6ZWpivXBdK2bEDUwC4
	 KDQPOwl2/amp0pDnLMCeP5pd7AM90NeAA+/V51Lj6Q8M+FKg03PGy+Sb5T/NW+lgd1
	 cGfwdmhqbPDMK+RW6JziKFZTx9oUox9mM/zHOySjTe6dkKYpB+6a4z/GGew1TpdO51
	 BZXIE0CfOnNFg==
Date: Thu, 3 Jul 2025 09:42:40 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Aditya Garg <gargaditya08@live.com>
cc: Benjamin Tissoires <bentiss@kernel.org>, 
    "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>, 
    "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
    "stable@vger.kernel.org" <stable@vger.kernel.org>, 
    =?ISO-8859-15?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
Subject: Re: [PATCH v2 0/4] HID: avoid setting up battery timer when not
 needed in hid-apple and magicmouse
In-Reply-To: <20250630123649.80395-1-gargaditya08@live.com>
Message-ID: <q323o796-541q-5q8n-6250-7298q0r46pr6@xreary.bet>
References: <20250630123649.80395-1-gargaditya08@live.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 30 Jun 2025, Aditya Garg wrote:

> Both hid-apple and hid-magicmouse require set up a battery timer for
> certain devices in order to fetch battery status. However, the timer
> is being set unconditionally for all devices. This patch series
> introduces checks to ensure that the battery timer is only set up for
> devices that actually require it.
> 
> v2: - Address the cases of out_err and err_stop_hw left in v1
>     - Create a function to check if the device is a USB Magic Mouse 2 or Magic Trackpad 2
>       to reduce code duplication.
>     - Add 2 new patches that convert the battery timeout to use
>       secs_to_jiffies() instead of msecs_to_jiffies().
> 
> Aditya Garg (4):
>   HID: apple: avoid setting up battery timer for devices without battery
>   HID: magicmouse: avoid setting up battery timer when not needed
>   HID: apple: use secs_to_jiffies() for battery timeout
>   HID: magicmouse: use secs_to_jiffies() for battery timeout
> 
>  drivers/hid/hid-apple.c      | 21 +++++++-----
>  drivers/hid/hid-magicmouse.c | 66 ++++++++++++++++++++++--------------
>  2 files changed, 54 insertions(+), 33 deletions(-)

Now queued in hid.git#for-6.17/battery-timer-fixes.

Thanks,

-- 
Jiri Kosina
SUSE Labs


