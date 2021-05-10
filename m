Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 86BB8378109
	for <lists+linux-input@lfdr.de>; Mon, 10 May 2021 12:16:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230398AbhEJKRR (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 10 May 2021 06:17:17 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:46906 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230337AbhEJKRP (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 10 May 2021 06:17:15 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 14AAEkGK026936;
        Mon, 10 May 2021 10:16:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 content-transfer-encoding : in-reply-to; s=corp-2020-01-29;
 bh=NBGUUTnNekDnbhp+d6K0inIIPOKWMhSvU2zPiD9ILDY=;
 b=Z7MdwOsSfKfLEVyiei+T9JOXEVdN2J7FayqiTDaDKGGI1hU0xwy/f64IBaGDCJakCU76
 yfF4NKvTO3jQv63mpphLUdhy6Lomg0AT187QRWHBlmUTZYL5+BFBaoGbuGZz0Il72GdX
 TS0R9daNq/ezwkqOEnbhg/DL1AHWR2GFb+qaR3kcI4gbkm9X35JYtrJsNtAU9piN6Jl7
 av0jXEfWcn9aJkkckUFAVjciWmx+dP/+UNg8CGrx/kjsBiOzAE1Vp7BmT9uPCj+GIi97
 dG++Z6a0TK1Yl5iO9e4/bCqsjV6P0SyvCMROz8BTvfwOA2SxxYjsrSu2bdS06ihPMBpi uQ== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by userp2120.oracle.com with ESMTP id 38dk9nap7x-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 10 May 2021 10:16:02 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 14AAEaOu116583;
        Mon, 10 May 2021 10:16:01 GMT
Received: from pps.reinject (localhost [127.0.0.1])
        by aserp3020.oracle.com with ESMTP id 38djf6a9eb-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 10 May 2021 10:16:01 +0000
Received: from aserp3020.oracle.com (aserp3020.oracle.com [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 14AAG0ZK122591;
        Mon, 10 May 2021 10:16:00 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by aserp3020.oracle.com with ESMTP id 38djf6a9d3-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 10 May 2021 10:16:00 +0000
Received: from abhmp0016.oracle.com (abhmp0016.oracle.com [141.146.116.22])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 14AAFwU8009144;
        Mon, 10 May 2021 10:15:58 GMT
Received: from kadam (/102.36.221.92)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Mon, 10 May 2021 03:15:58 -0700
Date:   Mon, 10 May 2021 13:15:51 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Joe Perches <joe@perches.com>
Cc:     Michael Zaidman <michael.zaidman@gmail.com>, lkp@intel.com,
        kbuild-all@lists.01.org, clang-built-linux@googlegroups.com,
        linux-kernel@vger.kernel.org, jikos@kernel.org,
        linux-input@vger.kernel.org
Subject: Re: [PATCH] HID: ft260: fix format type warning in ft260_word_show()
Message-ID: <20210510101551.GQ1922@kadam>
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
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-ORIG-GUID: tVlLfI4TERApjT5Q0lL99dTne1CBUEm0
X-Proofpoint-GUID: tVlLfI4TERApjT5Q0lL99dTne1CBUEm0
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9979 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 phishscore=0
 adultscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 clxscore=1011 bulkscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2105100072
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
> 
> If it's for the varargs use, then both instances are promoted.
> 

Ternary type promotion is a horrible thing.

	foo = a ? b : c;

Everything is type promoted which ever of a, b or c has the most
positive bits.  Or if none of them have 31 positive bits it's
type promoted to int.

I sent a series of patches earlier where one the a, b, or c was
a negative error code and another was a unsigned int.  And foo
was a ssize_t.  Because you end up type promoting the -ENOMEM
to something close to UINT_MAX and then it doesn't sign extend
so the ssize_t value is not negative.

regards,
dan carpenter

