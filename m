Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D6681B4EC7
	for <lists+linux-input@lfdr.de>; Wed, 22 Apr 2020 23:06:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726421AbgDVVF4 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 22 Apr 2020 17:05:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725779AbgDVVFz (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 22 Apr 2020 17:05:55 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2DA9C03C1A9;
        Wed, 22 Apr 2020 14:05:55 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id y6so1461127pjc.4;
        Wed, 22 Apr 2020 14:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=9Hxcr7k9jUwdvDDFuHQ6PdCjrAMCPuNIcLYKhxKKpn8=;
        b=nhy4NonXIJJQ62N5nSiQbA8InFCZDssW5TOwdfPTaz7LWlPtLLJoBu1mV6M4WPyi9K
         Uctv9xgonUgdge4J0jsF/s7KUsP6X0E3vOSWOLRc4FGjQ+dcT+/kT0SnxcGM7IJzatle
         7MkFDzAlmtdCXrM7AtsMHGPD1xAWwylivFefUQBnpYMd6NZ1GoONkkXt7AvA/8ch8MGp
         nMGbDQUsjVEdHgRrrmBi34Gb/BUh/ja4Nm5+PcLyGMFCB34FtRI3V12RG02Q4Wc/LyyM
         wDpW/aVwfUUOIeRhbE0hTNFLK0ZryIRR43gFPGkD4vLtJ/C1E/i2ondOrbrhcEdQ4vZC
         M/7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=9Hxcr7k9jUwdvDDFuHQ6PdCjrAMCPuNIcLYKhxKKpn8=;
        b=IbgSi1mp5APZ2gOAovth8mc08545QNoFeExNYkyQjNyHBXH+Zy5EP8Rk1ACHp6ArMt
         Y0+cAVkGWk5Yl2wpNvrakadVjbolVJ2sBNkW+aggCmwZTOpnvGm2R7lVLG3mLqvzAtDU
         CJMQLZGlgTOCKfbyIAl8XjZucxkb7WQBllJYqgV3rLC4OZ8aLeB4Up3OVIh6C8yV8afX
         VV7K/wdxWhxht5Qj1nM6pdSp1H10rrRDkCk4FVfhtP+cQlGtlKo8YSWhAH13Kr9OKFRd
         W22qy5uNf2oG+3UTQwTZ0A9+bhD/UUUYLk6Ru0+Zr3Jk55LyAjDRpjqG4Ly44ev+G5Yv
         1FVQ==
X-Gm-Message-State: AGi0PuYdKqX6EoNAUeCZV4go9yx9REb8KN3uh2ng3ubvnX5+hDgoMRuJ
        ySbl6yOJQbl4eWT9AhS2X58=
X-Google-Smtp-Source: APiQypLYhO/158p1Ei3LWU7McDNzp4fpSzHOEvJzHBV7eNgT0AaIlAV0EKTfU39FNAfp/vKTH9TYvw==
X-Received: by 2002:a17:902:a701:: with SMTP id w1mr517909plq.165.1587589555341;
        Wed, 22 Apr 2020 14:05:55 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3c2a:73a9:c2cf:7f45])
        by smtp.gmail.com with ESMTPSA id o9sm139865pje.47.2020.04.22.14.05.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2020 14:05:54 -0700 (PDT)
Date:   Wed, 22 Apr 2020 14:05:52 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     Andi Shyti <andi@etezian.org>, linux-input@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/2] Input: mms114 - add support for mms345l
Message-ID: <20200422210552.GF125362@dtor-ws>
References: <20200405170904.61512-1-stephan@gerhold.net>
 <20200409221503.GS75430@dtor-ws>
 <20200410102631.GA85423@gerhold.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200410102631.GA85423@gerhold.net>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Apr 10, 2020 at 12:27:02PM +0200, Stephan Gerhold wrote:
> Hi Dmitry,
> 
> On Thu, Apr 09, 2020 at 03:15:03PM -0700, Dmitry Torokhov wrote:
> > Hi Stephan,
> > 
> > On Sun, Apr 05, 2020 at 07:09:03PM +0200, Stephan Gerhold wrote:
> > > MMS345L is another first generation touch screen from Melfas,
> > > which uses the same registers as MMS152.
> > > 
> > > However, using I2C_M_NOSTART for it causes errors when reading:
> > > 
> > > 	i2c i2c-0: sendbytes: NAK bailout.
> > > 	mms114 0-0048: __mms114_read_reg: i2c transfer failed (-5)
> > > 
> > > The driver works fine as soon as I2C_M_NOSTART is removed.
> > > 
> > > Add a separate melfas,mms345l binding, and make use of I2C_M_NOSTART
> > > only for MMS114 and MMS152.
> > > 
> > > Reviewed-by: Andi Shyti <andi@etezian.org>
> > > Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
> > 
> > Sorry for sitting on this for so long. I looked around, and I think that
> > instead of adding separate handling for 345L we shoudl simply drop the
> > "no start" bit for everyone. I am not sure what the original version
> > tried to do here, as far as I can see in various public Android trees the
> > driver for these devices does not use I2C_M_NOSTART.
> > 
> > Actually, I wonder if the difference is not in the touch controller that
> > is being used, but rather in the I2C controller the device in connected
> > to.
> > 
> > I would like to apply the version of the patch below.
> 
> Thanks a lot for your reply!
> 
> Your suggested patch below works fine on my MMS345L device
> (with the melfas,mms152 compatible). Applying it would allow
> the touchscreen to work on my device in mainline :)
> 
> I wonder if we should still add a separate melfas,mms345l compatible:
> 
> The only remaining difference to MMS152 at the moment is the
> MMS152_COMPAT_GROUP register. It seems to be used for something
> different on MMS345L, so when it is printed in mms114_get_version()
> it just displays some garbage:
> 
> TSP FW Rev: bootloader 0x6 / core 0x26 / config 0x26, Compat group: \x06
> 
> (It used to actually print it as some ASCII control character but
>  apparently that was fixed...)
> 
> It's not really critical, but in case we find more differences I think
> it's better to directly add a separate compatible string to the device
> tree.
> 
> If you agree with this I can send a separate patch with the new
> compatible string once you have applied the patch below.

Yes, if there is legitimate differences between the chips that would be
a good reason to add a new compatible string.

Please send a separate patch with updated justification and I will apply
it.

Thank you.

-- 
Dmitry
