Return-Path: <linux-input+bounces-12570-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FDBFAC3F7D
	for <lists+linux-input@lfdr.de>; Mon, 26 May 2025 14:48:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B1B5018955AC
	for <lists+linux-input@lfdr.de>; Mon, 26 May 2025 12:48:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E10741F8733;
	Mon, 26 May 2025 12:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="OPJDoxFU"
X-Original-To: linux-input@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E3B21AAA1A;
	Mon, 26 May 2025 12:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748263703; cv=none; b=hdznTf+ApZqbou+okagATOR7VX/Av7K7lAShWwNa4m9UIutdtqgVpWAM3ppn912Z2Vl9yOwJMiH0Pf3ddJm4FXQFIEYDwknc9hSTLAJtM4hXB7Jhi+jtCXYfEHUi2eyZarbcBbDK8Ua/O+BsPn4piUH1PulZDqH6GLN1FBptsWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748263703; c=relaxed/simple;
	bh=jRYRieyb26G5yNg3BSS+8T6pEZQzUcmgLKg/QGTJvQM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=IsNk2JK8tQlghJSVydNR8wyGEI33umfw4aqmA4OWQK61njxQ8CMU0/Imq4IhsIgKTKefVA3Cv8cSMzEeVxmVZT5xxxoyOtbQJ+4IJcxS4mDyzoCQhP53/daIyjcM9jpqBUP0HVOgSIWuKcTTs9kNA6AR2IUxWA2xb6sRvOGi5xE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=OPJDoxFU; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net EEF6E41AA1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1748263695; bh=ps6uR+Ar7VRw5Fh81GvAUzQm6L4ZV3qIQbQjkyaGSq0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=OPJDoxFUVxhrHOjEsRgYsikAKvch3Q4QtmmrFZ8oKqF7d4yeYr9y/BLjOgJcupFMZ
	 grZsR7pjP7Unqd7mrXGztM+cnJLHX/GUZLd0U71kcjcRwmysPuiOi8iTuUopFCojnw
	 rZGPh6Xfke3nR/4j4syEHK6BbgEbETVxmY3oUMkvrazsd8KVt8u6JzvPxB94iBOhoR
	 2wogxwA7K3o42iKqUrTwg3R3MQWBX/o4twr6h3co5UWAWbfN7wTROnOHmqS38quAKy
	 keSHr5tpN9AWAu8q9CGzxQKMz8uX/6XHyNS9I+iQey5PnbgSx+CAAFi+5Vm1Ds+lB3
	 TZVCf2eLHXBIA==
Received: from localhost (unknown [IPv6:2601:280:4600:2da9::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id EEF6E41AA1;
	Mon, 26 May 2025 12:48:14 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Bagas Sanjaya <bagasdotme@gmail.com>, George Anthony Vernon
 <contact@gvernon.com>, dmitry.torokhov@gmail.com, skhan@kernel.org
Cc: linux-input@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH 3/3] input: docs: Fix Amiga joysticks grammar & formatting
In-Reply-To: <aDPVOlBIpnqc7Tez@archie.me>
References: <20250526011443.136804-1-contact@gvernon.com>
 <20250526011443.136804-4-contact@gvernon.com> <aDPVOlBIpnqc7Tez@archie.me>
Date: Mon, 26 May 2025 06:48:14 -0600
Message-ID: <87a56za67l.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Bagas Sanjaya <bagasdotme@gmail.com> writes:

> On Mon, May 26, 2025 at 02:14:43AM +0100, George Anthony Vernon wrote:
>> Make small grammar fixes to Amiga joystick documentation.
>> 
>> Also make heading adornments compliant with the guidelines to improve
>> organisation of the page.
>
> Split up these two changes into separate patches.

The word "also" in a changelog is indeed a hint that a patch is doing
too many things.

For a simple patch like this, though, I would not force a resend just
for that.

>> -~~~~~~~~~~~~~~~~~~~~~~~~~
>> -Amiga joystick extensions
>> -~~~~~~~~~~~~~~~~~~~~~~~~~
>> +===============
>> +Amiga joysticks
>> +===============
>
> I would prefer to keep section adornments in this doc as-is, though.

...and why...?  We have a standard progression, why not use it?

jon

