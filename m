Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 637353FBF87
	for <lists+linux-input@lfdr.de>; Tue, 31 Aug 2021 01:48:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239124AbhH3XqZ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 30 Aug 2021 19:46:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237832AbhH3XqX (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 30 Aug 2021 19:46:23 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E63F4C061575
        for <linux-input@vger.kernel.org>; Mon, 30 Aug 2021 16:45:28 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id g13-20020a17090a3c8d00b00196286963b9so640421pjc.3
        for <linux-input@vger.kernel.org>; Mon, 30 Aug 2021 16:45:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=9pfM5KpVrjJ+omvc90SnacDd4R9rPc3De7rfEPy8HUE=;
        b=ZmbKYJPcWG5ecwa1TNfzOi/ZPNm0hSDJJWOPo+ZQ4m0CHD+Xtg4yPL1zzCC/knuSpb
         fZUd0kANrqLNh7B8m7ntCbfAbu2woPrXFBTBptARomL6IGuliQZ8OBf4lAjEtcGhqP50
         67lLPUslSC5mxncOM7PWG6hamhcxhOLgFmv2uOxvFITE7dedEZ1/lsXjU08krg2Ql1cq
         CjUBwBi91BvNIIrnlASKwsLJR/+CQZ1OPxZuRZ58lGCZVJv+5MM2y25Ekp4JUhmKjJop
         eBCb4fcgvh3LR4L/eOI1R3CNSyWN5k7vbJXloN+UBqq1tOrEFzRMrjrEypAL4HchNsP+
         oE7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=9pfM5KpVrjJ+omvc90SnacDd4R9rPc3De7rfEPy8HUE=;
        b=r8V/zpWmdEUaDojUWy60VqGpHKtqZbjYJhky8qFFHLOXL6YQO4iM9w1VAnoo23HKlw
         0HudREvK7jbIqAxRkzzmWQhYL1ZvWuWypsHGY7xTHwfizCH+LeHBn9EBdwEe++BSmNce
         JQNtaTAw9AtFHj/segt9Koj17/b0fb6mQxFpw+6hTq/zBLwOqTSaU7sUNh+k1MZwJhX5
         kqIVuKYW/IZsz7UhsSrjfgUU29xKP9Hxbv2ii2Rj7YL9hatUiDu8HhFTARGztOBPMta+
         s5NNsXzSLGn4e1XmrJkbmMfhFDgvLLKReqqaprhHgMS1mxnzVm01ObeBmUSJGO2hMn4J
         8EcA==
X-Gm-Message-State: AOAM530pTv2KgkLlr4gLMgHyRAkZUFBircyjAlepA8hQ/8zHKbftKNLS
        PBnzPjINWxzRK9zLQfUZ3Iw=
X-Google-Smtp-Source: ABdhPJxT6RzOK3evQSYgB07J1oKUwKu7unsczjaAahyfByv86UvUlZf/nH9Sh2kCKRJkm0FDE9uZpw==
X-Received: by 2002:a17:902:8348:b029:12b:b2a0:941b with SMTP id z8-20020a1709028348b029012bb2a0941bmr1902708pln.62.1630367128143;
        Mon, 30 Aug 2021 16:45:28 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:771a:afc8:2e96:23dd])
        by smtp.gmail.com with ESMTPSA id u62sm15681380pfc.68.2021.08.30.16.45.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Aug 2021 16:45:27 -0700 (PDT)
Date:   Mon, 30 Aug 2021 16:45:24 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Marek Vasut <marex@denx.de>
Cc:     linux-input@vger.kernel.org, ch@denx.de,
        Joe Hung <joe_hung@ilitek.com>, Luca Hsu <luca_hsu@ilitek.com>
Subject: Re: [PATCH v2 2/3] Input: ili210x - export ili251x version details
 via sysfs
Message-ID: <YS1tlEJMSD6GxK02@google.com>
References: <20210827211258.318618-1-marex@denx.de>
 <20210827211258.318618-2-marex@denx.de>
 <YS1HPKNZMP1XofM0@google.com>
 <991280e5-fd54-75d5-d2f2-bb2673303881@denx.de>
 <YS1ntnYD2ic5MGYy@google.com>
 <f16a2957-de02-3165-f3d6-31620e8fae4a@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f16a2957-de02-3165-f3d6-31620e8fae4a@denx.de>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Aug 31, 2021 at 01:33:10AM +0200, Marek Vasut wrote:
> On 8/31/21 1:20 AM, Dmitry Torokhov wrote:
> > On Tue, Aug 31, 2021 at 01:02:57AM +0200, Marek Vasut wrote:
> > > On 8/30/21 11:01 PM, Dmitry Torokhov wrote:
> > > 
> > > [...]
> > > 
> > > > > @@ -351,6 +360,108 @@ static int ili251x_firmware_update_resolution(struct device *dev)
> > > > >    	return 0;
> > > > >    }
> > > > > +static ssize_t ili251x_firmware_version_show(struct device *dev,
> > > > > +					     struct device_attribute *attr,
> > > > > +					     char *buf)
> > > > > +{
> > > > > +	struct i2c_client *client = to_i2c_client(dev);
> > > > > +	struct ili210x *priv = i2c_get_clientdata(client);
> > > > > +	u8 fw[8];
> > > > > +	int ret;
> > > > > +
> > > > > +	/* Get firmware version */
> > > > > +	mutex_lock(&priv->lock);
> > > > > +	ret = priv->chip->read_reg(client, REG_FIRMWARE_VERSION,
> > > > > +				   &fw, sizeof(fw));
> > > > > +	mutex_unlock(&priv->lock);
> > > > 
> > > > Could we query firmware version and mode at probe time (and also later
> > > > after firmware update attempt) so that we do not need to introduce
> > > > locking against interrupt handler?
> > > 
> > > This is a threaded interrupt handler and I don't expect much lock contention
> > > here.
> > > 
> > > The sysfs attribute readout would race with the interrupt handler and if it
> > > wasn't for the firmware update support, we could very well cache all those
> > > values. Except, the firmware update can change them all. Worse, if the
> > > interrupt were to fire during an update, it could break that update, and I
> > > want to prevent that from happening.
> > 
> > Usually we simply disable interrupts from the device when updating
> > firmware.
> 
> I don't think this touch controller has any "disable interrupts" bit.
> So the only option here would be some disable_irq() on the IRQ line itself ?

Yes I believe so.

-- 
Dmitry
