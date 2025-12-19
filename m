Return-Path: <linux-input+bounces-16633-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 07712CCE8DC
	for <lists+linux-input@lfdr.de>; Fri, 19 Dec 2025 06:40:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 646703011316
	for <lists+linux-input@lfdr.de>; Fri, 19 Dec 2025 05:40:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10D9E236435;
	Fri, 19 Dec 2025 05:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gf7FJjDT"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5047517B418
	for <linux-input@vger.kernel.org>; Fri, 19 Dec 2025 05:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766122799; cv=none; b=oqMR2xXx3Oj4WtAQyewa1qj+WFdsfSgEjeCZnYdQ38LQUc/g7lxwZQ7mDUS/i/HVyuYEu/80erHi1RYJvvMZWlOAD8SfmTIMWWarxRQwo8gaVhGJ8Q45pICTw32csfhD3I8sBOYj30R3aIr9c45ZZ657w3CrO3Ds78sulD9GpNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766122799; c=relaxed/simple;
	bh=foOxPhPDocyqSpaCeWrgVZCk4VpUfIAD8xpSVI7/Zbo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WWEeVT/7yhn3KW0pk7xFb4Rn7/XTPp49WfZgaRHIbQBdOC1JUWCk+QaZy4jOmOLaYAlZB7bnR/chu7OYU8LvA8ofjKGhpSkeuou4Vx4eRJ+mUMUzrQAi5jqG34F0rKoD16VvL+Chm+54VjttrfSMQYSMiON/EE6V+//ywL1zHbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gf7FJjDT; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-37b935df7bfso11011621fa.2
        for <linux-input@vger.kernel.org>; Thu, 18 Dec 2025 21:39:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766122795; x=1766727595; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6/Qgrglg9mCMcH0El7GvTp3hRmDFqT9vZmBEM8+dsA4=;
        b=gf7FJjDTa+L2iNOAKycQRSDMwkpkynnRR5gPhxjKor7ovzSdSl1YRp83iz40sVdmQJ
         be3RDJpMRHGeXD7Zmm8QWzfAgYXBDz6Oh7GBDqSa6G+l84NFAtsfpNgrluXTkoXf2FN1
         wyuk/7J4mNTbAhcX8Fa0rUJKGvwtwVjhMLyCq/vTtVupfaKzfdWF4O87DUDXhieTIu6T
         a7ZsrY8P/ELySFP8DwwxG2LBRNiQNaVjfGyq5T/GRPCdOZTtBS9oQ2viDcyrt2xahjOE
         ArBEGA1cXlb6fmXnDnqh0Qszjxs9ZocyMT0pugB/M4n71dKGdR2H5r5Dxx00Pkfl0DsF
         omGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766122795; x=1766727595;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6/Qgrglg9mCMcH0El7GvTp3hRmDFqT9vZmBEM8+dsA4=;
        b=SX7HM6qCvUwO61qs5dV9j4y5dowmX4D5ZsFOJdFLPUr6MioDIQNP4H0y4PyG1PL5Ac
         9wqge9X2cr41Cp8yJvV+gwpEsER/5Te0uvV4MDvG5eBJX/mTJ4lb0rLBIrQOuAkw+tJ5
         wLKlmDO6XbBBItFYQhq2r45uNUga2AFcQOGLSvfS4qe/MhzgT6H+Om15tz20aGn/54DJ
         FWDLDIjsUGGsRJ+R8OaWonrRN1zo4gJYYw1QU2Yl+i9ItwNaxxbqMuW44+FKGJIHHQOH
         c8NmBJONaVV+LkOIkyqgH7F9mRzDgtqO2lGeBztyrPLTRh5U4GDWqNW27yzau5PBPRMT
         g94g==
X-Forwarded-Encrypted: i=1; AJvYcCViIWJXVtbmyOKpFIvCgDk94EPzbeBnLTutUzuysFnjTcovAPQdWnU7W72OFYS2j8hehsnqQIVgom2p7Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YysoeIBXAWnwV8I4kTGrKeMqFclGgvyXe7HOz3iOJGLEw6AJcp8
	mw1wNZPrpaZUiICMt1xHGs2P4wKCFedxJ9eEyCoHX9SqjzAqpgAX/IzSqAy//WKTSaddyLxL2bf
	jvqXIMHfD56pxxsuk3tYJpANPbShkzdg=
X-Gm-Gg: AY/fxX5orFMUVLt3LQNq7Kvn+1sZNRg79mtB1J1yCZ5DkV5UgP7DVTNFQ8D1JyQALbR
	rG+JYWCuIbScxEtyHttyipOIewN18iOYVY1jpwh0336CeriMCBxYDj/QjQBACvgzGKXJTjuyLa/
	Q4GCF9PV2UKt1URDEHOIZBHb4+ojHCm8Vx/fmzLT8d58fFxc6ubZ2HT2TMZRqfCbYDD7zkzo2SF
	P6jLWw45G33WlPVWveAjoVhgzWx9XS7ylSD5JXKDMcEfLr/qCriN4N2+yYe8zk3U490
X-Google-Smtp-Source: AGHT+IGqDQKHfSRZ3f9uJLBIMGws5Z+40H1FjGiwsEMzROVikv0sYnPGGAM+a93ygd90Nv9zBHj0HAubRIJ/00WtnGU=
X-Received: by 2002:a2e:be21:0:b0:37b:926d:5bf3 with SMTP id
 38308e7fff4ca-38121569ff7mr4888911fa.6.1766122795142; Thu, 18 Dec 2025
 21:39:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251218140003.636901-1-vishnuocv@gmail.com> <950d627dc280af94a1073da7938a6f2a09e31e34.camel@linux.intel.com>
 <SJ0PR11MB5613BDF3C10AE8093404639A93A9A@SJ0PR11MB5613.namprd11.prod.outlook.com>
In-Reply-To: <SJ0PR11MB5613BDF3C10AE8093404639A93A9A@SJ0PR11MB5613.namprd11.prod.outlook.com>
From: Vishnu Sankar <vishnuocv@gmail.com>
Date: Fri, 19 Dec 2025 14:39:18 +0900
X-Gm-Features: AQt7F2rdL8bdO_SdXjqPXY2AWgGcbPHKCVXO22e0HcF8lM8NJ5kAIop0wt5THaM
Message-ID: <CABxCQKu4trmjbfW=mCZEYh6k6G3gTeLA9Q5CD6eWys4ez4iq8Q@mail.gmail.com>
Subject: Re: [PATCH] HID: intel-ish-hid: loader: Add PRODUCT_FAMILY-based
 firmware matching
To: "Zhang, Lixu" <lixu.zhang@intel.com>
Cc: srinivas pandruvada <srinivas.pandruvada@linux.intel.com>, 
	"jikos@kernel.org" <jikos@kernel.org>, "bentiss@kernel.org" <bentiss@kernel.org>, 
	"Sankar, Vishnu" <vsankar@lenovo.com>, "Xu, Even" <even.xu@intel.com>, 
	"linux-input@vger.kernel.org" <linux-input@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Mark Pearson <mpearson-lenovo@squebb.ca>, 
	Richie Roy Jayme <rjayme.jp@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Lixu,

Thank you for the comments.

On Fri, Dec 19, 2025 at 10:26=E2=80=AFAM Zhang, Lixu <lixu.zhang@intel.com>=
 wrote:
>
> >-----Original Message-----
> >From: srinivas pandruvada <srinivas.pandruvada@linux.intel.com>
> >Sent: Thursday, December 18, 2025 11:55 PM
> >To: Vishnu Sankar <vishnuocv@gmail.com>; jikos@kernel.org;
> >bentiss@kernel.org; Sankar, Vishnu <vsankar@lenovo.com>; Zhang, Lixu
> ><lixu.zhang@intel.com>; Xu, Even <even.xu@intel.com>
> >Cc: linux-input@vger.kernel.org; linux-kernel@vger.kernel.org; Mark Pear=
son
> ><mpearson-lenovo@squebb.ca>; Richie Roy Jayme <rjayme.jp@gmail.com>
> >Subject: Re: [PATCH] HID: intel-ish-hid: loader: Add PRODUCT_FAMILY-base=
d
> >firmware matching
> >
> >+ Lixu
> >+ Even
> >
> >
> >On Thu, 2025-12-18 at 23:00 +0900, Vishnu Sankar wrote:
> >> Add support for firmware filenames that include the CRC32 checksum of
> >> the DMI product_family field. Several OEMs ship ISH firmware variants
> >> shared across a product family while product_name or product_sku may
> >> differ.
> >> This
> >> intermediate matching granularity reduces duplication and improves
> >> firmware selection for vendor-customized platforms.
>
> ...
>
> >> +
> >> +    if (sys_vendor && product_family) {
> >> +            snprintf(filename, sizeof(filename),
> >> +                     ISH_FW_FILE_VENDOR_FAMILY_FMT,
> >> +                     gen, vendor_crc, family_crc);
> >> +            ret =3D _request_ish_firmware(firmware_p, filename,
> >> dev);
> >> +            if (!ret)
> >> +                    return 0;
> >> +}
> Indent issue.
>
> Hi Vishnu,
> Thanks for your patch.
> 1. Please run the ` ./scripts/checkpatch.pl --strict --codespell [PATCH F=
ILE]`, and fix the issue.
Acked
> 2. Could you please also update the document `Documentation/hid/intel-ish=
-hid.rst`?
Will update the document in v2.
>
> Thanks,
> Lixu
>
> >>
> >>      if (sys_vendor && product_name && product_sku) {
> >>              snprintf(filename, sizeof(filename),
> >> ISH_FW_FILE_VENDOR_NAME_SKU_FMT, gen,



--=20

Regards,

      Vishnu Sankar
     +817015150407 (Japan)

