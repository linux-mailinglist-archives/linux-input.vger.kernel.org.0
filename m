Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2E80B24738
	for <lists+linux-input@lfdr.de>; Tue, 21 May 2019 07:00:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726042AbfEUFAJ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 21 May 2019 01:00:09 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:35493 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725793AbfEUFAJ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 21 May 2019 01:00:09 -0400
Received: by mail-pl1-f196.google.com with SMTP id p1so2428322plo.2;
        Mon, 20 May 2019 22:00:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=M18GV491+ZMOmz3iAwSYuCPMXGVMm1QdFBdLR3izdGU=;
        b=Y1wsFAI9jEWY6p4ZVAuES9FBFvg0M1LWx+aElsIYegZasDrg/WbbO0vBI6vGGttPZt
         A+EaeksxDGUrYdjslrL2SPOxvqGhwB51/4rjIjqkuYNGiVsKJjtu3rrRGJ+hDL+eE2my
         tF7gXX7DSaOncx8gaIaq7xjXbgOapvSjJmn2ZG2Si2+UXIZRRyM6whShKtbRpQubTr1S
         7FEpvdcoyhX32BEniBdvwe0ThYmN9TkXURFs6A8ey61N2VuG0KgUDrcA6zD/TuziCHyn
         RLMemknOYdKevU/+xiLCvvmM+X9Q1wnOIUKlh9Cyd0uCEsqspJvquIobpMG1hLmpNLVP
         W3Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=M18GV491+ZMOmz3iAwSYuCPMXGVMm1QdFBdLR3izdGU=;
        b=frwlhJRZat7jK3OYtO2u2mMlbTcIkA1z8i1ZtHooxKZV+lv28I1P5YWE59DYKVoiYe
         EW5Pp+2jtZJsz0jJcvcbkqyPVTZoRkbXL+cMk4mng3OYTwvTO0rqKkhVhssvrMhlB9jx
         HbfIYRKQx1dntYdOenstFVVsbu7AVSjqBDDfYL0slAM02bCf3Ltskdm3NT3Tnv8sYpCJ
         gaWJ1+WZtTiOySXsBG/jYjHjexK6qWa5TBo9OD57UGI1TAswWkP3eslszlniJ1sR+fkt
         dzS+GXdFexU5741e7+lCnG7Hfkl42umrLgR030G/zrL0oMHyWw2yH1OCREQq/0TyV7Bp
         Ep3A==
X-Gm-Message-State: APjAAAWF2lYOReR+/CrNgrAsExLmhDeINWDArmr/sBqnEYPHoWXOW1X8
        JgAjK/r3yljHElS+hVXuyRJhpKkM
X-Google-Smtp-Source: APXvYqxZg7F5rzFrHJWxnNkMRi73WG2gtV6Z8l2zS0T6ygn8ExEWABiGgIr+Gsg9sfEUbNKIuvI6pQ==
X-Received: by 2002:a17:902:bd46:: with SMTP id b6mr19002748plx.173.1558414808153;
        Mon, 20 May 2019 22:00:08 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id 124sm28526884pfe.124.2019.05.20.22.00.06
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 May 2019 22:00:07 -0700 (PDT)
Date:   Mon, 20 May 2019 22:00:05 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-input@vger.kernel.org,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Steve Twiss <stwiss.opensource@diasemi.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: Re: [PATCH RESEND 2/2] input: da9063_onkey: convert header to SPDX
Message-ID: <20190521050005.GB183429@dtor-ws>
References: <20190520092711.30662-1-wsa+renesas@sang-engineering.com>
 <20190520092711.30662-3-wsa+renesas@sang-engineering.com>
 <CAMuHMdXBDYUQYSRgi2_BCQyZhamUbx5fBZn8-nbMrp=5tw=DUw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdXBDYUQYSRgi2_BCQyZhamUbx5fBZn8-nbMrp=5tw=DUw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, May 20, 2019 at 01:24:18PM +0200, Geert Uytterhoeven wrote:
> On Mon, May 20, 2019 at 12:40 PM Wolfram Sang
> <wsa+renesas@sang-engineering.com> wrote:
> > Covnert the header of the source file to SPDX.
> 
> Convert
> 
> > Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> > Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
> > Acked-by: Steve Twiss <stwiss.opensource@diasemi.com>
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Applied, thank you.

-- 
Dmitry
