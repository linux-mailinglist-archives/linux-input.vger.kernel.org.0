Return-Path: <linux-input+bounces-14170-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 75F02B2D47A
	for <lists+linux-input@lfdr.de>; Wed, 20 Aug 2025 09:06:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CA3FB179BC8
	for <lists+linux-input@lfdr.de>; Wed, 20 Aug 2025 07:06:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8D162C21F9;
	Wed, 20 Aug 2025 07:06:14 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mail.3ffe.de (0001.3ffe.de [159.69.201.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DE7017C91;
	Wed, 20 Aug 2025 07:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.201.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755673574; cv=none; b=Cw6xlxQJk2B10HQT2lvYVGDFBXDEa4++MxnGDeqnhh1tkN1uMmGLigFAAcAfmXBM9/oikz+KdGMb8J8Re7X6wbbb+TaQYEbGaYQ7C1yR5tIlG7dGb26FHD9gtVL5kjajPT5GbdQ1ICMmf4jododnnuy8WwrsE9QfXmn/VZqQ8O4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755673574; c=relaxed/simple;
	bh=9wFNG1kfWSvROICd4hU7+JSUDR1jmTent6pNDYObpTQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:From:To:Subject:
	 References:In-Reply-To; b=qnyOST9dTWeefpGtqOiw8hk5A9dKi5ulLMskLGeu8cjNH/7T4JDM3saph/mFuVENN7Drl08Q/wziDS0FQ3j+jFPlEGeYQNWmXtqnmFLdeIrgSKLOpLHtX/Pky7Kc0C9QFDbalC9VvffDOQoa0OBPPyE50DlEyrXzQEc0/JHfi2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=walle.cc; arc=none smtp.client-ip=159.69.201.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=walle.cc
Received: from localhost (unknown [IPv6:2a02:810b:4320:1000:4685:ff:fe12:5967])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 2A439619;
	Wed, 20 Aug 2025 09:06:04 +0200 (CEST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 20 Aug 2025 09:06:03 +0200
Message-Id: <DC72C4R6NXKI.MF84P0PHWROB@kernel.org>
Cc: "Lee Jones" <lee@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Julien Panis" <jpanis@baylibre.com>, "Dmitry
 Torokhov" <dmitry.torokhov@gmail.com>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-input@vger.kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Jon Cormier" <jcormier@criticallink.com>
Subject: Re: [PATCH 0/3] Powerbutton driver and powerdown request for
 TPS65224 PMIC
X-Mailer: aerc 0.20.0
References: <20250520-linux-stable-tps6594-pwrbutton-v1-0-0cc5c6e0415c@criticallink.com> <DC6D9ESWXGKO.1NS287IU5YJSZ@kernel.org> <DC6DBZ4HHGOF.11HI37DX56PH0@kernel.org> <CADL8D3Y0hRgJ6P59YvUKYzYBADjCXr7kevHNUDoqZXT41Ka2Yw@mail.gmail.com>
In-Reply-To: <CADL8D3Y0hRgJ6P59YvUKYzYBADjCXr7kevHNUDoqZXT41Ka2Yw@mail.gmail.com>

Hi,

On Tue Aug 19, 2025 at 6:22 PM CEST, Jon Cormier wrote:
> On Tue, Aug 19, 2025 at 7:30=E2=80=AFAM Michael Walle <mwalle@kernel.org>=
 wrote:
>>
>> On Tue Aug 19, 2025 at 1:27 PM CEST, Michael Walle wrote:
>> > Hi Job,
>> >
>> > > The following patches were created to get the tps65224 PMIC
>> > > powerbutton driver and power off request working on the
>> > > MitySOM-AM62PX. The patches are as follows:
>> >
>> > Are there any news on this series? Do you plan to post a new
>> > version soon, or do you want me to take over? I'd like to get
>> > support for this into the kernel :)
>>
>> FWIW, jsava@criticallink.com is bouncing.
> Yeah sorry, Job has gone back to school, he was on an internship.
>
> I'm not entirely sure how best to move forward with this change.
> There have been several suggestions thrown out and I'm a little lost
> on what's best/easiest.
>
> If you want to take over and add us as co authors that would be
> greatly appreciated.  I can get his personal email if that makes
> sense.  I'm not sure how the kernel normally deals with short term
> emails (interns).

I've asked around and Krzysztof said I should replace the mail with
his new address - or if I can't find it, use the old one. So yes,
you could ask him for his new (or private) address and if he's fine
with having that mentioned in the commit message.

> Note we are currently using the driver as is, on an Android prototype
> and for some reason Android isn't able to detect the power button
> hold, and open the power menu. Single push works fine to turn off the
> screen.  I haven't looked into it yet, to see if this is an Android
> issue or if we are using the POWER key events wrong. Just thought I'd
> mention it.

Thanks, FWIW I'm using it with (normal) linux and it's working fine.
I'll double check if the press and release event is actually working.

-michael

