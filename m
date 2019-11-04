Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1912BED9A5
	for <lists+linux-input@lfdr.de>; Mon,  4 Nov 2019 08:01:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726891AbfKDHBW (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 4 Nov 2019 02:01:22 -0500
Received: from mail-pl1-f195.google.com ([209.85.214.195]:39754 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726441AbfKDHBV (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 4 Nov 2019 02:01:21 -0500
Received: by mail-pl1-f195.google.com with SMTP id o9so496399plk.6;
        Sun, 03 Nov 2019 23:01:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=MdGvClfGYMjYf7AWUuIzpas/bROc46ssWraCc86Spts=;
        b=vIdf0sEESHkJQ4unYq3kz/Jz6j9gqcvRoxBbHNOTkk4ChW5hP6qwE7t03rPxjbSPYi
         A2Lq5EBOL9dG6u5i7XuoyPDxFDxAb5b3WgLw9ahfX6dpWbwwTFaRCsbvYPq7/nxalPTZ
         NPJZJmJG8EvZ7V9T05q600FZ3s+08gY1cdATIa0gaM5FdyR1HtdlMihMJgX4SM9DcUx+
         LrJx0lM028+3h7XwMDLdC50mE1xGZFrErMZdbWuRhDNmbgpUiq45rSTdNnwF/06SDvTW
         fBy66/8ZSXJqXTZkqzhHYGMw3M9JjnQSO2fKpkL/Gy2HWqIvsOg3GLYtdVuZZyXSZyhD
         N+Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=MdGvClfGYMjYf7AWUuIzpas/bROc46ssWraCc86Spts=;
        b=dUhW+IgjoZz6lpNUbUBk7rd8TmMyzsuFbshdiDV8cF2K2VzhM3Mktif1YcPdwvM2Gd
         ORj8Fy2KBvKqvH1uSPzvV63h7do3mAKnp/oD7VkosC3GyLHHf0wbhtEXqDKc6BEKhy5E
         aQL58DXgiWHxnbokYPHNM8EbbKvx3MzIQA+bnoC1YitXXGeVn5JnDlYjhrRa4JTbRQiD
         J1y9RcfEjxwkLUos307H4ZTM6PJ3H6GTMOgIxIsdpzLUFZpjledxSmK+2IOMRZRfHsNy
         ZgAJE/kxAFMwKYGR8GQ8daCGeYlnR6ADJA4/QYo5QXLn69J5dQA0IvceR9StWoWISbND
         20Aw==
X-Gm-Message-State: APjAAAVAy2esaIOrlKVNLAhZhDox6CFBVsD1KeDkxOCAKsHvSvqfmEer
        8UcaVzGQbc/RXzCMAs1xvmc=
X-Google-Smtp-Source: APXvYqzDZ9Urqmzvh8jEND5ZLFQ/l6lOhBWEpUROuKV1X2l2Zu90OSUTozvGDKRhIanhEavtVpZJbw==
X-Received: by 2002:a17:902:bb8b:: with SMTP id m11mr26145251pls.235.1572850880346;
        Sun, 03 Nov 2019 23:01:20 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id j4sm17448467pjf.25.2019.11.03.23.01.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Nov 2019 23:01:18 -0800 (PST)
Date:   Sun, 3 Nov 2019 23:01:16 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Sven Van Asbroeck <thesven73@gmail.com>
Cc:     Marek Vasut <marex@denx.de>, Adam Ford <aford173@gmail.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] Input: ili210x - add ILI2117 support
Message-ID: <20191104070116.GM57214@dtor-ws>
References: <20190302141704.32547-1-marex@denx.de>
 <20191101204801.16328-1-TheSven73@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191101204801.16328-1-TheSven73@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Sven,

On Fri, Nov 01, 2019 at 04:48:01PM -0400, Sven Van Asbroeck wrote:
> Dmitry / Marek,
> 
> There have been two attempts to add ILI2117 touch controller support.
> I was about to add a third, but luckily I checked the mailing list
> before writing any code :)
> 
> Adding this support would clearly be beneficial for the common good.
> What can we do to get this in motion again?
> 
> Last time I checked, Marek posted a patch which added the 2117, but Dmitry
> objected, because the code became too unwieldy. Dmitry then posted a cleanup
> patch, which did not work for Marek. So everything came to a halt.
> See:
> https://patchwork.kernel.org/patch/10836651/
> https://www.spinics.net/lists/linux-input/msg62670.html
> 
> Dmitry, would you perhaps be willing to accept Marek's patch, and perform the
> cleanup later?
> 
> Marek, would you perhaps be willing to invest some time to debug Dmitry's
> cleanup patch?
> 
> On my end, I've reviewed Dmitry's patch and it looks mostly ok. I saw one
> difference with ILI210X which could explain Marek's results, but I can't be
> sure - because I could not locate the 210X's register layout on the web.
> 
> In Dmitry's patch, we see:
> 
> 	touch = ili210x_report_events(priv, touchdata);
> 	if (touch || chip->continue_polling(touchdata))
> 		schedule_delayed_work(&priv->dwork,
> 				      msecs_to_jiffies(priv->poll_period));
> 
> but this is not exactly equivalent to the original. Because in the original,
> the 210X's decision to kick off delayed work is completely independent of
> the value of touch.

No, it is not independent really. Bits 0 and 1 in the first byte
correspond to touches with first and 2nd finger, so checking for touch
in addition to 0xf3 mask is not incorrect.

Can you please tell me what device you have? Do the patches work for
you?

Marek, sorry for letting the patches linger. Can you please tell me what
touch controller did you test with that failed for you? I think I see at
least one issue in ili251x_read_touch_data() - the check whether we
should read the second part of the packet should check if data[0] == 2,
not 0.

Thanks.

-- 
Dmitry
