Return-Path: <linux-input+bounces-14598-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 066DAB51FF0
	for <lists+linux-input@lfdr.de>; Wed, 10 Sep 2025 20:10:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2D4FD17366E
	for <lists+linux-input@lfdr.de>; Wed, 10 Sep 2025 18:10:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37B0A33CEB5;
	Wed, 10 Sep 2025 18:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ewhac.org header.i=@ewhac.org header.b="gjbdhntV"
X-Original-To: linux-input@vger.kernel.org
Received: from buffalo.tulip.relay.mailchannels.net (buffalo.tulip.relay.mailchannels.net [23.83.218.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D101433CE8F;
	Wed, 10 Sep 2025 18:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.218.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757527806; cv=pass; b=a7lPO2MjvdMqweZ1aj9ieptK0VpXXlOdZuzMLNhfAhwumlVBFh/n4P33rJtI/mUfjBd6RkPwR3YrtsHiUSlyvYMlOJTXP1afjEica/BHZ12YvkdSxbouuWj32yC1SYhKlS/PHQHoNJHJHeUCJ6aYyUOBWysrBZKncLlcdLV1tjo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757527806; c=relaxed/simple;
	bh=NpmxoZsUwey0OacjJGuugIkas5EOtRdIQDdkfaKqVL4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OQnvtKILHp+2lqQzyJRdjIMFczw15Ag3rJROa1UX5VfObiX+eXCsen6KYc0c/GFd7nS8k0j5w4q7/oKA0DQHnSFp3lVedUwqibS/9/MNFda6zZYBzCxw4mrrNi9LwnoXvz3kh/er6fM8XhXIQDI9kKuTrMTj12X4+tf1Y8YMjCo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ewhac.org; spf=pass smtp.mailfrom=ewhac.org; dkim=pass (2048-bit key) header.d=ewhac.org header.i=@ewhac.org header.b=gjbdhntV; arc=pass smtp.client-ip=23.83.218.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ewhac.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ewhac.org
X-Sender-Id: dreamhost|x-authsender|ewhac@ewhac.org
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id DF7F41A5F7C;
	Wed, 10 Sep 2025 18:02:39 +0000 (UTC)
Received: from pdx1-sub0-mail-a266.dreamhost.com (trex-blue-6.trex.outbound.svc.cluster.local [100.106.206.222])
	(Authenticated sender: dreamhost)
	by relay.mailchannels.net (Postfix) with ESMTPA id E82C31A3C3E;
	Wed, 10 Sep 2025 18:02:24 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1757527345; a=rsa-sha256;
	cv=none;
	b=3na/udicWEp5gUKpNLgTkPRpmOpC8hjQWoF0ql/Z5B+HaGevIk9OOSbATvMgxVoH4uBQpw
	SW7k8SnoiNUgBBx5hsNFUz1Z0JqALCdyzSRaTkIw6nucFGFjRNYL+wYe59y1IjtH4XxBrT
	jYOvZSjeTyCAk86HdTZKtg4Ma8wQRIY3INlw1b+EflTFCpBOOTaHOPcFh1sOJnB7LjGrUp
	NIXLoiF/L+NuEsqvtMLAH4A+T+BdIdb9Y6c8g6ceu/nPX+Ag817l08hentemeMZykqyFcd
	U0zyHfb0jL3tsYmXnIDe0EEtR1+ZBOaAku7inUHPcnQgmS5TTWb4THMF6AT8Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1757527345;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=rdO//gZh/FqnBQSLIPJENj9jxfiss6UL2XJZMP1gSY4=;
	b=0FWg7aJ5SJSPMjodub1v1wqmGv2JhFB1gjztmcBuGb0E+ACWnyyv7leGD0r/vt9CqjJSQQ
	UG7miislgUR18idAVq9CmVrmKDCBL8+gLtNeRXA9jQlgNDHy6eCCJF5Bh2xAzWB/DH9bWW
	gXHAKaQdoH3sgIcyXGgEhPwgC9GDTWQ/l1FGgq4stIx0HqdSmYX3Bpiq6zSxH9oYbiJmlD
	tiYyT2jsGrxMneOU0adEUmaifTcLR7egIxlQop66v2bnFFo88n+60CLd20C7t1cmifz0oF
	Nju+jI/9bB3B77Y2k0s8qZfgzYB2CAEZq+ME7pKoXy9oOjLyBC+HOCTGKqIrAg==
ARC-Authentication-Results: i=1;
	rspamd-7b5fd646f8-v4t85;
	auth=pass smtp.auth=dreamhost smtp.mailfrom=ewhac@ewhac.org
X-Sender-Id: dreamhost|x-authsender|ewhac@ewhac.org
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|ewhac@ewhac.org
X-MailChannels-Auth-Id: dreamhost
X-Cooperative-Belong: 46441c3237a646d2_1757527345215_3103298589
X-MC-Loop-Signature: 1757527345215:1549808334
X-MC-Ingress-Time: 1757527345215
Received: from pdx1-sub0-mail-a266.dreamhost.com (pop.dreamhost.com
 [64.90.62.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.106.206.222 (trex/7.1.3);
	Wed, 10 Sep 2025 18:02:25 +0000
Received: from ewhac.org (unknown [135.180.175.143])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: ewhac@ewhac.org)
	by pdx1-sub0-mail-a266.dreamhost.com (Postfix) with ESMTPSA id 4cMT6m0RGkz6G;
	Wed, 10 Sep 2025 11:02:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ewhac.org;
	s=dreamhost; t=1757527344;
	bh=rdO//gZh/FqnBQSLIPJENj9jxfiss6UL2XJZMP1gSY4=;
	h=Date:From:To:Cc:Subject:Content-Type;
	b=gjbdhntV3M2h5vhT86Bn0eqFmcf2LKDznLqCrSH3XHcsMI+ojQII/ipO6jcFg/ZrV
	 OafFtj4kh1mRbkRM+V0WEyXS05GcJRIWiOvTMZ1P0mC6gDUTnfwJWBT+bbKMTlag1x
	 QHseaicJfQw41i2rp3+l0TZjHdhg6kiZvZNmk1ZYI/vKBU/eqaV9WRw6WVw+fcc8VX
	 Egg80JoQ3uzrqX2m0MGS3PwlQHfldV4BU4wbSShMCjcTIZ5DdSGdk0AelxtPrx7TVs
	 ikfDkQ2N5b6tQpXXJAgtKD9Sz1bTcB3PI/FA2S3ZOkR1BtjI9of23X9JrtwoGnbTWG
	 SlgRjyJ6qQJmA==
Received: from ewhac by walkies with local (Exim 4.98.2)
	(envelope-from <ewhac@ewhac.org>)
	id 1uwP9D-00000001WeT-1boW;
	Wed, 10 Sep 2025 11:02:23 -0700
Date: Wed, 10 Sep 2025 11:02:23 -0700
From: "Leo L. Schwab" <ewhac@ewhac.org>
To: Hans de Goede <hansg@kernel.org>
Cc: Kate Hsuan <hpa@redhat.com>, Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] HID: lg-g15 - Add support for Logitech G13.
Message-ID: <aMG9L2566Hh6b0Kf@ewhac.org>
References: <20250814212641.197573-2-ewhac@ewhac.org>
 <7d356834-5795-4979-9f51-0ffcec52ae1d@kernel.org>
 <aLSntMknSv3lMarZ@ewhac.org>
 <8ae2cc92-5dfe-466d-95fd-da74309d7244@kernel.org>
 <2de88077-eb8d-44ad-a96a-5db889913cba@kernel.org>
 <aLiZbkKgIC8jIqE9@ewhac.org>
 <c12adb45-fa6d-4bb8-afd2-a02e3026d646@kernel.org>
 <aMESMcFLrzqrCdbq@ewhac.org>
 <a6ea0b5d-7586-4529-bf91-d8b966aa986e@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a6ea0b5d-7586-4529-bf91-d8b966aa986e@kernel.org>

On Wed, Sep 10, 2025 at 01:09:10PM +0200, Hans de Goede wrote:
> On 10-Sep-25 7:52 AM, Leo L. Schwab wrote:
> > On Mon, Sep 08, 2025 at 11:08:29PM +0200, Hans de Goede wrote:
> >> There are 2 improvements which I would like to see:
> >>
> >> 1. When the backlight is turned on through the button, you
> >> should pass g15_led->brightness to the notify() call rather
> >> then LED_FULL. GNOME will show an OSD with the new brightness
> >> value shown as a mini progress bar similar to how it shows
> >> speaker volume when doing mute/unmute. This mini progress
> >> bar should show the actual brightness being restored, not
> >> always full brightness.
> >>
> > 	If g15_led->brightness is subsequently changed, should a new
> > notify() call also be made with that new brightness, i.e. should
> > `hw_brightness_changed` be made to track `brightness`?
> 
> No, hw_brightness_changed only track changes done independently
> by the hw. sysfs writes should not call notify().
>
	Erm...  So brightness_hw_changed should only sample
g15_led->brightness on first probe?

	What should happen in this case:

	* Driver loads, probes G13 backlight's current color, calculates
	  brightness to be 50, sets both `brightness` and
	  `brightness_hw_changed` sysfs values to 50.
	* User presses toggle key; backlight is now off.
	  `brightness_hw_changed` now set to 0.
	  `brightness` and RGB values remain unchanged.
	* User writes to `brightness` sysfs value, setting it to 255.  This
	  does *not* turn the backlight back on; `hw_brightness_changed`
	  remains unchanged.
	* User presses toggle key; backlight is back on, showing the
	  original color, but brighter.

	What should brightness_hw_changed be updated to, if anything?

> >> IMHO the best fix would be to use:
> >>
> >> 	hid_hw_raw_request(..., HID_INPUT_REPORT, HID_REQ_GET_REPORT);
> >> [ ... ]
> > 
> > 	Will give this a try.
> > 
	Got this part working.

					Schwab

