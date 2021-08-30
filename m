Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 50B073FBF5D
	for <lists+linux-input@lfdr.de>; Tue, 31 Aug 2021 01:21:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238842AbhH3XVU (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 30 Aug 2021 19:21:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230185AbhH3XVU (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 30 Aug 2021 19:21:20 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E032C061575
        for <linux-input@vger.kernel.org>; Mon, 30 Aug 2021 16:20:26 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id d5so4766016pjx.2
        for <linux-input@vger.kernel.org>; Mon, 30 Aug 2021 16:20:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=j46bRfPm7kUb/CtmHZFmvXNYwCSK1nOeCFtanpOutjM=;
        b=aC4TzO5CxN50l+GI30QoBfSu5ko9B38P91tbBy4sr9QgQhovoJQxg1bPjG5sVq1Cht
         kDYvF4q6XfGgdJ6GhoHca4zshDJW3TJS1csHQzWh0Y7DzAHOJgQmaYLMBoCBxl3drnrc
         n7dIDiTHEA4kUuI6mGorXZbobLdqfZ0QgtloACgold5yn/TMgPvWa3lXDKaQelqA/PHF
         rZRCkItbivzHH7IzAtx/rsljJEtvynuC/KJIT2+By84ED3LQW5MyebKlkijFgFd2lW7p
         9JlDKw8Hvy5V+kWz4TFaqeyhxsiOYB295RCDrBV4yCZT7zHZUSTsJtXmNZ+AdBZ3sqGD
         nnOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=j46bRfPm7kUb/CtmHZFmvXNYwCSK1nOeCFtanpOutjM=;
        b=DiXX4jFBTcmXeXeF11LNgYa17akKavynlW6QpVmKu4Tfgnz/HXs8V2xQiMSkEuj2nR
         Af5Wo9LoTvE4snqqdH2mltBxz9eQAV2zZQC8vdi61F/G/34NqWSOIKDNIuGCide716EY
         IagRu1Zv6RTROhtJk4Zlq1Qy3UJbP85Bw1dYgmg2cYBnPgcMLANIfRE6JGyHSzRMr8bk
         TiUdfI3h+zQ+1+yC79FZQIwiA6+DxvagdTDIFBx3TvDawfQC050V/r7dXqNMwkKrxpL2
         ub/pMtZeJGqUuWji5sie5W2585VrfbcNDSpoAQ2MSC2v+R274Meto3innwYOAJ3L6TbG
         LJFA==
X-Gm-Message-State: AOAM533REXkeMTYpm7sDCnQ2WoWcDW8NNqQNpa5ffQr2SgNW/ntqe2Tj
        VbUYq5olBRxBsXa5pVaXGho=
X-Google-Smtp-Source: ABdhPJwvCJTHEpjsUNT8AebnA+AbqMEKTCCQqx37ThWQnN0hB0f4We9cI7EoB+7ffabGC5OXg3FdRw==
X-Received: by 2002:a17:90a:ea08:: with SMTP id w8mr1699675pjy.218.1630365625579;
        Mon, 30 Aug 2021 16:20:25 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:771a:afc8:2e96:23dd])
        by smtp.gmail.com with ESMTPSA id m3sm8845144pfo.94.2021.08.30.16.20.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Aug 2021 16:20:24 -0700 (PDT)
Date:   Mon, 30 Aug 2021 16:20:22 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Marek Vasut <marex@denx.de>
Cc:     linux-input@vger.kernel.org, ch@denx.de,
        Joe Hung <joe_hung@ilitek.com>, Luca Hsu <luca_hsu@ilitek.com>
Subject: Re: [PATCH v2 2/3] Input: ili210x - export ili251x version details
 via sysfs
Message-ID: <YS1ntnYD2ic5MGYy@google.com>
References: <20210827211258.318618-1-marex@denx.de>
 <20210827211258.318618-2-marex@denx.de>
 <YS1HPKNZMP1XofM0@google.com>
 <991280e5-fd54-75d5-d2f2-bb2673303881@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <991280e5-fd54-75d5-d2f2-bb2673303881@denx.de>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Aug 31, 2021 at 01:02:57AM +0200, Marek Vasut wrote:
> On 8/30/21 11:01 PM, Dmitry Torokhov wrote:
> 
> [...]
> 
> > > @@ -351,6 +360,108 @@ static int ili251x_firmware_update_resolution(struct device *dev)
> > >   	return 0;
> > >   }
> > > +static ssize_t ili251x_firmware_version_show(struct device *dev,
> > > +					     struct device_attribute *attr,
> > > +					     char *buf)
> > > +{
> > > +	struct i2c_client *client = to_i2c_client(dev);
> > > +	struct ili210x *priv = i2c_get_clientdata(client);
> > > +	u8 fw[8];
> > > +	int ret;
> > > +
> > > +	/* Get firmware version */
> > > +	mutex_lock(&priv->lock);
> > > +	ret = priv->chip->read_reg(client, REG_FIRMWARE_VERSION,
> > > +				   &fw, sizeof(fw));
> > > +	mutex_unlock(&priv->lock);
> > 
> > Could we query firmware version and mode at probe time (and also later
> > after firmware update attempt) so that we do not need to introduce
> > locking against interrupt handler?
> 
> This is a threaded interrupt handler and I don't expect much lock contention
> here.
> 
> The sysfs attribute readout would race with the interrupt handler and if it
> wasn't for the firmware update support, we could very well cache all those
> values. Except, the firmware update can change them all. Worse, if the
> interrupt were to fire during an update, it could break that update, and I
> want to prevent that from happening.

Usually we simply disable interrupts from the device when updating
firmware.

Thanks.

-- 
Dmitry
