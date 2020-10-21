Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E9A732953FE
	for <lists+linux-input@lfdr.de>; Wed, 21 Oct 2020 23:16:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2505968AbgJUVQw (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 21 Oct 2020 17:16:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2505965AbgJUVQw (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 21 Oct 2020 17:16:52 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2676EC0613CE;
        Wed, 21 Oct 2020 14:16:52 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id b26so2250340pff.3;
        Wed, 21 Oct 2020 14:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=LjEMR+RvxUAU+81ZngdDVY7KFUetPWRBhlcZRlrbWTM=;
        b=OtbvTaTjOhxeRj3LLmn0KyRuvranTgvXawtEOjZbnyotpxY/yFBKBDbhU6sQm9W8uo
         P24+/ASmVuB5gdow7ePMK6A9yX2X1qxSk2zISwUb8c95FEEaQqpLfmtUQ5TCzKJX2gsA
         PypaNLGZuELOxxK+ZZPpopI/C0H0tIvoB3Io9tinImcbXlh2+Z6HEs3pUGMcLFQtnbRY
         hdfsm5Ur3YVJRk6aOXt3lkChUWbsCKVb9h73Wy9s1sqm77daomwV2dIThXhggmtPCT7f
         4rFuvUEYn+VejbcKX8h21n5LdGGdwOIGQ2li02jMh6y1Z24iMOf3SeOHX7PPQM1+2hhi
         ZwBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=LjEMR+RvxUAU+81ZngdDVY7KFUetPWRBhlcZRlrbWTM=;
        b=sXmx1PhzLKzlpcm7WhyVyMgFV5M6R1mRaFhIy7V06fhICMZ7RX4MRoVmGVrvH4de4q
         u5FqDZhXhqDg3aLdIut0hl7EZ/tUF7V9tw4xXVfCAM/YeZ7DYSC0BZzy/FhpntLlBErc
         F2ex7KMJnpeYwn029DRic2ZYy+McM2hEI9cN511kJ1IDS4Jz9SzvhDm18Z1391XP0cZP
         IJXShAyQiEUzbvaMkyblUkhagEnREQkEe2Wfk/W22Q+DSYn6y2bsWFOFbZ8SV3b7dtoS
         hgxORje5/0+mhfcRps34N4BUVJv+3P52jnC6CAPX2Dw0GzkHMtimW6VjM1DdN0n51ZSJ
         AXEQ==
X-Gm-Message-State: AOAM530UkjrRNSq2hHChwuD1OMN467JYVsIkdMKEx/fzQVK/LpxfeOaX
        brVyOBBrTR8wm1+TKSAiE+k=
X-Google-Smtp-Source: ABdhPJz/NqKws5TvHKaVDM4XPLrDvxcZl5xFUdIaq1uNYBQ5nklC6g8p6qIR/7jawo+ZMj/hDJJM+w==
X-Received: by 2002:a62:1b02:0:b029:154:fdbe:4d2a with SMTP id b2-20020a621b020000b0290154fdbe4d2amr5382913pfb.27.1603315011599;
        Wed, 21 Oct 2020 14:16:51 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id s20sm3189870pfc.201.2020.10.21.14.16.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2020 14:16:50 -0700 (PDT)
Date:   Wed, 21 Oct 2020 14:16:48 -0700
From:   dmitry.torokhov@gmail.com
To:     kholk11@gmail.com
Cc:     robh+dt@kernel.org, rydberg@bitmath.org, priv.luk@gmail.com,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        marijns95@gmail.com, konradybcio@gmail.com,
        martin.botka1@gmail.com, phone-devel@vger.kernel.org,
        devicetree@vger.kernel.org, krzk@kernel.org
Subject: Re: [PATCH v5 2/3] Input: Add Novatek NT36xxx touchscreen driver
Message-ID: <20201021211648.GE444962@dtor-ws>
References: <20201017190152.12780-1-kholk11@gmail.com>
 <20201017190152.12780-3-kholk11@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201017190152.12780-3-kholk11@gmail.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi AngeloGioacchino,

[obviously not a complete review, but wanted to call out regmap concern]

On Sat, Oct 17, 2020 at 09:01:51PM +0200, kholk11@gmail.com wrote:
> +static int nt36xxx_read_pid(struct nt36xxx_i2c *ts)
> +{
> +	u8 buf[2] = { 0 };

	__be16 pid;

> +	int ret = 0;
> +
> +	ret = nt36xxx_set_page(ts, ts->mmap->evtbuf_addr);
> +	if (unlikely(ret < 0))
> +		return ret;

regmap is supposed to help with the paged registers, that is why I
recommended using it.

> +
> +	ret = regmap_noinc_read(ts->fw_regmap, NT36XXX_EVT_PROJECTID,
> +				buf, sizeof(buf));
> +	if (unlikely(ret < 0))
> +		return ret;
> +
> +	ts->fw_info.nvt_pid = (buf[1] << 8) + buf[0];

	ts->fw_info.nvt_pid = be16_to_cpu(pid);

Thanks.

-- 
Dmitry
