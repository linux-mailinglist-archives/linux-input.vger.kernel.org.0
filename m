Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55E6B33CA46
	for <lists+linux-input@lfdr.de>; Tue, 16 Mar 2021 01:12:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229958AbhCPALv (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 15 Mar 2021 20:11:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233023AbhCPALj (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 15 Mar 2021 20:11:39 -0400
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76F3CC06174A
        for <linux-input@vger.kernel.org>; Mon, 15 Mar 2021 17:11:39 -0700 (PDT)
Received: by mail-pf1-x42e.google.com with SMTP id c17so4040077pfv.12
        for <linux-input@vger.kernel.org>; Mon, 15 Mar 2021 17:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=y/TH7iFUaSz2UlHs1lcegD72iGyK+F1UBVQsrgY4JRc=;
        b=Rl8gvvXLjqR3k9iVdCPAOh7z8Abvhv9oDMwZusIlMFJUQYfDGcNrINdX/zFkU4ENRW
         RLxNF6fb/pchzOoL6GnnFedn7oZUY5Ki7gO8uemsiearDJj8nXAs5G+k9vdj+lmHRggD
         Maw4bbiVWmPbEfl7q+TLinVWPMj+D9RP//McGjiGvlXw9UVQzyhxyc+MRG9iM9ObEgsF
         Xce3P/yx1zEU3GP/Dvg/X+CVSMcSysjUol9A2Ay+zxFMUfaaWDlWGuQDvl4x7h11PxHZ
         OpW7Hxqao1MU3PAjSYB4z8brJ+Mfv0sctwzKSG8uddtv2y/I9+oPY+hKWQNnz0TpvsdL
         +jyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=y/TH7iFUaSz2UlHs1lcegD72iGyK+F1UBVQsrgY4JRc=;
        b=BX6zL4GYyZAlRKXxdVO9cF+liSMU2FhJ65KU6qTcfBAQGPVniwTLcprcf3PmT775w5
         WCZ+V5EoMGdsgV5nDXGXz66UJY17x0kDga9qbY1Gre3YX0SS+E3myPzu4eIb56TT0m5f
         X1rN4YjyxRTpk026ECfM1bsav9rt6bICiwuQguOkByZe2dujZ4dswYqY8a9VZi4JJZtU
         qZe5XxpsrreNhhvSaorqFEj9b2TauVAnGAUckceHzWRoNKabbIMY6zRSXmjqTGUCZ19N
         I9J0yzlY/BdhmaOJLuR3oUtxEQYR3k5OU59+czkXDwUieGgR2maU7SNNIn59xXXg0zk5
         8zEQ==
X-Gm-Message-State: AOAM531WZ7DCeLD8oG3aKme58AUwA/B/xL7L5YXzr2gy7Lg9+x+ky48M
        afJFZ42oFR12A3HZZn+GkUIVSYOPYyI=
X-Google-Smtp-Source: ABdhPJwEapfF4MkhZOE2E/plDMfJQkXUpnSo2Fj51e2Sv+xBoARg451tqqEWvLaU7b6kBf2mYk7osg==
X-Received: by 2002:a62:dd89:0:b029:1fd:d370:7a5e with SMTP id w131-20020a62dd890000b02901fdd3707a5emr12601623pff.61.1615853498900;
        Mon, 15 Mar 2021 17:11:38 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:c4f3:b674:6a37:83cb])
        by smtp.gmail.com with ESMTPSA id q22sm4932638pfk.2.2021.03.15.17.11.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Mar 2021 17:11:38 -0700 (PDT)
Date:   Mon, 15 Mar 2021 17:11:35 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: Re: [PATCH v3 2/2] Input: tsc2007 - make use of device properties
Message-ID: <YE/3twwyFaTE665V@google.com>
References: <20210314210951.645783-1-andy.shevchenko@gmail.com>
 <20210314210951.645783-2-andy.shevchenko@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210314210951.645783-2-andy.shevchenko@gmail.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, Mar 14, 2021 at 11:09:51PM +0200, Andy Shevchenko wrote:
> Device property API allows to gather device resources from different sources,
> such as ACPI. Convert the drivers to unleash the power of device property API.
> 
> Signed-off-by: Andy Shevchenko <andy.shevchenko@gmail.com>

Applied with minor edits, thank you.

-- 
Dmitry
