Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E70742B2B5
	for <lists+linux-input@lfdr.de>; Wed, 13 Oct 2021 04:34:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235800AbhJMCge (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 12 Oct 2021 22:36:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235120AbhJMCgd (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 12 Oct 2021 22:36:33 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E723C061570;
        Tue, 12 Oct 2021 19:34:31 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id qe4-20020a17090b4f8400b0019f663cfcd1so3296662pjb.1;
        Tue, 12 Oct 2021 19:34:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=3bzp+5l6WTo7PbKHNMv1iXseFfgQgASCADLi09sp0dQ=;
        b=GIuH+ViP8uIA0KOO0J2nG+UiPKqlt73g90hiO/rMDvzQ98GdLoPx+wqsc+cIHJ+VWa
         oYfVrjHcclVyuX9iemPl+eZYkkujpz9bbTFgtfioVbE3FmRDzTWR7zeIqLrf9AEHx23k
         djcGczXtv4+GyboTFbzCrREN574E0lEEjn0p0AQljE9qOc0br29L9tNNUF2CwPUneiF5
         jPZFpK2/LeqYtDvrNH6JgF962ph4PL+8AuoSKpB/bvCMoD7IQIJr05CzuBtYeIQoIIXz
         8mg0Dbua33x0rOgPUJmF9I/5Y48gqZzp5DoDQFKp5xw+w9CsHsCgZX5m5Q52SA6etYnk
         VE6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=3bzp+5l6WTo7PbKHNMv1iXseFfgQgASCADLi09sp0dQ=;
        b=qZKmxnr6PTiNFbbNn6pjRN9g2i8V8DRdWDoY/AdAqagRk2QV5BuN6lAESoLNoY1zH1
         c29ATpYCnSjmz3rX/Bl1ayNsNvKyYfQ2gOOdMYqrIjCUxJAdeagBA3GjOrMH5ZWHEHH9
         UhQkUyd3a5FGsxsohRNb7hl7KUD0yafoSNXDr7PB6YDfl5zWXy0w5dkDHjdRRwSXz/8i
         Js4cbzx1WpjvaEUnDBY3xk9l+xccI+Q7UDxZBdx1MUnREjdd8GbwopJciGAgOqYu8ZW7
         u91QPF3i82bTVzR2uxfvcsPf32J+vK29Fisvfitx/bpCjsenvlvbDJJbkBUxatFD0Xjb
         Bs3w==
X-Gm-Message-State: AOAM533wzIbF3rSVEDTwzD1fxlSZiXV2cO+bVOQs5JSh5KplzcvIgMKL
        CZ2oTGa+ud+bF67Xj5ktdmnSt58j80I=
X-Google-Smtp-Source: ABdhPJzQzrQt/6fZFgN/n9w1ndxWQ90bbBRDQhIAvSRQGig+pCBms0ZbmTYtv6KWThx/p5UBnV5e6g==
X-Received: by 2002:a17:902:d70b:b0:13d:f465:9ef1 with SMTP id w11-20020a170902d70b00b0013df4659ef1mr33031187ply.44.1634092469233;
        Tue, 12 Oct 2021 19:34:29 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:618d:87ca:8f95:87c0])
        by smtp.gmail.com with ESMTPSA id j4sm13290471pfu.94.2021.10.12.19.34.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Oct 2021 19:34:28 -0700 (PDT)
Date:   Tue, 12 Oct 2021 19:34:25 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Alexander Sverdlin <alexander.sverdlin@gmail.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] Input: ep93xx_keypad - switch to using managed
 resources
Message-ID: <YWZFsZmPBp6Hj2Yf@google.com>
References: <20211012013735.3523140-1-dmitry.torokhov@gmail.com>
 <20211012013735.3523140-4-dmitry.torokhov@gmail.com>
 <d1d1a1028c5db26d0b0eed2a5a9626124451fcf9.camel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d1d1a1028c5db26d0b0eed2a5a9626124451fcf9.camel@gmail.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Oct 12, 2021 at 09:54:32AM +0200, Alexander Sverdlin wrote:
> Hello Dmitry,
> 
> just one question below:
> 
> On Mon, 2021-10-11 at 18:37 -0700, Dmitry Torokhov wrote:
> > +               return err;
> > +
> > +       err = devm_add_action_or_reset(&pdev->dev,
> > +                                      ep93xx_keypad_release_gpio_action, pdev);
> > +       if (err)
> > +               return err;
> >  
> >         keypad->clk = clk_get(&pdev->dev, NULL);
> 
> Isn't the conversion to devm_clk_get() missing here?

Indeed it is. I'll post an updated patch in a sec.

> 
> > -       if (IS_ERR(keypad->clk)) {
> > -               err = PTR_ERR(keypad->clk);
> > -               goto failed_free_gpio;
> > -       }
> > +       if (IS_ERR(keypad->clk))
> > +               return PTR_ERR(keypad->clk);

Thanks.

-- 
Dmitry
