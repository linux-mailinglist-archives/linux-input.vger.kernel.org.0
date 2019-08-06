Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E04CE8365A
	for <lists+linux-input@lfdr.de>; Tue,  6 Aug 2019 18:10:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729638AbfHFQKN (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 6 Aug 2019 12:10:13 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:38502 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732203AbfHFQKN (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 6 Aug 2019 12:10:13 -0400
Received: by mail-pg1-f196.google.com with SMTP id z14so4608569pga.5
        for <linux-input@vger.kernel.org>; Tue, 06 Aug 2019 09:10:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=CPNKoyQPlYek2m94r2jU2l4U7Eic9yslYk7XyBMTRrM=;
        b=dH2L3IMYLIS2cpFDKK1C0D3maWYwn7vyGE/EztKixNpi9OO+udbuGUkbAaYWWHMLDR
         ocBH5nyIgsDiiJEAgE6dmT9aUnoCVpAzHsBgyN7nKsrSgHEptNTAXN4kI93Cm1LsDuhv
         ZMrjwaV3IqhuEDBJkp7WDwEpnNu5qcinYlYw9W+dggT5MOwag/Fxs2uaasV9RSBraTyq
         U6fEciGYt++jRT+UZzdLJs4/5sTj/wLmpnqABAy8Mo1Kpnj6E2N3CtcZXNiyP6nk77VP
         CQjNqw3tm9I62llfFmvfUVrfB8yx4G6h36e4dj94T835ievYrdSnvXW4T7kpJS/HwOvg
         pX8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=CPNKoyQPlYek2m94r2jU2l4U7Eic9yslYk7XyBMTRrM=;
        b=dP0lrOX3mhhgA+ygl7VLwPoDAVgGAPlkdIMS2Fd7Dduxjpx9LqiJIIlrta7rmCCaX4
         oSxjwXYoiQmFHyXtfKzaRpC2bNzdqTEgQEQnx3MUWihWKGcz7psosjxOC8eROc2mvlQ7
         I/Ai4hN0CwhPmBwLqFajLGMF07bJed3OxXKjord+9fEf+269DiYuY/Rfa+8VNvDgBYdf
         srvj2mvMFkEm1IxZN6PLw8ftscAU5fl37iN2VD+76IemLeZv3AhaOK4jEX7tim1lbEfV
         HYg6JGsmPBBcDwdLCAA9tpIEhZmw/CIputZDY6+0Wt+znl9nzbLwXaWKE+BIm4CHxHVb
         ZY+A==
X-Gm-Message-State: APjAAAW1CKRpKi57gK1OMFrTu/0qScpnlZafgn5N9t8H4W+LxkzjflJZ
        V+8/cDpyBUREifHUlZ+EIIk=
X-Google-Smtp-Source: APXvYqxQmEQddf9IpvMTl2uEIlZb4wSUUeFvCZbLLgWN0vSXXKyKwkwJ/z6DbEPzT4Gq6tc+CUrwzw==
X-Received: by 2002:a62:8246:: with SMTP id w67mr4584211pfd.226.1565107811843;
        Tue, 06 Aug 2019 09:10:11 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id y8sm84739570pfn.52.2019.08.06.09.10.08
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 06 Aug 2019 09:10:08 -0700 (PDT)
Date:   Tue, 6 Aug 2019 09:10:06 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Oliver Neukum <oneukum@suse.com>
Cc:     linux-input@vger.kernel.org, jikos@kernel.org,
        benjamin.tissoires@redhat.com
Subject: Re: [PATCH] iforce: add sanity checks
Message-ID: <20190806161006.GD178933@dtor-ws>
References: <20190806141538.8121-1-oneukum@suse.com>
 <20190806141538.8121-2-oneukum@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190806141538.8121-2-oneukum@suse.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Aug 06, 2019 at 04:15:38PM +0200, Oliver Neukum wrote:
> The endpoint type should also be checked before a device
> is accepted.
> 
> Reported-by: syzbot+5efc10c005014d061a74@syzkaller.appspotmail.com
> Signed-off-by: Oliver Neukum <oneukum@suse.com>

Moved the checks to where the assignments are and applied. Thank you
Oliver.

BTW, could you please CC me on the stuff in drivers/input/...

Thanks!

> ---
>  drivers/input/joystick/iforce/iforce-usb.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/input/joystick/iforce/iforce-usb.c b/drivers/input/joystick/iforce/iforce-usb.c
> index 29abfeeef9a5..a481a226166c 100644
> --- a/drivers/input/joystick/iforce/iforce-usb.c
> +++ b/drivers/input/joystick/iforce/iforce-usb.c
> @@ -203,6 +203,11 @@ static int iforce_usb_probe(struct usb_interface *intf,
>  	epirq = &interface->endpoint[0].desc;
>  	epout = &interface->endpoint[1].desc;
>  
> +	if (!usb_endpoint_is_int_in(epirq))
> +		return -ENODEV;
> +	if (!usb_endpoint_is_int_out(epout))
> +		return -ENODEV;
> +
>  	iforce_usb = kzalloc(sizeof(*iforce_usb), GFP_KERNEL);
>  	if (!iforce_usb)
>  		goto fail;
> -- 
> 2.16.4
> 

-- 
Dmitry
