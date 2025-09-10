Return-Path: <linux-input+bounces-14578-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D51C5B50D8F
	for <lists+linux-input@lfdr.de>; Wed, 10 Sep 2025 07:53:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 86DAF5E0C90
	for <lists+linux-input@lfdr.de>; Wed, 10 Sep 2025 05:53:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD73A26C3BD;
	Wed, 10 Sep 2025 05:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ewhac.org header.i=@ewhac.org header.b="XfhtR+JW"
X-Original-To: linux-input@vger.kernel.org
Received: from crocodile.elm.relay.mailchannels.net (crocodile.elm.relay.mailchannels.net [23.83.212.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62FDC3C0C;
	Wed, 10 Sep 2025 05:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.212.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757483580; cv=pass; b=sfMxR37R8PjRCm4n1vOOIWzyhZ/EnwcvCSVcgVFDC283NwLAkaleKfPoCkLEaDWMqT6d9hMrBg5l+3lyHcaDHfo/9i3bSL+3RFz4LH644lRj5UyMoPAzi0GYLtfBuhlQubVjmTh2Z5NR/LABvK+Ci3eP9B/z0T0fZ71vfPS08+Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757483580; c=relaxed/simple;
	bh=RGl+S4e3Sf59k/NMAVgiuE27wL1Jbzn+nFNQSJFWRi4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LvFuoxGrW5e5+iGQJJNSKh4dmALlfFlAiZ+ua+B5+sp8zD0rFV8hHPBwvdHe0MU7vTht3jD9BrZVtEdKEIbJQ8mkYbNYjP2xHHG3yP6decWwj6bOmv1UG8zCBLfWwIShRBq5bfD/2EDPstosyIsfF0jiDfNTYq0LvPi2v2mqgL4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ewhac.org; spf=pass smtp.mailfrom=ewhac.org; dkim=pass (2048-bit key) header.d=ewhac.org header.i=@ewhac.org header.b=XfhtR+JW; arc=pass smtp.client-ip=23.83.212.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ewhac.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ewhac.org
X-Sender-Id: dreamhost|x-authsender|ewhac@ewhac.org
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 358888323B;
	Wed, 10 Sep 2025 05:52:51 +0000 (UTC)
Received: from pdx1-sub0-mail-a248.dreamhost.com (100-107-18-138.trex-nlb.outbound.svc.cluster.local [100.107.18.138])
	(Authenticated sender: dreamhost)
	by relay.mailchannels.net (Postfix) with ESMTPA id B7187830D4;
	Wed, 10 Sep 2025 05:52:50 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1757483570; a=rsa-sha256;
	cv=none;
	b=ELTnCaWECI08UinxZrhEIqktqbe0zHi6frVPpCWEYbv1ioNTfdBuTJu8whHH8T+SrFs8kR
	EhJG73aeBEudw7VbUyxIpuKX5cIa71bod4ExQEZQypSyWOmngQAyadmgvzMeXyVgqQWEnO
	j92YZT3Y2qBryb9tCEo40q8oEJJiD7h1SQ/IS1PgvdhNHRKA+uTL6reN7EUAmwgXeJlKWl
	WAJj2Yo4jh/g6fiSoj6bhoNb5j6uMs4I6GvEHIe/E3AlLAZyJgPNxlnGFHEbcPF3ltmQij
	PLH9D75YwmLYu06FPbGpHO+6Y/GPoj7mNIWOQjbjpk1OzvJxTKdLc/kXMhyjkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1757483570;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=JjwWwiTcFv0mCbP4562f/VlNggPq6mIy4JQda6A9OR4=;
	b=KV4q07gev/bLycWz7IcEhHSfueQjrXMFiFxoW10e7O2W/OEpbOf/3PAVl5tRlPzsOG6kmU
	gNzEAh70I4NtlnlLjKWNGQ7bose+oEKNnWM5lB4HS5H/dVRA4sRNouw/Y2N9PPKKOx5TKW
	uKfDqsUexNy8H2BXc4IzjkhHftyx2q2HhrN02YYeWj/fVFVVHldPdHY+SeAQ3dOxGz+oS4
	om8TKms1Lhofv7LLGDB9/QGFFxc2r+lzsZC2NknoZIMwD/hBzl0NdnlWHVQ3LnSa/kT+Yw
	ombsXp2A2Eg3t+fWPQwSYpxQVXRbjkLFrtqZPBha5qQUyGgz3hoYCUtGR2LhTA==
ARC-Authentication-Results: i=1;
	rspamd-54bcd779b6-5vnl9;
	auth=pass smtp.auth=dreamhost smtp.mailfrom=ewhac@ewhac.org
X-Sender-Id: dreamhost|x-authsender|ewhac@ewhac.org
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|ewhac@ewhac.org
X-MailChannels-Auth-Id: dreamhost
X-Exultant-Tart: 6f629f33048cc96a_1757483571021_433849618
X-MC-Loop-Signature: 1757483571021:2091576281
X-MC-Ingress-Time: 1757483571021
Received: from pdx1-sub0-mail-a248.dreamhost.com (pop.dreamhost.com
 [64.90.62.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.107.18.138 (trex/7.1.3);
	Wed, 10 Sep 2025 05:52:51 +0000
Received: from ewhac.org (unknown [135.180.175.143])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: ewhac@ewhac.org)
	by pdx1-sub0-mail-a248.dreamhost.com (Postfix) with ESMTPSA id 4cM8wy3wRZzGs;
	Tue,  9 Sep 2025 22:52:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ewhac.org;
	s=dreamhost; t=1757483570;
	bh=JjwWwiTcFv0mCbP4562f/VlNggPq6mIy4JQda6A9OR4=;
	h=Date:From:To:Cc:Subject:Content-Type;
	b=XfhtR+JWZn8I3zjg3HA1OGmVy5/FJZ3h4tQAjfe234RQl0KaivJUCh4FjrVgz5Jyb
	 j+dnFKfQoYIkostF4To6hylvyAhvA3jAf31+sDcNxkI6YeJ02Wj3iO2aUPwwsNnkTU
	 q8yO2ebQuxhVy0bOtKTNcA5O2sMp3IxTyAMmG8qz3btPclT5xaEoXCyCDrfC/mw5Fn
	 aBQizNfaqglertrbUfMLqO07hvzJnPRkn/cL8TU1Q+360hS5bXzsFOcHevox+r23MG
	 WG1jJbMGpMuE65FahonUbmlZjg+/BLcSu45JarQA2KJP+tRsLddTvebjPT9uVSPAF1
	 KenW1bOSMsgxg==
Received: from ewhac by walkies with local (Exim 4.98.2)
	(envelope-from <ewhac@ewhac.org>)
	id 1uwDlB-00000001T2X-3yO5;
	Tue, 09 Sep 2025 22:52:49 -0700
Date: Tue, 9 Sep 2025 22:52:49 -0700
From: "Leo L. Schwab" <ewhac@ewhac.org>
To: Hans de Goede <hansg@kernel.org>
Cc: Kate Hsuan <hpa@redhat.com>, Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] HID: lg-g15 - Add support for Logitech G13.
Message-ID: <aMESMcFLrzqrCdbq@ewhac.org>
References: <20250814212641.197573-2-ewhac@ewhac.org>
 <7d356834-5795-4979-9f51-0ffcec52ae1d@kernel.org>
 <aLSntMknSv3lMarZ@ewhac.org>
 <8ae2cc92-5dfe-466d-95fd-da74309d7244@kernel.org>
 <2de88077-eb8d-44ad-a96a-5db889913cba@kernel.org>
 <aLiZbkKgIC8jIqE9@ewhac.org>
 <c12adb45-fa6d-4bb8-afd2-a02e3026d646@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c12adb45-fa6d-4bb8-afd2-a02e3026d646@kernel.org>

On Mon, Sep 08, 2025 at 11:08:29PM +0200, Hans de Goede wrote:
> There are 2 improvements which I would like to see:
> 
> 1. When the backlight is turned on through the button, you
> should pass g15_led->brightness to the notify() call rather
> then LED_FULL. GNOME will show an OSD with the new brightness
> value shown as a mini progress bar similar to how it shows
> speaker volume when doing mute/unmute. This mini progress
> bar should show the actual brightness being restored, not
> always full brightness.
>
	If g15_led->brightness is subsequently changed, should a new
notify() call also be made with that new brightness, i.e. should
`hw_brightness_changed` be made to track `brightness`?  Indeed, it looks
like you do this in `lg_g15_leds_changed_work()`.

> 2. ATM if the backlight is turned off on the G13 when
> the driver loads and then one of the buttons gets pressed
> then a notify() will happen because the led_cdev.hw_brightness_changed
> value of -1 will be different from the value of 0 in the
> input-report. This notify will lead to an unwanted OSD
> notification in GNOME, so this needs to be fixed.
> IMHO the best fix would be to use:
> 
> 	hid_hw_raw_request(..., HID_INPUT_REPORT, HID_REQ_GET_REPORT);
> 
> at probe to get the input-report so that the driver will
> actually now the backlight state at probe() time without
> needing to wait for the first time the input-report is send.
>
	Will give this a try.

> I'll wait for your G13 support to land first and then
> rebase the G510 patch on top.
> 
	Roger that.

					Schwab

