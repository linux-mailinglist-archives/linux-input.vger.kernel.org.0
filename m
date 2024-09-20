Return-Path: <linux-input+bounces-6620-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 448CB97D48D
	for <lists+linux-input@lfdr.de>; Fri, 20 Sep 2024 13:07:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CCEE01F21485
	for <lists+linux-input@lfdr.de>; Fri, 20 Sep 2024 11:07:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44E8A55887;
	Fri, 20 Sep 2024 11:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DfmUF6aC"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AC497DA76
	for <linux-input@vger.kernel.org>; Fri, 20 Sep 2024 11:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726830456; cv=none; b=MuEzka1KqZ0gYSSzXvLaohruu+bjDsLy67LFJuDKk8vdNjyxvaobFNC9M1v9bFeqWnr3jHHHJgWez3p1/8slaiy2WleUSUZ5UDSfAKLOu6rYMrvoRzVjZdRqAO4ahhQVsG4TnRX5IrFst6TYSyuSyXNXVbRnwEotfLqMqL9MjU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726830456; c=relaxed/simple;
	bh=cBahrtGETIfhd+b8E2mk7qAN8VD3vHDAxqozrip9p+w=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fVzdrrgvWVP09uciB2nI/Ffzj0prQlbgj0pgfSR+3NsC8cKPDPj7OU6eRzDC2BkvivGq6rL7qq8UqSh0gzVTw6Cna8GUr0eT29o13ErOtTsPkRJ/ZAV4GvTxXspJedgPrQN/vnSsZNxCqUslajqlH0V73idrz5VymA1BWBrbvFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DfmUF6aC; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5c46c2bf490so141760a12.3
        for <linux-input@vger.kernel.org>; Fri, 20 Sep 2024 04:07:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726830453; x=1727435253; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=dgOY4tE3kU7F9+C2Yi7v4tE5jVqdyq3YYe65UcNH0DI=;
        b=DfmUF6aCrok7n7+Dv43UfWZEtFC6e8nE6l1dlZ/c5O8MwqYQXPOtcVODbbiNUKNJOX
         nLeMfGxGF+fJn822NoYgY05YBCpip+glX9nXzUyz6LSBzfDiIuf1njvSP2ArGmnmdkRg
         DvPqV9Y59/kHmq3/kwVuOyQm0ozZqSISShgcb6SJT7zzjhjuRgG5i5ukKCcK9s9CpV7Y
         HqHmaLQ1RJCSk3eJ0SXGpmmMz0oeIgFUPZVW1hx7zRKzBJB8RveteK9syWyneRzODPyB
         eVxHcG1OHHahnb1HLtIiICTlD1acHk+1XHAkV0TwuJcr9gSSETBIwny5RcHH1s5OHfh2
         Ty8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726830453; x=1727435253;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dgOY4tE3kU7F9+C2Yi7v4tE5jVqdyq3YYe65UcNH0DI=;
        b=kgP+c2Wg99LblSEX2kne+Lwzl8nOQxoetwVNvUz4UcDZ4M+Z6qeQF9xeIm1PXXrOnr
         vfxOXBtv1JYC7Ra3OzFELUhoq1I5Sw8cCdykF8reAgOJf9iGXD56e6ru4BiV+mUMy6JY
         lcNbSv64zzYK36sIWbELYki7i1vt+9Wl6yrUQPf+Hf46l4oWH0BwwFQv7qBObEuRs4zb
         YoLOt5RNPTejfkR3U7rmD2pItuZduN6L5T7Ycu7jlI7Q6Krd9UvwU2X67eKAGQi4PJci
         YULlfc8LZrU8BijU6wBCv7rIsKshIQauJfB2qYHx12szsQrrdQpLy+5p5N+RfJI26Wv7
         Y2nQ==
X-Forwarded-Encrypted: i=1; AJvYcCVLjMcihX8JdBzZY1mFiMLjqfw5aBhTOkcU5+iI1p2V3gsOvAZB0ccW4J1kZJUW6C3rKdfnnnwIvZZWqQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1rsb/+NiRGcT9dpU0SzSDa/2V0rHxi+/NRg4vuXNSnQIel1qq
	l/mIPRsfFWTLF+iX7zy5YKwFzTWdJQI7a0nWoLpvz0LXDx0Ul9FH
X-Google-Smtp-Source: AGHT+IFPpygd2xvK04BdB08xlDfg4+z6bKTOhqb1LIxhz4Wid4g19Y5yZNkqH0DUSOoTiD7kna03QA==
X-Received: by 2002:a05:6402:358c:b0:5c4:23a4:ad5f with SMTP id 4fb4d7f45d1cf-5c46484f30bmr1862275a12.6.1726830452602;
        Fri, 20 Sep 2024 04:07:32 -0700 (PDT)
Received: from ?IPv6:2001:a61:341e:1201:c434:b5b1:98a6:efed? ([2001:a61:341e:1201:c434:b5b1:98a6:efed])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c42bc88d02sm7048975a12.80.2024.09.20.04.07.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Sep 2024 04:07:32 -0700 (PDT)
Message-ID: <c7c72490d6d952c320d387be986c7016ac45cbde.camel@gmail.com>
Subject: Re: [PATCH] Input: adp5588-keys: fix check on return code
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, nuno.sa@analog.com
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>,
 linux-input@vger.kernel.org,  Michael Hennerich
 <michael.hennerich@analog.com>
Date: Fri, 20 Sep 2024 13:07:31 +0200
In-Reply-To: <Zu0vq0ogr2HzXWv7@google.com>
References: <20240920-fix-adp5588-err-check-v1-1-81f6e957ef24@analog.com>
	 <Zu0vq0ogr2HzXWv7@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40) 
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, 2024-09-20 at 08:17 +0000, Dmitry Torokhov wrote:
> On Fri, Sep 20, 2024 at 09:22:52AM +0200, Nuno Sa via B4 Relay wrote:
> > From: Nuno Sa <nuno.sa@analog.com>
> >=20
> > During adp5588_setup(), we read all the events to clear the event FIFO.
> > However, adp5588_read() just calls i2c_smbus_read_byte_data() which
> > returns the byte read in case everything goes well. Hence, we need to
> > explicitly check for a negative error code instead of checking for
> > something different than 0.
> >=20
> > Fixes: e960309ce318 ("Input: adp5588-keys - bail out on returned error"=
)
> > Signed-off-by: Nuno Sa <nuno.sa@analog.com>
> > ---
> > =C2=A0drivers/input/keyboard/adp5588-keys.c | 2 +-
> > =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/input/keyboard/adp5588-keys.c
> > b/drivers/input/keyboard/adp5588-keys.c
> > index b5f4becf5cb6f..d25d63a807f23 100644
> > --- a/drivers/input/keyboard/adp5588-keys.c
> > +++ b/drivers/input/keyboard/adp5588-keys.c
> > @@ -620,7 +620,7 @@ static int adp5588_setup(struct adp5588_kpad *kpad)
> > =C2=A0
> > =C2=A0	for (i =3D 0; i < KEYP_MAX_EVENT; i++) {
> > =C2=A0		ret =3D adp5588_read(client, KEY_EVENTA);
> > -		if (ret)
> > +		if (ret < 0)
> > =C2=A0			return ret;
> > =C2=A0	}
>=20
> Hmm... There are a bunch of places where we do not check result of
> adp5588_read(). I wonder if we should:
>=20
> 1. add the checks
> 2. change it to return error or 0 and return the value through a pointer
> argument.

It does make sense. I can take care of that.=C2=A0

And similar work will be needed in the adp5589 driver. I'll include it in t=
he series
I'm preparing for the FW properties.

- Nuno S=C3=A1



