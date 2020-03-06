Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 218DB17B751
	for <lists+linux-input@lfdr.de>; Fri,  6 Mar 2020 08:24:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725869AbgCFHYB (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 6 Mar 2020 02:24:01 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:36871 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726256AbgCFHYB (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 6 Mar 2020 02:24:01 -0500
Received: by mail-wr1-f66.google.com with SMTP id 6so1078804wre.4
        for <linux-input@vger.kernel.org>; Thu, 05 Mar 2020 23:23:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=OjSejv2JJ2JWA4MOD2Ua80DTgBsI2ciXKHuKLp62nNQ=;
        b=MQzuHt74wlVMFLtLf+XKCyFtFiP0OZACrpNL3iDuYk1PsjH7ivfylf6GMedDSpHrA+
         +rpZXuO/hvi3sao+44yncL5iFWuV/UQzdOU/G/70eilMHfLTv6lV7YayhU3lk9R91tvQ
         y/jiEZLUI8XuQCSjDX/ypPrWOeYnmU7plRJodOGIr4kCvhvZ6gRolmWNg4aIy66i7NBr
         IUj/++l6OOlyHGlaRoH74YT6fWJGJY+suLeH8SAqt7xNzQ6xFcAHKBHQ0I/Bb9wcXuXz
         DZu0FNVzvh9o+7OJ22MnsEgXWX4Cz3r5dWrF1t8ucKlTJuf1J4NGD3RAjM/t6YAwtP/N
         JJsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=OjSejv2JJ2JWA4MOD2Ua80DTgBsI2ciXKHuKLp62nNQ=;
        b=d+hKuF1vH3lAWE1NhqF8uMhEtZE/IAt/LyIKHwdSAmte2JOQN/7rJLxu2ppSlmJFp+
         90Vd9/Ur9j0j3PjBEo5KJnmmuambzb5goGmNERAWTiWqRIQhyF2W2+b3h2stW0CSDGYe
         W2lXd8JdzsIuOiycgjde63ljj4C4EUuqOsSlisSVLX6neiRzrt/Xghgo0ex9WAZ7h9VI
         lQw89zOgJIb1wumjiLyxbZ1PxSlYPvEJOW6usZBEtmZtQOT+g13Bbe3iBS/M1uxsBsQ2
         sH1rJ/bT4045XkDOMfAFiAAwaBLd2atxsk9E10H78Yz2wK3M4TS8CpFD71UxOZTaLoj8
         hN2w==
X-Gm-Message-State: ANhLgQ0wrySCIIe2sTZcPYTkEJp9/vbA0EMcVpPF3197Ujl6jB7jsOsh
        VKEoiwG6FXjp/xbRSG4JkjC3OZpdP64=
X-Google-Smtp-Source: ADFU+vufcMPJhoz525ReiJIke606YTgQB9zlW2QHLNkqzTMEKlmjaYtQF2XY4me1raSEbZfX/h8K+Q==
X-Received: by 2002:adf:ef92:: with SMTP id d18mr2408404wro.193.1583479438509;
        Thu, 05 Mar 2020 23:23:58 -0800 (PST)
Received: from dell ([2.31.163.122])
        by smtp.gmail.com with ESMTPSA id v16sm30547928wrp.84.2020.03.05.23.23.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2020 23:23:58 -0800 (PST)
Date:   Fri, 6 Mar 2020 07:24:38 +0000
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
Subject: Re: [PATCH v6] dt-bindings: mfd: Convert ChromeOS EC bindings to
 json-schema
Message-ID: <20200306072438.GH3332@dell>
References: <20200305075302.200959-1-ikjn@chromium.org>
 <199d9fc9-5eba-c135-14a5-e78000859f47@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <199d9fc9-5eba-c135-14a5-e78000859f47@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, 05 Mar 2020, Enric Balletbo i Serra wrote:

> Hi Ikjoon,
> 
> On 5/3/20 8:53, Ikjoon Jang wrote:
> > Convert the ChromeOS EC bindings to json-schema.
> > 
> > Signed-off-by: Ikjoon Jang <ikjn@chromium.org>
> > ---
> > v6: adjust property dependencies, drop duplicated definitions,
> >     and set additionalProperties
> > v5: unset additionalProperties
> > v4: text reflows, add type references, and fix examples
> > v3: node name changed in rpmsg example
> > v2: cleanup description, fix typos, remove LPC, and add RPMSG example
> > ---
> >  .../devicetree/bindings/mfd/cros-ec.txt       |  76 -----------
> >  .../devicetree/bindings/mfd/cros-ec.yaml      | 125 ++++++++++++++++++
> 
> According to the feedback I received on other patches from Rob, the name of the
> file should include the vendor, in that case should be google,cros-ec.yaml
> 
> I already argued in previous version why I think this should go in
> bindings/chrome instead of mfd, these bindings correspond to the platform/chrome
> device not the mfd cros ec device (cros-ec-dev) in MFD, anyway, I don't want to
> be touchy, but, as is, should go through the Lee Jones tree not our
> chrome-platform tree. So if Lee is fine with it I'm fine too.

Actually these have been reviewed and taken by Rob of late.

> Just another minor change (see below) and looks good to me.
> 
> Reviewed-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
