Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A664E3FBCEB
	for <lists+linux-input@lfdr.de>; Mon, 30 Aug 2021 21:32:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231556AbhH3Tdw (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 30 Aug 2021 15:33:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229883AbhH3Tdv (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 30 Aug 2021 15:33:51 -0400
X-Greylist: delayed 572 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 30 Aug 2021 12:32:57 PDT
Received: from mail.itouring.de (mail.itouring.de [IPv6:2a01:4f8:a0:4463::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26FD1C061575;
        Mon, 30 Aug 2021 12:32:57 -0700 (PDT)
Received: from tux.applied-asynchrony.com (p5b07ea1c.dip0.t-ipconnect.de [91.7.234.28])
        by mail.itouring.de (Postfix) with ESMTPSA id 7EF0512944D;
        Mon, 30 Aug 2021 21:23:22 +0200 (CEST)
Received: from [192.168.100.221] (hho.applied-asynchrony.com [192.168.100.221])
        by tux.applied-asynchrony.com (Postfix) with ESMTP id 37EBCF01618;
        Mon, 30 Aug 2021 21:23:22 +0200 (CEST)
Subject: Re: [REGRESSION][BISECTED] flood of "hid-generic ... control queue
 full" since v5.14-rc1
To:     Michal Kubecek <mkubecek@suse.cz>,
        Alan Stern <stern@rowland.harvard.edu>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
References: <20210816130059.3yxtdvu2r7wo4uu3@lion.mk-sys.cz>
 <YRpnfJ719DwPu2B0@kroah.com> <20210816141347.zougsudwe5tqgkpt@lion.mk-sys.cz>
 <20210816143856.GA121345@rowland.harvard.edu>
 <20210816191249.7g2mk5thwpio7cfc@lion.mk-sys.cz>
From:   =?UTF-8?Q?Holger_Hoffst=c3=a4tte?= <holger@applied-asynchrony.com>
Organization: Applied Asynchrony, Inc.
Message-ID: <97d5cdb9-0372-7e8b-dc61-610198f8664f@applied-asynchrony.com>
Date:   Mon, 30 Aug 2021 21:23:22 +0200
MIME-Version: 1.0
In-Reply-To: <20210816191249.7g2mk5thwpio7cfc@lion.mk-sys.cz>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 2021-08-16 21:12, Michal Kubecek wrote:
> On Mon, Aug 16, 2021 at 10:38:56AM -0400, Alan Stern wrote:
>> On Mon, Aug 16, 2021 at 04:13:47PM +0200, Michal Kubecek wrote:
>>> Looking at the code, the primary problem seems to be that the "else"
>>> branch in hid_submit_ctrl() recalculates transfer_buffer_length to
>>> a rounded up value but assigns the original length to wLength.
>>
>> Looks like you found the bug.  Fixing it might be as simple as setting
>> len = padlen in that "else" branch.  You could then combine the
>> transfer_buffer_length assignment with the one in the "if" branch and
>> hoist them out after the entire "if" statement.
> 
> With the patch below, there are no errors and the UPS communication
> works correctly and so do other HID devices. But I would prefere someone
> familiar with HID code to confirm that this is what we want and what
> would be the right way to handle usb_submit_urb() errors.
> 
> Michal
> 
> diff --git a/drivers/hid/usbhid/hid-core.c b/drivers/hid/usbhid/hid-core.c
> index 06130dc431a0..ef240ef63a66 100644
> --- a/drivers/hid/usbhid/hid-core.c
> +++ b/drivers/hid/usbhid/hid-core.c
> @@ -377,27 +377,26 @@ static int hid_submit_ctrl(struct hid_device *hid)
>   	len = hid_report_len(report);
>   	if (dir == USB_DIR_OUT) {
>   		usbhid->urbctrl->pipe = usb_sndctrlpipe(hid_to_usb_dev(hid), 0);
> -		usbhid->urbctrl->transfer_buffer_length = len;
>   		if (raw_report) {
>   			memcpy(usbhid->ctrlbuf, raw_report, len);
>   			kfree(raw_report);
>   			usbhid->ctrl[usbhid->ctrltail].raw_report = NULL;
>   		}
>   	} else {
> -		int maxpacket, padlen;
> +		int maxpacket;
>   
>   		usbhid->urbctrl->pipe = usb_rcvctrlpipe(hid_to_usb_dev(hid), 0);
>   		maxpacket = usb_maxpacket(hid_to_usb_dev(hid),
>   					  usbhid->urbctrl->pipe, 0);
>   		if (maxpacket > 0) {
> -			padlen = DIV_ROUND_UP(len, maxpacket);
> -			padlen *= maxpacket;
> -			if (padlen > usbhid->bufsize)
> -				padlen = usbhid->bufsize;
> +			len = DIV_ROUND_UP(len, maxpacket);
> +			len *= maxpacket;
> +			if (len > usbhid->bufsize)
> +				len = usbhid->bufsize;
>   		} else
> -			padlen = 0;
> -		usbhid->urbctrl->transfer_buffer_length = padlen;
> +			len = 0;
>   	}
> +	usbhid->urbctrl->transfer_buffer_length = len;
>   	usbhid->urbctrl->dev = hid_to_usb_dev(hid);
>   
>   	usbhid->cr->bRequestType = USB_TYPE_CLASS | USB_RECIP_INTERFACE | dir;
> 

Got the same flood of messages when trying 5.14.0, found this thread, applied
the patch & rebuilt, problem is gone & UPS still working fine. Yay.

cheers
Holger
