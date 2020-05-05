Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 539321C5084
	for <lists+linux-input@lfdr.de>; Tue,  5 May 2020 10:39:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728622AbgEEIio (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 5 May 2020 04:38:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726551AbgEEIio (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 5 May 2020 04:38:44 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56B77C061A0F;
        Tue,  5 May 2020 01:38:44 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id ms17so718786pjb.0;
        Tue, 05 May 2020 01:38:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=E2G70ruh1UqASRxTtAcsFGnzgm1XwkhrxoqaoZOQegA=;
        b=QSUSLSykQI2yz7Vn3vXpnYAXBDVzgg/4aaaRC6ftQlYVEZkhVuoHHMH4eizk0xWlva
         KfwKv+KxltcjK/8NhVDtQ6+9omlbs7j62tZR0rGcg5Xjtqh6layG0hC9aSO9Y+5qdNLX
         FaJW9K/6ZfQ1uuKmrcz7dAV6wE1u5ELdvHZQf3Fo+qNwUQKExefpSl4eImpDWMS2SGzn
         ZxQ4CfV7JgmyDDbicuFdR5OWqsFR4Pt9lhqTgs6e/+Jsni2aDQ9BZb29/8vXD5xe7dTu
         PLQI4OnbmTbHKIBZ+Tu/zWJN2Z25BMyNarGPq1tjbbERrEH7LfWxYBhizsAuv61KzGL1
         nugg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=E2G70ruh1UqASRxTtAcsFGnzgm1XwkhrxoqaoZOQegA=;
        b=eIcE8glRGmf/L9t1t8DrXpOqahP/TbQTHNAQUMexzwoUX1NPpeRjEHX3ByfVJR3sY8
         SDl+fllP37atySsqmFpL5KajAtbzOPUrb2ddKmlVkLVrqsmyRED61RXi5/cJxshRY5ds
         yv6hKgyoo/UN/ggMzfOURrEDvVJ5UJKIJbmud7PExxWR01ohmtT0oMlXgiKWfAxHbED4
         vx9vaNiABxDvxlMUTxasIiobimB5+qeYvj51q1HzvoKN98THp/n2TS35iNgoWg8cL7aH
         ScqEml2BVRQcnqTr8VGMDqHZoArlu0OCjpQc0273rmQ8z4WHKHoDci7awdxlsYEGOhSl
         N8qw==
X-Gm-Message-State: AGi0PuZaGsyTjeLv8Iy5AUhK/Fb+89idM9YTAVrVGTtq3jQGRJ1P9Yk7
        nJi7yMvUsTwGgqF33zgWDqj5GeWxP4m/E1hIn/Q=
X-Google-Smtp-Source: APiQypJJWb38oWV0h/J7XXpeSAZoVfDI6DhfF8oBQHAq5cuHlnUIXSeF+C19Cx7S3l1Xe1W5Z7FVcNI2qMzV1Qu2kj4=
X-Received: by 2002:a17:90a:2401:: with SMTP id h1mr1635770pje.1.1588667923722;
 Tue, 05 May 2020 01:38:43 -0700 (PDT)
MIME-Version: 1.0
References: <20200504164514.18641-1-a@dun.ai> <72bd44ab-98a8-0cdc-b7e6-104a69ca3643@infradead.org>
In-Reply-To: <72bd44ab-98a8-0cdc-b7e6-104a69ca3643@infradead.org>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 5 May 2020 11:38:32 +0300
Message-ID: <CAHp75Vd8GOmSb3Ra4Ua5D=A_htA8ygmqOAK7O+V1kXmNRBzF+g@mail.gmail.com>
Subject: Re: [PATCH] Add support for Vinga Twizzle J116 Silead touchscreen
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Andrew Dunai <a@dun.ai>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        Hans de Goede <hdegoede@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, May 4, 2020 at 9:21 PM Randy Dunlap <rdunlap@infradead.org> wrote:
>
> Hi,
>
> Usually you need to send patches to a maintainer who could then
> merge/apply them.
>

Thank you, Randy.

Andrew, indeed, you have to send this to platform-driver-x86@ and its
maintainers along with driver maintainer (You may use
get_maintainer.pl script under scripts/ folder).

Don't be in rush now of resending, we will wait what Hans thinks about
the patch.

-- 
With Best Regards,
Andy Shevchenko
