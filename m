Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5B1EA138F5A
	for <lists+linux-input@lfdr.de>; Mon, 13 Jan 2020 11:40:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726133AbgAMKkK (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 13 Jan 2020 05:40:10 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:51293 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726127AbgAMKkK (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 13 Jan 2020 05:40:10 -0500
Received: by mail-wm1-f65.google.com with SMTP id d73so9048090wmd.1
        for <linux-input@vger.kernel.org>; Mon, 13 Jan 2020 02:40:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=8woBrjBV2pJrpCEHmipp5tCMuainYmDSO6QY88461Bw=;
        b=v3vjyNLsU/ZP+duwAMBIiT/jTK8pe+/ftmLtCCvrnYszggFFYPTlNqj9hvYjDOOUmq
         EpgQZglWUe1m2gz3HugJRucSZwcNiMfPUkj7Eav0XFDbxrEr/ahC36GknblhDRjc7ahH
         zQjHyJwdJJhf+QMpI0IDbA/wNfOcZ2FznT70pmF8lv26V2byaqL3jChP1ohJIt0TXMcH
         Udb7ZfjiUa/aUwIvQJ7yybd9UwrI/FtTqZdU9m8cJaaQQFkFmDImu/OE3+WU9PajHTUo
         4c92RFQuMMUFx5sEkOfW1ctKcz6VghA9q4Ry+EEEAp7p2MtqTeW+fEIsng1iLqdHdWrY
         gs/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=8woBrjBV2pJrpCEHmipp5tCMuainYmDSO6QY88461Bw=;
        b=EfIVN5aUwGu8nmOdR9MiQkxxSDlXmcXq/A9N+Hu8zzrbba30leTDev0LOQjDnbdf7O
         QjVctEMhHZMw6x3Y/Tur722nP9DeXFodpGgRGcKpaAC2IsQ+RqMjzcTlMcVEjiANuqKr
         QgWtZ38AuuFJkTjb2abBRcPBdySbTjlvCZ5mfx9PfNwE0qzPWYj5asqokPfUFcNlhK/F
         o8Nhfce7ZoW81o53y+Q3IyFInx0Rf/AL8LFQBff2KmFAvmHOHES8puF0Jolp0Cw3ZDqc
         wiM7oPp3GHuP83OrmMI64c8PjVu0ihtsCr8zOkBJy9NtnA6B634Oh4TeIQwVgAby/69y
         Lp9A==
X-Gm-Message-State: APjAAAVBp3aQ7Uk6dTamVPCjfGeDJGIaGqXWx3yN8GSbreQF8mest2Kn
        rrv41WS7tOxvomND7kEH5im2ig==
X-Google-Smtp-Source: APXvYqzahBcdOwjWkOf5gPeQ+ARXeltCNOTaht2mJFVatu9RTi95f0Vd/GWdieYkCfCRg7L1Uj2Cnw==
X-Received: by 2002:a1c:e108:: with SMTP id y8mr18978661wmg.147.1578912008310;
        Mon, 13 Jan 2020 02:40:08 -0800 (PST)
Received: from dell ([95.147.198.95])
        by smtp.gmail.com with ESMTPSA id c5sm14403122wmb.9.2020.01.13.02.40.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2020 02:40:07 -0800 (PST)
Date:   Mon, 13 Jan 2020 10:40:28 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Marco Felsch <m.felsch@pengutronix.de>
Cc:     support.opensource@diasemi.com, stwiss.opensource@diasemi.com,
        dmitry.torokhov@gmail.com, robh+dt@kernel.org,
        Adam.Thomson.Opensource@diasemi.com, devicetree@vger.kernel.org,
        kernel@pengutronix.de, linux-input@vger.kernel.org
Subject: Re: [PATCH v2 2/3] input: misc: da9063_onkey: add mode change support
Message-ID: <20200113104028.GB5414@dell>
References: <20191127132304.22924-1-m.felsch@pengutronix.de>
 <20191127132304.22924-3-m.felsch@pengutronix.de>
 <20200108084800.x2doud4v6m3ssz6s@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200108084800.x2doud4v6m3ssz6s@pengutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, 08 Jan 2020, Marco Felsch wrote:

> Hi Lee,
> 
> I forgot to add you to review the mfd part, sorry. Please can you have a
> look on it?

[...]

> > --- a/drivers/mfd/da9062-core.c
> > +++ b/drivers/mfd/da9062-core.c
> > @@ -510,6 +510,7 @@ static const struct regmap_range da9062_aa_writeable_ranges[] = {
> >  	regmap_reg_range(DA9062AA_VLDO1_B, DA9062AA_VLDO4_B),
> >  	regmap_reg_range(DA9062AA_BBAT_CONT, DA9062AA_BBAT_CONT),
> >  	regmap_reg_range(DA9062AA_GP_ID_0, DA9062AA_GP_ID_19),
> > +	regmap_reg_range(DA9062AA_CONFIG_I, DA9062AA_CONFIG_I),
> >  };
> >  
> >  static const struct regmap_range da9062_aa_volatile_ranges[] = {

Looks fine.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
