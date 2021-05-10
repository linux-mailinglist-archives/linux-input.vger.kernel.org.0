Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 794E6378E5E
	for <lists+linux-input@lfdr.de>; Mon, 10 May 2021 15:51:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235990AbhEJNQM (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 10 May 2021 09:16:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350948AbhEJNCW (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 10 May 2021 09:02:22 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D964BC061574;
        Mon, 10 May 2021 05:52:02 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id a4so16519845wrr.2;
        Mon, 10 May 2021 05:52:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=w4QsKbQf5+/HIa7q0DIrIxImUQp3y28m2a4dwOLfss8=;
        b=Xa/V6eERmkf/DsqegmbcoTNmq9En83Y84l0AQa3ghO0vxJf9bDl/83dc2nck/F5GhZ
         EocYyWFZYw1Cg8WAtrPMuG4bTW45dWlSGm6TKwb2CnNMcluIWnv9HcR82awLptp3A02X
         gvVbbjgMJ4xPonh5rUsHFn76wke+y///6v0Ow4XtaMnzTAVC8XwjkE6jggIpUVmNAT6p
         RUtPVUaKER6Q448WhQRrg04OLH3OL68qm49sK4lfF5xJ168r71/wpxI965G85KAkvkha
         ESro4mRTybwCM9o2NexMfGIJOPe6BBlDdbAzf7P7fu5FSQb9ouApoVtPP76soaVdx6eX
         Cuiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=w4QsKbQf5+/HIa7q0DIrIxImUQp3y28m2a4dwOLfss8=;
        b=AD4vcKrj2OOpQ+3RikdTeB1IKqL2CpzDfPhMIGqi0C/SHLkRj8dmNLKH1x8x5l22Jy
         46izD8TMPHoJXL62eVpJBNeV6IXvXUsE6HF66SwKEN88N0eyIbHBOzoFCq/5O/srLsOT
         4i6qHh7XYJTnqCo211SnVeqQxgzAziR0mpYAp5eLgU8ROd/L0jkg7Ig6zKcumlyqpD6I
         LTP6szsF4ARx5Mta6BDRx1sTU2hHs9f6WWxlmdlcYwIHUHZ8q6SJoZ61v1rCKtt3p8et
         piMMN5PsdLgYb9J/HKEDGzqajabI23zxnger5vQd69Hedf2VKKnkfhXULeRUMyEBQuua
         fFMg==
X-Gm-Message-State: AOAM532eRAOx/rGJVPYigXo2GjoQtqZUBONqCELBJ1JkTAlhvgS8KGLn
        9gSuE1DD2tItvMRv3skUP/SigZnYYnfnXw==
X-Google-Smtp-Source: ABdhPJy+RjwtO8rF41oQPcV/rlTfxQCfr1SnePR0tjxzgBWAH2uqPN0GBR1zbQYmhrajpCBzr64H5Q==
X-Received: by 2002:adf:d4ca:: with SMTP id w10mr31873427wrk.244.1620651121486;
        Mon, 10 May 2021 05:52:01 -0700 (PDT)
Received: from michael-VirtualBox ([31.168.255.170])
        by smtp.gmail.com with ESMTPSA id y17sm25582507wrw.90.2021.05.10.05.51.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 May 2021 05:52:00 -0700 (PDT)
Date:   Mon, 10 May 2021 15:51:58 +0300
From:   Michael Zaidman <michael.zaidman@gmail.com>
To:     Joe Perches <joe@perches.com>
Cc:     lkp@intel.com, kbuild-all@lists.01.org,
        clang-built-linux@googlegroups.com, linux-kernel@vger.kernel.org,
        jikos@kernel.org, dan.carpenter@oracle.com,
        linux-input@vger.kernel.org, michael.zaidman@gmail.com
Subject: Re: [PATCH] HID: ft260: fix format type warning in ft260_word_show()
Message-ID: <20210510125158.GB2276@michael-VirtualBox>
References: <202105060637.LeEC6ztp-lkp@intel.com>
 <20210509193213.5974-1-michael.zaidman@gmail.com>
 <26e1929386babea33d4a320b506c5247caacde77.camel@perches.com>
 <20210510091730.GA2276@michael-VirtualBox>
 <7c0f57c1208b09742c839b1c1e54e2b79c83b8af.camel@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7c0f57c1208b09742c839b1c1e54e2b79c83b8af.camel@perches.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, May 10, 2021 at 02:52:14AM -0700, Joe Perches wrote:
> On Mon, 2021-05-10 at 12:17 +0300, Michael Zaidman wrote:
> > On Sun, May 09, 2021 at 01:39:29PM -0700, Joe Perches wrote:
> > > On Sun, 2021-05-09 at 22:32 +0300, Michael Zaidman wrote:
> > > > Fixes: 6a82582d9fa4 ("HID: ft260: add usb hid to i2c host bridge driver")
> > > > 
> > > > Fix warning reported by static analysis when built with W=1 for arm64 by
> > > > clang version 13.0.0
> > > > 
> > > > > > drivers/hid/hid-ft260.c:794:44: warning: format specifies type 'short' but
> > > >    the argument has type 'int' [-Wformat]
> > > >            return scnprintf(buf, PAGE_SIZE, "%hi\n", le16_to_cpu(*field));
> > > >                                              ~~~     ^~~~~~~~~~~~~~~~~~~
> > > >                                              %i
> > > >    include/linux/byteorder/generic.h:91:21: note: expanded from
> > > >                                             macro 'le16_to_cpu'
> > > >    #define le16_to_cpu __le16_to_cpu
> > > >                        ^
> > > >    include/uapi/linux/byteorder/big_endian.h:36:26: note: expanded from
> > > >                                                     macro '__le16_to_cpu'
> > > >    #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
> > > >                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > > >    include/uapi/linux/swab.h:105:2: note: expanded from macro '__swab16'
> > > >            (__builtin_constant_p((__u16)(x)) ?     \
> > > >            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > > > 
> > > > Signed-off-by: Michael Zaidman <michael.zaidman@gmail.com>
> > > > Reported-by: kernel test robot <lkp@intel.com>
> > > > ---
> > > >  drivers/hid/hid-ft260.c | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > 
> > > > diff --git a/drivers/hid/hid-ft260.c b/drivers/hid/hid-ft260.c
> > > > index 047aa85a7c83..38794a29599c 100644
> > > > --- a/drivers/hid/hid-ft260.c
> > > > +++ b/drivers/hid/hid-ft260.c
> > > > @@ -791,7 +791,7 @@ static int ft260_word_show(struct hid_device *hdev, int id, u8 *cfg, int len,
> > > >  	if (ret != len && ret >= 0)
> > > >  		return -EIO;
> > > >  
> > > > 
> > > > -	return scnprintf(buf, PAGE_SIZE, "%hi\n", le16_to_cpu(*field));
> > > > +	return scnprintf(buf, PAGE_SIZE, "%d\n", le16_to_cpu(*field));
> > > >  }
> > > 
> > > There are 2 of these so I wonder about the static analysis.
> > 
> > There is nothing wrong with the static analysis. The first scnprintf format
> > type is perfectly valid as far as its size is greater than the size of the
> > data pointed by the *field pointer, which is a one byte size in our case.
> > The static analysis warned about the second scnprintf case, where the format
> > type was shorter than the integer returned by the __builtin_constant_p.
> > This warning can be considered as a false positive since the le16_to_cpu is
> > all about the 16 bits numbers, but to silence it, I submitted the above fix.
> 
> $ git grep __arch_swab16 arch/arm*/
> arch/arm/include/asm/swab.h:#define __arch_swab16(x) ((__u16)__arch_swahb32(x))
> 
> otherwise:
> 
> static inline __attribute_const__ __u16 __fswab16(__u16 val)
> {
> #if defined (__arch_swab16)
> 	return __arch_swab16(val);
> #else
> 	return ___constant_swab16(val);
> #endif
> }
> 
> #define ___constant_swab16(x) ((__u16)(				\
> 	(((__u16)(x) & (__u16)0x00ffU) << 8) |			\
> 	(((__u16)(x) & (__u16)0xff00U) >> 8)))
> 
> /**
>  * __swab16 - return a byteswapped 16-bit value
>  * @x: value to byteswap
>  */
> #ifdef __HAVE_BUILTIN_BSWAP16__
> #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
> #else
> #define __swab16(x)				\
> 	(__builtin_constant_p((__u16)(x)) ?	\
> 	___constant_swab16(x) :			\
> 	__fswab16(x))
> #endif
> 
> Under what condition does the ?: return an int sized value
> rather than a u16 sized value?  I fail to see a path where
> the compiler should promote the returned value to int _before_
> the promotion done for the varargs use.

Oh, I see your point. Might it be that the static analysis misinterpreted
the __builtin_constant_p function which has a `int __builtin_constant_p (exp)`
prototype according to the GCC and clang built-in functions description?

> 
> If it's for the varargs use, then both instances are promoted.
> 
> > > It's probably better to use sysfs_emit as well.
> > 
> > The sysfs_emit was introduced in the 5.10 kernel:
> > 2efc459d06f16 (Joe Perches 2020-09-16 13:40:38 -0700 335) int sysfs_emit(...)
> > 
> > But, the hid-ft260 driver will be used mostly with older kernels, at least,
> > for the next couple of years. Since older kernel versions do not have this API,
> > it will require patching the driver or kernel that I would like to avoid.
> > Nevertheless, we can reconsider the sysfs_emit usage in this driver in the
> > future, upon wider 5.10+ kernels' adoption.
> 
> If this is only for older kernels, then it's not really useful
> upstream IMO.

Under "mostly", I meant that the majority of the kernels used in the existing and
currently developing electronic appliances (not necessarily computers) are older
than the 5.10 version at the moment, and this driver should be usable also by them.

The scnprintf enables the hid-ft260 driver reuse by virtually any kernel version.

$ git grep scnprintf | wc -l
6121

> 
> any sprintf style use of %h or %hh for a sub int sized value isn't
> particularly useful as integer promotion is done on the value so it
> should use %d (or %i, but %i is atypical) anyway.
> 
> https://lore.kernel.org/lkml/CAHk-=wgoxnmsj8GEVFJSvTwdnWm8wVJthefNk2n6+4TC=20e0Q@mail.gmail.com/

Thanks for sharing this info. I will replace the %hi with %d as you
suggested.
> 
> $ git grep '%d\b' | wc -l
> 109922
> $ git grep '%i\b' | wc -l
> 3508
> 
> 
