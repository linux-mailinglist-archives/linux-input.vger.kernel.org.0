Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 66FAB1834EB
	for <lists+linux-input@lfdr.de>; Thu, 12 Mar 2020 16:26:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727658AbgCLP0I (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 12 Mar 2020 11:26:08 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:42330 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727481AbgCLP0I (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 12 Mar 2020 11:26:08 -0400
Received: by mail-lf1-f66.google.com with SMTP id t21so5169539lfe.9;
        Thu, 12 Mar 2020 08:26:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=vcwEiIvK8xFYmZdS3HZshdr30V5CMjH5zNok9mf+3j4=;
        b=aWwG3D/HDLwXLtiMCMQ2zz+GLNhT+J0GyVV3PTijJB4JYuXpIFqbJBiHxruRsHL9kd
         TgO+JVChJCjXZLFS5UIbZtnJmW7+KErZM41BN30u8+uyS7yrOcVtX9xq0MQQI2242icr
         uesfIet8csgun8dRY6Poe/Y0AHkc+ir8chYNlRXyXePty8IEqEYrbOWo7XpF532D7Pzm
         Bg6ft+2DpFOmMgykLFjhO0cQljFPaeSY14Y/rFRHNX+OglY9MoOXiGZTi/1CzRN9ZRi1
         0nVDknOiGLS+QKWBzsfmUJQOVNpdmOuiePdlOdhZD3nNey2OKnsHKhHdj52nP03CUIOl
         ubeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=vcwEiIvK8xFYmZdS3HZshdr30V5CMjH5zNok9mf+3j4=;
        b=MnFT65hB6CZGYVG/XfM53whLBYxIPw1dBB6sCF2K598vsc11zNBmNUlcJaG+jUfwdH
         642K2DkTuqEKA3lrk0toU3UizMmCSCwbkq4d1Bj92sAv7IqMd3hcjvwlK+ETmmDrAhqN
         0X8TnDGboQXeD7pcWO7J4f1emQ4PPupAQgimtjGUTJeYT7vHxGSbY3XSh1oO5dhPLxAR
         F/L2GQng7Guqu1XJbWu9q8IQHG/xHEFB3U43D7OMD0ROYkRXYYDaS6CQS/Qcr6vknZON
         GJOeuoTZzmUsgtH2CeXy9ph8AFFSCJAcpjaQTlFoDcLunett0+5/J7yaYXJzwDCln6fj
         adhA==
X-Gm-Message-State: ANhLgQ0Y3i44V+PBU4qPqoRaFuSlWp8XtKArXh9BgyOT5OlURSLRw4Aq
        2dZczGb/prnzabc3cJ2NFh9ZWwDT
X-Google-Smtp-Source: ADFU+vvaq/JyiP4oj8+1MUltq5sI4O0Fm9ziOCRBV0SAnQIG3y6m1pLj6MSPfBQIfOXGjoTL6S11UQ==
X-Received: by 2002:a05:6512:2031:: with SMTP id s17mr5048223lfs.151.1584026766438;
        Thu, 12 Mar 2020 08:26:06 -0700 (PDT)
Received: from [192.168.2.145] (94-29-39-224.dynamic.spd-mgts.ru. [94.29.39.224])
        by smtp.googlemail.com with ESMTPSA id c6sm3660876ljj.71.2020.03.12.08.26.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Mar 2020 08:26:05 -0700 (PDT)
Subject: Re: [PATCH v7 13/48] Input: atmel_mxt_ts - add regulator control
 support
To:     Jiada Wang <jiada_wang@mentor.com>, jikos@kernel.org,
        benjamin.tissoires@redhat.com, rydberg@bitmath.org,
        dmitry.torokhov@gmail.com, nick@shmanahar.org, bsz@semihalf.com
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        erosca@de.adit-jv.com, Andrew_Gabbasov@mentor.com
References: <20200212084218.32344-1-jiada_wang@mentor.com>
 <20200212084218.32344-14-jiada_wang@mentor.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <a4045caf-0ad4-9642-808b-61bdcc575ac2@gmail.com>
Date:   Thu, 12 Mar 2020 18:26:05 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200212084218.32344-14-jiada_wang@mentor.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

12.02.2020 11:41, Jiada Wang пишет:
> From: Nick Dyer <nick.dyer@itdev.co.uk>
> 
> Allow the driver to optionally manage enabling/disable power to the touch
> controller itself. If the regulators are not present then use the deep
> sleep power mode instead.
> 
> For a correct power on sequence, it is required that we have control over
> the RESET line.

...
>  /* Firmware files */
>  #define MXT_FW_NAME		"maxtouch.fw"
> @@ -215,6 +217,9 @@ enum t100_type {
>  #define MXT_CRC_TIMEOUT		1000	/* msec */
>  #define MXT_FW_RESET_TIME	3000	/* msec */
>  #define MXT_FW_CHG_TIMEOUT	300	/* msec */
> +#define MXT_REGULATOR_DELAY	150	/* msec */
> +#define MXT_CHG_DELAY	        100	/* msec */
                                ^
Please use a tab instead of white-spaces. Same for MXT_COMMS_RETRIGEN in
the patch #4.
