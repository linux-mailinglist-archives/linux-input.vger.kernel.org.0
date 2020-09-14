Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 60E1C2684F0
	for <lists+linux-input@lfdr.de>; Mon, 14 Sep 2020 08:34:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726039AbgINGeL (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 14 Sep 2020 02:34:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726003AbgINGeK (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 14 Sep 2020 02:34:10 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57786C06174A;
        Sun, 13 Sep 2020 23:34:10 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id j34so10717107pgi.7;
        Sun, 13 Sep 2020 23:34:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Bo/N69mx88es3f8XjhmFZcolMz0xbU++iH9HUek+WK0=;
        b=drHuUM0vP3sdvwtxiPt61juLMR9Fv4pvmKjT826xStrBMv6YAeeIMir7K8viKUSB1t
         ukLZ2wX1vD7Hp1Bvp+KpWto2kMHYiSlnk/SWc3th+lwuwvOV4GAwcIU9xr0PxHaW8s9E
         TbHSeFIWsPlz62jpQ9wpD2MUjctSzhwpE7NFJ3OGYRkUDGUfSWEw2wkKuxp5UOTMr2o2
         5l8nCNJnMDu0tGptdGYgDii+fF42uIJ55FmYdAQrGyFXELTSQAbKAoCCQvDk9x6rAkdN
         IIKBAJnzR3/VPCAMuRUac9CwBOiaDkIVPTfItTvAgsT1VdJqaoRMLlAnvvvNc36/8pJo
         xpCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Bo/N69mx88es3f8XjhmFZcolMz0xbU++iH9HUek+WK0=;
        b=fgKab7gNXLJZjnPQSAcMe2jKSkMcVL7WhIu+MLGJ/Q9gqTiQ8kSd9Zfr5pn/X4eHQF
         ZTfStIzL8f0pb2RL9DY2FGUKEURCJK07Unu9f7P51KKgQanQAf41t0NXx6eiL4a8s5H5
         tw4pO0e4/7kApsIgo8h3Yp4t7vp147yAdZ4V2WnxBpyiPsJiiKP/bXCjxzoRYLFfrlTL
         ZkwHcqo+hA7HKlk9zP5qynDBf7fjaZBcDLeSRFisnxYlDUXKqKTMRUbiwkE37ZsvlPX7
         u4NLAcBqbpwmoueoJAWkTSU3ohAueO3KmSXg0aOfvDuuFp5oGy5m5VBD5u9SaSDc+KYS
         rnTA==
X-Gm-Message-State: AOAM530EP/m1Ntv3CkloNPy6yUcy1FW5CAgUB84OzAkAJtAXg06k2gOq
        Wh99n8eqi7KjziJe11sD/h/63VDzVS0=
X-Google-Smtp-Source: ABdhPJx5RBrbXcK8UYuicsYOsD0ncmgqxQf0hfksZjdHwx3Oy09/Hq7yxd7dlZTDQAGEmHxsowiMVA==
X-Received: by 2002:a63:d706:: with SMTP id d6mr9566322pgg.318.1600065249705;
        Sun, 13 Sep 2020 23:34:09 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id i20sm7489569pgk.77.2020.09.13.23.34.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2020 23:34:09 -0700 (PDT)
Date:   Sun, 13 Sep 2020 23:34:07 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Furquan Shaikh <furquan@google.com>
Cc:     Dan Carpenter <dan.carpenter@oracle.com>,
        linux-input@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Aaron Durbin <adurbin@google.com>
Subject: Re: [PATCH v2] drivers: input: Use single i2c_transfer transaction
 when using RM_CMD_BANK_SWITCH
Message-ID: <20200914063407.GP1665100@dtor-ws>
References: <20200820224551.GX1665100@dtor-ws>
 <20200821024006.3399663-1-furquan@google.com>
 <20200909004424.GD1665100@dtor-ws>
 <CAEGmHFEC+873xzoG8eav1mHJk6mShknr2YeDWc5DwsviHoeYAw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAEGmHFEC+873xzoG8eav1mHJk6mShknr2YeDWc5DwsviHoeYAw@mail.gmail.com>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, Sep 13, 2020 at 11:04:48PM -0700, Furquan Shaikh wrote:
> Hi Dmitry,
> 
> On Tue, Sep 8, 2020 at 5:44 PM Dmitry Torokhov
> <dmitry.torokhov@gmail.com> wrote:
> >
> > Hi Furquan,
> >
> > On Thu, Aug 20, 2020 at 07:40:06PM -0700, Furquan Shaikh wrote:
> > > On an AMD chromebook, where the same I2C bus is shared by both Raydium
> > > touchscreen and a trackpad device, it is observed that interleaving of
> > > I2C messages when `raydium_i2c_read_message()` is called leads to the
> > > Raydium touch IC reporting incorrect information. This is the sequence
> > > that was observed to result in the above issue:
> > >
> > > * I2C write to Raydium device for RM_CMD_BANK_SWITCH
> > > * I2C write to trackpad device
> > > * I2C read from trackpad device
> > > * I2C write to Raydium device for setting address
> > > * I2C read from Raydium device >>>> This provides incorrect
> > >   information
> > >
> > > This change adds a new helper function `raydium_i2c_xfer()` that
> > > performs I2C transactions to the Raydium device. It uses the register
> > > address to decide if RM_CMD_BANK_SWITCH header needs to be sent to the
> > > device (i.e. if register address is greater than 255, then bank switch
> > > header is sent before the rest of the transaction). Additionally, it
> > > ensures that all the I2C operations performed as part of
> > > `raydium_i2c_xfer()` are done as a single i2c_transfer. This
> > > guarantees that no other transactions are initiated to any other
> > > device on the same bus in between. Additionally,
> > > `raydium_i2c_{send|read}*` functions are refactored to use this new
> > > helper function.
> > >
> > > Verified with the patch across multiple reboots (>100) that the
> > > information reported by the Raydium  touchscreen device during probe
> > > is correct.
> > >
> > > Signed-off-by: Furquan Shaikh <furquan@google.com>
> > >
> > > ---
> > > v2: Added a new helper function raydium_i2c_xfer so that all read and
> > > send transfers are handled using the same path. This helper function
> > > uses register address > 255 to decide whether to send
> > > RM_CMD_BANK_SWITCH command. Additionally, __packed keyword is moved
> > > to be placed after the structure defintion.
> > >
> > >  drivers/input/touchscreen/raydium_i2c_ts.c | 132 +++++++++------------
> > >  1 file changed, 58 insertions(+), 74 deletions(-)
> > >
> > > diff --git a/drivers/input/touchscreen/raydium_i2c_ts.c b/drivers/input/touchscreen/raydium_i2c_ts.c
> > > index fe245439adee..261e4a290836 100644
> > > --- a/drivers/input/touchscreen/raydium_i2c_ts.c
> > > +++ b/drivers/input/touchscreen/raydium_i2c_ts.c
> > > @@ -51,6 +51,7 @@
> > >
> > >  /* Touch relative info */
> > >  #define RM_MAX_RETRIES               3
> > > +#define RM_RETRY_DELAY_MS    20
> > >  #define RM_MAX_TOUCH_NUM     10
> > >  #define RM_BOOT_DELAY_MS     100
> > >
> > > @@ -136,114 +137,98 @@ struct raydium_data {
> > >       bool wake_irq_enabled;
> > >  };
> > >
> > > -static int raydium_i2c_send(struct i2c_client *client,
> > > -                         u8 addr, const void *data, size_t len)
> > > +static int raydium_i2c_xfer(struct i2c_client *client, u32 addr, void *data,
> > > +                             size_t len, bool is_read)
> > >  {
> > > -     u8 *buf;
> > > -     int tries = 0;
> > > -     int ret;
> > > -
> > > -     buf = kmalloc(len + 1, GFP_KERNEL);
> > > -     if (!buf)
> > > -             return -ENOMEM;
> > > -
> > > -     buf[0] = addr;
> > > -     memcpy(buf + 1, data, len);
> > > -
> > > -     do {
> > > -             ret = i2c_master_send(client, buf, len + 1);
> > > -             if (likely(ret == len + 1))
> > > -                     break;
> > > -
> > > -             msleep(20);
> > > -     } while (++tries < RM_MAX_RETRIES);
> > > -
> > > -     kfree(buf);
> > > -
> > > -     if (unlikely(ret != len + 1)) {
> > > -             if (ret >= 0)
> > > -                     ret = -EIO;
> > > -             dev_err(&client->dev, "%s failed: %d\n", __func__, ret);
> > > -             return ret;
> > > -     }
> > > +     struct raydium_bank_switch_header {
> > > +             u8 cmd;
> > > +             __be32 be_addr;
> > > +     } __packed header = {
> > > +             .cmd = RM_CMD_BANK_SWITCH,
> > > +             .be_addr = cpu_to_be32(addr),
> > > +     };
> > >
> > > -     return 0;
> > > -}
> > > +     u8 reg_addr = addr & 0xff;
> > >
> > > -static int raydium_i2c_read(struct i2c_client *client,
> > > -                         u8 addr, void *data, size_t len)
> > > -{
> > >       struct i2c_msg xfer[] = {
> > > +             {
> > > +                     .addr = client->addr,
> > > +                     .len = sizeof(header),
> > > +                     .buf = (u8 *)&header,
> > > +             },
> > >               {
> > >                       .addr = client->addr,
> > >                       .len = 1,
> > > -                     .buf = &addr,
> > > +                     .buf = &reg_addr,
> > >               },
> > >               {
> > >                       .addr = client->addr,
> > > -                     .flags = I2C_M_RD,
> > >                       .len = len,
> > >                       .buf = data,
> > > +                     .flags = is_read ? I2C_M_RD : 0,
> > >               }
> > >       };
> > > +
> > > +     /*
> > > +      * If address is greater than 255, then RM_CMD_BANK_SWITCH needs to be
> > > +      * sent first. Else, skip the header i.e. xfer[0].
> > > +      */
> > > +     int xfer_start_idx = (addr > 0xff) ? 0 : 1;
> > > +     size_t xfer_count = ARRAY_SIZE(xfer) - xfer_start_idx;
> > >       int ret;
> > >
> > > -     ret = i2c_transfer(client->adapter, xfer, ARRAY_SIZE(xfer));
> > > -     if (unlikely(ret != ARRAY_SIZE(xfer)))
> > > -             return ret < 0 ? ret : -EIO;
> > > +     ret = i2c_transfer(client->adapter, &xfer[xfer_start_idx], xfer_count);
> > > +     if (likely(ret == xfer_count))
> > > +             return 0;
> > >
> > > -     return 0;
> > > +     return -EIO;
> >
> > We are losing real error here, I'll change this to
> >
> >         return ret < 0 ? ret : -EIO;
> >
> > >  }
> 
> Looks good.
> 
> > >
> > > -static int raydium_i2c_read_message(struct i2c_client *client,
> > > -                                 u32 addr, void *data, size_t len)
> > > +static int raydium_i2c_send(struct i2c_client *client, u32 addr,
> > > +                             const void *data, size_t len)
> > >  {
> > > -     __be32 be_addr;
> > > +     int tries = 0;
> > > +     int ret;
> > > +
> > > +     do {
> > > +             ret = raydium_i2c_xfer(client, addr, (void *)data, len, false);
> > > +             if (likely(ret == 0))
> > > +                     return 0;
> > > +
> > > +             msleep(RM_RETRY_DELAY_MS);
> > > +     } while (++tries < RM_MAX_RETRIES);
> > > +
> > > +     dev_err(&client->dev, "%s failed\n", __func__);
> > > +     return -EIO;
> >
> > Again losing real error here, I'll rename ret to error and do
> >
> >         return error;
> >
> > here.
> 
> Looks good.
> 
> >
> > > +}
> > > +
> > > +static int raydium_i2c_read(struct i2c_client *client, u32 addr, void *data,
> > > +                             size_t len)
> > > +{
> > > +     int ret;
> > >       size_t xfer_len;
> > > -     int error;
> > >
> > >       while (len) {
> > >               xfer_len = min_t(size_t, len, RM_MAX_READ_SIZE);
> > > +             ret = raydium_i2c_xfer(client, addr, data, len, true);
> >
> > I think this needs to be xfer_len, not len.
> 
> Good catch. Yes, this needs to be xfer_len.
> 
> >
> > I can fix it up locally if you agree.
> 
> The suggestions look good to me. Thank you!

Great, applied.

-- 
Dmitry
