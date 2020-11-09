Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62DD92AB12A
	for <lists+linux-input@lfdr.de>; Mon,  9 Nov 2020 07:18:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729092AbgKIGSv (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 9 Nov 2020 01:18:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728951AbgKIGSv (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 9 Nov 2020 01:18:51 -0500
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F302C0613CF;
        Sun,  8 Nov 2020 22:18:51 -0800 (PST)
Received: by mail-pf1-x444.google.com with SMTP id w14so4517101pfd.7;
        Sun, 08 Nov 2020 22:18:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=a5P90ef0IaWnARRxiBmNYzOLO9ZbkOvhfs0jKITfbfg=;
        b=Ib4vgN8tQ51NaDXsbC/wAVI3mvtRUkKMGtJYY1TA2t7CifQFow2oyaffuB0Ci8hXGg
         jQYxCRT0btxyFfBD2U15fKCvsIvxyy6I5NPnclk6cQ6zJ7OseKyXerIVXfIGqlSep/n5
         r3AF4fF2YkvJ6QLLH0aGr41Hg78WpSsRP8Yvve3CY7SlsoR/rlgIX1x+ciV5eEaw5xp/
         Ce6n+kYdnTRQADWNUCzSnl5SKUdgdn9XkFomZY8ZTW1Qsf39xXMQwmKPCijj0/SVl8i+
         RbWx/1zQqvNvoxj6sv89heEqo1XQv5XpxeY8vbBzhFRaon1cNMF0d1rKPWMD7BQzM1s+
         fbLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=a5P90ef0IaWnARRxiBmNYzOLO9ZbkOvhfs0jKITfbfg=;
        b=RP0kbllR8cPqwuGjPRqNRVLxPq2zqZ2zNViyHwoXXBS5O/nhzkwqnWFxjQkNX9FFGI
         /dsGkJSUNSRd+FQ+3QYEoamOLnSmcFPHMct1i6fFM4o46MzqDcAnos+TnQXthtOFmQUA
         ewBLQBnR/bFF4x+sGUkUXhnN2sAI0gBi63+00Xb3MZvvN2hDrbv4DvOq43n+nmKqCPTA
         i0plebkFD680Zs/NPmY/k7461W2kpJyc4WBrww0dKRs2asWSh0+jIs8P6XVdbpSW6xrd
         BmQVVM3jDr4saG95nwIbQlKIUwzilEwi0JhVmUsbLzDoxa39pnvwIm6Y9pCIn38k4zKv
         r/DQ==
X-Gm-Message-State: AOAM532WGyVEu1e2xQIkA4YTnCmheKWeaeR5SwsNTuQpns1SyvQaEd80
        HoU64QhKyRgBMzaHwkxOGPI=
X-Google-Smtp-Source: ABdhPJwmao/vDyZ9jAaBxaDcVfLe+idRtGk/TEHs4hp7+hqD9iJl6cr0bhyUm4bZyKStJ4Xkab8rmw==
X-Received: by 2002:a17:90a:cb93:: with SMTP id a19mr10956222pju.99.1604902730637;
        Sun, 08 Nov 2020 22:18:50 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id d10sm9220688pgk.74.2020.11.08.22.18.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2020 22:18:49 -0800 (PST)
Date:   Sun, 8 Nov 2020 22:18:47 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     linux-kernel@vger.kernel.org,
        Kumar G <naveen.gaddipati@stericsson.com>,
        Sundar Iyer <sundar.iyer@stericsson.com>,
        linux-input@vger.kernel.org
Subject: Re: [PATCH 19/20] input: keyboard: nomadik-ske-keypad: Provide some
 missing struct member docs
Message-ID: <20201109061847.GL1003057@dtor-ws>
References: <20201104162427.2984742-1-lee.jones@linaro.org>
 <20201104162427.2984742-20-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201104162427.2984742-20-lee.jones@linaro.org>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Nov 04, 2020 at 04:24:26PM +0000, Lee Jones wrote:
> Fixes the following W=1 kernel build warning(s):
> 
>  drivers/input/keyboard/nomadik-ske-keypad.c:71: warning: Function parameter or member 'pclk' not described in 'ske_keypad'
>  drivers/input/keyboard/nomadik-ske-keypad.c:71: warning: Function parameter or member 'ske_keypad_lock' not described in 'ske_keypad'
> 
> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Cc: Kumar G <naveen.gaddipati@stericsson.com>
> Cc: Sundar Iyer <sundar.iyer@stericsson.com>
> Cc: linux-input@vger.kernel.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>

Applied, thank you.

-- 
Dmitry
