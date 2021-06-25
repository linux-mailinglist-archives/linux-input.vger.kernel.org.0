Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 38B4B3B4805
	for <lists+linux-input@lfdr.de>; Fri, 25 Jun 2021 19:08:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230041AbhFYRLB (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 25 Jun 2021 13:11:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230004AbhFYRLB (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 25 Jun 2021 13:11:01 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B1CDC061574;
        Fri, 25 Jun 2021 10:08:39 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id l12so10626005wrt.3;
        Fri, 25 Jun 2021 10:08:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=Okz6kNod9vG3qCnnewbfMIkpGKwd7jxjMWkNhMCHPqY=;
        b=HLBfzuYSzWwrvVnxKDqGXHc7b+9fblc/NT4YP4wdLJoXl5bc2dAUmT3BhgMYV+b4F+
         QJRJnlW0kbU2q08Vt/cCoVR1l8DwlTeQEfEes+iMKoumur7+Y64SItQ/7VhSes0Zx4nA
         e65415eoXQ4qA5xbbZNvvHOxbXzC3h9UDVwQTvo9xK9IqyvwYrirsAUUkmswSkFDB/4s
         P22jKqZb51xsc8jAw6x84UYyktvibYs2ANeVrTsb5QswyDavzoI25T+/P2YDq7TpVXC+
         41+4SW5twGhn6IQXmvr+IZZmJDG9z5tPGew7qE8+vEgS3DrK/8IdpU8pzBIb+7SvZO4q
         HJig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=Okz6kNod9vG3qCnnewbfMIkpGKwd7jxjMWkNhMCHPqY=;
        b=DdRMwij+QLZMt+FUadQLfJAK9PVHMkzlqtIkze0IsPy1Bc2o55hTjxK0PS7Ipx/q+j
         vUVvn9W9rt/GQipZ0A0W6Lv75z3WVOKenuvaHDUKQJE6D9rplYqSW2SMt67Mn4zjt+rn
         JQC/AQjn9/7xshfdgMq1MkvTbbeGmdPvmcbTU2kFxQ/in5bdNUVts0N3p47U/pM3A/LC
         lrdz+MDejN948s8JJR1m2S/gydDEtLrfrKLT1juwkV8aYYcwcDbtMMr7E8u0FwZ+X+WQ
         aOZ4zPnAb7QTTBWb2VzjjLgPr2fE8KyxC2tjaAkF+A4DcpzEIfdbfl5MhU5TRe2zajUo
         CkHg==
X-Gm-Message-State: AOAM530WErMGv1Pjln5vUQwV74icyQr1fdlkhobTzdcskxarl5LsOO/s
        2Fp6fqol6dxNch3SUBP0hoE=
X-Google-Smtp-Source: ABdhPJyWyl+t9LPZsLg++3OKuGUGpkr9ii2kpDNJfNpv054GvY3G2fWpYJyS/AX4Q5Uhwx611bakgQ==
X-Received: by 2002:adf:b34c:: with SMTP id k12mr12037483wrd.272.1624640917671;
        Fri, 25 Jun 2021 10:08:37 -0700 (PDT)
Received: from elementary-os.localdomain ([94.73.35.64])
        by smtp.gmail.com with ESMTPSA id o20sm11972339wms.3.2021.06.25.10.08.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jun 2021 10:08:37 -0700 (PDT)
Date:   Fri, 25 Jun 2021 19:08:34 +0200
From:   =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
To:     Jiri Kosina <jikos@kernel.org>
Cc:     benjamin.tissoires@redhat.com, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/5] HID: magicmouse: register power supply
Message-ID: <20210625170834.GA9573@elementary-os.localdomain>
References: <20210522180611.314300-1-jose.exposito89@gmail.com>
 <nycvar.YFH.7.76.2106241532511.18969@cbobk.fhfr.pm>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <nycvar.YFH.7.76.2106241532511.18969@cbobk.fhfr.pm>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Jiri,

First of all, thank you for taking the time to review my patches.

On Thu, Jun 24, 2021 at 03:33:39PM +0200, Jiri Kosina wrote:
> On Sat, 22 May 2021, José Expósito wrote:
> 
> > [...]
> > v2: Add depends on USB_HID to Kconfig
> 
> Hmm, why is this dependency needed in the first place, please? I think 
> trying to keep the drivers independent on transport drivers (especially in 
> cases like this, where more variants of physical transports actually 
> really do exist) is worth trying.

Sorry, that's something I should have explained in the changelog.

Intel's test bot reported compilation errors on the first version of the patch
when USB support wasn't configured:
https://lore.kernel.org/patchwork/patch/1425313/

I was kindly pointed to a similar error and its fix, but, maybe in this case this
is not the right fix?
Maybe there is a macro that I can use to wrap the USB related code in an #ifdef?

Thanks,
Jose
