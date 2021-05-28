Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B04EC394814
	for <lists+linux-input@lfdr.de>; Fri, 28 May 2021 22:54:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229493AbhE1U4J (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 28 May 2021 16:56:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229482AbhE1U4I (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 28 May 2021 16:56:08 -0400
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FC30C061574;
        Fri, 28 May 2021 13:54:33 -0700 (PDT)
Received: by mail-pl1-x62b.google.com with SMTP id e15so2204730plh.1;
        Fri, 28 May 2021 13:54:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=KNDQDSaQDqhu/I3Lsua3rDkqU5ss+4y1pi3/AYZD5nM=;
        b=kzojuoafDvBuc8jVKb7iEbNT4hTj0WtQcWi6IHn6+mZSI9vVDYW4DPaIgxZdwgxHUY
         MspNuxhiuFW3vdBkyklLOuqJqIX1RDL1oNFTHyYGYFi/e7xR3Z3IKbRiM2Gk1B/dd9/R
         5d6exAcyvxZeiy0U31tuONOcv7LeE8mb7/PVsvMYeYmZFTemtXx4TU4xgnqRlFXwVkdF
         j3+3hfLPyCy3vNv0o4k19l+mb9yiiv0Q1oh1Lv17OeJ1UnQfkX3XBN4h3Q+PZQbe27jf
         g1ZnCFsk3FPS8bBGvmvvEZdQu83oQ4JuB2xup7K7gzrNAPQ8Sda7V1x3f0DsCIsI+q17
         mPzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=KNDQDSaQDqhu/I3Lsua3rDkqU5ss+4y1pi3/AYZD5nM=;
        b=M8U00maaIEpfWYKiWjGORHZnvXs1ENc7smaLM60+vm1jrawYbrFSCE8z9waMn/5jWl
         dEqDK/zkrCf9HGPGqu8o+pDJuMbwv+G0C8w2tlJVCJEHnTrDPGXaaPdOZ+EVNfJPN9wG
         wO0VvWtc1Ac2o/n8h1YZ6Tf0W/FUMFyh2UDjvuBYlOH025SZltOAWy2hxrLEaHRurquT
         SP27J0mBhmZpwLG81Oa/VVniR0S73aSPC99OjPs/htO2iiGVYkvFGTrQDRui2WcfK4An
         bOZbhm4YVTxpizNjji0Eol/gZHB5YQ5ADBtviS3tVOs+V6wBmu9nYjwn5r2gQ/dxkzdl
         0YQg==
X-Gm-Message-State: AOAM5307arnAKjpKmH2xO5BiVjH9B9RB9fZzGpbX/mHqpymtHBTIs09b
        ZsMwMBhbe8ZC/rQASXFu8oKyltQTdSkoiQ==
X-Google-Smtp-Source: ABdhPJw/BNYemzoSNkVPloZgSztLrC4nUdQAMIp/7cCNHAXaWGzpukk1hV11gNbCEMLF42Z+FcB/MA==
X-Received: by 2002:a17:90a:fa14:: with SMTP id cm20mr6548429pjb.90.1622235273112;
        Fri, 28 May 2021 13:54:33 -0700 (PDT)
Received: from hyeyoo ([183.99.11.150])
        by smtp.gmail.com with ESMTPSA id s3sm5504581pgs.62.2021.05.28.13.54.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 May 2021 13:54:32 -0700 (PDT)
Date:   Sat, 29 May 2021 05:54:27 +0900
From:   Hyeonggon Yoo <42.hyeyoo@gmail.com>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-usb@vger.kernel.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: usbmouse: Avoid GFP_ATOMIC when GFP_KERNEL is
 possible
Message-ID: <20210528205427.GB5911@hyeyoo>
References: <20210524145743.GA92203@hyeyoo>
 <20210527164517.GA143281@hyeyoo>
 <YK/Or91JIpbpwWjL@kroah.com>
 <20210527170536.GA143409@hyeyoo>
 <YK/SvAoog4TKygoY@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YK/SvAoog4TKygoY@kroah.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, May 27, 2021 at 07:11:24PM +0200, Greg KH wrote:
> On Fri, May 28, 2021 at 02:05:36AM +0900, Hyeonggon Yoo wrote:
> > On Thu, May 27, 2021 at 06:54:07PM +0200, Greg KH wrote:
> > > It has been only 4 days.  For a non-bugfix and for something that is
> > > only a "cleanup" change, give it at least 2 weeks please.
> > > 
> > > Relax, there is no rush for stuff like this.
> > 
> > Hello Greg!
> > 
> > Okay You are right. I'll relax...
> > 
> > I think I need to be familiar with the process :)
> 
> Please go read Documentation/process/ for all of that while you wait :)

I'm reading it and Thanks for letting me know it.
it helps a lot... I should read it many times.

and the patch seems already applied to linux-next :)

Thanks,
Hyeonggon
