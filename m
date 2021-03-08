Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E526A3307A6
	for <lists+linux-input@lfdr.de>; Mon,  8 Mar 2021 06:44:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234459AbhCHFoX (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 8 Mar 2021 00:44:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234604AbhCHFoT (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 8 Mar 2021 00:44:19 -0500
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDB1FC06174A
        for <linux-input@vger.kernel.org>; Sun,  7 Mar 2021 21:44:18 -0800 (PST)
Received: by mail-pj1-x102e.google.com with SMTP id j14-20020a17090a588eb02900cefe2daa2cso951951pji.0
        for <linux-input@vger.kernel.org>; Sun, 07 Mar 2021 21:44:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=vXczNKVdUrkylvusaQrGarXM6+h+i2b23aLZnlokEz4=;
        b=n5Mp3a5o+1CwsNRzO62plZ9MIX1bIDLwuRuFEyBcMaDSNungdYzNhdr+ow9lzT7Ncw
         S5abPfDWXX5WUdPubxheBUd3tI7aVaw6YNrt5RT7owTdsYnHw7a4o7g0gnSzcjXcr3kK
         NlYox60IYb1/Rlzjy3XJYctc5zPNIRQlApJwMDcN2dJOdg1uvq3p2BNUKJItH+jYHTRJ
         23aIc8tEOc8VRZoAcJX9TH5ioRnsMZRN5yxwwpjfXWaxgwO2VPvNtaRW4+QPV0OMjfh/
         mBFtYm6XEf1Zi5nJBmOAYwDEDMqMDFKcjB1J8Nl3GnD6Yz72Eycn+8pYKQ4mDG5fJS/f
         QfAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=vXczNKVdUrkylvusaQrGarXM6+h+i2b23aLZnlokEz4=;
        b=ILgnXeDJQzJa4h6HH7AKLTTQCKsaNG+WVkLzW4mN/e/QRUjAX8OAi7O20qjE5AnGZw
         Jb2Or7dPQrSXhVK6ktu2qvGn2u4n00wZ8ubP9u7YfVmQWuY9fs9m/wttBaGhA7SlRUKK
         1Wm7FWGhQo442NrBBZd6sIq9CW0tyV5vGqx1Ftzl9B3ASbP+IEY6kgG2YmaNK4r/vX2U
         WARqBiJ5/7OBSbrVHV+CpiJCPi93wzQVStYsbpzWPJDcy0DfUcK20u4f6+PRKGQIw9ZI
         9OX0TcFbWHUMjxEkUr1xxZ/kUwt0hIZlGDJcQoT7PQJxsRnlDymmao8m+TPmqEUVk4yN
         QZDA==
X-Gm-Message-State: AOAM530HIf+77feRzVKrKAe+GbzM6HoEJI/ELdJFCHFNBLhw69TozLyD
        o4T0VoARcaxm1zH9XAjc2Vw=
X-Google-Smtp-Source: ABdhPJzsBcyiq7IdK9oJX15tMQkzveopwaqMkXWlsy4CpWbJlYwyqo2c1agH8FePjtj/6cI6R++N/w==
X-Received: by 2002:a17:902:b589:b029:e6:2875:aa4c with SMTP id a9-20020a170902b589b02900e62875aa4cmr2969881pls.71.1615182258300;
        Sun, 07 Mar 2021 21:44:18 -0800 (PST)
Received: from google.com ([2620:15c:202:201:39e0:7b5c:9fa7:f6e0])
        by smtp.gmail.com with ESMTPSA id d24sm8737444pfr.139.2021.03.07.21.44.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Mar 2021 21:44:17 -0800 (PST)
Date:   Sun, 7 Mar 2021 21:44:15 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Lucas Stach <l.stach@pengutronix.de>
Cc:     Sebastian Reichel <sebastian.reichel@collabora.com>,
        linux-input@vger.kernel.org, kernel@pengutronix.de,
        patchwork-lst@pengutronix.de
Subject: Re: [PATCH v3 3/5] Input: exc3000 - fix firmware version query for
 device in bootloader
Message-ID: <YEW5r/AbFgp3fwab@google.com>
References: <20210125182527.1225245-1-l.stach@pengutronix.de>
 <20210125182527.1225245-4-l.stach@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210125182527.1225245-4-l.stach@pengutronix.de>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Jan 25, 2021 at 07:25:25PM +0100, Lucas Stach wrote:
> If the device is stuck in bootloader (maybe due to blank or corrupted
> application firmware) it won't answer a query for the firmware version.
> Fall back to returning the bootloader version in that case.
> 
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>

Applied, thank you.

-- 
Dmitry
