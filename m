Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41729268458
	for <lists+linux-input@lfdr.de>; Mon, 14 Sep 2020 08:05:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726033AbgINGFI (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 14 Sep 2020 02:05:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726003AbgINGFG (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 14 Sep 2020 02:05:06 -0400
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com [IPv6:2607:f8b0:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30FBCC06174A
        for <linux-input@vger.kernel.org>; Sun, 13 Sep 2020 23:05:06 -0700 (PDT)
Received: by mail-oi1-x244.google.com with SMTP id c13so16641636oiy.6
        for <linux-input@vger.kernel.org>; Sun, 13 Sep 2020 23:05:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qAx/Xl6xLLzU19riQGQ9AtN2R9xJ1KkVkswkcVhORMY=;
        b=kXbEqqTVejMUd+H1mcmG6lI1KY2Q8qTcO66lxQtxXbPnCHUmwiMPVi0xRssVlKCmqy
         orq60Mpv6wBuGxn6ijmENQVWuZ7OvJxRQls6bXTPH5SnW0LvMWXrrlG8bA8ydiKdn4Y4
         6PPvkS+TGT1W7Zr8NlPrLMgKMHaJkrl5QD0sgkvrZX0vnocYyrnYfw0SBzPmsKrrKSAz
         ZnyyBp+1choyYbGQv98ktuJ+1rZWtED+PSYQqIdo6Fbj15iHTuxFhHa5Na1DZGttkMaq
         0oO/W6NY6wYuwbqhNUlMNNIROHsZdi3f+bUfFPL5+3vl9VI9CcvKk/Ub3esnu8XabzW9
         MFCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qAx/Xl6xLLzU19riQGQ9AtN2R9xJ1KkVkswkcVhORMY=;
        b=nOQ4ulN6gSLr3a6xNSmCGLBhwCxQ4fVtZ2XZHwY+nkkWOVMelyTAVJknrShYS+/H6g
         WPw7KDAgEh3QMSrh9dPCMdyJJFMax0GbnqXH7SyzXTX7TgB5x6HrsoKPECvyYLmS7DZs
         q4udUyEdRYCYwPVKGFM+dahISCJ28cfHl7v4yu99wyyFXgXReyYXRwJn7HRSxVvQyspU
         yFVny11fi+6OXVWwE1TVH+QNCpxk05xKdw6vgWR5FdWSF+KuyU1GNL1NkCFVhpdYyXs4
         V15qYGTnldVP9NjkXjgBZ2wfNIBWgrlsaG+VDk8MxqpQOQfkOMHaf3WnZQM1SEDrCdKT
         +rfQ==
X-Gm-Message-State: AOAM533Dbv5x3QNavTFdmqF0tMjdylmBRiN2Obj/JnOCsju4S434z+Zc
        qiEMaK8iz1l2XVeKlh93A/71by+mrsgYltJG0a7qyg==
X-Google-Smtp-Source: ABdhPJzdkZSgFKaB9QXHAwvns9n1PoTy5GpaTJh0SrW7fqIMPsuZJaVXmiQaO6ITD93uaGtmSKKVTcjgeyF4xF6MVW4=
X-Received: by 2002:aca:6546:: with SMTP id j6mr7793056oiw.17.1600063505244;
 Sun, 13 Sep 2020 23:05:05 -0700 (PDT)
MIME-Version: 1.0
References: <20200820224551.GX1665100@dtor-ws> <20200821024006.3399663-1-furquan@google.com>
 <20200909004424.GD1665100@dtor-ws>
In-Reply-To: <20200909004424.GD1665100@dtor-ws>
From:   Furquan Shaikh <furquan@google.com>
Date:   Sun, 13 Sep 2020 23:04:48 -0700
Message-ID: <CAEGmHFEC+873xzoG8eav1mHJk6mShknr2YeDWc5DwsviHoeYAw@mail.gmail.com>
Subject: Re: [PATCH v2] drivers: input: Use single i2c_transfer transaction
 when using RM_CMD_BANK_SWITCH
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Dan Carpenter <dan.carpenter@oracle.com>,
        linux-input@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Aaron Durbin <adurbin@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Dmitry,

On Tue, Sep 8, 2020 at 5:44 PM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> Hi Furquan,
>
> On Thu, Aug 20, 2020 at 07:40:06PM -0700, Furquan Shaikh wrote:
> > On an AMD chromebook, where the same I2C bus is shared by both Raydium
> > touchscreen and a trackpad device, it is observed that interleaving of
> > I2C messages when `raydium_i2c_read_message()` is called leads to the
> > Raydium touch IC reporting incorrect information. This is the sequence
> > that was observed to result in the above issue:
> >
> > * I2C write to Raydium device for RM_CMD_BANK_SWITCH
> > * I2C write to trackpad device
> > * I2C read from trackpad device
> > * I2C write to Raydium device for setting address
> > * I2C read from Raydium device >>>> This provides incorrect
> >   information
> >
> > This change adds a new helper function `raydium_i2c_xfer()` that
> > performs I2C transactions to the Raydium device. It uses the register
> > address to decide if RM_CMD_BANK_SWITCH header needs to be sent to the
> > device (i.e. if register address is greater than 255, then bank switch
> > header is sent before the rest of the transaction). Additionally, it
> > ensures that all the I2C operations performed as part of
> > `raydium_i2c_xfer()` are done as a single i2c_transfer. This
> > guarantees that no other transactions are initiated to any other
> > device on the same bus in between. Additionally,
> > `raydium_i2c_{send|read}*` functions are refactored to use this new
> > helper function.
> >
> > Verified with the patch across multiple reboots (>100) that the
> > information reported by the Raydium  touchscreen device during probe
> > is correct.
> >
> > Signed-off-by: Furquan Shaikh <furquan@google.com>
> >
> > ---
> > v2: Added a new helper function raydium_i2c_xfer so that all read and
> > send transfers are handled using the same path. This helper function
> > uses register address > 255 to decide whether to send
> > RM_CMD_BANK_SWITCH command. Additionally, __packed keyword is moved
> > to be placed after the structure defintion.
> >
> >  drivers/input/touchscreen/raydium_i2c_ts.c | 132 +++++++++------------
> >  1 file changed, 58 insertions(+), 74 deletions(-)
> >
> > diff --git a/drivers/input/touchscreen/raydium_i2c_ts.c b/drivers/input/touchscreen/raydium_i2c_ts.c
> > index fe245439adee..261e4a290836 100644
> > --- a/drivers/input/touchscreen/raydium_i2c_ts.c
> > +++ b/drivers/input/touchscreen/raydium_i2c_ts.c
> > @@ -51,6 +51,7 @@
> >
> >  /* Touch relative info */
> >  #define RM_MAX_RETRIES               3
> > +#define RM_RETRY_DELAY_MS    20
> >  #define RM_MAX_TOUCH_NUM     10
> >  #define RM_BOOT_DELAY_MS     100
> >
> > @@ -136,114 +137,98 @@ struct raydium_data {
> >       bool wake_irq_enabled;
> >  };
> >
> > -static int raydium_i2c_send(struct i2c_client *client,
> > -                         u8 addr, const void *data, size_t len)
> > +static int raydium_i2c_xfer(struct i2c_client *client, u32 addr, void *data,
> > +                             size_t len, bool is_read)
> >  {
> > -     u8 *buf;
> > -     int tries = 0;
> > -     int ret;
> > -
> > -     buf = kmalloc(len + 1, GFP_KERNEL);
> > -     if (!buf)
> > -             return -ENOMEM;
> > -
> > -     buf[0] = addr;
> > -     memcpy(buf + 1, data, len);
> > -
> > -     do {
> > -             ret = i2c_master_send(client, buf, len + 1);
> > -             if (likely(ret == len + 1))
> > -                     break;
> > -
> > -             msleep(20);
> > -     } while (++tries < RM_MAX_RETRIES);
> > -
> > -     kfree(buf);
> > -
> > -     if (unlikely(ret != len + 1)) {
> > -             if (ret >= 0)
> > -                     ret = -EIO;
> > -             dev_err(&client->dev, "%s failed: %d\n", __func__, ret);
> > -             return ret;
> > -     }
> > +     struct raydium_bank_switch_header {
> > +             u8 cmd;
> > +             __be32 be_addr;
> > +     } __packed header = {
> > +             .cmd = RM_CMD_BANK_SWITCH,
> > +             .be_addr = cpu_to_be32(addr),
> > +     };
> >
> > -     return 0;
> > -}
> > +     u8 reg_addr = addr & 0xff;
> >
> > -static int raydium_i2c_read(struct i2c_client *client,
> > -                         u8 addr, void *data, size_t len)
> > -{
> >       struct i2c_msg xfer[] = {
> > +             {
> > +                     .addr = client->addr,
> > +                     .len = sizeof(header),
> > +                     .buf = (u8 *)&header,
> > +             },
> >               {
> >                       .addr = client->addr,
> >                       .len = 1,
> > -                     .buf = &addr,
> > +                     .buf = &reg_addr,
> >               },
> >               {
> >                       .addr = client->addr,
> > -                     .flags = I2C_M_RD,
> >                       .len = len,
> >                       .buf = data,
> > +                     .flags = is_read ? I2C_M_RD : 0,
> >               }
> >       };
> > +
> > +     /*
> > +      * If address is greater than 255, then RM_CMD_BANK_SWITCH needs to be
> > +      * sent first. Else, skip the header i.e. xfer[0].
> > +      */
> > +     int xfer_start_idx = (addr > 0xff) ? 0 : 1;
> > +     size_t xfer_count = ARRAY_SIZE(xfer) - xfer_start_idx;
> >       int ret;
> >
> > -     ret = i2c_transfer(client->adapter, xfer, ARRAY_SIZE(xfer));
> > -     if (unlikely(ret != ARRAY_SIZE(xfer)))
> > -             return ret < 0 ? ret : -EIO;
> > +     ret = i2c_transfer(client->adapter, &xfer[xfer_start_idx], xfer_count);
> > +     if (likely(ret == xfer_count))
> > +             return 0;
> >
> > -     return 0;
> > +     return -EIO;
>
> We are losing real error here, I'll change this to
>
>         return ret < 0 ? ret : -EIO;
>
> >  }

Looks good.

> >
> > -static int raydium_i2c_read_message(struct i2c_client *client,
> > -                                 u32 addr, void *data, size_t len)
> > +static int raydium_i2c_send(struct i2c_client *client, u32 addr,
> > +                             const void *data, size_t len)
> >  {
> > -     __be32 be_addr;
> > +     int tries = 0;
> > +     int ret;
> > +
> > +     do {
> > +             ret = raydium_i2c_xfer(client, addr, (void *)data, len, false);
> > +             if (likely(ret == 0))
> > +                     return 0;
> > +
> > +             msleep(RM_RETRY_DELAY_MS);
> > +     } while (++tries < RM_MAX_RETRIES);
> > +
> > +     dev_err(&client->dev, "%s failed\n", __func__);
> > +     return -EIO;
>
> Again losing real error here, I'll rename ret to error and do
>
>         return error;
>
> here.

Looks good.

>
> > +}
> > +
> > +static int raydium_i2c_read(struct i2c_client *client, u32 addr, void *data,
> > +                             size_t len)
> > +{
> > +     int ret;
> >       size_t xfer_len;
> > -     int error;
> >
> >       while (len) {
> >               xfer_len = min_t(size_t, len, RM_MAX_READ_SIZE);
> > +             ret = raydium_i2c_xfer(client, addr, data, len, true);
>
> I think this needs to be xfer_len, not len.

Good catch. Yes, this needs to be xfer_len.

>
> I can fix it up locally if you agree.

The suggestions look good to me. Thank you!

- Furquan

>
> Thanks.
>
> --
> Dmitry
