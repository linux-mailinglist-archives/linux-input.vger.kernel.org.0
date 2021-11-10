Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E0D344BBAB
	for <lists+linux-input@lfdr.de>; Wed, 10 Nov 2021 07:28:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230050AbhKJGbJ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 10 Nov 2021 01:31:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229731AbhKJGbJ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 10 Nov 2021 01:31:09 -0500
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A3A6C061764
        for <linux-input@vger.kernel.org>; Tue,  9 Nov 2021 22:28:22 -0800 (PST)
Received: by mail-pj1-x1034.google.com with SMTP id nh10-20020a17090b364a00b001a69adad5ebso771446pjb.2
        for <linux-input@vger.kernel.org>; Tue, 09 Nov 2021 22:28:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=7tG2gw9xhcYwKB+fq01PpM24VHkYZi1b8eOjBvQVVBs=;
        b=O3K7XV6SdV2UwpO668NoGL1TtMrAwfatuoiL5aikHauoF6zQrsnBU4sxKW4jVwU0md
         7S61L6HuVS6W60LlnPw2iHlcMaYH82y2pzrlSNluLby+Ff9fYRlB/oYqysy0EoiVPTQ9
         tSfAJeG4hwdGW4DYWWiopLfV6HSjcxRDVEjglb3qPWOE6n7qlsHz14pxaze/d9eylLux
         2hX7+afnwnO4FWHR7BJBi5Emb6MZcUaRXsw5Ec0Juv5W4mpzNQFMzOUmLqtSpQIcqK+/
         ROagTfX4fdzXPb2todzD47Y9iWVXl/YalrXIoHP7U+X2/0Gs9REC3j3Dyza67XV7eUVw
         1hhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=7tG2gw9xhcYwKB+fq01PpM24VHkYZi1b8eOjBvQVVBs=;
        b=xMVM92nnGuZxD7GMgN3fMf7sfi9aN4tDbl5dJ/NeTyx/yvMFSSpedmiNkaXpcbFzmi
         9u72rRg7ANu2C5zer1Z2oR8rLiYv5LCbEA5AZ0E54jZdjJYbn6t3Rk1z6ubplK8CosBq
         7DEuUHSDbvfDV5+nv2bnWIKq1oSF4goxUK+QsLU/OC3mrUuq2OO2GUXdLrA4IU3HKKFf
         n+ZQNEj7KLNQF1vudU3QfT2FWOpZs8HiuSiRcjRqceDP8xmlSkPpFBFbP1DbBv9W9s9O
         pxLuWKGqkCdP94jNDqM0lOxR4wBupq5KJHmxcJGA9Zk/0Wij8jf+dXpoNKa6i+BnrpeQ
         99qg==
X-Gm-Message-State: AOAM533o2DuwSZgmakv3CEbrW+bJiY7zwYYTjkh97Lol/6wEymTw8n8q
        cHhu5fMIDM4SeguQa8RHN7tomMd0cq0=
X-Google-Smtp-Source: ABdhPJxIcV0ovGsP6IU1cSpQaWf1qyHIDOVVqMXiqBAGlP2iL/3U9MOxzJN7mrit8ahyDQz9BAq7jg==
X-Received: by 2002:a17:90a:1b4d:: with SMTP id q71mr13875926pjq.29.1636525701725;
        Tue, 09 Nov 2021 22:28:21 -0800 (PST)
Received: from google.com ([2620:15c:202:201:b345:ee3a:151d:b1d1])
        by smtp.gmail.com with ESMTPSA id a26sm10663247pfh.161.2021.11.09.22.28.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Nov 2021 22:28:20 -0800 (PST)
Date:   Tue, 9 Nov 2021 22:28:18 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Marek Vasut <marex@denx.de>
Cc:     linux-input@vger.kernel.org, Joe Hung <joe_hung@ilitek.com>,
        Luca Hsu <luca_hsu@ilitek.com>
Subject: Re: [PATCH] Input: ili210x - Reduce sample period to 15ms
Message-ID: <YYtmgsHRzdn7tHw6@google.com>
References: <20211108114145.84118-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211108114145.84118-1-marex@denx.de>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Nov 08, 2021 at 12:41:45PM +0100, Marek Vasut wrote:
> Modern devices may redraw display at 60 Hz, make sure we have one input
> sample per one frame. Reduce sample period to 15ms, so we would get up
> to 66.6 samples per second, although realistically with all the jitter
> and extra scheduling wiggle room, we would end up just above 60 samples
> per second. This should be a good compromise between sampling too often
> and sampling too seldom.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Cc: Joe Hung <joe_hung@ilitek.com>
> Cc: Luca Hsu <luca_hsu@ilitek.com>

Applied, thank you.

-- 
Dmitry
