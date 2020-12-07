Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 71F262D0AD4
	for <lists+linux-input@lfdr.de>; Mon,  7 Dec 2020 07:44:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725863AbgLGGoJ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 7 Dec 2020 01:44:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725681AbgLGGoJ (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 7 Dec 2020 01:44:09 -0500
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D623DC0613D0;
        Sun,  6 Dec 2020 22:43:28 -0800 (PST)
Received: by mail-pf1-x444.google.com with SMTP id 131so8813039pfb.9;
        Sun, 06 Dec 2020 22:43:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=qx6YS0mIUJ0wDKcdijGuZVewPoru0FmkFXCzv4uYK/g=;
        b=J7wb/1h6//TSJi0L/gu18/CgEVvCUfSkTdW5Ipbn8Y6cWVwAFTF1GRNT2twJQGQbbI
         rSNrn3BtOD3OXSASTN4MCwacCP0gUzOB99CczYylJ/nqYy9fAa9096Emald2D42mcSaI
         pHwyR0spaBY7/l1HpEBCbtRIJQkdVki50CjdX66b5H355r9pi4CppcdPrv9VGWm7PLdh
         PqOwV2GNvrPSGXSXV82WwUPvJgk4ENt7Vjb3BCsKONfsT/TX7tWFWSPO6TDW9CYIfMXy
         kf0owEWMkFMoL7ULWGcAvJ8DOer7oz+S9j2XgMq7BSrxzzQ87A38yZNHK2B8/MCGoxfL
         4pkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=qx6YS0mIUJ0wDKcdijGuZVewPoru0FmkFXCzv4uYK/g=;
        b=aDrmbEjiMbkh73mr4XqxEy8uP9m3VLStdP6BFQtdz1SnsdMtrlbMyDJ+N5eQA0GgDJ
         UaEr8tyFdphkDbx/syDphCATf2ZAh5s1KsNJBCRwfTRD4z1OAwTHdRPsbARaT6dm44Kw
         qWEs4pjHU5z5l7cHQCYVce04Af9/Yhq8uCnSDwuBDL7uNE8KAkeXSrX6Xt6OiKAbcaDP
         pyReRFuvVDbQJ0riX+M8QTfP+5/mDxUXWzHs5nS/F+fTTTy4lMGLxIXjhWaZjz3mn4lP
         x5LU5zaGu9edBG3qp90xEH6W9+smt8fk+z/BfmyO21pe3HyrMxfNIIIb2FbC+e7JjJmL
         NQ4w==
X-Gm-Message-State: AOAM530g6ALe+k6pudCTh9Vsa6z91NpbCp6KhL4y+Tzxd6OcI0/gpckW
        cQoxHhrtmNFbPyXz1nngecdRJRpFtTk=
X-Google-Smtp-Source: ABdhPJw4KtlvCSJv/e3r2iVipvylZQ0K18ya7T5fV4AOwssNTbfbY9FPKwD149LlfDS9rhTp1ynm7g==
X-Received: by 2002:a17:902:c395:b029:da:9aca:c972 with SMTP id g21-20020a170902c395b02900da9acac972mr14694983plg.32.1607323408407;
        Sun, 06 Dec 2020 22:43:28 -0800 (PST)
Received: from google.com ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id z7sm2596426pgz.43.2020.12.06.22.43.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Dec 2020 22:43:27 -0800 (PST)
Date:   Sun, 6 Dec 2020 22:43:24 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     kholk11@gmail.com
Cc:     robh+dt@kernel.org, rydberg@bitmath.org, priv.luk@gmail.com,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        marijns95@gmail.com, konradybcio@gmail.com,
        martin.botka1@gmail.com, phone-devel@vger.kernel.org,
        devicetree@vger.kernel.org, krzk@kernel.org,
        andy.shevchenko@gmail.com
Subject: Re: [PATCH v9 2/3] Input: Add Novatek NT36xxx touchscreen driver
Message-ID: <X83PDBKOq9bwSI0N@google.com>
References: <20201028221302.66583-1-kholk11@gmail.com>
 <20201028221302.66583-3-kholk11@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201028221302.66583-3-kholk11@gmail.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi AngeloGioacchino,

On Wed, Oct 28, 2020 at 11:13:01PM +0100, kholk11@gmail.com wrote:
> +/**
> + * nt36xxx_set_page - Set page number for read/write
> + * @ts: Main driver structure
> + *
> + * Return: Always zero for success, negative number for error
> + */
> +static int nt36xxx_set_page(struct nt36xxx_i2c *ts, u32 pageaddr)
> +{
> +	u32 data = cpu_to_be32(pageaddr) >> 8;
> +	int ret;
> +
> +	ret = regmap_noinc_write(ts->fw_regmap, NT36XXX_CMD_SET_PAGE,
> +				 &data, sizeof(data));
> +	if (ret)
> +		return ret;
> +
> +	usleep_range(100, 200);
> +	return ret;
> +}

Regmap is supposed to handle paged access for you as long as you set it
up for paged access. Why do you need custom page handling here?

Thanks.

-- 
Dmitry
