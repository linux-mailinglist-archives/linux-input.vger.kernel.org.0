Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 76FA440ED57
	for <lists+linux-input@lfdr.de>; Fri, 17 Sep 2021 00:30:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241035AbhIPWcG (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 16 Sep 2021 18:32:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240936AbhIPWcG (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 16 Sep 2021 18:32:06 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8EF9C061574
        for <linux-input@vger.kernel.org>; Thu, 16 Sep 2021 15:30:44 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id t10so18849330lfd.8
        for <linux-input@vger.kernel.org>; Thu, 16 Sep 2021 15:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BrYe7lt2sflYjFwHUoeOnD3YR4njHBLZd1RXl5PI8E4=;
        b=mAiiP8Q2SmeVhvh6uHUOEIvZpL1iCoMmJn9rO5+lVN/XZDwHvgB3s9rO9JPMH0KUES
         YhZZjS8S/ilIbI2CEpAd1NFM1WGLizKSD0Y3vKdlXdtqSgIRp17DHrYwAhCQGHARAgod
         xbC6TnH65FMdwvQA/4cADF86FrR99WHUECrpj7/haGDD4rU0mgJjetsdlqqazdXLCkoB
         RuvAlxJRFomaMfFzu2tunCEFtPA83KAOmiT5lD7XgaTWGaIM1l3yp34KBmidb6x8kU16
         LFj1y74SpEUuGwuxpHFFA2MdctZplNPAvep3eN1lSZ5hdiLAf4hWQ3fI9b3s/fSQcG/j
         tySA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BrYe7lt2sflYjFwHUoeOnD3YR4njHBLZd1RXl5PI8E4=;
        b=CGhzHjYvkp32kQAovLi8FXEHoEGQUCRkrgpAEiwOc44suetx2k8u05IfXLhU9Bac2p
         4cdUHfLKrLugMfjmLde9RCdNFf9G2Hi1ki4hF2VXKFxgOQfzzlmlqJuLWxyv+cOyAYls
         aT2vBcotxbHYfYNh62c1Un7lCx802l2hdFucFgBWAJaJ7lEPLwuBXkJDrpnpKxBen2gf
         9/r3WhyT0VoBdZiAye3LLUznh0FB7Sw4yk+MMF28DGtwJ7FCefMoPgXTPiTo1I/MowNF
         Eg8dVden7yd70UyxRUWKbi9aq/5yXRNVydDJGmFSas5uXUkYImWYk5gCc+KeVCPyvjcg
         XxeA==
X-Gm-Message-State: AOAM531Ck7edV3vFq5hyHTyP49npJkcqkr+brxXTKgMqIQ5YMnfcoO5g
        paM2IR7XPpAh/7G0ixH3ARw/X4TrHxx9eg51fcgpfA==
X-Google-Smtp-Source: ABdhPJwm7ukVso2CVtclSuv0fUI6kYQMDpfOTIleiqg9oEFbmAfWsdCImK4EtWCrQD6hB1GsQZYTSSx0Au3UXPV7cII=
X-Received: by 2002:a2e:4c19:: with SMTP id z25mr553008lja.145.1631831443281;
 Thu, 16 Sep 2021 15:30:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210916153156.14098-1-caihuoqing@baidu.com>
In-Reply-To: <20210916153156.14098-1-caihuoqing@baidu.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 17 Sep 2021 00:30:32 +0200
Message-ID: <CACRpkdau6wCjmeQeFuadsyhi_XZQ6AATYw1okSBMOYbCoGkmCA@mail.gmail.com>
Subject: Re: [PATCH] Input: cyttsp - Make use of the helper function dev_err_probe()
To:     Cai Huoqing <caihuoqing@baidu.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Linux Input <linux-input@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Cai,

On Thu, Sep 16, 2021 at 5:32 PM Cai Huoqing <caihuoqing@baidu.com> wrote:

>         if (IS_ERR(ts->reset_gpio)) {
>                 error = PTR_ERR(ts->reset_gpio);
> -               dev_err(dev, "Failed to request reset gpio, error %d\n", error);
> +               dev_err_probe(dev, error, "Failed to request reset gpio\n");
>                 return ERR_PTR(error);

In this case you're supposed to do

return dev_err_probe(dev, error, "Failed to request reset gpio\n");

Yours,
Linus Walleij
