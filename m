Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D0C3BF83DD
	for <lists+linux-input@lfdr.de>; Tue, 12 Nov 2019 01:05:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727002AbfKLAFi (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 11 Nov 2019 19:05:38 -0500
Received: from mail-pf1-f195.google.com ([209.85.210.195]:46795 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727063AbfKLAFi (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 11 Nov 2019 19:05:38 -0500
Received: by mail-pf1-f195.google.com with SMTP id 193so11900816pfc.13;
        Mon, 11 Nov 2019 16:05:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=6KOnCMXCOiPQLfi45fFcE0+C3er2wheoIsrf8843ny0=;
        b=OLPKNrMFGFF7U1922nn0E++/tjzkZ0mNS2hYpYmYINmWigGDYrRdqdSag3Fy1NIbuM
         hm/XRybSWrx/kxgDrRUknQ51q8xz8P8pQu8rYB/MS+N6zl/EhWPv51Qn7qEUe6/r5/UT
         2tQLKCDJwLDs2yluQKt57CrtXP18B0e48SxH7DUXVVxDN/epgr1NTiP6HQ7PhVcZ7pid
         uc0F3STd5z+Y9PWakN7Xwl3yLygrzHOpJGA38O35pkkafjEJDG+tmKcIlJXyJNqqAdEM
         vAROblpNXiwZdlxIptgSmh3FWkZv6zhonPvL9gT9Ddrbtwxw+Dbwdnv2FCXPoXRn8W3h
         VcrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=6KOnCMXCOiPQLfi45fFcE0+C3er2wheoIsrf8843ny0=;
        b=tU2g5acqJ40/SmSJhlI0WNqGcsj427KmirYbg7rcmu+qkSb6M9qlsMcxSBIUfx+6/F
         +cyfGKcX6GC634X5ABVTx4q/sBKB1oLQkTYciiPTxsyoVC72ZFWgJ8Rn1KyaNhKZPIf9
         AicET84hpt67du0btODCrMao182qQDb8JrlPQifJ+O1l2KqYJYiBO1M3M0CkY7blalRy
         XPB99V8vsSN6rdTf+nVJUfQ0vgrtUDwg1+vkiwLD8fi7RqZrUH0zskZaf7lspZpng1jI
         xYRV/yDkFxvoCdGWUXCERZddz2njxhZy3IA3RoJI+pVI/i+ZqrwNI5Y2AMiENPVId7ID
         63bw==
X-Gm-Message-State: APjAAAX+SH3849r5ChCd1bCg27spWB4ryJvrdE6z3NhPsvqV+DdKcprQ
        wy5WKHn9CCXd81xqkQwZ5/8=
X-Google-Smtp-Source: APXvYqzXZdmbvuUorKINeW0zhCwHHDdLsKqKa7cZjwYSCyOGWKC/69DcZIZRO7sBDnAEay9pLOkCIg==
X-Received: by 2002:a17:90a:bc41:: with SMTP id t1mr2349371pjv.89.1573517137516;
        Mon, 11 Nov 2019 16:05:37 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id f13sm20131016pfa.57.2019.11.11.16.05.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2019 16:05:36 -0800 (PST)
Date:   Mon, 11 Nov 2019 16:05:34 -0800
From:   "dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>
To:     Marcel Ziswiler <marcel.ziswiler@toradex.com>
Cc:     "robh@kernel.org" <robh@kernel.org>,
        Philippe Schenker <philippe.schenker@toradex.com>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-imx@nxp.com" <linux-imx@nxp.com>
Subject: Re: [PATCH v2 3/5] dt-bindings: input: tochscreen: ad7879: generic
 node names in example
Message-ID: <20191112000534.GA192119@dtor-ws>
References: <20191026090403.3057-1-marcel@ziswiler.com>
 <20191026090403.3057-3-marcel@ziswiler.com>
 <20191030140455.GA4544@bogus>
 <20191030231205.GI57214@dtor-ws>
 <c200444ba450d7884cd26e12163b68db6db63725.camel@toradex.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c200444ba450d7884cd26e12163b68db6db63725.camel@toradex.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Nov 06, 2019 at 08:58:25AM +0000, Marcel Ziswiler wrote:
> On Wed, 2019-10-30 at 16:12 -0700, Dmitry Torokhov wrote:
> > On Wed, Oct 30, 2019 at 09:04:55AM -0500, Rob Herring wrote:
> > > On Sat, Oct 26, 2019 at 11:04:01AM +0200, Marcel Ziswiler wrote:
> > > > From: Marcel Ziswiler <marcel.ziswiler@toradex.com>
> > > 
> > > There's a typo in the subject.
> > 
> > I fixed it up file applying, thank you for noticing.
> 
> Where exactly did you apply this? As I still can't find it applied
> anywhere. Thanks!

Umm, to my internal queue *blush*

Now applied to 'next' branch and pushed out.

Thanks.

-- 
Dmitry
