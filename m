Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 171A635AB47
	for <lists+linux-input@lfdr.de>; Sat, 10 Apr 2021 08:06:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229632AbhDJGGP (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 10 Apr 2021 02:06:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229464AbhDJGGP (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 10 Apr 2021 02:06:15 -0400
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82F44C061762
        for <linux-input@vger.kernel.org>; Fri,  9 Apr 2021 23:06:01 -0700 (PDT)
Received: by mail-pl1-x630.google.com with SMTP id 7so3761820plb.7
        for <linux-input@vger.kernel.org>; Fri, 09 Apr 2021 23:06:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=w+dLHAgU2lXnsJH4DWR1qpKhwzMcc53ahQ2VLtuoiwQ=;
        b=hluTgnCJX4E/49MSg5ZgPVCVdfJ94U04lSU4WoGtxTtJy+X5lVOGcNjZdLvqssaIhk
         OjxeKl5/tFFQ/kVReGpCxRPM1QBskrRe2OKLPKFoqufJuXNDvbR3OEjA7dmNZO03azhY
         61Gc8qYYFkktHKxJnkq4vDTdg9+HT4H/6oRcGEhqt6PtEoZKpoIQooJZkrPwX1goVSIw
         wzisW5pNOruA8cK9k7pCrOWpswspTDjSrTeQczCV2zTVtFEV+Q5pJNMS5b8NVh/T4m1f
         13O+YFLKbeGrhZbM8oVajryRPRUV58C7zxW6nldCXncUVCzPeF4lyrkAwBNgS6/yG6oe
         LXrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=w+dLHAgU2lXnsJH4DWR1qpKhwzMcc53ahQ2VLtuoiwQ=;
        b=RHNceeF44iY/IAaOE5eNMn77xlyr51jsJfyB3+6w8fFZlpVus38xuiTBaBe1ozjKd5
         Rd9w3PVTddfVzp7US6iSyBqNnZyYsmBOkaQzIPnX4iinLxYxlY4Z0k/mBXn0uJYlTdjK
         kEPDa9ARY0+YaculU1dBAc7Ree0XewpV0paYafmvAhVxfKFhOSoCKT28gngPRvYBspFb
         a5uMGfYhh0q6hijpO3eee1TkrxYewaYyht76yjEVKv+fV/wt9f5y2w+GDmJSh6TGF4sJ
         EUSBmApPUrSAT3Jm4vry7MAjKloZFWbbbAhvE3autVMjXtefQMGfUuA6WZlK7C4ukXQU
         oFVQ==
X-Gm-Message-State: AOAM531/cRpGpecWos3qwmg4itDuPoMwEUsy0r0eyRz30CDgXe1dPMFm
        XfMURHSHj4/grJYhNLrulRs=
X-Google-Smtp-Source: ABdhPJzowfg+tF8Wogi72KhzdB5ikHF90bCwnctiY74IJOfqmg7bBqY92db8V9f2+MVWXtf3pU2aTA==
X-Received: by 2002:a17:902:b091:b029:e6:f010:a2b6 with SMTP id p17-20020a170902b091b02900e6f010a2b6mr16051487plr.39.1618034761076;
        Fri, 09 Apr 2021 23:06:01 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:c9de:23b9:54df:4a55])
        by smtp.gmail.com with ESMTPSA id q13sm3954161pjj.17.2021.04.09.23.05.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Apr 2021 23:05:59 -0700 (PDT)
Date:   Fri, 9 Apr 2021 23:05:57 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-input@vger.kernel.org, Stephan Gerhold <stephan@gerhold.net>,
        Simon Shields <simon@lineageos.org>,
        Tomasz Figa <tfiga@chromium.org>
Subject: Re: [PATCH] Input: mms114 - Support MMS136
Message-ID: <YHFARSiYaaz/gaHE@google.com>
References: <20210404232619.3092682-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210404232619.3092682-1-linus.walleij@linaro.org>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Apr 05, 2021 at 01:26:19AM +0200, Linus Walleij wrote:
> The Melfas MMS136 is similar to the other MMS variants but
> has event packages of 6 bytes rather than 8 as the others.
> 
> The define is named FINGER_EVENT_SZ in the vendor drivers
> so I renamed it from MMS*_PACKET_SZ to MMS*_EVENT_SZ.
> 
> After this patch, the touchscreen on the Samsung GT-I8530
> works fine with PostmarketOS.
> 
> Cc: Stephan Gerhold <stephan@gerhold.net>
> Cc: Simon Shields <simon@lineageos.org>
> Cc: Tomasz Figa <tfiga@chromium.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Applied, thank you.

-- 
Dmitry
