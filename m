Return-Path: <linux-input+bounces-4287-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B2A05901B30
	for <lists+linux-input@lfdr.de>; Mon, 10 Jun 2024 08:25:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 287D61F2217A
	for <lists+linux-input@lfdr.de>; Mon, 10 Jun 2024 06:25:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96D9117583;
	Mon, 10 Jun 2024 06:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="dDnq/ec1";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="R6woaBMi"
X-Original-To: linux-input@vger.kernel.org
Received: from fhigh4-smtp.messagingengine.com (fhigh4-smtp.messagingengine.com [103.168.172.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE541168C7;
	Mon, 10 Jun 2024 06:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718000715; cv=none; b=NmMWA94jyITijWd+lNOIWOTuCyqlUyPuftuL6XBA8CZm37OUNZEE8wTDz2wV3G17Xrfow5agzmT6D67FBm8UTGWJpvPnODLSIsSsL2Jlt96lyr2KwaJibmeZG5yjDPPyk+LpMzcuDmi2XQuRNsxlNF3oqcKTuIKXsvr/hTElQlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718000715; c=relaxed/simple;
	bh=yC+84WD7XLjLTlzTp+zMGOHHC/5b24EuLBM5a2n8PXg=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:Cc:
	 Subject:Content-Type; b=lKkwe1IRVa7aJQOOKt046nArshKbsMB1TUHzLiCsS5BaOEks2L8km/2/Izq4CAM5MfENFCB702OazzMVm0zYWHbtfff86/FB8winLqh8YZpTCXudOFmXuBQr/kC3/63lFv31sBNKB6VIhikEXfbZRgm+IMkjBdqhaoRUq6Zr/7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=dDnq/ec1; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=R6woaBMi; arc=none smtp.client-ip=103.168.172.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id C1677114017D;
	Mon, 10 Jun 2024 02:25:12 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Mon, 10 Jun 2024 02:25:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1718000712;
	 x=1718087112; bh=/B4vf4pTZ3/nCdt+BXZpUnO2EJXjzGYMcK7+73LIL3E=; b=
	dDnq/ec17Yx2+l6h/w+3T9+CKHR4t8WKb6ed3Mt2rS1ZWcAVsMZOjEtuVi+WlJ8a
	jHFIohfpMUruTRV18XVqn2chGmWxCq13oarTuBKRC8p29eZM5x7OGaU7qsI2Qmqn
	xaIJFu+TG4McVh2SFkwh0avqBi1e/JR8e5UHSUYaEooAJOkCAnthVtMir5iwNDCL
	ZDGXSvpy58GvWl66r1jOK3WxBKbzX/P6fK4ixzNRwywrt6gt3k6vHL9xp8fo0mAq
	+8CO645jp8SYkd8agRkxcbHZ/wNRVeNWPi9oN4x4SVbMN1ildCAzw33SaqE8/Ojb
	1YPOx5NYlyCudBkuZ/SeQQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1718000712; x=
	1718087112; bh=/B4vf4pTZ3/nCdt+BXZpUnO2EJXjzGYMcK7+73LIL3E=; b=R
	6woaBMiD7Zyufu8Wl2EVvhPMpyx+mkAqRsSxe0KwJF6Dm6H5P8uAGeJhDj8+nwGU
	Y6aHs65XDwn3XG9kJbrUCqHJysxhXeRXJk/2qv0h3tRuRkIrtLNjfF8rFK01FNSQ
	gjKoNlcpZRakuEt5bC5tFdIcdy69px4knufG6Cn0Chri3CQdypSUE+x0ZpktV69B
	ik1bUXC9YXq5PqH7RABvJwvDxV2th3ExUOj/L7kV9miebqmDD9Zhqy+VIU1+PzFs
	GJKBbe6tzd7N554Sf1ueucx1Oy7ooNzkUmPhOzOr1q65/cB4RLViQZXY72AiXYP2
	CEeuQG/jNzE+nNyb0Ng0A==
X-ME-Sender: <xms:SJxmZrmMoXCtHrgbUphC0AWW2qq4ULsC4oOmnjU8K7y9WpfN1oUMCg>
    <xme:SJxmZu08uYn0N0kyWBlxnPD7d4MQ1fSY9IKmpR27OXyx9H-VVpB2ZjAhinpnUeLfr
    S942jxSERSHdm0EPd0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfedtledgheduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtgfesthhqredtreerjeenucfhrhhomhepfdet
    rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrg
    htthgvrhhnpeegfeejhedvledvffeijeeijeeivddvhfeliedvleevheejleetgedukedt
    gfejveenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    grrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:SJxmZho3eLgQKVKwHkKGmZfX5q8A_kdTr5a22ZBaKDITua1qdM8nHQ>
    <xmx:SJxmZjk-jCmP6IkeBXIiwsdZlsgYArGhA2adOw___tNvpgpGk2XQSA>
    <xmx:SJxmZp14bbdoa4Fouv4apxaLykoKWTLuRzs_Px9M2zZOfRHc4Z1VlQ>
    <xmx:SJxmZisFnEtqllb3RnwKmwPvm-YH2txmsfNcMWucPnrAZ87-XlTahg>
    <xmx:SJxmZjxfAVRr1fvgGiP3Vm1ttn4XRv-Fag2W6fLMweooaO343Q4U6vS1>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 6FE1AB6008F; Mon, 10 Jun 2024 02:25:12 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-497-g97f96844c-fm-20240526.001-g97f96844
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <54c19328-35e2-4506-aa3a-a0b08813d873@app.fastmail.com>
In-Reply-To: <ZmSi5_-4mD4AaIJW@fedora>
References: <20240529094816.1859073-1-arnd@kernel.org>
 <ZmSi5_-4mD4AaIJW@fedora>
Date: Mon, 10 Jun 2024 08:24:51 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: =?UTF-8?Q?Jos=C3=A9_Exp=C3=B3sito?= <jose.exposito89@gmail.com>,
 "Arnd Bergmann" <arnd@kernel.org>
Cc: "Jiri Kosina" <jikos@kernel.org>,
 "Benjamin Tissoires" <bentiss@kernel.org>,
 "Rahul Rameshbabu" <rrameshbabu@nvidia.com>,
 "Fabio Baltieri" <fabiobaltieri@chromium.org>,
 "Ivan Gorinov" <linux-kernel@altimeter.info>,
 "Johannes Roith" <johannes@gnu-linux.rocks>, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: uclogic: avoid linking common code into multiple modules
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 8, 2024, at 20:28, Jos=C3=A9 Exp=C3=B3sito wrote:
> On Wed, May 29, 2024 at 11:48:05AM +0200, Arnd Bergmann wrote:

>> @@ -154,10 +152,8 @@ obj-$(CONFIG_HID_WINWING)	+=3D hid-winwing.o
>>  obj-$(CONFIG_HID_SENSOR_HUB)	+=3D hid-sensor-hub.o
>>  obj-$(CONFIG_HID_SENSOR_CUSTOM_SENSOR)	+=3D hid-sensor-custom.o
>> =20
>> -hid-uclogic-test-objs		:=3D hid-uclogic-rdesc.o \
>> -				   hid-uclogic-params.o \
>> -				   hid-uclogic-rdesc-test.o
>> -obj-$(CONFIG_HID_KUNIT_TEST)	+=3D hid-uclogic-test.o
>> +hid-uclogic-test-objs		:=3D hid-uclogic-rdesc-test.o
>> +obj-$(CONFIG_HID_KUNIT_TEST)	+=3D hid-uclogic-test.o hid-uclogic-par=
ams.o hid-uclogic-params.o
>> =20
>>  obj-$(CONFIG_USB_HID)		+=3D usbhid/
>>  obj-$(CONFIG_USB_MOUSE)		+=3D usbhid/
>
> I tested your patch with:
>
> 	hid-uclogic-objs		:=3D hid-uclogic-core.o \
> 					   hid-uclogic-rdesc.o \
> 					   hid-uclogic-params.o
> 	obj-$(CONFIG_HID_UCLOGIC)	+=3D hid-uclogic.o
> 	[...]
> 	hid-uclogic-test-objs		:=3D hid-uclogic-rdesc-test.o
> 	obj-$(CONFIG_HID_KUNIT_TEST)	+=3D hid-uclogic.o hid-uclogic-test.o
>
> And I think it is a bit more clear and it looks like it does the trick
> removing the warning.

Right, that seems fine.

> Also, with that change only "EXPORT_SYMBOL_GPL(uclogic_rdesc_template_=
apply);"
> is required. The other EXPORT_SYMBOL_GPL can be removed.
>
> However, I'm not sure about what are the best practices using EXPORT_S=
YMBOL_GPL
> and if it should be used for each function/data in the .h file. Maybe =
that's
> why you added them.

No, having only the single export is better here, you should
have as few of them as possible. I did picked the more complicated
approach as I wasn't sure if loading the entire driver from the
test module caused any problems. Let's use your simpler patch
then.

     Arnd

