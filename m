Return-Path: <linux-input+bounces-6492-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C044C977AE1
	for <lists+linux-input@lfdr.de>; Fri, 13 Sep 2024 10:24:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 84018288B47
	for <lists+linux-input@lfdr.de>; Fri, 13 Sep 2024 08:24:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B36DE1BC088;
	Fri, 13 Sep 2024 08:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="Fs8Qs5dt";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="am7Pq2HX"
X-Original-To: linux-input@vger.kernel.org
Received: from fhigh3-smtp.messagingengine.com (fhigh3-smtp.messagingengine.com [103.168.172.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D11151BA872;
	Fri, 13 Sep 2024 08:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726215840; cv=none; b=Is/c1RffxDsz/lxrFUlmZgX3ZBC/G4cCW6wdLXBg9vvRbOENIJ85d1/8ls4Qqud+9fENz2Nzk29DMOV/2M7bAbj0zrgJFr23Pd3TKkqShuNd/ti+bMNsA/x2bub0iWHth1eqioPT2FiFsvjTzWISG1oNinsUDgFyduBlAsziAbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726215840; c=relaxed/simple;
	bh=T56r7TRZFXIc4E9GL2z4PK5wXtFw6xNEFlJ6xFzUhr0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ow6eFr6lk3xqBgzLqubpYAIMkhmhiDmb0JiavFEfWri+ghkG2RaJ7308ByQRPtkng4kq/etUOzXihROq6hmkgOX9oX6mPCwGBkcbuBoKr/oQ2nhuVoZb2W2xqleAufX8vXgF2TCqICtN/EjL+dUaxnMU1FrzIoJ1YchcYK2W8HI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=Fs8Qs5dt; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=am7Pq2HX; arc=none smtp.client-ip=103.168.172.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Received: from phl-compute-07.internal (phl-compute-07.phl.internal [10.202.2.47])
	by mailfhigh.phl.internal (Postfix) with ESMTP id CCA1B1140210;
	Fri, 13 Sep 2024 04:23:57 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-07.internal (MEProxy); Fri, 13 Sep 2024 04:23:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1726215837; x=1726302237; bh=TIGRAXoEQh
	VL3BhpEp5wxQ56auHwr8BScMmt51FCbXI=; b=Fs8Qs5dtOiEZc8eXvQskydRu1P
	iV8uZVAt0NJKtNLXeTb23up15Ycd9kWBEQg/aYIzbyxDdw+hdO4zFWV0Q2bYl/rH
	6L7+3NHm+gay6Yy67s8lLVqmp+biKAFYjffCe9V/1kdon/U+E3qaK7A4HyUOh734
	HOmjffyeDlq4Rt5Z2knytPqe5nxwsoXw4pvwzDREaGB08YE7ae3s6i5TZ9m6d++7
	UZIWiP6Bv7R8ddUkZX6rXwRO6hMKlZsFoz0n26SBkbHlHah1kkkJ6GonOxZLli7x
	1ddYyH+b+TEmLtsfznCgr4dqOhVF+p568po7ci3vv1F2KCG5cFd1mc9uRqCQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1726215837; x=1726302237; bh=TIGRAXoEQhVL3BhpEp5wxQ56auHw
	r8BScMmt51FCbXI=; b=am7Pq2HXIlJxnNWRjaH8+Z1wsnTa9b6/nM1TAjAC9orc
	ek05UrB4ehrq5HuNZbjIEanm0Fb1GLYMxGGoxeWiJ+C98UDK10kOLIJ9BIPVbHX7
	GqkzwYw4KbCJCb+4kaY0PJ2gmrqKhFckqL0D/LmX63xaCtEDo8gjGBzXu5UsP+Z2
	8vKsHhoS/w1uHk5kAFsyvrOXKUkTfpUwqJZEjCqeLG+vdy7J2AEtlAP/TqFMCAdn
	y9XJeDE8h2RhN99bSnQ6jC8ljSwuKNW5Xf09eGtSh5z7GKi4YlScJzLKszihCrjs
	f5jVIxqEzF0el2wSKR/OcHLjx+YB94lpn1AH3KhUZg==
X-ME-Sender: <xms:nfbjZgvE80tjSEv4Q_GYB5Br0HSTVfhi6n4vuKy6o3EAvTKbFKn4xg>
    <xme:nfbjZtd2BuX7A6lb5vAsMk7KKioaUM9i5QvUvkufe40Wzwl_sYLvK-YMnhmna8pKr
    riyuk6TJ5Wpwg>
X-ME-Received: <xmr:nfbjZrwbGkqiXGM-ERKJ_HNx65PcwAFeJ_4oiMepzoSRxDU-caXr49AX5bDzxvQd7nuGT91ZtIH3ldjAidpqUGDi2CF4PwOTMd3Ykw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudejjedgtdduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvden
    ucfhrhhomhepifhrvghgucfmjfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuggftrf
    grthhtvghrnhepheegvdevvdeljeeugfdtudduhfekledtiefhveejkeejuefhtdeufefh
    gfehkeetnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epghhrvghgsehkrhhorghhrdgtohhmpdhnsggprhgtphhtthhopeduvddpmhhouggvpehs
    mhhtphhouhhtpdhrtghpthhtohepfigruggvrdifrghngheshhhprdgtohhmpdhrtghpth
    htohepjhhikhhosheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepsggvnhhtihhsshes
    khgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqihhnphhuthesvhhgvghrrd
    hkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghr
    rdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehsthgrsghlvgesvhhgvghrrdhkvghrnh
    gvlhdrohhrgh
X-ME-Proxy: <xmx:nfbjZjMjPOCzvhv4Es7vg48zSoiXhsxzsEjodtintyFjyc3FX3oxeA>
    <xmx:nfbjZg-Tgmqwj0HBxVufombxWKG2pS9nzzT_-11HENhAoHdlG2_jig>
    <xmx:nfbjZrWzcr5YcYI3XaMQSEcu0vZyPqEAxPSHeRyUi0wPkSL9v3M5UA>
    <xmx:nfbjZpezxDcdmOH8Q80PglHcati40mMRiObRZIXOZ1hc0vRzlYGlmQ>
    <xmx:nfbjZrXHcFn8cx7fgmoNW5Wacwl40uYjT7isqfZ8y2DwFAToXq2eRwEi>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 13 Sep 2024 04:23:56 -0400 (EDT)
Date: Fri, 13 Sep 2024 10:23:54 +0200
From: Greg KH <greg@kroah.com>
To: "Wang, Wade" <wade.wang@hp.com>
Cc: "jikos@kernel.org" <jikos@kernel.org>,
	"bentiss@kernel.org" <bentiss@kernel.org>,
	"linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: Re: [PATCH] HID: plantronics: Additional PID for double volume key
 presses quirk
Message-ID: <2024091345-sliceable-magnetize-190a@gregkh>
References: <20240913060710.1325640-1-wade.wang@hp.com>
 <2024091355-antitrust-retiree-1299@gregkh>
 <EA2PR84MB37800B3DCB1F28FAAF266FC18B652@EA2PR84MB3780.NAMPRD84.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <EA2PR84MB37800B3DCB1F28FAAF266FC18B652@EA2PR84MB3780.NAMPRD84.PROD.OUTLOOK.COM>

Please do not top-post.

On Fri, Sep 13, 2024 at 07:16:13AM +0000, Wang, Wade wrote:
> Hi Greg,
> 
> Just add "Cc: stable@vger.kernel.org" in 2nd patch submission, because kernel test robot required. Any other thing I need to do for your question now? Thanks

That's a great start, but you need to document the difference when you
do this, as the documentation says to do so, below the --- line.
Otherwise maintainers have no idea what changed, and what version of a
patch to take.

Think about what you would want to see if you got 1000 emails a day to
do something with?

thanks,

greg k-h

