Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D04D2625356
	for <lists+linux-input@lfdr.de>; Fri, 11 Nov 2022 07:07:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232319AbiKKGHP (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 11 Nov 2022 01:07:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230320AbiKKGHO (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 11 Nov 2022 01:07:14 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9CAC6035B;
        Thu, 10 Nov 2022 22:07:13 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 786A661E60;
        Fri, 11 Nov 2022 06:07:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D953C433D6;
        Fri, 11 Nov 2022 06:07:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1668146832;
        bh=ehaPRXrW1DgqRxddFGBaSO+S2sDq5qVRqbF45o/DDbE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=2sPE0iOD/quzQoXKYyzYEpKDr1VilfE/t3yAWNpy6wjVPfQuvCFRqnviNnyTJLecB
         I/hFuiBBSuKe/PqALJz9m+e+/hcC3/cPvlRAo0eY7s1VQw48Owt81oMLweCw8Okyws
         btDzgZxGSV3vOnPVlRWXq0B7s+l+BRq8vgRBchbs=
Date:   Fri, 11 Nov 2022 07:07:10 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Andreas Bergmeier <abergmeier@gmx.net>
Cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        USB mailing list <linux-usb@vger.kernel.org>,
        linux-input@vger.kernel.org
Subject: Re: PATCH: Simplify hidpp_send_rap_command_sync calls
Message-ID: <Y23mji7TGm18BrDp@kroah.com>
References: <4b871484-b19-95b8-f973-bfebcb5348ab@9300>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4b871484-b19-95b8-f973-bfebcb5348ab@9300>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Nov 10, 2022 at 03:47:47PM +0100, Andreas Bergmeier wrote:
> Inside function, report_id might get overwritten.
> Only REPORT_ID_HIDPP_SHORT is ever passed in.
> So there seems to be no point in passing report_id in the first place.
> Just directly evaluate which report_id to use in the function itself.
> 
> Signed-off-by: Andreas Bergmeier <abergmeier@gmx.net>
> 
> diff --git a/drivers/hid/hid-logitech-hidpp.c
> b/drivers/hid/hid-logitech-hidpp.c
> index 898691a77a58..20ae7f73ef08 100644
> --- a/drivers/hid/hid-logitech-hidpp.c
> +++ b/drivers/hid/hid-logitech-hidpp.c
> @@ -360,15 +360,16 @@ static int hidpp_send_fap_command_sync(struct
> hidpp_device *hidpp,
>  }
> 
>  static int hidpp_send_rap_command_sync(struct hidpp_device *hidpp_dev,
> -	u8 report_id, u8 sub_id, u8 reg_address, u8 *params, int
> param_count,
> +	u8 sub_id, u8 reg_address, u8 *params, int param_count,
>  	struct hidpp_report *response)
>  {
>  	struct hidpp_report *message;
>  	int ret, max_count;
> +	u8 report_id;
> 
> -	/* Send as long report if short reports are not supported. */
> -	if (report_id == REPORT_ID_HIDPP_SHORT &&
> -	    !(hidpp_dev->supported_reports &
> HIDPP_REPORT_SHORT_SUPPORTED))
> +	if (hidpp_dev->supported_reports & HIDPP_REPORT_SHORT_SUPPORTED)
> +		report_id = REPORT_ID_HIDPP_SHORT;
> +	else
>  		report_id = REPORT_ID_HIDPP_LONG;
> 
>  	switch (report_id) {
> @@ -549,7 +550,6 @@ static int hidpp10_set_register(struct hidpp_device
> *hidpp_dev,
>  	u8 params[3] = { 0 };
> 
>  	ret = hidpp_send_rap_command_sync(hidpp_dev,
> -					  REPORT_ID_HIDPP_SHORT,
>  					  HIDPP_GET_REGISTER,
>  					  register_address,
>  					  NULL, 0, &response);
> @@ -562,7 +562,6 @@ static int hidpp10_set_register(struct hidpp_device
> *hidpp_dev,
>  	params[byte] |= value & mask;
> 
>  	return hidpp_send_rap_command_sync(hidpp_dev,
> -					   REPORT_ID_HIDPP_SHORT,
>  					   HIDPP_SET_REGISTER,
>  					   register_address,
>  					   params, 3, &response);
> @@ -658,7 +657,6 @@ static int hidpp10_query_battery_status(struct
> hidpp_device *hidpp)
>  	int ret, status;
> 
>  	ret = hidpp_send_rap_command_sync(hidpp,
> -					REPORT_ID_HIDPP_SHORT,
>  					HIDPP_GET_REGISTER,
>  					HIDPP_REG_BATTERY_STATUS,
>  					NULL, 0, &response);
> @@ -710,7 +708,6 @@ static int hidpp10_query_battery_mileage(struct
> hidpp_device *hidpp)
>  	int ret, status;
> 
>  	ret = hidpp_send_rap_command_sync(hidpp,
> -					REPORT_ID_HIDPP_SHORT,
>  					HIDPP_GET_REGISTER,
>  					HIDPP_REG_BATTERY_MILEAGE,
>  					NULL, 0, &response);
> @@ -782,7 +779,6 @@ static char *hidpp_unifying_get_name(struct
> hidpp_device *hidpp_dev)
>  	int len;
> 
>  	ret = hidpp_send_rap_command_sync(hidpp_dev,
> -					REPORT_ID_HIDPP_SHORT,
>  					HIDPP_GET_LONG_REGISTER,
>  					HIDPP_REG_PAIRING_INFORMATION,
>  					params, 1, &response);
> @@ -816,7 +812,6 @@ static int hidpp_unifying_get_serial(struct
> hidpp_device *hidpp, u32 *serial)
>  	u8 params[1] = { HIDPP_EXTENDED_PAIRING };
> 
>  	ret = hidpp_send_rap_command_sync(hidpp,
> -					REPORT_ID_HIDPP_SHORT,
>  					HIDPP_GET_LONG_REGISTER,
>  					HIDPP_REG_PAIRING_INFORMATION,
>  					params, 1, &response);
> @@ -900,7 +895,6 @@ static int hidpp_root_get_protocol_version(struct
> hidpp_device *hidpp)
>  	int ret;
> 
>  	ret = hidpp_send_rap_command_sync(hidpp,
> -			REPORT_ID_HIDPP_SHORT,
>  			HIDPP_PAGE_ROOT_IDX,
>  			CMD_ROOT_GET_PROTOCOL_VERSION,
>  			ping_data, sizeof(ping_data), &response);
> @@ -3180,7 +3174,6 @@ static int m560_send_config_command(struct
> hid_device *hdev, bool connected)
> 
>  	return hidpp_send_rap_command_sync(
>  		hidpp_dev,
> -		REPORT_ID_HIDPP_SHORT,
>  		M560_SUB_ID,
>  		M560_BUTTON_MODE_REGISTER,
>  		(u8 *)m560_config_parameter,
> @@ -3719,7 +3712,6 @@ static int hidpp_initialize_hires_scroll(struct
> hidpp_device *hidpp)
>  		struct hidpp_report response;
> 
>  		ret = hidpp_send_rap_command_sync(hidpp,
> -						  REPORT_ID_HIDPP_SHORT,
>  						  HIDPP_GET_REGISTER,
> 
> HIDPP_ENABLE_FAST_SCROLL,
>  						  NULL, 0, &response);
> 

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- Your patch is malformed (tabs converted to spaces, linewrapped, etc.)
  and can not be applied.  Please read the file,
  Documentation/email-clients.txt in order to fix this.

- This looks like a new version of a previously submitted patch, but you
  did not list below the --- line any changes from the previous version.
  Please read the section entitled "The canonical patch format" in the
  kernel file, Documentation/SubmittingPatches for what needs to be done
  here to properly describe this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
