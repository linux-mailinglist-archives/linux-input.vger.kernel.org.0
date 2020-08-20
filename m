Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5879224C53B
	for <lists+linux-input@lfdr.de>; Thu, 20 Aug 2020 20:23:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727000AbgHTSXG (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 20 Aug 2020 14:23:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726980AbgHTSXF (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 20 Aug 2020 14:23:05 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F35FC061385
        for <linux-input@vger.kernel.org>; Thu, 20 Aug 2020 11:23:05 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id v16so1429978plo.1
        for <linux-input@vger.kernel.org>; Thu, 20 Aug 2020 11:23:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=kbszBGgjsbitgBGgnejD2ZVR4Pkz4+YIZ1Q0UhyD9w0=;
        b=clIbmqGrdZLBksucSVrBJ9g4Q9EZ15QvHVvSesghyh7kNN4uHzZCfN0NUO/X6RqxB9
         Cl7zdDUuzSvM0WpZdx7wFmlTdC8sfuGXqDMrP1cydImqRmjzZZurafR6r4+OY+HYZJIR
         tm4g3srlap5XDKZtupOcSkHHpzSffwPWpToz+1WxA/8OLTfQBIa4WfgVhUWWtF+OaMum
         qreFkLPZ9V/pbGdSsDAk2cyTst2mFvljaCdrJAxQ3XGvD57Nkkm3rSdLCJyXpjk+XdrH
         CytbIMF46OpWO239MR3+GiQP+PhrzGWvE8dgKhRGKzrRvMAR322PWO4ewZpAG253LhGP
         dfIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=kbszBGgjsbitgBGgnejD2ZVR4Pkz4+YIZ1Q0UhyD9w0=;
        b=kN9B2TPYgdDdxjlvDMxhVfy0JoNYSU7Ykc/ooyTn/fU5KLKl5VV2e64xS0lsVb5Fst
         PXVNlwcxaDJLEVIt+CruLPMA1xEVnhG31qGoQ7pyGyd4L1SBZTzQ89d4kLJat8+1WmH1
         1wr97xT2fUt1t1CkwgbpzzNe1zjDghjViyiy/v0CnZGp2p2C2N/4UHUK9xK2sEcR/hwi
         5ZZzVawVoNLUOS3yNzfaACeEz3pCih3/Mp3PEoSgbX4cAwnayJBKBZdRUVign2QrrAAd
         VYKY9DJMRw53+FjoMixNmplwbaCymTPUyvvSzJX3UHm4e4h4NnwogS5EErODkrsSEtCe
         disg==
X-Gm-Message-State: AOAM530KS7SXveHORzwLKJfbrOX6PcphLZ2RupypsumQ4dcT7zSHYldZ
        j/wPHSWt/XJ3zMt7KJUMF9k=
X-Google-Smtp-Source: ABdhPJwCGxV9PRm1fAFYiWqLYpFR4/ZCoO7wgtCM1b/gGr7PitJDkqhZqCigahIRHw9Mr8shLIa2og==
X-Received: by 2002:a17:902:ff0d:: with SMTP id f13mr74318plj.145.1597947784697;
        Thu, 20 Aug 2020 11:23:04 -0700 (PDT)
Received: from frank-MS-7C02 ([211.245.188.120])
        by smtp.gmail.com with ESMTPSA id y128sm3475008pfy.74.2020.08.20.11.23.03
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 20 Aug 2020 11:23:04 -0700 (PDT)
Date:   Fri, 21 Aug 2020 03:23:01 +0900
From:   Frank Yang <puilp0502@gmail.com>
To:     Jiri Kosina <jikos@kernel.org>
Cc:     linux-input@vger.kernel.org,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Subject: Re: [PATCH] HID: Support Varmilo Keyboards' media hotkeys
Message-ID: <20200820182301.GA23223@frank-MS-7C02>
References: <20200729135341.16799-1-puilp0502@gmail.com>
 <nycvar.YFH.7.76.2008171202130.27422@cbobk.fhfr.pm>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <nycvar.YFH.7.76.2008171202130.27422@cbobk.fhfr.pm>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Aug 17, 2020 at 12:03:26PM +0200, Jiri Kosina wrote:
> On Wed, 29 Jul 2020, Frank Yang wrote:
> 
> > The Varmilo VA104M Keyboard (04b4:07b1, reported as Varmilo Z104M)
> > exposes media control hotkeys as a USB HID consumer control device,
> > but these keys do not work in the current (5.8-rc1) kernel due to
> > the incorrect HID report descriptor. Fix the problem by modifying
> > the internal HID report descriptor.
> > 
> > More specifically, the keyboard report descriptor specifies the
> > logical boundary as 572~10754 (0x023c ~ 0x2a02) while the usage
> > boundary is specified as 0~10754 (0x00 ~ 0x2a02). This results in an
> > incorrect interpretation of input reports, causing inputs to be ignored.
> > By setting the Logical Minimum to zero, we align the logical boundary
> > with the Usage ID boundary.
> > 
> > Some notes:
> > 
> > * There seem to be multiple variants of the VA104M keyboard. This
> >   patch specifically targets 04b4:07b1 variant.
> > 
> > * The device works out-of-the-box on Windows platform with the generic
> >   consumer control device driver (hidserv.inf). This suggests that
> >   Windows either ignores the Logical Minimum/Logical Maximum or
> >   interprets the Usage ID assignment differently from the linux
> >   implementation; Maybe there are other devices out there that only
> >   works on Windows due to this problem?
> > 
> > Signed-off-by: Frank Yang <puilp0502@gmail.com>
> > ---
> >  drivers/hid/Kconfig       |  6 ++++
> >  drivers/hid/Makefile      |  1 +
> >  drivers/hid/hid-ids.h     |  2 ++
> >  drivers/hid/hid-varmilo.c | 58 +++++++++++++++++++++++++++++++++++++++
> 
> Hi Frank,
> 
> thanks for the patch.
> 
> Given the fact that the device presents itself with CYPRESS VID (0x04b4, 
> 'officially' assigned to cypress), can we avoid creating extra driver, and 
> rather extend hid-cypress.c with this quirk, please?
> 
> Thanks,
> 
> -- 
> Jiri Kosina
> SUSE Labs
> 
Hi Jiri,

thanks for your comment.

As you stated, I have sent the updated patch which extends hid-cypress.c 
instead of creating new driver.

Thanks,

Frank

