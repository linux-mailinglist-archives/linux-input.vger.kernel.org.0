Return-Path: <linux-input+bounces-13635-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 06BD6B0D802
	for <lists+linux-input@lfdr.de>; Tue, 22 Jul 2025 13:19:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 259343B9C40
	for <lists+linux-input@lfdr.de>; Tue, 22 Jul 2025 11:18:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56FC728CF67;
	Tue, 22 Jul 2025 11:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a9OY86lF"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A5148F40;
	Tue, 22 Jul 2025 11:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753183148; cv=none; b=gmYzm1cs+GUTa9GsueIPMUIi695/yoGrcQnF5wVag0wKh1Hj15zIE8mGvhekrizvp179T3ZL/vdWBvcDjwGCWO7s25xzODnSI5FWO6qaTFQ8DMihiIupOV5GIahrvSSXchS0sxvHFQTsEpl80knh1t9Ny+E2XhDwBUktp4hSl10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753183148; c=relaxed/simple;
	bh=/pi07YCWUK9NhuZCP73XtyvuKXHE+FC+o9jjLgf76MU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HmcYBakVlLj63/8O6APinlqJmmTvs1WhqLDy+SfAk/GAlhgL8XFMjQb+VtODtfKZRDU2BONe4Qq+/ERqaZTgLpAoclHDHvLJfK8AQOFtDcvLskvL+IfhY4DTTj0QLNqT5rEsQJJnqn78d8a1MW+pTAawv6mrrBtGeMHDQ70Mbvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a9OY86lF; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3a510432236so3203955f8f.0;
        Tue, 22 Jul 2025 04:19:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753183145; x=1753787945; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wEurD6iXsPr7RepkDOyveYJGKHwIE5RRMqk4xOBcUeM=;
        b=a9OY86lF2FI4Byrs5UoOZZpejQX4HMhMcTI/V3ReGVLYfByY1kCI+HxnDVnL63Oq0P
         OrQ34sQjvaD5Id42Ix+2r7knDsa9+7zZPwnYOA+q+ksebxjhE6s3e+wpgBCDrwSaWVAc
         9GT3AhdWNm2cP9N9zlpf+yyvt26k7Io/ZQcHmWp0QMZwcVa8ny47XfrQiZbIHB44JfQn
         Ay23Yv7TpVuYZ2RLxe59Jr1DReYVCMPd62/22eMwyHy6oVsxyDMGdViooficFyCawWj/
         +NiQHHYkfa5RnCD8q7WuQJvzoSNAi+779uUOPt6srq+yQl3s9x9XWhtboWwiBh0shzkb
         4ZLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753183145; x=1753787945;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wEurD6iXsPr7RepkDOyveYJGKHwIE5RRMqk4xOBcUeM=;
        b=Wt7/+fKSWDOYEpaeOL3ogS/jWZlUKaDV0GqTvEaGQiF1rQM0SUqfNwHAh0X+WOtXOC
         PZlrZKq9ugOEe8QfpCfF5jWubRr+puYzHERO3tGvmrRsPrp8SWPtPmH6fzGGUoZOc22C
         ON5OeLWp3HjbmAmqW0+YVpJ7tzv6ewr78GHkOhDZMD/LYGfM74yRBHRYzjUy7g6GrcSY
         ldSwPYFJ1GS6JEMUGJd9toYaMBhbA33JxsQybRtZSBxGPHaZvT93LcCY3tYVKqDobRZO
         sSJjeA4xgszdBM3DYkLribONT3buhrwg9+8OyY8azEXGuCu27JHolJw4Gzku0j1U51sG
         gnVw==
X-Forwarded-Encrypted: i=1; AJvYcCWtLnsidzMJq0fRTof94BZFavg34A7/Ao53AkaiPB2BETeSyIQE8SJGv4hCw1ULQaYZwwjkEYNmFg2E8A==@vger.kernel.org, AJvYcCXosLsctGtsyEuYv3B76Ny+BHqVg1xqnQ5d1N7vLCthASp/sPqBWPlXn9BVvDXta4U0dBrI6P9s4dipATCO@vger.kernel.org, AJvYcCXxyxyVjMQ73enpvLkDNDjCzZ2Q4S1vAUpy15tu4VDZI++h4hSN7sUWkjEHL7qyEwSblGPfeUrR@vger.kernel.org
X-Gm-Message-State: AOJu0YxvoP4GtERjr/jP5fIG1a92aPF1s/rDcftzFnjtkskcwBKOpte+
	qEDtZml5OEu4sKiYxK74EJJl2ouYi3dPqJkSPIVN6zwAxcAtsXbED5dW
X-Gm-Gg: ASbGncu3uyY5beUDZluIChgtCIicc4XYQxwfSz5itDlfN2SZfM370AQyolQNoGJIFQM
	9u9hV01G+E9IXHNp9Pxtwy8uSCjMd4AxvCcUNWZRR6jCGr38LfNDAq3b7a8TDPu28KJK9aSxStZ
	SUH6Qqn+F7YwdiU1zTWCbADVEzspkZlODuOJ17dPaEOe4EMYxfsXslzmX31qs35CmmmM8CRO2c7
	+E5TMDjP/p/AV+mgg4vL//d46nDytGhoeX6Gd1qasZk7eppMm1Ki/xZMdbreX4+owFDXlMYF0Pa
	Kc+Ax/DFGQ4Obx3e5kofX/OGMBInAFTdSm4j4G1d/sea/w5GV+fHGt+AO+aR8D4+py5RWQTBLcd
	02txGqth4zdgJEoNCels=
X-Google-Smtp-Source: AGHT+IF6XPEcSkqdIT7aDFpbGYg19VkOPLerg36vUxXct9CB8PNS8G+//5b23f6j4/cqnq91dQ5iZA==
X-Received: by 2002:a05:6000:3102:b0:3a4:ec23:dba5 with SMTP id ffacd0b85a97d-3b60e4c910dmr17528503f8f.5.1753183144331;
        Tue, 22 Jul 2025 04:19:04 -0700 (PDT)
Received: from gmail.com ([2a02:c7c:f4f0:900:2e21:a766:f429:7a71])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b61ca2c013sm13179175f8f.33.2025.07.22.04.19.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jul 2025 04:19:03 -0700 (PDT)
Date: Tue, 22 Jul 2025 12:19:01 +0100
From: Qasim Ijaz <qasdev00@gmail.com>
To: Jiri Slaby <jirislaby@kernel.org>
Cc: jikos@kernel.org, bentiss@kernel.org, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	Dmitry Savin <envelsavinds@gmail.com>
Subject: Re: [PATCH RESEND] HID: multitouch: fix slab out-of-bounds access in
 mt_report_fixup()
Message-ID: <aH9zl18IqvL7l9pX@gmail.com>
References: <20250722080003.3605-1-qasdev00@gmail.com>
 <c90e88a4-7fff-49fa-8a6f-24f3671d9390@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c90e88a4-7fff-49fa-8a6f-24f3671d9390@kernel.org>

On Tue, Jul 22, 2025 at 11:16:15AM +0200, Jiri Slaby wrote:
> On 22. 07. 25, 10:00, Qasim Ijaz wrote:
> > A malicious HID device can trigger a slab out-of-bounds during
> > mt_report_fixup() by passing in report descriptor smaller than
> > 607 bytes. mt_report_fixup() attempts to patch byte offset 607
> > of the descriptor with 0x25 by first checking if byte offset
> > 607 is 0x15 however it lacks bounds checks to verify if the
> > descriptor is big enough before conducting this check. Fix
> > this vulnerability by ensuring the descriptor size is
> > greater than or equal to 608 before accessing it.
> > 
> > Below is the KASAN splat after the out of bounds access happens:
> > 
> > [   13.671954] ==================================================================
> > [   13.672667] BUG: KASAN: slab-out-of-bounds in mt_report_fixup+0x103/0x110
> > [   13.673297] Read of size 1 at addr ffff888103df39df by task kworker/0:1/10
> > [   13.673297]
> > [   13.673297] CPU: 0 UID: 0 PID: 10 Comm: kworker/0:1 Not tainted 6.15.0-00005-gec5d573d83f4-dirty #3
> > [   13.673297] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/04
> > [   13.673297] Call Trace:
> > [   13.673297]  <TASK>
> > [   13.673297]  dump_stack_lvl+0x5f/0x80
> > [   13.673297]  print_report+0xd1/0x660
> > [   13.673297]  kasan_report+0xe5/0x120
> > [   13.673297]  __asan_report_load1_noabort+0x18/0x20
> > [   13.673297]  mt_report_fixup+0x103/0x110
> > [   13.673297]  hid_open_report+0x1ef/0x810
> > [   13.673297]  mt_probe+0x422/0x960
> > [   13.673297]  hid_device_probe+0x2e2/0x6f0
> > [   13.673297]  really_probe+0x1c6/0x6b0
> > [   13.673297]  __driver_probe_device+0x24f/0x310
> > [   13.673297]  driver_probe_device+0x4e/0x220
> > [   13.673297]  __device_attach_driver+0x169/0x320
> > [   13.673297]  bus_for_each_drv+0x11d/0x1b0
> > [   13.673297]  __device_attach+0x1b8/0x3e0
> > [   13.673297]  device_initial_probe+0x12/0x20
> > [   13.673297]  bus_probe_device+0x13d/0x180
> > [   13.673297]  device_add+0xe3a/0x1670
> > [   13.673297]  hid_add_device+0x31d/0xa40
> > [...]
> > 
> > Fixes: c8000deb6836 ("HID: multitouch: Add support for GT7868Q")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Qasim Ijaz <qasdev00@gmail.com>
> > Reviewed-by: Dmitry Savin <envelsavinds@gmail.com>
> > ---
> >   drivers/hid/hid-multitouch.c | 25 ++++++++++++++++---------
> >   1 file changed, 16 insertions(+), 9 deletions(-)
> > 
> > diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
> > index 7ac8e16e6158..af4abe3ba410 100644
> > --- a/drivers/hid/hid-multitouch.c
> > +++ b/drivers/hid/hid-multitouch.c
> > @@ -1461,18 +1461,25 @@ static const __u8 *mt_report_fixup(struct hid_device *hdev, __u8 *rdesc,
> >   	if (hdev->vendor == I2C_VENDOR_ID_GOODIX &&
> >   	    (hdev->product == I2C_DEVICE_ID_GOODIX_01E8 ||
> >   	     hdev->product == I2C_DEVICE_ID_GOODIX_01E9)) {
> > -		if (rdesc[607] == 0x15) {
> > -			rdesc[607] = 0x25;
> > -			dev_info(
> > -				&hdev->dev,
> > -				"GT7868Q report descriptor fixup is applied.\n");
> > +		if (*size >= 608) {
> > +			if (rdesc[607] == 0x15) {
> > +				rdesc[607] = 0x25;
> > +				dev_info(
> > +					&hdev->dev,
> > +					"GT7868Q report descriptor fixup is applied.\n");
> > +			} else {
> > +				dev_info(
> > +					&hdev->dev,
> > +					"The byte is not expected for fixing the report descriptor. \
> > +					It's possible that the touchpad firmware is not suitable for applying the fix. \
> > +					got: %x\n",
> 
> This is wrong. You have all the spaces/tabs in the string now. Drop all the
> backslashes, and open and close the string on every line.
> 
> > +					rdesc[607]);
> > +			}
> 
> As this is superlong and superindented, perhaps introduce a new function for
> these devices?
> 
> >   		} else {
> >   			dev_info(
> >   				&hdev->dev,
> > -				"The byte is not expected for fixing the report descriptor. \
> > -It's possible that the touchpad firmware is not suitable for applying the fix. \
> > -got: %x\n",
> 
> This was horrid too, yeah.
> 
> > -				rdesc[607]);
> > +				"GT7868Q fixup: report descriptor only %u bytes, skipping\n",
> 
> A predicate missing. Eg. "has only", or "is only".
> 

Thanks for the feedback Jiri, I took the advice on board, is something
like this better?

 static const __u8 *mt_report_fixup(struct hid_device *hdev, __u8 *rdesc,
				   unsigned int *size)
 {
          if (hdev->vendor == I2C_VENDOR_ID_GOODIX &&
              (hdev->product == I2C_DEVICE_ID_GOODIX_01E8 ||
               hdev->product == I2C_DEVICE_ID_GOODIX_01E9)) {
		 if (*size < 608) {
			 dev_info(
				 &hdev->dev,
				 "GT7868Q fixup: report descriptor is only %u bytes, skipping\n",
				 *size);
                          return rdesc;
                  }
 
		 if (rdesc[607] == 0x15) {
			 rdesc[607] = 0x25;
			 dev_info(
				 &hdev->dev,
				 "GT7868Q fixup: report descriptor fixup is applied.\n");
		 } else {
			 dev_info(&hdev->dev,
				 "GT7868Q fixup: offset 607 is %x (expected 0x15), "
				 "descriptor may be malformed, skipping\n",
				 rdesc[607]);
		 }
	  }
 
 	  return rdesc;
 }

the key changes I made are:

- Move size check to the top, this way the indentation level is decent
- get rid of message backslashes
- shorten the fixup failure message when rdesc[607] is not 0x15 and make
  it a bit clearer since this message was the longest - just a minor
  cleanup
- added "is only %u bytes" as you suggested

if this is all good I can send v2.

Thanks
qasim
> > +				*size);
> >   		}
> >   	}
> 
> thanks,
> -- 
> js
> suse labs
> 

