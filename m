Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 995A53D8B36
	for <lists+linux-input@lfdr.de>; Wed, 28 Jul 2021 11:58:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235612AbhG1J6K (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 28 Jul 2021 05:58:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235672AbhG1J6K (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 28 Jul 2021 05:58:10 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A8FAC061757;
        Wed, 28 Jul 2021 02:58:07 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id b9so1737995wrx.12;
        Wed, 28 Jul 2021 02:58:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=ybMJU4laFP82gZUImimMm7uwWHkjMAfgNbF5z/wxF1o=;
        b=cvMFSUMrdHuubJYfQKIbo/1K16o2bDRkZystrjPiIclYt0ZamurqkywIM+1PwkqWli
         Zm2snZ72iiwGv0x8khgbe8xqwJ23eiZbad3E7XR3i2X7ldI8H9YzwjEPvmwCAIvPXfkI
         EHCExQdvh+fRgZXxaRsVIXb4uhr/5hHiVR3Q6mQW8HvduUrhS7gaEaNY3C4GHnSF2DoS
         0005Zg2jy0huc8+h0Z8muIdNRNxzQAHQU2oYLpFEd9D22obn6wIpmc/cCXHuZBtz22nl
         z5hNO5L9V44BQHdWu1JPhWRXD5iHFWg0kLUdb7fF7LtJV+Ndp2qpy+T+CgcisQgdG7ZD
         a7ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=ybMJU4laFP82gZUImimMm7uwWHkjMAfgNbF5z/wxF1o=;
        b=BkJ57sTjnTSgzs76Ns0VpPcmrKu1s4mkdSaiaNAsB2ZN3rc/RLHi6Q48GzcHIVK++r
         CuhmcQWQRhU2x3IEl8O+GRWvl6f1cKnc/ZTEngMTGWf3z5m7lP5MzM3v+zLeeOSmc2S2
         4CWZHrVmkr/O8ylCTCUABuScmKBKzU4oGt0VK4zz6hDSLRmHMU8kjGhYqpaG2YYgA08o
         SawkxtZg4Ml9fi3PhVA1uypcLmC4UNudMSC6jEY3AR2zPGJQ34DLPRN2wnntEstb1BZb
         7SFS3MJcwCdyG9BLlsYgIFitOwRoi0uI5JRQsSlYKWDwCB1/uT2Rdjr2RvmwGcRQHTvR
         DQkg==
X-Gm-Message-State: AOAM532KT/4EIqMXpunMgpjfh7YuoIM4Fuh3AUNjqpT0vlrnjOkpKlHY
        YEdi/1HMHL5n/kb5Msgea84=
X-Google-Smtp-Source: ABdhPJzS7i+6kbKhn3kHl7zKmgL4JyUE+6f6P3BvYRNeJ7r8+ZlNrt+GKxKey4tVsogVMTWGkPVs/g==
X-Received: by 2002:a5d:6107:: with SMTP id v7mr1278844wrt.107.1627466286207;
        Wed, 28 Jul 2021 02:58:06 -0700 (PDT)
Received: from elementary-os.localdomain ([94.73.35.151])
        by smtp.gmail.com with ESMTPSA id l22sm5235770wmp.41.2021.07.28.02.58.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jul 2021 02:58:05 -0700 (PDT)
Date:   Wed, 28 Jul 2021 11:58:03 +0200
From:   =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
To:     Jiri Kosina <jikos@kernel.org>
Cc:     benjamin.tissoires@redhat.com, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/5] HID: magicmouse: register power supply
Message-ID: <20210728095803.GA31924@elementary-os.localdomain>
References: <20210522180611.314300-1-jose.exposito89@gmail.com>
 <nycvar.YFH.7.76.2106241532511.18969@cbobk.fhfr.pm>
 <20210625170834.GA9573@elementary-os.localdomain>
 <nycvar.YFH.7.76.2107281134430.8253@cbobk.fhfr.pm>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <nycvar.YFH.7.76.2107281134430.8253@cbobk.fhfr.pm>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Jul 28, 2021 at 11:35:20AM +0200, Jiri Kosina wrote:
> On Fri, 25 Jun 2021, José Expósito wrote:
> 
> > > > [...]
> > > > v2: Add depends on USB_HID to Kconfig
> > > 
> > > Hmm, why is this dependency needed in the first place, please? I think 
> > > trying to keep the drivers independent on transport drivers (especially in 
> > > cases like this, where more variants of physical transports actually 
> > > really do exist) is worth trying.
> > 
> > Sorry, that's something I should have explained in the changelog.
> > 
> > Intel's test bot reported compilation errors on the first version of the patch
> > when USB support wasn't configured:
> > https://lore.kernel.org/patchwork/patch/1425313/
> > 
> > I was kindly pointed to a similar error and its fix, but, maybe in this case this
> > is not the right fix?
> > Maybe there is a macro that I can use to wrap the USB related code in an #ifdef?
> 
> It can certainly be wrapped, but looking into the code now, it probably 
> wouldn't really bring more clarity. I will apply the series with adding 
> the USB_HID dependency for now.

Hi Jiri,

I've been investigating a bit about this issue and I think this might not be the
righ solution for the problem.

John Chen's patch (9de07a4e8d4cb269f9876b2ffa282b5ffd09e05b):
https://lore.kernel.org/lkml/20210327130508.24849-5-johnchen902@gmail.com/

Already adds battery reporting over bluetooth, so my patch is redundant... And worse
than his, I should add.

I was investigating how to do something similar over USB, but I couldn't finish a patch yet.

So, if you don't mind, I'd prefer not to apply this patchset yet until I figure out
a better solution on v3.

Thanks,
Jose
