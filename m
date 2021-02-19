Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 34E9A31FF3A
	for <lists+linux-input@lfdr.de>; Fri, 19 Feb 2021 20:13:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229620AbhBSTND (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 19 Feb 2021 14:13:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229515AbhBSTND (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 19 Feb 2021 14:13:03 -0500
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB29CC061574;
        Fri, 19 Feb 2021 11:12:22 -0800 (PST)
Received: by mail-pg1-x534.google.com with SMTP id o63so5392341pgo.6;
        Fri, 19 Feb 2021 11:12:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=mPS9dVmh2ROWfjV7NaKQt7uy1dCQUzeWW8U3dWjXIKw=;
        b=qYIMqTJXDS25kTsL22vMKK6gO7gL4e+wFv+dEfWqq6BH0fdJBB7JQ/wVY4R1Et2Fi/
         QDwStR6vR2dNFtce3EGzWmvH6vkiWTdOHARU11/ppgU5X11adlqKrz8ZGEd1ZdTOYRTP
         0jZmrNnujlfXrguzYPo0Ho84RZgHA8BbCbNwbwSk007eRlMG9RbA/gYsCEBU7TW3G0iZ
         5knWTNFgMUoFjEa/36qZUfbltUb5pX8JNXfbAgzWvVIYF17P9iOgell2TJuVlpKyH6e/
         v7XnFwdVzaCtus9XGMl4q46GIg5VRzdd49GTVI9pqyp0h5OJvHywZV1ZbiDaHKKorrJS
         M0AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=mPS9dVmh2ROWfjV7NaKQt7uy1dCQUzeWW8U3dWjXIKw=;
        b=OPavqF8sxAyBhnK+71pt8cAKs8qHy0qN6Fwmwwv/I8JsPV5ToP/03JMcXKkR6+fa3r
         fcseHfNVUS7vT7hiEU0Rlj/CM6VP+892Y4tUAit4XWPglbRmjBAOhM8Q4xMRxV13kcrI
         LNLvDZOpMBuAoGsDhJc1jK2GEx2VH/e6/wMk09MgKlHYy+z7pRf9GoJPFkGPe5FHRB69
         D+RsW+eQRAF2epUek0mkqT2HP+QjlxBZS5GGFXYrgW/bv0G6zIWzSuID2LXJqd/aG+dZ
         AUhwcGzKPiYgHp36sJwVj+jXFRsvt6O7V1WT78JhOdJRZenaM5gs7p2ap/RtvOYixDiz
         Vjfg==
X-Gm-Message-State: AOAM533WPUV5S+juXhWYPhjgXYDqlYwbewJg5xKhP3S7AH7fBa7lCmLt
        IBbsVK96l6Dpq7uoV+arrus=
X-Google-Smtp-Source: ABdhPJy8hjojbcrjABTTJUTnMfa4GTyby/EXcyDoV28eJl36VKV+GTAJUhcSqXiNA2k1vM3NzX84pA==
X-Received: by 2002:a63:2359:: with SMTP id u25mr9994975pgm.304.1613761942374;
        Fri, 19 Feb 2021 11:12:22 -0800 (PST)
Received: from google.com ([2620:15c:202:201:7d43:dae1:3b24:51b7])
        by smtp.gmail.com with ESMTPSA id d12sm9385217pgm.83.2021.02.19.11.12.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Feb 2021 11:12:21 -0800 (PST)
Date:   Fri, 19 Feb 2021 11:12:18 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     "Life is hard, and then you die" <ronald@innovation.ch>
Cc:     "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Sergiu Cuciurean <sergiu.cuciurean@analog.com>,
        Lee Jones <lee.jones@linaro.org>, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] Input: applespi: Don't wait for responses to
 commands indefinitely.
Message-ID: <YDANkjYEMJtt9SGu@google.com>
References: <20210217190718.11035-1-ronald@innovation.ch>
 <YC17OycMiNipMUyn@google.com>
 <20210217204551.GA25685@innovation.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210217204551.GA25685@innovation.ch>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Feb 17, 2021 at 12:45:51PM -0800, Life is hard, and then you die wrote:
> 
>   Hi Dmitry,
> 
> On Wed, Feb 17, 2021 at 12:23:23PM -0800, Dmitry Torokhov wrote:
> > 
> > On Wed, Feb 17, 2021 at 11:07:16AM -0800, Ronald Tschalär wrote:
> > > @@ -869,7 +878,7 @@ static int applespi_send_cmd_msg(struct applespi_data *applespi)
> > >  		return sts;
> > >  	}
> > >  
> > > -	applespi->cmd_msg_queued = true;
> > > +	applespi->cmd_msg_queued = ktime_get();
> > 
> > Will it be OK if I change this to ktime_get_coarse()? I do not think we
> > need exact time here, and the coarse variant is cheaper I believe.
> 
> Certainly - I just wasn't aware of the coarse variant.

Applied, thank you.

-- 
Dmitry
