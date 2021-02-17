Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF36531E042
	for <lists+linux-input@lfdr.de>; Wed, 17 Feb 2021 21:28:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235033AbhBQU1M (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 17 Feb 2021 15:27:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235029AbhBQU1C (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 17 Feb 2021 15:27:02 -0500
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74C26C061756;
        Wed, 17 Feb 2021 12:26:22 -0800 (PST)
Received: by mail-pg1-x52d.google.com with SMTP id a4so7632728pgc.11;
        Wed, 17 Feb 2021 12:26:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=eagr0bR78ArW307UgOGudueX700suYA09mDTJkpqths=;
        b=fqAqHFAgvK0NGMEnuVPxWJiDgbRutJ0+qCD2Oay7VMyVyurArtahrnDPWstV66Ce0/
         Oys7SHL8d4l3Ua9MOwTDC28obS3omgvmcqNcITV01CiPS9bGGBlpsiMzFQOWqocatqD6
         aDofsSBSJJJ1R96uj9/ZzFqjMy4QO5GlJihlGlK0+RoSvsHuh9zCda2KfkcSBve7pEER
         XYXDoZ/RANwY+fh9OyWdBJ+KxOnmlYIvGXiAtNdyyeXiTpfnUxYuJRMa0AK8M645c5P5
         Pz++Srzf1dEaqpmZN9QiPxh+laP6LQL3s+CO1mLKDhSzXblrbU+zugsjlNa8nCMfCYni
         irHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=eagr0bR78ArW307UgOGudueX700suYA09mDTJkpqths=;
        b=iEUfexv+BobJiKArjXgbWl8y0+rr+GKwNtfvHu56eM7UxGaxSqDNiqPoj4CsANc0mP
         3TjNtiwMgbWHPiXRFY7smWi+jIT/yxHUytgLL2UoR9QZRPmFbU0b2ekRRBOaMNG/c2kG
         r4ncfK3jhYIOZn2FsTGNeumoE5Pdykcx64wjXw0Kv8X5qpQFWsUf2ti9OIM9fZqvfUUB
         4rMF3RC/YrVOY8rBpBuTv/wc08JU6BFO5oy5ohwJClrKEI80dirWDZ+7+x1AX0p7BLnU
         p0Np/rglmahEJXWQBslGYoR4iVBVeou1cb/uNdI0scf/qeThIr1WfXcp8zeghXiXLg+r
         dpmg==
X-Gm-Message-State: AOAM531rihnz+CvDUyixQHs8rXjWQfLFSM9GG/ue7tHX/zhdGcSGASLE
        XdC7/f4ioa9L0COyFJFlBAA=
X-Google-Smtp-Source: ABdhPJwc82cdFIYL0fWwsMYm5sZC+MQf05iPsMuOPuVwmTQcafKp484W74TBYNVFIbFLJDTXgKY1FQ==
X-Received: by 2002:a63:da03:: with SMTP id c3mr958367pgh.176.1613593581884;
        Wed, 17 Feb 2021 12:26:21 -0800 (PST)
Received: from google.com ([2620:15c:202:201:a459:a528:1312:4d4c])
        by smtp.gmail.com with ESMTPSA id h8sm2841461pfv.154.2021.02.17.12.26.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Feb 2021 12:26:21 -0800 (PST)
Date:   Wed, 17 Feb 2021 12:26:18 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Ronald =?iso-8859-1?Q?Tschal=E4r?= <ronald@innovation.ch>
Cc:     "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Sergiu Cuciurean <sergiu.cuciurean@analog.com>,
        Lee Jones <lee.jones@linaro.org>, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] Input: applespi: Add trace_event module param for
 early tracing.
Message-ID: <YC176rlGQeyKuOpn@google.com>
References: <20210217190718.11035-1-ronald@innovation.ch>
 <20210217190718.11035-3-ronald@innovation.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210217190718.11035-3-ronald@innovation.ch>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Ronald,

On Wed, Feb 17, 2021 at 11:07:18AM -0800, Ronald Tschalär wrote:
> The problem is that tracing can't be set via sysfs until the module is
> loaded, at which point the keyboard and trackpad initialization commands
> have already been run and hence tracing can't be used to debug problems
> here.
> 
> Adding this param allows tracing to be enabled for messages sent and
> received during module probing. It takes comma-separated list of events,
> e.g.
> 
>   trace_event=applespi_tp_ini_cmd,applespi_bad_crc

You can unbind and rebind a device to a driver via sysfs as many times
as needed (see bind and unbind driver sysfs attributes), so I believe

Thanks.

-- 
Dmitry
