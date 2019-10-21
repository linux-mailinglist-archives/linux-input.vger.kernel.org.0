Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 752E4DE52C
	for <lists+linux-input@lfdr.de>; Mon, 21 Oct 2019 09:17:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727047AbfJUHRJ convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-input@lfdr.de>); Mon, 21 Oct 2019 03:17:09 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:50863 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726480AbfJUHRJ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 21 Oct 2019 03:17:09 -0400
Received: from mail-pg1-f198.google.com ([209.85.215.198])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <kai.heng.feng@canonical.com>)
        id 1iMRwA-0007ip-Uc
        for linux-input@vger.kernel.org; Mon, 21 Oct 2019 07:17:07 +0000
Received: by mail-pg1-f198.google.com with SMTP id w22so1476606pgj.18
        for <linux-input@vger.kernel.org>; Mon, 21 Oct 2019 00:17:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=NrPSbslH25B3u0Wnm1UPikuaVrqPH1g/KMvMVJca9Ss=;
        b=KK8oucOqa7O2NAEaXR4cxts/zGeC48Yei6Wq/UmkHzvRdQGVLqDQlIq77FQ95ktOiY
         3sqj6v4W8sX+PN+ELbTYPv2uUC5HY0E2izgtbZIOP3sCYAX16i4sX0JUFWq+u4U1Flk3
         3v4W3H0yujmXUhyAN7EUlBiopaIK49TKh+sR7D2McHu+dzeCL/vSga/ZwFTBmZcgz7FB
         68FAor0IbczRE1CHpgxJYCDMtEws+zAYX9kN9C9BDywboBMDSjfej2KnvPSs4oTFOpP/
         O1lO5mDWypFF9ce3LFjvxjmiM1bPYGdvqsz46+A/s4zyfbQbdzU478kGOkWmZSr33+L8
         eZcw==
X-Gm-Message-State: APjAAAWC3JhaB0OHLPqXwTbC3ny739jatua3DkP9js4kXk1d0lZXskt5
        L7ZB5P49hPP0tIJuJxUy08GBvWWYGKap2asKYISSyjv+jZo74ubYLp+br4kb9ZXviCZp/xOysov
        HYYZLRhRoCluaxUhaGJj5wvtqBlyuGti2s7KU0tQQ
X-Received: by 2002:a62:e90d:: with SMTP id j13mr21415592pfh.153.1571642225554;
        Mon, 21 Oct 2019 00:17:05 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyUXXrkaLYvPoj+gKP4y9v7p28dWov3C5r+PVKJTbPj9sTKFbvNufDFlXNYzETKD4N6KqAVQg==
X-Received: by 2002:a62:e90d:: with SMTP id j13mr21415573pfh.153.1571642225242;
        Mon, 21 Oct 2019 00:17:05 -0700 (PDT)
Received: from [10.101.46.71] (61-220-137-37.HINET-IP.hinet.net. [61.220.137.37])
        by smtp.gmail.com with ESMTPSA id c1sm18839744pfb.135.2019.10.21.00.17.03
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 21 Oct 2019 00:17:04 -0700 (PDT)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3594.4.19\))
Subject: Re: [PATCH] HID: i2c-hid: Send power-on command after reset
From:   Kai Heng Feng <kai.heng.feng@canonical.com>
In-Reply-To: <20191020214718.150906-1-hdegoede@redhat.com>
Date:   Mon, 21 Oct 2019 15:17:01 +0800
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org
Content-Transfer-Encoding: 8BIT
Message-Id: <097221D1-9115-41C6-8208-6A69FA0EA0CA@canonical.com>
References: <20191020214718.150906-1-hdegoede@redhat.com>
To:     Hans de Goede <hdegoede@redhat.com>
X-Mailer: Apple Mail (2.3594.4.19)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Hans,

> On Oct 21, 2019, at 5:47 AM, Hans de Goede <hdegoede@redhat.com> wrote:
> 
> Before commit 67b18dfb8cfc ("HID: i2c-hid: Remove runtime power
> management"), any i2c-hid touchscreens would typically be runtime-suspended
> between the driver loading and Xorg or a Wayland compositor opening it,
> causing it to be resumed again. This means that before this change,
> we would call i2c_hid_set_power(OFF), i2c_hid_set_power(ON) before the
> graphical session would start listening to the touchscreen.
> 
> It turns out that at least some SIS touchscreens, such as the one found
> on the Asus T100HA, need a power-on command after reset, otherwise they
> will not send any events.

As You-Sheng pointed out before, device may need a 60ms delay between ON and RESET command.
Does adding the delay help?

Kai-Heng

> 
> Fixes: 67b18dfb8cfc ("HID: i2c-hid: Remove runtime power management")
> Cc: Kai-Heng Feng <kai.heng.feng@canonical.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
> drivers/hid/i2c-hid/i2c-hid-core.c | 4 ++++
> 1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/hid/i2c-hid/i2c-hid-core.c b/drivers/hid/i2c-hid/i2c-hid-core.c
> index d9c55e30f986..04c088131e04 100644
> --- a/drivers/hid/i2c-hid/i2c-hid-core.c
> +++ b/drivers/hid/i2c-hid/i2c-hid-core.c
> @@ -447,8 +447,12 @@ static int i2c_hid_hwreset(struct i2c_client *client)
> 	if (ret) {
> 		dev_err(&client->dev, "failed to reset device.\n");
> 		i2c_hid_set_power(client, I2C_HID_PWR_SLEEP);
> +		goto out_unlock;
> 	}
> 
> +	/* At least some SIS devices need this after reset */
> +	ret = i2c_hid_set_power(client, I2C_HID_PWR_ON);
> +
> out_unlock:
> 	mutex_unlock(&ihid->reset_lock);
> 	return ret;
> -- 
> 2.23.0
> 

