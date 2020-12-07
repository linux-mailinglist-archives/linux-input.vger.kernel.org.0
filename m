Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A56D2D191A
	for <lists+linux-input@lfdr.de>; Mon,  7 Dec 2020 20:08:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726791AbgLGTGg (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 7 Dec 2020 14:06:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726457AbgLGTGf (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 7 Dec 2020 14:06:35 -0500
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F1B6C061794
        for <linux-input@vger.kernel.org>; Mon,  7 Dec 2020 11:05:55 -0800 (PST)
Received: by mail-pf1-x442.google.com with SMTP id t8so10997559pfg.8
        for <linux-input@vger.kernel.org>; Mon, 07 Dec 2020 11:05:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=m4BmF9Og147J/tDCMb/xyUBIR3sMZyzlByWbiiAL4/g=;
        b=c4qvy96xbMXp9+Lbo1+N+phXvHd+9cUPooDaRH2/qZXcUUukPzjFmD/J7aroSOVjXE
         bAAxyXG9T/WF2KjovDZUAtFNuAFkGHD22DxmgJMFPg/yhHMdvPUg6lU4gRruJ2euQs9v
         Eiv3Q77kSZOuQsSYa9wiF+CUe8b7HjrQGDL+3Mk+b+mXnjKHg74/koim0E1B3ubB5vsp
         all6LfDScScW0GLuPvS3gJa6YdoggMff9smhQMdW7vtajfIwIrDr/JPknzQcbmYlhHKH
         +APk0yuosXxZiOygIJXPNFYZ62nqLcLXGiAOWaDnGabzgwHtvZSDo6wblt5AkX6IYIGX
         58Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=m4BmF9Og147J/tDCMb/xyUBIR3sMZyzlByWbiiAL4/g=;
        b=iG/PoQPNznjrnPRS3zBTEhBhwrrdn3A1puIOzSnpK8tPfL7k8T4+KPqbijiw282Q97
         yknA0c6PoN2PEk9GvdBNloJBMa2fR7NgXxfd3C6Tv2iSAIFfiA9LuC2P7ZFeeH0bVdw5
         LUjvNB663fqoiKLvc1sQcd5wOujNypVQCjQoXtQwEFEclReosz9n6z0v2Su8maQ1LXmH
         gTSUM/WLW3gm62efYwslUedPBKrQDjDWn4/+FNswp4TkCJyUZ5uBVGu7KEAGQzSACrgG
         NdgmVyz4gLT1zk0JMUcJp5Nnwv8/xpaf6SAIuJzCOiKpd/DodqaDWp7MRyndPQZQLzTy
         8ttQ==
X-Gm-Message-State: AOAM53138qRmpEFIqAaCsX4DiRR6txD2FeeH9n1+hkmcDbhmhq7fgPKn
        kp6QZFuligxUvizUU8mAd7ZAwQ==
X-Google-Smtp-Source: ABdhPJxJQW87+WZC2h+rzvUjxo8PQkSvHvGPd1Pqcch6g48eEqmVKa3eZ5Ey3YfHA0J+uyHbYvtv1w==
X-Received: by 2002:a17:902:a982:b029:da:e252:78d8 with SMTP id bh2-20020a170902a982b02900dae25278d8mr11511281plb.16.1607367954705;
        Mon, 07 Dec 2020 11:05:54 -0800 (PST)
Received: from google.com (h208-100-161-3.bendor.broadband.dynamic.tds.net. [208.100.161.3])
        by smtp.gmail.com with ESMTPSA id f7sm14905105pfe.30.2020.12.07.11.05.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Dec 2020 11:05:53 -0800 (PST)
Date:   Mon, 7 Dec 2020 11:05:51 -0800
From:   Will McVicker <willmcvicker@google.com>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        security@kernel.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-team@android.com,
        Will Coster <willcoster@google.com>, stable@vger.kernel.org
Subject: Re: [PATCH v1] HID: make arrays usage and value to be the same
Message-ID: <X859DwaYr/GtYDHN@google.com>
References: <20201205004848.2541215-1-willmcvicker@google.com>
 <X8tMDQTls/RcTSAy@kroah.com>
 <X85spIzp1/gRxvKr@google.com>
 <X85zUOmQ6e6T8wqQ@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <X85zUOmQ6e6T8wqQ@kroah.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Dec 07, 2020 at 07:24:16PM +0100, Greg KH wrote:
> On Mon, Dec 07, 2020 at 09:55:48AM -0800, Will McVicker wrote:
> > On Sat, Dec 05, 2020 at 09:59:57AM +0100, Greg KH wrote:
> > > On Sat, Dec 05, 2020 at 12:48:48AM +0000, Will McVicker wrote:
> > > > The HID subsystem allows an "HID report field" to have a different
> > > > number of "values" and "usages" when it is allocated. When a field
> > > > struct is created, the size of the usage array is guaranteed to be at
> > > > least as large as the values array, but it may be larger. This leads to
> > > > a potential out-of-bounds write in
> > > > __hidinput_change_resolution_multipliers() and an out-of-bounds read in
> > > > hidinput_count_leds().
> > > > 
> > > > To fix this, let's make sure that both the usage and value arrays are
> > > > the same size.
> > > > 
> > > > Signed-off-by: Will McVicker <willmcvicker@google.com>
> > > 
> > > Any reason not to also add a cc: stable on this?
> > No reason not to include stable. CC'd here.
> > 
> > > 
> > > And, has this always been the case, or was this caused by some specific
> > > commit in the past?  If so, a "Fixes:" tag is always nice to included.
> > I dug into the history and it's been like this for the past 10 years. So yeah
> > pretty much always like this.
> > 
> > > 
> > > And finally, as you have a fix for this already, no need to cc:
> > > security@k.o as there's nothing the people there can do about it now :)
> > Is that short for security@kernel.org? If yes, then I did include them. If no,
> > do you mind explaining?
> 
> Yes, I see you included it, my point was that once you have a patch,
> there is no need to include this email address as all we do at this
> address is work to match up a problem with a developer that can create a
> fix.  You already did this, so no need for us to get involved at all! :)
> 
> thanks,
> 
> greg k-h
Ah okay, thanks for the explanation!

--Will
