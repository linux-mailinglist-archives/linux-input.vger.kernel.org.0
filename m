Return-Path: <linux-input+bounces-12145-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 56B7AAA8D69
	for <lists+linux-input@lfdr.de>; Mon,  5 May 2025 09:51:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7E53A188FF30
	for <lists+linux-input@lfdr.de>; Mon,  5 May 2025 07:51:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B59A81E5208;
	Mon,  5 May 2025 07:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="dS3FM6yq"
X-Original-To: linux-input@vger.kernel.org
Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB46B1E1DEB;
	Mon,  5 May 2025 07:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746431476; cv=none; b=TcLy9Bv33lgeNgHNs/UjWZl5J0ukkJ2JIAKr01UK8NzcPZOYlyNRqURnkGMbPjtNx8k4pk6gVyDGXAWK/wdnqbnx75mWMxTbBrqUiGOPcT2eotmrJxYSacF8CHSFxszCmxsOSclkdoOHbfKNNCmNnVrRuv+QdSHi6xkXqQ1Acpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746431476; c=relaxed/simple;
	bh=vnN5BEC8OX9oxljcSyOMiwIjnKbXmHB/p0IODuQ5GmY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ljrTRNLl2m865LhnrDVnCc08mzrf3QIeCirBQ9T3qaghhCahYpWQ89BOoKLL8NHkVLIPfZXQ35A0mfe0+he67xoReBIWQXcJYa+VmiyFc8mPUN1pevxg0gZ5J5ij4aiUga4rDJ0AolKmoZuqKWTAq2tukrUYXKJp4jjgfMIdZXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=dS3FM6yq; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Received: from [10.6.0.9] (host-88-217-226-44.customer.m-online.net [88.217.226.44])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPSA id 6C0892FC0052;
	Mon,  5 May 2025 09:51:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1746431471;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/Q4PBsRaz4XfXp8FViyoyeWKnzhRQbXCVdq9fiCbbfM=;
	b=dS3FM6yqpKztlQJCMR9WczNV2rEHEmAuLBHTgVtbYFuNniM0xEXlhzJViyV2j73qUHhyxN
	aIoBiAQLQ4anW0hjn1cxkD08ueRbuxTj7RLg9/iRV8ssinqE8zEaJjftzLNwDEzH9YVkrk
	6LUY7ZPFi4bijV8zQd8AANw0EDsQFL0=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
Message-ID: <e3268722-9b06-45e6-a7e6-44d251ab05e9@tuxedocomputers.com>
Date: Mon, 5 May 2025 09:51:11 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 0/1] platform/x86/tuxedo: Add virtual LampArray for
 TUXEDO NB04 devices
To: Pavel Machek <pavel@ucw.cz>
Cc: hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com, bentiss@kernel.org,
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 platform-driver-x86@vger.kernel.org
References: <20250425210043.342288-1-wse@tuxedocomputers.com>
 <aAyXo7m8pvJc258V@duo.ucw.cz>
Content-Language: en-US
From: Werner Sembach <wse@tuxedocomputers.com>
In-Reply-To: <aAyXo7m8pvJc258V@duo.ucw.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

Am 26.04.25 um 10:21 schrieb Pavel Machek:
> On Fri 2025-04-25 22:53:28, Werner Sembach wrote:
>> Note that I'm away from my work PC for the next week so expect my next
>> response the monday after.
> Forgot to cc LED lists. NAK.
> 								Pavel

This patch does not touch the led subsystem in any way. It implements a part of 
the HID standard only.

Best regards,

Werner



