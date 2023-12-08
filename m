Return-Path: <linux-input+bounces-631-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DD5680AF42
	for <lists+linux-input@lfdr.de>; Fri,  8 Dec 2023 23:00:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 40ED31F21290
	for <lists+linux-input@lfdr.de>; Fri,  8 Dec 2023 22:00:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8ED9158AC6;
	Fri,  8 Dec 2023 22:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=gimli.ms.mff.cuni.cz header.i=@gimli.ms.mff.cuni.cz header.b="Zy/18sre"
X-Original-To: linux-input@vger.kernel.org
Received: from nikam.ms.mff.cuni.cz (nikam.ms.mff.cuni.cz [195.113.20.16])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88A0D10E0;
	Fri,  8 Dec 2023 13:59:58 -0800 (PST)
Received: from gimli.ms.mff.cuni.cz (gimli.ms.mff.cuni.cz [195.113.20.176])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by nikam.ms.mff.cuni.cz (Postfix) with ESMTPS id DDD1628C0AD;
	Fri,  8 Dec 2023 22:59:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gimli.ms.mff.cuni.cz;
	s=gen1; t=1702072796;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=u83W/8yCmWL5UJU28TDyjBD3AbDU6kuavr0yrIvTIkc=;
	b=Zy/18srepZ+soVkgMjGtAo9w1X/GHx4E2fdM1T+P6tSBD2p7YCkNlnbpSGCDlpdqbDwC0Z
	DQ+mOFlxXyzOG0VrlYWVkxgW6Qq4SFqc5GKxIwxmTjzggrnFtLfdlekIvJE3xo/oXOXXIK
	ukEt9W5No3f6KnB3Crib1THm6PvJOug=
Received: from localhost (internet5.mraknet.com [185.200.108.250])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: karelb)
	by gimli.ms.mff.cuni.cz (Postfix) with ESMTPSA id B6EE644BE2C;
	Fri,  8 Dec 2023 22:59:56 +0100 (CET)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 08 Dec 2023 22:59:56 +0100
Message-Id: <CXJAG826ZTNA.2F8WOGVNYADKP@gimli.ms.mff.cuni.cz>
From: "Karel Balej" <karelb@gimli.ms.mff.cuni.cz>
Cc: =?utf-8?q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>,
 <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 "Karel Balej" <balejk@matfyz.cz>
Subject: Re: [PATCH v3 5/5] input/touchscreen: imagis: add support for
 IST3032C
To: "Markuss Broks" <markuss.broks@gmail.com>, "Dmitry Torokhov"
 <dmitry.torokhov@gmail.com>, "Rob Herring" <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Henrik Rydberg" <rydberg@bitmath.org>,
 <linux-input@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
References: <20231202125948.10345-1-karelb@gimli.ms.mff.cuni.cz>
 <20231202125948.10345-6-karelb@gimli.ms.mff.cuni.cz>
 <89f7e7de-c574-49ab-885d-c6d4427fe64f@gmail.com>
In-Reply-To: <89f7e7de-c574-49ab-885d-c6d4427fe64f@gmail.com>

Markuss,

thank you for the review.

> > diff --git a/drivers/input/touchscreen/imagis.c b/drivers/input/touchsc=
reen/imagis.c
> > index 84a02672ac47..41f28e6e9cb1 100644
> > --- a/drivers/input/touchscreen/imagis.c
> > +++ b/drivers/input/touchscreen/imagis.c
> > @@ -35,6 +35,8 @@
> >   #define IST3038B_REG_CHIPID		0x30
> >   #define IST3038B_WHOAMI			0x30380b
> >  =20
> > +#define IST3032C_WHOAMI			0x32c
> > +

> Perhaps it should be ordered in alphabetic/alphanumeric order,=20
> alternatively, the chip ID values could be grouped.

Here I followed suit and just started a new section for the new chip,
except there is only one entry. I do agree that it would be better to
sort the chips alphanumerically and I am actually surprised that I
didn't do that - but now I see that the chips that you added are not
sorted either, so it might be because of that.

I propose to definitely swap the order of the sections, putting 32C
first, then 38B and 38C at the end (from top to bottom). The chip ID
values could then still be grouped in a new section, but I think I would
actually prefer to keep them as parts of the respective sections as it
is now, although it is in no way a strong preference.

Please let me know whether you agree with this or have a different
preference. And if the former, please confirm that I can add your
Reviewed-by trailer to the patch modified in such a way.

Best regards,
K. B.

