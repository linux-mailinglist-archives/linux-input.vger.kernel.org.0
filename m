Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5CAFC377F37
	for <lists+linux-input@lfdr.de>; Mon, 10 May 2021 11:17:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230050AbhEJJSj (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 10 May 2021 05:18:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229566AbhEJJSj (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 10 May 2021 05:18:39 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86E52C061574;
        Mon, 10 May 2021 02:17:34 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id l18-20020a1ced120000b029014c1adff1edso10700745wmh.4;
        Mon, 10 May 2021 02:17:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=DxjklwCIIGCoUwqhhNFPNEu8kK6F0birRahQBV0h8UU=;
        b=YxPQ5HdJ1wiMXPSrYEDs4D3bvkhQgMe2mGL0WtJS0FId3Ccq7PxE580rKu/bBcA5+E
         R1TFgr6YpP7MF2I2Xm+pAa9NTxO+QIkD3pXjW795Vec6PLG11VQ3zaUdwZzuueSaUDmh
         wQcdNtG66S0WX6UROJCTo9JECTFgABF9Q9ktc7j9jeAbCnJJHPPbAGkrTLQ1GFp0cXlJ
         DIyN+Vq3xcGscPUtEMuDw2LY+GceN5D77FubJ8uLsORqeJlphLK2OUNQTU4pA+zasq9A
         +5LsAGgubizpGUOhaQnq+SLQA7ogOO/prIBDQGsC9pPri+WvccplpEMr9+Nly1SaX114
         zNoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=DxjklwCIIGCoUwqhhNFPNEu8kK6F0birRahQBV0h8UU=;
        b=tc5EI0/lDMhKVvBiZa9JkyEiopj36Mv7KnerodypJq82etU4dvo5lE4rp33CoOZrQm
         1rTYvPEMfOLoe3+yQ/L2ZPsXUa/JtnoIll8cFVlylqJx9/w4fqYduUq0l6ajdM1ComqT
         dxuWlu7UTCcqN1A1c2cbqF+pKETHM93nh6xiSFvESZTWDGnbOy9HInXp6pTIgXkW8nXD
         sSKZSpXool38ezwvrZc/I7Rb+1mnPoRs5aKBv8Kxrb5Tmezx6sEOXi1mcjR3aVeFpSCt
         RjQwRcqm4zgVc+IAv/pVa+2YRCo5Q79/qA5XOYgwIdmt4KEr0zVyi4ob3aaFxPbyf/Fm
         IIEQ==
X-Gm-Message-State: AOAM532tnHovgBdl7amIgqZ7D3lHticuQQ7v9UzPUYLPb8LbAHI1Mb8Q
        SoObUQo8TqL5PIZNE/J6hfzc7OLKdmod3A==
X-Google-Smtp-Source: ABdhPJwAM8OEvrdP8pEU+eMp2Xfz1oSQ6ntpjeUD226hm0O7g/dES+cKRKNpQxTJUHGOL6HL2hyKZQ==
X-Received: by 2002:a7b:ca4b:: with SMTP id m11mr25426740wml.34.1620638253284;
        Mon, 10 May 2021 02:17:33 -0700 (PDT)
Received: from michael-VirtualBox ([31.168.255.170])
        by smtp.gmail.com with ESMTPSA id l22sm23401763wmq.28.2021.05.10.02.17.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 May 2021 02:17:33 -0700 (PDT)
Date:   Mon, 10 May 2021 12:17:30 +0300
From:   Michael Zaidman <michael.zaidman@gmail.com>
To:     Joe Perches <joe@perches.com>
Cc:     lkp@intel.com, kbuild-all@lists.01.org,
        clang-built-linux@googlegroups.com, linux-kernel@vger.kernel.org,
        jikos@kernel.org, dan.carpenter@oracle.com,
        linux-input@vger.kernel.org, michael.zaidman@gmail.com
Subject: Re: [PATCH] HID: ft260: fix format type warning in ft260_word_show()
Message-ID: <20210510091730.GA2276@michael-VirtualBox>
References: <202105060637.LeEC6ztp-lkp@intel.com>
 <20210509193213.5974-1-michael.zaidman@gmail.com>
 <26e1929386babea33d4a320b506c5247caacde77.camel@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <26e1929386babea33d4a320b506c5247caacde77.camel@perches.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, May 09, 2021 at 01:39:29PM -0700, Joe Perches wrote:
> On Sun, 2021-05-09 at 22:32 +0300, Michael Zaidman wrote:
> > Fixes: 6a82582d9fa4 ("HID: ft260: add usb hid to i2c host bridge driver")
> > 
> > Fix warning reported by static analysis when built with W=1 for arm64 by
> > clang version 13.0.0
> > 
> > > > drivers/hid/hid-ft260.c:794:44: warning: format specifies type 'short' but
> >    the argument has type 'int' [-Wformat]
> >            return scnprintf(buf, PAGE_SIZE, "%hi\n", le16_to_cpu(*field));
> >                                              ~~~     ^~~~~~~~~~~~~~~~~~~
> >                                              %i
> >    include/linux/byteorder/generic.h:91:21: note: expanded from
> >                                             macro 'le16_to_cpu'
> >    #define le16_to_cpu __le16_to_cpu
> >                        ^
> >    include/uapi/linux/byteorder/big_endian.h:36:26: note: expanded from
> >                                                     macro '__le16_to_cpu'
> >    #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
> >                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >    include/uapi/linux/swab.h:105:2: note: expanded from macro '__swab16'
> >            (__builtin_constant_p((__u16)(x)) ?     \
> >            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > 
> > Signed-off-by: Michael Zaidman <michael.zaidman@gmail.com>
> > Reported-by: kernel test robot <lkp@intel.com>
> > ---
> >  drivers/hid/hid-ft260.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/hid/hid-ft260.c b/drivers/hid/hid-ft260.c
> > index 047aa85a7c83..38794a29599c 100644
> > --- a/drivers/hid/hid-ft260.c
> > +++ b/drivers/hid/hid-ft260.c
> > @@ -791,7 +791,7 @@ static int ft260_word_show(struct hid_device *hdev, int id, u8 *cfg, int len,
> >  	if (ret != len && ret >= 0)
> >  		return -EIO;
> >  
> > 
> > -	return scnprintf(buf, PAGE_SIZE, "%hi\n", le16_to_cpu(*field));
> > +	return scnprintf(buf, PAGE_SIZE, "%d\n", le16_to_cpu(*field));
> >  }
> 
> There are 2 of these so I wonder about the static analysis.

There is nothing wrong with the static analysis. The first scnprintf format
type is perfectly valid as far as its size is greater than the size of the
data pointed by the *field pointer, which is a one byte size in our case.
The static analysis warned about the second scnprintf case, where the format
type was shorter than the integer returned by the __builtin_constant_p.
This warning can be considered as a false positive since the le16_to_cpu is
all about the 16 bits numbers, but to silence it, I submitted the above fix.

> It's probably better to use sysfs_emit as well.

The sysfs_emit was introduced in the 5.10 kernel:
2efc459d06f16 (Joe Perches 2020-09-16 13:40:38 -0700 335) int sysfs_emit(...)

But, the hid-ft260 driver will be used mostly with older kernels, at least,
for the next couple of years. Since older kernel versions do not have this API,
it will require patching the driver or kernel that I would like to avoid.
Nevertheless, we can reconsider the sysfs_emit usage in this driver in the
future, upon wider 5.10+ kernels' adoption.

> ---
>  drivers/hid/hid-ft260.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hid/hid-ft260.c b/drivers/hid/hid-ft260.c
> index 7a9ba984a75a..475641682fff 100644
> --- a/drivers/hid/hid-ft260.c
> +++ b/drivers/hid/hid-ft260.c
> @@ -783,7 +783,7 @@ static int ft260_byte_show(struct hid_device *hdev, int id, u8 *cfg, int len,
>  	if (ret != len && ret >= 0)
>  		return -EIO;
>  
> -	return scnprintf(buf, PAGE_SIZE, "%hi\n", *field);
> +	return sysfs_emit(buf, "%d\n", *field);
>  }
>  
>  static int ft260_word_show(struct hid_device *hdev, int id, u8 *cfg, int len,
> @@ -795,7 +795,7 @@ static int ft260_word_show(struct hid_device *hdev, int id, u8 *cfg, int len,
>  	if (ret != len && ret >= 0)
>  		return -EIO;
>  
> -	return scnprintf(buf, PAGE_SIZE, "%hi\n", le16_to_cpu(*field));
> +	return sysfs_emit(buf, "%d\n", le16_to_cpu(*field));
>  }
>  
>  #define FT260_ATTR_SHOW(name, reptype, id, type, func)			       \
> 
