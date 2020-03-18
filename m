Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3B7481894A4
	for <lists+linux-input@lfdr.de>; Wed, 18 Mar 2020 04:56:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726741AbgCRD4W (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 17 Mar 2020 23:56:22 -0400
Received: from mail-pj1-f67.google.com ([209.85.216.67]:56275 "EHLO
        mail-pj1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726682AbgCRD4W (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 17 Mar 2020 23:56:22 -0400
Received: by mail-pj1-f67.google.com with SMTP id mj6so709243pjb.5;
        Tue, 17 Mar 2020 20:56:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=NK4TxhSdGlT3RyaHAyy90ouA+8VP27Is6D344qdDM6M=;
        b=fHEbKwNz3+0Z69LwHhYaC5BP8pxiny2S+1++vGSKnpzwYoxOmol5HQ+XNoJUs5HbY9
         pjDpU8FZPYrT9aD5E0IxinhYB94tDvVX+wyNEazm80sPA7Y/KnVXzCAJJGFbP7aqONNv
         /iwTg1/0XkEgsAdkkKlcNVYs85fX3YMccgxTS4atRcoFivksqEsuTXILnw6PLdtJoEr+
         pLmQqwYl+72P5TW3tM0Q5TTwfg78OVz6bh6GXpzJKrPsoCzHS/s3PAuP/mFktgOt37zJ
         4c8HLd2tEYOQu9S0WaiQQJlNG/SWkp0X3Itp7J2KDxuAaJ8nM/T/JdUv86ak8dAHoux3
         NFRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=NK4TxhSdGlT3RyaHAyy90ouA+8VP27Is6D344qdDM6M=;
        b=N6V+T2KB0EmRXFNPfwtucLtfYnPo4c3Ov3MzmVB7FWri8ajgaXLjL6/XPzU11N6R/w
         pwl3QLloaj+3sgBFWDvIDn1H+l+1to3Yu0no77GCSRBTIPTyg3lDdNiPhZiCi++1GY4x
         6uqw26KPw8QwSYaQ41N3cLrjiWZOKaffbLE3+FzeX2AvvZPrhb1GAiO5kjLBw4vaUgDj
         v8OairmilR6IiKisjKJVpbMMskSw6+rHAPVwgWyycSWlpuZzk7/9eUF/LIuEBBzfch+3
         LAg4dqxQTdohVN194JzV+yDbO+VTni1dR3WafUy+f4wjoZLZvqpqXrtGLH4Qyg7m7moX
         EW0A==
X-Gm-Message-State: ANhLgQ3DkRZOVQq45NY9GCI7SOxyap1R9FG8iga3dxU3nN8r87lJx2Wd
        N1A30h58FS8aU5dYIcdia0SUFp1c
X-Google-Smtp-Source: ADFU+vvgXdabckkc06BWRVry2QDxUZPZhOjgCCY11Zh1afBfolpoS5R1lMm1NJt6yDOH6GRHQckQ+w==
X-Received: by 2002:a17:902:820b:: with SMTP id x11mr1899205pln.196.1584503781187;
        Tue, 17 Mar 2020 20:56:21 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3c2a:73a9:c2cf:7f45])
        by smtp.gmail.com with ESMTPSA id md20sm728809pjb.15.2020.03.17.20.56.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2020 20:56:20 -0700 (PDT)
Date:   Tue, 17 Mar 2020 20:56:18 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Rajat Jain <rajatja@google.com>
Cc:     Harry Cutts <hcutts@chromium.org>, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, dtor@google.com, rajatxjain@gmail.com
Subject: Re: [PATCH v3] Input: Allocate keycode for "Selective Screenshot" key
Message-ID: <20200318035618.GG192640@dtor-ws>
References: <20200313180333.75011-1-rajatja@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200313180333.75011-1-rajatja@google.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Mar 13, 2020 at 11:03:33AM -0700, Rajat Jain wrote:
> New chromeos keyboards have a "snip" key that is basically a selective
> screenshot (allows a user to select an area of screen to be copied).
> Allocate a keycode for it.
> 
> Signed-off-by: Rajat Jain <rajatja@google.com>

Applied, thank you.

> ---
> v3: Rename KEY_SNIP to KEY_SELECTIVE_SNAPSHOT
> V2: Drop patch [1/2] and instead rebase this on top of Linus' tree.
> 
>  include/uapi/linux/input-event-codes.h | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/include/uapi/linux/input-event-codes.h b/include/uapi/linux/input-event-codes.h
> index 0f1db1cccc3fd..c4dbe2ee9c098 100644
> --- a/include/uapi/linux/input-event-codes.h
> +++ b/include/uapi/linux/input-event-codes.h
> @@ -652,6 +652,8 @@
>  /* Electronic privacy screen control */
>  #define KEY_PRIVACY_SCREEN_TOGGLE	0x279
>  
> +#define KEY_SELECTIVE_SCREENSHOT	0x280
> +
>  /*
>   * Some keyboards have keys which do not have a defined meaning, these keys
>   * are intended to be programmed / bound to macros by the user. For most
> -- 
> 2.25.1.481.gfbce0eb801-goog
> 

-- 
Dmitry
