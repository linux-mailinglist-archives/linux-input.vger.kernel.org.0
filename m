Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D9525471106
	for <lists+linux-input@lfdr.de>; Sat, 11 Dec 2021 03:55:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234502AbhLKC6k (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 10 Dec 2021 21:58:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229886AbhLKC6k (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 10 Dec 2021 21:58:40 -0500
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2A0CC061714
        for <linux-input@vger.kernel.org>; Fri, 10 Dec 2021 18:55:04 -0800 (PST)
Received: by mail-pl1-x632.google.com with SMTP id u17so7470590plg.9
        for <linux-input@vger.kernel.org>; Fri, 10 Dec 2021 18:55:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=u6UINwAiRcE7wCLiBJfKgp3sPIgnXfXsL6Z+nwcpcjQ=;
        b=CsLkmCfwScNkFQzisxx5X7CdpWcAYttE5CXSt11wYX27YwRub+X325mVOnmvuS3RRi
         tCUcOWagAS0f+cMgU+m0GNMBV0ljZ/KHGodLvGy854B/89a9GW5UwcfnL0FIr6/tTneq
         ikWmPapoMZD2IhtXBi52l6eZtezu8X1+4Co5GWM3TiROC2XduiPVH9j02O56lDoSc51M
         TKMOMgOnFv63ZfM9aoVzEjx7gbfve37L2ksMAkORWPTwSaqzg4WPS7M+DI0f0y7fv9ze
         r4lfnM1xKx4u+RGYdgVIeW/0zYuo2b9KuYfkhA8Nd1uNOnt7Byi3cczs/PSq6SO5+spO
         VdiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=u6UINwAiRcE7wCLiBJfKgp3sPIgnXfXsL6Z+nwcpcjQ=;
        b=bSiNVpbBK9H3uhuOUcWGN0RMnxjbp+YF8fubUyvIp7LmF8dHrGgZcrNgiJnHQLL/9F
         3F+RCVLeycPnqVvNF/Q2UdQtbXnfT2JvAYL+LexWUVH/Z52KvNluJgzMuE64Hdq1EG4q
         CgxtKpOrefD+ctcXkrmMbAxw8BT41e7st7+UhBq6SOInOOlNXtO5WJe+wUre3iAeqXnF
         riyr2g1e52g38mQHbH89Glwz4Qwmi52YBqOq+0KN90IV2lXODnF8zQUfimq5rZeu9DLl
         EUZjzYlqW4noj+T2ocmG3hydyN91lM72ZvKL9dbuCwCT/HGhujbyWsA6HDRRSt3Waove
         cEpg==
X-Gm-Message-State: AOAM532IQNL4nZVK0RArLQ7RUxAMTmGwg/6HdgnygmIYsNwFfVxrcD4L
        fN0APjwuxEfoA5QSe1WPRq4oPcm+zdE=
X-Google-Smtp-Source: ABdhPJxoTWx3CSIC9VRdeWZGqmeq2mtoWIFoEn7Wd3EQjB03g3J4YdNuDwqvenBRc7cFYfrO8DVsOg==
X-Received: by 2002:a17:90b:3b8d:: with SMTP id pc13mr27932007pjb.112.1639191304015;
        Fri, 10 Dec 2021 18:55:04 -0800 (PST)
Received: from google.com ([2620:15c:202:201:749:db5e:6dc8:be24])
        by smtp.gmail.com with ESMTPSA id c18sm5102860pfl.201.2021.12.10.18.55.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Dec 2021 18:55:02 -0800 (PST)
Date:   Fri, 10 Dec 2021 18:54:59 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Alexander Potapenko <glider@google.com>
Cc:     dvyukov@google.com, elver@google.com, linux-input@vger.kernel.org
Subject: Re: [PATCH] Input: psmouse: check the result of PSMOUSE_CMD_GET*
 commands
Message-ID: <YbQTA9NWoDAknJKB@google.com>
References: <20211129143845.1472453-1-glider@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211129143845.1472453-1-glider@google.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Alexander,

On Mon, Nov 29, 2021 at 03:38:45PM +0100, Alexander Potapenko wrote:
> Execution of a PSMOUSE_CMD_GET* command may fail, leaving the output
> buffer uninitialized. Make sure to check the return value of
> ps2_command() and bail out before checking the buffer contents.
> 
> The use of uninitialized data in genius_detect() was detected by KMSAN,
> other places were fixed for the sake of uniformity.
> 
> Signed-off-by: Alexander Potapenko <glider@google.com>
> ---
>  drivers/input/mouse/psmouse-base.c | 21 ++++++++++++++++-----
>  1 file changed, 16 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/input/mouse/psmouse-base.c b/drivers/input/mouse/psmouse-base.c
> index 0b4a3039f312f..a3305653ce891 100644
> --- a/drivers/input/mouse/psmouse-base.c
> +++ b/drivers/input/mouse/psmouse-base.c
> @@ -546,13 +546,16 @@ static int genius_detect(struct psmouse *psmouse, bool set_properties)
>  {
>  	struct ps2dev *ps2dev = &psmouse->ps2dev;
>  	u8 param[4];
> +	int error;
>  
>  	param[0] = 3;
>  	ps2_command(ps2dev, param, PSMOUSE_CMD_SETRES);
>  	ps2_command(ps2dev,  NULL, PSMOUSE_CMD_SETSCALE11);
>  	ps2_command(ps2dev,  NULL, PSMOUSE_CMD_SETSCALE11);
>  	ps2_command(ps2dev,  NULL, PSMOUSE_CMD_SETSCALE11);
> -	ps2_command(ps2dev, param, PSMOUSE_CMD_GETINFO);
> +	error = ps2_command(ps2dev, param, PSMOUSE_CMD_GETINFO);
> +	if (error)
> +		return error;

If we care about this I think we should care about errors from the rest
of ps2_command()s. Otherwise we might have buffer initialized, but we
are still checking potential garbage in it.

Thanks.

-- 
Dmitry
