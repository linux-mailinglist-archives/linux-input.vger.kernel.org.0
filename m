Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 04BFE3D8B18
	for <lists+linux-input@lfdr.de>; Wed, 28 Jul 2021 11:49:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231665AbhG1JtO (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 28 Jul 2021 05:49:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:54662 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231443AbhG1JtO (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 28 Jul 2021 05:49:14 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6A9DD600D4;
        Wed, 28 Jul 2021 09:49:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1627465753;
        bh=ej9Z9tK7jGX7NOdRFmxHijFqJ4V4hf/u1f5qjOfGy3Y=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=rZnKw9VbWVt0TRksUp+EF1cFek7Z4Qyq82Ft4LmNtfGy0qZclZyOOSkJWBlUcw0C+
         P7bTTjqcv4RsXNihi1uIj/By0zncbwi/TRrJ3q/LYzVKdyLfVWjcnxgTznjgMxv4/0
         XcT9ejRt7F00ifvm6VvDhqYNzIXPZyIYzW7OFkbFdSZw3HOvleMpqfkei0mDgpGc3N
         RHbDC6NU3L4L1bo9aVPYw9lz7dpvzc2J1fpQ7/vqZHG2BITLv5CXnI9gbo9SgrfNHR
         wfGJFz0aV4uG1QWdqyCPWUi+E6xZ7fwLchJ5dwoAMn0lzHZTiDjZWnt03AsFPiXUu0
         J9F6Z/EQaGvgg==
Date:   Wed, 28 Jul 2021 11:49:10 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Douglas Anderson <dianders@chromium.org>
cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: i2c-hid: goodix: Use the devm variant of
 regulator_register_notifier()
In-Reply-To: <20210720090736.1.Idc6db7d0f2c2ecc6e533e5b918a651a66f337b2f@changeid>
Message-ID: <nycvar.YFH.7.76.2107281149050.8253@cbobk.fhfr.pm>
References: <20210720090736.1.Idc6db7d0f2c2ecc6e533e5b918a651a66f337b2f@changeid>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, 20 Jul 2021, Douglas Anderson wrote:

> In commit 18eeef46d359 ("HID: i2c-hid: goodix: Tie the reset line to
> true state of the regulator") I added a call to
> regulator_register_notifier() but no call to unregister. That's a
> bug. Let's use the devm variant to handle the unregistering.
> 
> Fixes: 18eeef46d359 ("HID: i2c-hid: goodix: Tie the reset line to true state of the regulator")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> 
>  drivers/hid/i2c-hid/i2c-hid-of-goodix.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hid/i2c-hid/i2c-hid-of-goodix.c b/drivers/hid/i2c-hid/i2c-hid-of-goodix.c
> index 31a4c229fdb7..52674149a275 100644
> --- a/drivers/hid/i2c-hid/i2c-hid-of-goodix.c
> +++ b/drivers/hid/i2c-hid/i2c-hid-of-goodix.c
> @@ -132,7 +132,7 @@ static int i2c_hid_of_goodix_probe(struct i2c_client *client,
>  	 */
>  	mutex_lock(&ihid_goodix->regulator_mutex);
>  	ihid_goodix->nb.notifier_call = ihid_goodix_vdd_notify;
> -	ret = regulator_register_notifier(ihid_goodix->vdd, &ihid_goodix->nb);
> +	ret = devm_regulator_register_notifier(ihid_goodix->vdd, &ihid_goodix->nb);
>  	if (ret) {
>  		mutex_unlock(&ihid_goodix->regulator_mutex);
>  		return dev_err_probe(&client->dev, ret,

Applied, thanks Doug.

-- 
Jiri Kosina
SUSE Labs

