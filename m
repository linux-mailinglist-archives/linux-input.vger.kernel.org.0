Return-Path: <linux-input+bounces-13242-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D86AAEE7D6
	for <lists+linux-input@lfdr.de>; Mon, 30 Jun 2025 22:00:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ADF9E4402DF
	for <lists+linux-input@lfdr.de>; Mon, 30 Jun 2025 19:59:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8007218AD4;
	Mon, 30 Jun 2025 20:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nfraprado@collabora.com header.b="SWLqK6Bw"
X-Original-To: linux-input@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C9DB522A;
	Mon, 30 Jun 2025 20:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751313610; cv=pass; b=cV8JKE49V34qvrBb2mZuoAiJjmmFAQD5fFf1Y5hn8Oa5W70wEO4NlLwuOm8A1AlCex7MdmYAbzRKv6NncIaigMKvz9nCOP/1Rc9zoZbLDllbmOXolxirZZD9UcsEfXjKqDmkj/oe/RyVWxwQoZPaVrq1U+Nv+lA5Vp9FblveIkQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751313610; c=relaxed/simple;
	bh=rBUTDTzHFfwcfiT7i6BHSGVXrToMoBPF9YjK4qz9/CM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CG2+PSedvgQl13Glgb4DVLD+75/ymgz89zcAmOUJADMkX1fRWw0Nvq6jATV/IA4f5OqBk61kwG1+ho2vFo9D+EKNwIgshFYsBLoDG7HX+u403LWdxh8Udz6OYNPQ7QEjVf+mFZ0+5RAWAwbD7pKFqXLeVQJ+bcgN4XzgLs9f7Ck=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nfraprado@collabora.com header.b=SWLqK6Bw; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1751313593; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=oIyis2lLopynTJij4VlBnmivGgF3rJiq5l0M9s4Gb9dTR0a4XO7JFS0I8PWuLEbP2Vqln/JcxEJadChK7k/WpviSiUJuKuEGxCYxL52r2rC7yRYgkDRiXq0hJv/EtX7oSoRZbwkzz2GaFLdDERDZc/89zdttry8CcTzA5qV3YZw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1751313593; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=rBUTDTzHFfwcfiT7i6BHSGVXrToMoBPF9YjK4qz9/CM=; 
	b=WCPdN3ntfbZw5YLGEYsETWBGt+VZpOrJpBG0FxQY4i+t2wIHE+2h3UEshYE1Sai8dYafsxRNkzBh9LBNdSHCyOUq2/gcKir9/GJAEZz3X0AB1aujzTk1DC5ScmbIRluUXi/K7TR7rASsTQdOh4Twp/ZhwPKT34clh5rY4VyPYQE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nfraprado@collabora.com;
	dmarc=pass header.from=<nfraprado@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1751313593;
	s=zohomail; d=collabora.com; i=nfraprado@collabora.com;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=rBUTDTzHFfwcfiT7i6BHSGVXrToMoBPF9YjK4qz9/CM=;
	b=SWLqK6BwRQHFLSqizYCw1ukwzLPYtLySRrigRfm6BKHU+S7rphQY2YZhCXRBgIEl
	SaDeB4CiA/KP939AYQF1y+iv/PMgTpb8K8nbfrUErz8j5RGxnMEqJn465ZDEawpTg+4
	bFjQZGfMjthNskVrx4KrB7Uv9NhqrEUY6kmN2EZc=
Received: by mx.zohomail.com with SMTPS id 1751313591718941.3513556291028;
	Mon, 30 Jun 2025 12:59:51 -0700 (PDT)
Message-ID: <48f573941d64217240f4750534e17faf4af0e3f6.camel@collabora.com>
Subject: Re: [PATCH] Input: mtk-pmic-keys: Fix null pointer dereference when
 no compatible data
From: =?ISO-8859-1?Q?N=EDcolas?= "F. R. A. Prado" <nfraprado@collabora.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, AngeloGioacchino Del Regno
	 <angelogioacchino.delregno@collabora.com>
Cc: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, kernel@collabora.com,
 linux-input@vger.kernel.org,  linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,  linux-mediatek@lists.infradead.org
Date: Mon, 30 Jun 2025 15:59:46 -0400
In-Reply-To: <d373gpdyqejppdysdbb4k6aat5i33epnqsebxdkjbrgfwsnqtm@43si4kmjvsmq>
References: 
	<20250630-mtk-pmic-keys-fix-crash-v1-1-e47351fa9d1f@collabora.com>
	 <28111607-d5a2-4b54-964a-d010fb99193a@collabora.com>
	 <d373gpdyqejppdysdbb4k6aat5i33epnqsebxdkjbrgfwsnqtm@43si4kmjvsmq>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ZohoMailClient: External

On Mon, 2025-06-30 at 08:25 -0700, Dmitry Torokhov wrote:
> On Mon, Jun 30, 2025 at 04:06:53PM +0200, AngeloGioacchino Del Regno
> wrote:
> > Il 30/06/25 16:03, Louis-Alexis Eyraud ha scritto:
>=20
> [... snip ...]
>=20
> > > @@ -316,6 +316,9 @@ static int mtk_pmic_keys_probe(struct
> > > platform_device *pdev)
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0const struct of_devic=
e_id *of_id =3D
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0of_match_device(of_mtk_pmic_keys_match_tbl,
> > > &pdev->dev);
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (!of_id)
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0return -EINVAL;
> >=20
> > Please, change this to `return -ENODEV;`
>=20
> No, this definitely should not be a "silent" error because it
> indicates
> there is something wrong with the kernel.
>=20
> Stepping back, why do we even enter mtk_pmic_keys_probe() if there is
> not a matching OF ID? Are there any other patches that are not
> upstream?

I'm guessing it's because the driver can be probed by a parent MFD
driver, drivers/mfd/mt6397-core.c, and the compatibles defined in the
MFD don't necessarily match the ones in the pmic-keys driver, for
instance 'mediatek,mt6359-keys' is only listed in the MFD. Adding the
missing compatibles to the pmic-keys driver should fix this.


--=20
Thanks,

N=C3=ADcolas

