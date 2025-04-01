Return-Path: <linux-input+bounces-11449-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FC0BA77570
	for <lists+linux-input@lfdr.de>; Tue,  1 Apr 2025 09:44:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3BBC87A272D
	for <lists+linux-input@lfdr.de>; Tue,  1 Apr 2025 07:43:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 485DE1E991C;
	Tue,  1 Apr 2025 07:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="Hal1TquI"
X-Original-To: linux-input@vger.kernel.org
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 177571E98E1
	for <linux-input@vger.kernel.org>; Tue,  1 Apr 2025 07:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743493441; cv=none; b=eJvpN5livQsfeQU1dFw5bJeVk56bRcEyDxPdgNedG8eQ1Iz4T/UQ2GOp0jcepIUk6rgdV/W9G4lLa8WIe91xvmIuO7MXCk6GpqEUb4tWhJEEp4srEXKtS4l+Bfoyz+1suOSa2eV0Mk3jtlLGwcJw8smmY71Ccyu+1uDyn6nQAZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743493441; c=relaxed/simple;
	bh=lusxiB4Bjaj8R/c9BU47G8MCvRdyFszKY/L+YTNPDwU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:In-Reply-To:
	 Content-Type:References; b=KiTbIq1rWa7dpgEaO1vRmKmLyUJJHYVDFn4GPzwz29Fb0h08yV2+19FPuUsOUATeTBJoghL66DwexvELdoUdgSXQ3BbWQq0ed4Y1QohgebGJAEZlO4tZLsk204zcCtvHHZZiZjzGwYeLGCvfqtNRU8lw8gYpw8mKpW8ns1Fw/KY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=Hal1TquI; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20250401074357epoutp015ffd2c902ea72900e63b5b833a138072~yIgs1cPdW1157611576epoutp012
	for <linux-input@vger.kernel.org>; Tue,  1 Apr 2025 07:43:57 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20250401074357epoutp015ffd2c902ea72900e63b5b833a138072~yIgs1cPdW1157611576epoutp012
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1743493437;
	bh=q9tZFNfIbQkwSbFLLr9QuHBwTgnp8/iAM+LYD9NLzUw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Hal1TquIwAUwF/ycGoKLQIy2gw7C2FC8iNda8Wmuy6j85oSBLQUmnaLHwbAYBqtv+
	 WZzlm+KAPrRIFgyHWZ7P3CgPwS8GgV5F1P4BO98ryl5PkWY+ajjjKkrCROwrrSECRA
	 a4ZRKp7O5NtAgIKuAr1U5lL/jp2MLqXNi68wZ87c=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPS id
	20250401074356epcas2p4fc3e4e2f20ad12b7894c5fb6be31624d~yIgr3_c5W0326403264epcas2p4r;
	Tue,  1 Apr 2025 07:43:56 +0000 (GMT)
Received: from epsmgec2p1.samsung.com (unknown [182.195.36.69]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4ZRg3v46Brz6B9m9; Tue,  1 Apr
	2025 07:43:55 +0000 (GMT)
Received: from epcas2p4.samsung.com ( [182.195.41.56]) by
	epsmgec2p1.samsung.com (Symantec Messaging Gateway) with SMTP id
	F0.BA.09780.B399BE76; Tue,  1 Apr 2025 16:43:55 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
	20250401074354epcas2p46dd378281a462056317a4e265b54cbbb~yIgqkoVwR0326403264epcas2p4l;
	Tue,  1 Apr 2025 07:43:54 +0000 (GMT)
Received: from epsmgmc1p1new.samsung.com (unknown [182.195.42.40]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20250401074354epsmtrp19c5f4a69aef175a0e8b61bf5a7467b29~yIgqjhLBD3075130751epsmtrp1J;
	Tue,  1 Apr 2025 07:43:54 +0000 (GMT)
X-AuditID: b6c32a43-9b7fe70000002634-f6-67eb993b11e1
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgmc1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	2C.DA.07818.A399BE76; Tue,  1 Apr 2025 16:43:54 +0900 (KST)
Received: from ubuntu (unknown [10.229.95.128]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20250401074354epsmtip14840f27b62e47e71aa24c0c0836242c6~yIgqSjJul1529515295epsmtip1j;
	Tue,  1 Apr 2025 07:43:54 +0000 (GMT)
Date: Tue, 1 Apr 2025 16:53:07 +0900
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
Subject: Re: [PATCH v36 06/31] usb: dwc3: Specify maximum number of XHCI
 interrupters
Message-ID: <20250401075307.GG98772@ubuntu>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <CAGCq0LaDzCVau0jZ8WydSFF7FVAAXuUHaR=3gPcteew6X4kP=g@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Brightmail-Tracker: H4sIAAAAAAAAA01Tf1CTdRjvu/fdu4GhL6DyDS3G4K5EGBsy+EKAelC8JF5w1QUdhq/jdeMY
	Y26jE8pagoDECZTibUQSoCjxIxEQYQQMRdAgCrLENLyQHyOvBQqWCQ1e6vzv83ye5/P8vIeP
	OZ3kufKTVTpGo6KVQsIeb+nZgnxeNszIxfq/nkcn7o4TqLZjkIPGu3IBOnV5kIt6KqYAyqps
	INC08Q6B5kfyOKi4c4CHvsypwtHN2XkuGm77nEBlE8cxVHHmCIayGo9z0dG2Qi76e2mCgwx1
	Hqix/RgXLZlaeSint5eLasq7eOjrhTqww4W6ZLzNo8ob06lK0zSHaqw5SlC/3DAR1Bf9sVRn
	WS2Pqjz2GZf65v4Zgio2fUg1NP2IU02dc4Caa3whxuGdlBAFQycxGgGjkqUlJavkocJdbySG
	J0oDxBIfSRAKFApUdCoTKoyIjvF5NVlpG10oeI9WptuoGFqrFfqGhWjS0nWMQJGm1YUKGXWS
	Uh2oFmnpVG26Si5SMbpgiVjsJ7UF7k1R5I4N4+r6Fw/OjMxx9OD85nzA50PSHxpOJOcDe74T
	2QpgVunPOGvMAtg88ivBGvMA9llzefnAbkVh1D/AWEcHgKZb9wFrjANo+GESW47CSU9YMXQB
	LGOC9IJ3HvWt8OtJd/jgXi5nWYCR/TjsM19ZCXIm34bm7w7jy9iB3Aobqn4DLHaE/YbxFd6O
	jIWTnQPEcuMbbAUs3R8t54HkRTu4UDdMsO1FwILqEcBiZ2i52rTatiucLsxZxVo4OjmBseJs
	AM9asjHWsQ0aJ3JXxBipgKN9Yzi7JQ94eRRn6bUwr+cJj6UdYF6OE6v0gCeHi7gsfg52zwyu
	ZqTgkMW0usYCDqzTnyOKgJvxqdGMT1Uz2tJi5BbY0ObL0m4wq7kUY+lNsHqR/1REOSBqwEZG
	rU2VMzI/teT/w8vSUhvByod4hbeCkVOLIjPg8IEZQD4mXO8Q93Ba7uSQRGdkMpq0RE26ktGa
	gdR2s2LMdYMszfZiKl2ixD9I7B8QIAn0k4oDhS4O5j/vyZ1IOa1jUhhGzWj+03H4dq56zoDp
	pU0Zjn6cyHUFReFTQ70d+qh3g8WG+IuiLK6i8PuMhHP9Q57bH3vVH5S+ZQTh05bYrfvQ1ddK
	ftoWIO3KkT+Mev/uzV1B5/dm4KLX29+0ChZkVp/oa7fKCoMFGo6dS3WP77WdlGKNc6TM230h
	r8q7ub9id1gpKn3lUXKITO4yP2vVl0ij3PeXebaIIsd8Z/Txt51arL097Yeo65e2Z368Y+dU
	9oXOb29020ePlUy6XfeO/uBw8ZHY01bmkHNgAR8rodf+kb9uY4m67Nlget+TGUfl75Znvup8
	vEd0trbpdBz4JDMirD5u8+IiMOzf8+mBhH/WWKoTpuIP5JeXXzEm714S4loFLfHCNFr6X80v
	fn2qBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA02SfVDLcRzHfX9P+9WZfi30TadYcxHSnD++59kfzs/JnegoD6dZPxNbamvS
	zsOU8lw6605TSSVKXUwoRlmUzjV5yDEhylhRKHnK0rZz+u9978/r8/p8//jSuMBGjKNjYhM4
	ZaxELqTciat1Qr/ps7O7ZCFZr6eirDcdFCq7acZQR+0BgE7fMZOoruADQCmFFRSy6V9RqP/J
	QQxl1jTx0Jm0IgI9/9pPosfXcyiUa9XhqKA4FUcpBh2JDl3PINGvQSuGsssDkOFGOokGjVU8
	lFZfT6LS/Foeuvi9HCz0Zqv1L3lsvkHNFhptGGsoPUSxrU+NFJvXGMbW5Jbx2ML0EyR761Mx
	xWYa97AVlS0EW1nTC9heg98K/lr3udGcPGYHp5wxP8p9y2DXF15cs2hnw77nQAt6fA4DNxoy
	s6Be24cfBu60gLkBYG13A+ka+MCzuc94ruwFX++/Q7qgtwDmNvU4IYIRwYLmy8CRKSYIvvpx
	D3fk0cxE2PfuAOZYwJlGAt4z3XVCXswaaHqQTDgyn5kKK4ranb2AOYrBinMert4TNmZ3OBmc
	CYQDeY+GpPRQ9oXn7LSr9ocpV045b7kxYfB9TRPlQMYMvafz9t7jQKAfJtIPE+n/i/TDRPmA
	KAU+XJxKIVNIxXHiWC4xWCVRqNSxsmDpdoUBOH9D0OQq0N2fPMMEMBqYAKRx4Wh+xDebTMCP
	liRpOOX2jUq1nFOZgC9NCL35JeIImYCRSRK4bRwXxyn/TTHabZwWozb1ZT6Kx1LvXzPHVI6V
	i1fr382J1oZebY3a/PFtfq0uYCDQXsJZ+DrlBovVt5VsDzw9R3vJsnZk3sI8LxDgf5O6HWyn
	Ty6JJ3b1R7bNfBCpafOwLFq67PEf0adOaG2OCEmgBr6cpDyPpTXEfw2SRu3uzAqGiZ/9fodU
	tytHccYFGct9H07ZKNZJwi8WBq57olpgFbXAcLX0yKkJluJJuhFtt3beTeyRfm6ZV52UMwKT
	Y8szpnsr1OnJl2yXPRJWhsX4nxesGj95Wkt55w7cXqYwM1Wa1N/pUy5ozCvWd9kzXyT97K3T
	5LSN2esRqe02hh5jS+zYYtEVYuLWovokIaHaIhEH4UqV5C/Qe2kdfAMAAA==
X-CMS-MailID: 20250401074354epcas2p46dd378281a462056317a4e265b54cbbb
X-Msg-Generator: CA
Content-Type: multipart/mixed;
	boundary="----caUwc_dC5aEw_I.xGS0GMYyTEPKysFRHRKa1IoFNAgiy-i3F=_6aabf_"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250328074801epcas2p2e7ee72ce6b89d36681558ecce65ba71f
References: <20250319005141.312805-1-quic_wcheng@quicinc.com>
	<20250319005141.312805-7-quic_wcheng@quicinc.com>
	<CGME20250328074801epcas2p2e7ee72ce6b89d36681558ecce65ba71f@epcas2p2.samsung.com>
	<CAGCq0LaDzCVau0jZ8WydSFF7FVAAXuUHaR=3gPcteew6X4kP=g@mail.gmail.com>

------caUwc_dC5aEw_I.xGS0GMYyTEPKysFRHRKa1IoFNAgiy-i3F=_6aabf_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Disposition: inline

On Fri, Mar 28, 2025 at 03:46:00PM +0800, Puma Hsu wrote:
> On Wed, Mar 19, 2025 at 8:53 AM Wesley Cheng <quic_wcheng@quicinc.com> wrote:
> >
> > Allow for the DWC3 host driver to pass along XHCI property that defines
> > how many interrupters to allocate.  This is in relation for the number of
> > event rings that can be potentially used by other processors within the
> > system.
> >
> > Acked-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
> > Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> 
> Tested-by: Puma Hsu <pumahsu@google.com>
> 

Tested-by: Daehwan Jung <dh10.jung@samsung.com>

> > ---
> >  drivers/usb/dwc3/core.c | 12 ++++++++++++
> >  drivers/usb/dwc3/core.h |  2 ++
> >  drivers/usb/dwc3/host.c |  3 +++
> >  3 files changed, 17 insertions(+)
> >
> > diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
> > index 66a08b527165..17ae5c13fe36 100644
> > --- a/drivers/usb/dwc3/core.c
> > +++ b/drivers/usb/dwc3/core.c
> > @@ -1699,6 +1699,7 @@ static void dwc3_get_properties(struct dwc3 *dwc)
> >         u8                      tx_thr_num_pkt_prd = 0;
> >         u8                      tx_max_burst_prd = 0;
> >         u8                      tx_fifo_resize_max_num;
> > +       u16                     num_hc_interrupters;
> >
> >         /* default to highest possible threshold */
> >         lpm_nyet_threshold = 0xf;
> > @@ -1719,6 +1720,9 @@ static void dwc3_get_properties(struct dwc3 *dwc)
> >          */
> >         tx_fifo_resize_max_num = 6;
> >
> > +       /* default to a single XHCI interrupter */
> > +       num_hc_interrupters = 1;
> > +
> >         dwc->maximum_speed = usb_get_maximum_speed(dev);
> >         dwc->max_ssp_rate = usb_get_maximum_ssp_rate(dev);
> >         dwc->dr_mode = usb_get_dr_mode(dev);
> > @@ -1765,6 +1769,12 @@ static void dwc3_get_properties(struct dwc3 *dwc)
> >                                 &tx_thr_num_pkt_prd);
> >         device_property_read_u8(dev, "snps,tx-max-burst-prd",
> >                                 &tx_max_burst_prd);
> > +       device_property_read_u16(dev, "num-hc-interrupters",
> > +                                &num_hc_interrupters);
> > +       /* DWC3 core allowed to have a max of 8 interrupters */
> > +       if (num_hc_interrupters > 8)
> > +               num_hc_interrupters = 8;
> > +
> >         dwc->do_fifo_resize = device_property_read_bool(dev,
> >                                                         "tx-fifo-resize");
> >         if (dwc->do_fifo_resize)
> > @@ -1851,6 +1861,8 @@ static void dwc3_get_properties(struct dwc3 *dwc)
> >         dwc->tx_max_burst_prd = tx_max_burst_prd;
> >
> >         dwc->tx_fifo_resize_max_num = tx_fifo_resize_max_num;
> > +
> > +       dwc->num_hc_interrupters = num_hc_interrupters;
> >  }
> >
> >  /* check whether the core supports IMOD */
> > diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
> > index aaa39e663f60..fbe83914d9f9 100644
> > --- a/drivers/usb/dwc3/core.h
> > +++ b/drivers/usb/dwc3/core.h
> > @@ -1083,6 +1083,7 @@ struct dwc3_scratchpad_array {
> >   * @tx_max_burst_prd: max periodic ESS transmit burst size
> >   * @tx_fifo_resize_max_num: max number of fifos allocated during txfifo resize
> >   * @clear_stall_protocol: endpoint number that requires a delayed status phase
> > + * @num_hc_interrupters: number of host controller interrupters
> >   * @hsphy_interface: "utmi" or "ulpi"
> >   * @connected: true when we're connected to a host, false otherwise
> >   * @softconnect: true when gadget connect is called, false when disconnect runs
> > @@ -1330,6 +1331,7 @@ struct dwc3 {
> >         u8                      tx_max_burst_prd;
> >         u8                      tx_fifo_resize_max_num;
> >         u8                      clear_stall_protocol;
> > +       u16                     num_hc_interrupters;
> >
> >         const char              *hsphy_interface;
> >
> > diff --git a/drivers/usb/dwc3/host.c b/drivers/usb/dwc3/host.c
> > index b48e108fc8fe..1c513bf8002e 100644
> > --- a/drivers/usb/dwc3/host.c
> > +++ b/drivers/usb/dwc3/host.c
> > @@ -182,6 +182,9 @@ int dwc3_host_init(struct dwc3 *dwc)
> >         if (DWC3_VER_IS_WITHIN(DWC3, ANY, 300A))
> >                 props[prop_idx++] = PROPERTY_ENTRY_BOOL("quirk-broken-port-ped");
> >
> > +       props[prop_idx++] = PROPERTY_ENTRY_U16("num-hc-interrupters",
> > +                                              dwc->num_hc_interrupters);
> > +
> >         if (prop_idx) {
> >                 ret = device_create_managed_software_node(&xhci->dev, props, NULL);
> >                 if (ret) {
> >
> 
> 

------caUwc_dC5aEw_I.xGS0GMYyTEPKysFRHRKa1IoFNAgiy-i3F=_6aabf_
Content-Type: text/plain; charset="utf-8"


------caUwc_dC5aEw_I.xGS0GMYyTEPKysFRHRKa1IoFNAgiy-i3F=_6aabf_--

