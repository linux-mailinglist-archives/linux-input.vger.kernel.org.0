Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4A2FB24735
	for <lists+linux-input@lfdr.de>; Tue, 21 May 2019 06:59:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727646AbfEUE71 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 21 May 2019 00:59:27 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:41122 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725793AbfEUE71 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 21 May 2019 00:59:27 -0400
Received: by mail-pf1-f195.google.com with SMTP id q17so8378750pfq.8;
        Mon, 20 May 2019 21:59:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=j34zkymZeoCyZ+au5aQhcz33vdqzPQugUFpYr584ItU=;
        b=AjOaqd9celvfnOikKk/WOnv1qgLCFEVxgzPNnDM8zSeKns4VmFmRSYOo8ingLKaQqu
         0KfebppSu6D8B4UscIEMt/QFhbtaYEm5VjuM3GDwKZZ7wzesQYGaesag/vAU/xexg3Zu
         u/th/utk72udJF3kdLn1JAWA84wqJ6hmkW6MWTXOgUKqNzbEFMwVyVyzgfKK7ci2B2NV
         jJm74Uo1pFgIzP4aehz1per1yj8aHFSHnjG63zi2RJdn4WBjL4Ch8wPAJ9m0e5kQ5P4i
         XNdToCWufW2by2EcdrHdBvmxsltxtDfAOMHBFAif5ncNvVf/ALOQ8q4aNHi8G7IwYrKL
         QGrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=j34zkymZeoCyZ+au5aQhcz33vdqzPQugUFpYr584ItU=;
        b=mSmaf8B5VYBndovX0HD47Moldhj2w6m1nFPuHM3Hs8UxWwcH3cmo8JgkcDmAQCYq4C
         MCekavHALNC1Tj7RLmSt18XvDQm0qVb868RwSozOBragrAH+qwsWyaKU8jETuaVjJr/p
         Za2/Ezubwv2i2E01XSE9QrBZunB6y16zeSxby6Js9vFZ54m0PSRsg++jmXf+HCycs1Hu
         rUylC5bkEd8kAB+OKX1Fi5DnZMZoYH9IQd0sELqkkYHu887cSFvih3YKQbWUsZj/y24E
         9/oMku/OiuUrgkNAQBGaPUVGZAAD+Z0n0a7Eecx1+xjT9dh52WHBgFXMUSxbHQVgPx09
         rikA==
X-Gm-Message-State: APjAAAW76rTcchJSCi1oKLg5ofeRqDW3/cOFIPp7ubQ/OxlMYRIv6d37
        s2SYIaKrgG+1nDK0jjD5UxBrmltG
X-Google-Smtp-Source: APXvYqwXPbiPtl15xmaphRr4Mbio5MKNZ4d6RpUZIc9SaHplzGNdP3kMDvIFgD93YJBPAvNms5hkPQ==
X-Received: by 2002:a62:e803:: with SMTP id c3mr38894373pfi.58.1558414765683;
        Mon, 20 May 2019 21:59:25 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id x18sm17090728pfo.8.2019.05.20.21.59.24
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 May 2019 21:59:25 -0700 (PDT)
Date:   Mon, 20 May 2019 21:59:23 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-input@vger.kernel.org,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Steve Twiss <stwiss.opensource@diasemi.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: Re: [PATCH RESEND 1/2] input: da9063_onkey: remove platform_data
 support
Message-ID: <20190521045923.GA183429@dtor-ws>
References: <20190520092711.30662-1-wsa+renesas@sang-engineering.com>
 <20190520092711.30662-2-wsa+renesas@sang-engineering.com>
 <CAMuHMdXAgvW4aZc7LmjNSrK3F2RCSC=QtOtDGS_xAu7SFAjFBw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdXAgvW4aZc7LmjNSrK3F2RCSC=QtOtDGS_xAu7SFAjFBw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, May 20, 2019 at 01:26:15PM +0200, Geert Uytterhoeven wrote:
> On Mon, May 20, 2019 at 12:40 PM Wolfram Sang
> <wsa+renesas@sang-engineering.com> wrote:
> > There are no in-kernel users anymore, so remove this outdated interface.
> >
> > Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> > Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
> > Acked-by: Steve Twiss <stwiss.opensource@diasemi.com>
> > Tested-by: Steve Twiss <stwiss.opensource@diasemi.com>
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Applied, thank you.

-- 
Dmitry
