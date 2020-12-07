Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B920A2D17F7
	for <lists+linux-input@lfdr.de>; Mon,  7 Dec 2020 18:57:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725877AbgLGR4d (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 7 Dec 2020 12:56:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725814AbgLGR4c (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 7 Dec 2020 12:56:32 -0500
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B06DCC061749
        for <linux-input@vger.kernel.org>; Mon,  7 Dec 2020 09:55:52 -0800 (PST)
Received: by mail-pg1-x544.google.com with SMTP id g18so9556817pgk.1
        for <linux-input@vger.kernel.org>; Mon, 07 Dec 2020 09:55:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=/VmFisjt6UGqmwTTXf3GTFuYTAxBMx/lKhpgg3iEckQ=;
        b=SDkl+azn3j6wJQYmaW7uX1FAKZTrbAYcs3bEEK8W58m64eBXQGFSodepF4Vno7/s0U
         qx43TSps/AVAygyg8CNyjB7Ysl0oub7lKLWdtFkc1ulfF/tDRVQlK0N6d0vyGtrgb9PT
         VNaIvq2JFLKwPySsIzWaBuLtSJe/RB0m07BA0MeDOz5z6PT5a7xRvbWyn5LCz/ECZTgT
         G4cW58zCHLwzpm9/Rt57K0LMnNdQnM4QKykvwSGS1CY7P/v1HYQ2e1FaHFezpmGgjWVT
         8e5epbqobEbJUEBu8v8RXOeV9xQqhCyepIXwtCxE6I0DlAxgRlLlh79Q6b62J/0rrUsC
         catw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=/VmFisjt6UGqmwTTXf3GTFuYTAxBMx/lKhpgg3iEckQ=;
        b=BHKneHVRu6VKDZ+GCKMlINsv2RMEyEXyyO4wB097BlvEIL9K91aF2ock99GliCbWXH
         6B3NbTqGXySaSPzrjeANVnRGQHDzhpRnFHZwshWYRkJT1QInE3XqTkgG7uhSH3u00VnL
         Vw08DDMrUpwjV50pgWz/SGWMBqkb6k8ti6ucC8mNzE66hgCNd9DquEnwScA+H/LOiGSN
         jaNXT5/J/wYZqlhsEPquElGABnjqhc/GjIgveVWTZHmabKyt8hGGaMd5a4lzfrdkvOYN
         ChXpwp1H3NST4So/RznekmjXTvNIAXrwvl4cAHiQhMwgO+u4dr8OQmtEbsAi0XBOwGdG
         ZrMw==
X-Gm-Message-State: AOAM532VfMZH2jX7YCyCk+rkwBebGAdPy+peOp45FRznDf5iEP3VO3/9
        GQHZ4FWDJNaXh5ii0651AwhDaQ==
X-Google-Smtp-Source: ABdhPJyhgMV4r8ALFI9/0TZ08Brv9RVOGMivqz8bi3q2HtDnWZIG+uHWQ2gge2KRqipIV8qSkJ00YQ==
X-Received: by 2002:a63:4516:: with SMTP id s22mr19631724pga.45.1607363751999;
        Mon, 07 Dec 2020 09:55:51 -0800 (PST)
Received: from google.com (h208-100-161-3.bendor.broadband.dynamic.tds.net. [208.100.161.3])
        by smtp.gmail.com with ESMTPSA id d20sm388733pjz.3.2020.12.07.09.55.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Dec 2020 09:55:51 -0800 (PST)
Date:   Mon, 7 Dec 2020 09:55:48 -0800
From:   Will McVicker <willmcvicker@google.com>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        security@kernel.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-team@android.com,
        Will Coster <willcoster@google.com>, stable@vger.kernel.org
Subject: Re: [PATCH v1] HID: make arrays usage and value to be the same
Message-ID: <X85spIzp1/gRxvKr@google.com>
References: <20201205004848.2541215-1-willmcvicker@google.com>
 <X8tMDQTls/RcTSAy@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <X8tMDQTls/RcTSAy@kroah.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sat, Dec 05, 2020 at 09:59:57AM +0100, Greg KH wrote:
> On Sat, Dec 05, 2020 at 12:48:48AM +0000, Will McVicker wrote:
> > The HID subsystem allows an "HID report field" to have a different
> > number of "values" and "usages" when it is allocated. When a field
> > struct is created, the size of the usage array is guaranteed to be at
> > least as large as the values array, but it may be larger. This leads to
> > a potential out-of-bounds write in
> > __hidinput_change_resolution_multipliers() and an out-of-bounds read in
> > hidinput_count_leds().
> > 
> > To fix this, let's make sure that both the usage and value arrays are
> > the same size.
> > 
> > Signed-off-by: Will McVicker <willmcvicker@google.com>
> 
> Any reason not to also add a cc: stable on this?
No reason not to include stable. CC'd here.

> 
> And, has this always been the case, or was this caused by some specific
> commit in the past?  If so, a "Fixes:" tag is always nice to included.
I dug into the history and it's been like this for the past 10 years. So yeah
pretty much always like this.

> 
> And finally, as you have a fix for this already, no need to cc:
> security@k.o as there's nothing the people there can do about it now :)
Is that short for security@kernel.org? If yes, then I did include them. If no,
do you mind explaining?

> 
> thanks,
> 
> greg k-h
