Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C36129F2FC
	for <lists+linux-input@lfdr.de>; Thu, 29 Oct 2020 18:23:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726037AbgJ2RWu (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 29 Oct 2020 13:22:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725730AbgJ2RWt (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 29 Oct 2020 13:22:49 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B8EDC0613CF;
        Thu, 29 Oct 2020 10:22:49 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id a9so3614766wrg.12;
        Thu, 29 Oct 2020 10:22:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FgiZbK6pWCFNNx9QFeZngzu7fh5OqvaG7wkwgkOFjSU=;
        b=cpKWHh/noLvJenv/13DypTzJLrHma44Acp5C9pOHg6D3H7IFNvJnp0zTiuqvH9C2QF
         mz8XA29iaaASTJ2RMZR7Uy8GZ+Za9cW65iG7rVFQOl4n+jJ5oZTIyhCvYjttlx4YdtNF
         mbVNpDTFS7Qy9/JQM2MaY5Mx1Cai/NXG2z1Ssg1kITEdnHUIYuN/9UXZa9rJHRwNKQpo
         L7aIVN0lBeXhSaAww99pKrbIsEZxwmNT8+wUZ4mGiVj/7lXzKBv41/XMvRStA1Ts4IOT
         1R59FKz1O9s+lrPtw3Od2T1sBWxxN5RVQAdsSpsOuABB+3M0+lkV6zekSTUkzp0/FsHM
         JAAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FgiZbK6pWCFNNx9QFeZngzu7fh5OqvaG7wkwgkOFjSU=;
        b=gwTzWkPNh9+XxEmNyrK3/eMkE+weUQZYI4cWM1XOlarSPNvEFST2G3lERcV/qlAtQ5
         Wbf5Yjz3QzHO9G58LTxDv45XbPYECtqOvpx7o6fHSdNQ2WXT9x+g0XW57wfu/pKQLqJh
         dyn0lNk2jmQ1mBu6LjrUFMussk+/5U15oXKDSS7//t6y030bdbYIeAcFBdMGrKS53zcZ
         62WmO22ze1RV6av4udJ5QM84H4Sxoq/TM1nODdGfL6fmOyAJChkV5+l1TkvFNWqSCF8E
         zj7cuMqs3n1y928pmhp4giQgskkf6xDHwynbMTTqU5WeKfwi6I/yCAtwBXQ4xPYb5WvT
         qNfA==
X-Gm-Message-State: AOAM532mIiMIAoA+dDvDcVgtlX5iieeqsSI0ulk0Ea1F6zsmZnBVgJsh
        K8QaLWanjcHcI4a4YXZDb4MLZK5N5MEqkScy1Mfeoo7Rq6gqlg==
X-Google-Smtp-Source: ABdhPJzQqF47WuTZrrAWUm6UKRHFxSNxk2UxPVzZmh961NjEWLxLE1pT8IuMdscuOyDzwnx3gGWJapGFwC0H5g6Eni8=
X-Received: by 2002:adf:81e5:: with SMTP id 92mr6842917wra.411.1603992168004;
 Thu, 29 Oct 2020 10:22:48 -0700 (PDT)
MIME-Version: 1.0
References: <20201028221302.66583-1-kholk11@gmail.com> <20201028221302.66583-2-kholk11@gmail.com>
 <20201029155053.GA1936493@bogus>
In-Reply-To: <20201029155053.GA1936493@bogus>
From:   AngeloGioacchino Del Regno <kholk11@gmail.com>
Date:   Thu, 29 Oct 2020 18:22:36 +0100
Message-ID: <CAK7fi1aRTKkA2ouidjB4tyPoCyfTa2-POhUM_9Y2DNphL7=W2A@mail.gmail.com>
Subject: Re: [PATCH v9 1/3] dt-bindings: Add vendor prefix for Novatek
 Microelectronics Corp.
To:     Rob Herring <robh@kernel.org>
Cc:     Rob Herring <robh+dt@kernel.org>, konradybcio@gmail.com,
        linux-kernel <linux-kernel@vger.kernel.org>,
        dmitry.torokhov@gmail.com, priv.luk@gmail.com, marijns95@gmail.com,
        phone-devel@vger.kernel.org,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, andy.shevchenko@gmail.com,
        rydberg@bitmath.org, martin.botka1@gmail.com,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Il giorno gio 29 ott 2020 alle ore 16:50 Rob Herring <robh@kernel.org>
ha scritto:
>
> On Wed, 28 Oct 2020 23:13:00 +0100, kholk11@gmail.com wrote:
> > From: AngeloGioacchino Del Regno <kholk11@gmail.com>
> >
> > Add prefix for Novatek Microelectronics Corp.
> >
> > Signed-off-by: AngeloGioacchino Del Regno <kholk11@gmail.com>
> > ---
> >  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
> >  1 file changed, 2 insertions(+)
> >
>
>
> Please add Acked-by/Reviewed-by tags when posting new versions. However,
> there's no need to repost patches *only* to add the tags. The upstream
> maintainer will do that for acks received on the version they apply.
>
> If a tag was not added on purpose, please state why and what changed.
>
The intention was to add the tag and I even recall adding it... probably
my finger slipped and the changes didn't get saved, my bad disattention.
I should probably stop developing when I'm overtired.

I'm sorry for that.
