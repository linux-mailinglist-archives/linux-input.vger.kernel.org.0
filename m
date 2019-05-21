Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 756622478C
	for <lists+linux-input@lfdr.de>; Tue, 21 May 2019 07:33:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725982AbfEUFda (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 21 May 2019 01:33:30 -0400
Received: from mail-it1-f193.google.com ([209.85.166.193]:35391 "EHLO
        mail-it1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725794AbfEUFda (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 21 May 2019 01:33:30 -0400
Received: by mail-it1-f193.google.com with SMTP id u186so2791279ith.0;
        Mon, 20 May 2019 22:33:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=qcWDyowsodXm2n1MA4A4w11yolgybnYMAxlyc/yC8j0=;
        b=D+FJZ/ioVAn3il7oubScsGsHjyKgmNIp/wW6n4Z0RPrXKeHTvReYIkj4rzjeOqdxNq
         OaUFNB9WmAAO8GtGeyjwxGqVHPcYvqsw3EYjKKGzPWzXQL8l7FHxkdI7LBWM6ttKlGqk
         uBbE3XKy++H/fA+DceSKv3zd5Tgk+xA0HIIK3mQTtsepDh0Ip3joXh0IYHSlUMsOGJuE
         BepdX7O0UuddBTM2suqB2t1l3GJfpAMFCTuQ6ZMjw1y+BicS1zFnUct9Ma42N5i2Tj0y
         TXqxLMUOwrRu03dWOAMMFSRJq5wCbFHbLyurRbQ3R3+s2fCxUSlMtSZy3OBCm4FQeB59
         hOGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=qcWDyowsodXm2n1MA4A4w11yolgybnYMAxlyc/yC8j0=;
        b=koovTRHrto5TJZZ5Szg93X7hGZiP2qleGbpPAPaB3v45cvcfqS+emlRIOsJoBulJMd
         qbOzcqL+ztaPqF/ee7RkLoh/PbH/AbtAOQ7J7MQreYMAz+EaLtTw8fA7zhHVs7E/Iqe3
         Iv8Uabhpt+Rr3NOl89H7w2zyBfvryuokEKQARY6Zzz5d2QZt3e4WmRCf/EWN6GjNNxhD
         uwitjPxkXeaytfgaUP9kwSrkcY6kCHuuTrROCNmiO48rGQzisZbpEEMF069unXT6cxpI
         vyf+qb3SqWRUPcBm/i5iQUe80uc+SerF+EHkTuGfbSLytTLhWqTKVkX1r+AYWmgX+jtS
         k7+w==
X-Gm-Message-State: APjAAAW/VVO0Le8mssxYAQw+5yTDaZAHeXd3kaHHtUFKLCdkpGQ4XPuA
        pA6t/71E7zaj3hWdRGxNuBA=
X-Google-Smtp-Source: APXvYqwPYwHr/YQ2WmprWTuIFOzV4XdX0OHol3uLhuIJVtrlmaC09Af+Hyl7uVOum1dQMiuuZLsRIw==
X-Received: by 2002:a02:a615:: with SMTP id c21mr2603061jam.67.1558416808904;
        Mon, 20 May 2019 22:33:28 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id c185sm924149itc.17.2019.05.20.22.33.27
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 May 2019 22:33:28 -0700 (PDT)
Date:   Mon, 20 May 2019 22:33:26 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     stefano.manni@gmail.com
Cc:     nick@shmanahar.org, robh+dt@kernel.org, mark.rutland@arm.com,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] Input: atmel_mxt_ts - add wakeup support
Message-ID: <20190521053326.GH183429@dtor-ws>
References: <20190517211741.8906-1-stefano.manni@gmail.com>
 <20190517213016.GA93581@dtor-ws>
 <6f94097bb9192424f92e055e8af8062b2ae3e19f.camel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6f94097bb9192424f92e055e8af8062b2ae3e19f.camel@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sat, May 18, 2019 at 06:55:10PM +0200, stefano.manni@gmail.com wrote:
> Hi Dmitry,
> 
> On Fri, 2019-05-17 at 14:30 -0700, Dmitry Torokhov wrote:
> > Hi Sefano,
> > 
> > On Fri, May 17, 2019 at 11:17:40PM +0200, Stefano Manni wrote:
> > > Add wakeup support to the maxtouch driver.
> > > The device can wake up the system from suspend,
> > > mark the IRQ as wakeup capable, so that device
> > > irq is not disabled during system suspend.
> > 
> > This should already be handled by I2C core, see lines after "if
> > (client->flags & I2C_CLIENT_WAKE)" in drivers/i2c/i2c-core-base.c.
> > 
> > Unless there is dedicated wakeup interrupt we configure main
> > interrupt
> > as wake source.
> > 
> 
> what's about the other drivers (e.g. ili210x.c) doing like this?
> Shall they be purged?

They were likely done before I2C and driver core were enhanced to handle
wakeup automatically. We might want to clean them up, as long as we
verify that they keep working.

Thanks.

-- 
Dmitry
