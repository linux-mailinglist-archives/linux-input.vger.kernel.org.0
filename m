Return-Path: <linux-input+bounces-12567-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ECCFAC3805
	for <lists+linux-input@lfdr.de>; Mon, 26 May 2025 04:34:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2C78F1893400
	for <lists+linux-input@lfdr.de>; Mon, 26 May 2025 02:35:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E48531714AE;
	Mon, 26 May 2025 02:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ew+fm/hh"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DC1335979;
	Mon, 26 May 2025 02:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748226891; cv=none; b=XzTSZzIF57GIyjl6BG6+rylCzaGBazdc2VK6UiSXw6cDl3Re/7PATovSEaJ5cMOeMltGk7MFsuVrRG4zuU4MERpTazFx4MqqqtRCUnRFlPFtsFMBvV93C5/ciIoVF3I2gZt5nyGnfhXvXeGGAuvZNWQ55qAvvLOhgyKxd81urkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748226891; c=relaxed/simple;
	bh=BrsL6bLwBpPFSCG8U6SgP3NVr0sJJLRt3AVJmRMalIs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K9/Ietlm6WLdSSg41Qhl5lTisgPGNw0uzNVUaRh9ltgSsgAh9czqsXZS/YGA0GC4xK2+pLlpuoVmmXfxnGVphMfjW+Vnpfdu7YQsbbNcvbiceZRLMIdYAsnrr6A3oKzD1qsJdo4KkpI4yjsqLRUvU/6wfCCM8dqEPVvEUnylg78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ew+fm/hh; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-306b6ae4fb2so1302074a91.3;
        Sun, 25 May 2025 19:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748226889; x=1748831689; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WNdOJh+NnMF/Str+UwFKXBafijjedPkZ85jMh2ARzic=;
        b=Ew+fm/hh/mg5+gKRmiqOU4tXdaiC/LzmsyCZRLGIqpugs0+rgfb10EngvdifcyURCD
         zec/il3tzCim6mcggQ8tPzCwJq6Yjw8BhiA2qk5XZinsDkU1IjU+HxHtWPyqiu4MAT+d
         SaSJqgLoa0zr2IVxdnoQqOCQudF5BrBqS30i9PWgPmJchIXYLszVOMQxtghF8GBr9Vpa
         Y0LDRjaAMp7/JJMiXHbml+9gV6Fi52NiOYiBHtfaf7uXoAR5fYMW+wwxSL6rEyAlXX73
         17ot2pBlCgGFzFxyVDNnMt9A2BD+H94Gt4znT6kTrDC74SB/FMv32iyItX9TfUUzAWP6
         VUfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748226889; x=1748831689;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WNdOJh+NnMF/Str+UwFKXBafijjedPkZ85jMh2ARzic=;
        b=aOGsVR8Jq3oIVvn7CSfgjAfDpJwy/nBNML4WoD2gUTZnA+UL6kBnvXzSgDeny3O6ap
         8ExWhdAEndwxeYY3xmte7DdYDNiozU9/aZMb2gVV/fmYM9KVX9FA+j1MmHyExZej7h29
         Tnr+CUkaqedbszjqibhh7tVU3D4UGPF0T0YIm61xccUgEAw+ExDHV0iZNc8U05nTvc7s
         dAm2lDngDlnPymZCuJS+GezdAlkZkbvvnLBEgCLTicFg7LXM/1jwCAOg6zLg7alcPf6f
         isRGfR2jpkRS95N7M0TKopf1OzjH/uk5wwm+Pn+8rYgme+PPEjL1WTecF5LblTQ/orjm
         8dGw==
X-Forwarded-Encrypted: i=1; AJvYcCVAMMEC6YCrpQrzzB3eRQPjzsY6uxGk382tnkMnC8lG/nvi23tHTsEHYzYe8j6y0Ug2oiOqC13ZFcIiupdg@vger.kernel.org, AJvYcCVv8+TS0dAY71HVsDqMGM6VCHNwjPTPhDZD0m1Pa+YmMKG4/bRhVEEZqi1zEmBSGinuYYVJzfeShUk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxi53ngsg9KO5EWShxS+WMYdwbqXZHwsPGDu0txxFHTUVxps3I2
	Axxhd+RSNiK4dOYTnS10xgl/tF5hhKQYIR5KUjQ3wU7JW5kkmDA8hg/e
X-Gm-Gg: ASbGncvPmW7WIcQULCTQAYhCeoN8vMBsh3fxqKxjPHNkzFd82vrr0VnebO1X9TlWeT/
	TYBVfVJ/GK8Jj2yrcTodT1E9gAIxJL9YhluuAzUa3W+hr4LihI8oNd0wlEOg1zQI/MtbH2vKDbD
	D9uTofMHxsV1ckHEn7CULqGbOGRma5CqnrHFGpRAgwrvBnRz73roNqXQQL9uUXs4LfkQ11St4rN
	KxHfT1aJPn7dCuF83TVkuQFSdngNYnHbV/TQV3N03hdTglzfFRf9Soo03EvQW5z7jtI/7/7iREF
	BGSJLhWWAnXGEDThu0MPAsH3BbGY/MIQG6oMkxgZP4kRRUY1F75tcC2S5HG9/g==
X-Google-Smtp-Source: AGHT+IHEQfVO4jOQL3Of/QYcqiFqVxdgSNZqlpR3S0pBQS+f1Nln9HrB4Or+CN1VaN22zOC7F3nnsg==
X-Received: by 2002:a17:90b:55c3:b0:2ee:94d1:7a89 with SMTP id 98e67ed59e1d1-3110f0ee05cmr11603312a91.1.1748226889213;
        Sun, 25 May 2025 19:34:49 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30f365e59b3sm11123443a91.33.2025.05.25.19.34.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 May 2025 19:34:48 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id E3FD74230C03; Mon, 26 May 2025 09:34:44 +0700 (WIB)
Date: Mon, 26 May 2025 09:34:44 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: George Anthony Vernon <contact@gvernon.com>, dmitry.torokhov@gmail.com,
	corbet@lwn.net, skhan@kernel.org
Cc: linux-input@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH 1/3] input: docs: Fix broken table formatting
Message-ID: <aDPTRGHNx2P-_wXj@archie.me>
References: <20250526011443.136804-1-contact@gvernon.com>
 <20250526011443.136804-2-contact@gvernon.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="NdA65ZAYfdmxNg3d"
Content-Disposition: inline
In-Reply-To: <20250526011443.136804-2-contact@gvernon.com>


--NdA65ZAYfdmxNg3d
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 26, 2025 at 02:14:41AM +0100, George Anthony Vernon wrote:
> diff --git a/Documentation/input/devices/amijoy.rst b/Documentation/input=
/devices/amijoy.rst
> index 8df7b11cd98d..f854ee975247 100644
> --- a/Documentation/input/devices/amijoy.rst
> +++ b/Documentation/input/devices/amijoy.rst
> @@ -123,7 +123,7 @@ JOY1DAT   Y7  Y6  Y5  Y4  Y3  Y2  Y1  Y0     X7  X6  =
X5  X4  X3  X2  X1  X0
>          clocked by 2 of the signals input from the mouse serial
>          stream. Starting with first bit received:
> =20
> -         +-------------------+-----------------------------------------+
> +         +--------+----------+-----------------------------------------+
>           | Serial | Bit Name | Description                             |
>           +=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+
>           |   0    | M0H      | JOY0DAT Horizontal Clock                |

Fix is verified in htmldocs output, thanks!

Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>

--=20
An old man doll... just what I always wanted! - Clara

--NdA65ZAYfdmxNg3d
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaDPTQAAKCRD2uYlJVVFO
o2UyAP4uQBKtj4I45lSGFA3/M03jhbOnbCEU1RWANqhj+EXxuQEAwMBEdTeIbwPZ
ed6fGLQmf/Gd9hfT6HKiFbyTPd3wvw8=
=5jsN
-----END PGP SIGNATURE-----

--NdA65ZAYfdmxNg3d--

