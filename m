Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1ABF27199D
	for <lists+linux-input@lfdr.de>; Tue, 23 Jul 2019 15:43:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726593AbfGWNnU (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 23 Jul 2019 09:43:20 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:33796 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726520AbfGWNnU (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 23 Jul 2019 09:43:20 -0400
Received: by mail-lj1-f194.google.com with SMTP id p17so41107967ljg.1
        for <linux-input@vger.kernel.org>; Tue, 23 Jul 2019 06:43:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Djge7jjEKW6dk12oeJlR0b+sSxRQxnh8lqoxibP7Za0=;
        b=Gl4iUEewUJl1wgc5FHCIsVbuQ4xXCnJjpug6w4ex48i3MdcgBb0wbJuZogwjhPKRHh
         ZN2MucY0eSKVz7AfxyNVSfTbY6PYei1kqgu8Wj+VRdFZP2Yqjk34VtuUNg9sLRL4C5UY
         qjH3/8L9hbLN1HZYEaO+9hjNzppaCZtSfxc9PKwXNrVwy/7luu/BdE0PznP+9sPOAK78
         1YCYjZeWsCVVA3Mh6Wd7dI2+cWUXXOCD/54IPovyBk2GjYXuu1ZzI6zhIh9E28qqMby4
         Ysz/ziGw8/A0go3Oxt4v2FnaSHOeJz5YghC9OXum9h/kNo+1oZn2jDUyKG5JLrfaYepM
         +xyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Djge7jjEKW6dk12oeJlR0b+sSxRQxnh8lqoxibP7Za0=;
        b=abMRRVsB+egfhd0WUlFRBDEE8MCRo4IZy02a6czAto8u3/i2gY/Wqg8q1KfLMKnumh
         WPBmPIRc1bkF0IC66yCJz526B83xoHT+9wcDe6rNl5L2lNeSVVzcJtxMqiiH/ISjZvQQ
         cyUkm5TL/ooE1Ah3Fo94/R2kXE3q6qtxVFsWCDC5LLvYaeHk1ErohxdH6V4NM005qyXl
         xVsGk0kbrlIc00kWeYu+2T++TAJzawWuJIKyhA3e+d64J1U94tQdjAD5Q67kfHUdmjv4
         x4jcnQA5xl1nZKzAddOpgvptLPTsHVFUnr5U71ZfqZgpZBTy06vkLY+JQpL93Jy0JsEs
         BEGQ==
X-Gm-Message-State: APjAAAXZ39+DQxj6limBee49Hz9okeNGuQ7JtE+D2wMusF7F8sdoR8Gw
        T7bn/WuRn8zj4VU20eNP6Mj2iqG7Wp8=
X-Google-Smtp-Source: APXvYqxf8gWGb1GL7BRJdDwIERqDkXsLJsbsEvK27eldq1dbPujRkx+h/LJjSFIjmoIO52oM5dAAVg==
X-Received: by 2002:a2e:864d:: with SMTP id i13mr33041196ljj.92.1563889398132;
        Tue, 23 Jul 2019 06:43:18 -0700 (PDT)
Received: from localhost ([188.170.223.67])
        by smtp.gmail.com with ESMTPSA id t5sm7915165ljj.10.2019.07.23.06.43.17
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 23 Jul 2019 06:43:17 -0700 (PDT)
Date:   Tue, 23 Jul 2019 16:43:15 +0300
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Nikolas Nyby <nikolas@gnu.org>
Cc:     linux-input@vger.kernel.org, trivial@kernel.org
Subject: Re: [PATCH] Input: applespi: fix trivial typo in struct description
Message-ID: <20190723134315.GB845@penguin>
References: <20190722153023.9912-1-nikolas@gnu.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190722153023.9912-1-nikolas@gnu.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Jul 22, 2019 at 11:30:23AM -0400, Nikolas Nyby wrote:
> This fixes a typo in the keyboard_protocol description.
> coodinate -> coordinate.
> 
> Signed-off-by: Nikolas Nyby <nikolas@gnu.org>

Applied, thank you.

> ---
>  drivers/input/keyboard/applespi.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/input/keyboard/applespi.c b/drivers/input/keyboard/applespi.c
> index 548737e7aeda..8c7d12c95d2f 100644
> --- a/drivers/input/keyboard/applespi.c
> +++ b/drivers/input/keyboard/applespi.c
> @@ -134,10 +134,10 @@ struct keyboard_protocol {
>   * struct tp_finger - single trackpad finger structure, le16-aligned
>   *
>   * @origin:		zero when switching track finger
> - * @abs_x:		absolute x coodinate
> - * @abs_y:		absolute y coodinate
> - * @rel_x:		relative x coodinate
> - * @rel_y:		relative y coodinate
> + * @abs_x:		absolute x coordinate
> + * @abs_y:		absolute y coordinate
> + * @rel_x:		relative x coordinate
> + * @rel_y:		relative y coordinate
>   * @tool_major:		tool area, major axis
>   * @tool_minor:		tool area, minor axis
>   * @orientation:	16384 when point, else 15 bit angle
> -- 
> 2.22.0
> 

-- 
Dmitry
