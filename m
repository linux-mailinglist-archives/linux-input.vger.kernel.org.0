Return-Path: <linux-input+bounces-6792-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF4D6987F1C
	for <lists+linux-input@lfdr.de>; Fri, 27 Sep 2024 09:05:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E11641C20EFC
	for <lists+linux-input@lfdr.de>; Fri, 27 Sep 2024 07:05:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C8DF17C7BF;
	Fri, 27 Sep 2024 07:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b="xaxc3zKt";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="hUrsXTUU"
X-Original-To: linux-input@vger.kernel.org
Received: from fhigh-a3-smtp.messagingengine.com (fhigh-a3-smtp.messagingengine.com [103.168.172.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26BD815DBA3;
	Fri, 27 Sep 2024 07:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727420729; cv=none; b=R9jXi6Hjv0F7Oa4OZvn3WyDVzrZuVE2Ik5auzsmi8KzM+PpXvTGhTNdriy/AVRNvKkhUR5+b7InyL/tJ1kMGo9scfFywH9eS4A8GLuWVNW6B96lz5aC1tu9VSIxEDmzfVeLffDPOyfB75KWTDrpBz9MWnfgiWatLn1nfsq/aPz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727420729; c=relaxed/simple;
	bh=R0uVe1RKJ8guhY5oxJJmoR0nriXvqHNs/NY3cC1pu7o=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=VmEaDkZhJpgDyOPsOlrTiFBuuL0HLiU7q+dqw6SkcsbrhlgSPr4wEg0NGjLme2mvVzYwg2uAqUIjnjy/vnOugSwjbaUAbdlmBnHp+gzspRenanwMdFhjDkcQZjqnMMygUSrS9zz4usTFY33EwcYw1j47jiKaYf/il7DlvDWqp70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev; spf=none smtp.mailfrom=ljones.dev; dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b=xaxc3zKt; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=hUrsXTUU; arc=none smtp.client-ip=103.168.172.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ljones.dev
Received: from phl-compute-08.internal (phl-compute-08.phl.internal [10.202.2.48])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 4A7B511402E3;
	Fri, 27 Sep 2024 03:05:26 -0400 (EDT)
Received: from phl-imap-01 ([10.202.2.91])
  by phl-compute-08.internal (MEProxy); Fri, 27 Sep 2024 03:05:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ljones.dev; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1727420726;
	 x=1727507126; bh=R0uVe1RKJ8guhY5oxJJmoR0nriXvqHNs/NY3cC1pu7o=; b=
	xaxc3zKtS9IsEeXQnDR0IDDuxcj+pCnkWvbv+NHe9wwbDzEzjArg/gS6svhWCZ8S
	d/HMcjPUxkTkXCkonJ4GvQIZA5iGFbyCrbcDcgtJxNd5wEelIa4PSGLsreVwcNw9
	B21MpZ4NQZVTN56pC9MsnhKRpXNHZybO3zo4aJwej0lon+o9JAs+EK8J8TOVLnOT
	rOe4FPf3koXw846a8w1mJgi1NhbREFKZwcWnW9ONonxvySFUt2rcLjqkwbnwz2ei
	JjNNVIc3GkV1QPcnzFPZtqIz7GQsNCNFhuZ3euHwzYbUx1OJEM2lgPvayhdSNuTD
	smxvtKiNvKAp/rQX0Q5KVw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1727420726; x=
	1727507126; bh=R0uVe1RKJ8guhY5oxJJmoR0nriXvqHNs/NY3cC1pu7o=; b=h
	UrsXTUUPik0APXJsmQ5C7/7JDh5ddk7SWArdSCIU11ViX6kQq91DvwT/cNYbLXof
	IJil0w1XVbR/Kanu/33L0U4z6gP1fk1wDaqjTjzCCZSpDmwD+yzi6Jr1kv6bIRQN
	wXeY7mE6xjcF2kdk2aWGCtJxcP5OISEWwfwzpz8rXHauwAevPOMeimCJl/QZMaX6
	cLCYctZ3InAc57yw1dSgiiwfLoGg74mcubR2O8peSPMZE3Fjh3LCCgbOL9iajvGJ
	dkTAypt4qF5rNz78byTm2XYWFH+BtZl9c6PQ32GNhVgLeqT5g6y4A4BdSAVyOls8
	HS6gThDvOQ6RHptAg/HFA==
X-ME-Sender: <xms:Nln2Zkd2VmjZ9JfYs2a_iVSPwFyxBEV0fAWCJwl8y62BtbIC1dQFKA>
    <xme:Nln2ZmNCfv75sLGIYlP5v6KbFoHzEU6DdbCvbqoTw1_BP-QTNdO5xtTl2R8T-XTqu
    NkmTsq2pgAu0fJFOLg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvddtkedguddufecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthhqredtredt
    jeenucfhrhhomhepfdfnuhhkvgculfhonhgvshdfuceolhhukhgvsehljhhonhgvshdrug
    gvvheqnecuggftrfgrthhtvghrnhepkeeljeejtdejuddvheeljeffhfeggfevjeegtddv
    tdetjedtieejvdffhefgvdejnecuffhomhgrihhnpegtmhhurdgvughunecuvehluhhsth
    gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheplhhukhgvsehljhhonhgv
    shdruggvvhdpnhgspghrtghpthhtohepuddupdhmohguvgepshhmthhpohhuthdprhgtph
    htthhopegtohhrvghnthhinhdrtghhrghrhiesghhmrghilhdrtghomhdprhgtphhtthho
    pegsvghnthhishhssehkvghrnhgvlhdrohhrghdprhgtphhtthhopehjihhkohhssehkvg
    hrnhgvlhdrohhrghdprhgtphhtthhopehsuhhpvghrmhdusehkvghrnhgvlhdrohhrghdp
    rhgtphhtthhopehilhhpohdrjhgrrhhvihhnvghnsehlihhnuhigrdhinhhtvghlrdgtoh
    hmpdhrtghpthhtohephhguvghgohgvuggvsehrvgguhhgrthdrtghomhdprhgtphhtthho
    pehkvghrnhgvlhdqjhgrnhhithhorhhssehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtg
    hpthhtoheplhhinhhugidqihhnphhuthesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgt
    phhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:Nln2ZliOC9C7DqIBEscVu_N3FSN6Iy9tOdlxZ_v23xoVyZX7iL1bPA>
    <xmx:Nln2Zp8X0sTurOerOneAYqtZvNUCjSOVhMvRABK__WD3E7M08JhVHA>
    <xmx:Nln2ZguthHOkxD1Xe7EqfbQ6qT4t1sOq3X5urpAFQ4OCEn9GKTb_SQ>
    <xmx:Nln2ZgEsAPRt3gxrKN4FeshhgXYNbIKbTL9WU7-Qu7axoWMCk8I_2Q>
    <xmx:Nln2ZiJeqA7ZOGNRzHsIReEphCkWxmUHPPhElY0FJMeFYw889h7YNCoz>
Feedback-ID: i5ec1447f:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 08BA2336007C; Fri, 27 Sep 2024 03:05:26 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Fri, 27 Sep 2024 19:05:05 +1200
From: "Luke Jones" <luke@ljones.dev>
To: "Markus Elfring" <Markus.Elfring@web.de>,
 platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org,
 "Benjamin Tissoires" <bentiss@kernel.org>,
 "Corentin Chary" <corentin.chary@gmail.com>,
 "Hans de Goede" <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "Jiri Kosina" <jikos@kernel.org>, "Mario Limonciello" <superm1@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
Message-Id: <03cfc83f-6f19-436f-9896-78fd6b8cd8f7@app.fastmail.com>
In-Reply-To: <22c231f2-c28e-4083-8e62-590a8c2d8844@web.de>
References: <20240926092952.1284435-4-luke@ljones.dev>
 <08320b8e-a71b-4055-9fdf-1df76530ec1a@web.de>
 <f3b059cd-0045-435e-9bb9-467bb9cb0cc1@app.fastmail.com>
 <22c231f2-c28e-4083-8e62-590a8c2d8844@web.de>
Subject: Re: [v4 3/9] platform/x86: asus-armoury: move existing tunings to asus-armoury
 module
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

html a third time... I think I need to do something about that. Very ver=
y sorry.

On Fri, 27 Sep 2024, at 6:09 PM, Markus Elfring wrote:
> >> =E2=80=A6
> >>> +++ b/drivers/platform/x86/asus-armoury.h
> >>> @@ -0,0 +1,146 @@
> >> =E2=80=A6
> >>> +#ifndef _ASUS_BIOSCFG_H_
> >>> +#define _ASUS_BIOSCFG_H_
> >> =E2=80=A6
> >>
> >> I suggest to omit leading underscores from such identifiers.
> >> https://wiki.sei.cmu.edu/confluence/display/c/DCL37-C.+Do+not+decla=
re+or+define+a+reserved+identifier
> =E2=80=A6
> > the link is C standard, not kernel C right?
>=20
> Advice is offered in such a direction.
>=20
>=20
> > Pretty much everything I look at in the kernel seems to use the lead=
ing underscores.
>=20
> How much would you like to care for standard compliance concerns
> together with your software developments?

I only ask about because it seems to deviate from everything else I've v=
iewed. For example the older `asus-wmi.h` has:

#ifndef _ASUS_WMI_H_
#define _ASUS_WMI_H_

and every other header in the drivers/platform/x86 dir is similar. If wh=
at I'm supposed to is omit the leading `_` then sure I'll do it, it's no=
t of any consequence to me. But the difference gave me pause is all :)

Kind regards,
Luke.

> Regards,
> Markus
>=20

