Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3585C2AB148
	for <lists+linux-input@lfdr.de>; Mon,  9 Nov 2020 07:32:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729092AbgKIGcA (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 9 Nov 2020 01:32:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727077AbgKIGcA (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 9 Nov 2020 01:32:00 -0500
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4AFB7C0613CF;
        Sun,  8 Nov 2020 22:32:00 -0800 (PST)
Received: by mail-pl1-x641.google.com with SMTP id t22so4234675plr.9;
        Sun, 08 Nov 2020 22:32:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=xuzWHLs94F2nN7pVlXC/B/BcJrMLTyXxE+nZGgZZtfQ=;
        b=CvdknJITDXY27VEwg1gwFv5j6QFKJo5Nvm01EXM7VgUk2+oUIgTYKBoAsNfNydbU1d
         V/QAcePubUroaT1pGptVRY8TLXsJxHrCKA9331ptu3/uFKAYAoAqfBkmcPipbmesHJHT
         Uxz2MYgdehhsPhoLdS8cVo6uiQavB4TxEgD+T8hYH2PxRfsBkNmB9wrcl3b2ig3Ga/9a
         D6z8Wl4YcowizgoV3zyrI3NKgGW5XDyyPhXbNVNmFfu6MvC+LiknKA8CpRJjjOCcdpmW
         dVxMyRHh3WTkL3eeSez/ZSlZhq5Yf9TM3LGQZN9iSjA+bCNMQPSajOGyDFxHPNHIsnYE
         yU/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=xuzWHLs94F2nN7pVlXC/B/BcJrMLTyXxE+nZGgZZtfQ=;
        b=Ca6u0Vv1vOSnIYamSNl83tA+8jCiysFGjPOYQadn9BqN5EiW0CmtFgeB1QI58KwX1z
         UYPAmbQzqX1gvXNOuQ640RanR1wUyrNGcMGvOs0hlE4az7O6aOq/E49iGmwq0hLMkojA
         cppOFqzfmWYo3/g/Z5tsRGxh4QwZBzFVcnCvFY0LytwdeuwcromaLH0xB33EGK5BPiXa
         AyP/jmB3qVi1ag9rezHuhVKBPJvWlDWXSGEP2OZ2fqZh+N22DsojEE+6VwhVb/nNXq+0
         MMIXt5wIqLKLND/t/zCwpgGb3bIdzRtimrZMy8mx2jXnwJc9bwnCD34L46/5Af0Hmjrv
         A4sg==
X-Gm-Message-State: AOAM533/zRWSu9YxX2A/nzpeoxqHDqHYHGlpIzlqLGbb1adD908VNoaT
        WtZsBOTqRdJkXjbH8QgaJTY=
X-Google-Smtp-Source: ABdhPJwlYyeDghjZr+80osV8AQtbYeVyn6BwvvEjmVCLDsMpzp5Uu1RhlY2Q4qhtQ2ulppepNna/NQ==
X-Received: by 2002:a17:902:ee04:b029:d7:3d20:876 with SMTP id z4-20020a170902ee04b02900d73d200876mr811406plb.25.1604903519618;
        Sun, 08 Nov 2020 22:31:59 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id i7sm1110958pjj.20.2020.11.08.22.31.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2020 22:31:58 -0800 (PST)
Date:   Sun, 8 Nov 2020 22:31:56 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     linux-kernel@vger.kernel.org, Henrik Rydberg <rydberg@bitmath.org>,
        Dudley Du <dudl@cypress.com>,
        Daniel Kurtz <djkurtz@chromium.org>,
        Benson Leung <bleung@chromium.org>, linux-input@vger.kernel.org
Subject: Re: [PATCH 02/20] input: mouse: cyapa: Fix misnaming of
 'cyapa_i2c_write's 'reg' param
Message-ID: <20201109063156.GO1003057@dtor-ws>
References: <20201104162427.2984742-1-lee.jones@linaro.org>
 <20201104162427.2984742-3-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201104162427.2984742-3-lee.jones@linaro.org>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Nov 04, 2020 at 04:24:09PM +0000, Lee Jones wrote:
> Fixes the following W=1 kernel build warning(s):
> 
>  drivers/input/mouse/cyapa.c:130: warning: Function parameter or member 'reg' not described in 'cyapa_i2c_write'
>  drivers/input/mouse/cyapa.c:130: warning: Excess function parameter 'ret' description in 'cyapa_i2c_write'
> 
> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Cc: Henrik Rydberg <rydberg@bitmath.org>
> Cc: Dudley Du <dudl@cypress.com>
> Cc: Daniel Kurtz <djkurtz@chromium.org>
> Cc: Benson Leung <bleung@chromium.org>
> Cc: linux-input@vger.kernel.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>

Applied, thank you.

-- 
Dmitry
