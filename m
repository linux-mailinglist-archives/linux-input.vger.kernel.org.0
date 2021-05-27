Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D1655393482
	for <lists+linux-input@lfdr.de>; Thu, 27 May 2021 19:05:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236824AbhE0RHR (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 27 May 2021 13:07:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236796AbhE0RHR (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 27 May 2021 13:07:17 -0400
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC669C061574;
        Thu, 27 May 2021 10:05:42 -0700 (PDT)
Received: by mail-pg1-x534.google.com with SMTP id r1so396047pgk.8;
        Thu, 27 May 2021 10:05:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=QtS0RsJEV0FthRRAjWu5kxz2gjTDJnrn++qGkSLgvW4=;
        b=Ad/DAGLCJtRz8b72njjqO+k2XFNpxkvKbMsu6Hzbd7Dt25Z59epePgq7rSy9+cl/0r
         /YATkBbbXZL5cGFfLMir9vzUZZ4sVzJcq1YMvKWGfbO4KkIy/yxwBWhPZ7esqCoDT5mv
         60x8HPNvX+Yf6l1xt5TC30PXQPauhXMY+h4n1p6CooByw+gDwotLfvdA/tB7zWmQSZMy
         mDUyZQYR2++CgDWCdMEXqpkx6QzG2mhUUdMDSXmdHbAIJ60/xn2VQxqCarevdF4Tg9Cg
         6YdhFTImGidyFvgmHPeBlA8ZaiOev8OGDwZpYnRkk1MDAXLBBYrg30PHLPlJgrvJ4gId
         /M2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=QtS0RsJEV0FthRRAjWu5kxz2gjTDJnrn++qGkSLgvW4=;
        b=mahGFc2OT5DkoLQoao3KsnoC8i/oBWuXQ8OETtgIJ/nCdN0RIAKaMr1WPxLSK5rmqD
         uSwQ6hhatmE6w/8BiYWKmC5yv3JCcwZg0grG+uobrBv62/zrxrGrmLXkltwlR27S4aj9
         D2WFaaFoSt4Soj2QB1r6Bw5F6+bHu+DIpCCrHU3lUIZ0J9jkg8loenHYhQZD4ASHFRex
         w3Qao6f3PsHNUUhcaVaOmVRpVAE9Qhgx/sUpNKOj+Gsqopoxwn9wY2vZtQQQc2JcLGcW
         bUJ0z8T/2IjjbkHWxJaK2G/U+RJaWETAsLuLUczRPetduIGC7xPqD+S50HjrmGi9TpvJ
         bJLA==
X-Gm-Message-State: AOAM5320nGLqzHRlAkk4bEERhNR2iVXlFjPHyZrSyVBn2PDtv7jB8dsj
        TRgrR7i5wW/ZrFyKU2iwrrQ9g3w6Hos/yg==
X-Google-Smtp-Source: ABdhPJyh4UFEx6bbWd73bsAqy73iHeI0QpX/DzTOBx1CQpqfEAaNTkJRNkJutUCKijb4I/2q/T+D1A==
X-Received: by 2002:a63:d014:: with SMTP id z20mr4523221pgf.428.1622135142619;
        Thu, 27 May 2021 10:05:42 -0700 (PDT)
Received: from hyeyoo ([183.99.11.150])
        by smtp.gmail.com with ESMTPSA id z7sm2376494pgr.28.2021.05.27.10.05.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 May 2021 10:05:42 -0700 (PDT)
Date:   Fri, 28 May 2021 02:05:36 +0900
From:   Hyeonggon Yoo <42.hyeyoo@gmail.com>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-usb@vger.kernel.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: usbmouse: Avoid GFP_ATOMIC when GFP_KERNEL is
 possible
Message-ID: <20210527170536.GA143409@hyeyoo>
References: <20210524145743.GA92203@hyeyoo>
 <20210527164517.GA143281@hyeyoo>
 <YK/Or91JIpbpwWjL@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YK/Or91JIpbpwWjL@kroah.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, May 27, 2021 at 06:54:07PM +0200, Greg KH wrote:
> It has been only 4 days.  For a non-bugfix and for something that is
> only a "cleanup" change, give it at least 2 weeks please.
> 
> Relax, there is no rush for stuff like this.

Hello Greg!

Okay You are right. I'll relax...

I think I need to be familiar with the process :)

Thank you!
Hyeonggon
