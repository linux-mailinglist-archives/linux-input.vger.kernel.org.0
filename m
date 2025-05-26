Return-Path: <linux-input+bounces-12568-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 843A6AC3815
	for <lists+linux-input@lfdr.de>; Mon, 26 May 2025 04:43:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 532311701E1
	for <lists+linux-input@lfdr.de>; Mon, 26 May 2025 02:43:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7584917B425;
	Mon, 26 May 2025 02:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dh19+23q"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03BC85661;
	Mon, 26 May 2025 02:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748227391; cv=none; b=a2EhKUA4HXzzG9KUv2VKpz6tg2K0q9KDaTZW+zJNh5AyncROjJ+/q5l+Ae2rNemx1Ju5GM4sQossCcS+DxrC4Ti/p0fx4gcecqKcuQTrQ4QjWc2diDFyWCKLoIPa8KEn4uVD4LWO7LkDiHrkrHIrH3YW5YgZOx/RoBNxe9ySdNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748227391; c=relaxed/simple;
	bh=IC9uFzW1GraEckz1npeV7R+FHBO0O1DM7iSkV0imFfc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QN4PfK2jV9c+ZvQ8PKPvPvHUCqJkkzWcRz44VE0NL9LW2ZE80ZMOXi8kS4C2wPtuD3EfQP9FVxO11BnsK4nOqp+nZlhTVZBCPdHtgI+pPBILGavhgP0yPBWstPXYtnlG90cVn6uzE1IiXXMTBzJ/WwduAag9JiloV5Sl0IdNI6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dh19+23q; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-234477e3765so5149585ad.2;
        Sun, 25 May 2025 19:43:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748227389; x=1748832189; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IC9uFzW1GraEckz1npeV7R+FHBO0O1DM7iSkV0imFfc=;
        b=Dh19+23qNUoMSBaD1mpB/nbOpaj1bqSApAw9/h+OCQ+Sns9IMhXpo46U+aU0hc9Adc
         ZCZ+CynrPdBQ1OdQgMbNDz2HuOYeetlgB+1dltKaaOrLMuncSdaXj6Tl9iL0N9XQz15t
         m+X6giph7dVHB0hk63FYCGwEnwxmJjVBORMOmWASBdqqKXAYd2EazSpftZkNNIz2PtIq
         Yp6kLcyOyQCaCOusXIIZV18pge7if2brsQ5REMgdwnSUWt9KE9VlRzxS1mt8sJ9+g2hJ
         8pZkVyqgOjyGV7btgK/XVX2yLZhUfIE7OEcGbdDPEvVmE/4ctF67rnVdpy3StapycA1V
         2PdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748227389; x=1748832189;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IC9uFzW1GraEckz1npeV7R+FHBO0O1DM7iSkV0imFfc=;
        b=HBKKzSpdZe8X8MdR6TxNhlQ9+GkD9/whKIltycm6cuM6mtLgyXI/FIoR7OtRB6IHOI
         AVx7LNemF9Ws0QPOeTvR5zOlJN3KvZP0LWtfn5YY0qiMi6Be+IlOAkHD95PHvAt8Sam6
         qvOtNm/KhKX4VLmHf8qo8JmoQccfXW3QWqXzUktHmgxfHY2qv7iufbsYEbihWBEfMebO
         jxkpfNCneAwsGFAzEqe7hx5PunZ2ipBTmHNIvw/zqQ4qF4LQbOiD1Cejd/HsaDNHHZ5P
         HGUw1CfNWStrf0F6CzEM6Y9EcW8v6K0Vwlfe5R/UbPb/BUJ711ep7C2qYnCrYViw9Rs6
         5rrA==
X-Forwarded-Encrypted: i=1; AJvYcCV7Nm7A9IhwN78ba+IlaZCdo2hgib0o1PIbZY54Z12LXJdCnemH41tFybSZ2mxHfAXQ018nFxVxxiI=@vger.kernel.org, AJvYcCXfUnx+d2YUhQnkGHIGaGrh4DVgPZN+WWhvZFe5+3RbnDAE/dCz0gCKmgSkvVbMO9zhOk1ubTjHWzCJw6gR@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+sKz3TnSIttnFNo1ZpBJsThbQVGOpj6kdYWFCdF36T7ToAwyC
	H/trN0Mim1dZKWawkrEUJhSCCnVSNQGlac3n22wXX5hc/GbiMeqUbSA0kSavUA==
X-Gm-Gg: ASbGnctuiI4PMmoOLb9wVICKbctk3ns0Nh+QW0luJT/a57LX4yweKI7NIdJhICkxcs+
	YxT+pbpSdf0XUv8NfrEGyo3jXipbj0VHw2JZHSTuE0Gw8giXWC2JfYqjtRUvhBF7K+RqkBHBTAl
	yJ4kjtZA+kE51xiaRczixGF60/oRAzaCc7uxUz5HL8WeJLmCWT8idbOArRKHncN5LO4CPFft+al
	L4ivJzRDeHqTWlK+PnSqjoqFojYD3UQrVEk7dGWeWp2lbG9+cc6N2Xxa2stg+9gJKtR+aeOBlqJ
	fEZ+X5y/iq/x6AfI9JgyO2KgrnQKRUGnQwtcl0SsG2RzbfeO1S4=
X-Google-Smtp-Source: AGHT+IE6IcDKP2eGy0o5YUOcd7vy0oot3F0p/IA9NKNpgNt6Jgt8tKvcQqxG3tD4qVmt2iBDGkOm/g==
X-Received: by 2002:a17:902:cf42:b0:234:1163:ff99 with SMTP id d9443c01a7336-23414fd5dafmr132980195ad.43.1748227389024;
        Sun, 25 May 2025 19:43:09 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23430aefd6csm21797535ad.82.2025.05.25.19.43.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 May 2025 19:43:08 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 7C89B4209E8A; Mon, 26 May 2025 09:43:06 +0700 (WIB)
Date: Mon, 26 May 2025 09:43:06 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: George Anthony Vernon <contact@gvernon.com>, dmitry.torokhov@gmail.com,
	corbet@lwn.net, skhan@kernel.org
Cc: linux-input@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH 3/3] input: docs: Fix Amiga joysticks grammar & formatting
Message-ID: <aDPVOlBIpnqc7Tez@archie.me>
References: <20250526011443.136804-1-contact@gvernon.com>
 <20250526011443.136804-4-contact@gvernon.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="KntiioOK2g5D1YkR"
Content-Disposition: inline
In-Reply-To: <20250526011443.136804-4-contact@gvernon.com>


--KntiioOK2g5D1YkR
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 26, 2025 at 02:14:43AM +0100, George Anthony Vernon wrote:
> Make small grammar fixes to Amiga joystick documentation.
>=20
> Also make heading adornments compliant with the guidelines to improve
> organisation of the page.

Split up these two changes into separate patches.

> -~~~~~~~~~~~~~~~~~~~~~~~~~
> -Amiga joystick extensions
> -~~~~~~~~~~~~~~~~~~~~~~~~~
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +Amiga joysticks
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

I would prefer to keep section adornments in this doc as-is, though.

> +Register addresses
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +JOY0DAT/JOY1DAT
> +---------------

But adding sections for register addresses looks OK.

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--KntiioOK2g5D1YkR
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaDPVOgAKCRD2uYlJVVFO
o4yOAQCqnQ8RdNDxbTGXB7K4fMlodV6JHiDTp29uYq1k1Vg9PQD/U6L1ZPND0gt/
ysOPMZ9UazUaRvV6Ybqo2lFne86ZBQo=
=CFhb
-----END PGP SIGNATURE-----

--KntiioOK2g5D1YkR--

