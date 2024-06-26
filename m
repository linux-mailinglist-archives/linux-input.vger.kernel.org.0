Return-Path: <linux-input+bounces-4655-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 72FC9919ABF
	for <lists+linux-input@lfdr.de>; Thu, 27 Jun 2024 00:36:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1C3C51F272F1
	for <lists+linux-input@lfdr.de>; Wed, 26 Jun 2024 22:36:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45D36194081;
	Wed, 26 Jun 2024 22:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="TutWx8tE"
X-Original-To: linux-input@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DEEC194120
	for <linux-input@vger.kernel.org>; Wed, 26 Jun 2024 22:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719441218; cv=pass; b=hNPpAedDTiicTKVnqlBxpzrSPakgX9MBiEroc8GYJp5sOGVJf6wF4AVkyXi/BIcMkaFlewrP6tX6P2/phmO2Q1h9z1/BfwmoZp/RkvOkG/deLptRkc2qD+d3KcMUt2wBSP4jT69yfoK0O5PxNHYyRYrhWk0NzK4cdCW+AnUC3h8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719441218; c=relaxed/simple;
	bh=QFB4qZ2Z4JYwMBZYXe9ax0VT+Ih4YudcBqjGgaDi0r4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AA7DySkLc2JqO+i8bQwY6eRY4C2GX81FL3BVY5QQOKsvhtQABPvpezRuN7WW/epbI6oNh6gaeVLCqyFIfqZcUn4Q7PhqdLpErnPOZbonMzkxtJOYewaUUb/RxXI98K5/8TMDc0YRiA1/FmusDOpuX2pBXOvyQFDhh9/LiMOo7o0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=TutWx8tE; arc=pass smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from roadster.musicnaut.iki.fi (85-76-40-225-nat.elisa-mobile.fi [85.76.40.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: aaro.koskinen)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4W8c105VZrz49Pyv;
	Thu, 27 Jun 2024 01:33:24 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1719441206;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ng5sVmkZ5kwx1GolUQBenHZQqznUwygaSLqwhrSMNLM=;
	b=TutWx8tEAvOegMl30KJ4SufGKqM+n4XAq3rIQKatJHyr7nF5M2Vwbsfy8stBMEH82kU73O
	9A5pZw6E7T71diLz2jykQBwuddpkMB/5nhqY76W8Xisb2ChpWBWc5WOOtTpqhbcWhcJuz8
	C4GxjVoy+9/6e2RQH4c1IHmottLNctRMOA2jXcw16EEg9BcEsW1OzsvTipDImn7iyq5rqH
	Bq1iH3Whfd3g+0qddxX6dn+/+EaKUQGx7qM7eByj1xD29M4cvQofgYmy8jEmOCj/QkAA8Y
	UNMnez6qs7bisoJ8jJX648eekFQsyMHD21XaOYEn/0kfhOdKqkEL9Y0EVmcc8A==
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1719441206; a=rsa-sha256;
	cv=none;
	b=Dwvma8h5SjC6IHIornukVVVlANSkcnxlmO2EXjB5TwAWQRRX57Swts3FL8I3alUJL35Ubx
	paECd3gLToBFsmD7QdDpEen1IHsX/BsvU5ioMnqgW80YuGhJZ9ivefnRi5goaUeroHhKHF
	mebapbyeHAief1zlEcVJ7TNoiFCEfKDISi7TRVzTiroOmR+0fnJP7JCU7frQsDLEPm2QJA
	XcO/IvGEBeUvMlgBQVmbeWKHT2WapwskyDPzp5NMUAgPtIFKqHDIo3vUa+lzNdq9suqSJ3
	LIrc5QSoAE30WM3p49kOq0z8eQeudzEU8wnNqy50AcZBTUe8lVOfzjyrDQqEjA==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=aaro.koskinen smtp.mailfrom=aaro.koskinen@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1719441206;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ng5sVmkZ5kwx1GolUQBenHZQqznUwygaSLqwhrSMNLM=;
	b=pabrKc+Q/ma/+FY1nl/JTL2eH6VXUnNROHNVZHuydf4rfJCfj6dwgZiKXzfxDNl5ONcYzS
	wjKT8i3knz1YX1Ztds3DXdke9wjVL4qwaPsHi9QoxIP6ORY8JDbbi26a9VX6MvKSeA12g0
	GecDoydnCZ4LABki0/1YowHybOWNtuGnHqPXvgYNTP6M23DQ+cl9OY5FLn49fbdTTeXmR8
	2kkWZSBTMF4ciEhGHDceVyalC+TUr7E0x+iVk1y071b3ysYKs/XvGvX/jWBsYkg//bvt/B
	W1xKR7uI0Ux/gsKYSzI8raxYY/KS2UnF1WlqMX2pCR2/BN7pR88r8iUpGd3eww==
Date: Thu, 27 Jun 2024 01:33:20 +0300
From: Aaro Koskinen <aaro.koskinen@iki.fi>
To: Linus Walleij <linus.walleij@linaro.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Marek Vasut <marex@denx.de>, linux-input@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	kernel@dh-electronics.com
Subject: Re: [PATCH] Input: ads7846 - add dummy command register clearing
 cycle
Message-ID: <ZnyXMLJBvuryshct@roadster.musicnaut.iki.fi>
References: <20240320072533.170029-1-marex@denx.de>
 <dfc1b846-24ea-42c4-adfe-2b762e2f8851@denx.de>
 <Znstp_l5l2PUgIfP@google.com>
 <CACRpkdaC79-UPDg17cnanBFbsnOrzgwks7HCLxfrn_eBwNuXxA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdaC79-UPDg17cnanBFbsnOrzgwks7HCLxfrn_eBwNuXxA@mail.gmail.com>

Hi,

On Wed, Jun 26, 2024 at 02:40:00PM +0200, Linus Walleij wrote:
> On Tue, Jun 25, 2024 at 10:50 PM Dmitry Torokhov
> <dmitry.torokhov@gmail.com> wrote:
> 
> > I am concerned that we are putting workaroud for a single controller
> > into common function. Can we quirk it based on compatible? If not then I
> > would like someone to run tests on other controllers. Unfortunately I do
> > not have such hardware.
> >
> > Linus, do you have devices with ads7846 or tsc2046 by chance? Spitz?
> 
> Sadly I do not, but it is inside the Nokia770 so maybe Aaro can test it?
> (Not sure if Aaro has the 770 though...)

I sure have 770, and I can test patches.

However, ads7846 has regressed and it has been broken on 770 for
a couple years already as half-duplex support got suddenly deleted
without any pre-warning to users (770 was using this driver maybe
a decade without any issues). I reported this as a regression but
input maintainers preferred to prioritize "nicer hardware". See e.g.:
https://marc.info/?l=linux-input&m=164783764828520&w=2

I'm planning to restore the half-duplex support for 770, but it's not
on my top prioriority list so it will take a while.

Meanwhile, maybe you can ask the users of such "nicer hardware" to test.

A.

