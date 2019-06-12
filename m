Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D853A41976
	for <lists+linux-input@lfdr.de>; Wed, 12 Jun 2019 02:35:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407374AbfFLAfL (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 11 Jun 2019 20:35:11 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:39493 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2407288AbfFLAfL (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 11 Jun 2019 20:35:11 -0400
Received: by mail-pl1-f196.google.com with SMTP id b7so793991pls.6;
        Tue, 11 Jun 2019 17:35:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ph86gesNnRTM7ujmiRuSEJzFcbh48v/P7EOKY+OdFyY=;
        b=UD7GmZY8FzpfopaVwv7Q21zdCVPYfTWHzMZb9BOJpgHB5l26CfIO2OuBfGjjrLkN3J
         QsIYQ7jMZKuLuCSdRB13J78M7OvygaLDg9VciXMarUGgpDsiaHSdFn7md8E2qz8Tzqvv
         I7myqDGnk/KAy0d/fZ6GSTIUGEbeYZ3THvuOJhN7HUhKXachfNyfN7/Kd/utKT6qqyBh
         4YZN/lMsTQPXrGCsKu4j57kGZVzoA1sg5ZPykaxpziSP9r7nFEM6A7wseq5EDEaLY4cy
         E7g1GugR03Y8NhGHxo4JQSfPmFlmNKzRZH0zn6zSUVKF6LfVkBtVTKlgzTtHRIElO26P
         aPHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ph86gesNnRTM7ujmiRuSEJzFcbh48v/P7EOKY+OdFyY=;
        b=uXRuLl+pDmu3wYqX/MNWSMQO4f/tTWl5nHfLsxzlDaKn9P+BMYfa6L941aL+juWvbi
         tuhekcEo/N7GbD7YdXMwZw+SIG9Loi9e+FO8WZCQI5MeO95+SrKe3eS0aIo/WRUF4gxu
         +KSa5pjg8mAgd7LohPrJukqIpp+j0RXPYB8OqNVBLXTnIdpn2CcvpAkvm/GIU4ZoaaX+
         BNJm/iGZlJoi956EQFmHh0LlCmuV3pxOc9xT1Gt1Lj8f11hg9v8v2rP9ISsezm+oB2hQ
         F4bGQt6DIIkRvil++bkuNBSnKpK919UTg5LYWL9UTwDnkjIGG3j/A47zIKrz+zcTZrc5
         Yc8Q==
X-Gm-Message-State: APjAAAWKAnatrnD6sTenAc0W9Qas0AMF/iM1SwSe+UFLqrQPw0JX+KBl
        n2p6ep6ZfOdv7WmF4Xmhf48=
X-Google-Smtp-Source: APXvYqxZm72YQBMzfu3JeQ/pQSonMtBZam0wR61ec/mANR6WzsknWTt1c/ro/GU7bEt9Ot8Czc6tpw==
X-Received: by 2002:a17:902:24c:: with SMTP id 70mr78198009plc.2.1560299710166;
        Tue, 11 Jun 2019 17:35:10 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id a3sm227817pje.3.2019.06.11.17.35.08
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 11 Jun 2019 17:35:09 -0700 (PDT)
Date:   Tue, 11 Jun 2019 17:35:07 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Cc:     benjamin.tissoires@redhat.com, jikos@kernel.org,
        bjorn.andersson@linaro.org, lee.jones@linaro.org,
        robh+dt@kernel.org, mark.rutland@arm.com, agross@kernel.org,
        david.brown@linaro.org, hdegoede@redhat.com,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/3] HID: quirks: Refactor ELAN 400 and 401 handling
Message-ID: <20190612003507.GG143729@dtor-ws>
References: <20190606161055.47089-1-jeffrey.l.hugo@gmail.com>
 <20190606161322.47192-1-jeffrey.l.hugo@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190606161322.47192-1-jeffrey.l.hugo@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Jun 06, 2019 at 09:13:22AM -0700, Jeffrey Hugo wrote:
> There needs to be coordination between hid-quirks and the elan_i2c driver
> about which devices are handled by what drivers.  Currently, both use
> whitelists, which results in valid devices being unhandled by default,
> when they should not be rejected by hid-quirks.  This is quickly becoming
> an issue.
> 
> Since elan_i2c has a maintained whitelist of what devices it will handle,
> use that to implement a blacklist in hid-quirks so that only the devices
> that need to be handled by elan_i2c get rejected by hid-quirks, and
> everything else is handled by default.  The downside is the whitelist and
> blacklist need to be kept in sync.
> 
> Suggested-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>
> Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
> ---
>  drivers/hid/hid-quirks.c | 78 ++++++++++++++++++++++++++++++++++------
>  1 file changed, 67 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/hid/hid-quirks.c b/drivers/hid/hid-quirks.c
> index e5ca6fe2ca57..edebd0700e3d 100644
> --- a/drivers/hid/hid-quirks.c
> +++ b/drivers/hid/hid-quirks.c
> @@ -912,8 +912,66 @@ static const struct hid_device_id hid_mouse_ignore_list[] = {
>  	{ }
>  };
>  
> +/* 
> + * List of device names that elan_i2c is handling and HID should ignore.  Must
> + * be kept in sync with elan_i2c
> + */
> +static const char *hid_elan_i2c_ignore[] = {

If this is a copy of elan whitelist, then, if we do not want to bother
with sharing it in object form (as a elan-i2c-ids module), can we at
least move it into include/linux/input/elan-i2c-ids.h and consume from
hid-quirks.c?

Thanks.

-- 
Dmitry
