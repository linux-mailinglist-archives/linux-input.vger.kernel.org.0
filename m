Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 93AAF16011E
	for <lists+linux-input@lfdr.de>; Sun, 16 Feb 2020 00:30:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727680AbgBOXaa (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 15 Feb 2020 18:30:30 -0500
Received: from mail-pf1-f193.google.com ([209.85.210.193]:33414 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726275AbgBOXaa (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 15 Feb 2020 18:30:30 -0500
Received: by mail-pf1-f193.google.com with SMTP id n7so6916931pfn.0;
        Sat, 15 Feb 2020 15:30:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ZBXxDyA8XNQFw91nYiC9lsyYtTrUdOUOLfCOiOqTfp4=;
        b=hUqybxD3QEuGBjSZFahOu65wT1lOZXpP45FJ16K98GRvDXxqu7kjpN/JT2F4IZB48P
         G3VDVGvR59A/ynAxJpDfbXZ4x+EkJu9/TC1pYqGyT+XRXYbXR3Z6Q7XH9PIHQ7mt3XF8
         v6TgCzlzo1ypRaiIjOWtBE6hPEYSxNp5ar6UM2FwngrB9i791lzQWqpdsrZDFX8XaqwQ
         Y+HRHedLYZJiGhgf3GGh542xja+0bvkNjeA0D67o+JGw3Ypr3EJCxQlU2BtDOP1ZSqQP
         cphBK0Z53WDJRNZ+UbLpKVD77HMIG3O5Rt4dGfH3VZviXh52leewNuCPMHpTRbuwVqK6
         0R3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ZBXxDyA8XNQFw91nYiC9lsyYtTrUdOUOLfCOiOqTfp4=;
        b=sRwmo+1o7CEUP4PSrZu658tvjtKYdvS+9sBZvdXFy/fPwEbcZfcKmjLGJBE/7hww78
         /xHCo89+PE98w+voyR8ZfT8OecyqgNOzY4xDiwgrJU0D7I7ucRfMaTwBGpyXKQkSxf7+
         oEF1oBtRi/2lJyIwmEDWYDbwuRNJGyy9wMhub8ujSrufYmpDpaoKFMjm+ouGo4Ot8XXs
         WJaY7TaZ9NumwQXv2HZiRjmG8oTqN/bSaPaNf2J6rc+Pl27vRAxiCwAlaaRPS8gsXfPR
         wX5kJ8E/GU1KKJaBArBlXde6qAnUyjokv1XkHOKMxLxUpN9yFAdKCsPX4TYCmjWi7+1w
         mYGg==
X-Gm-Message-State: APjAAAWhUlXvww4ViL0g644wdjd9u/pP2EUyB6gk8mqPWeKJL05EKmf8
        T/pMUgSvl1EJpznZs26gNJA=
X-Google-Smtp-Source: APXvYqz9/uLmGzxPysVxAfK8UipyDhC1Eajm9z4pTgbVQdyOTSJ77IBh5NDC7hBbEcMSiAQHTHXXnw==
X-Received: by 2002:a62:6842:: with SMTP id d63mr10180113pfc.113.1581809429633;
        Sat, 15 Feb 2020 15:30:29 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id cx18sm11233212pjb.26.2020.02.15.15.30.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Feb 2020 15:30:29 -0800 (PST)
Date:   Sat, 15 Feb 2020 15:30:27 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: cyapa - replace zero-length array with
 flexible-array member
Message-ID: <20200215233027.GH183709@dtor-ws>
References: <20200214172132.GA28389@embeddedor>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200214172132.GA28389@embeddedor>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Feb 14, 2020 at 11:21:32AM -0600, Gustavo A. R. Silva wrote:
> The current codebase makes use of the zero-length array language
> extension to the C90 standard, but the preferred mechanism to declare
> variable-length types such as these ones is a flexible array member[1][2],
> introduced in C99:
> 
> struct foo {
>         int stuff;
>         struct boo array[];
> };
> 
> By making use of the mechanism above, we will get a compiler warning
> in case the flexible array does not occur last in the structure, which
> will help us prevent some kind of undefined behavior bugs from being
> inadvertently introduced[3] to the codebase from now on.
> 
> Also, notice that, dynamic memory allocations won't be affected by
> this change:
> 
> "Flexible array members have incomplete type, and so the sizeof operator
> may not be applied. As a quirk of the original implementation of
> zero-length arrays, sizeof evaluates to zero."[1]
> 
> This issue was found with the help of Coccinelle.
> 
> [1] https://gcc.gnu.org/onlinedocs/gcc/Zero-Length.html
> [2] https://github.com/KSPP/linux/issues/21
> [3] commit 76497732932f ("cxgb3/l2t: Fix undefined behaviour")
> 
> Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>

Applied, thank you.

> ---
>  drivers/input/mouse/cyapa_gen5.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/input/mouse/cyapa_gen5.c b/drivers/input/mouse/cyapa_gen5.c
> index 14239fbd72cf..7f012bfa2658 100644
> --- a/drivers/input/mouse/cyapa_gen5.c
> +++ b/drivers/input/mouse/cyapa_gen5.c
> @@ -250,7 +250,7 @@ struct cyapa_tsg_bin_image_data_record {
>  
>  struct cyapa_tsg_bin_image {
>  	struct cyapa_tsg_bin_image_head image_head;
> -	struct cyapa_tsg_bin_image_data_record records[0];
> +	struct cyapa_tsg_bin_image_data_record records[];
>  } __packed;
>  
>  struct pip_bl_packet_start {
> @@ -271,7 +271,7 @@ struct pip_bl_cmd_head {
>  	u8 report_id;  /* Bootloader output report id, must be 40h */
>  	u8 rsvd;  /* Reserved, must be 0 */
>  	struct pip_bl_packet_start packet_start;
> -	u8 data[0];  /* Command data variable based on commands */
> +	u8 data[];  /* Command data variable based on commands */
>  } __packed;
>  
>  /* Initiate bootload command data structure. */
> @@ -300,7 +300,7 @@ struct tsg_bl_metadata_row_params {
>  struct tsg_bl_flash_row_head {
>  	u8 flash_array_id;
>  	__le16 flash_row_id;
> -	u8 flash_data[0];
> +	u8 flash_data[];
>  } __packed;
>  
>  struct pip_app_cmd_head {
> @@ -314,7 +314,7 @@ struct pip_app_cmd_head {
>  	 * Bit 6-0: command code.
>  	 */
>  	u8 cmd_code;
> -	u8 parameter_data[0];  /* Parameter data variable based on cmd_code */
> +	u8 parameter_data[];  /* Parameter data variable based on cmd_code */
>  } __packed;
>  
>  /* Application get/set parameter command data structure */
> -- 
> 2.25.0
> 

-- 
Dmitry
