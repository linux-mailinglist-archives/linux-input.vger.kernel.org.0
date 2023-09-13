Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C0A479EB5B
	for <lists+linux-input@lfdr.de>; Wed, 13 Sep 2023 16:43:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241397AbjIMOng convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-input@lfdr.de>); Wed, 13 Sep 2023 10:43:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241359AbjIMOng (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 13 Sep 2023 10:43:36 -0400
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E658A91;
        Wed, 13 Sep 2023 07:43:31 -0700 (PDT)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0E9551C0007;
        Wed, 13 Sep 2023 14:43:29 +0000 (UTC)
Message-ID: <e0ad67eea72936e44df399e46bb89b7be914419e.camel@hadess.net>
Subject: Re: [PATCH] HID: steelseries: Fix signedness bug in
 steelseries_headset_arctis_1_fetch_battery()
From:   Bastien Nocera <hadess@hadess.net>
To:     Dan Carpenter <dan.carpenter@linaro.org>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, kernel-janitors@vger.kernel.org
Date:   Wed, 13 Sep 2023 16:43:29 +0200
In-Reply-To: <5c1cc882-b2b8-45cb-b8f7-4b35d1800e5d@moroto.mountain>
References: <5c1cc882-b2b8-45cb-b8f7-4b35d1800e5d@moroto.mountain>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
X-GND-Sasl: hadess@hadess.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hey Dan,

On Thu, 2023-09-07 at 12:55 +0300, Dan Carpenter wrote:
> The hid_hw_raw_request() function returns negative error codes or the
> number bytes transferred.  If it returns negative error codes, then
> the
> problem is that when we check if "ret <
> sizeof(arctis_1_battery_request)",
> negative values are type promoted to high unsigned values and treated
> as
> success.  Add an explicit check for negatives to address this issue.

I would be grateful if you could either add the compiler's error
message or explain in greater details the integer type promotion (or
demotion from signed to unsigned in this case) in the commit message.

> Fixes: a0c76896c3fb ("HID: steelseries: Add support for Arctis 1
> XBox")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>



> ---
>  drivers/hid/hid-steelseries.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hid/hid-steelseries.c b/drivers/hid/hid-
> steelseries.c
> index 43d2cf7153d7..485d2287d58a 100644
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
> +       if (ret < 0 || ret < sizeof(arctis_1_battery_request)) {

I prefer:
-       if (ret < sizeof(arctis_1_battery_request)) {
+       if (ret < (int) sizeof(arctis_1_battery_request)) {

although I'm not sure that's the kernel-style for this sort of checks.

>                 hid_err(hdev, "hid_hw_raw_request() failed with
> %d\n", ret);
>                 ret = -ENODATA;
>         }

