Return-Path: <linux-input+bounces-4182-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A28E8FF652
	for <lists+linux-input@lfdr.de>; Thu,  6 Jun 2024 23:02:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A69FD283F08
	for <lists+linux-input@lfdr.de>; Thu,  6 Jun 2024 21:02:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C8F6482CA;
	Thu,  6 Jun 2024 21:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b="FoPvpfdD";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="X9cEbXp2"
X-Original-To: linux-input@vger.kernel.org
Received: from wfout8-smtp.messagingengine.com (wfout8-smtp.messagingengine.com [64.147.123.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B7791BDEF;
	Thu,  6 Jun 2024 21:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717707757; cv=none; b=JnmHgp4Tyog090bQwb+Qzm/dWnMkDF1eINDa5Bi/qzSMf2heHu3hRKjZ2Jv1qwGwtD7480mkKWBAFe4wbcVIJBy/BmgNrcKQHxxTrGiVVDJt54Zpr+2R0wJ6DlJlWsNfkFaPl0jO4nCmKhr40QhTB2lNH4Xf1YnZ4MAxeyWh6zM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717707757; c=relaxed/simple;
	bh=bDsqxRooWCdjWyPTzlHhrZfhWaMUAvMVQ5/shWIiog0=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:Cc:
	 Subject:Content-Type; b=UDP0oTCVRu9Q+Z+e6g6uT9LkbZvdwDh6JlyzDRunQAViSxlyC8gKijY7q1mOpczeeQOMi3Wc9qPmO9ckSIv8ahB1ky5iUoLUMRTwCeRYm+kLyGtIXtlY9avZUD3x/jkpGynazdTPHxnLGpCg9hz/hGyidmzZ0axiZ+Qxbig1JyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev; spf=none smtp.mailfrom=ljones.dev; dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b=FoPvpfdD; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=X9cEbXp2; arc=none smtp.client-ip=64.147.123.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ljones.dev
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailfout.west.internal (Postfix) with ESMTP id AA6AA1C00086;
	Thu,  6 Jun 2024 17:02:33 -0400 (EDT)
Received: from imap41 ([10.202.2.91])
  by compute2.internal (MEProxy); Thu, 06 Jun 2024 17:02:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ljones.dev; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1717707753; x=1717794153; bh=CvM2CbIlZy
	6Nocsmf11iGttvJDsTsVmYcfalRdHcefo=; b=FoPvpfdDEJceh7wl4ca5elp9x2
	aaIBmZMiTpKC4QcdDIpY+ZBdk7ay1MMrtebFBLHKM9yAD0+CvKUF7x5eXiyu+rMF
	uS83v5O2oCldNtV2BuK9g+bc3KTiR5jvzlJjcxE4+C8ZT6zxZ8hjv8s+YqyjxOOF
	FEgdfXsZzB1QfM1t4u245/1h0WQW0pfhlviwSIHgSVh1O+k7VQYGb1MyY73wF43M
	KLueMC6YHojg0yAtURbL/kRQI6ekj+2nIkNEBat02P4nDYm1rexDUzVLbwLvmDnB
	8UrEZRUPYwxS/UPf+s385817kCdwZPZuRBFCCYnJKVtK8XNO4VrXsuPowRwQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1717707753; x=1717794153; bh=CvM2CbIlZy6Nocsmf11iGttvJDsT
	sVmYcfalRdHcefo=; b=X9cEbXp2MWv1P56ooJnmrX0EQHZ5k88ALW5Mrh1zm5t/
	v1Y94oOuTV8nD/FAu8AbdMXNhrJtO7KaykhuK1FWHbEO0RahT5Dnud/oJDgf44Q8
	a+CI6worLpt+s7kGc18GSSmtMvTpU0HGbwvWAUsmLnpAcapacvFrojKNjryeEVt+
	GehMRQEPjLp2SHr2Pd+x6ma8stBhFtrofh50IhZBbe7AcJY8v4+vXWuV97z/M/xY
	ZaVBcVFRPXuLczS2kj4btiS/W8/u/j05nyYnfQtRA+Zww3W8LPF2WRmHAzm1PF5l
	56/4yrPN5hNvD5eVzOrc2eepwjJYEFihjRJnvNYWdA==
X-ME-Sender: <xms:6SNiZm4bQpoZ5IoLBUQXW3WCtlVA-1v0folEiit4V6iaaHxXuNivtg>
    <xme:6SNiZv6dKAjvmTHAk04it4HPGNlTYrrK9TGZQ28MUEhsWdArze4QE_h7uJwfo2D5m
    y6GL2-nsLnFHtyxZDE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdelkedgudehhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdfn
    uhhkvgculfhonhgvshdfuceolhhukhgvsehljhhonhgvshdruggvvheqnecuggftrfgrth
    htvghrnhepleffveevfffhueetteetveetleetuddugfejvdeljeetteelhfeiiedugfev
    leefnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpe
    dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehluhhkvgeslhhjohhnvghsrdguvghv
X-ME-Proxy: <xmx:6SNiZlfRxdgZ3Sua2V8JKPsNyiJfx1nN5GiaBGacI7pF76sxlkEj-Q>
    <xmx:6SNiZjK4ZblDDQU8e_l06QhgL3C87yUnoSOXf01IRP8rZ-o8aNn2_A>
    <xmx:6SNiZqIdKLqGsYqwHi4s10xIFkpUFnEeRSZXF7_DiNfjJi0aBR82JQ>
    <xmx:6SNiZkzG8pvSo6SEJlWngutOiiyiQ6lESkiQgfGiokPGSjaXaqaDrg>
    <xmx:6SNiZi84RQg278NuUhjnxzayMLL_toLufwK-cqgNHrURN2iMHE5zLcjE>
Feedback-ID: i5ec1447f:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 02DD82340080; Thu,  6 Jun 2024 17:02:33 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-497-g97f96844c-fm-20240526.001-g97f96844
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <01808eec-29e4-4901-a5bf-396ec2eff3fe@app.fastmail.com>
In-Reply-To: <fc03506c-210f-4d79-9a99-8bc9b0587d25@redhat.com>
References: <20240529012827.146005-1-luke@ljones.dev>
 <b0d8eebc-5abb-4ec0-898c-af7eedc730d9@redhat.com>
 <dflqwdl4fo3wv4zjj4jl6sbot6cotscksgpyrbiu3j77lyrwal@s6nomonx4gv6>
 <fc03506c-210f-4d79-9a99-8bc9b0587d25@redhat.com>
Date: Fri, 07 Jun 2024 09:02:12 +1200
From: "Luke Jones" <luke@ljones.dev>
To: "Hans de Goede" <hdegoede@redhat.com>,
 "Benjamin Tissoires" <bentiss@kernel.org>
Cc: "Jiri Kosina" <jikos@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 corentin.chary@gmail.com, platform-driver-x86@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Subject: Re: [PATCH v1 0/2] asus wmi and hid: use HID LED for brightness
Content-Type: text/plain

On Thu, 6 Jun 2024, at 9:53 PM, Hans de Goede wrote:
> Hi Benjamin,
> 
> On 6/6/24 10:49 AM, Benjamin Tissoires wrote:
> > On May 29 2024, Hans de Goede wrote:
> >> Hi all,
> >>
> >> On 5/29/24 3:28 AM, Luke D. Jones wrote:
> >>> Changelog:
> >>> - v1
> >>>   - Split the patch in two
> >>>   - Move function body to asus-wmi and export
> >>>   - Use array of names and for loops
> >>>
> >>> History:
> >>> - https://lore.kernel.org/linux-input/20240528013959.14661-1-luke@ljones.dev/T/#u
> >>>
> >>> Luke D. Jones (2):
> >>>   hid-asus: use hid for brightness control on keyboard
> >>>   hid-asus: change the report_id used for HID LED control
> >>>
> >>>  drivers/hid/hid-asus.c                     | 32 +++++++++++++++++++-
> >>>  drivers/platform/x86/asus-wmi.c            | 35 +++++++++++++++++++++-
> >>>  include/linux/platform_data/x86/asus-wmi.h | 10 +++++++
> >>>  3 files changed, 75 insertions(+), 2 deletions(-)
> >>
> >> Jiri, Benjamin since the first patch now also touches pdx86 files
> >> we need to coordinate merging this.
> >>
> >> There also is a long list of patches pending for
> >> drivers/platform/x86/asus-wmi.c
> >>
> >> So I would prefer to take this series (both patches) upstream through
> >> the pdx86 tree to avoid conflicts.
> >>
> >> May we have an ack from one of you for merging this through pdx86/for-next ?
> > 
> > Sure:
> > Acked-by: Benjamin Tissoires <bentiss@kernel.org>
> 
> Thank you for the ack.
> 
> > But I haven't seen the v2. Are you sure you want to take this series as
> > it is?
> 
> No I plan to wait for v2, I just thought it would be good to have
> an ack to merge this through the pdx86 tree beforehand.

My apologies for the delay, I have v2 prepped, but I'm waiting on feedback from a few folks regarding the 2024 G16 and G14, plus the TUF laptops - these are possibly affected by the patch. Shouldn't be more than a day or two now.

Regards,
Luke.

