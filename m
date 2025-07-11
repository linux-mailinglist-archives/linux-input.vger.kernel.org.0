Return-Path: <linux-input+bounces-13496-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D3BE2B01935
	for <lists+linux-input@lfdr.de>; Fri, 11 Jul 2025 12:02:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2EF5B563B00
	for <lists+linux-input@lfdr.de>; Fri, 11 Jul 2025 10:02:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5860227FD5A;
	Fri, 11 Jul 2025 10:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="URKRHCBG";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="hkxethWv"
X-Original-To: linux-input@vger.kernel.org
Received: from fout-b7-smtp.messagingengine.com (fout-b7-smtp.messagingengine.com [202.12.124.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0039327F724;
	Fri, 11 Jul 2025 10:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752228130; cv=none; b=Dn0pbDYs1MbVtvcQP5CWXICk1sW03Syw3lf7jp3ZjZp3VcPrJoSvONzuwGB7flWjxQ+FX+AzrjIOIx/tZRnH9s/1F5o7EHDxkd+7v2GqG8tVpVAOSDmGl4adGmMqu8y55H3PPXpTiCOjSZm81hJlp6IOKCDdfFjk+jJNd0HO2PQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752228130; c=relaxed/simple;
	bh=w0gx5jAmjodIyEeSESqRnYEC3p3T6ybvwWC3o8V1nb8=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=aUyrd/dETju3kwYAIdUgNG1/aSs+QXRoghQL0f59Xqt75rJ19I+HCcBVOsU3/wz+Jx9H9J08X2GJufyqtrk5iikyXHbPeTlOZGxK3fPxjm9MyY5pwHsaiU/OOWy7wfu1PU0O4s/QYWJiP82zds/bAimVIZqG8KWRqeyOP0LfUKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=URKRHCBG; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=hkxethWv; arc=none smtp.client-ip=202.12.124.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfout.stl.internal (Postfix) with ESMTP id D53C91D0007C;
	Fri, 11 Jul 2025 06:02:06 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Fri, 11 Jul 2025 06:02:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1752228126;
	 x=1752314526; bh=01ScwmtLZwUozZDXWHHiPwHig2+ib+jXHxICbk2YkJ0=; b=
	URKRHCBGNh+TxoezmTAD/p76lgmPEIzP9HmN9lPgeX0TeaspkeT+lg9UlWpzYlcw
	IxS9MvERO3YjTyJjdHX5sxrjl57r0uevksKuYFF2vTIQHpNZLphGOfc04IUatCE9
	LtNRkgyw3W/xXvPYsE65ZUnFbfnlND15MUW0KnNs4BHhBSBdeSlffPAITUamo3sh
	RosLnxSXR2aGdUiXkidRo5tGjdoD0YUF2yFOE3Qh//ohWyATpVwqhfvhHkxUApfb
	bkICuaxIMUmXDJgmaelHnOw1Vu5/gxQS45vxS5X0mVJ6rjVceDa90F7/jW+rvIOV
	TYwA9YcrocCWXH8s6v5qOg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1752228126; x=
	1752314526; bh=01ScwmtLZwUozZDXWHHiPwHig2+ib+jXHxICbk2YkJ0=; b=h
	kxethWv/AjN+KAXCP9eTxWwGJ15d4WiCbisIshq889A20sMbTyykzif2RZu4bsri
	6h8G/z5aNW9UvK5Q7Y96EtvJajIa7MCm9uWxkHeJE7FMhHyjLn7e6wjTt33t5cnx
	v8iepNF4jIdFQHfjR0H81qyB7F6G3Adr1fTt6DtXJemZIeESjWb2u7d3J921B2Lq
	SWOuSu1+CQpAjfVr4Zb7KxKdNfA7Y5ik6hTmq0SPblDKto2UYC/75u5QeotwQB4s
	4imGpNUJ7v69D0cIAIh0YQnYAsdr1ubrAbE6I4LegQVi3Wm7Yf0jV/fVROBUCRpf
	ZOVizGIdyp62+V0pdqQdg==
X-ME-Sender: <xms:HuFwaHi_hbVbaLJwZL6Jf1TifJc5yYEtPyLkRJFJBM803qiyHzsSUw>
    <xme:HuFwaEByjk46iJb_gXDyEQDBamGzVB89RX9H1qlfZPtP3SwM7yPu1YBaC85EMhfMm
    EeBHuytwtmyffuWZcs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdegfedtvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpefhtdfhvddtfeehudekteeggffghfejgeegteefgffgvedugeduveelvdekhfdvieen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnug
    esrghrnhgusgdruggvpdhnsggprhgtphhtthhopeeipdhmohguvgepshhmthhpohhuthdp
    rhgtphhtthhopegrrhhnugeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepsggvnhhtih
    hssheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepjhhikhhosheskhgvrhhnvghlrdho
    rhhgpdhrtghpthhtoheplhhinhhugidqihhnphhuthesvhhgvghrrdhkvghrnhgvlhdroh
    hrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdr
    ohhrghdprhgtphhtthhopehpvghtvghrrdhhuhhtthgvrhgvrhesfihhohdqthdrnhgvth
X-ME-Proxy: <xmx:HuFwaHIoyOLSFVspXd3DxNNhsTdzRRxPNxDcJMbASHpBAlRlZ342TA>
    <xmx:HuFwaCgbsJaA22Rwf4B6lBnnOvkR1xjD2teVcXT6X84hbRsJLYR1Bw>
    <xmx:HuFwaFSEDxkzLnnOf-01a5jKkAAUyimtinGpyb5RaVwKiC5I8v1bAg>
    <xmx:HuFwaMWrMl2t2lvYARCgZrkPv8v7SBcU9azfDCoxrwRfvxwSu-cVOg>
    <xmx:HuFwaPv5YLa3Ds2cA1hrsftHfj1kFFUltvvzVWSH8mOBoIhvIPGUceTT>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 6ED6F700065; Fri, 11 Jul 2025 06:02:06 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: T7273da0c48a59e38
Date: Fri, 11 Jul 2025 12:01:45 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Benjamin Tissoires" <bentiss@kernel.org>,
 "Arnd Bergmann" <arnd@kernel.org>
Cc: "Jiri Kosina" <jikos@kernel.org>,
 "Peter Hutterer" <peter.hutterer@who-t.net>, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org
Message-Id: <6432a849-512d-4abb-b15a-c2f1b7dd6533@app.fastmail.com>
In-Reply-To: 
 <cznzhmuizk6r3tv7ze6lqp3qoyfnu6ktmbwxbjpsf5phthsjoj@x46mthdr66l7>
References: <20250711072847.2836962-1-arnd@kernel.org>
 <cznzhmuizk6r3tv7ze6lqp3qoyfnu6ktmbwxbjpsf5phthsjoj@x46mthdr66l7>
Subject: Re: [PATCH] HID: tighten ioctl command parsing
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, Jul 11, 2025, at 11:40, Benjamin Tissoires wrote:
>
> On Jul 11 2025, Arnd Bergmann wrote:
>> From: Arnd Bergmann <arnd@arndb.de>
>> 
>> The handling for variable-length ioctl commands in hidraw_ioctl() is
>> rather complex and the check for the data direction is incomplete.
>> 
>> Simplify this code using a switch() statement with the size masked
>> out, to ensure the rest of the command is correctly matched.
>
> How much "urgent" you believe this patch is. I would say 6.17 material,
> but I'm not sure if your analysis regarding "the check for the data
> direction is incomplete." would justify a 6.16 late fix.

I'm not aware of anything being actively broken without my patch,
the driver just accepts extra commands that it should reject instead.

My feeling is that we still want the change backported to stable
kernels as it does address incorrect behavior, and based on that
it should be in a fixes branch for the current release rather than
wait for the merge window.

On the other hand, it needs to be properly tested to ensure
I'm not breaking things.

> Also, lately I added a new tools/testing/selftests/hid/hidraw.c to test
> the latest HIDIOCREVOKE addition. I wonder if we should not add a couple
> of checks there to ensure we get the different kind of other ioctls
> tested before and after this patch.

Yes, makes sense, e.g. testing HIDIOCGFEATURE with incorrect _IOC_DIR
bits would be a useful addition.

     Arnd

