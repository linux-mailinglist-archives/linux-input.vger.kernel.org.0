Return-Path: <linux-input+bounces-14749-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D161CB58752
	for <lists+linux-input@lfdr.de>; Tue, 16 Sep 2025 00:18:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4400A1B24AB2
	for <lists+linux-input@lfdr.de>; Mon, 15 Sep 2025 22:19:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DE582BF3DB;
	Mon, 15 Sep 2025 22:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ewhac.org header.i=@ewhac.org header.b="rPFGP5dd"
X-Original-To: linux-input@vger.kernel.org
Received: from silver.cherry.relay.mailchannels.net (silver.cherry.relay.mailchannels.net [23.83.223.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2CBE242D66;
	Mon, 15 Sep 2025 22:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.223.166
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757974713; cv=pass; b=h8XuBXjjXxpZIAPfStj+kBsCPhIajtVVRdmeP6twHtfXqKtl2Yr2LoX7ZPoP1+4e/OZWOr/bAw46pQUnRJbWqe6EOPuHjbZj5IbUj7fuEXpZl5wEhyCZPadzZlzo4v89lkD9n1/mWROMnL4FtphrFs7lUxNu+t7VxKA+dllvdC4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757974713; c=relaxed/simple;
	bh=dZL0jvYUH7e7fh2Q6Da81kEHlFNzMAP/dmqa1X0hq90=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KvmaJWXZZYUKyMc5PoU8q5J5XOmHvB3R5LiDOktH1cS8kL+6Q0UiO8fv+0P9e0YvERS9J8YeD7BGsckvt5XzqQAfHhVs/DOt7Vlpidq5OAvqtk5r49nhn68AtI+MgB3qRnif5Co2xYjX2fMP52udOzFzbqgEfI8sj49kh6tmhKM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ewhac.org; spf=pass smtp.mailfrom=ewhac.org; dkim=pass (2048-bit key) header.d=ewhac.org header.i=@ewhac.org header.b=rPFGP5dd; arc=pass smtp.client-ip=23.83.223.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ewhac.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ewhac.org
X-Sender-Id: dreamhost|x-authsender|ewhac@ewhac.org
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 67065721C8E;
	Mon, 15 Sep 2025 22:18:25 +0000 (UTC)
Received: from pdx1-sub0-mail-a221.dreamhost.com (100-108-138-208.trex-nlb.outbound.svc.cluster.local [100.108.138.208])
	(Authenticated sender: dreamhost)
	by relay.mailchannels.net (Postfix) with ESMTPA id F3F5E720F31;
	Mon, 15 Sep 2025 22:18:24 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1757974705; a=rsa-sha256;
	cv=none;
	b=jZQVRaoWe8jnXmvHmwtufwMw+JFpKau5ZMnsJTQCLh3siembtHKSehSzRrv0OR4caHiSMh
	rnlHznn+KK1UHpcGiOi0F7W4LCE0xBUkVb+B0OGiRsscKVdN11HMZ6D0O2bYqTTRdC7nKO
	hxzH4MFnjKBKL4Z7Hh+4M6l1xpX1efYB58zeDC5iE9FB2EuWEVC3KlhucMcEF7lfN0NFcf
	jrtYuVhhh38eM4T0dY6XxHcPrMYtJbr9EF9MZajokAGateywJZD1eITx6jvhNZ2zTVMNm1
	o2ZCumb3nAZsgV2vDQXIHeESXLiRNCDF+dyZBtNg88yHLZ/rDD8bgeXZpPj1VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1757974705;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=hLrzbBRqZTeHcFPxPic6eLXL4USR+84I/4DJ1gEPheU=;
	b=BpeD3u3QCHz0q1dgeq42WRpocU8B3mVQeGsrvbuXLiLXmR+CA5ooNlh/+HyIbrWGiXnwWu
	FNb1Xir3eOOAIdC2O2f3FRZ0JccBMRJK35kcmlQMLm4QoXx/uzsTSpI0h5WkjYI4+qmU25
	MEqFD6+7XWlxsRSGvQggfTvVwx5Q6eC63xqPUpPbmUiNUMjB+3NmhulOg+vLAAzJ71zh/p
	EMuvKWSrThtVrwx9mBtTCmzjMLVfjUlMjdKwIRM67G/ldK3JguT5ul5q8ss0+PpHPYNCV7
	Xz37fYvtgB7ONMGmFCcrMU6z6YfzBpyO4wVDmyBCkNIdb1GwOyMbfNcetP71vQ==
ARC-Authentication-Results: i=1;
	rspamd-d4f76d97f-chpkk;
	auth=pass smtp.auth=dreamhost smtp.mailfrom=ewhac@ewhac.org
X-Sender-Id: dreamhost|x-authsender|ewhac@ewhac.org
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|ewhac@ewhac.org
X-MailChannels-Auth-Id: dreamhost
X-Oafish-Cooperative: 48a2ae5975209de2_1757974705273_1082291944
X-MC-Loop-Signature: 1757974705273:2763287094
X-MC-Ingress-Time: 1757974705272
Received: from pdx1-sub0-mail-a221.dreamhost.com (pop.dreamhost.com
 [64.90.62.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.108.138.208 (trex/7.1.3);
	Mon, 15 Sep 2025 22:18:25 +0000
Received: from ewhac.org (unknown [135.180.175.143])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: ewhac@ewhac.org)
	by pdx1-sub0-mail-a221.dreamhost.com (Postfix) with ESMTPSA id 4cQfYr5nx9z6h;
	Mon, 15 Sep 2025 15:18:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ewhac.org;
	s=dreamhost; t=1757974704;
	bh=hLrzbBRqZTeHcFPxPic6eLXL4USR+84I/4DJ1gEPheU=;
	h=Date:From:To:Cc:Subject:Content-Type;
	b=rPFGP5ddE123grOTGkUp2dSaN21Sv8WPOhQOfTiTtI2I9IPSCR9dNYgDemSmLTh8s
	 Aiu4+0oxnSkRKwk29fTNH4alvHi5LkVbDwR2ZWrAqLnwLfspzdXWSI9s7gDccHs21D
	 qQW7YSSBfj5U1fwNxQa26lf5LPSwt35VBUmdHCNyWIqE2bYJaNWvtFr4C/FIXu7sjs
	 62JlTaj8LmaFvLjua1LLEa2DppfEBYrcOAuOaXSiSbnOsikrzLkPsVNk+8NGN2RNvX
	 3k2vxHHDwCbAWqAxyTiTJoqN4UY9rrkGKSN5HbZ7+yhUBQBAukX3MBzib1OlS8f4LV
	 4hyo0N7+7OBWQ==
Received: from ewhac by walkies with local (Exim 4.98.2)
	(envelope-from <ewhac@ewhac.org>)
	id 1uyHWi-00000000GTq-0MDf;
	Mon, 15 Sep 2025 15:18:24 -0700
Date: Mon, 15 Sep 2025 15:18:24 -0700
From: "Leo L. Schwab" <ewhac@ewhac.org>
To: Hans de Goede <hansg@kernel.org>
Cc: Kate Hsuan <hpa@redhat.com>, Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] HID: lg-g15 - Add support for Logitech G13.
Message-ID: <aMiQsMtyX9POrXof@ewhac.org>
References: <7d356834-5795-4979-9f51-0ffcec52ae1d@kernel.org>
 <aLSntMknSv3lMarZ@ewhac.org>
 <8ae2cc92-5dfe-466d-95fd-da74309d7244@kernel.org>
 <2de88077-eb8d-44ad-a96a-5db889913cba@kernel.org>
 <aLiZbkKgIC8jIqE9@ewhac.org>
 <c12adb45-fa6d-4bb8-afd2-a02e3026d646@kernel.org>
 <aMESMcFLrzqrCdbq@ewhac.org>
 <a6ea0b5d-7586-4529-bf91-d8b966aa986e@kernel.org>
 <aMG9L2566Hh6b0Kf@ewhac.org>
 <64b1c076-f1f7-45a3-900a-dd52ab50cd4e@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <64b1c076-f1f7-45a3-900a-dd52ab50cd4e@kernel.org>

On Wed, Sep 10, 2025 at 09:16:45PM +0200, Hans de Goede wrote:
> Since the driver writes any new values to the G13 and the G13 accepts
> those and remembers them even when the backlight is off,
> the notify() should be passed g15_led->brightness when an
> off -> on transition happens (and 0 or LED_OFF for the on -> off
> transition).
> 
> Since g15_led->brightness gets initialized by reading the actual
> setting from the G13 at probe time and then gets updated on
> any successful completion if writing a new brightness value
> to the G13, it should always reflect the value which the backlight
> will be set at by the G13 after an off -> on transition.
> 
> Or am I missing something ?
>
	If I'm understanding you correctly:

	You want `brightness` to be copied to `brightness_hw_changed` on
probe, and on every backlight off->on transition (cool so far).

	What do you want to happen to `brightness_hw_changed` when
`brightness` is changed in sysfs while the backlight is on?  As it stands,
the current behavior is:
	* Driver loads and probes; `brightness` and `brightness_hw_changed`
	  both set to 255.
	* sysfs `brightness` changed to 128.  `brightness_hw_changed`
	  remains at 255.
	* Toggle backilght off.  `brightness_hw_changed` changed to 0.
	  `brightness` remains at 128.
	* Toggle backlight back on.  `brightness_hw_changed` gets a copy of
	  `brightness`, and both are now 128.

	This seems inconsistent to me.  Hence my earlier suggestion that
`brightness_hw_changed` should track all changes to `brightness`, except
when the backlight is toggled off.

					Schwab

