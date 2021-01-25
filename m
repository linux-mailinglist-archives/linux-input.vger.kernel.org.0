Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED96E302109
	for <lists+linux-input@lfdr.de>; Mon, 25 Jan 2021 05:17:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726630AbhAYERK (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 24 Jan 2021 23:17:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726660AbhAYERI (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 24 Jan 2021 23:17:08 -0500
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B76C3C061574
        for <linux-input@vger.kernel.org>; Sun, 24 Jan 2021 20:16:28 -0800 (PST)
Received: by mail-pg1-x52d.google.com with SMTP id i5so8077638pgo.1
        for <linux-input@vger.kernel.org>; Sun, 24 Jan 2021 20:16:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=gdKhlqQsG9i7pM6JVZheKW7excNhkAdpfl5YO/JE+eY=;
        b=fAVU/OmdtCkd0ZkMUWq4Bqn610wLZr4C5iPVJogNKU1y6hJL4EjYqD9EQXdRPEr447
         mgdJesoEk1fMnQysPThdjfosouLDnKoKV50Mc/eTStbF49RZTJf2Vg6RpldeA2zTN9ZZ
         jN1WrWcrUMs+wWmZO23X1bjlFxF8QQ7xh5YYivBBP6F6bkJXTk2jvdCggMq8V5IVGe9l
         rPR0m65D4ewNmVv2qaFOhOQjiCyuKwdSBNm4NmfhVaeSBf72ksSezrd9TR5hxHQcRzHK
         79YKF9E6PYAiI3rXa9MSFBeFSOTO/dj8ENwDy2UpAzIW7GkAaY3YJNaAIfcgO10Ch358
         eJkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=gdKhlqQsG9i7pM6JVZheKW7excNhkAdpfl5YO/JE+eY=;
        b=DsW2gES0OARWa0ElQkIlFjhyqT84AsROxlvJc/AewzdXqna4PYOrTrRPg/KhjF0nPv
         RvrktbmoiTxkilWOUhS13nuItyOKG9BCA1cfV8qya6YwpMskmrqFGK+qewwhhGAWGUfc
         Fdj2fPFUsqd8hBnUjfNEAghhAFotoysOJYXvicKGP0+dfgw5iY99vq3kGKbxYRG6pOYC
         uJKMzHLEsyWQkgkZ/K1yV1Z0xcUb2g6VVccYuFgYPM9RsmZYINH+sxyJsQQjF6hlXYNS
         QEXaSMhqKyY6Y1bX2ZaPh+n6mrx2/4kr3SUs09xpYPJYzdOe8KwItxtQBt9WuGAZh5gw
         i44Q==
X-Gm-Message-State: AOAM531Fb0k2LtKEeFARajg+ym5auCsrbOSylmkdN4i90aBKcppxcyX5
        tIY4kHeqg1qxN2obW641/AU=
X-Google-Smtp-Source: ABdhPJwN/hlkocTzFDw+sCfZ3WfAFRm0sIrtqGyENcqss/twlYf0KniqFdNei0teDnfwLp25Z4/c0Q==
X-Received: by 2002:a63:5304:: with SMTP id h4mr4467104pgb.199.1611548188271;
        Sun, 24 Jan 2021 20:16:28 -0800 (PST)
Received: from google.com ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id l21sm343624pgt.26.2021.01.24.20.16.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Jan 2021 20:16:27 -0800 (PST)
Date:   Sun, 24 Jan 2021 20:16:25 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Jeff LaBundy <jeff@labundy.com>
Cc:     linux-input@vger.kernel.org
Subject: Re: [PATCH 02/10] input: iqs5xx: Preserve bootloader errors
Message-ID: <YA5GGQQWvF5gVq9+@google.com>
References: <1611002626-5889-1-git-send-email-jeff@labundy.com>
 <1611002626-5889-3-git-send-email-jeff@labundy.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1611002626-5889-3-git-send-email-jeff@labundy.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Jan 18, 2021 at 02:43:38PM -0600, Jeff LaBundy wrote:
> After user space writes the fw_file attribute to push new firmware
> to the device, the driver calls iqs5xx_dev_init() to re-initialize
> the device with the updated firmware or recover the device in case
> the update failed.
> 
> In the case of the latter, however, iqs5xx_fw_file_write() returns
> zero (success) so long as iqs5xx_dev_init() does not fail, and any
> error encountered during the update process is lost. Solve this by
> saving the error before calling iqs5xx_dev_init().
> 
> Signed-off-by: Jeff LaBundy <jeff@labundy.com>

Applied, thank you.

-- 
Dmitry
