Return-Path: <linux-input+bounces-7216-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D01C997031
	for <lists+linux-input@lfdr.de>; Wed,  9 Oct 2024 18:00:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C272DB22D9E
	for <lists+linux-input@lfdr.de>; Wed,  9 Oct 2024 16:00:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75A691A0BD1;
	Wed,  9 Oct 2024 15:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="fDxw01F+"
X-Original-To: linux-input@vger.kernel.org
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8CFF1925B7;
	Wed,  9 Oct 2024 15:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728487983; cv=none; b=bfr+ftOe05kzQmKy0FRUFGVkxskvS7KLVRXGI4N7iMmDRe9kgiqSE2QgtWAAzAN0p1Al7y57ofiTTS+9S6k4PL9Se0wEOcKCWJ/8ihLZ2Cevrbm4A2F33bv0VYubD72ymFW1S9viIWCxS5DGa4JlFNk5vPZJeCjLAIhwgZRlzZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728487983; c=relaxed/simple;
	bh=xTKQE0E3XFipZZimmr0I2w00LWwqdgcUEvLWMCuUEPM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SUw6/BwmI/4ZDjoZvZgncn9deJkwbT6HftqrEViy2h3WpOeCnflwUTi7JCmX2kIobN2wxtGxXhbZlK0qYnAf2W5d/c8BW4/RfebHt+/SkkPuMPQW8cATSATp7inXl2wD6sU9pWs9W5s3qDspGlyReT4S4OmhhwYyGeJUaXbQd/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=fDxw01F+; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:
	Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
	In-Reply-To:References; bh=1cXHLf4g35w9OxZIMHQ1IpFATKoHliVyAKs7WIueLP0=;
	t=1728487981; x=1728919981; b=fDxw01F+hgq8p5eHEQkQK1B4U95v00BMj1FUozcnO3U0p0Q
	Ixa9b3OhsNlZOSFKYB5zm5y+ZFjhr5oC0s0CXqHKz5/Bujo/0Zmnc+xflcEGbTh/M6DPSG4+07KT/
	OIAzPv5VO+GUOroxvE5kHXzche3nLIBCUU2IdjqvftqeSII2PlNzbxEAptDQXgq9yrqO0gZp72wgj
	bP0+xzeF8VHsfIuX5rH5frxFo0LFU/fFPhyofG3jfwj3LCsbXD98MzAzbx5qmfADxioWhrMobDOk1
	YTLfkMPkCKT8puMxIZDNr0lP/pMcp0kzOr4hNgALbeac0Go8fUSnSSsv9x1drx6A==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1syYgB-0006MY-RV; Wed, 09 Oct 2024 17:32:47 +0200
Message-ID: <5b352033-2738-4804-86f8-d99b7701d655@leemhuis.info>
Date: Wed, 9 Oct 2024 17:32:47 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] HID: amd_sfh: Return immediately if no sensor is found
To: Basavaraj Natikar <bnatikar@amd.com>,
 Linux regressions mailing list <regressions@lists.linux.dev>,
 Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Cc: jikos@kernel.org, linux-input@vger.kernel.org,
 Chris Hixon <linux-kernel-bugs@hixontech.com>, Skyler <skpu@pm.me>,
 Richard <hobbes1069@gmail.com>, Benjamin Tissoires <bentiss@kernel.org>
References: <20241003160454.3017229-1-Basavaraj.Natikar@amd.com>
 <a3fb27a2-5167-4880-9102-eaf0f47df398@leemhuis.info>
 <uupvw2jw6j5wkwtfwljipmpx4kynv6k3wqgy6sg3crw5r27rtm@mudhwifihmtw>
 <79320190-8461-4a92-bde2-29a3988a6782@leemhuis.info>
 <2214cdc6-2384-dc6a-f77c-fbbe53d979a1@amd.com>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Content-Language: en-US, de-DE
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <2214cdc6-2384-dc6a-f77c-fbbe53d979a1@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1728487981;682e4ecc;
X-HE-SMSGID: 1syYgB-0006MY-RV

On 09.10.24 16:52, Basavaraj Natikar wrote:
> On 10/9/2024 3:50 PM, Linux regression tracking (Thorsten Leemhuis) wrote:
>> On 04.10.24 11:12, Benjamin Tissoires wrote:
>>> On Oct 04 2024, Linux regression tracking (Thorsten Leemhuis) wrote:
>>>
>>> PS: sorry, I know this is a long standing issue, but I'd rather not
>>> paper over a bigger issue :/
>
>> Yeah, me to!
>>
>> There was a new patch in bugzilla and people tested it (see
>> https://bugzilla.kernel.org/show_bug.cgi?id=219331 for details) , but
>> nothing has happened now for 48 hours, so please allow me to ask:
>>
>> Basavaraj Natikar, is there any hope that a proper fix will emerge soon?
> 
> Yes , please find link for the fix as mentioned in bugid.
> 
> https://lore.kernel.org/all/20241009144757.3577625-1-
> Basavaraj.Natikar@amd.com/

Great, many thx!

Nitpicking: still no stable tag though. :-/ And ideally Richard and
Skyler would get a "Reported-by" as well.

Ciao, Thorsten

