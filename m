Return-Path: <linux-input+bounces-11447-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C3111A77565
	for <lists+linux-input@lfdr.de>; Tue,  1 Apr 2025 09:43:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0C6D0188B3B1
	for <lists+linux-input@lfdr.de>; Tue,  1 Apr 2025 07:43:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1C421E98F9;
	Tue,  1 Apr 2025 07:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="cOvUMySa"
X-Original-To: linux-input@vger.kernel.org
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9849B1E8824
	for <linux-input@vger.kernel.org>; Tue,  1 Apr 2025 07:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743493384; cv=none; b=uGcDTkcspm5+YKVVJRPJZsX2NgCk6jtna0FRt+FDy53tq6J5nPszv0eA07dTu6jobMy3jR9AJCh4Obx7gDZgSULPMR+kMClrigCeS9dLeHyOjnTd+uH5xaNOC5C4JLuu/X1vj0CXXFa0RzjDFXFZWONCa5hMXL+r3AZUnPEZ2Iw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743493384; c=relaxed/simple;
	bh=ol3KEi1JHVv2MciQBedJc0hrYivuK7T5ywhpsNX8hds=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:In-Reply-To:
	 Content-Type:References; b=YK2fCzTnCZ9rrqw/ulpcqlZP77brKdECLw7a3297eZAr68kIrlOrnZw5I3Loe+jJOxe0tIHiNX/dyj4WpJuXtczVcF1zMpZ3soG19HGxPn6FQSHQp0NbD+o+ZDPa44s83z3g7nOvFdeZ37iXmK64jXxwcuZOznrHZN03ey3cgdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=cOvUMySa; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250401074300epoutp021ac687e09c9b8eaf3afe9aafefe8c34c~yIf4QRJDV0910309103epoutp02Z
	for <linux-input@vger.kernel.org>; Tue,  1 Apr 2025 07:43:00 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250401074300epoutp021ac687e09c9b8eaf3afe9aafefe8c34c~yIf4QRJDV0910309103epoutp02Z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1743493380;
	bh=qCLISR3UHDNQxqaBQyTeV/B+Zt7cQRuEqYrOlA0MME0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=cOvUMySacxHPCSsL0XpGnWT8gxYLRkNxqn1Sa/vBYX/cKXmWSdXIV0HSSewuB9Ce8
	 v71WZuXuvthYwX8Df9KOxuUrCI9yovpgzLkbQ0Uuy2g8rFlwrPJE69GWXJ81W0Xanl
	 Xk48JGC0NKWrJN90TLSND6xJFsxLDE6/OwrQ1cds=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTPS id
	20250401074300epcas2p2b58531e6df3d31f15999e9838ab31582~yIf3tRGzv3042730427epcas2p2i;
	Tue,  1 Apr 2025 07:43:00 +0000 (GMT)
Received: from epsmges2p1.samsung.com (unknown [182.195.36.91]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4ZRg2q4hhgz2SSKm; Tue,  1 Apr
	2025 07:42:59 +0000 (GMT)
Received: from epcas2p4.samsung.com ( [182.195.41.56]) by
	epsmges2p1.samsung.com (Symantec Messaging Gateway) with SMTP id
	54.27.09787.3099BE76; Tue,  1 Apr 2025 16:42:59 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
	20250401074259epcas2p34402b3397077c75cda5b743c9f60c470~yIf2nGzMj0855008550epcas2p3z;
	Tue,  1 Apr 2025 07:42:59 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20250401074259epsmtrp2a2cfd4e6eff9a3090fdd097a029dfd48~yIf2l0xoC1572015720epsmtrp2N;
	Tue,  1 Apr 2025 07:42:59 +0000 (GMT)
X-AuditID: b6c32a45-9d3ff7000000263b-67-67eb99037c40
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	8D.29.08766.2099BE76; Tue,  1 Apr 2025 16:42:58 +0900 (KST)
Received: from ubuntu (unknown [10.229.95.128]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20250401074258epsmtip20dd1c15250c3cd99f4169251e6bb0a11~yIf2UmsC30941309413epsmtip27;
	Tue,  1 Apr 2025 07:42:58 +0000 (GMT)
Date: Tue, 1 Apr 2025 16:52:11 +0900
From: Jung Daehwan <dh10.jung@samsung.com>
To: Puma Hsu <pumahsu@google.com>
Cc: Wesley Cheng <quic_wcheng@quicinc.com>, srinivas.kandagatla@linaro.org,
	mathias.nyman@intel.com, perex@perex.cz, conor+dt@kernel.org,
	dmitry.torokhov@gmail.com, corbet@lwn.net, broonie@kernel.org,
	lgirdwood@gmail.com, krzk+dt@kernel.org,
	pierre-louis.bossart@linux.intel.com, Thinh.Nguyen@synopsys.com,
	tiwai@suse.com, robh@kernel.org, gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-sound@vger.kernel.org, linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v36 04/31] usb: host: xhci-plat: Set XHCI max
 interrupters if property is present
Message-ID: <20250401075211.GE98772@ubuntu>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <CAGCq0LYNn6VZwKpvvf=N2ra8ZJcSso80ZDpirByHO9ChBZv3eg@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Brightmail-Tracker: H4sIAAAAAAAAA02Tf0xTVxTHue+17z3Azreq84ILlgdugQlSxo+LilsYyosuBjOyDJ2pDTxK
	A7RdWxhzGyNBAQk/RFGgm5MBKQTLGB0OxCJQ0MEycBuC0zkTGL8KSuS3E51reW7hv8/53vM9
	5557cilcXEq6U0qVntOq5MkM4SL4ocsH+eHl04qAGYsHOjc8SiBTWz+GRjtyALrY3S9EXZWT
	AGVVNRDIZrhPoKVbuRgqbu8j0TfZ1QJ0Z25JiAZavyLQhfESHFUaT+Ioy1wiRKdai4ToyfNx
	DJXXeyHz1UIhem5pIVH2jRtCVFfRQaLvluvB25vZK4Y/SbbCnMpWWWwYa647RbD3hiwE+3Xv
	Ibb9golkqwrPCtlrD40EW2zJYBuaBgVsU/s8YOfNHtGiw0m7Ezl5PKeVcKo4dbxSpQhnDrwn
	e0cWHBIg9ZOGoVBGopKncOFM5LvRfvuUyfbRGUmaPDnVLkXLdTpmx57dWnWqnpMkqnX6cIbT
	xCdrQjX+OnmKLlWl8Fdx+p3SgIDAYHvisaTEpZF8oBlcl/5X0RKeCR445wFnCtJBsO7cHTwP
	uFBiugXAS/0jAj6YA7CksojggyUAO4quYnmAWrVcHNHwehuAmTdbAB+MAthSNUM66gpob/hT
	vwk4mKB94f3HPbiDN9KecGEsB3MYcLpXAHus11eTNtAKWNl8EnOwiH4DDn3bKOT5ZdhbPipw
	sDN9CNZMDpOOW2yyN5jq/MJRB9LNzvBKjxnwA0VC05OmF7wBTv3YRPLsDudn2giedfDuxDjO
	m08AWDt1AucP3oSG8ZxVM04nwuqnI0J+ZC/YfVfAyy/B3K5nJC+LYG62mHd6wdKB00Ke3WDn
	dP+LiiycKRzH+AfKx+CDgkfkabDVsGY0w5puBntZnPaBDa07eHkrzLr8Jc7LW2DNP9SajApA
	1IFXOI0uRcHpAjXS/xcfp04xg9Uf4ru3BZx9+MjfCjAKWAGkcGaj6INFm0Isipd/cpzTqmXa
	1GROZwXB9p0V4+6b4tT2L6bSy6RBYQFBISHS0MDggFBms8g6O6YQ0wq5nkviOA2n/c+HUc7u
	mRjV8xgG1hLTtYER19IW8Hvqg0rP/cGvZUiGj5/fNVLkdWygui+9Mc1k29O7MvhWqHv14YyQ
	nCCXxYQjcfMfbZ2zdEdK3ai2mHKrNeGXrjOZTFR804Aru/g3Vra9dCUmvngF21f18+A2OP+r
	q0hRLwpT3n79QNe6kt+3l4nJjKNbmNhmp7H3z0hWjkwb8/d2JOFueG+isuag0DIV+/Hn+1+9
	md5Y6/39rCzDuNx+23ki1+xa0Skb7zefT4gqeCZcPzlxK2I423vnhwOfUUZK4jpb0zJkiPE8
	einCh+FI29NdTsu//dHn1B21zbW8PvbTBeP667NzFXSBzSQaoi+XyTxqGIEuUS71xbU6+b+S
	YOhwqgQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrBIsWRmVeSWpSXmKPExsWy7bCSvC7TzNfpBj8OW1hMffiEzWLN3nNM
	Fk8OtDNazD9yjtXi8KIXjBbNi9ezWbycdY/N4tuVDiaLifvPslssbFvCYnHz0zdWi8u75rBZ
	zH02hdli0bJWZovmTVNYLTp39bNa/Pr/jMli5lpli027+1gt/u/ZwW7RduwYq8WqBQfYLTZ8
	X8voIO6xc9Zddo8Fm0o9Fu95yeSxaVUnm8eda3vYPOadDPTYP3cNu8fivsmsHvveLmPzmLin
	zmP9lqssHlv2f2b0+LxJLoA3issmJTUnsyy1SN8ugStj2qmjrAXfOSvW7uJtYFzF3sXIwSEh
	YCIx/1FBFyMXh5DAbkaJT+t+snUxcgLFJSWWzr3BDmELS9xvOcIKUfSIUeLQggVMIAkWARWJ
	U+fWMILYbAJaEvd+nGAGsUUEFCW+PG1nAmlgFjjJInHi0FGwImGBdIlF21vBmnkFtCWurdsI
	NbWHSeL0820sEAlBiZMzn4DZzALqEn/mXWIGOZVZQFpi+T8OiLC8RPPW2WDLOAUCJZa/eAj2
	jSjQQa8O1k9gFJqFZNAsJINmIQyahWTQAkaWVYySqQXFuem5xYYFhnmp5XrFibnFpXnpesn5
	uZsYwYlBS3MH4/ZVH/QOMTJxMB5ilOBgVhLhjfj6Ml2INyWxsiq1KD++qDQntfgQozQHi5I4
	r/iL3hQhgfTEktTs1NSC1CKYLBMHp1QDk/53s6C2N4W7sude7HXLv3Ap69A8+fMsc3njhL6Y
	3fDZp3/6kUpLps/EYPdqRsdWzbD3hhV7czJ+zr6s8PZQ7724z4w/GxI31Ae3n684tO7sccv8
	439SpP/F55fb80bmOXzQ+a0jsvvX/bTs2aul5BdpKa2fWjZL6amP6IXnums17E+fmpTwKuoU
	9zIOSc2Dvgdj3Xk268065Kp7/cesjzL5qV94wgKk3Osn6tfFq/az7Fm3kVHrqULNl9mt530E
	vnHH2dUvzJq7R73u4oInmb7P71S9u2Zlqr/c9UNJRLrzJ/cLV6X5thneztvFyZi87VXztqp3
	Mcwz1X3nXX+0n7vnaWfJ/xPOh9dbWR5zVWIpzkg01GIuKk4EAJ2RqkV7AwAA
X-CMS-MailID: 20250401074259epcas2p34402b3397077c75cda5b743c9f60c470
X-Msg-Generator: CA
Content-Type: multipart/mixed;
	boundary="----rHPRFtJkdx5CiZJP2v5Cn8OZ9YZY2B0tfPkXi2gvBl6TiQFm=_6a647_"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250328074729epcas2p33bc4c33532824ef92d536234203d2fca
References: <20250319005141.312805-1-quic_wcheng@quicinc.com>
	<20250319005141.312805-5-quic_wcheng@quicinc.com>
	<CGME20250328074729epcas2p33bc4c33532824ef92d536234203d2fca@epcas2p3.samsung.com>
	<CAGCq0LYNn6VZwKpvvf=N2ra8ZJcSso80ZDpirByHO9ChBZv3eg@mail.gmail.com>

------rHPRFtJkdx5CiZJP2v5Cn8OZ9YZY2B0tfPkXi2gvBl6TiQFm=_6a647_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Disposition: inline

On Fri, Mar 28, 2025 at 03:44:00PM +0800, Puma Hsu wrote:
> On Wed, Mar 19, 2025 at 8:54 AM Wesley Cheng <quic_wcheng@quicinc.com> wrote:
> >
> > Some platforms may want to limit the number of XHCI interrupters allocated.
> > This is passed to xhci-plat as a device property.  Ensure that this is read
> > and the max_interrupters field is set.
> >
> > Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> 
> Tested-by: Puma Hsu <pumahsu@google.com>
> 

Tested-by: Daehwan Jung <dh10.jung@samsung.com>

> > ---
> >  drivers/usb/host/xhci-plat.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
> > index 3155e3a842da..6dab142e7278 100644
> > --- a/drivers/usb/host/xhci-plat.c
> > +++ b/drivers/usb/host/xhci-plat.c
> > @@ -267,6 +267,8 @@ int xhci_plat_probe(struct platform_device *pdev, struct device *sysdev, const s
> >
> >                 device_property_read_u32(tmpdev, "imod-interval-ns",
> >                                          &xhci->imod_interval);
> > +               device_property_read_u16(tmpdev, "num-hc-interrupters",
> > +                                        &xhci->max_interrupters);
> >         }
> >
> >         /*
> >
> 
> 

------rHPRFtJkdx5CiZJP2v5Cn8OZ9YZY2B0tfPkXi2gvBl6TiQFm=_6a647_
Content-Type: text/plain; charset="utf-8"


------rHPRFtJkdx5CiZJP2v5Cn8OZ9YZY2B0tfPkXi2gvBl6TiQFm=_6a647_--

