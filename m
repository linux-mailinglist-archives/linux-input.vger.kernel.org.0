Return-Path: <linux-input+bounces-14469-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B4733B42A22
	for <lists+linux-input@lfdr.de>; Wed,  3 Sep 2025 21:46:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 80765563714
	for <lists+linux-input@lfdr.de>; Wed,  3 Sep 2025 19:46:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED48D2D8377;
	Wed,  3 Sep 2025 19:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ewhac.org header.i=@ewhac.org header.b="uypimqPU"
X-Original-To: linux-input@vger.kernel.org
Received: from siberian.tulip.relay.mailchannels.net (siberian.tulip.relay.mailchannels.net [23.83.218.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA7DD31AF1B;
	Wed,  3 Sep 2025 19:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.218.246
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756928752; cv=pass; b=CB7A/KWpHDHYzmZbcf2zzziB2Ei1u9oUkTr7GUqYWl+gyF+XslaU+2Mnn9EG+DXuThfmPqp4gFenVxrAWgGB/QSkHD7cO2+/ySgHZSx1JiOrs9Uy5a8BhCgvjV5ckXZlCmDO11TVmOOzZygR2W9nJ/zL+1/Ecd33TSpWrxDo11k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756928752; c=relaxed/simple;
	bh=/lqwBrT2KiKCY6VWpjadnR3Dl/NWttxU1QKnKxMWr9Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ldW+5GQHGKQ58tHu130MP45Ed/lj3ZyCd92Yletg5BjDLqv8bAJ6tt+NBz3iD/jYbDWyevvvexyCYcoa1fQ2GLzvUJ2dmYn9Vxmo2Yl1EXnACZV/MMNy8pPetwP6E6MsTpZhoRzKaYwYFHVxSISL6DQAuHRYbyb81FiYSOgVbf8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ewhac.org; spf=pass smtp.mailfrom=ewhac.org; dkim=pass (2048-bit key) header.d=ewhac.org header.i=@ewhac.org header.b=uypimqPU; arc=pass smtp.client-ip=23.83.218.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ewhac.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ewhac.org
X-Sender-Id: dreamhost|x-authsender|ewhac@ewhac.org
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 36F954E6231;
	Wed,  3 Sep 2025 19:39:28 +0000 (UTC)
Received: from pdx1-sub0-mail-a231.dreamhost.com (trex-blue-1.trex.outbound.svc.cluster.local [100.101.142.254])
	(Authenticated sender: dreamhost)
	by relay.mailchannels.net (Postfix) with ESMTPA id C2C854E605D;
	Wed,  3 Sep 2025 19:39:27 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1756928367; a=rsa-sha256;
	cv=none;
	b=WOnWJn50wifg30n3sgbnPsrubNeiWBRS8knOY2wiAvNVW+WP9d+k2UmJVdQ0LJ+iAK93Gj
	2Sd2sHhAP3MM2XadCiYpFCZEPgxzpOzh4F4gS4X89FnF9F67Lyw7ZTH9keUlPcTMBRv1cj
	XRzCm7FWMvGXtsqeCs14hzGAMDYFeB2rwyxsh6WD6sHv7owi5GpIP/cetUhUKhg1xKrkMr
	qUPKzdyz20fNP4l+frabrgZAt10Y9nDq1fmKkZVixHb9gZI4qdEpTAuoxINulxcdsGoejm
	4qQhh8HpiLMiU7rGfZBhYoXpNd+V1IepRsbBluP/T+TPr4xt7PxfvfZtlVhRgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1756928367;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=32KmRQOubIZ7b2nXAt8ScB+j9QgEziPtpRpQD+wJ5MQ=;
	b=iua//AcFPzWbXryvqYf2vJ5lydpg/NNpbEHQqHN/TiWiyZ6C2rEL1tfzyNN9IaZhtOYD5M
	8kPKQeBmE2DeI4mT8HAsRh4/mbROMocQycMg7NZYfdxzO4P9SgiwVBb8bikmoZqlsMKeDp
	9AO15zAl5bOH5yp5LAlqFqmPP8VT6j6+04aszQlr01hJsmjtnxGyBdWvRtbnzbN/ERdG7K
	gEqBS5bYHGFpqbBsIJKw3Wr/OGNuSOcpDlhziP+0fMNHjflgQLD983+BtAJ9QgBZEqBXkt
	EpkTxMQUIc8PJd+pzlcnIObJtpMLTbH+tqDpa6C1IzEfJ0Z9GIjU3ORlxaqKkw==
ARC-Authentication-Results: i=1;
	rspamd-c79647f57-fx57s;
	auth=pass smtp.auth=dreamhost smtp.mailfrom=ewhac@ewhac.org
X-Sender-Id: dreamhost|x-authsender|ewhac@ewhac.org
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|ewhac@ewhac.org
X-MailChannels-Auth-Id: dreamhost
X-Battle-Blushing: 10a48e7954cff760_1756928368042_1125601722
X-MC-Loop-Signature: 1756928368042:2509648997
X-MC-Ingress-Time: 1756928368042
Received: from pdx1-sub0-mail-a231.dreamhost.com (pop.dreamhost.com
 [64.90.62.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.101.142.254 (trex/7.1.3);
	Wed, 03 Sep 2025 19:39:28 +0000
Received: from ewhac.org (unknown [135.180.175.143])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: ewhac@ewhac.org)
	by pdx1-sub0-mail-a231.dreamhost.com (Postfix) with ESMTPSA id 4cHCbz4Y1Rz26;
	Wed,  3 Sep 2025 12:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ewhac.org;
	s=dreamhost; t=1756928367;
	bh=32KmRQOubIZ7b2nXAt8ScB+j9QgEziPtpRpQD+wJ5MQ=;
	h=Date:From:To:Cc:Subject:Content-Type;
	b=uypimqPU7ZRv48Ccg2fqSUwAgOdjXaYmUQnAN7ZIKVsKVe65w2RO64UOqmmZ8DLnD
	 5pLFe6NXV/pqfbcnh2pSqmwL6T6CwQB+PlI8jp+tNw5/wNrSlXPqvD7l2Xfba80fQW
	 OxYwU1oF52s4O3anjF7WDabzJCGrf/w7WcUPxqjZ/pl3dC5xiMSi2T6LeHvDx6mjdS
	 Eg1eY+Uaxl0P1AdxVI87JfheZSPdoVNTCogrGNFpyngIEZO6jGzChbv9addcns7Chv
	 gLXXqqRfCLhK+WtuX+KnagPQNVn1gfie8ZDY5/KKTMKr2HN2ZRelSbzdMEK7d+9rDr
	 pIP0iFGcSE+cA==
Received: from ewhac by walkies with local (Exim 4.98.2)
	(envelope-from <ewhac@ewhac.org>)
	id 1uttKI-00000000aQO-3wFX;
	Wed, 03 Sep 2025 12:39:26 -0700
Date: Wed, 3 Sep 2025 12:39:26 -0700
From: "Leo L. Schwab" <ewhac@ewhac.org>
To: Hans de Goede <hansg@kernel.org>
Cc: Kate Hsuan <hpa@redhat.com>, Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] HID: lg-g15 - Add support for Logitech G13.
Message-ID: <aLiZbkKgIC8jIqE9@ewhac.org>
References: <20250814212641.197573-2-ewhac@ewhac.org>
 <7d356834-5795-4979-9f51-0ffcec52ae1d@kernel.org>
 <aLSntMknSv3lMarZ@ewhac.org>
 <8ae2cc92-5dfe-466d-95fd-da74309d7244@kernel.org>
 <2de88077-eb8d-44ad-a96a-5db889913cba@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2de88077-eb8d-44ad-a96a-5db889913cba@kernel.org>

	For some reason, your replies aren't making it to me directly -- I
had to find and scrape your reply off the LKML web site:

On Tue, 2 Sep 2025 23:05:06 +0200, Hans de Goede wrote:
> On 2-Sep-25 22:41, Leo L. Schwab wrote:
>> 	This does not happen.  The G13 accepts and remembers backlight color
>> settings even when the LEDs have been toggled off locally.
>> [ ... ]
>
> I see, interesting.
>
> So what happens if you turn off the backlight with the toggle button on the G13
> and then write 0 to brightness in sysfs and then press the toggle button again?
>
	It's a little difficult to see, but the backlight turns back on with
minimal brightness.  To my eye, it looks like it's displaying #000001.

> Right it does seem that using cdev.brightness_hw_changed is valid in
> this case.
>
> But the LED API is supposed to have the brightness attribute present
> the actual current brightness of the device.
>
> I'm not sure how upower will react if the poll() on brightness_hw_changed
> wakes upower up and then the reported brightness is unchanged...
>
> I need to think about this a bit and check the upower code, let me
> get back to you on this in a day or 2 ...
>
	Certainly.

>> 	This prompts the question:  What is the full intensity calculation
>> formula intended to be?  The docs appear to be rather quiet on this point.
>> If we assume all intensity/brightness values (0-255) are essentially mapped
>> to the range [0.0, 1.0], then it seems to me the calculation is:
>>
>> 	out = intensity * brightness * brightness_hw_changed
>
> The way the API is intended to work is that after a hw-brightness-changes
> event brightness == brightness_hw_changed in sysfs.
> [ ... ]
> IOW the formula should always be:
>
>  	out = intensity * brightness
>
	Then this should be written down somewhere.  A quick ripgrep through
the 6.16 source tree shows brightness_hw_changed is used in *very* few
places so far, so it'd be good to get this clarified before too many other
people start having competing interpretations.

> As mentioned before I need to think a bit about how to handle
> this. [ ... ]

	Fair enough.  I'll hold off on spinning a v6 until I hear from you.

					Schwab

