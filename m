Return-Path: <linux-input+bounces-8114-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D5A39CDD96
	for <lists+linux-input@lfdr.de>; Fri, 15 Nov 2024 12:38:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5E62B280C49
	for <lists+linux-input@lfdr.de>; Fri, 15 Nov 2024 11:38:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 256791B4F1C;
	Fri, 15 Nov 2024 11:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QJYOwv0L"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01C281B218E;
	Fri, 15 Nov 2024 11:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731670724; cv=none; b=dqhJrm2eLyLloGLARVaTNoYQE39PM45r+cMQKj07d2HoaGv3dvulvBxtXLDUMRyqmWRv9fNNjfWzPmazbbMsn2l3b6Lw0tTWoOdr0nXMQ+F173BJuqNl2DTwiOXH4DKQfM6aVJrL8XkWa6WAsX3Qf0u7oSZ0vXVRahaOR2qIckM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731670724; c=relaxed/simple;
	bh=KA1wJ8unO7gPRX1lcC6ak5FwkDhI3tExJbWL518o/kc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PSfWsqKwMqy/T1XlqVn9IcrQrLnSXlJFWWDiZLaHoFbq+0LKAoWJlrx1xBrw0qL1xZFlt3H4KN9vUUSmGC8LB9d8jRbXojl80/OlBleaH/VsHP8K3GQoykb2xxHdRpRAsoAL0LjODu/MJ52ZjchPFrdnjkDv0AwbhlvDMC6scLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QJYOwv0L; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-20cf3e36a76so6515385ad.0;
        Fri, 15 Nov 2024 03:38:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731670720; x=1732275520; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JHPIeC3XGFKioJ4g6h+B7X6zDc+M6pjQLoDjxJwdy7w=;
        b=QJYOwv0L7g79AmHm+80N2KzaUPGPO5PrpuAvpDZzsVPEYBj0wiv21UCypn0odFFy1P
         PI5QYSdW9FZBjZOy18nKsutYy+dt1u66RAcqtECdvb4pTD5cBG+hWqaAYd9MKzObtqno
         /8Ea8DAldzj6EB1i99YQH30lTDvqOonuv67Lh4R5J9ep5aYrS60frE8G5zfPpotII3qB
         3Zn2yiKde+lME7w1XrKpDr56wscrAvHg/hPybq6oY2I66MQlojkWoE5huChbbT9RauHl
         lASqxADwDkw1tSb4qGolVDu19DtZdy47l/dM/Em748QQrVsa47feGhyJBlHK8lKJqHXW
         JbEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731670720; x=1732275520;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JHPIeC3XGFKioJ4g6h+B7X6zDc+M6pjQLoDjxJwdy7w=;
        b=Q2CaXrGdw01g4sl0i7WupeUpiVUHLF6EW2VVEiK8eg+0pwcQLI5n7lTfYFiJ7nj6XP
         QaDEe0IR3/repxHG2E7t4dGfhEJk8OG3/LYnXCJzUwtFpe12rmrd11bgiVESRyiHDV98
         mX+5JXExK24kV/NF1lUlTX6INnSeGVlpRQ1kzlbTcaE+ZGnC1GdJ8thcoo4Gzd/h2Bf+
         c3QWXg8tcbsMrV3zd70qc2cH6IM0sDy1cma9JcRcXKnChlLxo6wpkCHHfLR9Ax/Ot5O2
         6gnFiV685typT9iObegMzjRfX31O2WITPzMqRravGeHNKmkpsYRkE8CVZ4ICmAyyhaiU
         GNGw==
X-Forwarded-Encrypted: i=1; AJvYcCXRGSwaLaYwDbGaYweBH5gigH+5netrnDxRgJGDgYH737POZ3qQCWvIhjwktXWG3r5fmWL1FHoaYROsF87M@vger.kernel.org, AJvYcCXUrNZP5n/EujeErtjFwRuSu2c7ipzGzXI9HpxKji6dLOCqYtPWrDRTbn2Hyg2kMBcSMqFWBcwGloU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1Qbu+lxKne6VfqVLfMN4VleyCWBROFq4LJXdck0DE06UBAqMP
	P0/Mg+bNEuc1qXm8dgkGArPrs7vW1lsQQ29VVK0hvzSJGijTuB1R
X-Google-Smtp-Source: AGHT+IG6OHx3pW59jhrT6WLGuyOxnUCn1Rlxtmzsn+sFxvxMITfwdreCtBKGFAMVWodO4RvRARs93g==
X-Received: by 2002:a17:903:11c9:b0:20b:5645:d860 with SMTP id d9443c01a7336-211d0ecc3f0mr30942445ad.36.1731670719922;
        Fri, 15 Nov 2024 03:38:39 -0800 (PST)
Received: from archie.me ([103.124.138.80])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ea06ef6a7esm2600102a91.4.2024.11.15.03.38.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Nov 2024 03:38:38 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id A34A443FF37D; Fri, 15 Nov 2024 18:38:36 +0700 (WIB)
Date: Fri, 15 Nov 2024 18:38:36 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: "Xu, Even" <even.xu@intel.com>, "jikos@kernel.org" <jikos@kernel.org>,
	"bentiss@kernel.org" <bentiss@kernel.org>,
	"corbet@lwn.net" <corbet@lwn.net>,
	"Aaron, Ma" <aaron.ma@canonical.com>
Cc: "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"Sun, Xinpeng" <xinpeng.sun@intel.com>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: Re: [PATCH v2 01/22] HID: THC: Add documentation
Message-ID: <ZzcyvPjkhCutD9ER@archie.me>
References: <20241114053416.4085715-1-even.xu@intel.com>
 <20241114053416.4085715-2-even.xu@intel.com>
 <ZzbIP7tOEns0Fy-U@archie.me>
 <IA1PR11MB6098EC67DEAA5336F4F47B19F4242@IA1PR11MB6098.namprd11.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uVNSzdUheHG0hrK6"
Content-Disposition: inline
In-Reply-To: <IA1PR11MB6098EC67DEAA5336F4F47B19F4242@IA1PR11MB6098.namprd11.prod.outlook.com>


--uVNSzdUheHG0hrK6
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 15, 2024 at 05:10:55AM +0000, Xu, Even wrote:
>=20
>=20
> > -----Original Message-----
> > From: Bagas Sanjaya <bagasdotme@gmail.com>
> > Sent: Friday, November 15, 2024 12:04 PM
> > To: Xu, Even <even.xu@intel.com>; jikos@kernel.org; bentiss@kernel.org;
> > corbet@lwn.net; Aaron, Ma <aaron.ma@canonical.com>
> > Cc: linux-input@vger.kernel.org; linux-kernel@vger.kernel.org; linux-
> > doc@vger.kernel.org; Sun, Xinpeng <xinpeng.sun@intel.com>; Srinivas
> > Pandruvada <srinivas.pandruvada@linux.intel.com>
> > Subject: Re: [PATCH v2 01/22] HID: THC: Add documentation
> >=20
> > On Thu, Nov 14, 2024 at 01:33:55PM +0800, Even Xu wrote:
> > > +Touch Host Controller is the name of the IP block in PCH that interf=
ace with
> > Touch Devices (ex:
> > > +touchscreen, touchpad etc.). It is comprised of 3 key functional blo=
cks:
> > > +- A natively half-duplex Quad I/O capable SPI master
> > > +- Low latency I2C interface to support HIDI2C compliant devices
> > > +- A HW sequencer with RW DMA capability to system memory
> >=20
> > I see in my htmldocs output that the list above is long running paragra=
ph instead.
>=20
> You are right, let me fix it in next version.

OK.

>=20
> >=20
> > > +When THC is configured to SPI mode, opcodes are used for determining=
 the
> > read/write IO mode.
> > > +There are some OPCode examples for SPI IO mode::
> > > +
> > > + +--------+---------------------------------+
> > > + | opcode |  Corresponding SPI command      |
> > > + +=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+
> > > + |  0x0B  | Read Single I/O                 |
> > > + +--------+---------------------------------+
> > > + |  0x02  | Write Single I/O                |
> > > + +--------+---------------------------------+
> > > + |  0xBB  | Read Dual I/O                   |
> > > + +--------+---------------------------------+
> > > + |  0xB2  | Write Dual I/O                  |
> > > + +--------+---------------------------------+
> > > + |  0xEB  | Read Quad I/O                   |
> > > + +--------+---------------------------------+
> > > + |  0xE2  | Write Quad I/O                  |
> > > + +--------+---------------------------------+
> > > +
> > > <snipped>...
> > > +When THC is working in I2C mode, opcodes are used to tell THC what's=
 the
> > next PIO type:
> > > +I2C SubIP APB register read, I2C SubIP APB register write, I2C touch
> > > +IC device read, I2C touch IC device write, I2C touch IC device write=
 followed
> > by read.
> > > +
> > > +Here are the THC pre-defined opcodes for I2C mode::
> > > +
> > > + +--------+-------------------------------------------+----------+
> > > + | opcode |       Corresponding I2C command           | Address  |
> > > +
> > +=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+
> > > + |  0x12  | Read I2C SubIP APB internal registers     | 0h - FFh |
> > > + +--------+-------------------------------------------+----------+
> > > + |  0x13  | Write I2C SubIP APB internal registers    | 0h - FFh |
> > > + +--------+-------------------------------------------+----------+
> > > + |  0x14  | Read external Touch IC through I2C bus    | N/A      |
> > > + +--------+-------------------------------------------+----------+
> > > + |  0x18  | Write external Touch IC through I2C bus   | N/A      |
> > > + +--------+-------------------------------------------+----------+
> > > + |  0x1C  | Write then read external Touch IC through | N/A      |
> > > + |        | I2C bus                                   |          |
> > > + +--------+-------------------------------------------+----------+
> > > +
> > > <snipped>...
> > > +Intel THC uses PRD entry descriptor for every PRD entry. Every PRD
> > > +entry descriptor occupies
> > > +128 bits memories::
> > > +
> > > + +-------------------+---------+------------------------------------=
------------+
> > > + | struct field      | bit(s)  | description                        =
            |
> > > +
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=
=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > =3D=3D=3D
> > > + +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+
> > > + | dest_addr         | 53..0   | destination memory address, as ever=
y entry     |
> > > + |                   |         | is 4KB, ignore lowest 10 bits of ad=
dress.      |
> > > + +-------------------+---------+------------------------------------=
------------+
> > > + | reserved1         | 54..62  | reserved                           =
            |
> > > + +-------------------+---------+------------------------------------=
------------+
> > > + | int_on_completion | 63      | completion interrupt enable bit, if=
 this bit   |
> > > + |                   |         | set it means THC will trigger a com=
pletion     |
> > > + |                   |         | interrupt. This bit is set by SW dr=
iver.       |
> > > + +-------------------+---------+------------------------------------=
------------+
> > > + | len               | 87..64  | how many bytes of data in this entr=
y.          |
> > > + +-------------------+---------+------------------------------------=
------------+
> > > + | end_of_prd        | 88      | end of PRD table bit, if this bit i=
s set,      |
> > > + |                   |         | it means this entry is last entry i=
n this PRD  |
> > > + |                   |         | table. This bit is set by SW driver=
=2E           |
> > > + +-------------------+---------+------------------------------------=
------------+
> > > + | hw_status         | 90..89  | HW status bits                     =
            |
> > > + +-------------------+---------+------------------------------------=
------------+
> > > + | reserved2         | 127..91 | reserved                           =
            |
> > > + +-------------------+---------+------------------------------------=
------------+
> >=20
> > Shouldn't these tables be formatted as tables?
>=20
> Good idea!
> Let's format them.

Just drop the literal block formatting, keeping the table as-is.

--=20
An old man doll... just what I always wanted! - Clara

--uVNSzdUheHG0hrK6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZzcytwAKCRD2uYlJVVFO
o2LmAQDBm2ZoF8NWpOlKkHK/zBJCK3b9hOg3hLAx4gWqeLZ2FQD9FuT+G8tjxh26
v11BU4JtmOF6z8Zkj/nm5TsjZImLwgM=
=kbBP
-----END PGP SIGNATURE-----

--uVNSzdUheHG0hrK6--

