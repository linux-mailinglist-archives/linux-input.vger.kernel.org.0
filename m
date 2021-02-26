Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D481632670F
	for <lists+linux-input@lfdr.de>; Fri, 26 Feb 2021 19:47:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229598AbhBZSqK (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 26 Feb 2021 13:46:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230427AbhBZSqJ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 26 Feb 2021 13:46:09 -0500
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52BA0C061788;
        Fri, 26 Feb 2021 10:45:29 -0800 (PST)
Received: by mail-pj1-x1032.google.com with SMTP id t9so6504574pjl.5;
        Fri, 26 Feb 2021 10:45:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0UPnEd5Wg3kpWjRH706W5Ez84d0loHNrsPAt578hf74=;
        b=GpIM4qnQhjqbXpdV07iblEsdrD+HZsmm6o60qhAbHxBrl/b30vJmWBFDstPrfEbpXt
         h1p08GfJQlQeZbFOadSwYznhvFSLTpygAgsQAe2hnW9VW8zsfWjVmNmuZzb6NPIXoxGi
         ykIAQEaImlCGbN4N4pU1ophlT7EmXrPp7ovFPAjdfT0FdLPxVwShkEMT8w3stLOpyQjw
         cZlL576JKP9h5yBRGHBGyN5imon/Pumvsz/YoX9GQN6g9zUat0clWIFZJT/Wj0zta2uN
         zoq9zkD6Y692e7D290SX/B8bG1oIRE+0s/HAOpQRaF7/GNrQ1BkLgtylmZnVbGrXpdmg
         oRow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0UPnEd5Wg3kpWjRH706W5Ez84d0loHNrsPAt578hf74=;
        b=QwzfqMnEAXCU5M8U91Y1Dv8MLFXCr/FLcO5r1j5XnWsQNSaAWns8qhm7BF7u+lUC8l
         mS2yhrz6vs19NTBPwJEIpWOlmYU7h31Q+VPEfjIpPKCqx+TL/OWzuUJzKITsDLYpO7uI
         n75SNqlsO10Qcg0Ck832lNp/5iPWlbsbcQ2riAa7O4ODc5OyNUBxyWFNpYbKmY2C/NlR
         +SJJQyJkajKeW2Wh4ttakN/uXZhZkYOGJkUHRNZzo9uku7JGLgmLJ3v+ShuOSvv+21BF
         ODk4W7UfO5V2gZh9sRV9/sLcw17h+i+1BvSZZy2iUklpwGaABrEKd5ZzyEkyOGElGh8L
         abfw==
X-Gm-Message-State: AOAM532cjZ5lJWH9kdIVDRFGglLQpExPa1VMNAEKM3QvYoJeZrGAP1Bi
        iaDmf+cTdul1/cKyafhoo4z6PJ+WJxAaPfz1H88=
X-Google-Smtp-Source: ABdhPJwqhp1SJjQSOH5rYFJglc/ZLpd4djqIzNdRiWEfX2BK5iQt5tq/yjgQqv7RDujigp6QdbZQvcTpCp6jSXvDopc=
X-Received: by 2002:a17:902:a710:b029:e3:b18:7e5b with SMTP id
 w16-20020a170902a710b02900e30b187e5bmr4218951plq.17.1614365128896; Fri, 26
 Feb 2021 10:45:28 -0800 (PST)
MIME-Version: 1.0
References: <20210226182533.6595-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20210226182533.6595-1-andriy.shevchenko@linux.intel.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 26 Feb 2021 20:45:13 +0200
Message-ID: <CAHp75VcRUsK03Rx8KA8PZAnCHaiBDO5-ByPx68Zaoc+Ed03rFw@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] HID: i2c-hid: acpi: Move GUID out of function and
 described it
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Douglas Anderson <dianders@chromium.org>,
        linux-input <linux-input@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Feb 26, 2021 at 8:32 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> Move static GUID variable out of the function and add a comment
> how it looks like in the human readable representation.
>
> While at it, include uuid.h since the guid_t type is defined in it.

Oh, I see more improvements can be done, so, I will send this and the
rest as v2 altogether.

-- 
With Best Regards,
Andy Shevchenko
