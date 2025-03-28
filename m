Return-Path: <linux-input+bounces-11327-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 81619A74469
	for <lists+linux-input@lfdr.de>; Fri, 28 Mar 2025 08:42:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5AADD1B600BB
	for <lists+linux-input@lfdr.de>; Fri, 28 Mar 2025 07:42:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87140211A2E;
	Fri, 28 Mar 2025 07:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="we3eulPU"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 748BE211A00
	for <linux-input@vger.kernel.org>; Fri, 28 Mar 2025 07:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743147727; cv=none; b=ncWxDHj3ZRLgnCBdu2boVeAXYSKpzu3CYvtgMCuoI/nOq5Mny/UyENPedlxaGSJ4LiX2DR99PRvHTyjSB0WLbx5Z1TgWP5tvr70vpavgCQjOurft2UW1WQOJp6tS1GHLGotCmdFSzdQOuFjrL8LVvR3jp9vJbV+6PmjDfmty5dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743147727; c=relaxed/simple;
	bh=1OylK3DGw3fSW1DCNUixEMNZGTPEQ/ir67BOdKYdL8c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gdRR35iY3IEJqcl67COo96ilGN8GprV1S8PkZJlwZ7ffPD9E+ltAPaK4r/6WzNEvbM0yfnCpImY1htMg2D8URc3Jst7A/VSyvrIePC0ewfKKErXtsfbDMunArew4grJh23/VmAUIiuY4QKIGzPo3TJx9INYjUKgfxY2DnmMLpL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=we3eulPU; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-30155bbbed9so2385919a91.1
        for <linux-input@vger.kernel.org>; Fri, 28 Mar 2025 00:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743147724; x=1743752524; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tsf7T6GOy/qgiJ4ewThBgUfHabvCY8b0VuUhOLMruus=;
        b=we3eulPUcSBEaH551cLf2Cy92+aZnYerAycTmUU77Zdh40pNkQXLqpXJ5ZpJ5kLymr
         ZKOrxgwElbecRcIq2U26MU4MLrcrhZ2lIFT3SpWZsywgCRUtjmTBlzM/zB7Y3mnclpza
         D1aNyrcgMJjTfh8dQQMSsuZ/ZzTFpUTdYNAX9sUu25Z7tJO4L1K86YAU5NBjpPI/b1yQ
         7b7/rNW6jpGZXUKTDBpxeuYMQpvHyPy8qvRWccQ8w9M/pfTZUTkm1poCzUNnVvpXPZIN
         BvHh23gdwjOBhTGvPYMn+81WprLa2fdwqPi8Sjc+NGfd4gEhy8BLJRC9HFc4DhHVLzWl
         vZXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743147724; x=1743752524;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tsf7T6GOy/qgiJ4ewThBgUfHabvCY8b0VuUhOLMruus=;
        b=EgDuglVw3h9qw+AwWHUqlSNMo0jnzB+WW7LaWrSK4FxJFyeGb7MUonlEvpp/c4nffu
         k/pNStREH3ahbFeFvVyT8VeDboKSHRQscO0zixoxVhxR+9+/Z+6U8en7UHDxAiwzCiGD
         X0GXOHyT20Q6bz8nwI9Ia9UQrg0PWkr/phXKyoA20ulmI+L2qwtKunb/v0x2iypr/SBf
         APvYDNTb1NuJJdcQMm5vAqqHwWEAIMbnMOhEn6yEExVluplPG8I7RAS/x1LrE34bZP3Q
         2Prq399ic4ZEKldzYXn/koJ6c6D3NFkK28EEgA/VkM5kcg+943Qj+kiP9VSxzn/OuwwO
         N8rw==
X-Forwarded-Encrypted: i=1; AJvYcCVOUmB8uxeXj/R8KMZg69Fi18+sBGKrplfnusXYj02g41OvQHAHPWsZFpA8Zcu7w/ot7KpvuLd3eTWnaw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzx89lmb8eg1/lPc0anPpAXuzdt545TjNvK36TZn2BWt5lHKDWA
	mycoM2sMR0dXOZP5VICaj3xxlUm65gscJCXZ5PBoTUabM8gBW3r+PT0I7GeZPQacVGym9gez/AO
	vPz+5cOv+5z/B6P5UsFpRgVf3gVBih5c/+tGU
X-Gm-Gg: ASbGnct4vGUp7kOepEZhqkDdpzmosZk+QNrksRi6neHlezL8CmtF7RYwN/O1NJ7zWTy
	qK0STlEXnI2COcM4Z/RT6tUBEeVk8NfUenYLICkZBpLBMBeg6xyAsOB3XkBpUPXjcY6qLFgjOrQ
	MzIeNmvvlE81DD0mtmN5wiS4fy/9ucivPOfkYFX1O5BU281EscyEcElrez
X-Google-Smtp-Source: AGHT+IHUVZSJNZN3D2V31hwTLejPg8P5aNmvTBpjwwEaklGeOM/MnEpcP1E1HOG3Y6WUkKsuM6ojYVsKYT7V/0QolyM=
X-Received: by 2002:a17:90b:3d47:b0:2f8:34df:5652 with SMTP id
 98e67ed59e1d1-303a7f703e7mr8926066a91.21.1743147723354; Fri, 28 Mar 2025
 00:42:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250319005141.312805-1-quic_wcheng@quicinc.com> <20250319005141.312805-3-quic_wcheng@quicinc.com>
In-Reply-To: <20250319005141.312805-3-quic_wcheng@quicinc.com>
From: Puma Hsu <pumahsu@google.com>
Date: Fri, 28 Mar 2025 15:42:00 +0800
X-Gm-Features: AQ5f1Jrg9gTOy803CeskWFeIPBu-5GbtMNtuxub06NGzfZwp0UbNmEoTIVzDoSU
Message-ID: <CAGCq0LYh13qaPpuM0jPyu2LV+EXqJrfoKvD-TOuhkZYScFnTNg@mail.gmail.com>
Subject: Re: [PATCH v36 02/31] usb: host: xhci-mem: Cleanup pending secondary
 event ring events
To: Wesley Cheng <quic_wcheng@quicinc.com>
Cc: srinivas.kandagatla@linaro.org, mathias.nyman@intel.com, perex@perex.cz, 
	conor+dt@kernel.org, dmitry.torokhov@gmail.com, corbet@lwn.net, 
	broonie@kernel.org, lgirdwood@gmail.com, krzk+dt@kernel.org, 
	pierre-louis.bossart@linux.intel.com, Thinh.Nguyen@synopsys.com, 
	tiwai@suse.com, robh@kernel.org, gregkh@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-sound@vger.kernel.org, linux-input@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 19, 2025 at 8:53=E2=80=AFAM Wesley Cheng <quic_wcheng@quicinc.c=
om> wrote:
>
> As part of xHCI bus suspend, the xHCI is halted.  However, if there are
> pending events in the secondary event ring, it is observed that the xHCI
> controller stops responding to further commands upon host or device
> initiated bus resume.  Iterate through all pending events and update the
> dequeue pointer to the beginning of the event ring.
>
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>

Tested-by: Puma Hsu <pumahsu@google.com>

> ---
>  drivers/usb/host/xhci-mem.c  |  7 +++++-
>  drivers/usb/host/xhci-ring.c | 47 ++++++++++++++++++++++++++++++------
>  drivers/usb/host/xhci.c      |  2 +-
>  drivers/usb/host/xhci.h      |  7 ++++++
>  4 files changed, 54 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
> index d698095fc88d..daea0f76e844 100644
> --- a/drivers/usb/host/xhci-mem.c
> +++ b/drivers/usb/host/xhci-mem.c
> @@ -1805,7 +1805,7 @@ xhci_remove_interrupter(struct xhci_hcd *xhci, stru=
ct xhci_interrupter *ir)
>                 tmp &=3D ERST_SIZE_MASK;
>                 writel(tmp, &ir->ir_set->erst_size);
>
> -               xhci_write_64(xhci, ERST_EHB, &ir->ir_set->erst_dequeue);
> +               xhci_update_erst_dequeue(xhci, ir, true);
>         }
>  }
>
> @@ -1848,6 +1848,11 @@ void xhci_remove_secondary_interrupter(struct usb_=
hcd *hcd, struct xhci_interrup
>                 return;
>         }
>
> +       /*
> +        * Cleanup secondary interrupter to ensure there are no pending e=
vents.
> +        * This also updates event ring dequeue pointer back to the start=
.
> +        */
> +       xhci_skip_sec_intr_events(xhci, ir->event_ring, ir);
>         intr_num =3D ir->intr_num;
>
>         xhci_remove_interrupter(xhci, ir);
> diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
> index 5d64c297721c..bfef765dd78c 100644
> --- a/drivers/usb/host/xhci-ring.c
> +++ b/drivers/usb/host/xhci-ring.c
> @@ -3054,9 +3054,9 @@ static int xhci_handle_event_trb(struct xhci_hcd *x=
hci, struct xhci_interrupter
>   * - When all events have finished
>   * - To avoid "Event Ring Full Error" condition
>   */
> -static void xhci_update_erst_dequeue(struct xhci_hcd *xhci,
> -                                    struct xhci_interrupter *ir,
> -                                    bool clear_ehb)
> +void xhci_update_erst_dequeue(struct xhci_hcd *xhci,
> +                             struct xhci_interrupter *ir,
> +                             bool clear_ehb)
>  {
>         u64 temp_64;
>         dma_addr_t deq;
> @@ -3099,10 +3099,11 @@ static void xhci_clear_interrupt_pending(struct x=
hci_interrupter *ir)
>   * Handle all OS-owned events on an interrupter event ring. It may drop
>   * and reaquire xhci->lock between event processing.
>   */
> -static int xhci_handle_events(struct xhci_hcd *xhci, struct xhci_interru=
pter *ir)
> +static int xhci_handle_events(struct xhci_hcd *xhci, struct xhci_interru=
pter *ir,
> +                             bool skip_events)
>  {
>         int event_loop =3D 0;
> -       int err;
> +       int err =3D 0;
>         u64 temp;
>
>         xhci_clear_interrupt_pending(ir);
> @@ -3125,7 +3126,8 @@ static int xhci_handle_events(struct xhci_hcd *xhci=
, struct xhci_interrupter *ir
>
>         /* Process all OS owned event TRBs on this event ring */
>         while (unhandled_event_trb(ir->event_ring)) {
> -               err =3D xhci_handle_event_trb(xhci, ir, ir->event_ring->d=
equeue);
> +               if (!skip_events)
> +                       err =3D xhci_handle_event_trb(xhci, ir, ir->event=
_ring->dequeue);
>
>                 /*
>                  * If half a segment of events have been handled in one g=
o then
> @@ -3152,6 +3154,37 @@ static int xhci_handle_events(struct xhci_hcd *xhc=
i, struct xhci_interrupter *ir
>         return 0;
>  }
>
> +/*
> + * Move the event ring dequeue pointer to skip events kept in the second=
ary
> + * event ring.  This is used to ensure that pending events in the ring a=
re
> + * acknowledged, so the xHCI HCD can properly enter suspend/resume.  The
> + * secondary ring is typically maintained by an external component.
> + */
> +void xhci_skip_sec_intr_events(struct xhci_hcd *xhci,
> +                              struct xhci_ring *ring,  struct xhci_inter=
rupter *ir)
> +{
> +       union xhci_trb *current_trb;
> +       u64 erdp_reg;
> +       dma_addr_t deq;
> +
> +       /* disable irq, ack pending interrupt and ack all pending events =
*/
> +       xhci_disable_interrupter(ir);
> +
> +       /* last acked event trb is in erdp reg  */
> +       erdp_reg =3D xhci_read_64(xhci, &ir->ir_set->erst_dequeue);
> +       deq =3D (dma_addr_t)(erdp_reg & ERST_PTR_MASK);
> +       if (!deq) {
> +               xhci_err(xhci, "event ring handling not required\n");
> +               return;
> +       }
> +
> +       current_trb =3D ir->event_ring->dequeue;
> +       /* read cycle state of the last acked trb to find out CCS */
> +       ring->cycle_state =3D le32_to_cpu(current_trb->event_cmd.flags) &=
 TRB_CYCLE;
> +
> +       xhci_handle_events(xhci, ir, true);
> +}
> +
>  /*
>   * xHCI spec says we can get an interrupt, and if the HC has an error co=
ndition,
>   * we might get bad data out of the event ring.  Section 4.10.2.7 has a =
list of
> @@ -3196,7 +3229,7 @@ irqreturn_t xhci_irq(struct usb_hcd *hcd)
>         writel(status, &xhci->op_regs->status);
>
>         /* This is the handler of the primary interrupter */
> -       xhci_handle_events(xhci, xhci->interrupters[0]);
> +       xhci_handle_events(xhci, xhci->interrupters[0], false);
>  out:
>         spin_unlock(&xhci->lock);
>
> diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
> index 83a4adf57bae..61950a350432 100644
> --- a/drivers/usb/host/xhci.c
> +++ b/drivers/usb/host/xhci.c
> @@ -335,7 +335,7 @@ static int xhci_enable_interrupter(struct xhci_interr=
upter *ir)
>         return 0;
>  }
>
> -static int xhci_disable_interrupter(struct xhci_interrupter *ir)
> +int xhci_disable_interrupter(struct xhci_interrupter *ir)
>  {
>         u32 iman;
>
> diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
> index 39db228f0b84..3fa8669e3b2d 100644
> --- a/drivers/usb/host/xhci.h
> +++ b/drivers/usb/host/xhci.h
> @@ -1856,6 +1856,9 @@ xhci_create_secondary_interrupter(struct usb_hcd *h=
cd, unsigned int segs,
>                                   u32 imod_interval);
>  void xhci_remove_secondary_interrupter(struct usb_hcd
>                                        *hcd, struct xhci_interrupter *ir)=
;
> +void xhci_skip_sec_intr_events(struct xhci_hcd *xhci,
> +                              struct xhci_ring *ring,
> +                              struct xhci_interrupter *ir);
>
>  /* xHCI host controller glue */
>  typedef void (*xhci_get_quirks_t)(struct device *, struct xhci_hcd *);
> @@ -1895,6 +1898,7 @@ int xhci_alloc_tt_info(struct xhci_hcd *xhci,
>                 struct usb_tt *tt, gfp_t mem_flags);
>  int xhci_set_interrupter_moderation(struct xhci_interrupter *ir,
>                                     u32 imod_interval);
> +int xhci_disable_interrupter(struct xhci_interrupter *ir);
>
>  /* xHCI ring, segment, TRB, and TD functions */
>  dma_addr_t xhci_trb_virt_to_dma(struct xhci_segment *seg, union xhci_trb=
 *trb);
> @@ -1939,6 +1943,9 @@ unsigned int count_trbs(u64 addr, u64 len);
>  int xhci_stop_endpoint_sync(struct xhci_hcd *xhci, struct xhci_virt_ep *=
ep,
>                             int suspend, gfp_t gfp_flags);
>  void xhci_process_cancelled_tds(struct xhci_virt_ep *ep);
> +void xhci_update_erst_dequeue(struct xhci_hcd *xhci,
> +                             struct xhci_interrupter *ir,
> +                             bool clear_ehb);
>
>  /* xHCI roothub code */
>  void xhci_set_link_state(struct xhci_hcd *xhci, struct xhci_port *port,
>

