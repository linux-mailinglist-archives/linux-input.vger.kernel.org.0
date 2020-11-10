Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1FEF52AC9DB
	for <lists+linux-input@lfdr.de>; Tue, 10 Nov 2020 01:49:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729243AbgKJAtH (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 9 Nov 2020 19:49:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727311AbgKJAtG (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 9 Nov 2020 19:49:06 -0500
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B94AFC0613CF;
        Mon,  9 Nov 2020 16:49:06 -0800 (PST)
Received: by mail-pf1-x444.google.com with SMTP id w14so7195084pfd.7;
        Mon, 09 Nov 2020 16:49:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=IH/P2f3Ur4lgJvhvzpb9ekV/UZANdEcXSKjl/0X0WgI=;
        b=Ht9rGRxNHSZwhd21h+JqhRq5vg+3OACtJLRIFGWuHjjk/G6NhePNel/8lE1DndRHeW
         vQhYMKw/JTb8fM6z4ui59xHCCuZ0hdtaCa7mRaeZhSzc05N60lSg17bdHmvUg2WLAaqK
         s3L8DSOXSxHkeRWDUbu1rJqUgDImFeFyKY0XH7hw1+RbFNCRT/zknqcKRT8wAyQeLgst
         5HwS6dtbDwyO9JG7xUQeXG55iEfiUcheoU6h+dUHabwDu4fpEm6KYRUwFbLk3wmt7s5y
         rqidNDEM5+izUoJGkEa7j4Rm4aQSY8zLsOmv7iVYanhyMaAZqJocdR9fDBAkAN58EnGe
         ns0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=IH/P2f3Ur4lgJvhvzpb9ekV/UZANdEcXSKjl/0X0WgI=;
        b=iB+fXCZlo6y6i/VY/fLrgzD1Lbu3OSSOdymzLb0I4jEdcUaSAfclqt0+/MpC2Arc1w
         WvmpqMStXQzIdJ4JlhE30IA+14ytwFuF+cUVgswcApUZ9kjxhrXjUPu1P6pxU+HrrrMR
         zdfKxyLnmNUthGK7SkDnsDunGvyc7WbOcXjnD64uhNHhJUIn7Q89T+V6HoL3XyriW3UC
         PfUNBnz7F2N/sotrSCGKpw6Khy4+KI3ilcQ+jTiLmEhl5WQ1MbxcwGGuIEJTcV1puhOg
         z+JFIRV+zNaclD01ZIQf6zUSM0Z/8TAVXwh9LbicBWE1W19zL790NHUMWshZbIvzRWKv
         SjMA==
X-Gm-Message-State: AOAM531DKTZJDGKJZp0+y21kHKNhUu1+wXf5x68y351vO/6uuqOhDoB6
        I0fH0W1TsVPLhS+oWEIl9SY=
X-Google-Smtp-Source: ABdhPJwYEBvLAu0zfxdNIsTVQv9lGQSPMIlS0ssjdpstKFqEiKufPQ8pCBIN1nMs4Ivs2NjMH0HrQw==
X-Received: by 2002:a63:4546:: with SMTP id u6mr15155222pgk.311.1604969346080;
        Mon, 09 Nov 2020 16:49:06 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id c3sm696425pjv.27.2020.11.09.16.49.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2020 16:49:05 -0800 (PST)
Date:   Mon, 9 Nov 2020 16:49:03 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Subject: Re: [PATCH 05/20] input: rmi4: rmi_f01: Struct headers are expected
 to start with 'struct <name>'
Message-ID: <20201110004903.GV1003057@dtor-ws>
References: <20201104162427.2984742-1-lee.jones@linaro.org>
 <20201104162427.2984742-6-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201104162427.2984742-6-lee.jones@linaro.org>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Lee,

On Wed, Nov 04, 2020 at 04:24:12PM +0000, Lee Jones wrote:
> Fixes the following W=1 kernel build warning(s):
> 
>  drivers/input/rmi4/rmi_f01.c:106: warning: Cannot understand  * @ctrl0 - see the bit definitions above.
> 
> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Cc: linux-input@vger.kernel.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>

I folded all RMI4 patches together and added more missing field
descriptions/fixed a few things, and applied.

Thank you.

-- 
Dmitry
