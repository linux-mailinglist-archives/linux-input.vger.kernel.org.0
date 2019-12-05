Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7A178113952
	for <lists+linux-input@lfdr.de>; Thu,  5 Dec 2019 02:28:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728011AbfLEB20 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 4 Dec 2019 20:28:26 -0500
Received: from mail-pj1-f68.google.com ([209.85.216.68]:35134 "EHLO
        mail-pj1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727146AbfLEB20 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 4 Dec 2019 20:28:26 -0500
Received: by mail-pj1-f68.google.com with SMTP id w23so577610pjd.2;
        Wed, 04 Dec 2019 17:28:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=q1bx1orIcMH/cHYQUsw5QQoehlqaXp520VMpvYUXChE=;
        b=uTRquQMvORcZjQSCt88VM9GEErEjpDINIyoT+qRbHkzReH7cH1KvquAsKjl3vAORbi
         Kyp85JPnQoekF5/g6andVFUqb5d0eOZJ6aZa/Va4R5iAmiwGNcCg3T2U7gu6JWbfRwXT
         rdK13nqpwIr/cUaqRB3TAKDzNeXXnyXVvzsPpJHIkfPBwTTralWf2fAA9t7nkcOvL41w
         VD855mn5X9ohH90mTC05Q5/sGnGSo7Hoy77oWnBczLVwp02IHewH203d4HYnNpbq/dBs
         5k3lL3As0RrW1dT34wEip3X3Sa2BmbkpuXzWnUZ5BV7kzLIaEK2Mrj8N6Ug1AafMF1dw
         kz3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=q1bx1orIcMH/cHYQUsw5QQoehlqaXp520VMpvYUXChE=;
        b=PKdMyby0+dEnU4aifyYJuoUSOUhUNrlwQaaatf1HAT2e8yLGMYCnZIzQvoNd3DgHwB
         nRjUOOWSDTpDPAtcvgucrA/ZRwAwk24VVxJRVOPTlDcrxlfy5/z1fx/R3YXkAWzOKL2Z
         +L9221vpNYvllz4mf+IekbaiHmV++zcuO4sOiHvT+vkydOZXs96Zajfht9OVARGITmfl
         uwVajWJvNIwNfOdYzqy/+XLgSYl3PEIClaBe3sOwlFdIxM9flTQzT9gU7gSDZCr/drzh
         LxxuANhMemSV0Jug0+Eh/tyYc5NnFTZbI6C5JJm+pYukPmSdmoP/XDRGj9Gi7iZ3FvfZ
         ibaA==
X-Gm-Message-State: APjAAAWxVAP5b66wcClf9SfBpCeObT8X++w/bo7a+kbeM9omna1uiwmi
        XG3/HxQptBvsBLcloqUzF2JHaQKF
X-Google-Smtp-Source: APXvYqxKqo3KZgSxbnGQPW4okKZA7wQjHqs2p5tLeh7eC0HKTGgCWKx5K88qQX6XBobag8DUfAR29w==
X-Received: by 2002:a17:90a:2408:: with SMTP id h8mr6491619pje.123.1575509305369;
        Wed, 04 Dec 2019 17:28:25 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id l9sm8725774pgh.34.2019.12.04.17.28.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2019 17:28:23 -0800 (PST)
Date:   Wed, 4 Dec 2019 17:28:21 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Mathew King <mathewk@chromium.org>
Cc:     linux-kernel@vger.kernel.org, Rajat Jain <rajatja@google.com>,
        Sean Paul <seanpaul@chromium.org>,
        Jesse Barnes <jsbarnes@google.com>,
        Duncan Laurie <dlaurie@google.com>, linux-input@vger.kernel.org
Subject: Re: [PATCH] input: Add privacy screen toggle keycode
Message-ID: <20191205012821.GO50317@dtor-ws>
References: <20191017163208.235518-1-mathewk@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191017163208.235518-1-mathewk@chromium.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Oct 17, 2019 at 10:32:08AM -0600, Mathew King wrote:
> Add keycode for toggling electronic privacy screen to the keycodes
> definition. Some new laptops have a privacy screen which can be toggled
> with a key on the keyboard.
> 
> Signed-off-by: Mathew King <mathewk@chromium.org>

Applied, thank you.

> ---
>  include/uapi/linux/input-event-codes.h | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/include/uapi/linux/input-event-codes.h b/include/uapi/linux/input-event-codes.h
> index 85387c76c24f..05d8b4f4f82f 100644
> --- a/include/uapi/linux/input-event-codes.h
> +++ b/include/uapi/linux/input-event-codes.h
> @@ -649,6 +649,8 @@
>   */
>  #define KEY_DATA			0x277
>  #define KEY_ONSCREEN_KEYBOARD		0x278
> +/* Electronic privacy screen control */
> +#define KEY_PRIVACY_SCREEN_TOGGLE	0x279
>  
>  #define BTN_TRIGGER_HAPPY		0x2c0
>  #define BTN_TRIGGER_HAPPY1		0x2c0
> -- 
> 2.23.0.700.g56cf767bdb-goog
> 

-- 
Dmitry
