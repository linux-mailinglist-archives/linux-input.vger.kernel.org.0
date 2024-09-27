Return-Path: <linux-input+bounces-6795-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB3A0987FA4
	for <lists+linux-input@lfdr.de>; Fri, 27 Sep 2024 09:43:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 79A71282EAA
	for <lists+linux-input@lfdr.de>; Fri, 27 Sep 2024 07:43:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A53F917C98E;
	Fri, 27 Sep 2024 07:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b="YKBQmM9D";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="os7Clc2P"
X-Original-To: linux-input@vger.kernel.org
Received: from fout-a5-smtp.messagingengine.com (fout-a5-smtp.messagingengine.com [103.168.172.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA43E165EF1;
	Fri, 27 Sep 2024 07:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727423032; cv=none; b=PLvrkL+zRm85n4Dr6K31+mD4D0/0HB/RE4d/EA0AJ67WBJe2uraDI2ve2qbjO0780f5np3uk5mvjsuu/4+e7FB2UuZriQbds+KTsTY50FvGCWS6QUTOs0EBgfaWNYHWMtxRSte1a00Rfiofk+cu42DJdO5HUHGBsuOJCGv4ptis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727423032; c=relaxed/simple;
	bh=lJbEZ9NACCmKLX2ftMujwbdsCsRnHIctiBBiyvA8ZpY=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=o7H/YEnKmVH1+9TpKS1kAJntEMI/rARphHadh3zsb9SIt2JyqbwgIF7qjwYKTn/J+waU+yPAsVZhkeWrob6MVZJTHByqhZaaYgjEeiitWdEZCWnjZlYbzmjmVBGYscKq3EFFHO1rX2T+PUaCF3n/NeaQOzh+n1cq3gkE0nduewM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev; spf=none smtp.mailfrom=ljones.dev; dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b=YKBQmM9D; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=os7Clc2P; arc=none smtp.client-ip=103.168.172.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ljones.dev
Received: from phl-compute-08.internal (phl-compute-08.phl.internal [10.202.2.48])
	by mailfout.phl.internal (Postfix) with ESMTP id A717C13806FC;
	Fri, 27 Sep 2024 03:43:49 -0400 (EDT)
Received: from phl-imap-01 ([10.202.2.91])
  by phl-compute-08.internal (MEProxy); Fri, 27 Sep 2024 03:43:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ljones.dev; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1727423029;
	 x=1727509429; bh=lJbEZ9NACCmKLX2ftMujwbdsCsRnHIctiBBiyvA8ZpY=; b=
	YKBQmM9DBrhyFc7+evaKv4MfgzM13QuX+lGzv/IdECX5lC99z7DcsWb+YDJFkh2B
	5pYxDCIDd1xp77PwswXXFTm9UkEpctmNqwIZ3ikZvJvOgNH4nuqKshOEo8dWVp5E
	13gsbw1MsXxTw9trqkiV09YMqciGAgUSknenvW2vpfcfh7jcnmrjw58ykO/SgRWt
	XbENBtFRmotPeXjW4Xf89TpAbjEwjyDrjai8npHNyUBTOsRRLb2pNyArp08Tefwr
	5exkUd7O2W55Ymvrqoh8XMWHa8uErFFHxhpwEOaOzNj+9iC+PkqKxgGpSVLwr9bw
	wEKbZ86uUbR6rIoDV8PNdA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1727423029; x=
	1727509429; bh=lJbEZ9NACCmKLX2ftMujwbdsCsRnHIctiBBiyvA8ZpY=; b=o
	s7Clc2PQ/+ub710L1Y6sJmQzEW+LSDdkEEhLTzj/Gtlx7TN8whF1LVFQ1/W146V7
	HsmQzPoem/iK62EuP1VtiJ3tt5wLVf9QRsiSCtVDtCAja+uKBSYf3ghmwsqAneHD
	Yhi+k9aIXYdWRLmsGSBUSv13hqZpI0y58RQzOgFFvaUVDz2SISUjz+9QuTNcbmOm
	bFwWNfw3yT5k1PYpSBnQDje79d/CpCwXlv6WQubKZRBPPVSvd1qJ5DkyhjFmmnVq
	2qZiWLePZAEJ+B3m/9Tfrdhu+HlO03avnAic/aCByjib2+9FVo1JxvYjACVoKd50
	jBcStnDFtcl+lNB7wTEYg==
X-ME-Sender: <xms:NWL2ZgTorCKfzXVa6O4QpJ30QTYsyp7DV7b47dPcyYEGpOc0PjPnww>
    <xme:NWL2Ztx9uL8dZU5z13RRbEzewehxwzU9aIv-yMtaR02L_c2E58qqww4Nv0-7rrTRr
    zsa3zCsdVh815Al-jU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvddtkedguddvudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthhqredtredt
    jeenucfhrhhomhepfdfnuhhkvgculfhonhgvshdfuceolhhukhgvsehljhhonhgvshdrug
    gvvheqnecuggftrfgrthhtvghrnhepheetudfgleegledtveevtdelfffhtefgtdejhfek
    gfdujeefueeufedvjeduuddtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomheplhhukhgvsehljhhonhgvshdruggvvhdpnhgspghrtghpthhtohep
    uddupdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegtohhrvghnthhinhdrtghhrg
    hrhiesghhmrghilhdrtghomhdprhgtphhtthhopegsvghnthhishhssehkvghrnhgvlhdr
    ohhrghdprhgtphhtthhopehjihhkohhssehkvghrnhgvlhdrohhrghdprhgtphhtthhope
    hsuhhpvghrmhdusehkvghrnhgvlhdrohhrghdprhgtphhtthhopehilhhpohdrjhgrrhhv
    ihhnvghnsehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohephhguvghgohgvug
    gvsehrvgguhhgrthdrtghomhdprhgtphhtthhopehkvghrnhgvlhdqjhgrnhhithhorhhs
    sehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqihhnphhuth
    esvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgv
    lhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:NWL2Zt2W0ShCx2PIzP3i-WRLUnb4h-YicKflBEuAnJlg6PqV2I0SNA>
    <xmx:NWL2ZkA2Z63mdJ0zBqn9wwd4LAGml9Fl8XeSY6b0dhpOyltNZMOe8g>
    <xmx:NWL2Zphd807SNiW60JzcdXDggF3rs5e_W7N8JlwhbALNqL2PNOVtuQ>
    <xmx:NWL2ZgoGvNyUozICTwRgsVS69ExXz62Q_9ZjQVX3J5SF7BiasPrdFw>
    <xmx:NWL2ZgNntofv0ZiLHGRr0AEyVle1850jbtUStc51mT03_itlYVP5xyXv>
Feedback-ID: i5ec1447f:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id DF367336007C; Fri, 27 Sep 2024 03:43:48 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Fri, 27 Sep 2024 19:43:28 +1200
From: "Luke Jones" <luke@ljones.dev>
To: "Markus Elfring" <Markus.Elfring@web.de>,
 platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org,
 "Benjamin Tissoires" <bentiss@kernel.org>,
 "Corentin Chary" <corentin.chary@gmail.com>,
 "Hans de Goede" <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "Jiri Kosina" <jikos@kernel.org>, "Mario Limonciello" <superm1@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
Message-Id: <5951153c-3262-43d0-928a-14a399452d51@app.fastmail.com>
In-Reply-To: <2ace33f8-5596-4b4b-9ab9-e7c0fffa990b@web.de>
References: <20240926092952.1284435-4-luke@ljones.dev>
 <08320b8e-a71b-4055-9fdf-1df76530ec1a@web.de>
 <f3b059cd-0045-435e-9bb9-467bb9cb0cc1@app.fastmail.com>
 <22c231f2-c28e-4083-8e62-590a8c2d8844@web.de>
 <03cfc83f-6f19-436f-9896-78fd6b8cd8f7@app.fastmail.com>
 <2ace33f8-5596-4b4b-9ab9-e7c0fffa990b@web.de>
Subject: Re: [v4 3/9] platform/x86: asus-armoury: move existing tunings to asus-armoury
 module
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Fri, 27 Sep 2024, at 7:24 PM, Markus Elfring wrote:
>>> How much would you like to care for standard compliance concerns
>>> together with your software developments?
>>
>> I only ask about because it seems to deviate from everything else I'v=
e viewed. For example the older `asus-wmi.h` has:
>>
>> #ifndef _ASUS_WMI_H_
>> #define _ASUS_WMI_H_
>
> Such a naming approach is =E2=80=9Cpopular=E2=80=9D, isn't it?
>
>
>> and every other header in the drivers/platform/x86 dir is similar. If=
 what I'm supposed to is omit the leading `_` then sure I'll do it, it's=
 not of any consequence to me.
>
> I dare to propose possibilities to take safer identifier selections=20
> better into account.
> I hope that we can benefit more from corresponding collateral evolutio=
n.

My sincerest apologies if I missed something in my tone when trying to c=
onvey might thoughts - for some things I am still learning in regards to=
 C (I am mostly rust) and the difference was a curious thing to me.

The code is now updated to match your suggestion.

> Regards,
> Markus

