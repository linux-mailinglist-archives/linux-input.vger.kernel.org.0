Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E52E9981CC
	for <lists+linux-input@lfdr.de>; Wed, 21 Aug 2019 19:54:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726785AbfHURy1 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 21 Aug 2019 13:54:27 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:37622 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726252AbfHURy1 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 21 Aug 2019 13:54:27 -0400
Received: by mail-pf1-f195.google.com with SMTP id y9so1544444pfl.4;
        Wed, 21 Aug 2019 10:54:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=hQvpuE7ickHKJ52w1YyWzUvO9eTgSHEg1TfmNUoHpDA=;
        b=OdsyLyWI1H2H3QMzc6Z77+GA50ycKfpclJiY2wLk8LRHGaDuYolz8OU2PDjR7i8uNz
         PVV99n782kSoXgDZW1867GmbQ2nrY3wHxpduVJyHRzrY4Q9MDncTFdj2ZqUYdL2FQGJj
         YpxcjBSIxzkd978tpFcxCa53hziyaBAkR/uX5Bs4tuE0qggmQfVwM8rWNNDq2aGdm/F6
         fycpM9tJ45oQrC00JoXT05gvP5mpAOrKw5O126Kt9kV/R+KWiSBxdD+fy3R3B33U/axo
         UxmxH6ff0wOIId/bot7WVXjfOgyH4Z9+ijfbA64RzsyjXwPtc8PrpPDuSzVvp+Qw0tBG
         ThNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=hQvpuE7ickHKJ52w1YyWzUvO9eTgSHEg1TfmNUoHpDA=;
        b=YXuPDaRvmwhiSKCgbShAz1J7T5umaUxr8LTaPniByWsiWmcoaomJBq9ukA0t9dw5nH
         pcCrlhLgOh+iF+FHhCsf0sLvYiEWbPDH4rnpFxqgbD3wk1w5xZrfYwIvFRtvUqYNaXOL
         b+hSdgGNH2o7lIZqDucXRTjc8maxqq7GG5+s8Hhx03Z0Q0sct59PQSsHXLsG63ixZbTi
         xxrigeoMp7v4dZo7gXvgudzjfcoxwNjUIhLllJCLUI5ISe2DZacbUCPwLwDzvmZr4+hr
         +k0q8kf3za4IhwEE/XRXUITsXwaxpkdxZwafc9Fi9xNP8Du/iZEIU8Xr5BfZK3vGu/a+
         o+QA==
X-Gm-Message-State: APjAAAXPBM4F1Cv/v0tGdLCEZyRD9F+NGYUPITw0uQJZmkncVzxTqW5s
        2r+HneMG3rHgTYC6JZ0b6a4=
X-Google-Smtp-Source: APXvYqxZtAAOquwUy1cyF0nTstczBGdYuYBRbKInYdAQJKUgKld8r/WXQp12RaKpXD5/FoqNRjyv5A==
X-Received: by 2002:a17:90a:21eb:: with SMTP id q98mr1155441pjc.23.1566410066070;
        Wed, 21 Aug 2019 10:54:26 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id w26sm28288566pfq.100.2019.08.21.10.54.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Aug 2019 10:54:25 -0700 (PDT)
Date:   Wed, 21 Aug 2019 10:54:22 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Jiada Wang <jiada_wang@mentor.com>
Cc:     nick@shmanahar.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, george_davis@mentor.com
Subject: Re: [PATCH v1 03/63] Input: atmel_mxt_ts - only read messages in
 mxt_acquire_irq() when necessary
Message-ID: <20190821175422.GE76194@dtor-ws>
References: <20190816082952.17985-1-jiada_wang@mentor.com>
 <20190816082952.17985-4-jiada_wang@mentor.com>
 <20190816171622.GF121898@dtor-ws>
 <558e1227-7671-0838-d4e0-f234833c0973@mentor.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <558e1227-7671-0838-d4e0-f234833c0973@mentor.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Aug 21, 2019 at 10:26:31PM +0900, Jiada Wang wrote:
> Hi Dmitry
> 
> On 2019/08/17 2:16, Dmitry Torokhov wrote:
> > On Fri, Aug 16, 2019 at 05:28:52PM +0900, Jiada Wang wrote:
> > > From: Nick Dyer <nick.dyer@itdev.co.uk>
> > > 
> > > The workaround of reading all messages until an invalid is received is a
> > > way of forcing the CHG line high, which means that when using
> > > edge-triggered interrupts the interrupt can be acquired.
> > > 
> > > With level-triggered interrupts the workaround is unnecessary.
> > > 
> > > Also, most recent maXTouch chips have a feature called RETRIGEN which, when
> > > enabled, reasserts the interrupt line every cycle if there are messages
> > > waiting. This also makes the workaround unnecessary.
> > > 
> > > Note: the RETRIGEN feature is only in some firmware versions/chips, it's
> > > not valid simply to enable the bit.
> > 
> > Instead of trying to work around of misconfiguration for IRQ/firmware,
> > can we simply error out of probe if we see a level interrupt with
> > !RETRIGEN firmware?
> > 
> I think for old firmwares, which doesn't support RETRIGEN feature, this
> workaround is needed, otherwise we will break all old firmwares, which
> configured with edge-triggered IRQ

Do you know if there are any? I know Chrome OS firmware have RETRIGEN
activated and they are pretty old (original Pixel is from 2013). But if
we indeed have devices with edge interrupt and old not firmware that
does not retrigger, I guess we'll have to keep it... 

Thanks.

-- 
Dmitry
