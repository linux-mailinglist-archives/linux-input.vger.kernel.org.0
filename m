Return-Path: <linux-input+bounces-6594-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5564F97BA06
	for <lists+linux-input@lfdr.de>; Wed, 18 Sep 2024 11:17:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 87DAB1C21A50
	for <lists+linux-input@lfdr.de>; Wed, 18 Sep 2024 09:17:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1E971304BA;
	Wed, 18 Sep 2024 09:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DWmZzSvP"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B18A4C8C;
	Wed, 18 Sep 2024 09:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726651050; cv=none; b=u0tfYcDRqX/aT74Vaig6vhZjYOW/BF/q3FFBRd51hnkWJ7Y4Kgb7KLsbJiUv3b+TrcDsoMtGyKwwfrPg8WW4BLpqdyrP0nic61RtBdOFUrnFY2InPivYS0nFhd9lGS8wE13gQPgq6yZFhW7Tz0QNgUdv4qToN0167iweka2Pr50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726651050; c=relaxed/simple;
	bh=gHVgazaMlap02rbz/N01EBqF3qRxYVTPMKxxVaCQlCs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BPutZVjrlzxb8TxuvKtf1z9k9rpGfFlK8lT2u/pPr92csxGVYzmTCQJoskLiCSIZV39WLf+Nsz7VlZF0+DYSlNapp9Fl7F7Nxc+qPNhTvRG1Lsihesccjl9BH8By6A2VgEIm7bUy7EGp4bg0lYRPGleZZVPD27CJ+UlZlRGDT0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DWmZzSvP; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2f75c6ed397so69935201fa.2;
        Wed, 18 Sep 2024 02:17:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726651047; x=1727255847; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gHVgazaMlap02rbz/N01EBqF3qRxYVTPMKxxVaCQlCs=;
        b=DWmZzSvP9AVx9LwWqFA4myjulDrq3OVcpEqGoxXaZLCmbi7mjkjE3WV9v94jRE0HkX
         wt1Mn3XfZ11+HgXjWbIVI3z0CECnVKu/sgvuXfmjGUrpKjbzJf8N6XtM9co68qqIsmCc
         HTyH0SDG7hF+UdagygEEcgRPrphHNieH0VnXruK0YK7tPiUkI/RsRUJnx0xpAJbOVZ0b
         CGhZpzQOp+RbVV2FGWTG19v6SDmy1q0LwAcx7zAMzMqIZ4yPRjShYxNS8UHoBm0TjIq7
         wBJGp+3E3tJhEuOg+XHPU4JrSWvbHjOmpRQU5RW6LxCtwfcAFn5+OBb+au5GKGYc0lbC
         IZpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726651047; x=1727255847;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gHVgazaMlap02rbz/N01EBqF3qRxYVTPMKxxVaCQlCs=;
        b=aJ5uGINz5YqkD93ufGSSzfkJFVQeieUsDlJU1Ob4awmP8GzvdQvjCju5cKr92nkUKW
         /Qbj8seM1I0g9KHp0T2AvzgcTNPU+GtyVMNucCt28K7ygLYT+Yt9lQiX/5YXdkO1oX/y
         PKwndgCfBk6ZCi2PuF/yJoRyq6nB15n2NqhPn8GtJXLY4TATe3/9zngpwN75TZagJf98
         nwFWS8btP9VO+VKKQ3zx9CuwMFTiPX8+51bh4Zr7oGQDd76FEIdZQIcrJ6EK15IGsegx
         6W7UUcoNLHEG4AIg3IB9MmAL8AMynOtFZ9ddTS2Yohejj+uJbo5mhh1HFdFDPieqvt+z
         TLiw==
X-Forwarded-Encrypted: i=1; AJvYcCWw0q/vuKWhDtvEbfLcemsF4CAPDnfrJeDEc9mz1xILo9lno+fqugYSe4laTp8KImdQoLh+n/f32AW0mkA2@vger.kernel.org, AJvYcCWy+jwQTiuEWomqmXKF6W80Sgzviu00IDVG4pyEWyDeMheXgns6ZrIgFYv7CtgC2OFOytEzNxUVwdqpVA==@vger.kernel.org
X-Gm-Message-State: AOJu0YymEN+o7N4xN0cMTFNSbBpW9YA1LgdNjnako2hflv0T/axx8kdJ
	NeuaFJACjzq7s973oLdWDwb1x9yItL3nyZvs11xBLN0fIUJRqBp9rWnSJN9x
X-Google-Smtp-Source: AGHT+IEaCVMll76ZZk+GatEityraYUqZlAkucugFbDrKNIQyfFFWL1rOr8B9BGZvl7SXtghoH8Ghyg==
X-Received: by 2002:a05:6512:3c97:b0:533:901:e455 with SMTP id 2adb3069b0e04-53678fab595mr12187729e87.2.1726651046808;
        Wed, 18 Sep 2024 02:17:26 -0700 (PDT)
Received: from gmail.com (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5369efc8be8sm251746e87.248.2024.09.18.02.17.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Sep 2024 02:17:25 -0700 (PDT)
Date: Wed, 18 Sep 2024 11:17:21 +0200
From: Marcus Folkesson <marcus.folkesson@gmail.com>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 07/14] HID: vrc2: constify fixed up report descriptor
Message-ID: <ZuqaoRdJuujgLTZL@gmail.com>
References: <20240828-hid-const-fixup-2-v1-0-663b9210eb69@weissschuh.net>
 <20240828-hid-const-fixup-2-v1-7-663b9210eb69@weissschuh.net>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="IYUNy8FbiPaQblw+"
Content-Disposition: inline
In-Reply-To: <20240828-hid-const-fixup-2-v1-7-663b9210eb69@weissschuh.net>


--IYUNy8FbiPaQblw+
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 28, 2024 at 09:33:26AM +0200, Thomas Wei=DFschuh wrote:
> Now that the HID core can handle const report descriptors,
> constify them where possible.
>=20
> Signed-off-by: Thomas Wei=DFschuh <linux@weissschuh.net>
Reviewed-by: Marcus Folkesson <marcus.folkesson@gmail.com>

--IYUNy8FbiPaQblw+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEBVGi6LZstU1kwSxliIBOb1ldUjIFAmbqmpwACgkQiIBOb1ld
UjKCxxAAmevoExDx49kPiEqS9H0/hT+JcrRXv3S/Xgq45MNSST9Y9rhEPzg4auaQ
FLcB5bvT02rLWZa8gDFlti1ZZHFWpGYBsYWhiMD6oyjLyBVVi+oNsLaJqFvUa1LR
Y8aTETFg1CTwVQaeaPo2SAdUVdD4tXYP9fbyqHIIMQam2+WzjANIqWoJmbL9wjNX
BXvZok+PhChDH9DUFsj99L9wJmkgHrMiBrvUhFyl9YBSq22Oo+H33R2pPi3na/Jq
gEA7hFGaBanIyOlPMiJujXH/j9Z8wRzFNxKbeUAA+CHGGt/ro8/gGTt0KLjFA+BS
uCi4BY5jVqKUKfu+G0f9m+YIPxpfRJQuTJKQ/TT9btIuSLuhHZSMHgou9kUtktc0
HdjU9hTj4TfifdO7mf26o7xH8YHOnqP5AzJXagid8xrFkyQxiX+4jvd8qFVRpJ+n
ntcjORvStIg58rjYBCBPFjxpAZtYsidYpsYdvbyFwsZNRwWS9bOZ9MRllCA7FQiJ
4pHrsjRGPjV/APoLf+y6N0anBtlRmbmGUyZPHlEV7lPh5iw9qXlB4iow4jTwhc2L
CfVsN9EBvNOShNXNWIawA1it8t2rcAJY5jdaiJzv7egzgC17KLkYVu3c2FTLKMmP
A6OS33Qk1BXyOl0fhi3rnxM8TUbWBYWegs986JnMdaK7kt5D/4A=
=Mqcl
-----END PGP SIGNATURE-----

--IYUNy8FbiPaQblw+--

