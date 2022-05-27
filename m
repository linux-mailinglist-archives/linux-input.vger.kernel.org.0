Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1D73F5358E1
	for <lists+linux-input@lfdr.de>; Fri, 27 May 2022 07:48:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238942AbiE0Fsm (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 27 May 2022 01:48:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235470AbiE0Fsk (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 27 May 2022 01:48:40 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD520B481
        for <linux-input@vger.kernel.org>; Thu, 26 May 2022 22:48:39 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id ge11so3729535pjb.0
        for <linux-input@vger.kernel.org>; Thu, 26 May 2022 22:48:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=MZJOAPhps2K+Xnlmz+lEOdqsR/gBU76QMa1QY6sNX84=;
        b=lWX/3ncVEizVCc86xCdTqph4f10fvGtctPA2VELtzZBSknZHNKAuHPG4ZVU1yW9fVW
         nrP+swwFn3fpFx0ifid82I9XhedlR0ZgUpma2vVpwXC4jiiPnlbhYF8W0NhgUgqogrlk
         3j6nEFs4aSObOKpyGzLADF14IwTPW+JHm1SibD22Wxj3/8IK5MlcuZRXX7V9XjQCYw3U
         feVrEye/zzi6ZiFbT3b/8K6VUuM77PjOZJvUN2G4q7Vj+Btpqn6zp/ixqfaHR3cr0eV2
         Kji2LUEsZRMruFnrp9taZI8jLh62w63tyES/h93Y6Ehy5pHsCXWf6Ogmnx4ERiy/USG/
         F2YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=MZJOAPhps2K+Xnlmz+lEOdqsR/gBU76QMa1QY6sNX84=;
        b=1iH+xoplCYJGzgXfWjv8pJvb6oTp7dQB77eqamlQIu6PXRMG4MQjZt0s9T36stBdBc
         BYOUSyLoCr5opm1ZxZI0v4a3yZSMz7f1AlsewAOTtZcOMCahlXKTbJ6rxQ0JHtSMjTGx
         mT/0yXHjYQWk1MuG5FKN3hamyiUD0xEDY7vHiHupdqV+WHKeVqqIEVwLZPJGT6xniuhj
         3AySqstLg0joZxe7ZoPNBGNJHpZ2UnpofvoBbCd3jxun292Ul/eH1E25mUAwH/LJzjKu
         rWf0dveaREJaNNzwt6os4A1a19FF0TqODn1xP2zGUAXl6xVQ6aEbQERc2zGswYn2SdU4
         2T0g==
X-Gm-Message-State: AOAM530YXf4NI3CF0fRIo0ifCpfUj3qtOIuWOGBL+V/T/EBE2ci6GFt0
        osMMowuJgpFe+f9Ow4VBk7k=
X-Google-Smtp-Source: ABdhPJzyfCRM5ybo5QMB+1RAIXXgKuIlj1EQp2MKPuYsLv/1xYn0ynv5fDuHvCVEjD+G/PrZrDkXfQ==
X-Received: by 2002:a17:90b:4ccb:b0:1df:8238:3f82 with SMTP id nd11-20020a17090b4ccb00b001df82383f82mr6529119pjb.164.1653630519367;
        Thu, 26 May 2022 22:48:39 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:3206:ea0b:ce53:ea86])
        by smtp.gmail.com with ESMTPSA id r18-20020a170902c61200b0015e8d4eb2easm2502629plr.308.2022.05.26.22.48.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 May 2022 22:48:38 -0700 (PDT)
Date:   Thu, 26 May 2022 22:48:36 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-input@vger.kernel.org, Nikita Travkin <nikita@trvn.ru>,
        Michael Srba <Michael.Srba@seznam.cz>
Subject: Re: [PATCH 5/5] Input: zinitix - Support calibration
Message-ID: <YpBmNGtv9GAWrF1m@google.com>
References: <20220410120059.2583849-1-linus.walleij@linaro.org>
 <20220410120059.2583849-5-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220410120059.2583849-5-linus.walleij@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, Apr 10, 2022 at 02:00:59PM +0200, Linus Walleij wrote:
>  
> +	val = zinitix_get_u16_reg(bt541, bt541->eeprom_info_reg);
> +	if (val & ZINITIX_EEPROM_HW_CALIB) {
> +		error = zinitix_calibrate(bt541);
> +		if (error)
> +			return error;
> +	}
> +

My understanding that calibration might take pretty long time. Are you
sure you want it to happen automatically when opening the device? Or
maybe userspace needs to control this?

Thanks.

-- 
Dmitry
