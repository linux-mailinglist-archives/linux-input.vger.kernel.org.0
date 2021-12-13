Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2748C472041
	for <lists+linux-input@lfdr.de>; Mon, 13 Dec 2021 06:11:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231838AbhLMFLw (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 13 Dec 2021 00:11:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231801AbhLMFLv (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 13 Dec 2021 00:11:51 -0500
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 922D8C06173F
        for <linux-input@vger.kernel.org>; Sun, 12 Dec 2021 21:11:51 -0800 (PST)
Received: by mail-pj1-x102c.google.com with SMTP id h24so11044737pjq.2
        for <linux-input@vger.kernel.org>; Sun, 12 Dec 2021 21:11:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=OsuMMOKiwOG1bcXVwkAIpQ7WcikoGfDebEmA33Uuo7w=;
        b=bONmB/nM735YddXuFVs8omcuJtTMgZLEcBQl1PLJvPu7M82iI9C//kDaMuXQwmnNny
         oKT3gUuuZHTPuun8zRYhJzyY4IJGBJIg2YOuZiKdjzbpOuby2Lwtcb61x4gvsiff0AX+
         gZ7CpH5RHqctftclJLQE6R5uOIIPQjUvwjXzpbIHjKnawljE2zUjs3b1/8kpBFQv6lp5
         A6Y5jPU7SCcj5AffIzFxeFhiciiWyTDlvvR5Z9e7ShpQjj64sDo+mfrsS5Dgx5WRnJTM
         yxsNgwtau9E5ZMdU17bMgsVxUSUmR3s2dsqw/gnCVKQNbO9Yg9+CSxfyWFkXri6HTXIG
         uZGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=OsuMMOKiwOG1bcXVwkAIpQ7WcikoGfDebEmA33Uuo7w=;
        b=7uBVS72AbOy2/gL7O1pRClQDSyBhPOIvobL2+YwRMe17h+89tWTRe8kC+E5C4iaEjl
         N+eF8+CL/UfLMWtJJSG1vezD7kIhUosmEg/PZKL+ST7h2kGQc8bJ9ZMYYdSnN7pjNVVb
         rBIdrtZagGqHLGunYRoEpThKIbBb6o31upHGf3Dj4cv4YnfKPmB+eVHKe+qZFS3q8OAR
         n9Po2dx54DLRc2oP9Vd8kzh3bYuSMHtAV5lPSQGu1RkRDBARTBtglnqcZ/V9Ca1ZrpQf
         nfSTR5GEC0vzGozI0FpIJdBAKCPafi15L4gNvg95LqgKZVUETzJI6gJkX/qNlAfOqkSr
         bFOg==
X-Gm-Message-State: AOAM5321PvTep4hkqHd4MUuw8aoq9weEcC3LzqFSEtRAGVtq3al5CGVS
        Az10iOuSZqO0BkLS2/7LUMPWHtwMMJU=
X-Google-Smtp-Source: ABdhPJxdpevOWhZiI0TWKTCrtXbyBhdocGO2WyTgBheGldVw2HwyJ7hnrfwsl/D9OwFVkI7siVkfZA==
X-Received: by 2002:a17:902:db01:b0:141:ea12:2176 with SMTP id m1-20020a170902db0100b00141ea122176mr94278690plx.44.1639372311017;
        Sun, 12 Dec 2021 21:11:51 -0800 (PST)
Received: from google.com ([2620:15c:202:201:e537:8856:7d40:7c6])
        by smtp.gmail.com with ESMTPSA id ne22sm5527696pjb.18.2021.12.12.21.11.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Dec 2021 21:11:50 -0800 (PST)
Date:   Sun, 12 Dec 2021 21:11:48 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     linux-input@vger.kernel.org
Subject: Re: [PATCH resend 2/2] Input: silead - Add pen support
Message-ID: <YbbWFOFyjYJi46W8@google.com>
References: <20211122220637.11386-1-hdegoede@redhat.com>
 <20211122220637.11386-3-hdegoede@redhat.com>
 <YbQWDAPw/zpO0y9x@google.com>
 <5e2253c6-0d1f-51ec-9817-0c83fff2724e@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5e2253c6-0d1f-51ec-9817-0c83fff2724e@redhat.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, Dec 12, 2021 at 01:36:04PM +0100, Hans de Goede wrote:
> Hi Dmitry,
> 
> On 12/11/21 04:07, Dmitry Torokhov wrote:
> > Hi Hans,
> > 
> > On Mon, Nov 22, 2021 at 11:06:37PM +0100, Hans de Goede wrote:
> >> +	input_set_capability(data->pen_input, EV_KEY, BTN_TOUCH);
> >> +	input_set_capability(data->pen_input, EV_KEY, BTN_TOOL_PEN);
> >> +	/*
> >> +	 * We never report BTN_STYLUS but userspace want to see this in order
> >> +	 * for the device to be recognized as a pen / drawing-tablet.
> >> +	 */
> > 
> > What userspace is that? I see that udev recognizes devices with either
> > stylus or pen  as tablets since at least 2015.
> > 
> > I am really hesitant adding synthetic capabilities that do not have real
> > events behind them.
> 
> You are completely right, I added this when GNOME3 / libinput would not
> recognize the pen (looking at other stylus/pen drivers) but IIRC things
> then still did not work and then I also added code to set the resolution.
> 
> I just tested without setting BTN_STYLUS and things still work fine,
> so the comment and the line setting BTN_STYLUS can be dropped while
> merging this. Let me know if you want me to do a new version with this
> dropped instead.

Adjusted and applied, thank you.

-- 
Dmitry
