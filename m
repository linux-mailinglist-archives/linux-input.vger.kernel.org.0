Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CBA5A11D50B
	for <lists+linux-input@lfdr.de>; Thu, 12 Dec 2019 19:15:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730266AbfLLSPa (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 12 Dec 2019 13:15:30 -0500
Received: from iolanthe.rowland.org ([192.131.102.54]:52848 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1730234AbfLLSPa (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 12 Dec 2019 13:15:30 -0500
Received: (qmail 3202 invoked by uid 2102); 12 Dec 2019 13:15:29 -0500
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 12 Dec 2019 13:15:29 -0500
Date:   Thu, 12 Dec 2019 13:15:29 -0500 (EST)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Andrey Konovalov <andreyknvl@google.com>
cc:     Dmitry Vyukov <dvyukov@google.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        <linux-usb@vger.kernel.org>, <linux-input@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Alexander Potapenko <glider@google.com>,
        Marco Elver <elver@google.com>
Subject: Re: [PATCH RFC 1/2] kcov: collect coverage from interrupts
In-Reply-To: <95e7a12ac909e7de584133772efc7ef982a16bbb.1576170740.git.andreyknvl@google.com>
Message-ID: <Pine.LNX.4.44L0.1912121313030.1352-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, 12 Dec 2019, Andrey Konovalov wrote:

> This change extends kcov remote coverage support to allow collecting
> coverage from interrupts in addition to kernel background threads.
> 
> To collect coverage from code that is executed in interrupt context, a
> part of that code has to be annotated with kcov_remote_start/stop() in a
> similar way as how it is done for global kernel background threads. Then
> the handle used for the annotations has to be passed to the
> KCOV_REMOTE_ENABLE ioctl.
> 
> Internally this patch adjusts the __sanitizer_cov_trace_pc() compiler
> inserted callback to not bail out when called from interrupt context.
> kcov_remote_start/stop() are updated to save/restore the current per
> task kcov state in a per-cpu area (in case the interrupt came when the
> kernel was already collecting coverage in task context). Coverage from
> interrupts is collected into pre-allocated per-cpu areas, whose size is
> controlled by the new CONFIG_KCOV_IRQ_AREA_SIZE.
> 
> This patch also cleans up some of kcov debug messages.
> 
> Signed-off-by: Andrey Konovalov <andreyknvl@google.com>
> ---

> diff --git a/drivers/usb/gadget/udc/dummy_hcd.c b/drivers/usb/gadget/udc/dummy_hcd.c
> index 4c9d1e49d5ed..faf84ada71a5 100644
> --- a/drivers/usb/gadget/udc/dummy_hcd.c
> +++ b/drivers/usb/gadget/udc/dummy_hcd.c
> @@ -38,6 +38,7 @@
>  #include <linux/usb/gadget.h>
>  #include <linux/usb/hcd.h>
>  #include <linux/scatterlist.h>
> +#include <linux/kcov.h>
>  
>  #include <asm/byteorder.h>
>  #include <linux/io.h>

That's the only change to this driver.  As such, it doesn't appear to 
be needed, judging by the patch description.

Alan Stern

