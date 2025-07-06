Return-Path: <linux-input+bounces-13396-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CAAA1AFA804
	for <lists+linux-input@lfdr.de>; Sun,  6 Jul 2025 23:49:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 26280168007
	for <lists+linux-input@lfdr.de>; Sun,  6 Jul 2025 21:49:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4ABC91E3DE5;
	Sun,  6 Jul 2025 21:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=emily.st header.i=@emily.st header.b="QfJ8QprH";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="GcKKWDbp"
X-Original-To: linux-input@vger.kernel.org
Received: from fout-b4-smtp.messagingengine.com (fout-b4-smtp.messagingengine.com [202.12.124.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C18F9846F
	for <linux-input@vger.kernel.org>; Sun,  6 Jul 2025 21:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751838570; cv=none; b=qy0gYPV+pC09TMIVRuM8N1AQ+wGP4x7AGocbvFW7IRv6kpfQLiwbobZ+QmBw7MMW2SZ1ODAw0R72ToespQiLfFjbasIr4OMBdgxKFxgJBIY4wg/9dOmE8llHOiMBPyRNdQ4+vqoYq52aDUzGXEwd9Ccxn/VasaFfNzSIAETbKrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751838570; c=relaxed/simple;
	bh=XaX4Qvovbh3Mt9VVfCSz7HyrkNQGqH1+eA3/Ax9VxyA=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=r6d160fLjvOH1fKij1EeRRZiRAKYjwXZkxmzHVDtGZYCmMy0ygvKCAPyVs9ONr6R4oBsUVsJqDzkFL/5l1MEBxgDOje6Y2z242jaYQGM8bVt5AVnjB2m5nkXKjX4OtaPlT3vaHD6M7YH8V+u+FuHVcqivT8Uj3aUtMLhAGloadg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=emily.st; spf=pass smtp.mailfrom=emily.st; dkim=pass (2048-bit key) header.d=emily.st header.i=@emily.st header.b=QfJ8QprH; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=GcKKWDbp; arc=none smtp.client-ip=202.12.124.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=emily.st
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=emily.st
Received: from phl-compute-12.internal (phl-compute-12.phl.internal [10.202.2.52])
	by mailfout.stl.internal (Postfix) with ESMTP id 808B91D00167;
	Sun,  6 Jul 2025 17:49:26 -0400 (EDT)
Received: from phl-imap-08 ([10.202.2.84])
  by phl-compute-12.internal (MEProxy); Sun, 06 Jul 2025 17:49:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emily.st; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1751838566;
	 x=1751924966; bh=XaX4Qvovbh3Mt9VVfCSz7HyrkNQGqH1+eA3/Ax9VxyA=; b=
	QfJ8QprHiPh6CA3kF6hbnkZdVI/XeDQ+KUnNRcG5/2jrwNp/xgRwIRxxaaqCigQ8
	iUGijok5zad13QCMMF0gGk0TcLefBzLoLjGyBbTHSLPGXSVeeZPWMs5l7OvzvlgM
	7bFYSGDa1tOip3//dv8SeMTCudFG2Fzr9EbrJBPgY6uGCVkje4XIX8cxH7sKip0e
	e2qJVoTC6smUxymh7X578Ut8lFmImgr7n5TTI7iT9RxSk1wtO+/T0dyrV6Zfq36A
	Xu5oNyFaYEVOtQQRA+PgV1PodiscVu1ZVRHq7mii0LjsoeKMYW5rGl8jElOYEueZ
	gHcu0uS19hIXDLJ2If52MQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1751838566; x=
	1751924966; bh=XaX4Qvovbh3Mt9VVfCSz7HyrkNQGqH1+eA3/Ax9VxyA=; b=G
	cKKWDbpmDwBgmb5HOzIiWvS+v+XePW1U/t0OVYsG5YCrDewLzpoXkRbQI873pIhC
	Qlok6d4UJndI1P3SvLTeZlghJXrYz/qbPzDZx2vAdJyiGZzywJArTONijJCVgrgY
	OdTmqjHBLFE4dXy0JNpgxudSzExZM4lPAuoxW08ir/7gO30AlvdFl7PYupB2RZt2
	wr+fJVJdRLxWGgonzTR0EyO5BNg1OciaoymD0+MRMeCpPJto/w4ijLdRudApgoAb
	zldB2TBNgkSvug/lLJ/XBWZy+JexKtaQ8jLyyEk3hhph88pi2eoW5cEkJ9pX4AV7
	qayi4wXdtEh/H5ORWxwlQ==
X-ME-Sender: <xms:Ze9qaBZ7JVN32Q1-fn-nCSmQjYaN2XRBdUZJ8g9-IBtto6bsi-2WGg>
    <xme:Ze9qaIZIyedSa2_Kb-wnw7lBIfLsgDsBNh_cYEYN4gPB-2YzOOfAPtdwoFLJldwzE
    xdN1iDgQVZmTo0tWw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdeftddtfecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenogfuuh
    hsphgvtghtffhomhgrihhnucdlgeelmdenucfjughrpefoggffhffvvefkjghfufgtgfes
    thhqredtredttdenucfhrhhomheplhhinhhugiesvghmihhlhidrshhtnecuggftrfgrth
    htvghrnhepleekffefgedvgeehjeeuvdektddvjeelgfegffehvddugeeiledukeehtdfh
    fedtnecuffhomhgrihhnpehgihhthhhusgdrihhonecuvehluhhsthgvrhfuihiivgeptd
    enucfrrghrrghmpehmrghilhhfrhhomheplhhinhhugiesvghmihhlhidrshhtpdhnsggp
    rhgtphhtthhopeekpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegujhhoghhorh
    gthhhotghksehgmhgrihhlrdgtohhmpdhrtghpthhtoheprhihmhgttghlvghlsehgmhgr
    ihhlrdgtohhmpdhrtghpthhtohepsggvnhhtihhssheskhgvrhhnvghlrdhorhhgpdhrtg
    hpthhtohepjhhikhhosheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepghgrrhhgrggu
    ihhthigrtdeksehlihhvvgdrtghomhdprhgtphhtthhopehnrgguihgrsehnhhhprdhshh
    dprhgtphhtthhopehpvghrshhonhgrlhesshhjohhhrghlrdhnvghtpdhrtghpthhtohep
    lhhinhhugidqihhnphhuthesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:Ze9qaD-dxI5jg9jLtvesGlQtzUABh0h7ElcwzGszWLBA-cj000t64Q>
    <xmx:Ze9qaPr59EtpLrm6mEPyo5iDDgU6WMpQJvClUqWLomriGKphYbCwaQ>
    <xmx:Ze9qaMrPoOq8UnfLKlC3yhFvYrj74_vSwim6_O6f1XFgsiabcQxzQw>
    <xmx:Ze9qaFSRRpxR6JY8Maj7Eg4iaA8ldLaTJ0CLHq4K_zSixAOAuo14sg>
    <xmx:Zu9qaM-KwcVQI2RP8ZnS0FbkucROvBWa4xWzh8hh2x0uKQpueq7rJ4Eq>
Feedback-ID: i7ef146af:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id B2DE92CE0071; Sun,  6 Jul 2025 17:49:25 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: Tfbf56cbb9d0b83fe
Date: Sun, 06 Jul 2025 14:48:43 -0700
From: linux@emily.st
To: "Aditya Garg" <gargaditya08@live.com>,
 "Saihaj Johal" <personal@sjohal.net>, linux-input@vger.kernel.org
Cc: "Daniel J. Ogorchock" <djogorchock@gmail.com>,
 "Nadia Holmquist Pedersen" <nadia@nhp.sh>,
 "Ryan McClelland" <rymcclel@gmail.com>, "Jiri Kosina" <jikos@kernel.org>,
 "Benjamin Tissoires" <bentiss@kernel.org>
Message-Id: <0bc102b6-cdd0-4f1f-910d-db752c52eb85@app.fastmail.com>
In-Reply-To: 
 <PN3PR01MB95979E06C65B4BE4051BF9B7B84CA@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
References: <3642543.dWV9SEqChM@saihaj-mainpc>
 <PN3PR01MB95979E06C65B4BE4051BF9B7B84CA@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
Subject: Re: hid_nintendo Switch 2 Pro Controller support - where to start?
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 5, 2025, at 23:27, Aditya Garg wrote:
> On 06-07-2025 12:18 am, Saihaj Johal wrote:
>> Hello,
>> I recently got a Nintendo Switch 2 Pro Controller that is not current=
ly=20
>> directly supported by the kernel like how the Switch 1 controllers ar=
e.=20
>> Looking in "hid-ids.h", there is no product ID for the new controller=
 (got=20
>> 0x2069 from "lsusb -v"). The device class shows as miscellaneous devi=
ce, and=20
>> the controller does not show the player LEDs to show it is active (it=
 only=20
>> charges over USB, alongside showing in "lsusb" as well as showing as =
a USB=20
>> audio device for the headphone jack on the bottom). However, I have m=
anaged to=20
>> get it to work as a HID device using this website (https://
>> handheldlegend.github.io/procon2tool/) which uses WebUSB to send the =
right=20
>> commands to make the controller turn on fully. After enabling, this s=
etup=20
>> seemingly works with the existing evdev system, although with some bi=
zarre=20
>> changes like the left stick's up and down being reversed (at least in=
 KDE's=20
>> game controller settings). The first step would likely be to add the =
device ID=20
>> to "hid-ids.h", but from there where should I go in order to perhaps =
work on=20
>> full support? I assume anything would work on the things discovered a=
lready by=20
>> the WebUSB enabler tool, however I am very new to C and kernel develo=
pment in=20
>> general.=20
>
> Simply mailing the mailing list won't get you replies. You should also=
 email
> relevant maintainers.
>
> Ccing them

Hi, in 2022 I spent some time customizing the existing `hid_nintendo` dr=
iver to add support for a few more first-party Nintendo controllers made=
 for the Nintendo Switch. I no longer work on this, since my day job kee=
ps me very busy, but I can try to share a little bit about the obstacles=
 I encountered.

When I first encountered the `hid_nintendo` driver, it was written very =
specifically to handle the original first-party Nintendo Switch controll=
ers, most specifically the Joy-Cons. Part of what I did was to attempt t=
o generalize the driver somewhat to make it easier to add support for ot=
her kinds of controllers. I did **not** succeed in completing this work,=
 but I did make enough progress to succeed in my goal of supporting the =
N64 and Genesis controllers. And I know that some people were successful=
 in using the driver that I forked.

Although I was not directly involved in incorporating this code into the=
 Linux kernel again, I am gratified that people found it useful enough t=
o incorporate.

I don't really know to what extent it's going to be necessary to rework =
the existing driver, or whether it's appropriate to create a new driver =
for the second generation of the Nintendo Switch input peripherals. Sinc=
e this is a new generation of hardware device, there may be some differe=
nces in how it communicates over USB or Bluetooth. That is a bit beyond =
my knowledge, and I don't know if that information has been fully revers=
e engineered yet. It probably should not be taken for granted that what =
worked with the original Nintendo Switch controllers will work with the =
second generation as well. I would defer to the experts on this list.

Assuming that you want to experiment simply with trying to adapt the cur=
rent driver to handle the newer peripherals, you will first need to modi=
fy the device IDs, as you've already discovered, in `hid-ids.h`. You wil=
l also need to modify the driver slightly to "claim" those peripherals (=
to tell the input subsystem which driver handles those device inputs). I=
f you are successful in allowing the existing driver to talk to the new =
Switch 2 controllers, then you must determine the numerical codes the co=
ntroller emits when certain inputs are used and to map those to the actu=
al buttons being used. Specifically, you must find a way to intercept th=
e numerical codes that are coming from the controller, determine which i=
nputs those control codes map to, and then calling the API of the kernel=
 to create the correct inputs. I recall that when I did this, I think I =
read the codes out of the raw input device exposed by the kernel (somewh=
ere in /dev/input, I think?), and then wrote down on paper which codes I=
 saw when I pressed which buttons. Then I followed the existing pattern =
of how the kernel driver mapped those input codes to the existing kernel=
 inputs. The current driver has many good examples of this in action.

**Take all this with a grain of salt.** I did this work years ago. I was=
 never really a Linux kernel developer, and I am very rusty on how the d=
river worked. I can only remember the generalities, and I would again de=
fer to the experts on this list to correct any mistakes I've inadvertent=
ly added here. I hope this helps since I was doing a very similar thing =
to what you're doing now. Best of luck.

