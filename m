Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 57260194A8F
	for <lists+linux-input@lfdr.de>; Thu, 26 Mar 2020 22:28:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727509AbgCZV2u (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 26 Mar 2020 17:28:50 -0400
Received: from mail-pj1-f65.google.com ([209.85.216.65]:52480 "EHLO
        mail-pj1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726359AbgCZV2u (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 26 Mar 2020 17:28:50 -0400
Received: by mail-pj1-f65.google.com with SMTP id ng8so3008410pjb.2;
        Thu, 26 Mar 2020 14:28:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=h9Np+N/jnv+SaunZ4Qzp2gD2QknFbGsdEeKP5pH/MNs=;
        b=LeCF+XZOSJAf2r1mO82UXQ3kV+Djmm1D+LCHPYnmBkNkol7AAPjlCdJkkH6Cq8DtH/
         r1VcaMs3iCtk8ToH74cNB/NDcVzD870+dQKYqlWI8xrNudIH5vGjOyqPjx9OCSlqDfsk
         uIg2kHiXg7Ka5T1//zCwnSYw/+kX/Q6ST2AJ2QQyT4rCg2HIyg77gqa/7ytQkBuA8shj
         awhMUPcAhZu+MvBND8COMPT6u+1fqj2duc89O/sNiC7RJ8khXqynAOBu1jOMZJwgLzId
         pEulOCn2yPqTON+ODxrzYTP13Snp3hVVWCLtmomQRWfHR0yAbjxneMRy1z1g1/fr/gtE
         yjjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=h9Np+N/jnv+SaunZ4Qzp2gD2QknFbGsdEeKP5pH/MNs=;
        b=i6TVP136kVJvQxf6dx3fRbnlWY3Haq9HIR2gPP04Ge795Etr0BlQSE32lcOg+UHHWw
         DT42HwRQr4NXSlWgP8u1v1tgYYsaRzSolxr1NQildhIRyTVeaIHPEh9g2YD+LDtMGu0s
         6/VsMcvcPYva32FEiBAbB/L4r6NSwiG45tOusRi6KiT89JMLjbQGJ23HG33gkhIitkSe
         yID3FGwOJHqr7IynrfWYM1o2+5DfBvTB6PQYZZQ6O18SvH1kBp/BVHVByM+V1kxfbfHw
         44HXAvDB2T32fsm8YGhqxzafu2k6eEF9VySezGVeC42Xym1C1mdjNbjxRZZAc7idcc7q
         MABg==
X-Gm-Message-State: ANhLgQ3QU2xImVSBxnjRiDWXtwMssHI9FxoEcGwkX29D26zXhDbEzaCn
        yRZPaTWLLgooJvUCFcuHYuk=
X-Google-Smtp-Source: ADFU+vvyNXnWrvCL+9n2rHlpowRbPitq4eWcQo//8PEWZiBpq6/KhVBOM8BUmyt8aTIlLrtjKSMjxw==
X-Received: by 2002:a17:90a:5d16:: with SMTP id s22mr2163862pji.184.1585258129014;
        Thu, 26 Mar 2020 14:28:49 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3c2a:73a9:c2cf:7f45])
        by smtp.gmail.com with ESMTPSA id a24sm2445523pfl.115.2020.03.26.14.28.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2020 14:28:48 -0700 (PDT)
Date:   Thu, 26 Mar 2020 14:28:46 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Rajat Jain <rajatja@google.com>
Cc:     dtor@google.com, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Enrico Weigelt <info@metux.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Allison Randal <allison@lohutok.net>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Stephen Boyd <swboyd@chromium.org>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, furquan@google.com,
        dlaurie@google.com, bleung@google.com, zentaro@google.com,
        dbehr@google.com, rajatxjain@gmail.com
Subject: Re: [PATCH v2 5/5] dt-bindings: input/atkbd.txt: Add binding info
 for "keymap" property
Message-ID: <20200326212846.GK75430@dtor-ws>
References: <20200324123518.239768-1-rajatja@google.com>
 <20200324123518.239768-5-rajatja@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200324123518.239768-5-rajatja@google.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Mar 24, 2020 at 05:35:18AM -0700, Rajat Jain wrote:
> Add the info for keymap property that allows firmware to specify the
> mapping from physical code to linux keycode, that the kernel should use.
> 
> Signed-off-by: Rajat Jain <rajatja@google.com>
> ---
> v2: Remove the Change-Id from the commit log
> 
>  .../devicetree/bindings/input/atkbd.txt       | 27 ++++++++++++++++++-
>  1 file changed, 26 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/input/atkbd.txt b/Documentation/devicetree/bindings/input/atkbd.txt
> index 816653eb8e98d..0a0037d70adc8 100644
> --- a/Documentation/devicetree/bindings/input/atkbd.txt
> +++ b/Documentation/devicetree/bindings/input/atkbd.txt
> @@ -6,9 +6,15 @@ Optional properties:
>  			An ordered array of the physical codes for the function
>  			row keys. Arranged in order from left to right.
>  
> +	keymap:

This map will contain Linux specific values, so I would say
"linux,keymap". Rob?

> +			An array of the u32 entries to specify mapping from the
> +			keyboard physcial codes to linux keycodes. The top 16
> +			bits of each entry are the physical code, and bottom
> +			16 bits are the	linux keycode.
> +
>  Example:
>  
> -	This is a sample ACPI _DSD node describing the property:
> +	This is a sample ACPI _DSD node describing the properties:
>  
>          Name (_DSD, Package () {
>                  ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
> @@ -29,6 +35,25 @@ Example:
>                                          0xAE, /* T12 VOL_DOWN */
>                                          0xB0, /* T13 VOL_UP */
>                                  }
> +                        },
> +                        Package () { "keymap",
> +                                Package () {
> +                                        0xEA009E, /* EA -> KEY_BACK */
> +                                        0xE700AD, /* E7 -> KEY_REFRESH */
> +                                        0x910174, /* 91 -> KEY_FULL_SCREEN */
> +                                        0x920078, /* 92 -> KEY_SCALE */
> +                                        0x930280, /* 93 -> 0x280 */
> +                                        0x9400E0, /* 94 -> KEY_BRIGHTNESS_DOWN*/
> +                                        0x9500E1, /* 95 -> KEY_BRIGHTNESS_UP */
> +                                        0x960279, /* 96 -> KEY_PRIVACY_SCRN_TOGGLE*/
> +                                        0x9700E5, /* 97 -> KEY_KBDILLUMDOWN */
> +                                        0x9800E6, /* 98 -> KEY_KBDILLUMUP */
> +                                        0xA00071, /* A0 -> KEY_MUTE */
> +                                        0xAE0072, /* AE -> KEY_VOLUMEDOWN */
> +                                        0xB00073, /* B0 -> KEY_VOLUMEUP */
> +					...
> +					<snip other entries>
> +                                }
>                          }
>                  }
>          })
> -- 
> 2.25.1.696.g5e7596f4ac-goog
> 

Thanks.

-- 
Dmitry
