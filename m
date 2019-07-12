Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7487E6672B
	for <lists+linux-input@lfdr.de>; Fri, 12 Jul 2019 08:45:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725784AbfGLGpv (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 12 Jul 2019 02:45:51 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:45916 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725562AbfGLGpv (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 12 Jul 2019 02:45:51 -0400
Received: by mail-pg1-f194.google.com with SMTP id o13so4072862pgp.12;
        Thu, 11 Jul 2019 23:45:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=WVEuBlOLUfWxKbVV7NSLPs8TfkbQJXMhSdA1Mb2pHBE=;
        b=Uum6G0ucFxVdC1KYMsFaD11FEvAToSkq6p+s2QPDsnzWHqrKu3OjlftKj8w8l9EDic
         oXzcVKKGN/wai8cKHqjudKS7Zj5ff5FHgP0f76WQEkrAKZrTmbTTn41iXgqyN0ltvI2J
         7YVDrnMYiIQpFOshg7P1hvjVaNV/Tlg0wNGPUdAun9hM4xkcA50yspofS/epjZ520icF
         vKA6ue/QGRydwDewf+YAI1K2JtWmO6XcL5kSovEZCbcjO1H3cummkVESmIF5p30wBO+T
         7DEZXwPCL6jfIVv78ifrzYE+WGtinv8CLl5Lrgx5COnqxwn8Ozr2/bS/1yTbbFQl1IcL
         FwGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=WVEuBlOLUfWxKbVV7NSLPs8TfkbQJXMhSdA1Mb2pHBE=;
        b=JQvUl33jIqdViVfBznyiD9pXyChH6IzHunyQ4fyJqieod1+QbnY0Mrn/EcYerZRzbm
         rl30KeKxBzlHPS281UE/LMfQ4OqzWyDrQOdgUivjPQ4WuSw0fSPK3Qgyb4VU0hQM83FR
         5ANqz/Ey9qtmlFqbaUtGXEKt7fQ8dsmQLAzDY4+FLiiWblZ6w4pfsHrJ4CN5HOxLoQt1
         swwbmkzI3hfYTXHofYizD6hEuef3v1YMtNPUg8ohIc2krQSLjZmX1Yz5/1FmkjemEsrc
         GF2UBAjgCXYIVTwVzgmGKNx4OzNEraaBkNSZ1+IbGdZYGd/OKomFqsqYoAIGUpNkCNYw
         mB0A==
X-Gm-Message-State: APjAAAXNhpq4arVQT5c5nJWLR9HKYFKwIuT1krodXKpWpjPwZ8cjTUkr
        n2ZxO6+UdRVw8IbKZ68ry9I=
X-Google-Smtp-Source: APXvYqyM5MklCwa0pJjbvMdV0/heJpbvwAnKht2Z1/CGRLXiXHdN4mwQa7cr9nvgwNAre/Ey3/kvyQ==
X-Received: by 2002:a63:d30f:: with SMTP id b15mr8832962pgg.341.1562913950727;
        Thu, 11 Jul 2019 23:45:50 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id g18sm11998595pgm.9.2019.07.11.23.45.49
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 11 Jul 2019 23:45:50 -0700 (PDT)
Date:   Thu, 11 Jul 2019 23:45:48 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Kai-Heng Feng <kai.heng.feng@canonical.com>
Cc:     benjamin.tissoires@redhat.com, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: synaptics - enable RMI on ThinkPad T580
Message-ID: <20190712064548.GC150689@dtor-ws>
References: <20190711105436.6290-1-kai.heng.feng@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190711105436.6290-1-kai.heng.feng@canonical.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On Thu, Jul 11, 2019 at 06:54:36PM +0800, Kai-Heng Feng wrote:
> Like the ThinkPad T560 case, now we can use RMI on T580 to have a more
> responsive touchpad.
> 
> Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>

I already applied Nick Black'spatch for this, thanks.

> ---
>  drivers/input/mouse/synaptics.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/input/mouse/synaptics.c b/drivers/input/mouse/synaptics.c
> index b8ec301025b7..eb3f642967ab 100644
> --- a/drivers/input/mouse/synaptics.c
> +++ b/drivers/input/mouse/synaptics.c
> @@ -175,6 +175,7 @@ static const char * const smbus_pnp_ids[] = {
>  	"LEN0092", /* X1 Carbon 6 */
>  	"LEN0096", /* X280 */
>  	"LEN0097", /* X280 -> ALPS trackpoint */
> +	"LEN009b", /* T580 */
>  	"LEN200f", /* T450s */
>  	"LEN2054", /* E480 */
>  	"LEN2055", /* E580 */
> -- 
> 2.17.1
> 

-- 
Dmitry
