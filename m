Return-Path: <linux-input+bounces-8110-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 91E619CD61A
	for <lists+linux-input@lfdr.de>; Fri, 15 Nov 2024 05:04:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 524E5282AB4
	for <lists+linux-input@lfdr.de>; Fri, 15 Nov 2024 04:04:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3811156F5D;
	Fri, 15 Nov 2024 04:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ad9RttXd"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6221D70825;
	Fri, 15 Nov 2024 04:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731643463; cv=none; b=pccg+g7Wa9Idpd6+uQ+4wGrUvXyNKS/Kh6aEYZan1tsxlD3yZ4dN9YnEYWWaCo2igCDhqITaZZU/5JzWkYNM77pO72KTgvFp82Ik/TtN9qAR+0sYzuhLUL2Sm1LhglkT9Mjt0JFOGWlAAcLE6E8TIU9vB3OtCa4WKR6VKMMbfqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731643463; c=relaxed/simple;
	bh=NizCT+tSnidLGl3lX3u1R9GPfILFYC10IVWM6EiqJzM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ASLzXnh9g5KkNk1mcSDuJJX4bA43p8uNr/3eo5ljCZp704+ssvlpvE1enk8mlBfZR0t9eemEX7eiZg3k8LnkmdtYzu74tLksFN7TvC3+1SSs3pQztiL2Zl1cWMh1fIUJcet+TIyHGNk41lqpCY37M8/7MR9N9pTTNZoKdQocJ3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ad9RttXd; arc=none smtp.client-ip=209.85.167.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-3e606cba08eso732336b6e.0;
        Thu, 14 Nov 2024 20:04:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731643461; x=1732248261; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=emojFDyC5THYctRB8h2dNWU9LntN4EFXJ8X/4es3IsY=;
        b=ad9RttXduwLl7gxSG/BeJKVI4T+vW9E/sncXkqr65DwzSwZ4doQ0O2vICSPjq5S8ox
         kmH/5nLAxNfzl2DtFkRYntyDMr3MY6qXx4R5TvUegFvn3lHgB4Abya17iHXnXZXX+Kxu
         2A9izUSTkrIGvk8Vj2mJKd5nfg00XS74vqgAgWTqUSAmEEHPQsWL0BJRREnAbyuUO4eu
         dIwYqgogxTSSs3q2KXB0xGr2uXmvsbxiEyDakmCE2y5++/7/L3qbsvD0JRmixXvXgW+R
         FiLupRzfFCygz9HwXbV5dxR9WVlUkPoghYiEIrxT4HkNoY0y66DFviKHExf5E42igQWM
         bDZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731643461; x=1732248261;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=emojFDyC5THYctRB8h2dNWU9LntN4EFXJ8X/4es3IsY=;
        b=N0rDxJEUB+WCAVgPeRx3dLajSobEiojcH+VY2uc5jqmpJixkap2x1/FtBPcF1rZ22y
         Avm0Z01lN8ZJKJaiYxr0Ui1losEjSnLLOqNJWQja48b27PRBvxshH1zToAtIwEfFHI26
         yS8WY0RWscrAumI+HaGeA8FNYI6IybMYQTtJFWAWczzwGrLLmOVg6DpBE8isw89Vz0Cf
         54KpAHD851ZDmJ6pn1zUeRUotBQAzNBoJdpZWxpMg2MdaPeQOEGAWrX5tsoY2+fx+WY7
         1fUU4QOmCqpLGCrhrG3cT/sHB0YLKP79bv3Wsykkc6GInOUI0ZOvqtg/PVcbvEeGJRCp
         klBQ==
X-Forwarded-Encrypted: i=1; AJvYcCUqh2/VyB85oOhfA9Q09Zst78EF7Im0dwXy4ZY06tTpQKmKbjRV2ibOYBKMvjFK/fkcRELeyVmJKPyOA1y+@vger.kernel.org, AJvYcCWw6IzetQxzAjY3i+eRh28j49WuWoDDm7jk8phXfUHvLctgTN6Sg6FwpJa83n2ShajbnnlO1L0wAWg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0bVwjY1OEJq5Lmm1AIvvgzmF+DoZlymVpDCQGAN++NSI29VrQ
	3eORw/h73/nf6KtxKMSCvmybri4WrhPLseds4jWkwKhZX0OOJ9RI
X-Google-Smtp-Source: AGHT+IHuBFjOb5Kq/9DaxbneOjXofrfO3qrUevNBS60m3FabPhPkgQzYrXh5l6Dd6Jyq+3fV27DtpQ==
X-Received: by 2002:a05:6870:1d1:b0:278:3de:c8de with SMTP id 586e51a60fabf-2962deabde2mr1107297fac.24.1731643461270;
        Thu, 14 Nov 2024 20:04:21 -0800 (PST)
Received: from archie.me ([103.124.138.80])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7f8c1dade0esm399915a12.66.2024.11.14.20.04.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Nov 2024 20:04:19 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id E5F9644D87F4; Fri, 15 Nov 2024 11:04:15 +0700 (WIB)
Date: Fri, 15 Nov 2024 11:04:15 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Even Xu <even.xu@intel.com>, jikos@kernel.org, bentiss@kernel.org,
	corbet@lwn.net, aaron.ma@canonical.com
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, Sun Xinpeng <xinpeng.sun@intel.com>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: Re: [PATCH v2 01/22] HID: THC: Add documentation
Message-ID: <ZzbIP7tOEns0Fy-U@archie.me>
References: <20241114053416.4085715-1-even.xu@intel.com>
 <20241114053416.4085715-2-even.xu@intel.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="piiGGXBvEqKZuoLP"
Content-Disposition: inline
In-Reply-To: <20241114053416.4085715-2-even.xu@intel.com>


--piiGGXBvEqKZuoLP
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 14, 2024 at 01:33:55PM +0800, Even Xu wrote:
> +Touch Host Controller is the name of the IP block in PCH that interface =
with Touch Devices (ex:
> +touchscreen, touchpad etc.). It is comprised of 3 key functional blocks:
> +- A natively half-duplex Quad I/O capable SPI master
> +- Low latency I2C interface to support HIDI2C compliant devices
> +- A HW sequencer with RW DMA capability to system memory

I see in my htmldocs output that the list above is long running paragraph
instead.

> +When THC is configured to SPI mode, opcodes are used for determining the=
 read/write IO mode.
> +There are some OPCode examples for SPI IO mode::
> +
> + +--------+---------------------------------+
> + | opcode |  Corresponding SPI command      |
> + +=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+
> + |  0x0B  | Read Single I/O                 |
> + +--------+---------------------------------+
> + |  0x02  | Write Single I/O                |
> + +--------+---------------------------------+
> + |  0xBB  | Read Dual I/O                   |
> + +--------+---------------------------------+
> + |  0xB2  | Write Dual I/O                  |
> + +--------+---------------------------------+
> + |  0xEB  | Read Quad I/O                   |
> + +--------+---------------------------------+
> + |  0xE2  | Write Quad I/O                  |
> + +--------+---------------------------------+
> +
> <snipped>...
> +When THC is working in I2C mode, opcodes are used to tell THC what's the=
 next PIO type:
> +I2C SubIP APB register read, I2C SubIP APB register write, I2C touch IC =
device read,
> +I2C touch IC device write, I2C touch IC device write followed by read.
> +
> +Here are the THC pre-defined opcodes for I2C mode::
> +
> + +--------+-------------------------------------------+----------+
> + | opcode |       Corresponding I2C command           | Address  |
> + +=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+
> + |  0x12  | Read I2C SubIP APB internal registers     | 0h - FFh |
> + +--------+-------------------------------------------+----------+
> + |  0x13  | Write I2C SubIP APB internal registers    | 0h - FFh |
> + +--------+-------------------------------------------+----------+
> + |  0x14  | Read external Touch IC through I2C bus    | N/A      |
> + +--------+-------------------------------------------+----------+
> + |  0x18  | Write external Touch IC through I2C bus   | N/A      |
> + +--------+-------------------------------------------+----------+
> + |  0x1C  | Write then read external Touch IC through | N/A      |
> + |        | I2C bus                                   |          |
> + +--------+-------------------------------------------+----------+
> +
> <snipped>...
> +Intel THC uses PRD entry descriptor for every PRD entry. Every PRD entry=
 descriptor occupies
> +128 bits memories::
> +
> + +-------------------+---------+----------------------------------------=
--------+
> + | struct field      | bit(s)  | description                            =
        |
> + +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=
=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D+
> + | dest_addr         | 53..0   | destination memory address, as every en=
try     |
> + |                   |         | is 4KB, ignore lowest 10 bits of addres=
s.      |
> + +-------------------+---------+----------------------------------------=
--------+
> + | reserved1         | 54..62  | reserved                               =
        |
> + +-------------------+---------+----------------------------------------=
--------+
> + | int_on_completion | 63      | completion interrupt enable bit, if thi=
s bit   |
> + |                   |         | set it means THC will trigger a complet=
ion     |
> + |                   |         | interrupt. This bit is set by SW driver=
=2E       |
> + +-------------------+---------+----------------------------------------=
--------+
> + | len               | 87..64  | how many bytes of data in this entry.  =
        |
> + +-------------------+---------+----------------------------------------=
--------+
> + | end_of_prd        | 88      | end of PRD table bit, if this bit is se=
t,      |
> + |                   |         | it means this entry is last entry in th=
is PRD  |
> + |                   |         | table. This bit is set by SW driver.   =
        |
> + +-------------------+---------+----------------------------------------=
--------+
> + | hw_status         | 90..89  | HW status bits                         =
        |
> + +-------------------+---------+----------------------------------------=
--------+
> + | reserved2         | 127..91 | reserved                               =
        |
> + +-------------------+---------+----------------------------------------=
--------+

Shouldn't these tables be formatted as tables?

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--piiGGXBvEqKZuoLP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZzbIOgAKCRD2uYlJVVFO
oz6LAP99VEDsehlAPR+X9zgwEkcCE1Mko2zX3n4bSOBlpayWiAEA/hRSe5+cRDaQ
lkGYtBq5mXgsRyz54qqxWBPELSNZNA0=
=thPG
-----END PGP SIGNATURE-----

--piiGGXBvEqKZuoLP--

