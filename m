Return-Path: <linux-input+bounces-14820-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 50EBDB81AF6
	for <lists+linux-input@lfdr.de>; Wed, 17 Sep 2025 21:50:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E366D1894DEB
	for <lists+linux-input@lfdr.de>; Wed, 17 Sep 2025 19:50:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1BB821C194;
	Wed, 17 Sep 2025 19:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ewhac.org header.i=@ewhac.org header.b="I1kIrN/j"
X-Original-To: linux-input@vger.kernel.org
Received: from seahorse.cherry.relay.mailchannels.net (seahorse.cherry.relay.mailchannels.net [23.83.223.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9AAE8BEE;
	Wed, 17 Sep 2025 19:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.223.161
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758138615; cv=pass; b=aoxi9cfi8A9whAjol4zGT0idhxgWx1kTA908HMGH0lGe4tZvc6FT1CsotlLtKaMG0QGMtma2oL5Yi4jEzTGXYR4nfAKXn1tevRhi56Gzfgz4lyRJgfjSqsCMZxWIm6SJeXZKAnPj2Cpug2UekvBRvnUhgf+uDPMsSQoFEiu15FQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758138615; c=relaxed/simple;
	bh=OPBtjuECZg3uxpC0LLvIT0G5nRV07fTiaDqxfhEnLQg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hYQTSP7ft9YUVaFwBqSbM4onuTBOYRL0X6D8WqdVzzhL7k5MkGR8wsKUbmMUi2HKj8/0Drk5FvT8usHm4UcTTGmoQKUgEC4S8FizkEhfOHsOK+gMt7XjtCAM5W0OkDEKwT5nGYFhA3IkIWTWyOQt/b+sBdLwho3H0mgYbT6J/R0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ewhac.org; spf=pass smtp.mailfrom=ewhac.org; dkim=pass (2048-bit key) header.d=ewhac.org header.i=@ewhac.org header.b=I1kIrN/j; arc=pass smtp.client-ip=23.83.223.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ewhac.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ewhac.org
X-Sender-Id: dreamhost|x-authsender|ewhac@ewhac.org
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 04331863873;
	Wed, 17 Sep 2025 19:50:07 +0000 (UTC)
Received: from pdx1-sub0-mail-a237.dreamhost.com (100-106-206-65.trex-nlb.outbound.svc.cluster.local [100.106.206.65])
	(Authenticated sender: dreamhost)
	by relay.mailchannels.net (Postfix) with ESMTPA id 59B94863634;
	Wed, 17 Sep 2025 19:50:06 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1758138606; a=rsa-sha256;
	cv=none;
	b=zQAYJ0FASi7Gw1ybqpgJB+VL1cQz0hrlxgfANYpjPLRE2ACCon9k9t4Yo/+ICebVD0nDqk
	WwVyxkuCFDozA+Naa1ZO58/BJ1fUu0cE6Jq5c11Lzq/c4dp65zVDU0NUJGXxhMXdoSUOqY
	KFE3C262yVKJui4hz02qBuktrldKlWS1MVB7t4dkZf/Cimij3FgWS+JJ/0Sllbs1Qo7a5n
	nXf+HYSUTBEMpDdtum6FfdPPmPnO8DgKyfhI0hnheEv8eUDQLuTpnI2Cc0ZbNGREyScv1b
	iCnehIT6QGHXlwCUU2YEpbKAKvwV/Aua8OZWdnW7jdiLcFIw8Rzi4xXlSbYaVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1758138606;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=QR8h4trdEJjxl7YHEhgieYLK6DcncYNCR6sVg12kusg=;
	b=KvhBwxsi7k+YQEN2j7H+pGkKTp6yMdkEj9S3rHD+2ExT7OpHoy59Vx8aZeu83BCAFtP3EI
	B67grENit2ygeQtpPiXM/IHgKJQMrPQZ08DZTudC/y6X/ss9u2DwUeFDAzciYx9Uk257b3
	0aFJtL8RVr0sHvGSBp7Fp+8yhJfVSdcCce4bP99RtD+UdGS+4DY6kP58u77krbCu5GL0kX
	Y/yYPv08FRhX0jTnDrGJN8ORE5sfR98Wv5ayG9X31RL6gnK3Nt5xFD+bdTQPD17qWimwnI
	AFQpSWiykk735di9Fa0/E3ejaKRu24qWc4svel6aBARgCAbnl0w3wW9BxrGL9Q==
ARC-Authentication-Results: i=1;
	rspamd-7c7bd86f7-rxkpx;
	auth=pass smtp.auth=dreamhost smtp.mailfrom=ewhac@ewhac.org
X-Sender-Id: dreamhost|x-authsender|ewhac@ewhac.org
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|ewhac@ewhac.org
X-MailChannels-Auth-Id: dreamhost
X-Hysterical-Skirt: 4b73acc84715a5e4_1758138606615_2153499060
X-MC-Loop-Signature: 1758138606615:2407148932
X-MC-Ingress-Time: 1758138606615
Received: from pdx1-sub0-mail-a237.dreamhost.com (pop.dreamhost.com
 [64.90.62.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.106.206.65 (trex/7.1.3);
	Wed, 17 Sep 2025 19:50:06 +0000
Received: from ewhac.org (unknown [135.180.175.143])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: ewhac@ewhac.org)
	by pdx1-sub0-mail-a237.dreamhost.com (Postfix) with ESMTPSA id 4cRq9p12HfzB1;
	Wed, 17 Sep 2025 12:50:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ewhac.org;
	s=dreamhost; t=1758138606;
	bh=QR8h4trdEJjxl7YHEhgieYLK6DcncYNCR6sVg12kusg=;
	h=Date:From:To:Cc:Subject:Content-Type;
	b=I1kIrN/jA0DXeMVm2HOvo9q3YddsSLBKKMYuzYcmZSnzdr9WgzvPq0FaDUMSAgNzV
	 ofpvFKQ3NomYp0AgZhc5dwN7dekE//Sp2EGWRBwD45PMGWA8P5+vPpDzeP0GzRPtZX
	 PjzbZ7il2Dxo0IyX8GxokKyPzyyikXG1V8YzpWbsK4BJUEETiOxh5ADDKTU7YUI2OE
	 HVAvMBr0YYqGyg7LHPu3NUs4oFkn1+LR9N+hIoeHh3Hy88xkTBbWYOrkCaIlSZW5KV
	 fZlJBm2xhIxaq0kZhSMGeSdO3wifQ0Ns+f92bvL2nDRB+B3U3PtZ4JKUagcglhD4YS
	 mOAMfsS/rft6g==
Received: from ewhac by walkies with local (Exim 4.98.2)
	(envelope-from <ewhac@ewhac.org>)
	id 1uyyAH-00000000O92-2UjG;
	Wed, 17 Sep 2025 12:50:05 -0700
Date: Wed, 17 Sep 2025 12:50:05 -0700
From: "Leo L. Schwab" <ewhac@ewhac.org>
To: Hans de Goede <hansg@kernel.org>
Cc: Kate Hsuan <hpa@redhat.com>, Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] HID: lg-g15 - Add support for Logitech G13.
Message-ID: <aMsQ7dBJrwpWbdJk@ewhac.org>
References: <8ae2cc92-5dfe-466d-95fd-da74309d7244@kernel.org>
 <2de88077-eb8d-44ad-a96a-5db889913cba@kernel.org>
 <aLiZbkKgIC8jIqE9@ewhac.org>
 <c12adb45-fa6d-4bb8-afd2-a02e3026d646@kernel.org>
 <aMESMcFLrzqrCdbq@ewhac.org>
 <a6ea0b5d-7586-4529-bf91-d8b966aa986e@kernel.org>
 <aMG9L2566Hh6b0Kf@ewhac.org>
 <64b1c076-f1f7-45a3-900a-dd52ab50cd4e@kernel.org>
 <aMiQsMtyX9POrXof@ewhac.org>
 <8e2c3560-6cba-4808-8207-ba3e1dd0e661@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8e2c3560-6cba-4808-8207-ba3e1dd0e661@kernel.org>

On Wed, Sep 17, 2025 at 12:33:36PM +0200, Hans de Goede wrote:
> On 16-Sep-25 00:18, Leo L. Schwab wrote:
> > 	What do you want to happen to `brightness_hw_changed` when
> > `brightness` is changed in sysfs while the backlight is on?  As it stands,
> > the current behavior is:
> > 	* Driver loads and probes; `brightness` and `brightness_hw_changed`
> > 	  both set to 255.
> 
> Ack, except that as mentioned above I would not touch brightness_hw_changed
> and just leave it at -1.
> 
> > 	* sysfs `brightness` changed to 128.  `brightness_hw_changed`
> > 	  remains at 255.
> > 	* Toggle backilght off.  `brightness_hw_changed` changed to 0.
> > 	  `brightness` remains at 128.
> > 	* Toggle backlight back on.  `brightness_hw_changed` gets a copy of
> > 	  `brightness`, and both are now 128.
> 
> Ack this is all correct.
>
	...Oy.

	Okay, I can give you that.

> > 	This seems inconsistent to me.
> 
> This is working as intended / how the API was designed as
> Documentation/ABI/testing/sysfs-class-led says:
> 
>                 Reading this file will return the last brightness level set
>                 by the hardware, this may be different from the current
>                 brightness. Reading this file when no hw brightness change
>                 event has happened will return an ENODATA error.
>
	First: Why isn't this mentioned in Documentation/leds/leds_class.rst?

	And second: This doesn't really clarify anything.  That paragraph
may be legitimately interpreted to mean that `brightness_hw_changed` is
completely independent of `brightness`, as it was in my original
implementation.

> >  Hence my earlier suggestion that
> > `brightness_hw_changed` should track all changes to `brightness`, except
> > when the backlight is toggled off.
> 
> Then it also would be reporting values coming from sysfs writes,
> which it explicitly should not do.
>
	Okay, fair, but having `brightness_hw_changed` read as 255, then
later as 128 after hitting the toggle button a couple of times strikes me as
inconsistent behavior.

> Summarizing in my view the following changes are necessary on v4:
> 
> 1. Add backlight_disabled (or backlight_enabled) flag to struct lg_g15_data
> 2. Init that flag from prope()
> 3. Use that flag on receiving input reports to see if notify()
>    should be called
> 4. Replace the LED_FULL passed to notify() (for off->on)
>    with g15_led->brightness
> 
	Will do; will post v6 shortly.  And someone should update the docs
describing the expected interaction between `brightness` and
`brightness_hw_changed`.

					Schwab

