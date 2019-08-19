Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 54AAB94CC4
	for <lists+linux-input@lfdr.de>; Mon, 19 Aug 2019 20:26:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728275AbfHSS0i (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 19 Aug 2019 14:26:38 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:36016 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727970AbfHSS0i (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 19 Aug 2019 14:26:38 -0400
Received: by mail-pl1-f195.google.com with SMTP id f19so952687plr.3
        for <linux-input@vger.kernel.org>; Mon, 19 Aug 2019 11:26:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=1onH/yacP56E3Llapycul3pigysohlsDrwsQggNYxVw=;
        b=meggVbl5pbyx3xkD2SRimOSZhLvaYUdmffrBXP+fudI6aiVYOBCoN4093p9q4uBM6a
         euxNsm5rWWDyiLeQLSIaS+hI0edUTDNz117S0gdHlY2cbYk6+3wlnqDMIlAuds5EGl7r
         GxlPnpdCDIhUgH79gYB93FLnXzTxJ09AgmL9o+2SFmXoct0rOJNBowD8xoj+K9BdIjnl
         xpnmRkB4SB7v/QyCr7kBKvaa0FrLDsBw7jNVbkMfmWXWt7VLpZTpHWqaGqHYw1SCcm96
         D7ZMEVk0xo6VYqm78MBjZYtf/WppVkUg95hbXlE5d74TrSQ9VvAwOQZmxkB0dGQT3BfX
         528A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=1onH/yacP56E3Llapycul3pigysohlsDrwsQggNYxVw=;
        b=MbEU64RzVv5QZcEpqxDwioHf0QpqYKGg8sTE1BNOQaU2ASgoZhwDAeX+S0CFFWwm8H
         JDSE4U16wEpfgg7XSZ8tSbET7Qiko1WxzXuYpW8xS8DaRTR56nVBsrNelz3S0jdCpzDC
         j4o1pqnzOFnLEeyamgiYFPmvQu21U6Vqy6TGYyp5xY8No1y1qD75vHXYa39VZ5uaQN58
         puAEBc34TsveU4nKT92hURJwE7eiID3SKlpsBvWN2rUJGoxUqvRQ6zIklIOzsnB2DwCc
         I4uRDvwzL5OFaBjuXKouNgmBlCipFW1WMEQY1HM+LY4g1VRYp78cWPmS0Y7dB82mFwSy
         uZfg==
X-Gm-Message-State: APjAAAU4bfh93OploWotcvAEYyhGIt9/7TsAC+2XMqb3fIyoOu1eTBsf
        ZIFwLXHMYHZ9RhTL5lasV4C16tpb
X-Google-Smtp-Source: APXvYqzBo9qlBv0Lnel2ec+03EXnUSi2nffPGuu13psYrd6V/5TZPUZRdMPWco4hQvPTNa3TQbL9qw==
X-Received: by 2002:a17:902:830c:: with SMTP id bd12mr24441054plb.237.1566239197251;
        Mon, 19 Aug 2019 11:26:37 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id h11sm13918911pgv.5.2019.08.19.11.26.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2019 11:26:36 -0700 (PDT)
Date:   Mon, 19 Aug 2019 11:26:34 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Hui Wang <hui.wang@canonical.com>
Cc:     linux-input@vger.kernel.org
Subject: Re: [PATCH] Input: psmouse - drop all unneeded functions from mouse
 headers
Message-ID: <20190819182634.GN121898@dtor-ws>
References: <20190819135500.3261-1-hui.wang@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190819135500.3261-1-hui.wang@canonical.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Hui,

On Mon, Aug 19, 2019 at 09:55:00PM +0800, Hui Wang wrote:
> Recently we had a building error if we enable the MOUSE_PS2_ALPS while
> disable the MOUSE_PS2_TRACKPOINT, and was fixed by 49e6979e7e92
> ("Input: psmouse - fix build error of multiple definition").
> 
> We could improve that fix by dropping all unneeded functions from
> the header, it is safe to do that since those functions are not
> directly called by psmouse-base.c anymore.
> 
> Signed-off-by: Hui Wang <hui.wang@canonical.com>
> ---
>  drivers/input/mouse/alps.h         |  9 ---------
>  drivers/input/mouse/byd.h          |  9 ---------
>  drivers/input/mouse/cypress_ps2.h  |  9 ---------
>  drivers/input/mouse/elantech.h     | 13 -------------
>  drivers/input/mouse/hgpk.h         |  8 --------
>  drivers/input/mouse/lifebook.h     |  8 --------
>  drivers/input/mouse/logips2pp.h    |  5 -----
>  drivers/input/mouse/sentelic.h     |  9 ---------
>  drivers/input/mouse/touchkit_ps2.h |  6 ------
>  drivers/input/mouse/trackpoint.h   |  6 ------
>  drivers/input/mouse/vmmouse.h      |  9 ---------
>  11 files changed, 91 deletions(-)
> 
> diff --git a/drivers/input/mouse/alps.h b/drivers/input/mouse/alps.h
> index f4bab629739c..74ad10327c48 100644
> --- a/drivers/input/mouse/alps.h
> +++ b/drivers/input/mouse/alps.h
> @@ -326,15 +326,6 @@ struct alps_data {
>  #ifdef CONFIG_MOUSE_PS2_ALPS

Do we need to keep the CONFIG_MOUSE_* guards if we are dropping stubs?

>  int alps_detect(struct psmouse *psmouse, bool set_properties);
>  int alps_init(struct psmouse *psmouse);
> -#else
> -inline int alps_detect(struct psmouse *psmouse, bool set_properties)
> -{
> -	return -ENOSYS;
> -}
> -inline int alps_init(struct psmouse *psmouse)
> -{
> -	return -ENOSYS;
> -}
>  #endif /* CONFIG_MOUSE_PS2_ALPS */

Thanks.

- 
Dmitry
