Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CFD8520ED44
	for <lists+linux-input@lfdr.de>; Tue, 30 Jun 2020 07:16:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726019AbgF3FQX (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 30 Jun 2020 01:16:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725845AbgF3FQX (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 30 Jun 2020 01:16:23 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32E4BC061755;
        Mon, 29 Jun 2020 22:16:23 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id d10so8002973pls.5;
        Mon, 29 Jun 2020 22:16:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=KRE9HsVlW2ijkl1bDdvucGdd1+JiCPkhH6g/2ZjIZAo=;
        b=hZU0yUL1AN1k4PEsFBvtVzeLaj4e39AO8qO24WkHVfTj+4cSk+/I/gRZksRFSG0P5F
         ct2PWPUBlKDpPzKRGDul3OMYXd0g7RDTDruf/E28UZb71mT5tfbUls8ysYiRT8G65UYH
         WXr7i62LjidQPmb9tKyxxDCYw6/jEN+foXc0rarHW0s9FI9ntM4/09tLYurk9cIomrF6
         iaytL1nO0crq0BiNqX/aY8kQMu9EyFLT9nGa3Sv7drPToQYKBcmLglC8YQL8jj0EQXze
         sV0E0H43baIXcZvb10l3oMrx165I5YBkqUbl5R8JibP4SRnUYfRDOwJRIYqH+XxgHCt0
         ZWOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=KRE9HsVlW2ijkl1bDdvucGdd1+JiCPkhH6g/2ZjIZAo=;
        b=esL9aE/fJ9hNUt60vCbhaLei/gSPMWSuXD07D6WdMzZoQm33oqrnGoLaBmelM8sLwm
         rDMepjM19ftytNOtu52naZvC24MHnBFQoAVNoMYHH6fFaiAhDpRyBRilsearq2wyaMtz
         uTwrLQR5Y6THaBuxFjbHfxYyXj0hN+daz1jSDR8UYStRXBSWD3rWg19Ww+zTnB0cY++5
         +w5Hvf0mwdxSy3Tw3ymXKVKy6IcYEN08rru+HOs3OPkTFTDKU13a//zBYhoMbv0eIQ+u
         7wxUJhVH4fH45quNeEV6MZqaueHVUXM+Lj9Dpm5mKT89uf8WnsIUcvi0Kt9PwMn2+D4y
         y17g==
X-Gm-Message-State: AOAM531GtaYzO1ajJxuz+XiLFTaYW1kZXAbheGQ5JuhpT1jI8Fh4yybp
        JtYVcjt5oIvgp0pOy8unGfnaNdqN
X-Google-Smtp-Source: ABdhPJz5L6z5VGRh2LLZ5I+cwIBdPBP86ivSnmaciY39M5h8VH4ZPau1l7IsaW3SrtWjGT73gxu7mQ==
X-Received: by 2002:a17:902:aa97:: with SMTP id d23mr16732653plr.128.1593494181579;
        Mon, 29 Jun 2020 22:16:21 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3c2a:73a9:c2cf:7f45])
        by smtp.gmail.com with ESMTPSA id u24sm1289938pga.47.2020.06.29.22.16.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2020 22:16:20 -0700 (PDT)
Date:   Mon, 29 Jun 2020 22:16:19 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Derek Basehore <dbasehore@chromium.org>
Cc:     jiada_wang@mentor.com, jeffrey.l.hugo@gmail.com,
        benjamin.tissoires@redhat.com, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: elan_i2c - only increment wakeup count on touch
Message-ID: <20200630051619.GG248110@dtor-ws>
References: <20200630005707.2181126-1-dbasehore@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200630005707.2181126-1-dbasehore@chromium.org>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Jun 29, 2020 at 05:57:07PM -0700, Derek Basehore wrote:
> This moves the wakeup increment for elan devices to the touch report.
> This prevents the drivers from incorrectly reporting a wakeup when the
> resume callback resets then device, which causes an interrupt to
> occur. This also avoids error messages when these interrupts occur,
> since this behavior is expected.
> 
> Signed-off-by: Derek Basehore <dbasehore@chromium.org>
> ---
>  drivers/input/mouse/elan_i2c_core.c | 16 +++++++++++++---
>  1 file changed, 13 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/input/mouse/elan_i2c_core.c b/drivers/input/mouse/elan_i2c_core.c
> index cdbe6b38c73c1..6ad53a75f9807 100644
> --- a/drivers/input/mouse/elan_i2c_core.c
> +++ b/drivers/input/mouse/elan_i2c_core.c
> @@ -49,6 +49,7 @@
>  
>  #define ETP_MAX_FINGERS		5
>  #define ETP_FINGER_DATA_LEN	5
> +#define ETP_REPORT_LEN_OFFSET	0
>  #define ETP_REPORT_ID		0x5D
>  #define ETP_TP_REPORT_ID	0x5E
>  #define ETP_REPORT_ID_OFFSET	2
> @@ -1018,6 +1019,8 @@ static void elan_report_absolute(struct elan_tp_data *data, u8 *packet)
>  	u8 hover_info = packet[ETP_HOVER_INFO_OFFSET];
>  	bool contact_valid, hover_event;
>  
> +	pm_wakeup_event(&data->client->dev, 0);
> +
>  	hover_event = hover_info & 0x40;
>  	for (i = 0; i < ETP_MAX_FINGERS; i++) {
>  		contact_valid = tp_info & (1U << (3 + i));
> @@ -1041,6 +1044,8 @@ static void elan_report_trackpoint(struct elan_tp_data *data, u8 *report)
>  	u8 *packet = &report[ETP_REPORT_ID_OFFSET + 1];
>  	int x, y;
>  
> +	pm_wakeup_event(&data->client->dev, 0);
> +
>  	if (!data->tp_input) {
>  		dev_warn_once(&data->client->dev,
>  			      "received a trackpoint report while no trackpoint device has been created. Please report upstream.\n");
> @@ -1065,7 +1070,6 @@ static void elan_report_trackpoint(struct elan_tp_data *data, u8 *report)
>  static irqreturn_t elan_isr(int irq, void *dev_id)
>  {
>  	struct elan_tp_data *data = dev_id;
> -	struct device *dev = &data->client->dev;
>  	int error;
>  	u8 report[ETP_MAX_REPORT_LEN];
>  
> @@ -1083,7 +1087,13 @@ static irqreturn_t elan_isr(int irq, void *dev_id)
>  	if (error)
>  		goto out;
>  
> -	pm_wakeup_event(dev, 0);
> +	/*
> +	 * Controllers may send a full length report on power on and reset
> +	 * cases. There are only meaningless bytes in these reports except for
> +	 * report[ETP_REPORT_LEN_OFFSET], which is 0.
> +	 */

Is this true for all versions of firmware? Also, should we pay attention
to the value of this field for various types of reports?

> +	if (!report[ETP_REPORT_LEN_OFFSET])
> +		goto out;
>  
>  	switch (report[ETP_REPORT_ID_OFFSET]) {
>  	case ETP_REPORT_ID:
> @@ -1093,7 +1103,7 @@ static irqreturn_t elan_isr(int irq, void *dev_id)
>  		elan_report_trackpoint(data, report);
>  		break;
>  	default:
> -		dev_err(dev, "invalid report id data (%x)\n",
> +		dev_err(&data->client->dev, "invalid report id data (%x)\n",
>  			report[ETP_REPORT_ID_OFFSET]);
>  	}
>  
> -- 
> 2.27.0.212.ge8ba1cc988-goog
> 

Thanks.

-- 
Dmitry
