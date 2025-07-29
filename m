Return-Path: <linux-input+bounces-13719-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D0A5AB15406
	for <lists+linux-input@lfdr.de>; Tue, 29 Jul 2025 22:04:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 07B3E1895E37
	for <lists+linux-input@lfdr.de>; Tue, 29 Jul 2025 20:04:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CD412BD593;
	Tue, 29 Jul 2025 20:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="UNL0t0xV"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0633223B609
	for <linux-input@vger.kernel.org>; Tue, 29 Jul 2025 20:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753819454; cv=none; b=g29F2IZjsNvwOlqneuaFP0CF3H1iE85ifC5UrK1V5ru3b/xmccKbJIHJnxmkCb0sCs02JfJq9/Ze34+2twbVStGKYEeSGJ9ikQuJYgrF2shayKxOBBL4nJccPSLTRCEcuQaqApvmMBRQz8AhnUzQ9ZfvGGqmw3AgKQvBn0/VIBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753819454; c=relaxed/simple;
	bh=Px97wPxTu8TTFrvsPx3v5fMjBTQ0RgtFcRdMPAHY4H8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aT/3f6t6NPZOtuHIEDo6ZQRixF5384ThrxundOLn4GueqC3lwreZNsw9CTZcSDlbFVVf6i6+MmkUNL3H/qcGPJPogu5Qxb+M5veO7YcwO/MvxTj6JFVum+RZz7LtvTV7X3Spch5mGzKzj0fPc2c50K2oBw8A/d+Isba5ClXz17Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=UNL0t0xV; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ae0d758c3a2so39381866b.2
        for <linux-input@vger.kernel.org>; Tue, 29 Jul 2025 13:04:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1753819450; x=1754424250; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Px97wPxTu8TTFrvsPx3v5fMjBTQ0RgtFcRdMPAHY4H8=;
        b=UNL0t0xVo8O+6jTHOeXkGvEQY2LkGZ3X2PXMAl9ClUevJyQE3pIYpq83QSTu3Y7IhM
         iSJGXpPlTXgXvzg8zS1koYVY/F2pnf2PMTWDYpoGXvRbxuIg603IrR4vZLew9FuVzYk9
         fFcAbpDYuK1dcpSov9LJEqe8DqUW1TXwiHFZ8kP78dF5VjttMyM4sdHhxfMeyAzFi8zA
         pXVhv282Yrc2+JnPIRAXhMdB0Q+sjOXOWPxNp9ALssbYzTtlkbw7L6QyEFI751rQFPs6
         eF0f5ebJj+LaJCftqMotuzRSm8ZQmZdzuQ+UUICdlVYyEnX2oyku42a9S1lI6AWsx/7b
         UMgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753819450; x=1754424250;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Px97wPxTu8TTFrvsPx3v5fMjBTQ0RgtFcRdMPAHY4H8=;
        b=Y47zwsxRuLzPsDdbosDg96nLoyxBi5qx5CsLUw+5xvxeLACifE/pjycJp/xZntP/Qp
         uoaQTBPP35W1+J6h3OG6E1xqTfJ0zT5payxXPiBf9gKphY/cWd+4S1FWuKmkPL4Tl8Qk
         pVchMMXycL4fZYlqEBI7ZoREduF3vPvU9ZResvTqQ7VY4T4g2gy1MHToeUVP76WiW1RS
         YnPiOm8iju1dhQdi3d3MJ+h+YVAaZxC0CUii5yEvnm3yru2d+ncqK2S+NXt38d8FY/OF
         9JozFwfAes7btUGdV8p2EJHVZmsOXLGjuJedmY8GYZBKYOeF4t9hIt5Czp1JDDP7lW6E
         VBRQ==
X-Forwarded-Encrypted: i=1; AJvYcCX9u/aOYX7B36rQnl3CPwu2D8oWVBZqTPGSNiWSPulvMu9me8aFTs204Rvt8f4TYlADn+hOIbOsp7kFrQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyEjeJHQ4yAk3Ftc4T6KMFtL14YrWFGT/SFK/bjAK/+QK+SfTC5
	E4YKXY2EPi8FOMlIqQTe5ufqN/07uVa8zRqEYC2ceyyTA7wYvRXZoEA9WtD15UgyMiw=
X-Gm-Gg: ASbGncsizSMC+3J30M5PuJAVabcwx2qmjcp3MhrF0aYsAK0MFObFZv+gmEFJgMTAxBC
	Ydq4IcdPqPh2crwTUb1c/SXhR1X70q5fOGF2IR9ybolIQjz3Me/B82uB8dyfH4JwS4KP4bWma2d
	HPUzHMJ+NsAeMx5hQzZTw0uQlLOrTnwfAI0sa6HFfQngyGVEtQ2wilXF4qcgGLZ9+Chz+8wClbU
	ItdO+RKQ7sOA5lVdhLA1ErTUjCc6orJdnlMF39oQVoj0L2uD/XaHnCoqkPGqMMvoOUK9lQl02jm
	tVkpi5F+hqEyEmY2YYyk0yA/JBS4a3V+VX5cFbRHlDDPkKj2NUnpkPOOvBXGY8WmO03AHc/y+aQ
	gL30UnY7G1WqjMNF7QcAa8fQovlM=
X-Google-Smtp-Source: AGHT+IENQvs+0U5vqUoQpnY0KkSLlrYc/TnnmUIdXj2DvX1PZidY6PjcOa3a5INUn2CCkasGs1pvxg==
X-Received: by 2002:a17:907:971e:b0:ae0:c690:1bed with SMTP id a640c23a62f3a-af8fda734c1mr88553766b.51.1753819450074;
        Tue, 29 Jul 2025 13:04:10 -0700 (PDT)
Received: from localhost ([2a02:8071:b783:6940:36f3:9aff:fec2:7e46])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-af6358a1c3dsm635048566b.46.2025.07.29.13.04.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Jul 2025 13:04:09 -0700 (PDT)
Date: Tue, 29 Jul 2025 22:04:06 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Dzmitry Sankouski <dsankouski@gmail.com>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	linux-input@vger.kernel.org, linux-pwm@vger.kernel.org
Subject: Re: [PATCH] Input: max77693 - Convert to atomic pwm operation
Message-ID: <zxeva5asxre7oc6vakfoyiehegt5c4i7qwaeue5woxk4xir3di@thcg7lyadvn3>
References: <20250630103851.2069952-2-u.kleine-koenig@baylibre.com>
 <w3tkxxkqr2kmri3bz5m34dzw3hfvkqou3zbww7kwjdg72o7kla@ty777ynf26qr>
 <23ddfd32qebfzb4qftxih3mwpymghlezdv5u63qhxhqthpbxpz@u7f4tbihsfop>
 <yafw6oi62ckqgz7ur4idua2r2sjyxnfomc7h2v5w6tthqwu334@5i6tdfumtj5b>
 <sl3jqe36dfxfzblposdtkvlgalc4ydixpqkfmn7gc6hcjfwmqn@7bex3mxwjqyy>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xaegvnhtr3gbsrtw"
Content-Disposition: inline
In-Reply-To: <sl3jqe36dfxfzblposdtkvlgalc4ydixpqkfmn7gc6hcjfwmqn@7bex3mxwjqyy>


--xaegvnhtr3gbsrtw
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] Input: max77693 - Convert to atomic pwm operation
MIME-Version: 1.0

Hello Dmitry,

On Wed, Jul 02, 2025 at 08:02:33AM +0200, Uwe Kleine-K=F6nig wrote:
> On Tue, Jul 01, 2025 at 11:06:50AM -0700, Dmitry Torokhov wrote:
> > On Tue, Jul 01, 2025 at 07:49:22AM +0200, Uwe Kleine-K=F6nig wrote:
> > >=20
> > > I had something like that at first, but didn't like it. With that
> > > approach you have two places that have to know how to set the PWM's
> > > duty_cycle. Also I think the control flow is more complicated.
> > >=20
> > > I considered renaming max77693_haptic_enable() to something that bett=
er
> > > matches what it does in my variant, but max77693_haptic_configure() w=
as
> > > already taken.
> > >=20
> > > But that might all be subjective? If you like your version better,
> > > that's fine, it still gets rid of pwm_config(), pwm_enable() and
> > > pwm_apply_args() which is my main objective.
> >=20
> > Yes, I agree that it is subjective. I know that you do not quite like
> > the version I posted, still will you be OK if it is attributed to you?
>=20
> Yes, feel free to apply it as you suggested.

As of today's next that didn't happen. Do you have this patch still on
your radar?

This is the last driver making use of pwm_config(), it would be great to
get rid of that.

Best regards
Uwe

--xaegvnhtr3gbsrtw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmiJKSoACgkQj4D7WH0S
/k7o8wf+OpPJZJR/FU4WqR//ABlPQ8A2g7WyYL4P+wxg0QtXJ45kh8NZyvf13WJk
aIoP0Tlz7w3R450a+zyv2/cJglrEeOiZmQjC6x2r0tF8VYXnlks4SXNuwL4w9vHN
dNsGYR985u+SMYHwEF2ogWCcV8vwstqv8WAwScUndML7xDVrYcWRK7df1DZEW2wW
5p1MNm0z5VzBb/UPb+k0zpZT7VvQRitY4ZYSfJAjL1Dk0XFQNQ5Wn8j0ZMRXi5d9
XG+P7TmnPIhQlnlDiSSyIoL0jFQQ9603PddJVzV/yNVxZZ6mu4f9k3dFvf+m9Okq
L1+a6rk+t5sEdy2HOpAZdzw3MOMHVg==
=b7k8
-----END PGP SIGNATURE-----

--xaegvnhtr3gbsrtw--

