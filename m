Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 66ECD48395D
	for <lists+linux-input@lfdr.de>; Tue,  4 Jan 2022 01:07:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231309AbiADAHU (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 3 Jan 2022 19:07:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229487AbiADAHU (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 3 Jan 2022 19:07:20 -0500
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEE8FC061761
        for <linux-input@vger.kernel.org>; Mon,  3 Jan 2022 16:07:19 -0800 (PST)
Received: by mail-pj1-x1031.google.com with SMTP id rj2-20020a17090b3e8200b001b1944bad25so1301241pjb.5
        for <linux-input@vger.kernel.org>; Mon, 03 Jan 2022 16:07:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=5BxnTgQB4nJdFC2opeu2Ee95DXGs20YgQ85AN02gizM=;
        b=Ao5Ji2ejmoCD6Ao7/8BXJk55oVZ4mJ71Lo3R0babK+1qVMcX+6uTRH9yDCtc1EtEkd
         miZRKOPS2HDG0B3tpB+189V+gQDYcb8rdSahmtjj1chIM7Un6WoIQGaTM/pfuUM99LL2
         wJWJ86q291udot5kBTzm3y1+lJckhRy2JV7e2KQtSDB0GgzvLwrrvUhA2g6YCTT8cB+e
         kfPcOzW2pEnGEogpSpzu+PU5+roxAbvqRw4fK5q3v/Yjs5KxdzAahPKBweU6VpYwBhNA
         5m1iQBrSC7Yu3jQQp7k4FsCIHtZ5BbOB+NtNCMwNvPRecpetPcq2hbVEdSuTBBwY3HSE
         Va2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=5BxnTgQB4nJdFC2opeu2Ee95DXGs20YgQ85AN02gizM=;
        b=nehzMGMg5ngt0KkA/BGEemQARkWWAvBH0Tn92O7iiCeusPG5KP7R5kY35xyb1oNXk6
         tOLHSCz1yb3BdDtVgGNq0BEbZLnVK9PNu6u5KbB3oMG6CtIuuISMg7AxJkLSPlCPD+Um
         JXIa89CnCWFlCHpNB98wb9WjlbfMjeH7eXw3ysmmTLXZrQtGwYjKXNkBf96wGltyruNo
         sgm1o9Fie2VhI7vB00iry+l28uUCm0hSjSVvX1Z+E4d5QQTpa3SYqYkSdN+1aaGxXMPh
         o9ZD/4wkqh6955aru4EfJ9qBwVar/tXnlRg/mA+wL+Sraj/UA+Eq9PpqxgDCga29WRcH
         2vZQ==
X-Gm-Message-State: AOAM531y8Oef5xTHIt2jsbPxwPv4xYu29ad0y2c1yGsZpkYe+B9RIWf1
        FmKbgwTWwK8x3OH2ZC70Ma4=
X-Google-Smtp-Source: ABdhPJzBqHKg3VjmXlL8QBKLpfXAUuIFzaKqtoyc6LfXLMQKPzZAEbcnsxDwCWjXm0GCegIn6XAdpQ==
X-Received: by 2002:a17:90b:1807:: with SMTP id lw7mr58872522pjb.98.1641254839035;
        Mon, 03 Jan 2022 16:07:19 -0800 (PST)
Received: from google.com ([2620:15c:202:201:a7d6:43d7:bbe3:3573])
        by smtp.gmail.com with ESMTPSA id gk13sm39761677pjb.43.2022.01.03.16.07.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jan 2022 16:07:17 -0800 (PST)
Date:   Mon, 3 Jan 2022 16:07:15 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Paul Menzel <pmenzel@molgen.mpg.de>
Cc:     linux-input@vger.kernel.org, Greg KH <gregkh@linuxfoundation.org>,
        Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: drivers/input/touchscreen/melfas_mip4.c: Maintainer email
 address bounces
Message-ID: <YdOPs6B7v2g6QwaL@google.com>
References: <3aee941d-dc0c-6dbc-19f9-ecfd486376a7@molgen.mpg.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3aee941d-dc0c-6dbc-19f9-ecfd486376a7@molgen.mpg.de>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Dec 21, 2021 at 08:49:22PM +0100, Paul Menzel wrote:
> Dear Linux folks,
> 
> 
> My message to the MELFAS MIP4 Touchscreen maintainer just bounced:
> 
>     MELFAS MIP4 TOUCHSCREEN DRIVER
>     M:      Sangwon Jee <jeesw@melfas.com>
> 
>     Delivery failed: jeesw@melfas.com
>     172.16.0.32 does not like recipient.
>     Remote host said[Response Message]: 550 sorry, your recipient address is
> not in my local list
>     Giving up on 172.16.0.32.
> 
> What is the procedure in that case? Does the Linux Foundations have
> contacts?

Let me see id I can find a new contact for this.

Thanks.

-- 
Dmitry
