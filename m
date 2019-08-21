Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 61E0897F41
	for <lists+linux-input@lfdr.de>; Wed, 21 Aug 2019 17:44:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727568AbfHUPoe (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 21 Aug 2019 11:44:34 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:36992 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727553AbfHUPoe (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 21 Aug 2019 11:44:34 -0400
Received: by mail-pg1-f195.google.com with SMTP id d1so1535838pgp.4;
        Wed, 21 Aug 2019 08:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=rpekFqyZj3l++WQEb7CaA2EK93VudltOovvbUJ4E8Hk=;
        b=LP6mKtvxisckWHY8p7xJJz6IneM36EXGa2X4VysZ5bTanqqYgZpoMXx3/dfy8rAain
         nEXI1vDMvVFN16Hz2tdkHpicjVyCm+Fk5ax3ZnOup3blLuJcxjuB7gbLPtNHj5w2YjQK
         eLgaTDg6EjEj0V1PLT7XDxkCmoqNhKJ2WkWuikfLbe1/g+/kF3TfXh2Ht0mc8sNo/LKR
         cOMVAQz0tfbE2EewNkpAAJUgIzVFnqeYAEPEM4YhmY3aIa+tPmZNkKLhfkrpF168YMpi
         hXQaMj2Lz8DATsJqgB4LQ2zw8Ug+i4CZA8Rkrji2TITrCmJ4qYRGjuFe8z7pwPJp2IeD
         U7OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=rpekFqyZj3l++WQEb7CaA2EK93VudltOovvbUJ4E8Hk=;
        b=Fas90mKMlHwK9BqxfLjZuvm6FKa3Cm5qs1h504g5Igil6NAwob4p9FDp5yHbZqv3LI
         R1LmILQifIrraV7AvN62owtBPMeM18xWQ0Y7QfTLG8ebRIifyQTKLHZNUO7u20L0/WNE
         gGb9qqxcsT1J5ucks6Ra+Ls3h1gOokDmcXDEodFgw4Gb6aWqsohJOl7jj6ZbwMOz9WNB
         dA+wePpMryeSlOkLiSRFkTkv526NnqO/0c9C04N6GBJe4whDiin4PrvpGAKpqsBlUb5J
         vGwxVGfflyhDXi//9XPBCWfPfntMjGoAisOWDJOHhVLjYb0GG/xf+BNDqjKfChHEKlvm
         4lVA==
X-Gm-Message-State: APjAAAUxbeGms+qlFh8bVBTa3KgGRXx1Fu02WXtTMi8H7oMndBCTyGes
        gdogytEIYZrtM8PClfM7hTE=
X-Google-Smtp-Source: APXvYqz1i4DT2loqS6ywADscFmkdWQr9CzJdfaAjI7m57Ak+9WrzsLRlfByHabNBrs3E+jHne9VPnQ==
X-Received: by 2002:a62:76d5:: with SMTP id r204mr35736589pfc.252.1566402273255;
        Wed, 21 Aug 2019 08:44:33 -0700 (PDT)
Received: from localhost (wsip-184-188-36-2.sd.sd.cox.net. [184.188.36.2])
        by smtp.gmail.com with ESMTPSA id d18sm20130408pgi.40.2019.08.21.08.44.32
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Aug 2019 08:44:32 -0700 (PDT)
Date:   Tue, 20 Aug 2019 22:09:25 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Thomas =?iso-8859-1?Q?Hellstr=F6m_=28VMware=29?= 
        <thomas_os@shipmail.org>
Cc:     linux-kernel@vger.kernel.org, pv-drivers@vmware.com,
        Thomas Hellstrom <thellstrom@vmware.com>,
        linux-input@vger.kernel.org, Doug Covelli <dcovelli@vmware.com>
Subject: Re: [PATCH 4/4] input/vmmouse: Update the backdoor call with support
 for new instructions
Message-ID: <20190821050925.GA566@penguin>
References: <20190818143316.4906-1-thomas_os@shipmail.org>
 <20190818143316.4906-5-thomas_os@shipmail.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190818143316.4906-5-thomas_os@shipmail.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, Aug 18, 2019 at 04:33:16PM +0200, Thomas Hellström (VMware) wrote:
> From: Thomas Hellstrom <thellstrom@vmware.com>
> 
> Use the definition provided by include/asm/vmware.h
> 
> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Cc: <linux-input@vger.kernel.org>
> Signed-off-by: Thomas Hellstrom <thellstrom@vmware.com>
> Reviewed-by: Doug Covelli <dcovelli@vmware.com>

Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Please feel free to merge with the rest of the patches introducing
VMWARE_HYPERCALL.

> ---
>  drivers/input/mouse/vmmouse.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/input/mouse/vmmouse.c b/drivers/input/mouse/vmmouse.c
> index 871e5b5ab129..0c7707c7bede 100644
> --- a/drivers/input/mouse/vmmouse.c
> +++ b/drivers/input/mouse/vmmouse.c
> @@ -16,6 +16,7 @@
>  #include <linux/slab.h>
>  #include <linux/module.h>
>  #include <asm/hypervisor.h>
> +#include <asm/vmware.h>
>  
>  #include "psmouse.h"
>  #include "vmmouse.h"
> @@ -84,7 +85,7 @@ struct vmmouse_data {
>  #define VMMOUSE_CMD(cmd, in1, out1, out2, out3, out4)	\
>  ({							\
>  	unsigned long __dummy1, __dummy2;		\
> -	__asm__ __volatile__ ("inl %%dx" :		\
> +	__asm__ __volatile__ (VMWARE_HYPERCALL :	\
>  		"=a"(out1),				\
>  		"=b"(out2),				\
>  		"=c"(out3),				\
> -- 
> 2.20.1
> 

Thanks.

-- 
Dmitry
