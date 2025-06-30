Return-Path: <linux-input+bounces-13267-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DB7C2AEEAC4
	for <lists+linux-input@lfdr.de>; Tue,  1 Jul 2025 01:03:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 35F321BC2563
	for <lists+linux-input@lfdr.de>; Mon, 30 Jun 2025 23:04:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFF2029824B;
	Mon, 30 Jun 2025 23:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YOwgvXn3"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45D7828A73C;
	Mon, 30 Jun 2025 23:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751324630; cv=none; b=gPIEMk76hLk9JUx2bRUVVpsje+eyaTYV0STI/QxhyBTT4Wqoy3OvqjUAY21htCXrJEtYdsRhAfgv6IcI47j/8iKufrVSaUARWBO0pUVMmVT3KtRHGkHwd6/gchAUHtBRF7DA8gc+Nd+tViNdyz1iJvdIBrdl1fmM7bi+Qfl8dGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751324630; c=relaxed/simple;
	bh=IO4zn/LEXZ6r90jT0QZ5UvZdpsgJzS2JIG++UMTJwuc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dojPG+GlI3sSfDgZCaNdSwnNiy//bVNp6zvkv/TAvPEUp8MjMl7DpRWaJ4wDtcTccTjs3QY2JtV7CijWBAfDJ0tsZqQP/iTSAFewCIWcElA/FNXoLDpHbuiGFZrsMJ9LXosLEUaivQQRXM6WIY6BnLkiO97NhG+r9Af3oeKHC6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YOwgvXn3; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-b2c4331c50eso4963999a12.3;
        Mon, 30 Jun 2025 16:03:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751324628; x=1751929428; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DcMIWFES6oqAmi3k3/qne93pIx7ZR4rKJz2Nj99pEyU=;
        b=YOwgvXn3EOPwVCtRBL0gRiq41d8AxDfjPt2+md/ReWpMifeHguW73MX1uXaYpkIshO
         lufvXiGnrJ4dR1bgGyVZ9UI73b5LqO7WFBSG5UNwM6OTKCj8LjmnEKoy145rD1DuC3N7
         fTjNTjTGSeKK1a87DsJ7niEzJJtE+QAlIRMcYcsMfyGh2P/RJs5C0IBMdGhpKLr7Cyz6
         jh/NbzGVKYOHmaOSuStJxrsV05UxK4qdTA1veLkgZ5pfS8ZEDi1em2TIw8WHakePMzZk
         s3CpddtHDEVQoK3D+oSxD2BqpZuhk/NB+BvKzRymULE3K8JB3S2sTIoewrxyas0ISeCY
         ZCCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751324628; x=1751929428;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DcMIWFES6oqAmi3k3/qne93pIx7ZR4rKJz2Nj99pEyU=;
        b=Yt/mdDB4vvQEyiYzj13prBDA4+VNwNo9idKeJBxUv0jjSMcud4Mx9ccIRauAm0arQ/
         u5DPFKF9nt3QlZChT8Vhl95kCgkIDLpDYt0vfDH/BiWE/82JcPMYBrdfegQnbu+Jc+Qh
         VLTJJue0NzUQXBzLFriLCCFFmbXMUhvTtoYLiL90l41RhEvYRKGg2seO0Pmvp+LJWmb3
         Flv18d1lbc6CoW4fAxyOEw0oCM1O0y5LJ/a4hhP6cTHDqSi92U6UAiRG6IVc+RXIuR/I
         ldmV53/MwwLEmvY4EYnDRdmlQHc3IKeyhhmc4yjEsBV5Eq11pHdDtj9skOVj53+zpLnn
         /CSg==
X-Forwarded-Encrypted: i=1; AJvYcCWXR8y3P/ftfOgW+FNQqDNsF/v+04/XhiLqy+8ly1tUmIpYcy9pY7zXMmigHvQbjtt7V2sRYorxfJtlgw==@vger.kernel.org, AJvYcCXDZKVs7XldLfSAt5JY4NFrzsohWAvQWrwBarauPxtbciApJJMI8Y/PA5CQL+N/weJhl3G7Pllsf/tK4+qj@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9GpN1k8nPpw+gcja+xWdJDkreJcZOiYKGw3h8c5k7VVL0nV5j
	d+xHN2LmhOF66eXHDET21bA2hxtE1KqSLLI8MEPs461wMVF1Jfwyh3JY
X-Gm-Gg: ASbGnct7HPpsOpgF73ONN591uZN1StQefoVpJwzONwA+SpNSXHrH0+vNPLSpVFNxL8K
	50wXpBklQnnvE5VefptpThUBaHR8LW6anlIfGONc4q/vAoSjFUfpvK02xA2g/mtsmUSlrUZ9Pso
	69ep0IXZQtXgYZGZIX5j2PCuU3Ihm0mY51RuKjpCMENNCvwfmTsIQt5+VMTRtEOF4icPKR5FSxq
	vDby6l69TpI691l8aTabT2ojD6ySLHMsCMC6zd7wmIaKI/UBxQ3v7kzis+bBDufnKuK2dXnfP4P
	OTyWTGR+UZ3P+Nlfwwb/oaRN431hYOLHshPiJHdJFiV0F8rUMDLFGRVIA5ip0w==
X-Google-Smtp-Source: AGHT+IHKbAQSwj+eXwJLDhBipfTSg+qZzjJ6I0tpy1EaDnqoZVZaoA25wQdULxKVIR4F7iCenLZ2Jw==
X-Received: by 2002:a17:90b:2c90:b0:312:ec3b:82c0 with SMTP id 98e67ed59e1d1-318c9314d79mr21601226a91.29.1751324628355;
        Mon, 30 Jun 2025 16:03:48 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:c92b:c666:1f8:990e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31a494237adsm214315a91.0.2025.06.30.16.03.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 16:03:48 -0700 (PDT)
Date: Mon, 30 Jun 2025 16:03:45 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>, Matthias Brugger <matthias.bgg@gmail.com>, kernel@collabora.com, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] Input: mtk-pmic-keys: Fix null pointer dereference when
 no compatible data
Message-ID: <yconjvlgrgqsiyclce426i2u4pqcheqxeqxa6fpduqrxtn7njb@jr4nvqvmad2k>
References: <20250630-mtk-pmic-keys-fix-crash-v1-1-e47351fa9d1f@collabora.com>
 <28111607-d5a2-4b54-964a-d010fb99193a@collabora.com>
 <d373gpdyqejppdysdbb4k6aat5i33epnqsebxdkjbrgfwsnqtm@43si4kmjvsmq>
 <48f573941d64217240f4750534e17faf4af0e3f6.camel@collabora.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <48f573941d64217240f4750534e17faf4af0e3f6.camel@collabora.com>

On Mon, Jun 30, 2025 at 03:59:46PM -0400, Nícolas F. R. A. Prado wrote:
> On Mon, 2025-06-30 at 08:25 -0700, Dmitry Torokhov wrote:
> > On Mon, Jun 30, 2025 at 04:06:53PM +0200, AngeloGioacchino Del Regno
> > wrote:
> > > Il 30/06/25 16:03, Louis-Alexis Eyraud ha scritto:
> > 
> > [... snip ...]
> > 
> > > > @@ -316,6 +316,9 @@ static int mtk_pmic_keys_probe(struct
> > > > platform_device *pdev)
> > > >         const struct of_device_id *of_id =
> > > >                 of_match_device(of_mtk_pmic_keys_match_tbl,
> > > > &pdev->dev);
> > > > +       if (!of_id)
> > > > +               return -EINVAL;
> > > 
> > > Please, change this to `return -ENODEV;`
> > 
> > No, this definitely should not be a "silent" error because it
> > indicates
> > there is something wrong with the kernel.
> > 
> > Stepping back, why do we even enter mtk_pmic_keys_probe() if there is
> > not a matching OF ID? Are there any other patches that are not
> > upstream?
> 
> I'm guessing it's because the driver can be probed by a parent MFD
> driver, drivers/mfd/mt6397-core.c, and the compatibles defined in the
> MFD don't necessarily match the ones in the pmic-keys driver, for
> instance 'mediatek,mt6359-keys' is only listed in the MFD. Adding the
> missing compatibles to the pmic-keys driver should fix this.

I think if we stop using the generic "mtk-pmic-keys" in MFD core it
should solve the issue. I just sent out a patch...

Thanks.

-- 
Dmitry

