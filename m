Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DCA66378070
	for <lists+linux-input@lfdr.de>; Mon, 10 May 2021 11:53:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231180AbhEJJyC (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 10 May 2021 05:54:02 -0400
Received: from smtprelay0211.hostedemail.com ([216.40.44.211]:50288 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S230497AbhEJJxX (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 10 May 2021 05:53:23 -0400
Received: from omf15.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay01.hostedemail.com (Postfix) with ESMTP id 21A4C100E7B42;
        Mon, 10 May 2021 09:52:17 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf15.hostedemail.com (Postfix) with ESMTPA id C6992C4184;
        Mon, 10 May 2021 09:52:15 +0000 (UTC)
Message-ID: <7c0f57c1208b09742c839b1c1e54e2b79c83b8af.camel@perches.com>
Subject: Re: [PATCH] HID: ft260: fix format type warning in ft260_word_show()
From:   Joe Perches <joe@perches.com>
To:     Michael Zaidman <michael.zaidman@gmail.com>
Cc:     lkp@intel.com, kbuild-all@lists.01.org,
        clang-built-linux@googlegroups.com, linux-kernel@vger.kernel.org,
        jikos@kernel.org, dan.carpenter@oracle.com,
        linux-input@vger.kernel.org
Date:   Mon, 10 May 2021 02:52:14 -0700
In-Reply-To: <20210510091730.GA2276@michael-VirtualBox>
References: <202105060637.LeEC6ztp-lkp@intel.com>
         <20210509193213.5974-1-michael.zaidman@gmail.com>
         <26e1929386babea33d4a320b506c5247caacde77.camel@perches.com>
         <20210510091730.GA2276@michael-VirtualBox>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.40
X-Rspamd-Server: rspamout04
X-Rspamd-Queue-Id: C6992C4184
X-Stat-Signature: 6ttn4yrgzpd86o1w8ng177yj47jjhw4t
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1+pan58tWSx0z0CVolnNbeqmvoWkh/6unM=
X-HE-Tag: 1620640335-659357
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, 2021-05-10 at 12:17 +0300, Michael Zaidman wrote:
> On Sun, May 09, 2021 at 01:39:29PM -0700, Joe Perches wrote:
> > On Sun, 2021-05-09 at 22:32 +0300, Michael Zaidman wrote:
> > > Fixes: 6a82582d9fa4 ("HID: ft260: add usb hid to i2c host bridge driver")
> > > 
> > > Fix warning reported by static analysis when built with W=1 for arm64 by
> > > clang version 13.0.0
> > > 
> > > > > drivers/hid/hid-ft260.c:794:44: warning: format specifies type 'short' but
> > >    the argument has type 'int' [-Wformat]
> > >            return scnprintf(buf, PAGE_SIZE, "%hi\n", le16_to_cpu(*field));
> > >                                              ~~~     ^~~~~~~~~~~~~~~~~~~
> > >                                              %i
> > >    include/linux/byteorder/generic.h:91:21: note: expanded from
> > >                                             macro 'le16_to_cpu'
> > >    #define le16_to_cpu __le16_to_cpu
> > >                        ^
> > >    include/uapi/linux/byteorder/big_endian.h:36:26: note: expanded from
> > >                                                     macro '__le16_to_cpu'
> > >    #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
> > >                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > >    include/uapi/linux/swab.h:105:2: note: expanded from macro '__swab16'
> > >            (__builtin_constant_p((__u16)(x)) ?     \
> > >            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > > 
> > > Signed-off-by: Michael Zaidman <michael.zaidman@gmail.com>
> > > Reported-by: kernel test robot <lkp@intel.com>
> > > ---
> > >  drivers/hid/hid-ft260.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/hid/hid-ft260.c b/drivers/hid/hid-ft260.c
> > > index 047aa85a7c83..38794a29599c 100644
> > > --- a/drivers/hid/hid-ft260.c
> > > +++ b/drivers/hid/hid-ft260.c
> > > @@ -791,7 +791,7 @@ static int ft260_word_show(struct hid_device *hdev, int id, u8 *cfg, int len,
> > >  	if (ret != len && ret >= 0)
> > >  		return -EIO;
> > >  
> > > 
> > > -	return scnprintf(buf, PAGE_SIZE, "%hi\n", le16_to_cpu(*field));
> > > +	return scnprintf(buf, PAGE_SIZE, "%d\n", le16_to_cpu(*field));
> > >  }
> > 
> > There are 2 of these so I wonder about the static analysis.
> 
> There is nothing wrong with the static analysis. The first scnprintf format
> type is perfectly valid as far as its size is greater than the size of the
> data pointed by the *field pointer, which is a one byte size in our case.
> The static analysis warned about the second scnprintf case, where the format
> type was shorter than the integer returned by the __builtin_constant_p.
> This warning can be considered as a false positive since the le16_to_cpu is
> all about the 16 bits numbers, but to silence it, I submitted the above fix.

$ git grep __arch_swab16 arch/arm*/
arch/arm/include/asm/swab.h:#define __arch_swab16(x) ((__u16)__arch_swahb32(x))

otherwise:

static inline __attribute_const__ __u16 __fswab16(__u16 val)
{
#if defined (__arch_swab16)
	return __arch_swab16(val);
#else
	return ___constant_swab16(val);
#endif
}

#define ___constant_swab16(x) ((__u16)(				\
	(((__u16)(x) & (__u16)0x00ffU) << 8) |			\
	(((__u16)(x) & (__u16)0xff00U) >> 8)))

/**
 * __swab16 - return a byteswapped 16-bit value
 * @x: value to byteswap
 */
#ifdef __HAVE_BUILTIN_BSWAP16__
#define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
#else
#define __swab16(x)				\
	(__builtin_constant_p((__u16)(x)) ?	\
	___constant_swab16(x) :			\
	__fswab16(x))
#endif

Under what condition does the ?: return an int sized value
rather than a u16 sized value?  I fail to see a path where
the compiler should promote the returned value to int _before_
the promotion done for the varargs use.

If it's for the varargs use, then both instances are promoted.

> > It's probably better to use sysfs_emit as well.
> 
> The sysfs_emit was introduced in the 5.10 kernel:
> 2efc459d06f16 (Joe Perches 2020-09-16 13:40:38 -0700 335) int sysfs_emit(...)
> 
> But, the hid-ft260 driver will be used mostly with older kernels, at least,
> for the next couple of years. Since older kernel versions do not have this API,
> it will require patching the driver or kernel that I would like to avoid.
> Nevertheless, we can reconsider the sysfs_emit usage in this driver in the
> future, upon wider 5.10+ kernels' adoption.

If this is only for older kernels, then it's not really useful
upstream IMO.

any sprintf style use of %h or %hh for a sub int sized value isn't
particularly useful as integer promotion is done on the value so it
should use %d (or %i, but %i is atypical) anyway.

https://lore.kernel.org/lkml/CAHk-=wgoxnmsj8GEVFJSvTwdnWm8wVJthefNk2n6+4TC=20e0Q@mail.gmail.com/

$ git grep '%d\b' | wc -l
109922
$ git grep '%i\b' | wc -l
3508


