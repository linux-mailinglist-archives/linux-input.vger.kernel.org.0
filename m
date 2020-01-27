Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 23A13149E3A
	for <lists+linux-input@lfdr.de>; Mon, 27 Jan 2020 03:24:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726743AbgA0CYw (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 26 Jan 2020 21:24:52 -0500
Received: from mail-pj1-f66.google.com ([209.85.216.66]:39274 "EHLO
        mail-pj1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726670AbgA0CYw (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 26 Jan 2020 21:24:52 -0500
Received: by mail-pj1-f66.google.com with SMTP id e11so2457444pjt.4
        for <linux-input@vger.kernel.org>; Sun, 26 Jan 2020 18:24:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=u194R8lc/bvge1d+T0GxbdcgrTcf+sAetB6uzNPeyFA=;
        b=nf03nJFKa94lNpkytKSvS2gEjdLFPJSfJQBWi3FCDN941pHSKwdeo+FNysAZzKdJs6
         mb/VP1eRO6H8yZEAp4EPXtUDSOxNpSQN5kL34TZBWtxO6iCfaG/nhuIj76JQAqyRVyJ5
         Ng10Y2Mcw+nRbRMEx2dDztwGlLDJ767IhOtfaNL7Dy+3iHJaN7jnQWmGxRhe+6320dA4
         vN6SjICvNbp98Lkey98Mi9kRfuZpZDkRWf4xs7PVjg0cpXXfZ61q9cbKyoyHMVccR1c6
         1T9n+xsLlkGcEjDlrUxYGiLcCsBKNlo/xuYdp2plUIOn3dg33dPl9ebik2a2cEwGB5Uh
         bMyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=u194R8lc/bvge1d+T0GxbdcgrTcf+sAetB6uzNPeyFA=;
        b=aCWdq7Dr6yio5p4rk7YgG7KzefUDmF4va0YD20PAdWgz9Odo5HuyGCGGfvY2oT22Hh
         H/tss0q5HIg5+ZQas+Vlozf51awzJeeuY0+QCUznufNYrJInqn+cndWOhSRkvF475ChC
         xHdo4K4AyBmdgvlBiuOHHE1GjviDcQmVOC2cAiUEXtoWpT6q0v0c8W061MSDQP4Zc6Fw
         uPIAWrPh57TlrIO6RSCTPjY0fkoSbNsAtYzv3V3n4ZGnQbEUiBwTb8apojyRAdgQMYNt
         usfZBrisRB38tQB7eHRXRusMa/UbzKwy9CL4V2dwjhcSsCriFDr/bK6a17m9XMniEH4C
         FsYg==
X-Gm-Message-State: APjAAAUuOHbm4QdUfM3LjAMdqBzrF2AIGrO1ZlM4huvGLay+DlLMryjk
        om7WuO9I7eU/mrebwlwc+O3Akv1x
X-Google-Smtp-Source: APXvYqzpgNV1HnUSQCvxsJQa45cTP/OsjVcmJHuMAknja6dSWC3MXS23CXCHsQobzq5dFP8gjV8dXw==
X-Received: by 2002:a17:90a:da03:: with SMTP id e3mr12331845pjv.100.1580091891116;
        Sun, 26 Jan 2020 18:24:51 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id d4sm13240561pjg.19.2020.01.26.18.24.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jan 2020 18:24:50 -0800 (PST)
Date:   Sun, 26 Jan 2020 18:24:48 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Lucas Stach <l.stach@pengutronix.de>,
        Andrew Duggan <aduggan@synaptics.com>
Cc:     linux-input@vger.kernel.org, kernel@pengutronix.de,
        patchwork-lst@pengutronix.de
Subject: Re: [PATCH] Input: synaptics-rmi4 - switch to reduced reporting mode
Message-ID: <20200127022448.GC184237@dtor-ws>
References: <20200120111628.18376-1-l.stach@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200120111628.18376-1-l.stach@pengutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Jan 20, 2020 at 12:16:28PM +0100, Lucas Stach wrote:
> When the distance thresholds are set the controller must be in reduced
> reporting mode for them to have any effect on the interrupt generation.
> This has a potentially large impact on the number of events the host
> needs to process.
> 
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> ---
> I'm not sure if we want a separate DT property to allow the use of
> reduced reporting mode, as this change might lead to problems for
> controllers with unreasonably large threshold values. I'm not sure if
> any controller with bogus threshold values exist in the wild.
> ---

Andrew, any feedback on this patch?

Thanks!

>  drivers/input/rmi4/rmi_f11.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/drivers/input/rmi4/rmi_f11.c b/drivers/input/rmi4/rmi_f11.c
> index bbf9ae9f3f0c..6adea8a3e8fb 100644
> --- a/drivers/input/rmi4/rmi_f11.c
> +++ b/drivers/input/rmi4/rmi_f11.c
> @@ -412,6 +412,10 @@ struct f11_2d_sensor_queries {
>  
>  /* Defs for Ctrl0. */
>  #define RMI_F11_REPORT_MODE_MASK        0x07
> +#define RMI_F11_REPORT_MODE_CONTINUOUS  (0 << 0)
> +#define RMI_F11_REPORT_MODE_REDUCED     (1 << 0)
> +#define RMI_F11_REPORT_MODE_FS_CHANGE   (2 << 0)
> +#define RMI_F11_REPORT_MODE_FP_CHANGE   (3 << 0)
>  #define RMI_F11_ABS_POS_FILT            (1 << 3)
>  #define RMI_F11_REL_POS_FILT            (1 << 4)
>  #define RMI_F11_REL_BALLISTICS          (1 << 5)
> @@ -1195,6 +1199,16 @@ static int rmi_f11_initialize(struct rmi_function *fn)
>  		ctrl->ctrl0_11[RMI_F11_DELTA_Y_THRESHOLD] =
>  			sensor->axis_align.delta_y_threshold;
>  
> +	/*
> +	 * If distance threshold values are set, switch to reduced reporting
> +	 * mode so they actually get used by the controller.
> +	 */
> +	if (ctrl->ctrl0_11[RMI_F11_DELTA_X_THRESHOLD] ||
> +	    ctrl->ctrl0_11[RMI_F11_DELTA_Y_THRESHOLD]) {
> +		ctrl->ctrl0_11[0] &= ~RMI_F11_REPORT_MODE_MASK;
> +		ctrl->ctrl0_11[0] |= RMI_F11_REPORT_MODE_REDUCED;
> +	}
> +
>  	if (f11->sens_query.has_dribble) {
>  		switch (sensor->dribble) {
>  		case RMI_REG_STATE_OFF:
> -- 
> 2.20.1
> 

-- 
Dmitry
