Return-Path: <linux-input+bounces-14380-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 849C1B3BA68
	for <lists+linux-input@lfdr.de>; Fri, 29 Aug 2025 13:58:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CD83A1CC1746
	for <lists+linux-input@lfdr.de>; Fri, 29 Aug 2025 11:58:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AB301E285A;
	Fri, 29 Aug 2025 11:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="yWKc1Z2Z"
X-Original-To: linux-input@vger.kernel.org
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 485E82D12E4;
	Fri, 29 Aug 2025 11:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756468684; cv=none; b=CgAP3W7tMonYwqiTUXQOuTER3qEfpAPc2Rw6hx1IhJ2DY0r5doqBCmBbZBfXozqTlsl8pFd1tifwISwPYyIyJpeiUs/ZTdmeLSN61jOiqepbbN7Jy/LKQdawU/rFaFLa1/z+eov7Rg2TcU06uZSy3o7i4RHWFJPZL7OENyT8PIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756468684; c=relaxed/simple;
	bh=ynveZ1yqv7u1kVZVuyyTknKuM8nqhb1csnyz1gTkaao=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Xe8f8qLdk0bHdWzu42HR7AZVOEoXYJg05wo1lv0Oz07HzuaXw0kxwZ3JqgHtUO50bjVj+NolHIkwYuIZrPSawOtaHe5DHXqeHSlKPe8QxGhAtB9Vmooax3NlEsGXZjhpMnisoB+4FIHkTB1qpaf2waF0cOriQShz+cfRfGAS4c4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=yWKc1Z2Z; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=OiUAwF7kCruDwiTlDNNG4PcIpUt2a1KBnH5GQtUR5Ug=; t=1756468682;
	x=1756900682; b=yWKc1Z2ZKMYNWv9c74FcEHV9NMLErerVvI5QR1iXby/TTErStde/CVOxaGpVx
	fw9IsXESbG5N/l6NAz6VIeSUskgCPpw4ILubRbotP4zJmtFLX+T1A3cy8Pg89bWjH85Zpyy3sapP5
	bqQqaVfsTp3Wpc6j3y/fkgF3+Og6mK4edug3JwwdigpBhB/8ttovc27XU1W5IKtHFYeFm2CSb3zMh
	wYtrk8GM2UcMj0sGVAGxeXtgdj3D42MjEOFsXE9Uj7Ic78wu5wpl238nSXJsuRJZRcpUZ4karIco/
	E5Z/AMTCaIs8POXQvhaSETEJR0FzbhaIBpljxTEeQ3g1zWVVJA==;
Received: from [2a02:8108:8984:1d00:a0cf:1912:4be:477f]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128)
	id 1urxjz-00A0uS-0E;
	Fri, 29 Aug 2025 13:57:59 +0200
Message-ID: <dd24398b-0d10-45d4-b93d-4377c017f2e7@leemhuis.info>
Date: Fri, 29 Aug 2025 13:57:57 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Bug report - Sticky keys acting not sticky sometimes
To: Alerymin <alerdev.ca4x6@simplelogin.com>, stable@vger.kernel.org
Cc: regressions@lists.linux.dev, dmitry.torokhov@gmail.com,
 linux-input@vger.kernel.org
References: <175646738541.6.2676742517164037652.877606794@simplelogin.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Language: de-DE, en-US
In-Reply-To: <175646738541.6.2676742517164037652.877606794@simplelogin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1756468682;4e6a38f4;
X-HE-SMSGID: 1urxjz-00A0uS-0E

Lo!

On 29.08.25 13:36, Alerymin wrote:
> Note:
> The issue looks like it's from tty directly but I don't see who is the maintainer, so I email the closest I can get
> 
> Description:
> In command line, sticky keys reset only when typing ASCII and ISO-8859-1 characters.
> Tested with the QWERTY Lafayette layout: https://codeberg.org/Alerymin/kbd-qwerty-lafayette
> 
> Observed Behaviour:
> When the layout is loaded in ISO-8859-15, most characters typed don't reset the sticky key, unless it's basic ASCII characters or Unicode
> When the layout is loaded in ISO-8859-1, the sticky key works fine.
> 
> Expected behaviour:
> Sticky key working in ISO-8859-1 and ISO-8859-15
> 
> System used:
> Arch Linux, kernel 6.16.3-arch1-1

Thx for the report. You CCed the regressions list, so please allow me to
ask: what's the last version where this worked? And FWIW in case nobody
comes around with an idea what might cause this any time soon: could you
bisect[1] what's causing the problem? Ciao, Thorsten

[1]
https://docs.kernel.org/admin-guide/verify-bugs-and-bisect-regressions.html

