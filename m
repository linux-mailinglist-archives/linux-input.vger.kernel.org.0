Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A37B61B8C7E
	for <lists+linux-input@lfdr.de>; Sun, 26 Apr 2020 07:15:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726147AbgDZFPH (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 26 Apr 2020 01:15:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725765AbgDZFPH (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 26 Apr 2020 01:15:07 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C0A8C061A0C;
        Sat, 25 Apr 2020 22:15:07 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id d17so6952408pgo.0;
        Sat, 25 Apr 2020 22:15:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=XOJcjfrq8PlvJKi2RARXxSUT8Eg/6eNdHVObTaCh5zQ=;
        b=fMcTYlFyK7b6ZjOmoiQsf+RAnmVgmNvP0zWBKga/lSm7kvv6YCYCsmg+6x3yrXvjfs
         u4+n1+VDz2kADvS8a9d4HWKlfbbTlossYSF0DzH+ZVYDRN1pevMkWATfMBBhsL23GJ/w
         TAjX2Qf84wrl7+d20n7brZ3VvATslAXhH9lPYoVmeFrm8ihnGouQE0o79aecGAEb5ZDT
         trJXP0HvLdZz/HdpQwzB0g8EWEjqcuP5ucHAjRZmU2PCrwuqEAStnlZMfbfBeVBsFdeV
         G6HfSv5B1EdliGloZSljZ6MJUkOp+d22R3NobhKTF5rCGHVgUOe6z/a6ckKaxHT92giI
         6BiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=XOJcjfrq8PlvJKi2RARXxSUT8Eg/6eNdHVObTaCh5zQ=;
        b=l4C29L15BkaL/xFup9UYrJrN7SfjVJcpvBaX7iwFVFj8BsArxoPoD+TArkIu8kwes9
         xXemz22RhyCjzjO+htSQKhpDSPVDovLdf7zq6nlBxZwe/iR6+I66V2BQZIzXKZOrb026
         H9YnhFBfx0/0KtJI8GDvreXeP5E0Iqzf37/StC1YwN6YEuo5rliwwwiaX4oD7R8uGKt7
         o3BHpMiqyNWyNaoUYrKXIUnYKPnIaMEDzsomw6l4V9/s6BmfJqzgu8wWgOtOsnry/vq6
         AwvjrUivNZtuhMzJ1Nhmn9o7V5EV3dot3OB/zWRKaQaeLGcXsu1m2dIfFjGG/2SUPrf8
         GnBQ==
X-Gm-Message-State: AGi0PubyuQBLbBwl2sDcOvE2vYHK5oHkfu/h6PmKGRitWfaR/ls4MILu
        vI7ywwLSqBFl/XxAya7T4dw=
X-Google-Smtp-Source: APiQypLX1YOLfQMq7hMaq0QwYhIpb709n7dJNyTnFjjCuHrjzYe+zui3s//OpfKi9/mZsWSvmKMhtg==
X-Received: by 2002:a63:1705:: with SMTP id x5mr17174547pgl.12.1587878106340;
        Sat, 25 Apr 2020 22:15:06 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3c2a:73a9:c2cf:7f45])
        by smtp.gmail.com with ESMTPSA id y3sm8650658pjb.41.2020.04.25.22.15.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2020 22:15:05 -0700 (PDT)
Date:   Sat, 25 Apr 2020 22:15:03 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Cc:     Dmitry Osipenko <digetx@gmail.com>,
        Henrik Rydberg <rydberg@bitmath.org>,
        James Chen <james.chen@emc.com.tw>,
        Johnny Chuang <johnny.chuang@emc.com.tw>,
        Rob Herring <robh+dt@kernel.org>,
        Scott Liu <scott.liu@emc.com.tw>,
        David Heidelberg <david@ixit.cz>, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 7/9] input: elants: support 0x66 reply opcode for
 reporting touches
Message-ID: <20200426051503.GS125362@dtor-ws>
References: <cover.1586784389.git.mirq-linux@rere.qmqm.pl>
 <f442f4e0e79d4acaff8481729bee73d33f77a9ef.1586784389.git.mirq-linux@rere.qmqm.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f442f4e0e79d4acaff8481729bee73d33f77a9ef.1586784389.git.mirq-linux@rere.qmqm.pl>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Apr 13, 2020 at 03:32:26PM +0200, Michał Mirosław wrote:
> From: Dmitry Osipenko <digetx@gmail.com>
> 
> eKTF3624 touchscreen firmware uses two variants of the reply opcodes for
> reporting touch events: one is 0x63 (used by older firmware) and other is
> 0x66 (used by newer firmware). The 0x66 variant is equal to 0x63 of
> eKTH3500, while 0x63 needs small adjustment of the touch pressure value.
> 
> Nexus 7 tablet device has eKTF3624 touchscreen and it uses 0x66 opcode for
> reporting touch events, let's support it now. Other devices, eg. ASUS TF300T,
> use 0x63.
> 
> Note: CMD_HEADER_REK is used for replying to calibration requests, it has
> the same 0x66 opcode number which eKTF3624 uses for reporting touches.
> The calibration replies are handled separately from the the rest of the
> commands in the driver by entering into ELAN_WAIT_RECALIBRATION state
> and thus this change shouldn't change the old behavior.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> Tested-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
> Signed-off-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
> ---
>  drivers/input/touchscreen/elants_i2c.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/input/touchscreen/elants_i2c.c b/drivers/input/touchscreen/elants_i2c.c
> index 2b936e920874..9751139e8507 100644
> --- a/drivers/input/touchscreen/elants_i2c.c
> +++ b/drivers/input/touchscreen/elants_i2c.c
> @@ -60,6 +60,15 @@
>  #define QUEUE_HEADER_NORMAL	0X63
>  #define QUEUE_HEADER_WAIT	0x64
>  
> +/*
> + * Depending on firmware version, eKTF3624 touchscreens may utilize one of
> + * these opcodes for the touch events: 0x63 and 0x66. The 0x63 is used by
> + * older firmware version and differs from 0x66 such that touch pressure
> + * value needs to be adjusted.

Who is responsible for the adjustment? Where does it happen?

Thanks.

-- 
Dmitry
