Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F4B9215CFA
	for <lists+linux-input@lfdr.de>; Mon,  6 Jul 2020 19:22:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729551AbgGFRWl (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 6 Jul 2020 13:22:41 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:26212 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729297AbgGFRWl (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 6 Jul 2020 13:22:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1594056159;
        h=from:from:reply-to:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=lA+RHGhMqAzGJ1ls+U/TLssCbOeODGIQqdu8s4E0s7k=;
        b=dtrxMcpAXzw+Jxq/PZ4DAt7DpEZQfgZDbjFLVFebh/GqgA2JyMHZnZRiAFmih8fSxqs0b/
        PKo40MKVObF3hbb0cYIf7/MsnZlom6WKRfTl7uvXCYDggfenGwBIrICwHyQwS6o7pSHlO5
        Nt+JnioYq0EFvaBxz3d1w9dpyL+Se84=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-202-VR0GchM8OyCtusfrtWQ7Nw-1; Mon, 06 Jul 2020 13:22:37 -0400
X-MC-Unique: VR0GchM8OyCtusfrtWQ7Nw-1
Received: by mail-qv1-f69.google.com with SMTP id a12so19592250qvt.22
        for <linux-input@vger.kernel.org>; Mon, 06 Jul 2020 10:22:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:reply-to:to:cc:date
         :in-reply-to:references:organization:user-agent:mime-version
         :content-transfer-encoding;
        bh=lA+RHGhMqAzGJ1ls+U/TLssCbOeODGIQqdu8s4E0s7k=;
        b=EkNUOfCJk8MZ2Cj4PsRRQSLLVa36M2ot+Z6VKf6btIbFFA6rfFbZq66CXNPi1bs1gm
         Ag0vu+HtChTKpKyQSquoboGcGZ1598xuG7hJtQddGxPIznEnAlg+gjoA5/XPYQe0id+n
         69unYYE0YvPCYzkXAkOi9C9bgWmBI8SY8MeTKOq7vegVubcTebuzB/Sx4qPp5KTeBAqf
         7/qpg/IlQsNV9l2byTlp6aY8JkxKiT9bpM56mOYTfKsSn9MkFQ1MO2IXxmAo0pmZzWdI
         0Fq+cIawIBb46dxi8hD/zBwVSCNF0SJw7rBhq6ggFzlBMllWDkvDlGpyBb7N8UENPHZn
         GeTQ==
X-Gm-Message-State: AOAM533mVlA4TzufQgKFH+wfsQAKPwk3DRYzfA8neVqDZSioI6/uyk4Y
        aNFHbSnSoWoIPPM38mpcp1DIPU9I0AAQqE1S8qcpczaLCmFtAsA58PVp9HriiAuNCmj8RcQi5gM
        NFE5qdV6wp74j9b/LtT5f388=
X-Received: by 2002:a05:6214:72c:: with SMTP id c12mr45379503qvz.76.1594056157146;
        Mon, 06 Jul 2020 10:22:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzqJSu168JvbM66NiFDodqfcshO3V3kFDEU5JUhxTjCQi+4k9Gi9OaaiE8zyZb4GGxaILrYKA==
X-Received: by 2002:a05:6214:72c:: with SMTP id c12mr45379478qvz.76.1594056156902;
        Mon, 06 Jul 2020 10:22:36 -0700 (PDT)
Received: from Whitewolf.lyude.net (pool-108-49-102-102.bstnma.fios.verizon.net. [108.49.102.102])
        by smtp.gmail.com with ESMTPSA id f15sm18865654qka.120.2020.07.06.10.22.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2020 10:22:36 -0700 (PDT)
Message-ID: <2f68590f3352c6384efdf9838f16837d5990d1fe.camel@redhat.com>
Subject: Re: [PATCH] input/synaptics: enable InterTouch for ThinkPad X1E 1st
 gen
From:   Lyude Paul <lyude@redhat.com>
Reply-To: lyude@redhat.com
To:     K900 <me@0upti.me>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Gaurav Agrawal <agrawalgaurav@gnome.org>,
        Yussuf Khalil <dev@pp3345.net>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Dennis Kadioglu <denk@eclipso.email>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Joe Perches <joe@perches.com>, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Date:   Mon, 06 Jul 2020 13:22:35 -0400
In-Reply-To: <20200703143457.132373-1-me@0upti.me>
References: <20200703143457.132373-1-me@0upti.me>
Organization: Red Hat
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.3 (3.36.3-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

FWIW it's not placebo, it's why I always immediately notice when starting up a
new ThinkPad sample from lenovo if RMI4 is enabled or not :).

Anyway thank you for the patch, assuming you double-checked that clicking with
the clickpad still works (I made this mistake last time when trying to enable
this for the second generation X1 extreme):

Reviewed-by: Lyude Paul <lyude@redhat.com>

On Fri, 2020-07-03 at 17:34 +0300, K900 wrote:
> From: Ilya Katsnelson <me@0upti.me>
> 
> Tested on my own laptop, touchpad feels slightly more responsive with
> this on, though it might just be placebo.
> 
> Signed-off-by: Ilya Katsnelson <me@0upti.me>
> ---
>  drivers/input/mouse/synaptics.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/input/mouse/synaptics.c b/drivers/input/mouse/synaptics.c
> index 758dae8d6500..4b81b2d0fe06 100644
> --- a/drivers/input/mouse/synaptics.c
> +++ b/drivers/input/mouse/synaptics.c
> @@ -179,6 +179,7 @@ static const char * const smbus_pnp_ids[] = {
>  	"LEN0093", /* T480 */
>  	"LEN0096", /* X280 */
>  	"LEN0097", /* X280 -> ALPS trackpoint */
> +	"LEN0099", /* X1 Extreme 1st */
>  	"LEN009b", /* T580 */
>  	"LEN200f", /* T450s */
>  	"LEN2044", /* L470  */

