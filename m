Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D62D28572D
	for <lists+linux-input@lfdr.de>; Wed,  7 Oct 2020 05:42:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726791AbgJGDme (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 6 Oct 2020 23:42:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725970AbgJGDme (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 6 Oct 2020 23:42:34 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9210FC061755
        for <linux-input@vger.kernel.org>; Tue,  6 Oct 2020 20:42:34 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id d6so546588pfn.9
        for <linux-input@vger.kernel.org>; Tue, 06 Oct 2020 20:42:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=rtxVjoZawxryW1vN7+l7Inp7Sk8WtW9ALIFgPyYuzn8=;
        b=Dd+v7xqBYiq2r3wvl2qY8GQuHCQQPAQQ3eVZMS/1tdvvFNLuz6ZS64d7X3I6JMbRRp
         BMk5pAbqJAfKg7nEHwL1Uir3ib9MT4DOjFXyUwAIUsFUfRo/OhS/3Uy2KZDTeKOq7QUK
         YqVF9P1TR5mbLrR2RY3ONwXo0MyGiDKkLcEONyHK1Co8uK6bDM4k8GkCrDEnp/V3mF78
         9xmpFHWu7GVJrZMrKDaF5XzqWk3QurJcstAyjohvxZIgfdfeG1+GaUADUtrrz6u5uuXN
         soFKqqW+4rmviAZw/HfQ1UUkl0B5apBNpDZ2RVLov8hTkJrfYoMHsshdToeN7YVkG00d
         r58A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=rtxVjoZawxryW1vN7+l7Inp7Sk8WtW9ALIFgPyYuzn8=;
        b=Ct5wD9yHwFQG+Z36w3OobGlH4QSnQssoI3kBOUX/juMeOVb3lwEEjXhimbLMHJ5L1R
         NSN3nPnuMd3vAFcxhkzgLq5HO4MW0XdgRvPVcavGRTyUiOFcMAGrNRN6FxOUqt6PSKjk
         kU8qUAo3ccQuejkjAo2Lclh0dYQDJDw9mBA7NX4uk3Zie5pCQSm8TIvKb2Jor5sIrWx/
         9jEt+G4/I+32CEoPIgvutQTPzzjP9hSFrbkwqJA2hFU72hCaTMVW6bVt1XfN2IaKewvZ
         hq83LWSGAIVTkqb7MnE2d62rFhVqwOSbNKpAhtk5dzMrHqdri6z4fXZob+UcfPWG/gOS
         JKew==
X-Gm-Message-State: AOAM533/aYpDzDchSYYse+USYRs0QJKkW0G5UxdBFyitpYkT2yHTfdQH
        80G9NvgRZ/ngohnPM9h4XJE=
X-Google-Smtp-Source: ABdhPJy/S8RlwF2ph33ACm3Ba59FFQ+iLcRaH5mvo54uvYMMKR3kL9RqXZzz4Hh/2OTyaOBjOtKuIA==
X-Received: by 2002:a62:1856:0:b029:155:1718:91a3 with SMTP id 83-20020a6218560000b0290155171891a3mr1019044pfy.66.1602042154016;
        Tue, 06 Oct 2020 20:42:34 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id j26sm764401pfa.160.2020.10.06.20.42.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2020 20:42:33 -0700 (PDT)
Date:   Tue, 6 Oct 2020 20:42:31 -0700
From:   dmitry.torokhov@gmail.com
To:     mika.penttila@nextfour.com
Cc:     linux-input@vger.kernel.org
Subject: Re: [PATCH] Add MAINTAINERS entry for SiS i2c touch input driver.
Message-ID: <20201007034231.GU1009802@dtor-ws>
References: <20201007025623.47439-1-mika.penttila@nextfour.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201007025623.47439-1-mika.penttila@nextfour.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Oct 07, 2020 at 05:56:23AM +0300, mika.penttila@nextfour.com wrote:
> From: Mika Penttilä <mika.penttila@nextfour.com>
> 

Still need signed-off-by please.

> ---
>  MAINTAINERS | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 9a54806ebf02..b13c539783c9 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -15913,6 +15913,13 @@ F:	Documentation/fb/sisfb.rst
>  F:	drivers/video/fbdev/sis/
>  F:	include/video/sisfb.h
>  
> +SIS I2C TOUCHSCREEN DRIVER
> +M:      Mika Penttilä <mika.penttila@nextfour.com>
> +L:      linux-input@vger.kernel.org
> +S:      Maintained
> +F:      Documentation/devicetree/bindings/input/touchscreen/sis_i2c.txt
> +F:      drivers/input/touchscreen/sis_i2c.c
> +
>  SIS USB2VGA DRIVER
>  M:	Thomas Winischhofer <thomas@winischhofer.net>
>  S:	Maintained
> -- 
> 2.17.1
> 

-- 
Dmitry
