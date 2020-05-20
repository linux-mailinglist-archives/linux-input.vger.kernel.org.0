Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B50861DAA5A
	for <lists+linux-input@lfdr.de>; Wed, 20 May 2020 08:06:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726375AbgETGGn (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 20 May 2020 02:06:43 -0400
Received: from ozlabs.org ([203.11.71.1]:56383 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725998AbgETGGn (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 20 May 2020 02:06:43 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49Rj1r557Fz9sT1;
        Wed, 20 May 2020 16:06:40 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
        s=201909; t=1589954801;
        bh=B5d+TcIuRwQVi/8LSOWWiWgdlteHGB54WIjY9G+SsEg=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=a8KS2mPmmjOaOIfny1M5Idmgm7R8ntkK2f1fL8g9nOo138iyvNKGSsi6l1gU1AD6k
         VkXRAsUcmEk8Jt+pq0EFQDL65vk3Hn046ACZ5Vc1ugK1d3+uVoqw5v0+zUn6GcYOS2
         9Ec6Ao96XcVicF8x5XfD3N62iirHV5jBMq5Cvsrce76Iy8zOfMbvPaquXGhIYCVWWo
         nkj1NGioC/xW9nKtlQCrLHxcY8bmrknWDtn+cHEWyoy77qIMwymqsNJvUw0fNSAF1w
         lSED4D9364BsPDScLgljK4sf9IP09RRRQ0Xaf9dTsBdqqNvfTfcQqwbRhZnGUPTF+2
         LaKnvQgmqT/8g==
From:   Michael Ellerman <mpe@ellerman.id.au>
To:     dmitry.torokhov@gmail.com, linux-input@vger.kernel.org
Cc:     Nathan Chancellor <natechancellor@gmail.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        clang-built-linux@googlegroups.com,
        Nathan Chancellor <natechancellor@gmail.com>,
        kbuild test robot <lkp@intel.com>
Subject: Re: [PATCH] input: i8042: Remove special PowerPC handling
In-Reply-To: <20200518181043.3363953-1-natechancellor@gmail.com>
References: <87a7254bxd.fsf@mpe.ellerman.id.au> <20200518181043.3363953-1-natechancellor@gmail.com>
Date:   Wed, 20 May 2020 16:07:00 +1000
Message-ID: <87ftbv87i3.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

[ + Dmitry & linux-input ]

Nathan Chancellor <natechancellor@gmail.com> writes:
> This causes a build error with CONFIG_WALNUT because kb_cs and kb_data
> were removed in commit 917f0af9e5a9 ("powerpc: Remove arch/ppc and
> include/asm-ppc").
>
> ld.lld: error: undefined symbol: kb_cs
>> referenced by i8042-ppcio.h:28 (drivers/input/serio/i8042-ppcio.h:28)
>> input/serio/i8042.o:(__i8042_command) in archive drivers/built-in.a
>> referenced by i8042-ppcio.h:28 (drivers/input/serio/i8042-ppcio.h:28)
>> input/serio/i8042.o:(__i8042_command) in archive drivers/built-in.a
>> referenced by i8042-ppcio.h:28 (drivers/input/serio/i8042-ppcio.h:28)
>> input/serio/i8042.o:(__i8042_command) in archive drivers/built-in.a
>
> ld.lld: error: undefined symbol: kb_data
>> referenced by i8042.c:309 (drivers/input/serio/i8042.c:309)
>> input/serio/i8042.o:(__i8042_command) in archive drivers/built-in.a
>> referenced by i8042-ppcio.h:33 (drivers/input/serio/i8042-ppcio.h:33)
>> input/serio/i8042.o:(__i8042_command) in archive drivers/built-in.a
>> referenced by i8042.c:319 (drivers/input/serio/i8042.c:319)
>> input/serio/i8042.o:(__i8042_command) in archive drivers/built-in.a
>> referenced 15 more times
>
> Presumably since nobody has noticed this for the last 12 years, there is
> not anyone actually trying to use this driver so we can just remove this
> special walnut code and use the generic header so it builds for all
> configurations.
>
> Fixes: 917f0af9e5a9 ("powerpc: Remove arch/ppc and include/asm-ppc")
> Reported-by: kbuild test robot <lkp@intel.com>
> Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
> ---
>  drivers/input/serio/i8042-ppcio.h | 57 -------------------------------
>  drivers/input/serio/i8042.h       |  2 --
>  2 files changed, 59 deletions(-)
>  delete mode 100644 drivers/input/serio/i8042-ppcio.h

This LGTM.

Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)

I assumed drivers/input/serio would be pretty quiet, but there's
actually some commits to it in linux-next. So perhaps this should go via
the input tree.

Dmitry do you want to take this, or should I take it via powerpc?

Original patch is here:
  https://lore.kernel.org/lkml/20200518181043.3363953-1-natechancellor@gmail.com

cheers

> diff --git a/drivers/input/serio/i8042-ppcio.h b/drivers/input/serio/i8042-ppcio.h
> deleted file mode 100644
> index 391f94d9e47d..000000000000
> --- a/drivers/input/serio/i8042-ppcio.h
> +++ /dev/null
> @@ -1,57 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0-only */
> -#ifndef _I8042_PPCIO_H
> -#define _I8042_PPCIO_H
> -
> -
> -#if defined(CONFIG_WALNUT)
> -
> -#define I8042_KBD_IRQ 25
> -#define I8042_AUX_IRQ 26
> -
> -#define I8042_KBD_PHYS_DESC "walnutps2/serio0"
> -#define I8042_AUX_PHYS_DESC "walnutps2/serio1"
> -#define I8042_MUX_PHYS_DESC "walnutps2/serio%d"
> -
> -extern void *kb_cs;
> -extern void *kb_data;
> -
> -#define I8042_COMMAND_REG (*(int *)kb_cs)
> -#define I8042_DATA_REG (*(int *)kb_data)
> -
> -static inline int i8042_read_data(void)
> -{
> -	return readb(kb_data);
> -}
> -
> -static inline int i8042_read_status(void)
> -{
> -	return readb(kb_cs);
> -}
> -
> -static inline void i8042_write_data(int val)
> -{
> -	writeb(val, kb_data);
> -}
> -
> -static inline void i8042_write_command(int val)
> -{
> -	writeb(val, kb_cs);
> -}
> -
> -static inline int i8042_platform_init(void)
> -{
> -	i8042_reset = I8042_RESET_ALWAYS;
> -	return 0;
> -}
> -
> -static inline void i8042_platform_exit(void)
> -{
> -}
> -
> -#else
> -
> -#include "i8042-io.h"
> -
> -#endif
> -
> -#endif /* _I8042_PPCIO_H */
> diff --git a/drivers/input/serio/i8042.h b/drivers/input/serio/i8042.h
> index 38dc27ad3c18..eb376700dfff 100644
> --- a/drivers/input/serio/i8042.h
> +++ b/drivers/input/serio/i8042.h
> @@ -17,8 +17,6 @@
>  #include "i8042-ip22io.h"
>  #elif defined(CONFIG_SNI_RM)
>  #include "i8042-snirm.h"
> -#elif defined(CONFIG_PPC)
> -#include "i8042-ppcio.h"
>  #elif defined(CONFIG_SPARC)
>  #include "i8042-sparcio.h"
>  #elif defined(CONFIG_X86) || defined(CONFIG_IA64)
>
> base-commit: 72bc15d0018ebfbc9c389539d636e2e9a9002b3b
> -- 
> 2.27.0.rc0
