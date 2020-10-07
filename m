Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F59F286AC2
	for <lists+linux-input@lfdr.de>; Thu,  8 Oct 2020 00:16:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728339AbgJGWQc (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 7 Oct 2020 18:16:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728275AbgJGWQc (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 7 Oct 2020 18:16:32 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87BA6C061755;
        Wed,  7 Oct 2020 15:16:32 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id y14so2266956pfp.13;
        Wed, 07 Oct 2020 15:16:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=QtVnrXLAAH7oCE78KJDpWaV9NyOvGGEZhYYFdZ6NUIw=;
        b=OvbSYbdrpg0i8Fe39nza95r2B/Du5vnhot6TGh2lyYMkRh5k/ticHcS4FVi5km8twG
         jHfrtgCRqKFLuyVwZGtMWm2BKuPBjYiWB9eI0YsdqS1AlcaW4LU0K+T89XCLUtt57bSY
         lQ+siJppBUgc3WrtS9o4Rij5yLVu8JVXIe0+iZ/zAN3jSOAbdU2MOwVTfFWtdEOwTwVD
         zgw8IaCaaWjqkmDT2DezJz4KFYgfUjnmOtZ54P8NqyxiO1SpkvR/pEtLkaMawW+N4BlU
         0/bN7JjKg0Ulks3Q35+cHcf2ZfFMSKMBpUzEWYxOXoBVg/AwUacZ+IrusTVuMPeajmbt
         0qOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=QtVnrXLAAH7oCE78KJDpWaV9NyOvGGEZhYYFdZ6NUIw=;
        b=OSRkOW3Jvca2c43HrsYsnuewV6xe9oDV2zRpf8br6qIuzIRZrTuIpr4uSh8d9JVxup
         J0xQIJzDQNWfp8iX12qrEQ6Y3Iw4c7O9pYarPqB72LcxUiOCy/C5I3KeuGOvpt2UoOmQ
         GJ67w2FaLERFAqLNdMGpaPN53oN5c0Th+m3AJmKHRxJImAcrUZvT2QYP4/+ot/ub7aMe
         lErgXE0DH+p/w3CYJHH7yNe8wdMMOnA/ILDy6VzTOK4XruMThkotXaKawF5ziDGnIk8f
         9tFNkva3tlX9P2hWufq0m1/s2jcL5cr0P5F/EodC1GJHT2MdQi74pT50uJwqJ8w2FC+t
         RCHg==
X-Gm-Message-State: AOAM5302KBsiVPCU4HdxyS4tt0sgJzWnB7nyg3gVInGhjQvntPOk8o34
        igrEGOfzRKcqM+Jku0/GWchshJPWUyAslg==
X-Google-Smtp-Source: ABdhPJxpYAV+HWz057DoJXXituAe8MP1nGEpnL4PstlChwxUUMpZYsz8Q5Xpy5y68IQ3qnHS7WqtZA==
X-Received: by 2002:a63:3e06:: with SMTP id l6mr4619335pga.179.1602108991912;
        Wed, 07 Oct 2020 15:16:31 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id h9sm4194896pfc.28.2020.10.07.15.16.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2020 15:16:31 -0700 (PDT)
Date:   Wed, 7 Oct 2020 15:16:28 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Paul Menzel <pmenzel@molgen.mpg.de>
Cc:     linux-input@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: i8042_init: PS/2 mouse not detected with ACPIPnP/PnPBIOS
Message-ID: <20201007221628.GW1009802@dtor-ws>
References: <1a69c5bc-ccc4-68db-7871-af05a70052c9@molgen.mpg.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1a69c5bc-ccc4-68db-7871-af05a70052c9@molgen.mpg.de>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Paul,

On Wed, Oct 07, 2020 at 11:18:41PM +0200, Paul Menzel wrote:
> Dear Linux folks,
> 
> 
> On the Asus F2A85-M PRO Linux 5.9-rc8 (and previous versions) does not
> recognize a plugged in PS/2 mouse using the Plug & Play method. The PS/2
> keyboard is detected fine, and using `i8042.nopnp`, the PS/2 mouse also
> works.
> 
> > [    1.035915] calling  i8042_init+0x0/0x42d @ 1
> > [    1.035947] i8042: PNP: PS/2 Controller [PNP0303:PS2K] at 0x60,0x64 irq 1
> > [    1.035948] i8042: PNP: PS/2 appears to have AUX port disabled, if this is incorrect please boot with i8042.nopnp
> > [    1.036589] serio: i8042 KBD port at 0x60,0x64 irq 1
> > [    1.036621] initcall i8042_init+0x0/0x42d returned 0 after 687 usecs
> 
> But, the DSDT includes the “mouse device”. From
> 
>     acpidump > dump.bin; acpixtract dump.bin; iasl -d *dat; more dsdt.dsl
> 
> we get
> 
>                 Device (PS2M)
>                 {
>                     Name (_HID, EisaId ("PNP0F03") /* Microsoft PS/2-style
> Mouse */)  // _HID: Hardware ID
>                     Name (_CID, EisaId ("PNP0F13") /* PS/2 Mouse */) //
> _CID: Compatible ID
>                     Method (_STA, 0, NotSerialized)  // _STA: Status
>                     {
>                         If ((IOST & 0x4000))
>                         {
>                             Return (0x0F)
>                         }
>                         Else
>                         {
>                             Return (Zero)
>                         }
>                     }
> 
> and the identifiers PNP0F03 and PNP0F13 are both listed in the array
> `pnp_aux_devids[]`. But adding print statements to `i8042_pnp_aux_probe()`,
> I do not see them, so the function does not seem to be called.

My guess is that _STA returns 0 indicating that the device is not
present. I would try tracking where IOST is being set and figuring out
why it does not have mouse bit enabled.

Thanks.

-- 
Dmitry
