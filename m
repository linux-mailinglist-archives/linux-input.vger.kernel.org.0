Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 97E5F49C3E
	for <lists+linux-input@lfdr.de>; Tue, 18 Jun 2019 10:43:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729124AbfFRIn1 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 18 Jun 2019 04:43:27 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:59876 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728818AbfFRIn0 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 18 Jun 2019 04:43:26 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: eballetbo)
        with ESMTPSA id 7A25D26023F
Subject: Re: [PATCH] Input: cros_ec_keyb: mask out extra flags in event_type
To:     Ting Shen <phoenixshen@chromium.org>,
        LKML <linux-kernel@vger.kernel.org>
Cc:     Nicolas Boichat <drinkcat@chromium.org>,
        Pi-Hsun Shih <pihsun@chromium.org>,
        Enrico Granata <egranata@chromium.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Guenter Roeck <groeck@chromium.org>,
        Brian Norris <briannorris@chromium.org>,
        Benson Leung <bleung@chromium.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org,
        Colin Ian King <colin.king@canonical.com>
References: <20190614065438.142867-1-phoenixshen@chromium.org>
From:   Enric Balletbo i Serra <enric.balletbo@collabora.com>
Message-ID: <6a5c8385-6875-d999-a274-bbc592057934@collabora.com>
Date:   Tue, 18 Jun 2019 10:43:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <20190614065438.142867-1-phoenixshen@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org



On 14/6/19 8:54, Ting Shen wrote:
> http://crosreview.com/1341159 added a EC_MKBP_HAS_MORE_EVENTS flag to
> the event_type field, the receiver side should mask out this extra bit when
> processing the event.
> 
> Signed-off-by: Ting Shen <phoenixshen@chromium.org>
> 
> ---
> 
>  drivers/input/keyboard/cros_ec_keyb.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/input/keyboard/cros_ec_keyb.c b/drivers/input/keyboard/cros_ec_keyb.c
> index d5600118159835..38cb6d82d8fe67 100644
> --- a/drivers/input/keyboard/cros_ec_keyb.c
> +++ b/drivers/input/keyboard/cros_ec_keyb.c
> @@ -237,7 +237,7 @@ static int cros_ec_keyb_work(struct notifier_block *nb,
>  	if (queued_during_suspend && !device_may_wakeup(ckdev->dev))
>  		return NOTIFY_OK;
>  
> -	switch (ckdev->ec->event_data.event_type) {
> +	switch (ckdev->ec->event_data.event_type & EC_MKBP_EVENT_TYPE_MASK) {
>  	case EC_MKBP_EVENT_KEY_MATRIX:
>  		pm_wakeup_event(ckdev->dev, 0);
>  
> 

Applied for chrome-platform-5.3

Thanks,
~ Enric
