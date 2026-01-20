Return-Path: <linux-input+bounces-17198-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A1079D3BC43
	for <lists+linux-input@lfdr.de>; Tue, 20 Jan 2026 01:04:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9ACAC3029C03
	for <lists+linux-input@lfdr.de>; Tue, 20 Jan 2026 00:04:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65DF915E97;
	Tue, 20 Jan 2026 00:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SEg4VYDr"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com [209.85.210.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29115E571
	for <linux-input@vger.kernel.org>; Tue, 20 Jan 2026 00:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768867470; cv=none; b=hKmonWk67EMfT2gIpP83TYR+RH2a1eNNlEOzomnBjEQrXAxminK/miP1qeNiQ5xkOQuXr0q4kQS72eOYBcUch+l+1EpPftUkk96YjEYwhFp3hWU+x5RuiwwfeFMZGjwnP2w/cdHi5r1T0OB4T52gRDkdt3C7X0aeSb+cAp5v0Jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768867470; c=relaxed/simple;
	bh=cuKZQcuapQnBZVta8YkwFU3o1xEnR1bsXItHBrnjVWw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cev6iQ4kWZG71YC/w5aIKuwpXjBPk6hCz8RTq18/eg56Ui4PafUfqRbmOFBLicPIlwBD0Vc+sRxdwU/keorfJfarvzgm2FFn/EzotTiZ46vQ/uAehr0WrYozWUKQ0OnCRnudLbh8+wuFT4cu1QPHFi8+GYXjDjmVdRvpnc2eB2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SEg4VYDr; arc=none smtp.client-ip=209.85.210.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f195.google.com with SMTP id d2e1a72fcca58-81f223c70d8so4007449b3a.1
        for <linux-input@vger.kernel.org>; Mon, 19 Jan 2026 16:04:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768867468; x=1769472268; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+Wubt2tqx7SxUgLn+ubS/XLWpKCP8r4Dm/ia5St2vgU=;
        b=SEg4VYDrKSJMyCmnOgFvsvmX7r5FsaMfTkaTXsQhLVFPGANJFzPlb3zvAENOtSJ/JM
         zHqgi6sw+bHTRgjCynmW+ZffykQT8r+kBNvYY4wEaCZaD5w5aWYklnaVv/0XzZ09KWwF
         N1V9+AP9hU9QoXh/64pykGR2wP2+P+vgsIOKicfx7nNeLQ/yJXdsPNTaj9eMnBwtIAWL
         lPhX+wlpFgBnk9eJPRIpQEuGF1s37YoNk3UJGu2RidIBVJe1lCDDgoYBcot1Ty9dUmEr
         eWeFDBcgfxPaqCu6QtAWuDRALiUgaTx5PfoJRrPUW2wEfrD6POqDszQGi9QA7SHSBgao
         v5qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768867468; x=1769472268;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+Wubt2tqx7SxUgLn+ubS/XLWpKCP8r4Dm/ia5St2vgU=;
        b=tVn3VxgfvJOLYcceLYeYd+PoVhEKSfyHN22mPhsR17jkgW2O8Krx61ihQ9ti3T3I1P
         9SepYkfRlkDKnpdGWhiLKCjcL15ri2AJeE9dQ+BNkl7ASL4wZV0A0rD7sywx+aY3gbYH
         u+/9DsoDyi+Nw3l2dr38rNWR2pcWMJ6g2IA2kPLUVs1rMlVR2cDqFLM6xyMHEXJ/yZkp
         TSXTfOzKmKUzQzj7KhGxC7IcQkhlgy275WRZJyAcNLva601wc9uRusyNjzXsvKIl1q0x
         RsgGBxR9Rpn1JLVmiayv4umfS3G1LBVouoFhgfVdA9TBLyUg9tQYgtQtnkAXKR48cGXp
         TDpw==
X-Forwarded-Encrypted: i=1; AJvYcCWbcdJCvFj40ydLkqjndpTumRNAyEhLCGVlJggDtfwiuJPz/WgadjwTg7t2F2K4xnIcNnJkJgIxK6iW0w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzjg01OLNXVDusPI3YdCOE2bB9b/JkbZdpMFMgw8yOsUY2wUb9h
	3jXnxLHR3ljAxphlprN1wi3vcuXKxR13bt7my+EfPEnAaCsQW9Xa8sKLjZyJ/C/Zecw=
X-Gm-Gg: AY/fxX5J9QUejjVw0JYip3q4H7Ohi86GKjSMQwsDBvgFilnMv1WEoRgp2VdCoXzfurh
	2k+BRDjtE4ljit4RpjsEg+wP6xx2N42DO6DK9u0WlbT+ixmIoycpxcYCiFzy4Adqv3CmrpAaaYf
	n/bXOr1qvKEVFffuU0U8FH/jlqSviyPJACW8t38PqEjXBDPt9+T5wxmYdWZb2s8HuyWBVdmdI8h
	0h2GKY6cdV1KO9g7Q9oyawvaJ+pHvj6G2Cn0jsq45Y0F3jYbJT6Wys8nUkNniIHb0RFT7bRSO4+
	tKtDfrrNtkTcXbhRK9Txo2AxoTIoIVjKo5E3tKoEeY1lM+wAKIUHg9cLWfk0U6YuaRIxOulNGle
	VK7GAsTUd6F+0q/RU2HudvuWlPOqXRYIU9glYCKbOnklReQ7yRoRmzcPtSo/6Sdz5tucKMmAMi+
	DXHt4BZj0=
X-Received: by 2002:a05:6a21:6b05:b0:384:f573:42bf with SMTP id adf61e73a8af0-38e00d9682fmr11086386637.53.1768867468314;
        Mon, 19 Jan 2026 16:04:28 -0800 (PST)
Received: from archie.me ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3527313c2a9sm10227886a91.17.2026.01.19.16.04.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 16:04:26 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id E9AC3422053E; Tue, 20 Jan 2026 07:04:23 +0700 (WIB)
Date: Tue, 20 Jan 2026 07:04:23 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Vishnu Sankar <vishnuocv@gmail.com>, dmitry.torokhov@gmail.com,
	hmh@hmh.eng.br, hansg@kernel.org, ilpo.jarvinen@linux.intel.com,
	corbet@lwn.net, derekjohn.clark@gmail.com
Cc: mpearson-lenovo@squebb.ca, linux-doc@vger.kernel.org,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	ibm-acpi-devel@lists.sourceforge.net,
	platform-driver-x86@vger.kernel.org, vsankar@lenovo.com
Subject: Re: [PATCH v5 3/3] Documentation: thinkpad-acpi - Document
 doubletap_enable attribute
Message-ID: <aW7Gh6WsTjVo5IO_@archie.me>
References: <20251226235101.106451-1-vishnuocv@gmail.com>
 <20251226235101.106451-4-vishnuocv@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cXr86z952AoRnBdA"
Content-Disposition: inline
In-Reply-To: <20251226235101.106451-4-vishnuocv@gmail.com>


--cXr86z952AoRnBdA
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 27, 2025 at 08:51:01AM +0900, Vishnu Sankar wrote:
> +Values:
> +	* 1 - doubletap events are processed (default)
> +	* 0 - doubletap events are filtered out (ignored)

Please separate the bullet list from "Values:" paragraph.

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--cXr86z952AoRnBdA
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaW7GgwAKCRD2uYlJVVFO
o5IaAP94b7MmrmseMySClfVwqN2J5VwmAmCppeUJ/3BURZkyIAD9FBUs2/yUHoyX
mdvAzlxMyN4BFBzd/S6jJXcMr4fBwww=
=2Yar
-----END PGP SIGNATURE-----

--cXr86z952AoRnBdA--

