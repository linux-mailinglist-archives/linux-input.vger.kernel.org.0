Return-Path: <linux-input+bounces-11445-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BD48A77557
	for <lists+linux-input@lfdr.de>; Tue,  1 Apr 2025 09:42:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 292F31699EF
	for <lists+linux-input@lfdr.de>; Tue,  1 Apr 2025 07:42:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0E1C1E98E1;
	Tue,  1 Apr 2025 07:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="el7jmsNc"
X-Original-To: linux-input@vger.kernel.org
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B50191E5739
	for <linux-input@vger.kernel.org>; Tue,  1 Apr 2025 07:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743493334; cv=none; b=bUqXo7H6SU6FLpMVwWqaLoM9eqxLXLWUjxJdTGtMF9q0152HTrpY2MqJFEoGyIyTeYtLYtCXVAhmsrX3SnQ8U+lnZQLqotFpSAM1QMGi8YPM2IeTb/pxIa2kcrtI436VT+niQvN7lSuB2lybN9SNRJf+IqjrAf1B3mWmpcIV5zE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743493334; c=relaxed/simple;
	bh=tIFK+3yX1N52rVyVYsyrLS5V03imaENadYff5CElmVY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:In-Reply-To:
	 Content-Type:References; b=Y6pzGBQGpLwoDA3ToxpX4Ztoif8eEbwY3Dem6EgpFYpLqQchucyjRnDgAmjx2516g/Ekn+hCkhCxrG4ISBIP2eopJfJtp66WhAyvmSrQtl7Lnjb06PO/Ynlap038cx3M7pXo5Qu7y7O+kdeLMaoM7ihROAHEOHLxEg0vmYMWlNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=el7jmsNc; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250401074211epoutp02798ed16afebc590ed5510ec8c1277604~yIfJ53hUK0910309103epoutp02B
	for <linux-input@vger.kernel.org>; Tue,  1 Apr 2025 07:42:11 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250401074211epoutp02798ed16afebc590ed5510ec8c1277604~yIfJ53hUK0910309103epoutp02B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1743493331;
	bh=MslZtcObdYTc1VWJM7r15z8hIJ+NfbRaIHX9INRhToI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=el7jmsNc6ZpMRF8t/ibEwKQwl1UsBqNC2OLhFad2HDebcdTwTUGtqSSc3OpLD/qoj
	 nAuI8CSUGMrFMpAKIWbbUCIBlvUHdUbFMR1VCJDlR0V9tvvdC0XboMyskQ6DDRge3R
	 4+/DmWN95Pq2RZRUgxaU0OX31d4lQ2ZHAansp0EU=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPS id
	20250401074210epcas2p4ce3ff86dc47cfb73b282542e22b15571~yIfJLO0gt2425924259epcas2p4F;
	Tue,  1 Apr 2025 07:42:10 +0000 (GMT)
Received: from epsmges2p2.samsung.com (unknown [182.195.36.70]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4ZRg1s4Dhzz6B9m7; Tue,  1 Apr
	2025 07:42:09 +0000 (GMT)
Received: from epcas2p3.samsung.com ( [182.195.41.55]) by
	epsmges2p2.samsung.com (Symantec Messaging Gateway) with SMTP id
	D1.17.10159.1D89BE76; Tue,  1 Apr 2025 16:42:09 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
	20250401074209epcas2p3e12589ecd078b29271a0ada8fec64c17~yIfIAH_1S2348423484epcas2p3m;
	Tue,  1 Apr 2025 07:42:09 +0000 (GMT)
Received: from epsmgmcp1.samsung.com (unknown [182.195.42.82]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20250401074208epsmtrp29ea03c71ff8e27e7c91591a03197b388~yIfH_8Gwc1545715457epsmtrp2W;
	Tue,  1 Apr 2025 07:42:08 +0000 (GMT)
X-AuditID: b6c32a46-9e9ff700000027af-b1-67eb98d1e6b7
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgmcp1.samsung.com (Symantec Messaging Gateway) with SMTP id
	DD.3B.19478.0D89BE76; Tue,  1 Apr 2025 16:42:08 +0900 (KST)
Received: from ubuntu (unknown [10.229.95.128]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20250401074208epsmtip18151212bb03f4882af326d8789bdc175~yIfHvsfC91475414754epsmtip1a;
	Tue,  1 Apr 2025 07:42:08 +0000 (GMT)
Date: Tue, 1 Apr 2025 16:51:21 +0900
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
Subject: Re: [PATCH v36 02/31] usb: host: xhci-mem: Cleanup pending
 secondary event ring events
Message-ID: <20250401075121.GC98772@ubuntu>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <CAGCq0LYh13qaPpuM0jPyu2LV+EXqJrfoKvD-TOuhkZYScFnTNg@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Brightmail-Tracker: H4sIAAAAAAAAA01TfVCTdRzvt2d79oBOn6bAT6ig0dVBB26DsQeEtAvoIbXg0i7Tjp7gcZvA
	tttLot0VBYEiESiUTFFg3CAOghtgbIGwjQjypCPESxM6BBbDw0iKF3uhbQ92/Pe5z8v35fe9
	H4bwK7mBmEKpozVKKluA+rKvOMKkESPn78mEq1XBROXkNEo09wyziOm+IkBc7h/mEI66WUDk
	G1tRwmWYQImlG6dYRHnvdS5RW1jPJm49WOIQo9aLKFHtrECIOtMnCJFvruAQp62fcYiHa04W
	UdUSSpi/KeUQa91dXKJwYIBDNNX0cYm25RawJ4C0GMa5ZI1ZTxq7XSzS3HQaJe/c7EbJS0Np
	ZG91M5c0lp7jkFfnTShZ3v0B2doxxiY7ehcBuWh+KpX3Vla8nKYyaU0IrcxQZSqUsgTB3tfT
	X0qXxAhFEaJYQioIUVI5dIIgcV9qRLIi2726IOQ9KlvvplIprVaw84V4jUqvo0PkKq0uQUCr
	M7PVUnWklsrR6pWySCWtixMJhWKJ2/hOlrx8pQNRf5qU+/MvjZw8MCYuBj4YxKPhZds5UAx8
	MT7eBWD98m/AI/DxBwB+fD+KEdzYfqsBfZQwfV68brIAODDoz5imAay9mMf2CGz8GThhavMG
	UDwcTqwMIh68HX8a/jFTxPIEEHyIDQft33orbcMpaPxx2Wvi4c9Dy7U+lMGPw6GqaW9RHzwN
	Wkr6uMUAw/zcDeZsH3rqQLzdB04NTnGY6RJhgfkMl8Hb4Nx3Hes4EC7e71nfQAtv/+pEmHAB
	gI1zBQgjREGDs8g7EILLYae1mONpBvFQ2H+bzdBb4CnHP1yG5sFThXwmGQq/GC1bH2EHtN0b
	RhgLCetH2Mz7lLBg6U8laBkINmzYzLChmcEdQfAw2GrdydDBML/zAsLQQbDhX2yDowagTcCf
	VmtzZLRWrBb/f/YMVY4ZeP9HeHIXqJhfiLQDFgbsAGKIYDvvzT9dMj4vkzpxktao0jX6bFpr
	BxL3ycqRQL8MlfuDKXXpouhYYXRMjEgqlgilggCe/fcZGR+XUTo6i6bVtOZRjoX5BOax5Ir3
	Ta7nQrIOhB992XIWWKJzd310OHlN7u4fZV+tcvjHH6m9VIUF6XcjgTFhXwPrV0502jRhrcav
	LC4PG7H+pdiDfJu65q+Zg+Kk3Y6Rpe9/wAvIMefeQ1teXQVbbWlv1G2eWLyufDelfd9Zel75
	Cn92yHVGd7OyKG7HpgRFjY+f1XVsU7d+ZfRQaebd5s13c088Fus7EH5s4XjjgRbJeEvj1i8v
	xAWfnDp8BH+ttS2A6k3Z8zBJ//aqeth2ZxfrSbLh6kKYYj5l/7Nlx2eeuJYad1Qn6ez5u6GB
	NmuDbhRlSVfzipQv7k87r5AkKh1+Frx6oGKocdA42aGYHZ9slwvYWjklCkc0Wuo/7fzoH6gE
	AAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrKIsWRmVeSWpSXmKPExsWy7bCSnO6FGa/TDS5tNLeY+vAJm8WaveeY
	LJ4caGe0mH/kHKvF4UUvGC2aF69ns3g56x6bxbcrHUwWE/efZbdY2LaExeLmp2+sFpd3zWGz
	mPtsCrPFomWtzBbNm6awWnTu6me1+PX/GZPFzLXKFpt297Fa/N+zg92i7dgxVotVCw6wW2z4
	vpbRQdxj56y77B4LNpV6LN7zkslj06pONo871/awecw7Geixf+4ado/FfZNZPfa9XcbmMXFP
	ncf6LVdZPLbs/8zo8XmTXABvFJdNSmpOZllqkb5dAlfGo1OBBeudKlqnn2RpYJxs0MXIySEh
	YCKxbFoXYxcjF4eQwHZGiS092xghEpISS+feYIewhSXutxxhhSh6xChxuKWPFSTBIqAicW/Z
	BjYQm01AS+LejxPMILaIgKLEl6ftTCANzAInWSROHDoKNlVYIFFiy69HYA28AtoSO08fYIOY
	2sMkMenRFKiEoMTJmU9YQGxmAXWJP/MuAU3lALKlJZb/44AIy0s0b50NtoxTIFBiZ88BdpAS
	UaCDXh2sn8AoNAvJoFlIBs1CGDQLyaAFjCyrGEVTC4pz03OTCwz1ihNzi0vz0vWS83M3MYJT
	glbQDsZl6//qHWJk4mA8xCjBwawkwhvx9WW6EG9KYmVValF+fFFpTmrxIUZpDhYlcV7lnM4U
	IYH0xJLU7NTUgtQimCwTB6dUA9OaFWKxCZ6fYqctl+e+8rJ56c+S876fc1ufLpqir88y+buQ
	l8EXXe4mv0OLDGe6zKvc/cTBctkRqQsZfaJzVofLH9aNU1BZE2d2PZvz67MygdLyy9+OiepY
	Kt37xrDYQfXsZW8f+/d6sayc1+9+ip2wMn2JwJmPBxmTonafjpizaqLNfJ4llqoszs27dmoJ
	TlNbfm5PmKEah8VdLra5OxniCrJ9Orh3H1L6ePHCin+19+KncuvMmuyzUUzlWP2U5efN/t+Q
	OeWaPPHDq2nTrTNmlhelz3ovvf5FxE17yRiby5Z8R10+T4rqav3YkeHooNHSt//rbe/8/U2C
	jRr+ibVdTK4lbiqzok+mn/WQdFFiKc5INNRiLipOBAAoLLaIeAMAAA==
X-CMS-MailID: 20250401074209epcas2p3e12589ecd078b29271a0ada8fec64c17
X-Msg-Generator: CA
Content-Type: multipart/mixed;
	boundary="----BWvmtLGreXPtZv31XE49129YoyRr4_KGUd.k-ILdCyGA2LCZ=_6a90d_"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250328074220epcas2p171e1c0fba466b1122033543ad11fb8d4
References: <20250319005141.312805-1-quic_wcheng@quicinc.com>
	<20250319005141.312805-3-quic_wcheng@quicinc.com>
	<CGME20250328074220epcas2p171e1c0fba466b1122033543ad11fb8d4@epcas2p1.samsung.com>
	<CAGCq0LYh13qaPpuM0jPyu2LV+EXqJrfoKvD-TOuhkZYScFnTNg@mail.gmail.com>

------BWvmtLGreXPtZv31XE49129YoyRr4_KGUd.k-ILdCyGA2LCZ=_6a90d_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Disposition: inline

On Fri, Mar 28, 2025 at 03:42:00PM +0800, Puma Hsu wrote:
> On Wed, Mar 19, 2025 at 8:53 AM Wesley Cheng <quic_wcheng@quicinc.com> wrote:
> >
> > As part of xHCI bus suspend, the xHCI is halted.  However, if there are
> > pending events in the secondary event ring, it is observed that the xHCI
> > controller stops responding to further commands upon host or device
> > initiated bus resume.  Iterate through all pending events and update the
> > dequeue pointer to the beginning of the event ring.
> >
> > Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> 
> Tested-by: Puma Hsu <pumahsu@google.com>
> 

 Tested-by: Daehwan Jung <dh10.jung@samsung.com>

> > ---
> >  drivers/usb/host/xhci-mem.c  |  7 +++++-
> >  drivers/usb/host/xhci-ring.c | 47 ++++++++++++++++++++++++++++++------
> >  drivers/usb/host/xhci.c      |  2 +-
> >  drivers/usb/host/xhci.h      |  7 ++++++
> >  4 files changed, 54 insertions(+), 9 deletions(-)
> >
> > diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
> > index d698095fc88d..daea0f76e844 100644
> > --- a/drivers/usb/host/xhci-mem.c
> > +++ b/drivers/usb/host/xhci-mem.c
> > @@ -1805,7 +1805,7 @@ xhci_remove_interrupter(struct xhci_hcd *xhci, struct xhci_interrupter *ir)
> >                 tmp &= ERST_SIZE_MASK;
> >                 writel(tmp, &ir->ir_set->erst_size);
> >
> > -               xhci_write_64(xhci, ERST_EHB, &ir->ir_set->erst_dequeue);
> > +               xhci_update_erst_dequeue(xhci, ir, true);
> >         }
> >  }
> >
> > @@ -1848,6 +1848,11 @@ void xhci_remove_secondary_interrupter(struct usb_hcd *hcd, struct xhci_interrup
> >                 return;
> >         }
> >
> > +       /*
> > +        * Cleanup secondary interrupter to ensure there are no pending events.
> > +        * This also updates event ring dequeue pointer back to the start.
> > +        */
> > +       xhci_skip_sec_intr_events(xhci, ir->event_ring, ir);
> >         intr_num = ir->intr_num;
> >
> >         xhci_remove_interrupter(xhci, ir);
> > diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
> > index 5d64c297721c..bfef765dd78c 100644
> > --- a/drivers/usb/host/xhci-ring.c
> > +++ b/drivers/usb/host/xhci-ring.c
> > @@ -3054,9 +3054,9 @@ static int xhci_handle_event_trb(struct xhci_hcd *xhci, struct xhci_interrupter
> >   * - When all events have finished
> >   * - To avoid "Event Ring Full Error" condition
> >   */
> > -static void xhci_update_erst_dequeue(struct xhci_hcd *xhci,
> > -                                    struct xhci_interrupter *ir,
> > -                                    bool clear_ehb)
> > +void xhci_update_erst_dequeue(struct xhci_hcd *xhci,
> > +                             struct xhci_interrupter *ir,
> > +                             bool clear_ehb)
> >  {
> >         u64 temp_64;
> >         dma_addr_t deq;
> > @@ -3099,10 +3099,11 @@ static void xhci_clear_interrupt_pending(struct xhci_interrupter *ir)
> >   * Handle all OS-owned events on an interrupter event ring. It may drop
> >   * and reaquire xhci->lock between event processing.
> >   */
> > -static int xhci_handle_events(struct xhci_hcd *xhci, struct xhci_interrupter *ir)
> > +static int xhci_handle_events(struct xhci_hcd *xhci, struct xhci_interrupter *ir,
> > +                             bool skip_events)
> >  {
> >         int event_loop = 0;
> > -       int err;
> > +       int err = 0;
> >         u64 temp;
> >
> >         xhci_clear_interrupt_pending(ir);
> > @@ -3125,7 +3126,8 @@ static int xhci_handle_events(struct xhci_hcd *xhci, struct xhci_interrupter *ir
> >
> >         /* Process all OS owned event TRBs on this event ring */
> >         while (unhandled_event_trb(ir->event_ring)) {
> > -               err = xhci_handle_event_trb(xhci, ir, ir->event_ring->dequeue);
> > +               if (!skip_events)
> > +                       err = xhci_handle_event_trb(xhci, ir, ir->event_ring->dequeue);
> >
> >                 /*
> >                  * If half a segment of events have been handled in one go then
> > @@ -3152,6 +3154,37 @@ static int xhci_handle_events(struct xhci_hcd *xhci, struct xhci_interrupter *ir
> >         return 0;
> >  }
> >
> > +/*
> > + * Move the event ring dequeue pointer to skip events kept in the secondary
> > + * event ring.  This is used to ensure that pending events in the ring are
> > + * acknowledged, so the xHCI HCD can properly enter suspend/resume.  The
> > + * secondary ring is typically maintained by an external component.
> > + */
> > +void xhci_skip_sec_intr_events(struct xhci_hcd *xhci,
> > +                              struct xhci_ring *ring,  struct xhci_interrupter *ir)
> > +{
> > +       union xhci_trb *current_trb;
> > +       u64 erdp_reg;
> > +       dma_addr_t deq;
> > +
> > +       /* disable irq, ack pending interrupt and ack all pending events */
> > +       xhci_disable_interrupter(ir);
> > +
> > +       /* last acked event trb is in erdp reg  */
> > +       erdp_reg = xhci_read_64(xhci, &ir->ir_set->erst_dequeue);
> > +       deq = (dma_addr_t)(erdp_reg & ERST_PTR_MASK);
> > +       if (!deq) {
> > +               xhci_err(xhci, "event ring handling not required\n");
> > +               return;
> > +       }
> > +
> > +       current_trb = ir->event_ring->dequeue;
> > +       /* read cycle state of the last acked trb to find out CCS */
> > +       ring->cycle_state = le32_to_cpu(current_trb->event_cmd.flags) & TRB_CYCLE;
> > +
> > +       xhci_handle_events(xhci, ir, true);
> > +}
> > +
> >  /*
> >   * xHCI spec says we can get an interrupt, and if the HC has an error condition,
> >   * we might get bad data out of the event ring.  Section 4.10.2.7 has a list of
> > @@ -3196,7 +3229,7 @@ irqreturn_t xhci_irq(struct usb_hcd *hcd)
> >         writel(status, &xhci->op_regs->status);
> >
> >         /* This is the handler of the primary interrupter */
> > -       xhci_handle_events(xhci, xhci->interrupters[0]);
> > +       xhci_handle_events(xhci, xhci->interrupters[0], false);
> >  out:
> >         spin_unlock(&xhci->lock);
> >
> > diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
> > index 83a4adf57bae..61950a350432 100644
> > --- a/drivers/usb/host/xhci.c
> > +++ b/drivers/usb/host/xhci.c
> > @@ -335,7 +335,7 @@ static int xhci_enable_interrupter(struct xhci_interrupter *ir)
> >         return 0;
> >  }
> >
> > -static int xhci_disable_interrupter(struct xhci_interrupter *ir)
> > +int xhci_disable_interrupter(struct xhci_interrupter *ir)
> >  {
> >         u32 iman;
> >
> > diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
> > index 39db228f0b84..3fa8669e3b2d 100644
> > --- a/drivers/usb/host/xhci.h
> > +++ b/drivers/usb/host/xhci.h
> > @@ -1856,6 +1856,9 @@ xhci_create_secondary_interrupter(struct usb_hcd *hcd, unsigned int segs,
> >                                   u32 imod_interval);
> >  void xhci_remove_secondary_interrupter(struct usb_hcd
> >                                        *hcd, struct xhci_interrupter *ir);
> > +void xhci_skip_sec_intr_events(struct xhci_hcd *xhci,
> > +                              struct xhci_ring *ring,
> > +                              struct xhci_interrupter *ir);
> >
> >  /* xHCI host controller glue */
> >  typedef void (*xhci_get_quirks_t)(struct device *, struct xhci_hcd *);
> > @@ -1895,6 +1898,7 @@ int xhci_alloc_tt_info(struct xhci_hcd *xhci,
> >                 struct usb_tt *tt, gfp_t mem_flags);
> >  int xhci_set_interrupter_moderation(struct xhci_interrupter *ir,
> >                                     u32 imod_interval);
> > +int xhci_disable_interrupter(struct xhci_interrupter *ir);
> >
> >  /* xHCI ring, segment, TRB, and TD functions */
> >  dma_addr_t xhci_trb_virt_to_dma(struct xhci_segment *seg, union xhci_trb *trb);
> > @@ -1939,6 +1943,9 @@ unsigned int count_trbs(u64 addr, u64 len);
> >  int xhci_stop_endpoint_sync(struct xhci_hcd *xhci, struct xhci_virt_ep *ep,
> >                             int suspend, gfp_t gfp_flags);
> >  void xhci_process_cancelled_tds(struct xhci_virt_ep *ep);
> > +void xhci_update_erst_dequeue(struct xhci_hcd *xhci,
> > +                             struct xhci_interrupter *ir,
> > +                             bool clear_ehb);
> >
> >  /* xHCI roothub code */
> >  void xhci_set_link_state(struct xhci_hcd *xhci, struct xhci_port *port,
> >
> 
> 

------BWvmtLGreXPtZv31XE49129YoyRr4_KGUd.k-ILdCyGA2LCZ=_6a90d_
Content-Type: text/plain; charset="utf-8"


------BWvmtLGreXPtZv31XE49129YoyRr4_KGUd.k-ILdCyGA2LCZ=_6a90d_--

