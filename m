Return-Path: <linux-input+bounces-12217-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 61F1BAAED4B
	for <lists+linux-input@lfdr.de>; Wed,  7 May 2025 22:46:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5FFD23B55D1
	for <lists+linux-input@lfdr.de>; Wed,  7 May 2025 20:46:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DBC21E3DDB;
	Wed,  7 May 2025 20:46:49 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mail.itouring.de (mail.itouring.de [85.10.202.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 018A128E61B;
	Wed,  7 May 2025 20:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.10.202.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746650809; cv=none; b=phjM+9wUvuXhMkjQ1Q3qAK5Y8ZrLLRTZlhV3dla3jSztM+qL6GFpHwQBxOcAhfepwTJdlf0SUzrL0tvhsg59/QFYemL35eMtO2QKtiEe39a0CyoLjvWdA1KM6Q0RWIJbJmwUcKTquJlV0Sc2B9nYgzBhn/b+YAeCXYOC4vzapHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746650809; c=relaxed/simple;
	bh=i9XJXWNBqY6LXCdgZALQdU6bXpFNhljt/OADu+vfXzU=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=f/sbYjbikBXsDdx9O7JMFKnUfdyslLRuvjSrC0KaFZoLnhAFbAl2HsvsSpnpPr4KCqr+fvMn0WqNhu3a71ILfrjDsMUqF55R/O08zgDY0mTeLhgCpUT2VUz6l5bmA6eGPXJXbEtEbezbAlYxt35Ij/bE1IqqCH9ql9yVnAygHOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=applied-asynchrony.com; spf=pass smtp.mailfrom=applied-asynchrony.com; arc=none smtp.client-ip=85.10.202.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=applied-asynchrony.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=applied-asynchrony.com
Received: from tux.applied-asynchrony.com (p5b07e9b7.dip0.t-ipconnect.de [91.7.233.183])
	by mail.itouring.de (Postfix) with ESMTPSA id E289A103765;
	Wed, 07 May 2025 22:46:35 +0200 (CEST)
Received: from [192.168.100.221] (hho.applied-asynchrony.com [192.168.100.221])
	by tux.applied-asynchrony.com (Postfix) with ESMTP id 9007360187F0A;
	Wed, 07 May 2025 22:46:35 +0200 (CEST)
Subject: Re: [BUG] Stuck key syndrome
To: "Russell King (Oracle)" <linux@armlinux.org.uk>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Andrew Lunn <andrew@lunn.ch>, Woojung Huh <woojung.huh@microchip.com>,
 Vladimir Oltean <olteanv@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250507000911.14825-1-Tristram.Ha@microchip.com>
 <20250507094449.60885752@fedora.home>
 <aBsadO2IB_je91Jx@shell.armlinux.org.uk>
 <20250507105457.25a3b9cb@fedora.home>
 <aBsmhfI45zMltjcy@shell.armlinux.org.uk>
 <aBsu-WBlPQy5g-Jn@shell.armlinux.org.uk>
 <20250507153236.5303be86@fedora.home>
 <aBtHmNGRTVP9SttE@shell.armlinux.org.uk>
From: =?UTF-8?Q?Holger_Hoffst=c3=a4tte?= <holger@applied-asynchrony.com>
Organization: Applied Asynchrony, Inc.
Message-ID: <859b32ca-acd5-43fd-0577-a76559ba3a9e@applied-asynchrony.com>
Date: Wed, 7 May 2025 22:46:35 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <aBtHmNGRTVP9SttE@shell.armlinux.org.uk>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 2025-05-07 13:44, Russell King (Oracle) wrote:
> Could you try booting with i8042_unlock=1 and see whether that makes any
> difference please?

It did not help - just had another runaway event with that setting,
on my ca. 2021 Thinkpad L14. Had the symptom for as long as I have
had this machine.

We've been tracking this problem in Gentoo since late 2022, see
https://bugs.gentoo.org/873163 and none of the suggested options
for i8042 really make a difference. In my case I almost always get
the stuck key events when using the cursor keys for scrolling in a
web browser. Sometimes once a month, sometimes twice a day.

Fwiw it's not necessary to reboot; suspend/resume fixes it,
as in close/reopen the lid if you have that configured.

thanks
Holger

