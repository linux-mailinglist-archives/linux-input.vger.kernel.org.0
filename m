Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EC797EF1A0
	for <lists+linux-input@lfdr.de>; Tue,  5 Nov 2019 01:03:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730216AbfKEACi (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 4 Nov 2019 19:02:38 -0500
Received: from mail-pl1-f195.google.com ([209.85.214.195]:36074 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728234AbfKEACh (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 4 Nov 2019 19:02:37 -0500
Received: by mail-pl1-f195.google.com with SMTP id g9so8473634plp.3
        for <linux-input@vger.kernel.org>; Mon, 04 Nov 2019 16:02:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=AXkNCsCXHm4gaq0nMzH+UcUHAhV/SKKJVjfm7wgZHrY=;
        b=JEA7NByN73hqO3sthQVtCr2fP72qVXoAtizdtVV9o3HZo90G96F+T34WFOJZA+7tBM
         xJJCeTK1JtqroQnbiLXTtJ/yr6ZAhzLv0WmcYCK9/5zm4zlORLJ/qf6R8rok5Tk2Eiax
         UKiW1Zr9GVSRWRyFJ84nY8FQV9RBM2eI2ZM+RGezhxKBgu2jckUJ14GRvmwoHCKnv+7b
         ZI5RY52BhSFvwFwwpHSiTzgM8gg7D2PSezt2op7R/pA5Bukk9aYrJvDSU0p4fG4i/Wft
         2ZpaHt0xBxMRRMQsY6g66Abc+enbiuwfhrRFeshzhHsZd0xCyE+qqrnZnnpLUiZszKAm
         /2gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=AXkNCsCXHm4gaq0nMzH+UcUHAhV/SKKJVjfm7wgZHrY=;
        b=MpP7QOObKfe+FsvvCFi99L41+jNUZBZ/xZ7jNsGnmzgrBn3bGlgIBmthu+o5Una518
         RNlBWvJEMqBtHkqI0NJSelWhe+MJur6mLkj+Ye9YnC/4ExLRQiCeTc7aDyBKEFeNNaCj
         4Vrl2lpIQrU+eoHaFx/Zw5JsH/h0jrt9sjtmR0SOGwZcYjaPipITEokvpTQ22RcZtDAv
         iIG1ODKZnE2wwJFbraIfnctlrzY1IJ6JnBQIzHrX2ZADz42hOGwt8pJ+QdVvi5aYIwZS
         uabH2HqpzG5U1k8AsQm2Q/aRazZLFwT2LdDZrIQo8AfpxBjossFOhN2UNUmGVeP4/oP5
         QkoA==
X-Gm-Message-State: APjAAAU1kP99kSF5z5S7EGae04oc/wmC2xd2MP3zvUGuizk6PtxDiM/p
        sJDPp3R5+QB5mbmZHUqX0vI=
X-Google-Smtp-Source: APXvYqyaOBRrXe/TP954GpPEF6L0RhrSgIXJkTQ/aUqn7BzIlc6LM3ovnagVesKD86MD4EVddyRulQ==
X-Received: by 2002:a17:902:9687:: with SMTP id n7mr31134318plp.166.1572912156398;
        Mon, 04 Nov 2019 16:02:36 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id x25sm24876962pfq.73.2019.11.04.16.02.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2019 16:02:35 -0800 (PST)
Date:   Mon, 4 Nov 2019 16:02:33 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Lucas Stach <l.stach@pengutronix.de>
Cc:     linux-input@vger.kernel.org, patchwork-lst@pengutronix.de,
        kernel@pengutronix.de
Subject: Re: [PATCH resend 1/3] Input: synaptics-rmi4 - fix video buffer size
Message-ID: <20191105000233.GQ57214@dtor-ws>
References: <20191104114454.10500-1-l.stach@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191104114454.10500-1-l.stach@pengutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Nov 04, 2019 at 12:44:52PM +0100, Lucas Stach wrote:
> The video buffer used by the queue is a vb2_v4l2_buffer, not a plain
> vb2_buffer. Using the wrong type causes the allocation of the buffer
> storage to be too small, causing a out of bounds write when
> __init_vb2_v4l2_buffer initializes the buffer.
> 
> Fixes: 3a762dbd5347 ("[media] Input: synaptics-rmi4 - add support
>                       for F54 diagnostics")
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>

Applied, thank you.

> ---
>  drivers/input/rmi4/rmi_f54.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/input/rmi4/rmi_f54.c b/drivers/input/rmi4/rmi_f54.c
> index 710b02595486..4841354af0d7 100644
> --- a/drivers/input/rmi4/rmi_f54.c
> +++ b/drivers/input/rmi4/rmi_f54.c
> @@ -359,7 +359,7 @@ static const struct vb2_ops rmi_f54_queue_ops = {
>  static const struct vb2_queue rmi_f54_queue = {
>  	.type = V4L2_BUF_TYPE_VIDEO_CAPTURE,
>  	.io_modes = VB2_MMAP | VB2_USERPTR | VB2_DMABUF | VB2_READ,
> -	.buf_struct_size = sizeof(struct vb2_buffer),
> +	.buf_struct_size = sizeof(struct vb2_v4l2_buffer),
>  	.ops = &rmi_f54_queue_ops,
>  	.mem_ops = &vb2_vmalloc_memops,
>  	.timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC,
> -- 
> 2.20.1
> 

-- 
Dmitry
