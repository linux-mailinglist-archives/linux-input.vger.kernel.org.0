Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3BB3398096
	for <lists+linux-input@lfdr.de>; Wed,  2 Jun 2021 07:13:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229806AbhFBFPe (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 2 Jun 2021 01:15:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229790AbhFBFPe (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 2 Jun 2021 01:15:34 -0400
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E50F6C061574;
        Tue,  1 Jun 2021 22:13:50 -0700 (PDT)
Received: by mail-pf1-x431.google.com with SMTP id u18so1248801pfk.11;
        Tue, 01 Jun 2021 22:13:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=zL1wvqyfXO+HW4dTElnGK+sL97cvui1bm1K7ZTkih8o=;
        b=VTNw7g1ryf4OovZTbyimx1r3x9HsIdmA7EyNVte4VZTvWqAYsMKSj00i/tHOJDeVKp
         7EFafkCuhhOuufThSHijAliYIsF21fxJnKR8ct+TzWplx/gsKaewQks40+34+/Wq3fPv
         JF2779DPA9WVdwOrOyIcpzKtukUoIg8euVIeRJ6wTL1dlyvXvLAjquO1Y0Cwf1yPb3SV
         G+Mw82a9bxf+FXxojCmf0B3UWbKy7kW92o4tGJP+hDSkrWXEsfkzVFF8ZBEoyxlZFpi5
         HTKbKgv39Pr84dS1zUkmAyjtUheieWt3IdsO1Yf62l2MAhieb6Dbjm36Ya5NdOd79Ac3
         8KcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=zL1wvqyfXO+HW4dTElnGK+sL97cvui1bm1K7ZTkih8o=;
        b=pNSdtuMLWy8e9z+dYW4oyr6we96HKe0haXw4AmyIXv1WTsdFf2sOkTt2sKdX2jgb1W
         XeuSbe26V6xQTc27cWDcvkWGPRJrerLuU30njJwdzXiIQe5EMMvM+Hm/2nlL4zWDBssl
         MXgmbt6JHgHihqcXLOIR2/PMAICvJ+dbPt1dYH4aBcd7+P5r5CFRKwbLzx9y+0eNHpDz
         CcZLESh/1QE40NOk7zA2JfoMVFy0VIxWJcq46lH7U2cFFKzKQI2FndUxr2Hr1pv2qob4
         nML9ZxSvwXz6HlkHBtoJfKCokwF3yPE9lfoZI9dbqZUFEhqfWoC61RlLPLABYPyP+b0m
         zhsQ==
X-Gm-Message-State: AOAM533O1R6GmVq4P75ZOS0weeJ38KN/ilaHQzzQ+mwF/kqn3HaLsQPu
        W8wb6rvQ9yRvlf6nYcTd2Ew=
X-Google-Smtp-Source: ABdhPJwS2fPg55Vd/UKuXsco3dr3OjGO9zKoLGadpmct7e2l7DwE/WppZsNFCr5UG8LaFPwfmpVZQQ==
X-Received: by 2002:a63:f815:: with SMTP id n21mr32460255pgh.2.1622610830371;
        Tue, 01 Jun 2021 22:13:50 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:a596:b3cb:1a6:1ee4])
        by smtp.gmail.com with ESMTPSA id f13sm15213630pfa.207.2021.06.01.22.13.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jun 2021 22:13:48 -0700 (PDT)
Date:   Tue, 1 Jun 2021 22:13:46 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Qiang Ma <maqianga@uniontech.com>
Cc:     wangxiongfeng2@huawei.com, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: psmouse - fix psmouse detect function is a NULL
 pointer
Message-ID: <YLcTilSGgW6jMKEy@google.com>
References: <20210519032335.19326-1-maqianga@uniontech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210519032335.19326-1-maqianga@uniontech.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Qiang,

On Wed, May 19, 2021 at 11:23:35AM +0800, Qiang Ma wrote:
> Add a check for psmouse_do_detect(), when the detect is NULL pointer,
> returning false, avoiding this possible NULL pointer exception.
> 
> Signed-off-by: Qiang Ma <maqianga@uniontech.com>
> ---
>  drivers/input/mouse/psmouse-base.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/input/mouse/psmouse-base.c b/drivers/input/mouse/psmouse-base.c
> index 0b4a3039f312..86b095728587 100644
> --- a/drivers/input/mouse/psmouse-base.c
> +++ b/drivers/input/mouse/psmouse-base.c
> @@ -1006,6 +1006,9 @@ static bool psmouse_do_detect(int (*detect)(struct psmouse *, bool),
>  	if (set_properties)
>  		psmouse_apply_defaults(psmouse);
>  
> +	if (!detect)
> +		return false;

There are no protocols that do not define detect() method, so this
condition is not possible.

> +
>  	return detect(psmouse, set_properties) == 0;
>  }
>  

Thanks.

-- 
Dmitry
