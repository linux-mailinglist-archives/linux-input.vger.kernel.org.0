Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F22B37A21A0
	for <lists+linux-input@lfdr.de>; Fri, 15 Sep 2023 16:59:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229921AbjIOO7o convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-input@lfdr.de>); Fri, 15 Sep 2023 10:59:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229568AbjIOO7o (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 15 Sep 2023 10:59:44 -0400
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7ABF1BE6;
        Fri, 15 Sep 2023 07:59:38 -0700 (PDT)
Received: by mail.gandi.net (Postfix) with ESMTPSA id BC41060002;
        Fri, 15 Sep 2023 14:59:36 +0000 (UTC)
Message-ID: <4f6332440232605d55232efde7a6ea9f648fe997.camel@hadess.net>
Subject: Re: [PATCH v2] HID: steelseries: Fix signedness bug in
 steelseries_headset_arctis_1_fetch_battery()
From:   Bastien Nocera <hadess@hadess.net>
To:     Dan Carpenter <dan.carpenter@linaro.org>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, kernel-janitors@vger.kernel.org
Date:   Fri, 15 Sep 2023 16:59:36 +0200
In-Reply-To: <6e0a33e3-1564-419a-9946-b2d0afa0f98d@moroto.mountain>
References: <6e0a33e3-1564-419a-9946-b2d0afa0f98d@moroto.mountain>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
X-GND-Sasl: hadess@hadess.net
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, 2023-09-15 at 15:59 +0300, Dan Carpenter wrote:
> The hid_hw_raw_request() function returns negative error codes or the
> number bytes transferred.  The problem is that when it returns
> negative
> error codes and we check if "ret < sizeof(arctis_1_battery_request)",
> then the negative values are type promoted from int to high unsigned
> long
> values and treated as success.
> 
> This was detected using Smatch:
> 
>     drivers/hid/hid-steelseries.c:393
> steelseries_headset_arctis_1_fetch_battery()
>     warn: error code type promoted to positive: 'ret'
> 
> Fixes: a0c76896c3fb ("HID: steelseries: Add support for Arctis 1
> XBox")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Reviewed-by: Bastien Nocera <hadess@hadess.net>

Thanks Dan!

> ---
> v2: Re-word the commit message.  Add the Smatch warning.  Use a cast
> instead of an explicit check for negatives.
> 
>  drivers/hid/hid-steelseries.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hid/hid-steelseries.c b/drivers/hid/hid-
> steelseries.c
> index 43d2cf7153d7..b3edadf42d6d 100644
> --- a/drivers/hid/hid-steelseries.c
> +++ b/drivers/hid/hid-steelseries.c
> @@ -390,7 +390,7 @@ static int
> steelseries_headset_arctis_1_fetch_battery(struct hid_device *hdev)
>         ret = hid_hw_raw_request(hdev, arctis_1_battery_request[0],
>                                  write_buf,
> sizeof(arctis_1_battery_request),
>                                  HID_OUTPUT_REPORT,
> HID_REQ_SET_REPORT);
> -       if (ret < sizeof(arctis_1_battery_request)) {
> +       if (ret < (int)sizeof(arctis_1_battery_request)) {
>                 hid_err(hdev, "hid_hw_raw_request() failed with
> %d\n", ret);
>                 ret = -ENODATA;
>         }

