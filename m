Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 517C335ABB0
	for <lists+linux-input@lfdr.de>; Sat, 10 Apr 2021 09:34:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229494AbhDJHfG (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 10 Apr 2021 03:35:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229472AbhDJHfF (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 10 Apr 2021 03:35:05 -0400
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C12F8C061762
        for <linux-input@vger.kernel.org>; Sat, 10 Apr 2021 00:34:51 -0700 (PDT)
Received: by mail-pj1-x1032.google.com with SMTP id f2-20020a17090a4a82b02900c67bf8dc69so6095834pjh.1
        for <linux-input@vger.kernel.org>; Sat, 10 Apr 2021 00:34:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=U/Al2qC8fqR9hR0u4mi8PfBIg4gsO4dSkNzfPgesn7g=;
        b=UE19plRvwE2xsR6pqP7RmhBUOOYXHgy6L1mWWW4mL/caFS7Zr+vMBQSnr4jfirYRcr
         XB0ODBFfwGdSq3afcJDO5OMTwRujlzYK2LbdhQ8/S7mtg3dU1dNFwMEphpT5DEMNUdru
         8CdmFKNLVX8FYhGbG3ncb9ZmxH3+MGhqU+sKJT/ZHIoO7GyX9qxe595wRbNtDxQhyJTN
         mcA3FRY7ovUQ8nCrOZM4R08sD2PhVlblJ2yhmrDxyYKIRrm/P/alHJThuryhMvM90eot
         SS9KEBRTV6qRj8CUlH7srSbv2kL/6FswmKtKbg9E23cnwihsnl3EL2vj1FzXQqiOHZDe
         JgYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=U/Al2qC8fqR9hR0u4mi8PfBIg4gsO4dSkNzfPgesn7g=;
        b=ZlLACsVvhEcUnS0j4uSYQskfJ7qtbKQVwZ0jb9SUSGfN5yjeH4MuNVX6GcoO29kHw8
         yt0HbYpHK5rIYfdRJoCiqz85iG0N4GYfyiWIBEmD59w0vpI/Zaqw/FRzrKt68IxRFg+P
         HHoANZujGnccTc/oEs2+IFcM+jyqhFGe1az47jnyzCAWjIv0wc+6R5QgunlGH1f7zCLO
         1x8Ld92tJrJzv/Ii2ASsCezF2VRPCWC1u8Kg9d4oQrG3Vump6Y4u0I/o1ups8mjOk2Ln
         Ls164AsrzVSW0HA+dt7X8XJANZ38uWyupvRMmlvBm3IvAzvZNFyd389Zkt8fX5syPuVb
         kgaw==
X-Gm-Message-State: AOAM533CIVzsqpVG06jYsd7pdl/T41Nk6T2ZktRs1ymDmJA1pbZkYEBb
        yLJe7U1NDE13xLnQ+OcKIDo=
X-Google-Smtp-Source: ABdhPJwi71L1N/53h0aDia2G88n3sAf+1lawi4Htufmjn8vCoGKRG8FinSdL05WfAdDd0AgRAZS9tw==
X-Received: by 2002:a17:90a:bd8c:: with SMTP id z12mr11197221pjr.83.1618040091354;
        Sat, 10 Apr 2021 00:34:51 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:c9de:23b9:54df:4a55])
        by smtp.gmail.com with ESMTPSA id y8sm3907536pjb.11.2021.04.10.00.34.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Apr 2021 00:34:50 -0700 (PDT)
Date:   Sat, 10 Apr 2021 00:34:48 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Javier Martinez Canillas <javier@dowhile0.org>,
        Henrik Rydberg <rydberg@bitmath.org>,
        linux-input@vger.kernel.org
Subject: Re: [PATCH 7/8 v3] Input: cyttsp - Set abs params for
 ABS_MT_TOUCH_MAJOR
Message-ID: <YHFVGDd8q07lwkCe@google.com>
References: <20210408131153.3446138-1-linus.walleij@linaro.org>
 <20210408131153.3446138-8-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210408131153.3446138-8-linus.walleij@linaro.org>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Apr 08, 2021 at 03:11:52PM +0200, Linus Walleij wrote:
> The driver is certainly reporting pressure in
> cyttsp_report_tchdata() with
> input_report_abs(input, ABS_MT_TOUCH_MAJOR, tch->z);
> so we should also advertise this capability.
> 
> Reviewed-by: Javier Martinez Canillas <javier@dowhile0.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Applied, thank you.

-- 
Dmitry
