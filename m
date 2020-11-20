Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C89942BA0EE
	for <lists+linux-input@lfdr.de>; Fri, 20 Nov 2020 04:16:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726304AbgKTDQG (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 19 Nov 2020 22:16:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726224AbgKTDQF (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 19 Nov 2020 22:16:05 -0500
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3DB3C0613CF;
        Thu, 19 Nov 2020 19:16:05 -0800 (PST)
Received: by mail-pf1-x442.google.com with SMTP id b63so6492886pfg.12;
        Thu, 19 Nov 2020 19:16:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=pdfA6s3fWqziHuzU5IfqkqyEhz6AkKps0y0I1IerNn0=;
        b=LclX1MEVeijePZ/UsD8dxUqJwCGmUwvMbyC+sx+MGU+gkZCuWke2fgTtDEKxImNSUh
         gUrtg6EJx2O6zFLK3kgSQ1xa2WMVrQViex4aJGS3nIW7Xaiu+In08cgvnQz4oFZ1bI6D
         8GSiw40qVTCCPOJ8rsi/5MTjgCQbukGmmmCbECsX5SzDy5iJzVgBqoCHHZqG70PEObDb
         kkFJhqKGVccH8ka+k91qCFsOJwY9hsOJ4TU7vKgqFJBHV4rfxJNPqQ/QZ7mKUDZsQ5R9
         Aimq4Chv+qRhbPsK6/LsXb0LhU3R4Jbvjey76iWGIPbMAFInEBfndKjcPXoTo6boX6SH
         vUXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=pdfA6s3fWqziHuzU5IfqkqyEhz6AkKps0y0I1IerNn0=;
        b=C4Q0f8S6Lom9Y4YRhHktqUoQl7ztSzb2T8hjNHPna6olY+62PPuqy9FPV3NVS2dJHO
         6yf4pbyAYUMuAfMI6Gj/bT64PxhXSg24fy9D06vRej6YJcUtZ9geUkfLzEkH9AxI0GV+
         4iPMhcsQwVF6Xx+gkFVMTuhnfd7IE/xHe6GtMDsNC+v6qLnon/aHjTOboHJ3klYyUfFU
         +itff2PfZ8WNWQWOHN8IPYox+tUmSaBVMudnHU46HbjfkcK6+zeoRlTdCoIXi84gAwFj
         mebMqPsIp8SxpyzkrE3z75g6fMIpnTPWOj9FHg15z23Uo2JuEL3pqvqpgBHd89ENnrSZ
         0Clg==
X-Gm-Message-State: AOAM530pahuHTRO1MD86+Kr+DH24DRnkmbqa1N2IpSCsRYyCm20+HUo0
        HhlkUw7FRQYqjeAoGI55s48=
X-Google-Smtp-Source: ABdhPJxoqqPuVTYgw/px//azuwEk19il/8kgjxo7gQpMFiolckH0F1GeTxidu8VS9oQz05VHjpyMug==
X-Received: by 2002:a63:e757:: with SMTP id j23mr13812098pgk.301.1605842165218;
        Thu, 19 Nov 2020 19:16:05 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id n4sm1182181pgh.12.2020.11.19.19.16.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2020 19:16:04 -0800 (PST)
Date:   Thu, 19 Nov 2020 19:16:01 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     linux-kernel@vger.kernel.org,
        =?utf-8?Q?=C5=81ukasz?= Patron <priv.luk@gmail.com>,
        Cameron Gutman <aicommander@gmail.com>,
        Marko Friedemann <mfr@bmx-chemnitz.de>,
        Oliver Schwartz <Oliver.Schwartz@gmx.de>,
        Steven Toth <steve@toth.demon.co.uk>,
        Franz Lehner <franz@caos.at>,
        Ivan Hawkes <blackhawk@ivanhawkes.com>,
        Dominic Cerquetti <binary1230@yahoo.com>,
        Adam Buchbinder <adam.buchbinder@gmail.com>,
        Jan Kratochvil <honza@jikos.cz>,
        Christoph Fritz <chf.fritz@googlemail.com>,
        linux-input@vger.kernel.org
Subject: Re: [PATCH 01/15] input: joystick: xpad: Demote non-conformant
 kernel-doc header
Message-ID: <20201120031601.GL2034289@dtor-ws>
References: <20201112110204.2083435-1-lee.jones@linaro.org>
 <20201112110204.2083435-2-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201112110204.2083435-2-lee.jones@linaro.org>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Nov 12, 2020 at 11:01:50AM +0000, Lee Jones wrote:
> Fixes the following W=1 kernel build warning(s):
> 
>  drivers/input/joystick/xpad.c:1361: warning: Function parameter or member 'xpad' not described in 'xpad_send_led_command'
>  drivers/input/joystick/xpad.c:1361: warning: Function parameter or member 'command' not described in 'xpad_send_led_command'
> 
> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Cc: "Łukasz Patron" <priv.luk@gmail.com>
> Cc: Cameron Gutman <aicommander@gmail.com>
> Cc: Marko Friedemann <mfr@bmx-chemnitz.de>
> Cc: Oliver Schwartz <Oliver.Schwartz@gmx.de>
> Cc: Steven Toth <steve@toth.demon.co.uk>
> Cc: Franz Lehner <franz@caos.at>
> Cc: Ivan Hawkes <blackhawk@ivanhawkes.com>
> Cc: Dominic Cerquetti <binary1230@yahoo.com>
> Cc: Adam Buchbinder <adam.buchbinder@gmail.com>
> Cc: Jan Kratochvil <honza@jikos.cz>
> Cc: Christoph Fritz <chf.fritz@googlemail.com>
> Cc: linux-input@vger.kernel.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>

Applied, thank you.

-- 
Dmitry
