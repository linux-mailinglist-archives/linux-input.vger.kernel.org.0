Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 304ED20B4A7
	for <lists+linux-input@lfdr.de>; Fri, 26 Jun 2020 17:34:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726898AbgFZPet (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 26 Jun 2020 11:34:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726621AbgFZPes (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 26 Jun 2020 11:34:48 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85575C03E97A
        for <linux-input@vger.kernel.org>; Fri, 26 Jun 2020 08:34:48 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id f7so6928127wrw.1
        for <linux-input@vger.kernel.org>; Fri, 26 Jun 2020 08:34:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=aAcfCgvKsfhT29xPLhnVNpyExCly3cUm2Peqoqgxmf0=;
        b=KHUrbGo0dOOY8/YThmDbwKziPV5u3juGa1/NZs7GxPlI+Ky60oReECURQzxaIxKIPH
         ybC5D38rG0u4HQBcc5+FyhyoWd7q9fFJbfAHIxwvyzYt4vxRUDqUXUJc1e6C35XKpMY1
         JwkeivRV0+SR6hyxeZ7UsWCKI1v4jNX14qkrpwyXb1zThJMvLUVcu96NC8JD123zZJUc
         7dcPzud94VOkiYt7v3SGzVWVl9ObxfuHX/nx7vex48z5cbRminHWdXtXdFxY/a6kWtoU
         2ZnmY5/MWHvuI1f4LUCCbYZGRIc3biEgeMqUwKEufxecS7VxsywT3kusjLjoRkbsxtao
         /+1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=aAcfCgvKsfhT29xPLhnVNpyExCly3cUm2Peqoqgxmf0=;
        b=LaM6NrotqAfngRQre0P+trJrfLatbNupQEdxEZ8kI4SHMZr0JO0Uzb1ibAJuiQsELp
         rDoEA/qHwOwoA+s5bFTA6sHPJJLrcOefMESJgNSS7rKO7O+RrAw5Ql+Ae4tNrN0gzsfD
         iX38Ku+IJW1FEpV9liHJDyK4Vpi7LRNPE95CjvWNgD79kz7Wce3+pmGZVnU6+xYdNvai
         R3AeMF+VWeAza6NwHh3w7bl8JCwnhUlQhcnT297obA+Ok/1rBODQlqnFgDTVvFgpHULy
         eZA5YiP4CKtyfoZne57DzT8UvB3fw/ZF+OaOii8ryD8UqVlPF0UzuGSBBZqHXtMeYWsv
         93qg==
X-Gm-Message-State: AOAM530QTYtkiRkBgnNzwXaq7sfphrQtE/qgFk5zsyyQgCYtyUYqF3MW
        yOjSOyrLT5vOv900hF37a+EaMw==
X-Google-Smtp-Source: ABdhPJzlwBw+/yQMNwLyasEb94h7nfE4+tQylcXHUSASL8mNdPqYJzqJsaJXHkxkzkGtzTNyYg5fPA==
X-Received: by 2002:a5d:54c9:: with SMTP id x9mr4622718wrv.247.1593185687230;
        Fri, 26 Jun 2020 08:34:47 -0700 (PDT)
Received: from dell ([2.27.35.144])
        by smtp.gmail.com with ESMTPSA id 11sm17973885wmg.41.2020.06.26.08.34.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2020 08:34:46 -0700 (PDT)
Date:   Fri, 26 Jun 2020 16:34:44 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Enric Balletbo i Serra <enric.balletbo@collabora.com>
Cc:     Ikjoon Jang <ikjn@chromium.org>, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Gwendal Grignou <gwendal@chromium.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Benson Leung <bleung@chromium.org>,
        Guenter Roeck <groeck@chromium.org>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Nicolas Boitchat <drinkcat@chromium.org>,
        linux-input@vger.kernel.org
Subject: Re: [PATCH v7] dt-bindings: mfd: Convert ChromeOS EC bindings to
 json-schema
Message-ID: <20200626153444.GE177734@dell>
References: <20200306085513.76024-1-ikjn@chromium.org>
 <20200417101333.GA3737@dell>
 <ab5adcd1-18f2-9b1c-8c5d-744f7a0e5579@collabora.com>
 <20200625134620.GS954398@dell>
 <b2f27cee-327e-c96c-aa12-5e1ef1f352aa@collabora.com>
 <20200626094005.GA177734@dell>
 <42f68bda-a152-9f21-ff72-a71a474a8c92@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <42f68bda-a152-9f21-ff72-a71a474a8c92@collabora.com>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, 26 Jun 2020, Enric Balletbo i Serra wrote:

> Hi Lee,
> 
> On 26/6/20 11:40, Lee Jones wrote:
> > On Fri, 26 Jun 2020, Enric Balletbo i Serra wrote:
> > 
> >> Hi Lee,
> >>
> >> On 25/6/20 15:46, Lee Jones wrote:
> >>> On Thu, 25 Jun 2020, Enric Balletbo i Serra wrote:
> >>>
> >>>> Hi Lee,
> >>>>
> >>>> On 17/4/20 12:13, Lee Jones wrote:
> >>>>> On Fri, 06 Mar 2020, Ikjoon Jang wrote:
> >>>>>
> >>>>>> Convert the ChromeOS EC bindings to json-schema.
> >>>>>>
> >>>>>> Signed-off-by: Ikjoon Jang <ikjn@chromium.org>
> >>>>>> Reviewed-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> >>>>>> ---
> >>>>>>  .../devicetree/bindings/mfd/cros-ec.txt       |  76 -----------
> >>>>>>  .../bindings/mfd/google,cros-ec.yaml          | 129 ++++++++++++++++++
> >>>>>>  2 files changed, 129 insertions(+), 76 deletions(-)
> >>>>>>  delete mode 100644 Documentation/devicetree/bindings/mfd/cros-ec.txt
> >>>>>>  create mode 100644 Documentation/devicetree/bindings/mfd/google,cros-ec.yaml
> >>>>>
> >>>>> Applied, thanks.
> >>>>
> >>>> I don't see this patch applied, I am missing something?
> >>>
> >>> It should be there.  Not sure when the MFD repo was last pushed.
> >>>
> >>> I'll try pushing it again (there are a couple of new patches from
> >>> today).  Maybe that will spur a fetch from -next.  If it's still not
> >>> there tomorrow, let me know and I'll investigate further.
> >>>
> >>
> >> Still not there, just to make sure I am looking at the right branch, I am checking
> >>
> >> https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git/log/?h=for-mfd-next
> > 
> > Oh, I see what's happened.
> > 
> > Looks like this patch wasn't sent to LKML, so my apply script failed.
> > 
> > Any reason not to send it to LKML?
> > 
> 
> Ikjoon? I agree that is a good practice cc always the LKML, also I didn't know
> you had a script looking at it to pick the patches, that's useful to know :-)
> 
> Do you want we resend the patch? In such case, Ikjoon, can you resend it?

No it's okay.  I will apply it manually (probably on Monday).

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
