Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B85BD3FBF60
	for <lists+linux-input@lfdr.de>; Tue, 31 Aug 2021 01:28:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238476AbhH3XWw (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 30 Aug 2021 19:22:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237832AbhH3XWv (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 30 Aug 2021 19:22:51 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A12BCC061575
        for <linux-input@vger.kernel.org>; Mon, 30 Aug 2021 16:21:57 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id ot2-20020a17090b3b4200b0019127f8ed87so848715pjb.1
        for <linux-input@vger.kernel.org>; Mon, 30 Aug 2021 16:21:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=YOyfN+GkkGlXKqpTJ8CoDofr2ICFEi4p15QPSam2rLg=;
        b=M5LBHQUnR1KH77yNVK4aa/VWs9j0z5FjkWNDQ2I1MKHnjRkmE9xaxRjtMnLZHXojIN
         F82WwhxnjvlMXz/CX81rf4WjsiGQvHe1aj6mdBY6qmz0Xk5yynQJK9NzeSSuhUgdA3+c
         FEfCIQf2Fb2A1lv4bPXe8dJ0lz30rhA3LrUTFvYFQkIQhYXc/WcYflmugbINzHzcpd1g
         oAtuSfHg6POi9DjCXZRZ9tovV0w+gkh5srLE/Db62TH183uqGCabT7Uz7WqoFhYMlEwX
         I5s/o/xLZE+RC0xDCPBoxvAYjVSo7YgNz+b4e5afzIwKlLQXlyQzJCk6E6IzI0C5s7Ru
         lM+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=YOyfN+GkkGlXKqpTJ8CoDofr2ICFEi4p15QPSam2rLg=;
        b=KwCzUF6ymDpeINnl4C374fXZkvBQY2QSZgS8fbYmqfC9dvWPQWfmhmePzT2qQXoVhd
         9Pr1B/z4a/Vst98vw5RYBV0K5j8VLXdYHpvNoCaBfH4h6bwPKHKBQDoZInYdBls/datn
         ezTV8eJL5rg+Uj9QCkTr+NsD0k+AnNFVvgnxcUg8lxPLCq0opiXaUzUxUuh1/YdIp/U7
         LtSDkQSv2Sq8EJOVaaVhS79x/AsaoG+iTMdnQo/WPLiHyUH0fNIr3czR+Taqhpntw5KM
         ip4DQ5CeRkiJmW7zdGcDxOKz4AoL+d0hGuW1sXrw6I7RWh8hOyUh44pGPQHuvD18HHho
         f3pg==
X-Gm-Message-State: AOAM5308iCpwLsBtCnA0pxrsENJrbfmyMbrDtoHyWTpdBzVxEOPeTK0u
        mWx4k8NzoCXlI2b+dzEWz9M=
X-Google-Smtp-Source: ABdhPJz3dROwHR4tTEHHfH3b27veZ8fqZRc5SddQAvY3hfRkGKdGheWfvkDeYwXMrQnkalNws1oycA==
X-Received: by 2002:a17:90a:3d4d:: with SMTP id o13mr1757876pjf.34.1630365717083;
        Mon, 30 Aug 2021 16:21:57 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:771a:afc8:2e96:23dd])
        by smtp.gmail.com with ESMTPSA id n41sm16213860pfv.43.2021.08.30.16.21.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Aug 2021 16:21:56 -0700 (PDT)
Date:   Mon, 30 Aug 2021 16:21:53 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Marek Vasut <marex@denx.de>
Cc:     linux-input@vger.kernel.org, ch@denx.de,
        Joe Hung <joe_hung@ilitek.com>, Luca Hsu <luca_hsu@ilitek.com>
Subject: Re: [PATCH v2 1/3] Input: ili210x - use resolution from ili251x
 firmware
Message-ID: <YS1oEX75iIjQLn9r@google.com>
References: <20210827211258.318618-1-marex@denx.de>
 <YS1FsJROzDkm/0Ky@google.com>
 <bfc05564-38dd-d950-ed71-0599c48d57f4@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bfc05564-38dd-d950-ed71-0599c48d57f4@denx.de>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Aug 31, 2021 at 12:49:49AM +0200, Marek Vasut wrote:
> On 8/30/21 10:55 PM, Dmitry Torokhov wrote:
> 
> [...]
> 
> > > +		return -EINVAL;
> > > +
> > > +	priv->input->absinfo[ABS_X].maximum = resx - 1;
> > > +	priv->input->absinfo[ABS_Y].maximum = resy - 1;
> > > +	priv->input->absinfo[ABS_MT_POSITION_X].maximum = resx - 1;
> > > +	priv->input->absinfo[ABS_MT_POSITION_Y].maximum = resy - 1;
> > 
> > There is
> > 
> > 	input_set_abs_max(priv->input, ABS_X, resx - 1);
> 
> git grep finds nothing in linux-next / your tree on k.org / patchwork. Where
> is that ?

Look for INPUT_GENERATE_ABS_ACCESSORS in include/linux/input.h

Thanks.

-- 
Dmitry
