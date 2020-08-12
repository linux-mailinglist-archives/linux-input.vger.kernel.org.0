Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B9EE2430B0
	for <lists+linux-input@lfdr.de>; Thu, 13 Aug 2020 00:14:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726605AbgHLWOC (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 12 Aug 2020 18:14:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725815AbgHLWOB (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 12 Aug 2020 18:14:01 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1D0EC061383;
        Wed, 12 Aug 2020 15:14:01 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id p37so1756942pgl.3;
        Wed, 12 Aug 2020 15:14:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=lW7/4eKV/BIv6DOQAynrxiasqUawM2e6k23o2vSUtRg=;
        b=vB/mP0Nsnkr6cRD7/pR4Cz9oQ3xTivBb8JU/zagbvd3bAkgkx0xOy3XIdZXG1nnTPd
         byRxNsMP1miGLAcBNyEgQGtQV6e4G963v8jG2ihlzbKYjujy4E2DEk1Ag+TNZXKeJ6Uv
         Z3/aQc2CFYLFBVKxLRlb/5kSSvzzJiME3hgk0DMuwNH9XJc9oqp1lmxgc43DGK4Mzs+L
         K5AgbrC5KZAzjIXDWmdiawfuxysWR+U8/xK/oQgkU2FHf2STI9AQBdt9PbHy9RIdlrNV
         GJe4xOnig387XFN8v+7AGgFyUcptGoYATA9GlqmPLbxSwx9SbCKhlgKYytX+x6W5e/0P
         UTgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=lW7/4eKV/BIv6DOQAynrxiasqUawM2e6k23o2vSUtRg=;
        b=WhSAjZUsowPKWCg8Dhz0QNOKGQONQedMFbeKam/jo+SE38MehBSh4lsmt8vzhu3jx4
         7USBKgor8pzmDSKVuSHdEmOURpWSYsdIUJyyYfMSmqAfxAHFaZG3fKMfowoIzCjI2JaM
         TFkHPw4/am89ldJcvWFN4S/oOopdYL7D6ZU23NHsPtXqw8WNZRI+f7jodN7TaqjB7Md7
         eOcMB/XlAC1zgC1GQ5pvQB80eCwV99S+YNYNIm3x83b1i78kiJnm9vCwgNRQTMahmST8
         68xtsnw0h3dXF6+QuQPHqKWNDm9nN8tcjD+Mdz0V+kVefB9OE1X3QDd1evM+V90Bnnrv
         Owbg==
X-Gm-Message-State: AOAM531NfaHVPKwWG3u7yR/P5J1d+bzVqsPH/uL1pQqPtHQ2Y7pWd1BK
        hOFuDf7hxZOjhUzsODatQEw=
X-Google-Smtp-Source: ABdhPJxXev+6QoPGs9bZPI7LelcdOihL8c1PxoXHznyZAiNi1UYiit1+dSyyAauBMLff8UdiLX2Otg==
X-Received: by 2002:a63:e20:: with SMTP id d32mr1079233pgl.53.1597270440514;
        Wed, 12 Aug 2020 15:14:00 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id d80sm3428651pfd.22.2020.08.12.15.13.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2020 15:13:59 -0700 (PDT)
Date:   Wed, 12 Aug 2020 15:13:57 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Yingjoe Chen <yingjoe.chen@mediatek.com>
Cc:     Fengping Yu <fengping.yu@mediatek.com>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Marco Felsch <m.felsch@pengutronix.de>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v17 1/3] dt-bindings: Add bindings for Mediatek matrix
 keypad
Message-ID: <20200812221357.GS1665100@dtor-ws>
References: <20200810064058.6467-1-fengping.yu@mediatek.com>
 <20200810064058.6467-2-fengping.yu@mediatek.com>
 <1597110443.22273.5.camel@mtksdaap41>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1597110443.22273.5.camel@mtksdaap41>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On Tue, Aug 11, 2020 at 09:47:23AM +0800, Yingjoe Chen wrote:
> Hi,
> 
> 
> On Mon, 2020-08-10 at 14:40 +0800, Fengping Yu wrote:
> > From: "fengping.yu" <fengping.yu@mediatek.com>
> > 
> > This patch add devicetree bindings for Mediatek matrix keypad driver.
> > 
> > Signed-off-by: fengping.yu <fengping.yu@mediatek.com>
> > ---
> >  .../devicetree/bindings/input/mtk-kpd.yaml    | 87 +++++++++++++++++++
> >  1 file changed, 87 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/input/mtk-kpd.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/input/mtk-kpd.yaml b/Documentation/devicetree/bindings/input/mtk-kpd.yaml
> > new file mode 100644
> > index 000000000000..d74dd8a6fbde
> 
> <...>
> 
> 
> > +  keypad,num-columns:
> > +    description: Number of column lines connected to the keypad controller,
> > +    it is not equal to PCB columns number, instead you should add required value
> > +    for each IC. If not specified, the default value is 1.
> > +
> > +  keypad,num-rows:
> > +    description: Number of row lines connected to the keypad controller, it is
> > +    not equal to PCB rows number, instead you should add required value for each IC.
> > +    If not specified, the default value is 1.
> 
> Your source code can't really handle dts without rows/columns
> properties. Also, the default value doesn't make any sense. No IC will
> have rows or columns set to 1.
> 
> Since these are IC specified, not board specified, I think you should
> just have the correct numbers in driver.

It is actually property of board to decide how many keys it wants to
wire up. In extreme case it will be a single key, i.e. number of rows
and columns will indeed be 1.

Thanks.

-- 
Dmitry
