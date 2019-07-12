Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C226966727
	for <lists+linux-input@lfdr.de>; Fri, 12 Jul 2019 08:44:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725784AbfGLGoM (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 12 Jul 2019 02:44:12 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:37062 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725562AbfGLGoM (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 12 Jul 2019 02:44:12 -0400
Received: by mail-pg1-f193.google.com with SMTP id g15so4093611pgi.4
        for <linux-input@vger.kernel.org>; Thu, 11 Jul 2019 23:44:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=sHcfT+FNfz4p4Kq+IfN/B9Uv5vlYIehMoN0ngTxEYmU=;
        b=FiBYdFugjX+86sPUGPiPSvAYBa5xXqWMx+TSJssnXNFCy4F2nA3KWQV1Zh+ju5ZUbk
         Kcxcg6xwH5XQqBSWXsizxDI69O8+XYplkdBMJQNogBKcEXYIJWX6CuqkEbY2DjzJPYLE
         SNQFtteuHduRVFSFyTu7e/P8ovrIFkapmy1r8KtIVQHhiu56lAS71URa9pbQ48ISJSBm
         k8hGvHjGmEAfBwp4DOihZz+QNOFJ5nuDwGIJQp3IAirv1L0ezxkPBpfRq9YGDz9npoyl
         T5SGI23aXiJiAvFDCiKWFcDGpyxUYnlVd1rP6QO7qBkldZ6CObSZJIvkHMUZipXANGOw
         Vw5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=sHcfT+FNfz4p4Kq+IfN/B9Uv5vlYIehMoN0ngTxEYmU=;
        b=ASBILcnRs6gyZIV8S+mnJeYoRpuGCVSe7sdisZ8T0N//jlnZKRqlw0k+XoCr9TQ6HQ
         tY8kcYi7QiMG5nKGSAuPit8i0J51sl38XK+GxpeDk3SpzJGnrACgl0Yq1Ld9EbLn+K22
         L6wPDQaQ5PrXLZuqSefX34jCSKK3ZQ/0RLwY5lv7nCWp4ucRkhvf9lzWECadXfv3QAS/
         ZOrQnXjc5C5dYCE3JIdZ2DyI8O89JKUJxUgwJbwWw1wPPDIwnfH4LzWx1PvJ3ATvJjrY
         v7irhxhO38Nlhz2K9KlIQN/ji+khgcpelOMessE/97Z/qngD1BmKafI8bwENMoTCi89N
         V3PQ==
X-Gm-Message-State: APjAAAUDO51DlgIe74ThrYM63tnaokACzJS4zK9i0pDRHKr39TBAfqc3
        gUOgRcNa9K+SnGiLN34Bpe8bVdN5Fcg=
X-Google-Smtp-Source: APXvYqwuKbczRBUccr5XvhCn6MjLM7qUgqohWzzt5NizxGFGf5j+OP95DABdSsdEjkEsogG1xQHuag==
X-Received: by 2002:a63:3fc9:: with SMTP id m192mr9076755pga.429.1562913851793;
        Thu, 11 Jul 2019 23:44:11 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id v3sm6888668pfm.188.2019.07.11.23.44.10
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 11 Jul 2019 23:44:11 -0700 (PDT)
Date:   Thu, 11 Jul 2019 23:44:09 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Nick Black <dankamongmen@gmail.com>
Cc:     linux-input@vger.kernel.org, Henrik Rydberg <rydberg@bitmath.org>,
        Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>
Subject: Re: [PATCH] synaptics: whitelist Lenovo T580 SMBus intertouch
Message-ID: <20190712064409.GB150689@dtor-ws>
References: <20190711084343.GA16049@schwarzgerat.orthanc>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190711084343.GA16049@schwarzgerat.orthanc>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Jul 11, 2019 at 04:43:43AM -0400, Nick Black wrote:
> Adds the Lenovo T580 to the SMBus intertouch list for synaptics
> touchpads. I've tested with this for a week now, and it seems a great
> improvement. It's also nice to have the complaint gone from dmesg.
> 
> Signed-off-by: Nick Black <dankamongmen@gmail.com>
> 

Applied, thank you.

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
> 2.22.0
> 
> -- 
> nick black -=- https://www.nick-black.com
> to make an apple pie from scratch,
> you need first invent a universe.

-- 
Dmitry
