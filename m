Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 218CB487E65
	for <lists+linux-input@lfdr.de>; Fri,  7 Jan 2022 22:40:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230059AbiAGVke (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 7 Jan 2022 16:40:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229922AbiAGVkd (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 7 Jan 2022 16:40:33 -0500
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73E24C061574
        for <linux-input@vger.kernel.org>; Fri,  7 Jan 2022 13:40:33 -0800 (PST)
Received: by mail-pj1-x1035.google.com with SMTP id 59-20020a17090a09c100b001b34a13745eso5932839pjo.5
        for <linux-input@vger.kernel.org>; Fri, 07 Jan 2022 13:40:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ivBHSiSZWG0e87d3M859ot2oCf+lCFYJNUXYZBGD1d8=;
        b=iwQoJ8gmjPCJ9jk1SFC7MYRoeWMPcaLcLxTSTJzp/NRrtJ7TyiKlDZPndYISUIYl3L
         DNCCL49mEahXicpvJvdaTrw5FfmyOIfnylEtw8L9ABIOpkuaSiEWP1FnaCWAnsyyb1Ti
         O8VWJmQwCZ5cSXFx+D7mZ0yZCwu7wTxTNaxsLA2czUrPLIXkPQ+AqSF5A1vfg0GWlvtL
         /OiVVkXVpM+3gCFgxR2FzskMLRQm0fP45c25hZP93dNkFx2FHDOeF8CH8lLM1safKKGO
         Fz3nLBgypK4OtkevZUkMqJds1FQYFm59YYOCFdyNwDgjrJdo3dAGqF8RxE8GHzYyp71/
         Twjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ivBHSiSZWG0e87d3M859ot2oCf+lCFYJNUXYZBGD1d8=;
        b=5zwZrzpohLWPi3gwZeDyU2sE4TpEizcUNnyRhKHpcAUKX1f5g8Tn8Lx2IoywRnLDNC
         CMl7H3q9Uke3TzsaXbXHQHWX70yKGPp3JSazQ6oT2BCXYzmtZhPz8JN+ZYuc1yLPU5B3
         VO7Ykm/8G3esF4gtODJck+ue40V4d8Jzzo1C8EBq3znB2yTGMznJjJnjo/gTOov0kDTo
         DVuCeWXWgYbCwkXiHacL0UgvxUURBmkOOR82Xmtbgvgmsde8abOpSrcTLkEWfEJf43Xj
         081ngzsOuSTch5enpD6hpV4pbtWxDl2LDPuu/9hF4vLkO3F9+5S1FrM1jsM/ju1R7+Ns
         LJFw==
X-Gm-Message-State: AOAM533ZYwGxuM8x7fqDX8w8YXNvGoQ6jvWAy/uEuLXt4Q97xsC7WP1H
        /nCT7i5oJBBodx43/jkgif0=
X-Google-Smtp-Source: ABdhPJzCodPUEc8Z3GX4ptwRX5uvsXIjYgrrK5qzvuiDvGUZnERQndeUmb+tmMjh1vxf6i7ZZNfiAw==
X-Received: by 2002:a17:902:9883:b0:149:8429:6e6e with SMTP id s3-20020a170902988300b0014984296e6emr50245505plp.34.1641591632697;
        Fri, 07 Jan 2022 13:40:32 -0800 (PST)
Received: from google.com ([2620:15c:202:201:4a85:a3d:72a9:2009])
        by smtp.gmail.com with ESMTPSA id w76sm6417700pff.21.2022.01.07.13.40.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jan 2022 13:40:31 -0800 (PST)
Date:   Fri, 7 Jan 2022 13:40:29 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Angela Czubak <acz@semihalf.com>
Cc:     linux-input@vger.kernel.org, upstream@semihalf.com
Subject: Re: [PATCH 01/18] HID: add haptics page defines
Message-ID: <YdizTSpqoHbh8eEZ@google.com>
References: <20211221191743.1893185-1-acz@semihalf.com>
 <20211221191743.1893185-2-acz@semihalf.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211221191743.1893185-2-acz@semihalf.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Angela,

On Tue, Dec 21, 2021 at 07:17:26PM +0000, Angela Czubak wrote:
> Introduce haptic usages as defined in HID Usage Tables specification.
> 
> Signed-off-by: Angela Czubak <acz@semihalf.com>
> ---

This needs to be sent to Jiri/Benjamin.

FWIW

Reviewed-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

>  include/linux/hid.h | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 
> diff --git a/include/linux/hid.h b/include/linux/hid.h
> index f453be385bd4..70679bf820ce 100644
> --- a/include/linux/hid.h
> +++ b/include/linux/hid.h
> @@ -153,6 +153,7 @@ struct hid_item {
>  #define HID_UP_TELEPHONY	0x000b0000
>  #define HID_UP_CONSUMER		0x000c0000
>  #define HID_UP_DIGITIZER	0x000d0000
> +#define HID_UP_HAPTIC		0x000e0000
>  #define HID_UP_PID		0x000f0000
>  #define HID_UP_BATTERY		0x00850000
>  #define HID_UP_HPVENDOR         0xff7f0000
> @@ -301,6 +302,28 @@ struct hid_item {
>  #define HID_DG_TOOLSERIALNUMBER	0x000d005b
>  #define HID_DG_LATENCYMODE	0x000d0060
>  
> +#define HID_HP_SIMPLECONTROLLER	0x000e0001
> +#define HID_HP_WAVEFORMLIST	0x000e0010
> +#define HID_HP_DURATIONLIST	0x000e0011
> +#define HID_HP_AUTOTRIGGER	0x000e0020
> +#define HID_HP_MANUALTRIGGER	0x000e0021
> +#define HID_HP_AUTOTRIGGERASSOCIATEDCONTROL 0x000e0022
> +#define HID_HP_INTENSITY	0x000e0023
> +#define HID_HP_REPEATCOUNT	0x000e0024
> +#define HID_HP_RETRIGGERPERIOD	0x000e0025
> +#define HID_HP_WAVEFORMVENDORPAGE	0x000e0026
> +#define HID_HP_WAVEFORMVENDORID	0x000e0027
> +#define HID_HP_WAVEFORMCUTOFFTIME	0x000e0028
> +#define HID_HP_WAVEFORMNONE	0x000e1001
> +#define HID_HP_WAVEFORMSTOP	0x000e1002
> +#define HID_HP_WAVEFORMCLICK	0x000e1003
> +#define HID_HP_WAVEFORMBUZZCONTINUOUS	0x000e1004
> +#define HID_HP_WAVEFORMRUMBLECONTINUOUS	0x000e1005
> +#define HID_HP_WAVEFORMPRESS	0x000e1006
> +#define HID_HP_WAVEFORMRELEASE	0x000e1007
> +#define HID_HP_VENDORWAVEFORMMIN	0x000e2001
> +#define HID_HP_VENDORWAVEFORMMAX	0x000e2fff
> +
>  #define HID_BAT_ABSOLUTESTATEOFCHARGE	0x00850065
>  
>  #define HID_VD_ASUS_CUSTOM_MEDIA_KEYS	0xff310076
> -- 
> 2.34.1.307.g9b7440fafd-goog
> 

-- 
Dmitry
