Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6174F4EACD
	for <lists+linux-input@lfdr.de>; Fri, 21 Jun 2019 16:34:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726540AbfFUOej (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 21 Jun 2019 10:34:39 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:35734 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726535AbfFUOej (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 21 Jun 2019 10:34:39 -0400
Received: by mail-io1-f68.google.com with SMTP id m24so1708514ioo.2;
        Fri, 21 Jun 2019 07:34:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AECDYLxDxs7t3GCnNHcYsgiH9u/iWrvr6DiFBtVCaR0=;
        b=mIhTAt82nLco82ZUCJu8f/BQnr1sKyonZ/h33w52rRQFbAOYmW2zAdH0eWvaTJf7Em
         DkojVv9wiWl1xGazjMm7vANa5MqniYm2SNgbHhRHcbjhcsxUmhC+xSPMsvNvZl077ZXU
         HvOFr05BCX8m5Js9aFlBaBOrX0OIeWz6z+1GNXjAk6tqk6GIa2BxsvSAdwXldf2GA5SX
         GrmcZ69IVV7SMeiIzA3rEo/dniNGU7dAwPwGwUgSr+lBdmB8QN4xJqB4dvqBdBK5F9jo
         SgdLf2McEtqSD1SHw+fYhZvNpfzZMGQ0E5fk5VA6hnPxroPzz6JqGFTVyUT/LsT1MRZy
         FJFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AECDYLxDxs7t3GCnNHcYsgiH9u/iWrvr6DiFBtVCaR0=;
        b=lMh5Xeg4FpEu+DQZYNgcmwN9wY00YtoOT5YOJqixJbbNGOC2C8LU8P8yii5hpI3/8r
         PV3bR74Zm/P9eHIZ9G7W2yAOYNIPahz/2WOx9itIsWnhZdn6ogC/FtDKbKQo7YCoJp23
         9s9U1S2x1RmE8TGUJmw/4Z91FsDmmM2Jc3KTM8fqvYxKpcweykMRdFQ9vvpFWj/91b22
         H1KUgSGRbwQsisoGgwtLwZ47lkzx6owjCiyVWxDbvku7GwVz5n5wehtL4njHmQiZDuyH
         BY0KuEKapKbJWNmGYYJXhzIt8OKLU6sEO8hepQsDubRpO7IkwYAKmlGlAJ43Fjpg+JFT
         Nxsw==
X-Gm-Message-State: APjAAAU5nydtAVBFDVq+dt5yCXwWj+csmGtwd5gPMtnm1IFlJr6Og2OF
        3TDhKjb9E72U8APQzfRkLhzcnMbqRmgtWWvHqX0=
X-Google-Smtp-Source: APXvYqz0iwFlA6JkJ14KUgH9IUB7/KVGlNFIqw6N33AuxBl5sBzGUS41/e3kXim7cgQDGO9nrhRXSXrQ9eLv923pxlw=
X-Received: by 2002:a5d:8049:: with SMTP id b9mr2356470ior.199.1561127678260;
 Fri, 21 Jun 2019 07:34:38 -0700 (PDT)
MIME-Version: 1.0
References: <20190620142801.11827-1-jeffrey.l.hugo@gmail.com>
 <20190620143318.11880-1-jeffrey.l.hugo@gmail.com> <CAKdAkRRstvEWXtwnLCMKoW6PcCz0W3+M9iYqVFshJpw6y_=9bA@mail.gmail.com>
In-Reply-To: <CAKdAkRRstvEWXtwnLCMKoW6PcCz0W3+M9iYqVFshJpw6y_=9bA@mail.gmail.com>
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date:   Fri, 21 Jun 2019 08:34:26 -0600
Message-ID: <CAOCk7NoKB6UtA3g-0+Yxi4Y46PDqapnOH0dHH0CupvnQ=ZSKVQ@mail.gmail.com>
Subject: Re: [PATCH v7 1/5] Input: elan_i2c: Export the device id whitelist
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Jiri Kosina <jikos@kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Lee Jones <lee.jones@linaro.org>, xnox@ubuntu.com,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        "open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Jun 20, 2019 at 10:34 PM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> Hi Jeffrey,
>
> On Thu, Jun 20, 2019 at 7:33 AM Jeffrey Hugo <jeffrey.l.hugo@gmail.com> wrote:
> >  #ifdef CONFIG_OF
> > -static const struct of_device_id elan_of_match[] = {
> > -       { .compatible = "elan,ekth3000" },
> > -       { /* sentinel */ }
> > -};
>
> I think OF IDs should stay in this file since we agreed HID will not
> be checking them.

I thought it would be convenient to keep all the IDs in one place, but
I'll put these back.

>
> >  MODULE_DEVICE_TABLE(of, elan_of_match);
> >  #endif
> >
> > diff --git a/include/linux/input/elan-i2c-ids.h b/include/linux/input/elan-i2c-ids.h
> > new file mode 100644
> > index 000000000000..8130bbebbdda
> > --- /dev/null
> > +++ b/include/linux/input/elan-i2c-ids.h
> > @@ -0,0 +1,68 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +/*
> > + * Elan I2C Touchpad devide whitelist
>
> s/devide/device/

Doh.  Will fix.

>
> > + *
> > + * Copyright (C) 2019 Jeffrey Hugo.  All rights reserved.
>
> This just moves the code around. If anything I'd say it should keep
> the original Elan copyright.

Ok.  No problem.

>
> Thanks.
>
> --
> Dmitry
