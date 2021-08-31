Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06F353FC0AF
	for <lists+linux-input@lfdr.de>; Tue, 31 Aug 2021 04:05:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239365AbhHaCGH (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 30 Aug 2021 22:06:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239382AbhHaCGH (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 30 Aug 2021 22:06:07 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF052C061575
        for <linux-input@vger.kernel.org>; Mon, 30 Aug 2021 19:05:12 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id j4-20020a17090a734400b0018f6dd1ec97so1278545pjs.3
        for <linux-input@vger.kernel.org>; Mon, 30 Aug 2021 19:05:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=b6GZ9008fqhphVc2VdncHfvGJbNQeaRzF/qgLHgPbds=;
        b=cbo9VxHwlrpdCp29nmL8wx3WbhpuxL/lQQv/gi8Jj57RLw4psxT7bZY4b8cqgQkP5X
         SrPYkUUww6/3YB4nosK9PkyX7dlS6BQcRKUcUl+wGSnCVT8EdBQACFZrGz33I9hE42tV
         6OoExmJb8VOsIZ1yvpTjD88hnLrbGcqLP4aoRGRF7y4lhMHgXZ1+ZHr9FEzdcaVj4/R7
         oooEui63nezWiqMHAnWK+P04giruDGUj3T/7ZO/pBmXWK3ODcn8PJTCvIL3C9E77OwK8
         DNaLB3mvwCVwjXPvQQTMej+yzMvdSvQm+aDYo4f5DQ+V+Drt5ne/sORyACqjn0zNdfMZ
         629A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=b6GZ9008fqhphVc2VdncHfvGJbNQeaRzF/qgLHgPbds=;
        b=GCpgQ6zzKefdZkMC5Y3hfxivLhnegETCyMj22gPGA2xfXolBtJIcWKis6BriPxMr0p
         JCEdJhm67F01w/LYQeyLJJqaHb0PyzWrUeAwq1GDurAID2C2AnhrYPdKSGbJTRYMqheA
         Ms4U5ZCgqqiwfBxpBQAc+ympMf1x8Nff9oxI7k3GxS3IcthBdL88w4MLIqYQwTpxNBcE
         bCU4FaIgK7799nax+f21muBkjrUDnh/okzUtovyOxHsUVmwr54bdbQ4JmGRD8o45bwKo
         4c1pBieC02F3107yf8VXl7OKvTngC8ED8hjlNToo70Hgl7SoO7uQRWVNyIRvEZMeC5fF
         3ovw==
X-Gm-Message-State: AOAM5318H+ykXiHpQxQ/GkV6/foU8+cE6sdpmRdqUZuOFhj0eXz6TQ5N
        fL6ehqKM/JHrNQfBeyazAu0=
X-Google-Smtp-Source: ABdhPJxuKCPgGwjpOj0NlxbWacxBshL/G66rLSvLf6oYvcdSSfmcAsFWD2CYmjiOEHbE0o5uZbjkMA==
X-Received: by 2002:a17:902:aa47:b029:12d:693f:14a0 with SMTP id c7-20020a170902aa47b029012d693f14a0mr2320526plr.68.1630375511970;
        Mon, 30 Aug 2021 19:05:11 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:771a:afc8:2e96:23dd])
        by smtp.gmail.com with ESMTPSA id t23sm718853pjs.16.2021.08.30.19.05.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Aug 2021 19:05:11 -0700 (PDT)
Date:   Mon, 30 Aug 2021 19:05:08 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Marek Vasut <marex@denx.de>
Cc:     linux-input@vger.kernel.org, ch@denx.de,
        Joe Hung <joe_hung@ilitek.com>, Luca Hsu <luca_hsu@ilitek.com>
Subject: Re: [PATCH v2 3/3] Input: ili210x - add ili251x firmware update
 support
Message-ID: <YS2OVMBQ0paMpJvh@google.com>
References: <20210827211258.318618-1-marex@denx.de>
 <20210827211258.318618-3-marex@denx.de>
 <YS1KLkCX01tlHBcy@google.com>
 <3233bfac-6d9d-da86-c4f9-18a9eab326d4@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3233bfac-6d9d-da86-c4f9-18a9eab326d4@denx.de>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Aug 31, 2021 at 01:27:21AM +0200, Marek Vasut wrote:
> On 8/30/21 11:14 PM, Dmitry Torokhov wrote:
> 
> [...]
> 
> > > +	if (ret) {
> > > +		dev_err(dev, "Failed to request firmware %s, ret=%d\n", fwname, ret);
> > > +		return ret;
> > > +	}
> > > +
> > > +	/*
> > > +	 * The firmware ihex blob can never be bigger than 64 kiB, so make this
> > > +	 * simple -- allocate a 64 kiB buffer, iterate over the ihex blob records
> > > +	 * once, copy them all into this buffer at the right locations, and then
> > > +	 * do all operations on this linear buffer.
> > > +	 */
> > > +	fw_buf = kcalloc(1, SZ_64K, GFP_KERNEL);
> > 
> > Why kcalloc and not kzalloc?
> 
> Because the firmware blob might be sparse (with gaps in it) and those gaps
> should be zeroed out instead of random data (see your question about the 32
> byte long memcpy() below (*) as well).

That is the exact purpose of kZalloc - to ZERO-out allocation (as
compared to kmalloc() which leaves memory uninitialized).

> 
> > > +	if (!fw_buf) {
> > > +		ret = -ENOMEM;
> > > +		goto err_alloc;
> > > +	}
> > > +
> > > +	rec = (const struct ihex_binrec *)fw->data;
> > > +	while (rec) {
> > > +		fw_addr = be32_to_cpu(rec->addr);
> > > +		fw_len = be16_to_cpu(rec->len);
> > > +
> > > +		if (fw_addr + fw_len > SZ_64K) {
> > > +			ret = -EFBIG;
> > > +			goto err_big;
> > > +		}
> > > +
> > > +		/* Find the last address before DF start address, that is AC end */
> > > +		if (fw_addr == 0xf000)
> > > +			*ac_end = fw_last_addr;
> > > +		fw_last_addr = fw_addr + fw_len;
> > > +
> > > +		memcpy(fw_buf + fw_addr, rec->data, fw_len);
> > > +		rec = ihex_next_binrec(rec);
> > > +	}
> 
> [...]
> 
> > > +static int ili251x_firmware_busy(struct i2c_client *client)
> > > +{
> > > +	struct ili210x *priv = i2c_get_clientdata(client);
> > > +	int ret, i = 0;
> > > +	u8 data;
> > > +
> > > +	do {
> > > +		/* The read_reg already contains suitable delay */
> > > +		ret = priv->chip->read_reg(client, 0x80, &data, 1);
> > 
> > Can we have symbolic name for this register (and others).
> 
> The name of this one isn't part of the example code, so ... I can call it
> something, but who knows what it really is.
> 
> I believe I did manage to find what the other registers are called already.

OK.

> 
> [...]
> 
> > > +	ret = ili251x_firmware_busy(client);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	for (fw_addr = start; fw_addr < end; fw_addr += 32) {
> > > +		fw_data[0] = REG_WRITE_DATA;
> > > +		memcpy(&(fw_data[1]), fwbuf + fw_addr, 32);
> > 
> > Is it guaranteed that we have enough data (32 bytes) and we will not
> > reach past the buffer?
> 
> Yes, see above (*). If the firmware blob entry were too short, this would
> pull in zeroes.
> 
> I tried iterating through the firmware file, but using linear buffer for the
> firmware results in far less convoluted code, and considering it is not
> performance critical, I think this is ok.

Could you drop a comment to that effect.

> 
> [...]
> 
> > > +static ssize_t ili210x_firmware_update_store(struct device *dev,
> > > +					     struct device_attribute *attr,
> > > +					     const char *buf, size_t count)
> > > +{
> > > +	struct i2c_client *client = to_i2c_client(dev);
> > > +	struct ili210x *priv = i2c_get_clientdata(client);
> > > +	char fwname[NAME_MAX];
> > > +	u16 ac_end, df_end;
> > > +	u8 *fwbuf;
> > > +	int ret;
> > > +	int i;
> > > +
> > > +	if (count >= NAME_MAX) {
> > > +		dev_err(dev, "File name too long\n");
> > > +		return -EINVAL;
> > > +	}
> > > +
> > > +	memcpy(fwname, buf, count);
> > > +	if (fwname[count - 1] == '\n')
> > > +		fwname[count - 1] = '\0';
> > > +	else
> > > +		fwname[count] = '\0';
> > 
> > I believe the practice is to use constant firmware name based on driver
> > or chip name. If there is desire to allow dynamic firmware name for
> > given device I think it should be handled at firmware loader core.
> 
> There are a couple of input devices which do similar thing, see e.g.:
> drivers/input/mouse/cyapa.c
> drivers/input/rmi4/rmi_f34.c
> 
> The ilitek firmware contains both firmware and calibration data, so you
> might end up with a usecase where you switch between different firmware
> blobs at runtime.
> 
> That's why it is implemented this way.

Right, and I'd rather not proliferate this any further. Can you drop the
filename support from this patch so it can be merged easily, and then we
can continue discussion on this topic separately?

Thanks.

-- 
Dmitry
