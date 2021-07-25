Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 950643D4BC8
	for <lists+linux-input@lfdr.de>; Sun, 25 Jul 2021 06:35:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230162AbhGYDyz (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 24 Jul 2021 23:54:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230010AbhGYDyx (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 24 Jul 2021 23:54:53 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 546A4C061757;
        Sat, 24 Jul 2021 21:35:23 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id e2-20020a17090a4a02b029016f3020d867so9470524pjh.3;
        Sat, 24 Jul 2021 21:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=9QfMacwXqISlBYINZ+Q7r0c2eQyBEi5YgMNKFEGQmX8=;
        b=N+CRmMyvROxELUJKesyZnb83IJ1ImqRLj6cgbgEmSBTBV5l2+6KlqjvkKIaaTCUBDY
         yOdIkkltgzalnbsDz7VnRtdt1HNGdiwPMf8eAyEPg1KFU5VCjaattwaN1IRZ2H/dTEkj
         vgnuEUQDL5Sve1k4k8mbqoD2gWRbn/IasuR5onrMe/hcGx91wQ8eoHWFLlLni5Dcj3DP
         XFxCqaQVIa/F59ZhRyMQnQ5bOnRfgWjjEp1puhps1sfVGw6jhexaPVbzCY8m/SckUXGc
         DZjbfKoNXmXctjaYKXeajSw3C8y2cxqletpNEdPs/g8wzhs28jQ29uxGe89kCJwjPCu6
         /aLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=9QfMacwXqISlBYINZ+Q7r0c2eQyBEi5YgMNKFEGQmX8=;
        b=PfKiulk83+ePj3s/uuPmGqwkRBpBQnk8PMIpAfJla2Puah+F1hcAuHV1dhKWHUanvQ
         q5Y2v4gzUc+cHQDiTMGIhduC4Li43x37pJTjjTZQkWC6cs5hfxwQ4yXkyOrmrOCV2ejN
         VNpY5Hh+YjqCkrayDYSuAC98CynJXLoZHlvILzs9WNWE3ffKOkMnDSOHuYoACPWiaqPs
         Izzlc3kPyPLkFRhMD+hBnwAHh+Mfcc0Ky0gtwJWOvsnGsOW8MBd10ghCnTkaTMdkyRoF
         GBPWPWlQfi0lZllUgZKzNyDmaIueaBcGx97eFDExvmiGkrKkyB/23Hy/0jbB/rJn8a02
         QRWg==
X-Gm-Message-State: AOAM533rz2wapIirjfirJwo5kylk7kgzQ2E2ylrUJ6ghiGTShvRDKH05
        Ik/GHFrJZOgDF64v1G+vIo0=
X-Google-Smtp-Source: ABdhPJxKlsXuVnkebpj+s+ijZ/Q6qE+0mgB7sGB6ZoRNxPyJ3JtFiRyE+R0y1/34mORkQhqAp9f2Gg==
X-Received: by 2002:a17:90a:4295:: with SMTP id p21mr11018285pjg.149.1627187722594;
        Sat, 24 Jul 2021 21:35:22 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:47a8:ca26:9af3:7f64])
        by smtp.gmail.com with ESMTPSA id a23sm39789696pfa.16.2021.07.24.21.35.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Jul 2021 21:35:21 -0700 (PDT)
Date:   Sat, 24 Jul 2021 21:35:19 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Salah Triki <salah.triki@gmail.com>
Cc:     gregkh@linuxfoundation.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] misc: powermate: update the reference count of the usb
 interface structure
Message-ID: <YPzqBxjMb7sVX7iw@google.com>
References: <20210724212016.GA568154@pc>
 <YPydUp9vc5U7vGIw@google.com>
 <20210724235637.GA590874@pc>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210724235637.GA590874@pc>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, Jul 25, 2021 at 12:56:37AM +0100, Salah Triki wrote:
> Hi,
> 
> On Sat, Jul 24, 2021 at 04:08:02PM -0700, Dmitry Torokhov wrote:
> > 
> > On Sat, Jul 24, 2021 at 10:20:16PM +0100, Salah Triki wrote:
> > > Use usb_get_intf() and usb_put_intf() in order to update the reference
> > > count of the usb interface structure.
> > 
> > This is quite pointless as the driver will be unbound from the interface
> > before interface is deleted.
> 
> From the documentation of usb_get_intf():
> 
> [quote]
> 
> Each live reference to a interface must be refcounted.
> 
> Drivers for USB interfaces should normally record such references in their 
> probe() methods, when they bind to an interface, and release them by calling
> usb_put_intf(), in their disconnect() methods.
> 
> [/quote]

I see. In this case I recommend you submit a patch to the documentation
clarifying this, as taking a reference when binding to an interface
makes sense when dealing with a secondary interface, but not primary
one. See for example drivers/usb/class/cdc-acm.c where it binds to the
data interface, but also locates control interface and bumps up
reference to that.

As you may notice there is only a handful of drivers that use this API,
and as I am looking at them most do not actually need to use it.

Thanks.

-- 
Dmitry
