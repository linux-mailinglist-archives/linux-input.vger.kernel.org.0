Return-Path: <linux-input+bounces-7112-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 76703992D9D
	for <lists+linux-input@lfdr.de>; Mon,  7 Oct 2024 15:44:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 216121F24619
	for <lists+linux-input@lfdr.de>; Mon,  7 Oct 2024 13:44:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B27D1D356C;
	Mon,  7 Oct 2024 13:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="fYE2hkx1"
X-Original-To: linux-input@vger.kernel.org
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0DAE14AD17;
	Mon,  7 Oct 2024 13:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728308653; cv=none; b=tmGCgwHp7Tr1Z43IW5LYohUWYRIJAYpxQ5490+LXC7gL5BWQbYP+9kP5PRvJjrGxBIWEXvsekn2x/P1aadMQRrmYQbzYTskJ2ACIt30JNVI15J9qdL9yimzpHAI5ac14yv62KE757TJgQvv2viSSmhtT45j9RapcYByK5ff0buY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728308653; c=relaxed/simple;
	bh=RuQzPJZnXPyP4yiBTX+Tbj3Y8weH8VEomWfrp1QHVwM=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=bxHntKp8H3SsuHhMItZbMLxyCQrDS3ajJ6YvJfvpRiej0/L2doRGokCTyaYyppE0aAlT5Nfm2QcR736xZMyxDFwU3RsmRAw9EolWX/kUIIsVtvqfH2z0DR5P+MpbO40XimNXHodrJJHrjjsINIGMMdYQGDXnM9bHO1qZpAgbXos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=fYE2hkx1; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:References:Reply-To:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:
	Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
	In-Reply-To:References; bh=D0RTQTBSUn8yYabKkL97a9GY5kzQPdueRyNABA+Z7ko=;
	t=1728308651; x=1728740651; b=fYE2hkx1PPoB7A7mD55mlgyDoQLhlmPJ/Fj6w01qkSlIaC1
	BC1+/19ZEeYV7JYSiIopuyn+wHLfOWbHVk4i20CdZxyYaW4NGVP1iX901htjzY76dnx+a2hPisCaL
	zMVJuirpdGd8jkl7/KtulroqDXWL2TtcVauRO6dbXk2C/9CEMonJGuxKge7li7VjcTzuKGfOd2+cT
	mifKjvmqesGQP4y49BRSrS95TnbpjAvbWmE/J7fmb3kFbPiKQJdWV1wcCYDZsQZcc5FL4T3bREUvJ
	/JOjieRLi2nGr3txipmmj/3OIoJjiix1OR2W3pkIe2uZ6GNnVzU/fuVcKhjvdYxA==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1sxo1v-0001Dn-6A; Mon, 07 Oct 2024 15:44:07 +0200
Message-ID: <c5020404-2d48-47ad-a75b-f2d37897f57c@leemhuis.info>
Date: Mon, 7 Oct 2024 15:44:06 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] HID: i2c-hid: Touchpad not working on Thinkpad Z16
 Gen 2
From: Thorsten Leemhuis <regressions@leemhuis.info>
To: Jose Fernandez <jose.fernandez@linux.dev>, Jiri Kosina
 <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>,
 Douglas Anderson <dianders@chromium.org>, Hans de Goede
 <hdegoede@redhat.com>, Kenny Levinsen <kl@kl.wtf>,
 Kai-Heng Feng <kai.heng.feng@canonical.com>,
 Johan Hovold <johan+linaro@kernel.org>, Nam Cao <namcao@linutronix.de>
Cc: linux-input@vger.kernel.org, regressions@lists.linux.dev
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
References: <gbvkokf7rpsayfqv4l5mvk347lal72q54jgxfvwu7bmx7olngm@e3tcy6oyaas3>
 <5c666a9c-e10b-4eea-b2e7-3f781e177c19@leemhuis.info>
Content-Language: en-US, de-DE
In-Reply-To: <5c666a9c-e10b-4eea-b2e7-3f781e177c19@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1728308651;6444a47b;
X-HE-SMSGID: 1sxo1v-0001Dn-6A

On 06.10.24 05:46, Linux regression tracking (Thorsten Leemhuis) wrote:
> On 06.10.24 01:01, Jose Fernandez wrote:
>> I'm using Fedora 40 with the vanilla kernel built from the 6.12-RC1 [1]. There
>> is a regression that causes the touchpad to stop working on my Thinkpad Z16 Gen
>> 2 (Sensil touchpad). dmesg shows this on 6.12-rc1 when filtering by `hid`:
> 
> Could you try latest git instead of rc1 if you haven't yet? E.g. the
> latest packages from your "[1]". I wonder if this is
> https://bugzilla.redhat.com/show_bug.cgi?id=2314756
> which is fixed by a3f9a74d210bf5 ("Revert "Input: Add driver for PixArt
> PS/2 touchpad"") [v6.12-rc1-post]
> (https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=a3f9a74d210bf5b80046a840d3e9949b5fe0a67c
> ).

Those two are apparently different problems, as from
https://bugzilla.redhat.com/show_bug.cgi?id=2314756
it seems that it might be not kernel regression after all, but a change
in the Fedora's .config that causes your problems.

Ciao, Thorsten

