Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CCC8832DF19
	for <lists+linux-input@lfdr.de>; Fri,  5 Mar 2021 02:31:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229475AbhCEBbb (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 4 Mar 2021 20:31:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229458AbhCEBbb (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 4 Mar 2021 20:31:31 -0500
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5899DC061574;
        Thu,  4 Mar 2021 17:31:31 -0800 (PST)
Received: by mail-pj1-x1033.google.com with SMTP id o6so889978pjf.5;
        Thu, 04 Mar 2021 17:31:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=DwJtciANNwPk0E5tDr/R8fb7OoLygHui/jQ94U4mSCY=;
        b=NyKs9pY8tRtU0S5d+J5N2xDnGR1MJXSUfCfXBBZf5tFiHPh94pXpt26/36e+y2cnfV
         Pz0yqLGt1ZVKlChp3CMICRqwDIts0zGAlRdh0FVW/qfsdEQP5HWxJGqBhcKW/9a/5s4f
         qeWY+tA52ayoVEDXPKgwNh9MGT++b8gYEw0thED6BKCpmmunMPPCqWK6lOso42gn1NWm
         F7OqMn2+voQ9HjAdb5wmLPzTi9VB8RXP3DaukZYPDxaacg/0HIpUyWLfsTp1coANS2ds
         pPcbvP0rXeagzQVE4hXafMfAJatdrp76XaZRTQHgdhRzPwiv48t9tY+nbHml6kAcVKSW
         8rFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=DwJtciANNwPk0E5tDr/R8fb7OoLygHui/jQ94U4mSCY=;
        b=nVd3BZPz+XaVb+qCzLPzO4wYAOrUkrU0ZXyIv8ti7U/RJo/7p0ePUOlnaR/rYhfSBU
         SbJBgeVa8f5clbReKP15WLwFglPT/jg4REJWMXIhjIOgxS66PKihisluxiXWchHsQZtF
         gtc1F4m3qBtIrVejTnnDeZvehYUT5gxl+qdh6DAwgv4z5/bfRVNXFf+wVgPJM72wig33
         wzTU5OTOaklgsxKS8jRFRXJJXjpTiBD41JR3wZWRDwvxq1EULrNcx/DnbXsOLMqjcfpP
         Y4HRBjU4+6Xe+hVMiEqOaOzAdC69fxsHGslkKr9Qhns9TvtIGuTPLz5jA/kS1GnlBy7U
         aQ8w==
X-Gm-Message-State: AOAM533YQF7QjHS3D7NxfzLg2l6e9ih8DEcI6mKJulKiMBbmB4I9rTT9
        Vwx3FORGgujmRK2dblmh9/3lmI4LCH0=
X-Google-Smtp-Source: ABdhPJw9PTH9Bu2jaNbUURd4tFTjAlpNMP045iuj33mpZ0h7uVgDCIyx9BFqfGkIyIQ8xdGQgtL3Lw==
X-Received: by 2002:a17:90a:77c8:: with SMTP id e8mr7290243pjs.48.1614907890826;
        Thu, 04 Mar 2021 17:31:30 -0800 (PST)
Received: from google.com ([2620:15c:202:201:c91f:96a9:615f:28ed])
        by smtp.gmail.com with ESMTPSA id u20sm551295pfm.146.2021.03.04.17.31.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Mar 2021 17:31:29 -0800 (PST)
Date:   Thu, 4 Mar 2021 17:31:27 -0800
From:   'Dmitry Torokhov' <dmitry.torokhov@gmail.com>
To:     jingle <jingle.wu@emc.com.tw>
Cc:     'linux-kernel' <linux-kernel@vger.kernel.org>,
        'linux-input' <linux-input@vger.kernel.org>,
        'phoenix' <phoenix@emc.com.tw>,
        "'dave.wang'" <dave.wang@emc.com.tw>,
        "'josh.chen'" <josh.chen@emc.com.tw>
Subject: Re: [PATCH] Input: elan_i2c - Reduce the resume time for new dev ices
Message-ID: <YEGJ7z479pqyBW1w@google.com>
References: <20210226073537.4926-1-jingle.wu@emc.com.tw>
 <YDx8M4Rhdi8hW4EO@google.com>
 <1614647097.9201.jingle.wu@emc.com.tw>
 <YEGBeWHRfL4gN9pX@google.com>
 <004f01d7115e$3ba005e0$b2e011a0$@emc.com.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <004f01d7115e$3ba005e0$b2e011a0$@emc.com.tw>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Jingle,

On Fri, Mar 05, 2021 at 09:24:05AM +0800, jingle wrote:
> HI Dmitry:
> 
> In this case (in the newer parts behavior regarding need to reset after
> powering them on), it is consistent with the original driver behavior with
> any new or old device
> (be called data->ops->initialize(client) : usleep(100) , etc.. , because
> this times "data->quirks" is equal 0 at probe state.) 

You misunderstood my question. I was asking what specifically, if
anything, was changed in the firmware to allow skipping reset/sleep part
of device initialization on newer parts during resume process. Because
of there were no specific changes I would say let's not do a quirk and
change the driver to skip reset on resume.

Thanks.

-- 
Dmitry
