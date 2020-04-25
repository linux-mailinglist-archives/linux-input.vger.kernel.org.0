Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 292971B893E
	for <lists+linux-input@lfdr.de>; Sat, 25 Apr 2020 22:07:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726284AbgDYUHi (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 25 Apr 2020 16:07:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726190AbgDYUHi (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 25 Apr 2020 16:07:38 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D302C09B04D;
        Sat, 25 Apr 2020 13:07:38 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id d17so6453924pgo.0;
        Sat, 25 Apr 2020 13:07:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ifaDczwMGHMV2StE8Vge5QNZGvpAuqEsBvikZ8RrWxU=;
        b=AL7Ep+m67vukkKfuUZBLGgZjKajR2EIrsZmCYEWjWtQ4Hr1s4XB9M/emBAJJgxsYj8
         AdUySSYfEUAXjKr1lkDTN2OELav93b1h+/eNei0DihC4CbU6H3u19A+mTOBhhhJ4fupe
         TAqu95B2c5Qgg6jV+3YRSdC49mXFm300LbMgLZ5Q+y7BJ+AhV6N2R67mZ7XA6mWrTxIb
         roEKfCn3favpUK88K+iQkVggta/Kna0oUCbB6vNDelGfkXu9VoK/CM3iMsqc5XqP0ic1
         bSoiJgHUoFLIVwf7eOMsr980b/2rVfEyARy5AeuZTTIPWdqvXPPIPmmovjxEB2NgRpuy
         aFHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ifaDczwMGHMV2StE8Vge5QNZGvpAuqEsBvikZ8RrWxU=;
        b=lBJgE2nGnKaaVCynKcACjV4VOzF8bcAGUBsSxQHDpGjzovQoElJ5KQW19KVzHkEM+5
         oJCnRDh6uVnYcrkl5ZgrM3aEwzOPxoGpVOWXGPnsmvzdCBGJC2mmaCERlOzH3Pe+Effj
         VUqiBc+n+nPaxgEpRvoMpHVpkHUnB62TbUOYOjNKbAjv0DNCqOyHymUs1DJjfW+S6ZP/
         beZX7awFeyXZbRrhkLzdNQTFJ/Q3o18p+ICXaULKdth/Tmkug3T9qeFQuAB9kPbbmuV8
         7FV5tVTIk7hyXWpwRdfg4pxgPF3jAe2yvETjxYBiorCB4ROOgJQzxyZdBAlTgaV8S306
         agfQ==
X-Gm-Message-State: AGi0PuaA7S80UafNtUIkfxR927zMhfkBsgsCTYU8gGwf6QGm6WnSvd9C
        4T9/xVzGcZc5VFZ8vInZ2C0=
X-Google-Smtp-Source: APiQypJXzAvWPmkKAQDI4B92LNTu1NsLUpGvFivv3ETk2LE9C1KZU7kBMHl3aCxWqMUfn8cXz5zcaA==
X-Received: by 2002:a62:144c:: with SMTP id 73mr16565217pfu.37.1587845257293;
        Sat, 25 Apr 2020 13:07:37 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3c2a:73a9:c2cf:7f45])
        by smtp.gmail.com with ESMTPSA id y10sm8663912pfb.53.2020.04.25.13.07.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2020 13:07:36 -0700 (PDT)
Date:   Sat, 25 Apr 2020 13:07:34 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     Andi Shyti <andi@etezian.org>, linux-input@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] Input: mms114 - add extra compatible for mms345l
Message-ID: <20200425200734.GM125362@dtor-ws>
References: <20200423102431.2715-1-stephan@gerhold.net>
 <20200424092937.GB460760@jack.zhora.eu>
 <20200424113446.GA205913@gerhold.net>
 <20200424132243.GH460760@jack.zhora.eu>
 <20200425182417.GA116540@gerhold.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200425182417.GA116540@gerhold.net>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sat, Apr 25, 2020 at 08:24:17PM +0200, Stephan Gerhold wrote:
> On Fri, Apr 24, 2020 at 04:22:43PM +0300, Andi Shyti wrote:
> > Hi Stephan,
> > 
> > On Fri, Apr 24, 2020 at 01:34:46PM +0200, Stephan Gerhold wrote:
> > > On Fri, Apr 24, 2020 at 12:29:37PM +0300, Andi Shyti wrote:
> > > > Hi guys,
> > > > 
> > > > >  	}, {
> > > > >  		.compatible = "melfas,mms152",
> > > > >  		.data = (void *)TYPE_MMS152,
> > > > > +	}, {
> > > > > +		.compatible = "melfas,mms345l",
> > > > > +		.data = (void *)TYPE_MMS345L,
> > > > >  	},
> > > > 
> > > > it's been some times I haven't been doing this, but is the order
> > > > of the patches correct? shouldn't the binding be updated first?
> > > > 
> > > 
> > > Yes. I had it correct in my original patch, but apparently swapped the
> > > order accidentally for this one. I will do it correct again next time :)
> > 
> > then with that change:
> > 
> > Reviewed-by: Andi Shyti <andi@etezian.org>
> > 
> 
> Hi Dmitry,
> 
> I assume there is little reason to resend just to swap the order.
> (You could just apply them in reverse order since they do not depend
>  on each other...)
> 
> But if there is something else I should change just let me know.

No, that is it, I just applied the both.

Thanks.

-- 
Dmitry
