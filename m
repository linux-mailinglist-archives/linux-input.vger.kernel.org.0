Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BEC185099FA
	for <lists+linux-input@lfdr.de>; Thu, 21 Apr 2022 09:56:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1386201AbiDUHuL (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 21 Apr 2022 03:50:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1386211AbiDUHtb (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 21 Apr 2022 03:49:31 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB8D21D0F2
        for <linux-input@vger.kernel.org>; Thu, 21 Apr 2022 00:46:26 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 94691B8229D
        for <linux-input@vger.kernel.org>; Thu, 21 Apr 2022 07:46:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2ABE7C385A5;
        Thu, 21 Apr 2022 07:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1650527184;
        bh=o5GxVZY1HXRr2GT1NsbeNCTeMnGDsrPle+S+LWSD5Cw=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=Jp2POZkMPJcdwOYQq+I3QFmw3BmVBXfqHbR4Cu1seXZWFbEroek5U20QeDWu3NKnK
         ULQrI34/POLgSvaJUcW7/A7I8h+A/YQ3vu2Hxetu5frzgwWa7LxTzmnbEKJn6w11qS
         w2g5zD0GeaZthocWS8dXq4Ol7WvfpQXMBviUnUvPCflBapp7jFF54ZdWjmiwSsWd74
         veb9hCO4gcFxBXvQsoBaaO+0gu5Il7pd64H38HcZO+pkrQ9Jj8MUA7IGVK0uU2mwNw
         iEs4z5arzcZyWcX3NsmnZ1rSc0agNVuIqHzLbtOvn0JKO0QLf0hm2lBXf4FwoeiceP
         BE1CYhNyFsn6w==
Date:   Thu, 21 Apr 2022 09:46:20 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     =?ISO-8859-2?Q?Marek_Ma=B6lanka?= <mm@semihalf.com>
cc:     linux-input@vger.kernel.org, upstream@semihalf.com,
        benjamin.tissoires@redhat.com
Subject: Re: [PATCH v2] HID: multitouch: Add support for Google Whiskers
 Touchpad
In-Reply-To: <17e7b7ad-1a5b-d813-888f-abea0aa099b1@semihalf.com>
Message-ID: <nycvar.YFH.7.76.2204210945560.30217@cbobk.fhfr.pm>
References: <17e7b7ad-1a5b-d813-888f-abea0aa099b1@semihalf.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, 5 Apr 2022, Marek Maślanka wrote:

> The Google Whiskers touchpad does not work properly with the default
> multitouch configuration. Instead, use the same configuration as Google
> Rose.
> 
> Signed-off-by: Marek Maslanka <mm@semihalf.com>
> ---
> 
> Changes in v2:
>   - As a HID device group use HID_GROUP_MULTITOUCH_WIN_8.
> 
>  drivers/hid/hid-multitouch.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
> index 99eabfb4145b..87a92f2654c0 100644
> --- a/drivers/hid/hid-multitouch.c
> +++ b/drivers/hid/hid-multitouch.c
> @@ -2178,6 +2178,9 @@ static const struct hid_device_id mt_devices[] = {
>  	{ .driver_data = MT_CLS_GOOGLE,
>  		HID_DEVICE(HID_BUS_ANY, HID_GROUP_ANY, USB_VENDOR_ID_GOOGLE,
>  			USB_DEVICE_ID_GOOGLE_TOUCH_ROSE) },
> +	{ .driver_data = MT_CLS_GOOGLE,
> +		HID_DEVICE(BUS_USB, HID_GROUP_MULTITOUCH_WIN_8,
> USB_VENDOR_ID_GOOGLE,
> +			USB_DEVICE_ID_GOOGLE_WHISKERS) },

This device is already claimed by google-hammer driver though ... ?

Thanks,

-- 
Jiri Kosina
SUSE Labs

