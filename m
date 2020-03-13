Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A224D184811
	for <lists+linux-input@lfdr.de>; Fri, 13 Mar 2020 14:28:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726526AbgCMN2U (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 13 Mar 2020 09:28:20 -0400
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:43251 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726426AbgCMN2U (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 13 Mar 2020 09:28:20 -0400
X-Originating-IP: 83.155.44.161
Received: from classic (mon69-7-83-155-44-161.fbx.proxad.net [83.155.44.161])
        (Authenticated sender: hadess@hadess.net)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id D8EC424000C;
        Fri, 13 Mar 2020 13:28:16 +0000 (UTC)
Message-ID: <f7519cf8de6bd6982ae1064d0352370f2d725444.camel@hadess.net>
Subject: Re: [PATCH v2 2/2] Input: goodix - Ignore spurious interrupts
From:   Bastien Nocera <hadess@hadess.net>
To:     Dmitry Mastykin <dmastykin@astralinux.ru>,
        Hans de Goede <hdegoede@redhat.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Date:   Fri, 13 Mar 2020 14:28:16 +0100
In-Reply-To: <20200312145009.27449-2-dmastykin@astralinux.ru>
References: <20200312145009.27449-1-dmastykin@astralinux.ru>
         <20200312145009.27449-2-dmastykin@astralinux.ru>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.35.92 (3.35.92-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, 2020-03-12 at 17:50 +0300, Dmitry Mastykin wrote:
> The goodix panel sends spurious interrupts after a 'finger up' event,
> which always cause a timeout.
> The timeout was reported as touch_num == 0 and caused reading of
> not ready buffer and false key release event.
> In this patch the timeout is reported as ENOMSG and not processed.

I think a better commit message would be:
"
Input: goodix - Fix spurious key release events

The goodix panel sends spurious interrupts after a 'finger up' event,
which always cause a timeout.
We were exiting the interrupt handler by reporting touch_num == 0, but
this was still processed as valid and caused the code to use the
uninitialised point_data, creating spurious key release events.

Report an error from the interrupt handler so as to avoid processing
invalid point_data further.
"

Looks good otherwise.

> 
> Signed-off-by: Dmitry Mastykin <dmastykin@astralinux.ru>
> ---
> Changes in v2:
> - Improve commit message 
> ---
>  drivers/input/touchscreen/goodix.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/input/touchscreen/goodix.c
> b/drivers/input/touchscreen/goodix.c
> index daf1781..0e14719 100644
> --- a/drivers/input/touchscreen/goodix.c
> +++ b/drivers/input/touchscreen/goodix.c
> @@ -329,7 +329,7 @@ static int goodix_ts_read_input_report(struct
> goodix_ts_data *ts, u8 *data)
>  	 * The Goodix panel will send spurious interrupts after a
>  	 * 'finger up' event, which will always cause a timeout.
>  	 */
> -	return 0;
> +	return -ENOMSG;
>  }
>  
>  static void goodix_ts_report_touch_8b(struct goodix_ts_data *ts, u8
> *coor_data)

