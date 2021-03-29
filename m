Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C87C934C36E
	for <lists+linux-input@lfdr.de>; Mon, 29 Mar 2021 07:59:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229555AbhC2F6p (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 29 Mar 2021 01:58:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229441AbhC2F6O (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 29 Mar 2021 01:58:14 -0400
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8FD4C061574;
        Sun, 28 Mar 2021 22:58:13 -0700 (PDT)
Received: by mail-pf1-x430.google.com with SMTP id j25so9194890pfe.2;
        Sun, 28 Mar 2021 22:58:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=m16upIkAqWTm1fGBTe51fjEDym/DB/Ins7P+Du5OzQo=;
        b=rcUwRWiCJg3j5nr6mqlkRCo5giHz/lZKL5ekbKmxmICeUTyZ/CpyjifTGTbQpiynNi
         bdZxB6O/MB581oNb3KEu5ZYE/aK+4Dcpd+lW5Ok6/C4HkICfXcr8DWp8KBVO0BU4aLDt
         4iyou29AnbbMpmZodzSf3RUd7BCm1WMTbsm24SbKsg+5cxXU+EzTSfCWlKmn6OHsv1uF
         FVqV8d25WjPGppfAhRJHlFHY4eGtDwXha8rqcRKd4EErUVL33tcO7nWCmMKOAE5v7Ti2
         dqmnInnPKetz3H9h7+zjKZdVydOBDX70szOhgUw0uyAC/h8a68XbtwlHanhEqcdaSZgH
         yTUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=m16upIkAqWTm1fGBTe51fjEDym/DB/Ins7P+Du5OzQo=;
        b=ZSwn8F7CWi9/96loAHaVewBO/90BeHuxRjnWaF1sdSfJog/pKAEYQR6ulkDykYPBkn
         OnqfW+DPVd8CLO2qkRQF1c660aHVtIkB6NuDwvnVmE2lD80GD5lM9wMaQivuwk3sbxi5
         //Y1nog7bUGLICoo/5Sbwu3LqMvVmOT+SnpuxrOoTyTGiUQl4qYeoJh70qZZaPMter7P
         xL7MK/kT2pWpxiMD9lPBzDooA+OQN2404MdbvtfI6glC4TwhLnYmZSSe8d241MCIyDO8
         MGe0QjSkDZOUlMbCCb4z7zlYDb84pFnHMPYubEwTrbxDpwniWEfg9SRc3ziPu+KSqvTj
         veng==
X-Gm-Message-State: AOAM5308KFQZ0DsMqrNvBRZkimdaeVqC1HnbDzNR8fZuRJv7JIkaajyr
        TWXgFAa230v5MBRmPQYeEQ8=
X-Google-Smtp-Source: ABdhPJwuyeYLtVyHrfeCqj2UD8vjkEck6ctH4VXhCL3Xu7pbSDwLqXKWWbK/Clbw+PCuR63jvBE4Qw==
X-Received: by 2002:aa7:8d92:0:b029:1ee:75d1:c87 with SMTP id i18-20020aa78d920000b02901ee75d10c87mr24282739pfr.9.1616997493013;
        Sun, 28 Mar 2021 22:58:13 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:edd5:9203:cce2:3bb6])
        by smtp.gmail.com with ESMTPSA id e21sm14125878pgv.74.2021.03.28.22.58.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Mar 2021 22:58:11 -0700 (PDT)
Date:   Sun, 28 Mar 2021 22:58:09 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Johnny Chuang <johnny.chuang.emc@gmail.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] Input: elants_i2c - drop zero-checking of
 ABS_MT_TOUCH_MAJOR resolution
Message-ID: <YGFscQAEx8TnDm6I@google.com>
References: <20210328235507.19240-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210328235507.19240-1-digetx@gmail.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Mar 29, 2021 at 02:55:07AM +0300, Dmitry Osipenko wrote:
> Drop unnecessary zero-checking of ABS_MT_TOUCH_MAJOR resolution since
> there is no difference between setting resolution to 0 vs not setting
> it at all. This change makes code cleaner a tad.
> 
> Suggested-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>

Applied, thank you.

-- 
Dmitry
