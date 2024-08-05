Return-Path: <linux-input+bounces-5365-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DF96948659
	for <lists+linux-input@lfdr.de>; Tue,  6 Aug 2024 01:50:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CCCD7B22A2E
	for <lists+linux-input@lfdr.de>; Mon,  5 Aug 2024 23:50:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B790515573B;
	Mon,  5 Aug 2024 23:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b="e0h+IJxg";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="BkTmiiR9"
X-Original-To: linux-input@vger.kernel.org
Received: from fout1-smtp.messagingengine.com (fout1-smtp.messagingengine.com [103.168.172.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2FD714F9F1;
	Mon,  5 Aug 2024 23:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722901812; cv=none; b=DseH1IA9upqGptqm20ew+U/ov5PatqS2iDee9el4oIKElTWLQ6SBN+fECpKhcKys9bHrNFWPKwUtkJ4g/whhLleYFQGKpCgSQFEAhcJWkbxiAApRUo+bOinZivKfutSR6Nj+SUrYCtn5gTLGDiY9v6MSPScFUtnHWxJNYUVC3JQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722901812; c=relaxed/simple;
	bh=mVlVuuDyXU5iq9wy19T9aPu90V2FiW6ao8FMT05Rjng=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=JvMTPRcxw8yCF0AORvpUNgsVksUlhEz9Y1qkm32Rqyk+SRpUN9c/7nckR0tzqty0o6bGCFkIuuEW2xwgcHUW6ir1ZJDPXa6YL3fCyElz+uGAGMc7zO87BvLJIq0HOTcvBcpz8UMkbbprWuN686DOmIwwDBBKIMvQ+n4VopHzn98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev; spf=none smtp.mailfrom=ljones.dev; dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b=e0h+IJxg; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=BkTmiiR9; arc=none smtp.client-ip=103.168.172.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ljones.dev
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailfout.nyi.internal (Postfix) with ESMTP id E96B91387F05;
	Mon,  5 Aug 2024 19:50:09 -0400 (EDT)
Received: from imap41 ([10.202.2.91])
  by compute3.internal (MEProxy); Mon, 05 Aug 2024 19:50:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ljones.dev; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1722901809;
	 x=1722988209; bh=y2GHnN+Xuk2XsNUQ/FD3hS/MiKKa1xnOmALjB5bLu6k=; b=
	e0h+IJxggVWBWGj9JDc5eHKMC6poaCqFusqL96QM+/6AnDWRDllfLp/DgFZrfJNR
	XIp0PbZhFHU5rNfI3tYkBBi7vDDoNf2g/wjcxA2Hgmeh5pvgHXwz2GnObXUyvsJ9
	+noK8dLlk6/de7Im0JKkr3AzrHwgyPcoMuVGkchM3/01pVTQjsk1MyH/QmLp0zpq
	GRFbyXDk45gd95ltSp/h+eCLOIFMXNZiRxBYsZshVF9k3iwB8UfgGhZ5JZwWECCo
	LniGoPQnJWwmcq5LiLpQXXkqdOmq27NzOnkGD0NlhKeGm40+u7CoSSqtJMrGqcUA
	YpfuwIWXAjbeAL7xs7Smew==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1722901809; x=
	1722988209; bh=y2GHnN+Xuk2XsNUQ/FD3hS/MiKKa1xnOmALjB5bLu6k=; b=B
	kTmiiR9N1G/Z720/u/InaIALRcYtuN7mZb9QJuU32y5aTHX6131RXPMTCtS8jWBb
	p1CDSP+x0oiZkXf78uIZzFPMa6DHQhPhwG+z4NOuCvR4+2nwgkwL3L7Zlx5+O38l
	gZNvI461SkzxRTe2dWrMjrz53mekt8fMAB3D+iOz9EJzvwHGveW+9o2CjD3ct6cV
	RcFXvIGwYJ2SG7yFs+gjjscpfQgwe4vd/5tC0+hd5Cv4d/iq8jDk6yyp6XsSmhyN
	0ISxwrYJ8JrJ9WrvzL6ghZ+wE4dSJetnrhbJZbQKMs5FBiFB+ou0ifXLoj0qdq0O
	CsieZ8Sj/yE6REn+RUmAg==
X-ME-Sender: <xms:MWWxZv4zKB6khCUziTjByrn4kkwnhjR374EslpMd-97H6EFZQCoTYg>
    <xme:MWWxZk5z8m_adJrQ3Hk6QlCI1DoKZxXp9FYB-g1g0JPeyi2KA_TtsapO_PrU3DSce
    -rEAHPE0rge4onCYOM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrkeejgddvkecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdfnuhhk
    vgculfhonhgvshdfuceolhhukhgvsehljhhonhgvshdruggvvheqnecuggftrfgrthhtvg
    hrnhepgfeiffehtdfghfettdeiuddtfeekvdejgfevhefhffevtdfhjeelgeefffekvdev
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheplhhukh
    gvsehljhhonhgvshdruggvvhdpnhgspghrtghpthhtoheptd
X-ME-Proxy: <xmx:MWWxZmeEG2UcyeIClHafL_KTExy75yqoAkolM7YJt4AlInWp6PQkMA>
    <xmx:MWWxZgJWg2tGVbRNmz7JXvHn05ikqelWVSVU08B72jsqOzweQmOlyw>
    <xmx:MWWxZjIvTQiJXmuPn6eiO5fM0YRy-LaLrLVOnKvsc4vkjOVZ-bUs-g>
    <xmx:MWWxZpygQkAqP1cpxNaX91MKxNbAEkCvcV2O-ci-RD20D9FrW-FnTA>
    <xmx:MWWxZqUwSJ8c5375cB4FelCQgUGEpsahYRloYmcvbFUeBO3A1xJG20Qe>
Feedback-ID: i5ec1447f:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id BC09E2340080; Mon,  5 Aug 2024 19:50:09 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 06 Aug 2024 11:49:49 +1200
From: "Luke Jones" <luke@ljones.dev>
To: "Jiri Kosina" <jikos@kernel.org>
Cc: "Benjamin Tissoires" <bentiss@kernel.org>, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org
Message-Id: <e8a37c76-6922-459d-b4a2-688ee6287512@app.fastmail.com>
In-Reply-To: <nycvar.YFH.7.76.2408021251150.12664@cbobk.fhfr.pm>
References: <20240724223125.44914-1-luke@ljones.dev>
 <nycvar.YFH.7.76.2408021251150.12664@cbobk.fhfr.pm>
Subject: Re: [PATCH] hid-asus: add ROG Ally X prod ID to quirk list
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, 2 Aug 2024, at 10:52 PM, Jiri Kosina wrote:
> On Thu, 25 Jul 2024, Luke D. Jones wrote:
> 
> > The new ASUS ROG Ally X functions almost exactly the same as the previous
> > model, so we can use the same quirks.
> > 
> > Signed-off-by: Luke D. Jones <luke@ljones.dev>
> > ---
> >  drivers/hid/hid-asus.c | 3 +++
> >  drivers/hid/hid-ids.h  | 1 +
> >  2 files changed, 4 insertions(+)
> > 
> > diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
> > index 9010f12a221e..e5f6664bac0f 100644
> > --- a/drivers/hid/hid-asus.c
> > +++ b/drivers/hid/hid-asus.c
> > @@ -1255,6 +1255,9 @@ static const struct hid_device_id asus_devices[] = {
> >  { HID_USB_DEVICE(USB_VENDOR_ID_ASUSTEK,
> >      USB_DEVICE_ID_ASUSTEK_ROG_NKEY_ALLY),
> >    QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD },
> > + { HID_USB_DEVICE(USB_VENDOR_ID_ASUSTEK,
> > +     USB_DEVICE_ID_ASUSTEK_ROG_NKEY_ALLY_X),
> > +   QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD },
> >  { HID_USB_DEVICE(USB_VENDOR_ID_ASUSTEK,
> >      USB_DEVICE_ID_ASUSTEK_ROG_AZOTH_KEYBOARD),
> >    QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD },
> > diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
> > index fdf2d480533b..57f1f1bc5eb6 100644
> > --- a/drivers/hid/hid-ids.h
> > +++ b/drivers/hid/hid-ids.h
> > @@ -212,6 +212,7 @@
> >  #define USB_DEVICE_ID_ASUSTEK_ROG_RAIKIRI_PAD 0x1abb
> >  #define USB_DEVICE_ID_ASUSTEK_ROG_NKEY_ALLY 0x1abe
> >  #define USB_DEVICE_ID_ASUSTEK_ROG_AZOTH_KEYBOARD 0x1a83
> > +#define USB_DEVICE_ID_ASUSTEK_ROG_NKEY_ALLY_X 0x1b4c
> 
> I've applied the patch, but got a conflict here, because I don't see 
> USB_DEVICE_ID_ASUSTEK_ROG_AZOTH_KEYBOARD in my tree, nor in Linus' tree.
> What tree was this patch generated against?

Apologies. I have a large tree of work for various asus devices. What you see should have been dropped but it looks like a git-rebase didn't go well.

Do you need me to regenerate it?

