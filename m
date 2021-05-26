Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1821D3920B4
	for <lists+linux-input@lfdr.de>; Wed, 26 May 2021 21:16:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233167AbhEZTSA (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 26 May 2021 15:18:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232696AbhEZTR6 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 26 May 2021 15:17:58 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B5A6C061574;
        Wed, 26 May 2021 12:16:25 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id pi6-20020a17090b1e46b029015cec51d7cdso918158pjb.5;
        Wed, 26 May 2021 12:16:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=lmnkLjzK/JbRrZ85h2/Oaot1KsIjWqq+/RKIMUx5aaU=;
        b=EwaEhuNvSUrjiDB+n5d5E0luNIoihEH7O1+n2FYb9WywNMGPvzNdtfTMyEAtG2a3ZB
         uCXKKqLvJ6P+nxTc7p9/BRggRgeaFrCgCM4XOl5Aos8F9i1Omd+5PtNfq1AX0efkvfDn
         fCrZ2IjAY0zfm8Yf+XOlqmRczrtfMMWMuJNQ4aWcRxJBc3bhmdZvaWgFGIJpEidnoZX3
         3E7fWTq2RpNw0NCC0Ve4P07Y90vsP9YUNdWTIER0Gt/1Nv6apraPx711kBSJ+mNlNK+k
         ihO/TmO4x1lGzjCe3L0rvdYDMU+6d4okyIjKH7ytG8i0telgv4LcGG9QYZGHZa1JsYYZ
         h5ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=lmnkLjzK/JbRrZ85h2/Oaot1KsIjWqq+/RKIMUx5aaU=;
        b=dOWOIlQQHwlh0I/RNQu8x/Ouhq2DUlmQxIGOY58/bsTkPiJR6TUgLwYM0NFGddCIoJ
         VCnExNUjnsUWBt3dFQm2zMwZqsCyqXgHYrSnN0BzL7uXz5nUsgb6GDzvmtePBNrPQq5f
         xi0K5QzmigKeyr2zl3iEFeseZw+OE1dbpYrzz9h5RKYfrXfLIKhcZObJb0Gh7PeYcJjv
         Ft7eZmre9gUh5HDegrE8UMusAQvYe2I6gnACnNdRm+svQZ1pWTgxuXasGsbhGUd7itcl
         jifdXQsDZrDy6xTQnOFfFuvsTArYbL47WMQ6FtqDZbnkREEtzZSZkG1hf9hWW5UKvSXZ
         1p/w==
X-Gm-Message-State: AOAM5313mDGFQehdZij+XIwKy6J22FWNXcY8gySbvFVP35NiRlW/5z9A
        bKIoUrOptT11BFKPrKCDm/BpecYY24s=
X-Google-Smtp-Source: ABdhPJzluiegAaZdsK1CnyKwh5S3OzYmcO6JztdsGAouGGDaemY2eupq30RWhUFmOTdmGZQsvP4KTg==
X-Received: by 2002:a17:90a:17e7:: with SMTP id q94mr36946273pja.117.1622056584534;
        Wed, 26 May 2021 12:16:24 -0700 (PDT)
Received: from ?IPv6:2001:df0:0:200c:c104:b5ae:a3c1:6470? ([2001:df0:0:200c:c104:b5ae:a3c1:6470])
        by smtp.gmail.com with ESMTPSA id y13sm128878pgp.16.2021.05.26.12.16.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 May 2021 12:16:23 -0700 (PDT)
Subject: Re: [PATCH] MOUSE_ATARI: fix kconfig unmet dependency warning
To:     Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
Cc:     Michael Schmitz <schmitz@debian.org>,
        Roman Zippel <zippel@linux-m68k.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org
References: <20210526070345.31114-1-rdunlap@infradead.org>
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <662f3b08-0f28-eda8-82a3-7d29b6474a47@gmail.com>
Date:   Thu, 27 May 2021 07:16:18 +1200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210526070345.31114-1-rdunlap@infradead.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Randy,

On 26/05/21 7:03 pm, Randy Dunlap wrote:
> MOUSE_ATARI should depend on INPUT_KEYBOARD since ATARI_KBD_CORE
> depends on INPUT_KEYBOARD. This prevents MOUSE_ATARI from
> selecting ATARI_KBD_CORE when INPUT_KEYBOARD is not set/enabled.

Right you are! Thanks for spotting this.

Reviewed-by: Michael Schmitz <schmitzmic@gmail.com>

>
> WARNING: unmet direct dependencies detected for ATARI_KBD_CORE
>    Depends on [n]: !UML && INPUT [=y] && INPUT_KEYBOARD [=n]
>    Selected by [y]:
>    - MOUSE_ATARI [=y] && !UML && INPUT [=y] && INPUT_MOUSE [=y] && ATARI [=y]
>
> Fixes: c04cb856e20a ("m68k: Atari keyboard and mouse support.")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Michael Schmitz <schmitz@debian.org>
> Cc: Roman Zippel <zippel@linux-m68k.org>
> Cc: Geert Uytterhoeven <geert@linux-m68k.org>
> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Cc: linux-input@vger.kernel.org
> ---
>   drivers/input/mouse/Kconfig |    1 +
>   1 file changed, 1 insertion(+)
>
> --- linux-next-20210525.orig/drivers/input/mouse/Kconfig
> +++ linux-next-20210525/drivers/input/mouse/Kconfig
> @@ -348,6 +348,7 @@ config MOUSE_AMIGA
>   
>   config MOUSE_ATARI
>   	tristate "Atari mouse"
> +	depends on INPUT_KEYBOARD
>   	depends on ATARI
>   	select ATARI_KBD_CORE
>   	help
