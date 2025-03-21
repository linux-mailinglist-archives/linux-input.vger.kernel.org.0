Return-Path: <linux-input+bounces-11052-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC583A6B37C
	for <lists+linux-input@lfdr.de>; Fri, 21 Mar 2025 04:53:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D9B2A7A3BD8
	for <lists+linux-input@lfdr.de>; Fri, 21 Mar 2025 03:52:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96FD11E3774;
	Fri, 21 Mar 2025 03:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b="omAVj2jc";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="vTTPjHLQ"
X-Original-To: linux-input@vger.kernel.org
Received: from fhigh-b8-smtp.messagingengine.com (fhigh-b8-smtp.messagingengine.com [202.12.124.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 089471C174A;
	Fri, 21 Mar 2025 03:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742529198; cv=none; b=vB+kpuOAk/FPUZwtdfCo70//AzXtrxk/vE03+U8J3q1AX/4zWXXlMDy2l3Jr0BVLz5pRGLELpZIK/ylWWnOLMPmokbmj16stTBh8XP5qckl3C+CEBuJYWwDtz2LNocnQzIySSshYPr6MQkKUU01SsY10La1V4dL3Oa3ucTmQqR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742529198; c=relaxed/simple;
	bh=SQlt7AhlA6qQPrX8gVT4a1V9Gt0nSuQz+v/P7nwD5VE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aKcQOd3BGv/jkIidKUB0C/q5cBPE23mcwofc0/VBq57aFkOYJgwUhkKFNxBdNW2k2D0ccv9gzBLwmnpG3IV7M7u3pc8ytTzVSiGUyUB5138t7USFJCIRRw3uduhsYmEi5IqN81yYnIOBDc0eij39w4x+g4b7G1wz3gVyibVJtwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev; spf=none smtp.mailfrom=ljones.dev; dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b=omAVj2jc; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=vTTPjHLQ; arc=none smtp.client-ip=202.12.124.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ljones.dev
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 1AC762540233;
	Thu, 20 Mar 2025 23:53:16 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-10.internal (MEProxy); Thu, 20 Mar 2025 23:53:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ljones.dev; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1742529195;
	 x=1742615595; bh=oJ+EIORAkhjV2/v0y4i6dgMaTxdZf5VPggfiUOahtTg=; b=
	omAVj2jcaNbsOXyOoYc36JaVuo/FNd18idEs1i+F8dg7RbFWMkrkJVtcWGSnzMkd
	uyVRRcp54HDawvZom+C4SsR0AO9/ACTDd3jmqCn6J/u3Ia/CkJ8vcbgq8Om2JcYQ
	5KOmvAN5EKv1S3yxLkhEp8oQips24cLp5BlV9pIBc5igUDkp0fZgqciCz7FHtR5J
	d4oqvuIOvizlkX2sAymNj0zRmL8LLUN6v+8hS/iCo5X3Z/NO4h1Nu7ns4pLVDqqq
	2HBtwyx16mAcHhP5EbP1BwjOrXkkF79pAtbbDTL9wzfqf0271t0DbzebOgL1ppK4
	1H1GThsgPQXOz3zQBbPRqQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1742529195; x=
	1742615595; bh=oJ+EIORAkhjV2/v0y4i6dgMaTxdZf5VPggfiUOahtTg=; b=v
	TTPjHLQmVDSRIEeH+FaGjaXsEL88svc3CjdSs3wJirU2VCqZiGyD9Tbu6lI90g3C
	Ce3eSMM7ALFOoil4XCO5cGK/NOiFdqKpVlWSQEg7iK2EqPs7W8U6cDkETbeOFCsJ
	m24eKotUdj/ZcrdqrX/DzRqABCdyU0aWwYW49t0TtPSidCpmW8YOROmE9y3FSNt+
	SGzWXOJBXpHrE6HIhwvRORxL370TeWMsUKchOqfg5DFaB7PXrCugTny+1LwrQte/
	JXH9LJH1QxtAlyC9jeHfB53T0iWzDdC7zpDvShM0f6RnmmxlmeVqyDfYyen3gqdx
	cGd6X8eud7M9l0rc+IpUQ==
X-ME-Sender: <xms:q-LcZ6ExU-PV4Zb68Uy_ps8A6tHJJ2XbEv6mwpgHyaY29jrUa36KwQ>
    <xme:q-LcZ7XjZC-hktbDUiVaqQoMwcs8BPnga9bKfHpmACE27PKVcJtrJHiZ8VU1CpvzH
    -xwrj67HSfcytf-Uak>
X-ME-Received: <xmr:q-LcZ0LqxarqweRka98NnXvyYQ_tB-PraJ_9zpNfVbDi_5ogH7HtcYIo-9Zg63bG85mg6PvQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduhedttdeiucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucenucfjughrpefkff
    ggfgfuvfevfhfhjggtgfesthejredttddvjeenucfhrhhomhepfdfnuhhkvgcuffdrucfl
    ohhnvghsfdcuoehluhhkvgeslhhjohhnvghsrdguvghvqeenucggtffrrghtthgvrhhnpe
    evudeuvedttefgheefleeivddvhfdtiefhtdekjeduvdegiedvtdekffegkeeuffenucev
    lhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehluhhkvgeslh
    hjohhnvghsrdguvghvpdhnsggprhgtphhtthhopeelpdhmohguvgepshhmthhpohhuthdp
    rhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
    dprhgtphhtthhopehhuggvghhovgguvgesrhgvughhrghtrdgtohhmpdhrtghpthhtohep
    ihhlphhordhjrghrvhhinhgvnheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtth
    hopehplhgrthhfohhrmhdqughrihhvvghrqdigkeeisehvghgvrhdrkhgvrhhnvghlrdho
    rhhgpdhrtghpthhtoheplhhinhhugidqihhnphhuthesvhhgvghrrdhkvghrnhgvlhdroh
    hrghdprhgtphhtthhopegsvghnthhishhssehkvghrnhgvlhdrohhrghdprhgtphhtthho
    pehjihhkohhssehkvghrnhgvlhdrohhrghdprhgtphhtthhopehmrghrihhordhlihhmoh
    hntghivghllhhosegrmhgurdgtohhmpdhrtghpthhtoheplhhkmhhlsegrnhhthhgvrghs
    rdguvghv
X-ME-Proxy: <xmx:q-LcZ0F2d_yyvfQ2E0bygU9Jv1NTFaM_QDvkT1u1xkByjSP4Ni2PEQ>
    <xmx:q-LcZwWES3ErBo1XSzlQOzSLDqasGDoDZxu1dq1nsywXojR9OyW2iQ>
    <xmx:q-LcZ3NQRqHsAz3mlQhp4vU9J60nNHvVKU0BUAnec32h4lRxGHQRGw>
    <xmx:q-LcZ30k2S1l5fir0mZAT142HELi6FAHZpFod4LeYbiIDxusHNySBA>
    <xmx:q-LcZ0rnqwU3p-1dmDLvWk1veyPt6-H57eAfYdYSjsKZycuKZKNdZmzf>
Feedback-ID: i5ec1447f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 20 Mar 2025 23:53:11 -0400 (EDT)
Message-ID: <91535a14-430d-42ea-9e1e-1d5b6bc562f3@ljones.dev>
Date: Fri, 21 Mar 2025 16:53:08 +1300
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/2] hid-asus: asus-wmi: refactor Ally suspend/resume
To: linux-kernel@vger.kernel.org
Cc: hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com,
 platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org,
 bentiss@kernel.org, jikos@kernel.org, mario.limonciello@amd.com,
 lkml@antheas.dev
References: <20250321035106.26752-1-luke@ljones.dev>
Content-Language: en-NZ
From: "Luke D. Jones" <luke@ljones.dev>
In-Reply-To: <20250321035106.26752-1-luke@ljones.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 21/03/25 16:51, Luke Jones wrote:
> This short series refactors the Ally suspend/resume functionality in the
> asus-wmi driver along with adding support for ROG Ally MCU version checking.
> 
> The version checking is then used to toggle the use of older CSEE call hacks
> that were initially used to combat Ally suspend/wake issues arising from the MCU
> not clearing a particular flag on resume. ASUS have since corrected this
> especially for Linux in newer firmware versions.
> 
> - hid-asus requests the MCU version and displays a warning if the version is
>    older than the one that fixes the issue.
> - hid-asus awill also toggle the CSEE hack off, and mcu_powersave to on if the
> version is high enough.

It is *strongly* preferred to remove the hack completely, but this may 
take some time after this series lands for it to be viable without 
regressing users.

I thought I had added to above to cover-letter but did not, sorry all.

The aim is to remove the hack at some stage this year.

> - Changelog:
>    + V2:
>      - Adjust warning message to explicitly mention suspend issues
>      - Use switch/case block to set min_version
>        - Set min_version to 0 by default and toggle hacks off
>    + V3:
>      - Fix errors picked up by test bot: incorrect return in the else block
>        of `#if IS_REACHABLE(CONFIG_ASUS_WMI)`:
>        - set_ally_mcu_hack()
>        - set_ally_mcu_powersave()
> 
> Luke D. Jones (2):
>    hid-asus: check ROG Ally MCU version and warn
>    platform/x86: asus-wmi: Refactor Ally suspend/resume
> 
>   drivers/hid/hid-asus.c                     | 111 +++++++++++++++++-
>   drivers/platform/x86/asus-wmi.c            | 130 ++++++++++++++-------
>   include/linux/platform_data/x86/asus-wmi.h |  13 +++
>   3 files changed, 213 insertions(+), 41 deletions(-)
> 


