Return-Path: <linux-input+bounces-11446-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5094BA7755F
	for <lists+linux-input@lfdr.de>; Tue,  1 Apr 2025 09:42:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 83993188B584
	for <lists+linux-input@lfdr.de>; Tue,  1 Apr 2025 07:43:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0836D1A23A4;
	Tue,  1 Apr 2025 07:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="QjyRLe/z"
X-Original-To: linux-input@vger.kernel.org
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50FBD1E8353
	for <linux-input@vger.kernel.org>; Tue,  1 Apr 2025 07:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743493365; cv=none; b=Lpi4jlCKmoab0Dedpuu/gJ8+ePFe00+q5zhzalmMzJ73wFqP0FvFK2iu4upjRUZ3+otqVlNFCauXCaZTzA2p9HMb8NZg7u/SM1BHuugfYgxfxoa8v4kXZbdLOCxoI9O7YV8/2pL2d2YbMW8wPbFvw8h8Vhi/c/OAB+5FKNsOKKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743493365; c=relaxed/simple;
	bh=6q/HbpAweXnSeHcrIqfSUcyp8+9MUyCLzP+rvCO8oKw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:In-Reply-To:
	 Content-Type:References; b=MOBgNaxvqgga2BIPFqf6xZbiHVPjdppa429kLXT5GFwUPgZiw11EDRjBXA1yO2EYVz4xZuPKi3vm42wZWbNr3a4KDb3dXSocQtdAcbyJ/M4xlLXDmX82ke3J0C3ZH4wvc+AqoXgF9R9RyQeV4jdbXBlNgoZBlNFcOROAgfNgD3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=QjyRLe/z; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250401074241epoutp04311b98ee5a0f47d3758992828dccb1c7~yIfmTyYT12204022040epoutp04S
	for <linux-input@vger.kernel.org>; Tue,  1 Apr 2025 07:42:41 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250401074241epoutp04311b98ee5a0f47d3758992828dccb1c7~yIfmTyYT12204022040epoutp04S
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1743493361;
	bh=ug5HtNeYPBYZI4JJIK62QeyGZ2VeFTryEqlDN2Ijxa0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=QjyRLe/z2RQEtTG1Wg01I54aXKWQnHv1gVp7stnhugWRpBmlgg/fP2rlFhXYHrLP3
	 h/+isepfD3ws1M0cp39usnqFya3yohdg8vxFs1dn1Xnrx3jpWp6JxtCzT8XM8XAjJQ
	 ySfizL1alu58DveXkZ2v3cP7C+elBaRsw/dW8goM=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTPS id
	20250401074240epcas2p1782b3fb2e23b536bba5281e0c6af962e~yIflVRfad3196431964epcas2p1w;
	Tue,  1 Apr 2025 07:42:40 +0000 (GMT)
Received: from epsmges2p2.samsung.com (unknown [182.195.36.102]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4ZRg2R6Hygz2SSKs; Tue,  1 Apr
	2025 07:42:39 +0000 (GMT)
Received: from epcas2p1.samsung.com ( [182.195.41.53]) by
	epsmges2p2.samsung.com (Symantec Messaging Gateway) with SMTP id
	FC.67.10159.FE89BE76; Tue,  1 Apr 2025 16:42:39 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTPA id
	20250401074239epcas2p1c482643c73b9cfe748b0d60a5ec694af~yIfj93cYT0439604396epcas2p1L;
	Tue,  1 Apr 2025 07:42:39 +0000 (GMT)
Received: from epsmgmc1p1new.samsung.com (unknown [182.195.42.40]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20250401074239epsmtrp18f8e490ac4d5263e0c0c0f367d4ae6b1~yIfj8ry6k2992429924epsmtrp1s;
	Tue,  1 Apr 2025 07:42:39 +0000 (GMT)
X-AuditID: b6c32a46-9fefd700000027af-35-67eb98ef51c9
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgmc1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	6E.AA.07818.EE89BE76; Tue,  1 Apr 2025 16:42:38 +0900 (KST)
Received: from ubuntu (unknown [10.229.95.128]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20250401074238epsmtip19a872a548a4003ed0e6718da1fd90273~yIfjnxL6r1533515335epsmtip1M;
	Tue,  1 Apr 2025 07:42:38 +0000 (GMT)
Date: Tue, 1 Apr 2025 16:51:51 +0900
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
Subject: Re: [PATCH v36 03/31] usb: host: xhci-mem: Allow for interrupter
 clients to choose specific index
Message-ID: <20250401075151.GD98772@ubuntu>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <CAGCq0LZBDa9H6wQhvmM3twAJwM_z_XWEy=-N9mp=HA4e+9Ee0g@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Brightmail-Tracker: H4sIAAAAAAAAA02Te0xTdxTHub3tvQXS5cpDf2NmsEIyLa+WUXolgnsouclcAjEZxBihlksh
	lLb0FiZb3NwopRCeGSpUxQ425hpIZ1MJIMhzYAdrNtlLRDYVK4WQImjtYNKVXlz473O+v/M9
	53d+Jz82HHQBDWMXyNWkSi6WcZEAZvfofmGss3lJym+Z4+Pn7s8jeOeAjYHPD1VC+JUxGwsf
	bVuA8PJ2E4I79HMI7vpVx8AbB39C8a+0XzPxO6suFj7ddwnBL9ubYLytowLGy81NLLyqr56F
	r3vsDLylKxI336hj4Z7+HhTXjo+zcKNhCMW/f94Fvb2H6NXfQwmDuYRo73cwCLOxCiFmf+9H
	iFZrBjF4uRMl2uu+ZBE3lzsQorH/U8Jk+Y1JWAbXIGLN/Ho653jhwXxSnEuqIki5RJFbIJem
	cN8/lv1etjCJL4gVHMBF3Ai5uIhM4R4+mh6bViDzjs6NKBXLSrxSupiiuPGpB1WKEjUZka+g
	1ClcUpkrU4qUcZS4iCqRS+PkpDpZwOcnCL2JOYX57r9diNIgOG17cJ11FjJxqyF/NsASgWv1
	LrMaCmAHYT0QmNXMwnSwCoHmodrtwAWB+uZvoJeWVuckgz4YgMDaReu2fx4Cd90PmFtZTCwK
	3NE5kC1GMB6Yc9+CtzgEewM8fVTpc8OYlQlujfzgKxuMycDQuXXGFnOwaGAZuI3SvAtYW+Z9
	Rf2xDDDVpfcymx3qbbA4/Bl9oxv+4F9PFs2HgdFp2b5pMFicsKA0hwFHvXabKTDz2O4bDWAa
	CFxd1MD0wVtAb6/0mWEsH1y7rWFt9QJYJBibYdLyK0A3+gKlZQ7QaYNoZyS4MN3AovlVMLxk
	265IAKO9AqHfp4YBKhZH0QYoXL9jMv2ObnpvWRjbD0x98bQcDsqvX4Rp+TXw7SZ7R4YBQozQ
	blJJFUlJKkGZ8P/iJYoiM+T7Iby0HqhpeSVuBGKwoREIsGFuCCfrmUMaxMkVl31MqhTZqhIZ
	SY1AQu/KGuGwUInC+8Xk6mxB4gF+YlKSQJQg5Iu4ezgjTx5JgzCpWE0WkqSSVL30Mdj+YWcZ
	kkDBRlvaiuRmzZHNpJjyN3t3fyLqTX3IdHfYDSYupya5Lu9olMI2FbhrX1Z0aUFV3kTwZPGo
	48SHxvjnkefhTEtAsqCuwvO5xoX+ol0Q86wJtsRu0wfK7ktXKb9rwfcdUYYTZgvH1dqp+jNl
	r86J5o0vdkp+5q2fCuSf/vFdRtOZmMal0uBU4VR0cZRho0CSWZtT5nTovluJqK7cPNMo1V4p
	u1ceuZDx5EjDyeLZ6YwZd/tyyGD4ST+537EJz5jfw9DazL/Uf0AerTCtvn59at/wXhfmdH1k
	LZvcGI7J0zw9dNwd/8Ily+Y/VouGHYe0Q89ymt+p+uJUkpL3T46Gy6TyxQIerKLE/wFy0odi
	qgQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrJIsWRmVeSWpSXmKPExsWy7bCSnO67Ga/TDS5PNraY+vAJm8WaveeY
	LJ4caGe0mH/kHKvF4UUvGC2aF69ns3g56x6bxbcrHUwWE/efZbdY2LaExeLmp2+sFpd3zWGz
	mPtsCrPFomWtzBbNm6awWnTu6me1+PX/GZPFzLXKFpt297Fa/N+zg92i7dgxVotVCw6wW2z4
	vpbRQdxj56y77B4LNpV6LN7zkslj06pONo871/awecw7Geixf+4ado/FfZNZPfa9XcbmMXFP
	ncf6LVdZPLbs/8zo8XmTXABvFJdNSmpOZllqkb5dAlfG60cnGQsO6VXcunuGvYHxrXwXIyeH
	hICJxLz3p5lAbCGB3YwSvz4oQ8QlJZbOvcEOYQtL3G85wtrFyAVU84hRYtvDMywgCRYBFYmb
	HS/ZQGw2AS2Jez9OMIPYIgKKEl+etjOBNDALnGSROHHoKCNIQlggR+LA1F9g23gFtCW27L3E
	DjG1h0mib/d2RoiEoMTJmU/ANjALqEv8mXcJaCoHkC0tsfwfB0RYXqJ562ywZZwCgRJn1s5i
	ASkRBTro1cH6CYxCs5AMmoVk0CyEQbOQDFrAyLKKUTK1oDg3PTfZsMAwL7Vcrzgxt7g0L10v
	OT93EyM4NWhp7GB8961J/xAjEwfjIUYJDmYlEd6Iry/ThXhTEiurUovy44tKc1KLDzFKc7Ao
	ifOuNIxIFxJITyxJzU5NLUgtgskycXBKNTCFH9o4//nE7aGHur8Uub3oSRGPrM9bIfn8RMEV
	y1ahlyV31gf8eBnXa1eZud3c0d/lQA7H9ZUBqg5/r+kaR05+PE1l97NrRY9EGBNXvd5kyHa1
	4cDttfFMp6SiyuSfvygWd2Pvf6h6QS3/0bSmras+nPWbtC11zrP4s0u23VX5nvCL+1bWqZqg
	inlpzX1bbtlWb3W/yPyuSZkvZrn7Kcv/Hz7EWjJU32mu21ZS0HZKUtRtnmRbBIPuym+LD7Hc
	26ljyBnZa5Fke657od6TrDfFHHkHmG5cY6yeFvzd+Y6ek+iEujNuKgUc2/gO5krmfN9ZZWQp
	//Pgvd9/c0o1hRbcMvB7f052e2T9cfN7dUxKLMUZiYZazEXFiQB3x8GzfAMAAA==
X-CMS-MailID: 20250401074239epcas2p1c482643c73b9cfe748b0d60a5ec694af
X-Msg-Generator: CA
Content-Type: multipart/mixed;
	boundary="----BWvmtLGreXPtZv31XE49129YoyRr4_KGUd.k-ILdCyGA2LCZ=_6a925_"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250328074451epcas2p274baf04127875cef3a233c62d7e7e511
References: <20250319005141.312805-1-quic_wcheng@quicinc.com>
	<20250319005141.312805-4-quic_wcheng@quicinc.com>
	<CGME20250328074451epcas2p274baf04127875cef3a233c62d7e7e511@epcas2p2.samsung.com>
	<CAGCq0LZBDa9H6wQhvmM3twAJwM_z_XWEy=-N9mp=HA4e+9Ee0g@mail.gmail.com>

------BWvmtLGreXPtZv31XE49129YoyRr4_KGUd.k-ILdCyGA2LCZ=_6a925_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Disposition: inline

On Fri, Mar 28, 2025 at 03:43:00PM +0800, Puma Hsu wrote:
> On Wed, Mar 19, 2025 at 8:59 AM Wesley Cheng <quic_wcheng@quicinc.com> wrote:
> >
> > Some clients may operate only on a specific XHCI interrupter instance.
> > Allow for the associated class driver to request for the interrupter that
> > it requires.
> >
> > Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> 
> Tested-by: Puma Hsu <pumahsu@google.com>
> 

Tested-by: Daehwan Jung <dh10.jung@samsung.com>

> > ---
> >  drivers/usb/host/xhci-mem.c       | 24 ++++++++++++++----------
> >  drivers/usb/host/xhci-sideband.c  |  5 +++--
> >  drivers/usb/host/xhci.h           |  2 +-
> >  include/linux/usb/xhci-sideband.h |  2 +-
> >  4 files changed, 19 insertions(+), 14 deletions(-)
> >
> > diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
> > index daea0f76e844..ed36df46b140 100644
> > --- a/drivers/usb/host/xhci-mem.c
> > +++ b/drivers/usb/host/xhci-mem.c
> > @@ -2331,14 +2331,15 @@ xhci_add_interrupter(struct xhci_hcd *xhci, struct xhci_interrupter *ir,
> >
> >  struct xhci_interrupter *
> >  xhci_create_secondary_interrupter(struct usb_hcd *hcd, unsigned int segs,
> > -                                 u32 imod_interval)
> > +                                 u32 imod_interval, unsigned int intr_num)
> >  {
> >         struct xhci_hcd *xhci = hcd_to_xhci(hcd);
> >         struct xhci_interrupter *ir;
> >         unsigned int i;
> >         int err = -ENOSPC;
> >
> > -       if (!xhci->interrupters || xhci->max_interrupters <= 1)
> > +       if (!xhci->interrupters || xhci->max_interrupters <= 1 ||
> > +           intr_num >= xhci->max_interrupters)
> >                 return NULL;
> >
> >         ir = xhci_alloc_interrupter(xhci, segs, GFP_KERNEL);
> > @@ -2346,15 +2347,18 @@ xhci_create_secondary_interrupter(struct usb_hcd *hcd, unsigned int segs,
> >                 return NULL;
> >
> >         spin_lock_irq(&xhci->lock);
> > -
> > -       /* Find available secondary interrupter, interrupter 0 is reserved for primary */
> > -       for (i = 1; i < xhci->max_interrupters; i++) {
> > -               if (xhci->interrupters[i] == NULL) {
> > -                       err = xhci_add_interrupter(xhci, ir, i);
> > -                       break;
> > +       if (!intr_num) {
> > +               /* Find available secondary interrupter, interrupter 0 is reserved for primary */
> > +               for (i = 1; i < xhci->max_interrupters; i++) {
> > +                       if (!xhci->interrupters[i]) {
> > +                               err = xhci_add_interrupter(xhci, ir, i);
> > +                               break;
> > +                       }
> >                 }
> > +       } else {
> > +               if (!xhci->interrupters[intr_num])
> > +                       err = xhci_add_interrupter(xhci, ir, intr_num);
> >         }
> > -
> >         spin_unlock_irq(&xhci->lock);
> >
> >         if (err) {
> > @@ -2370,7 +2374,7 @@ xhci_create_secondary_interrupter(struct usb_hcd *hcd, unsigned int segs,
> >                           i, imod_interval);
> >
> >         xhci_dbg(xhci, "Add secondary interrupter %d, max interrupters %d\n",
> > -                i, xhci->max_interrupters);
> > +                ir->intr_num, xhci->max_interrupters);
> >
> >         return ir;
> >  }
> > diff --git a/drivers/usb/host/xhci-sideband.c b/drivers/usb/host/xhci-sideband.c
> > index 19c58ae60414..742bbc6c2d9b 100644
> > --- a/drivers/usb/host/xhci-sideband.c
> > +++ b/drivers/usb/host/xhci-sideband.c
> > @@ -259,7 +259,7 @@ EXPORT_SYMBOL_GPL(xhci_sideband_get_event_buffer);
> >   */
> >  int
> >  xhci_sideband_create_interrupter(struct xhci_sideband *sb, int num_seg,
> > -                                bool ip_autoclear, u32 imod_interval)
> > +                                bool ip_autoclear, u32 imod_interval, int intr_num)
> >  {
> >         int ret = 0;
> >
> > @@ -273,7 +273,8 @@ xhci_sideband_create_interrupter(struct xhci_sideband *sb, int num_seg,
> >         }
> >
> >         sb->ir = xhci_create_secondary_interrupter(xhci_to_hcd(sb->xhci),
> > -                                                  num_seg, imod_interval);
> > +                                                  num_seg, imod_interval,
> > +                                                  intr_num);
> >         if (!sb->ir) {
> >                 ret = -ENOMEM;
> >                 goto out;
> > diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
> > index 3fa8669e3b2d..7eaabe4f6c87 100644
> > --- a/drivers/usb/host/xhci.h
> > +++ b/drivers/usb/host/xhci.h
> > @@ -1853,7 +1853,7 @@ void xhci_free_container_ctx(struct xhci_hcd *xhci,
> >                 struct xhci_container_ctx *ctx);
> >  struct xhci_interrupter *
> >  xhci_create_secondary_interrupter(struct usb_hcd *hcd, unsigned int segs,
> > -                                 u32 imod_interval);
> > +                                 u32 imod_interval, unsigned int intr_num);
> >  void xhci_remove_secondary_interrupter(struct usb_hcd
> >                                        *hcd, struct xhci_interrupter *ir);
> >  void xhci_skip_sec_intr_events(struct xhci_hcd *xhci,
> > diff --git a/include/linux/usb/xhci-sideband.h b/include/linux/usb/xhci-sideband.h
> > index 4b382af892fa..f8722afb8a2d 100644
> > --- a/include/linux/usb/xhci-sideband.h
> > +++ b/include/linux/usb/xhci-sideband.h
> > @@ -66,7 +66,7 @@ struct sg_table *
> >  xhci_sideband_get_event_buffer(struct xhci_sideband *sb);
> >  int
> >  xhci_sideband_create_interrupter(struct xhci_sideband *sb, int num_seg,
> > -                                bool ip_autoclear, u32 imod_interval);
> > +                                bool ip_autoclear, u32 imod_interval, int intr_num);
> >  void
> >  xhci_sideband_remove_interrupter(struct xhci_sideband *sb);
> >  int
> >
> 
> 

------BWvmtLGreXPtZv31XE49129YoyRr4_KGUd.k-ILdCyGA2LCZ=_6a925_
Content-Type: text/plain; charset="utf-8"


------BWvmtLGreXPtZv31XE49129YoyRr4_KGUd.k-ILdCyGA2LCZ=_6a925_--

