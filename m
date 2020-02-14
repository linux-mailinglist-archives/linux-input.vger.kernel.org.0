Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6BCE815CF59
	for <lists+linux-input@lfdr.de>; Fri, 14 Feb 2020 02:07:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727782AbgBNBHU (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 13 Feb 2020 20:07:20 -0500
Received: from mail-pl1-f195.google.com ([209.85.214.195]:43301 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727609AbgBNBHU (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 13 Feb 2020 20:07:20 -0500
Received: by mail-pl1-f195.google.com with SMTP id p11so3039556plq.10
        for <linux-input@vger.kernel.org>; Thu, 13 Feb 2020 17:07:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=um2+50l9kutTaZ/Y8kj8ydGfJkqH+7dBlv0rN5t/rYo=;
        b=vWPB/dVJRdbka83RpsFHS4++qIt5J5u8oaUqKFwhIcowmXKB8XhZcJT64I6zIhI105
         lii6hRqO8BFWapvUQ133GTG8lAGrWllJru6EgCyX1j6sLi9mW4s20BBEqH3b0+6zil0n
         7b78kxaG7TEYXkUJS5g8UmUqwr+JVQ6BTePBlSMn4srzADXHTHaQsaUDPENvL+pnLPjR
         0Z004OHGxi7yr/1m8lQU79LzPKnuRdzCNb/R2Z8ycevVHzmWjhS2bdyiIfCFnPcHm5nQ
         aL6ztm3hFHs+Zo79xE0eoJPraHbfelDM3qtXrCYfNBw+F8DA2EfsqJOcEg8V31Xezl57
         yV0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=um2+50l9kutTaZ/Y8kj8ydGfJkqH+7dBlv0rN5t/rYo=;
        b=YWcRqBpkIRSrpqP4cy1kPOZMxnvAvB+xTYzyzuYs2FBwmWOkT7fnAgAiZF3LtI6+mh
         27QJ9M1k4pQBxv8IXuTUW1vxPMTMzQMZDxBbh4plGk4Y6wtnhMo2ITx0hlvSXLi9qrrU
         SHKBvw4RtYw00b/mmqEpbie0QG9klSwSV7QJqjLuEI4S1ALJyQtbiwWu+fUmqXbJ0QtU
         HBkY6IbqA5xYSsmNpO8WCkeXhCGaGQi0REjsw1ZGkFdJNdaJdj/l781m0hI+WZXFqhIu
         FaWLmUVVF8lBkpB096LO9mRM0DXONuzsQUhXZhwZApWPQ3QcK8I6XvsoPdgg2AmN01vE
         VLig==
X-Gm-Message-State: APjAAAVd+F9bcd2MSwcnUVkQuzVGcwZAoAocpXgqpmBpkR85045VswDW
        /BGkTf3iZkhmP9Jhy9nTLyg=
X-Google-Smtp-Source: APXvYqyLUxm+wIR3nUgYq4bjakySTcaQpuXZMHuUS2B48CiyGFE4L82rkFiLi0PojoWML2WzP5CzhQ==
X-Received: by 2002:a17:90a:db0f:: with SMTP id g15mr389673pjv.40.1581642439451;
        Thu, 13 Feb 2020 17:07:19 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id f13sm4619195pfk.64.2020.02.13.17.07.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2020 17:07:18 -0800 (PST)
Date:   Thu, 13 Feb 2020 17:07:16 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Gaurav Agrawal <agrawalgaurav@gnome.org>
Cc:     linux-input@vger.kernel.org, benjamin.tissoires@redhat.com
Subject: Re: Input: synaptics - enable SMBus on ThinkPad L470
Message-ID: <20200214010716.GD183709@dtor-ws>
References: <CADdtggVzVJq5gGNmFhKSz2MBwjTpdN5YVOdr4D3Hkkv=KZRc9g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CADdtggVzVJq5gGNmFhKSz2MBwjTpdN5YVOdr4D3Hkkv=KZRc9g@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sat, Feb 08, 2020 at 12:20:16AM +0530, Gaurav Agrawal wrote:
> Add touchpad LEN2044 to the list, as it is capable of working with
> psmouse.synaptics_intertouch=1
> 
> Signed-off-by: Gaurav Agrawal <agrawalgaurav@gnome.org>

Applied, thank you.

> ---
>  drivers/input/mouse/synaptics.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/input/mouse/synaptics.c b/drivers/input/mouse/synaptics.c
> index 1ae6f8bba9ae1..6947772cfc405 100644
> --- a/drivers/input/mouse/synaptics.c
> +++ b/drivers/input/mouse/synaptics.c
> @@ -179,6 +179,7 @@ static const char * const smbus_pnp_ids[] = {
>      "LEN0097", /* X280 -> ALPS trackpoint */
>      "LEN009b", /* T580 */
>      "LEN200f", /* T450s */
> +    "LEN2044", /* L470  */
>      "LEN2054", /* E480 */
>      "LEN2055", /* E580 */
>      "SYN3052", /* HP EliteBook 840 G4 */

-- 
Dmitry
