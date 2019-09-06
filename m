Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AC5FAAC038
	for <lists+linux-input@lfdr.de>; Fri,  6 Sep 2019 21:09:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392932AbfIFTJY (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 6 Sep 2019 15:09:24 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:46169 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392916AbfIFTJY (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 6 Sep 2019 15:09:24 -0400
Received: by mail-pf1-f194.google.com with SMTP id q5so5095778pfg.13;
        Fri, 06 Sep 2019 12:09:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ma6Tu8w1pUSuy9BaqryD7q/KmAKTaHA+Knrq/Z2rpYA=;
        b=gCOqk6IH6MXlJoSnUrrR5ztwnkH9QHZ2R03FHK0c0N6hz6arNBSXd7pEC8FoArYmkN
         2Oled/wQxOBjr6uxqhMPn6beJLZa64vkQg4kueiGUd8cBx+eXSUeM7vb66IRdwNKM59M
         e5fMr3IQj73CBtInsULDXMZeXJZPGrRMV1U9CC6dBOIgJ6mphN5OwjguE18F7+P/vpBR
         qRhMsn7wnGVfpfauYI5j2bgHFSzDoRSBHH1k0capKzI3dnvnC4eyRvVhYi9Yn76mGoPk
         gUYPsftO5ylhXyrqWA4EbwLfAaKyVWYBdyEmN7BRXLyTv9EeRGMBQprINqTvyLz/Ohvt
         vYFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ma6Tu8w1pUSuy9BaqryD7q/KmAKTaHA+Knrq/Z2rpYA=;
        b=mDBeG/gTjgmQ6//0MOGHmhs7pXE10H/r7G+MW8t3JayQtxgGnGCLlpOcoJR3wgJ3qN
         uBeXFD7iCUm0nt5Qxc9majRoChKt7Bcyxo/0UIedGLruFKPMlk7ojKXGVBVS5iOo3ORn
         dPX8g6iZ0tLhqBocypR43tmfrjfX7NFlpb7dWFxtdb5bCUnuw1UhGkrdqLJL0jUmxAnG
         CdqBhKI9b0Wgvrl7yl3XzcfmIpyOYNyVivsk6NF1XdMBg5NUNkLSgxcFD15nd3kxKvE0
         EnMQU5Ch7qJ6eVNyYsb8vUhFsGftspglcmYq+e40JTC6pyklj+RsErLtc2cyKSdBYgaX
         1/pA==
X-Gm-Message-State: APjAAAVB+fgRfWJ1aGsu1VXlTdI1W3ed46j7pEQlq7+ki+HDehfRK9Xi
        I7pUfgwNRLXR+tqpDceGW+E=
X-Google-Smtp-Source: APXvYqyu0bh/v7TklWt6ccJ/3x10ObXBND5aSbOPLqRL/YsJNg84lzGFPNTFG1oKjl8fvHAhN6BjIg==
X-Received: by 2002:a17:90a:a594:: with SMTP id b20mr1876259pjq.0.1567796963530;
        Fri, 06 Sep 2019 12:09:23 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id f19sm7140441pfn.100.2019.09.06.12.09.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Sep 2019 12:09:23 -0700 (PDT)
Date:   Fri, 6 Sep 2019 12:09:21 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input - elan_i2c: remove Lenovo Legion Y7000 PnpID
Message-ID: <20190906190921.GQ187474@dtor-ws>
References: <20190906085948.27470-1-benjamin.tissoires@redhat.com>
 <20190906190334.GP187474@dtor-ws>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190906190334.GP187474@dtor-ws>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Sep 06, 2019 at 12:03:34PM -0700, Dmitry Torokhov wrote:
> On Fri, Sep 06, 2019 at 10:59:48AM +0200, Benjamin Tissoires wrote:
> > Looks like the Bios of the Lenovo Legion Y7000 is using ELAN061B
> > when the actual device is supposed to be used with hid-multitouch.
> > 
> > Remove it from the list of the supported device, hoping that
> > no one will complain about the loss in functionality.
> > 
> > Link: https://bugzilla.kernel.org/show_bug.cgi?id=203467
> > Fixes: Fixes: 738c06d0e456 ("Input: elan_i2c - add hardware ID for multiple Lenovo laptops")
> > Signed-off-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>
> 
> I suppose this one should go to stable?

Gah, I am not very attentive, as you just said it below. Sorry.

> 
> > ---
> > 
> > Note to self: once this gets in, we need to send a similar patch
> > to stable, as there are a few stable branches with this PnpID.
> > 
> > 
> >  include/linux/input/elan-i2c-ids.h | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/include/linux/input/elan-i2c-ids.h b/include/linux/input/elan-i2c-ids.h
> > index ceabb01a6a7d..1ecb6b45812c 100644
> > --- a/include/linux/input/elan-i2c-ids.h
> > +++ b/include/linux/input/elan-i2c-ids.h
> > @@ -48,7 +48,7 @@ static const struct acpi_device_id elan_acpi_id[] = {
> >  	{ "ELAN0618", 0 },
> >  	{ "ELAN0619", 0 },
> >  	{ "ELAN061A", 0 },
> > -	{ "ELAN061B", 0 },
> > +/*	{ "ELAN061B", 0 }, not working on the Lenovo Legion Y7000 */
> >  	{ "ELAN061C", 0 },
> >  	{ "ELAN061D", 0 },
> >  	{ "ELAN061E", 0 },
> > -- 
> > 2.21.0
> > 
> 
> -- 
> Dmitry

-- 
Dmitry
