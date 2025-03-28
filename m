Return-Path: <linux-input+bounces-11331-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CD79CA744AE
	for <lists+linux-input@lfdr.de>; Fri, 28 Mar 2025 08:47:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0AC283B2B71
	for <lists+linux-input@lfdr.de>; Fri, 28 Mar 2025 07:47:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93E2C212B2E;
	Fri, 28 Mar 2025 07:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="xM3+fQuP"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C239F211A2E
	for <linux-input@vger.kernel.org>; Fri, 28 Mar 2025 07:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743148047; cv=none; b=hEi3ylZvhaw42LTDHv3OCHuRSppYjWEqV3qMRimyooO9YxwxsTBOzkYoPP5l/vWpNsBFzT8aLVTgsTgQNi+SIq/5gORhE4caEJOsAAIhzgl4K+liEDKdTD7rRZ5F2LENxEx0fCUApUWMetlgxQh4QI0Zvq1Ww7T9nO+81E2nWCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743148047; c=relaxed/simple;
	bh=PtP+NGCGW7qLVQ3maqLF1JTTzGIcq5Q0+GUEyuhMre4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AhqJZss4JNMFX5FIO1cFR6LBXskHuKEmeaUrMqZT+l37de2ubEhILhlga+ixyztkfYtEPa5hxoZRbJvimYK9l8WN0GJfWyDqSYK0dbqH0AdLUFfUmDJvbqxT0tCNTgG6VBidhO3m5JpXzvkrdxDRCEyrms9SEVDZI6S8uQccY8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=xM3+fQuP; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-224171d6826so47884325ad.3
        for <linux-input@vger.kernel.org>; Fri, 28 Mar 2025 00:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743148045; x=1743752845; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nSRNCHHEeuWVfsyhWJ175d+kGZyBEPrk7OGj2+IPcUM=;
        b=xM3+fQuP8P8ZfbhsG+LCJA/H0VyHCf0zyyEmszt1M/dLLh8Ry0mQ0ZtOG20T1q8evf
         K2dsjBJedhy/AUnc/FQE3ENj2bFv1/+z1lZsbj0w228k5WMIQcJJzyFp/nDoNyn7lDgW
         i55vuF2iRRCuUeVTUgHhaJU4r1fA9aVLYcSzW/AFkbVtpB5n4nfLw+ljLdVzr5I/mj0r
         sfQUXEbHsIsuw54BmwrFOQwu2y0LWJHtQ3QsL1mEJB00QsBfMKrxVRm81qSO/N4jRJTL
         MPZj0S8+NYYnqM97xV9M5jBLtO1VyOoznRnDAiCS/65LXt9MgjaZo3rnMs1ze8oYc0NQ
         WqZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743148045; x=1743752845;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nSRNCHHEeuWVfsyhWJ175d+kGZyBEPrk7OGj2+IPcUM=;
        b=cRYbPkQcfKw+L3dv4le6FXhc2RrbQ+khK+uWuX3OFIHFMGoV1L/WHH7+rEGOcSARr5
         iRpMCktZzXEYoM+53a5kqYjsYGYbsl8tUfxfzMoDczgQfH/Y1MMyGIW8bNa20CNoSJVT
         yT1fHGTGuVhCwoqvIQlogN6iGWDbGcTOrhfW9xM6h75LZ7T7w2bJuDcfF0qSn2G2uuxY
         Ft9XX69xSqbbV/BATseb2mouCRvWA+Q/TdygDF+zuA350rtDgPh/xKj633Wu035UeUEo
         Nj7jeT9lQ0bPX657CU3vNcB0SrDwBy419xhTet8YxzC0zJMIJiNNZSvlcYNbYqiu83M6
         A+NA==
X-Forwarded-Encrypted: i=1; AJvYcCXZ/eTvOxHU21ksoaAJsiF4Ps1V8Y28j4FfPqx1ODH+RmozA4cgWwgMzY0ICk9u3SLmSK5HIprcWl1h/g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxttb7atNFExmkWjkihVpvLuwaRcXs3sFwaMgx5nr5LoehuE9A7
	CeZtyRMO1/P3IuYl7x6GCtgDHtBl/T0btRpb/mz9qAzCa0FtQl7PCOG/4hO0AY7vsiE+65R8XhR
	1vx1pqpQ7hSLrEXjpSG8V93WnnQ0pUJGj6pXB
X-Gm-Gg: ASbGncuO/QiK0FV0xphhHBHblF5BCuj2zWb2FRCINwkosk14FabtvshBGCJQPE9i8zO
	cbsu6lXAysL57u3ROeQ/bzVZDp9NQD9l5HbchO55vJBcHF8XLOtbt0XSNXOXuZWarTPRsZqjajQ
	8wzgASLqtHSnjtukmMIaT9+pTegUeax3O9+wXck9nZKaYIr46teEEiOuVO
X-Google-Smtp-Source: AGHT+IFjlntASsIZFKKFarjsob5FA/YWx+0UwMbHPg7tbz1FC4RqdXsuMvg0Aor7xktvtHSjvCWuvoZcUzL+GRvbomQ=
X-Received: by 2002:a17:90b:4a02:b0:2ff:72f8:3708 with SMTP id
 98e67ed59e1d1-303a815d765mr10177056a91.17.1743148044642; Fri, 28 Mar 2025
 00:47:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250319005141.312805-1-quic_wcheng@quicinc.com> <20250319005141.312805-7-quic_wcheng@quicinc.com>
In-Reply-To: <20250319005141.312805-7-quic_wcheng@quicinc.com>
From: Puma Hsu <pumahsu@google.com>
Date: Fri, 28 Mar 2025 15:46:00 +0800
X-Gm-Features: AQ5f1Jqq_y-DoImoixkLsT9RYwh8uFNtxMSR53od-9VW8uNfYNhDBtnFa6MwHG4
Message-ID: <CAGCq0LaDzCVau0jZ8WydSFF7FVAAXuUHaR=3gPcteew6X4kP=g@mail.gmail.com>
Subject: Re: [PATCH v36 06/31] usb: dwc3: Specify maximum number of XHCI interrupters
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
> Allow for the DWC3 host driver to pass along XHCI property that defines
> how many interrupters to allocate.  This is in relation for the number of
> event rings that can be potentially used by other processors within the
> system.
>
> Acked-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>

Tested-by: Puma Hsu <pumahsu@google.com>

> ---
>  drivers/usb/dwc3/core.c | 12 ++++++++++++
>  drivers/usb/dwc3/core.h |  2 ++
>  drivers/usb/dwc3/host.c |  3 +++
>  3 files changed, 17 insertions(+)
>
> diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
> index 66a08b527165..17ae5c13fe36 100644
> --- a/drivers/usb/dwc3/core.c
> +++ b/drivers/usb/dwc3/core.c
> @@ -1699,6 +1699,7 @@ static void dwc3_get_properties(struct dwc3 *dwc)
>         u8                      tx_thr_num_pkt_prd =3D 0;
>         u8                      tx_max_burst_prd =3D 0;
>         u8                      tx_fifo_resize_max_num;
> +       u16                     num_hc_interrupters;
>
>         /* default to highest possible threshold */
>         lpm_nyet_threshold =3D 0xf;
> @@ -1719,6 +1720,9 @@ static void dwc3_get_properties(struct dwc3 *dwc)
>          */
>         tx_fifo_resize_max_num =3D 6;
>
> +       /* default to a single XHCI interrupter */
> +       num_hc_interrupters =3D 1;
> +
>         dwc->maximum_speed =3D usb_get_maximum_speed(dev);
>         dwc->max_ssp_rate =3D usb_get_maximum_ssp_rate(dev);
>         dwc->dr_mode =3D usb_get_dr_mode(dev);
> @@ -1765,6 +1769,12 @@ static void dwc3_get_properties(struct dwc3 *dwc)
>                                 &tx_thr_num_pkt_prd);
>         device_property_read_u8(dev, "snps,tx-max-burst-prd",
>                                 &tx_max_burst_prd);
> +       device_property_read_u16(dev, "num-hc-interrupters",
> +                                &num_hc_interrupters);
> +       /* DWC3 core allowed to have a max of 8 interrupters */
> +       if (num_hc_interrupters > 8)
> +               num_hc_interrupters =3D 8;
> +
>         dwc->do_fifo_resize =3D device_property_read_bool(dev,
>                                                         "tx-fifo-resize")=
;
>         if (dwc->do_fifo_resize)
> @@ -1851,6 +1861,8 @@ static void dwc3_get_properties(struct dwc3 *dwc)
>         dwc->tx_max_burst_prd =3D tx_max_burst_prd;
>
>         dwc->tx_fifo_resize_max_num =3D tx_fifo_resize_max_num;
> +
> +       dwc->num_hc_interrupters =3D num_hc_interrupters;
>  }
>
>  /* check whether the core supports IMOD */
> diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
> index aaa39e663f60..fbe83914d9f9 100644
> --- a/drivers/usb/dwc3/core.h
> +++ b/drivers/usb/dwc3/core.h
> @@ -1083,6 +1083,7 @@ struct dwc3_scratchpad_array {
>   * @tx_max_burst_prd: max periodic ESS transmit burst size
>   * @tx_fifo_resize_max_num: max number of fifos allocated during txfifo =
resize
>   * @clear_stall_protocol: endpoint number that requires a delayed status=
 phase
> + * @num_hc_interrupters: number of host controller interrupters
>   * @hsphy_interface: "utmi" or "ulpi"
>   * @connected: true when we're connected to a host, false otherwise
>   * @softconnect: true when gadget connect is called, false when disconne=
ct runs
> @@ -1330,6 +1331,7 @@ struct dwc3 {
>         u8                      tx_max_burst_prd;
>         u8                      tx_fifo_resize_max_num;
>         u8                      clear_stall_protocol;
> +       u16                     num_hc_interrupters;
>
>         const char              *hsphy_interface;
>
> diff --git a/drivers/usb/dwc3/host.c b/drivers/usb/dwc3/host.c
> index b48e108fc8fe..1c513bf8002e 100644
> --- a/drivers/usb/dwc3/host.c
> +++ b/drivers/usb/dwc3/host.c
> @@ -182,6 +182,9 @@ int dwc3_host_init(struct dwc3 *dwc)
>         if (DWC3_VER_IS_WITHIN(DWC3, ANY, 300A))
>                 props[prop_idx++] =3D PROPERTY_ENTRY_BOOL("quirk-broken-p=
ort-ped");
>
> +       props[prop_idx++] =3D PROPERTY_ENTRY_U16("num-hc-interrupters",
> +                                              dwc->num_hc_interrupters);
> +
>         if (prop_idx) {
>                 ret =3D device_create_managed_software_node(&xhci->dev, p=
rops, NULL);
>                 if (ret) {
>

