Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B83E2A911A
	for <lists+linux-input@lfdr.de>; Fri,  6 Nov 2020 09:18:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726419AbgKFISN (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 6 Nov 2020 03:18:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725616AbgKFISL (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 6 Nov 2020 03:18:11 -0500
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CA3FC0613D2
        for <linux-input@vger.kernel.org>; Fri,  6 Nov 2020 00:18:10 -0800 (PST)
Received: by mail-wm1-x341.google.com with SMTP id h2so493852wmm.0
        for <linux-input@vger.kernel.org>; Fri, 06 Nov 2020 00:18:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=VZi03rWrzOkUnSyfJZ+vwUW9tbFc2lklDx4bHNIXLyI=;
        b=UUdGwICvCNYXNGOjMwpeK0MG9Tb077dmS33Ae98D9q0IuA9QDinLQxZtsdc7VbQcKA
         xmvcnREdQ83ITw6/7QP4ftSY5tm8Lfp6rhA/iyLrHqP3yxZ7uiBDJ7GSkMJMuSTWHFzw
         zzmuKU9dnXzCEU5vvE4gO9xi/HD51YuYGG8tf6tOeXpObvfzeFeApvKlYD6aMtHeopL1
         n+XF76nwh+dlWGiQhV7e8ssNNwUtCnN5qeUqCYAO/f0rqGlkvlwslRFwkvx2baJc/eyW
         V8NmMfCwBMRKgEzpijH0lIkARz9Ekr+M0qlesXdNfgoB6KvYU0t678QDN19DDmQe7J39
         n9kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=VZi03rWrzOkUnSyfJZ+vwUW9tbFc2lklDx4bHNIXLyI=;
        b=DgBSvUibKKP+6I8n9cF8Iq641aBqfy+QSVkI73INdJOaSKRZNxX8mxFlDV4w5mDV8J
         JW0iI5v7vlMuN3xZaAYWdjE4m1dXs18uarpVBuNC9PkKB9ZscGT/qKVMS+7APagTV1fD
         tHOsI1F3cWQxx/3a8uP1LwL3o4Il6l2K1+lIfZtNuRsBF9avnQT9FTTlHFfLayjjgWJt
         cBLVFN6R/qGr2DSaanRD4QjRavpQnK+PsVMAM/FGC05D5r5tJBIc13uE8Glq/K4jNI+7
         52Yqg+KJ5WkWYtO0qj0MEGVz+4dmQlEBhZVDDckXnvNgnbu3MwuGNwG/n8jeQvUxgfxW
         blMw==
X-Gm-Message-State: AOAM532BOc8WodtD+FWxDB6fdbWH3Y9m3NEb2G7ytz2fzdvblHLe+8i5
        QW+z7hn7XUdVq/yy+UpAv81k8Q==
X-Google-Smtp-Source: ABdhPJxba+JSnY+vFe/CSWDSAnKlFEH+f82v0kw+X0HfLS2M/YQ/O9p0OBzUgW3dd8i+ZdZPdx8uoA==
X-Received: by 2002:a1c:e3d4:: with SMTP id a203mr1141356wmh.177.1604650688735;
        Fri, 06 Nov 2020 00:18:08 -0800 (PST)
Received: from dell ([91.110.221.242])
        by smtp.gmail.com with ESMTPSA id c64sm1018539wmd.41.2020.11.06.00.18.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2020 00:18:07 -0800 (PST)
Date:   Fri, 6 Nov 2020 08:18:06 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Joe Perches <joe@perches.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-kernel@vger.kernel.org, Henrik Rydberg <rydberg@bitmath.org>,
        Peter Osterlund <petero2@telia.com>,
        Stefan Gmeiner <riddlebox@freesurf.ch>,
        "C. Scott Ananian" <cananian@alumni.priceton.edu>,
        Bruce Kalk <kall@compass.com>,
        this to <linux-input@vger.kernel.org>
Subject: Re: [PATCH 10/20] input: mouse: synaptics: Place braces around empty
 if() body
Message-ID: <20201106081806.GW4488@dell>
References: <20201104162427.2984742-1-lee.jones@linaro.org>
 <20201104162427.2984742-11-lee.jones@linaro.org>
 <20201106072630.GD1003057@dtor-ws>
 <b2cb1fc8aca53ef9ff5d3ff913f2ad4a5e95b1f9.camel@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b2cb1fc8aca53ef9ff5d3ff913f2ad4a5e95b1f9.camel@perches.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, 05 Nov 2020, Joe Perches wrote:

> On Thu, 2020-11-05 at 23:26 -0800, Dmitry Torokhov wrote:
> > On Wed, Nov 04, 2020 at 04:24:17PM +0000, Lee Jones wrote:
> > > Fixes the following W=1 kernel build warning(s):
> > > 
> > >  drivers/input/mouse/synaptics.c: In function ‘synaptics_process_packet’:
> > >  drivers/input/mouse/synaptics.c:1110:6: warning: suggest braces around empty body in an ‘if’ statement [-Wempty-body]
> []
> > > diff --git a/drivers/input/mouse/synaptics.c b/drivers/input/mouse/synaptics.c
> []
> > > @@ -1106,8 +1106,9 @@ static void synaptics_process_packet(struct psmouse *psmouse)
> > >  					num_fingers = hw.w + 2;
> > >  				break;
> > >  			case 2:
> > > -				if (SYN_MODEL_PEN(info->model_id))
> > > +				if (SYN_MODEL_PEN(info->model_id)) {
> > >  					;   /* Nothing, treat a pen as a single finger */
> > > +				}
> > 
> > This gives me:
> > 
> > WARNING: braces {} are not necessary for single statement blocks
> > 
> > from checkpatch.
> 
> As the entire case 2 is effectively a noop, why not just comment it better
> and remove the if (SYN_MODEL_PEN(...)) test altogether.

Happy to do that if that's okay with Dmitry.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
