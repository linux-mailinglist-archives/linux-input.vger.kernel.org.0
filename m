Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A13592E2CE2
	for <lists+linux-input@lfdr.de>; Sat, 26 Dec 2020 03:18:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726322AbgLZCRH (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 25 Dec 2020 21:17:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726259AbgLZCRG (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 25 Dec 2020 21:17:06 -0500
X-Greylist: delayed 86 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 25 Dec 2020 18:16:26 PST
Received: from lithium.sammserver.com (lithium.sammserver.com [IPv6:2a01:4f8:c2c:b7df::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6673BC061757
        for <linux-input@vger.kernel.org>; Fri, 25 Dec 2020 18:16:26 -0800 (PST)
Received: from mail.sammserver.com (sammserver.wg [10.32.40.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (Client did not present a certificate)
        by lithium.sammserver.com (Postfix) with ESMTPS id 7125731181DE;
        Sat, 26 Dec 2020 03:14:57 +0100 (CET)
Received: from fastboi.localdomain (fastboi.wg [10.32.40.5])
        by mail.sammserver.com (Postfix) with ESMTP id 0F23934625;
        Sat, 26 Dec 2020 03:14:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cavoj.net; s=email;
        t=1608948897; bh=ioFCNhmE0DjTWYQOwrN6wX6Yup8FGdejDmfgr0nkogc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=dx6JcUyA0MgVEjpPEtmBFKItP0kp0upU5emycmRSjFRosNGOI+0yj5+y+73mnS++j
         MircfUN3kWk1APooU+dF2N27Ro0PxwiXr9oAw4P+VWDYG1H6IxzldU0ZwzysgYAvs6
         cZAOu4M4VprAwUtuqvjvYNPiqYi9VyqTJymnpLXg=
Received: by fastboi.localdomain (Postfix, from userid 1000)
        id EDA6A1420814; Sat, 26 Dec 2020 03:14:56 +0100 (CET)
Date:   Sat, 26 Dec 2020 03:14:56 +0100
From:   Samuel =?utf-8?B?xIxhdm9q?= <samuel@cavoj.net>
To:     Roderick Colenbrander <roderick@gaikai.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, Chris Ye <lzye@google.com>,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Subject: Re: [PATCH 04/13] HID: playstation: add DualSense touchpad support.
Message-ID: <20201226021456.gmnqkycoeqvdhk34@fastboi.localdomain>
References: <20201219062336.72568-1-roderick@gaikai.com>
 <20201219062336.72568-5-roderick@gaikai.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201219062336.72568-5-roderick@gaikai.com>
X-Spam-Status: No, score=-2.7 required=5.0 tests=ALL_TRUSTED,BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS autolearn=no autolearn_force=no
        version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on sammserver.tu
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hello,

thank you for this driver. It makes me really happy to see an official
one. Just a small thing I noticed while reading through it:


On 18.12.2020 22:23, Roderick Colenbrander wrote:
> @@ -311,6 +345,25 @@ static int dualsense_parse_report(struct ps_device *ps_dev, struct hid_report *r
>  	input_report_key(ds->gamepad, BTN_MODE, ds_report->buttons[2] & DS_BUTTONS2_PS_HOME);
>  	input_sync(ds->gamepad);
>  
> +	input_report_key(ds->touchpad, BTN_LEFT, ds_report->buttons[2] & DS_BUTTONS2_TOUCHPAD);

The above line is duplicated right before the input_sync (marked). Is
there any reason for this or is it accidental?

> +	for (i = 0; i < 2; i++) {
> +		bool active = (ds_report->points[i].contact & 0x80) ? false : true;
> +
> +		input_mt_slot(ds->touchpad, i);
> +		input_mt_report_slot_state(ds->touchpad, MT_TOOL_FINGER, active);
> +
> +		if (active) {
> +			int x = (ds_report->points[i].x_hi << 8) | ds_report->points[i].x_lo;
> +			int y = (ds_report->points[i].y_hi << 4) | ds_report->points[i].y_lo;
> +
> +			input_report_abs(ds->touchpad, ABS_MT_POSITION_X, x);
> +			input_report_abs(ds->touchpad, ABS_MT_POSITION_Y, y);
> +		}
> +	}
> +	input_mt_sync_frame(ds->touchpad);
> +	input_report_key(ds->touchpad, BTN_LEFT, ds_report->buttons[2] & DS_BUTTONS2_TOUCHPAD);

Right here.

> +	input_sync(ds->touchpad);
> +

Regards,
Samuel
