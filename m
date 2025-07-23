Return-Path: <linux-input+bounces-13666-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 220A7B0EFB2
	for <lists+linux-input@lfdr.de>; Wed, 23 Jul 2025 12:24:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 280F516A056
	for <lists+linux-input@lfdr.de>; Wed, 23 Jul 2025 10:24:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DB3A277C9E;
	Wed, 23 Jul 2025 10:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QUoTdpub"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A3BA28B4FE;
	Wed, 23 Jul 2025 10:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753266284; cv=none; b=IJ8/E0LVWmcjruLr5gJU7+UylpDEpHr0AyWlCPoR73VgdAUzLqFDxphlZLpx5tbjQaoatE0K5eGr0y+E8vKgkEXK8G5zgPugMMQm4Hwl8UpoHoxEjxxJTGK1pf0pY5QYKIVEHeQZFFNhshkVNYAGvdUx7EyH+HurH5cWEYlIKSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753266284; c=relaxed/simple;
	bh=fdOwq/b2f7LD/Gf9dK9AiNuHaOxniq0rEMtRpG8ko2E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hTnEjAr9FEiq1sNWKm3WRP0f8o6ON9zbzzoaNyMWkJ4JEEO5HNLHVXfJEYpRzopp8AJyKYPQf9DNm2vuMsD38WGKqLubTS9hl3F56P/VdimiQfoO34syJ8Lw5ibIdHLlxiQuDFs0JgfrPhtYFKfmeU5ldzOY70oO0myo0rph9yQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QUoTdpub; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3a54690d369so5348452f8f.3;
        Wed, 23 Jul 2025 03:24:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753266280; x=1753871080; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3QfeDIhZBxM0UUz93jdrNB6cr19zCPo/07VW3k9S7Eo=;
        b=QUoTdpubiqm7XDgt+TJUYZDBNaExnozI4gDE5PIVNfG2S/sLmbQGmIJvyccXrhz01i
         oUVE6P0+xjF43RU2hZYyyefYu2xDgYmfL3vb4kT0MYypP+nh7yzzx2OWg9fsKrbLSmlL
         viOvzDIxIDHQVUaFRhl9OeXbFfs1g93cXZphdHi1/M1/HB6ByK+/p2JjyVuuUzm1wqg3
         NOiWfsC6g2yidm71mZzcdelKL5VtaAp0x4GrYWZbQJ+0IMDe6jqQgxj4oH6e9YVRCJlS
         wZK6kBNm7ObTafzv50Wrv0hx95sYqipjuqnKzBkr8HWOGPPu8kVitQwGIDU8DHAiH7K/
         4Hkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753266280; x=1753871080;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3QfeDIhZBxM0UUz93jdrNB6cr19zCPo/07VW3k9S7Eo=;
        b=VWt97Szdn4BwDU1mbvIZZ001RXEHkmkzCPmOfuUtUWKexd2rkQoLQHcENneMwPs52H
         vgM4Y+Rh/ossFAtHaFuM4rwUg1/qkP12gNEXDyN5P5VhrikEl9g008jE24ezIC3ARDUM
         ysCHIojue0M5lqqziebYVtS/qV3cCMtBdox4cNWpLtWT7raGCwESh4zHxe7dRDRgGfe/
         FQNSABaWbPX9S4OZZgw9rCJThGe8US2y5cVSXWCzGlZrlaPoHwpJiHB1/u+n4Mpi9RRG
         rwOdqRwkFCjSWbhBPVI0DkPJoCVx+uPPuZBUB0Wx/cKT8+T026rh7UThlRmtZvhn2de2
         ovtg==
X-Forwarded-Encrypted: i=1; AJvYcCU8z5pk8gUuW1g+vEM3lHM+9fySJrgLQVGvl1tuSagJ/dCV//IKSejhmhDQGt2c4lFVNWrmktDXa/JGqA==@vger.kernel.org, AJvYcCUuzFpClTN0nGNB5e+ZPseEQsY6XMPV/PklewsB7EPMoQb64PtvozCgjrV9wTKkZeQDkWupS5EJ@vger.kernel.org, AJvYcCV+xsHP0/XZcpb3uiBPi4TyJ32r6vQc1Z4Dfs1JfvXR+KCmxjx2PBM4j9O/xglaiFEZI7JZOK1z2v2ngG/p@vger.kernel.org
X-Gm-Message-State: AOJu0YxXfy8OKBJ6arep7KPqQ19zbHVRRAZPhkeRaVajfMq1g+B17dNC
	Y1cNM6VFwNkhhZKbm7f+rwUCoydw/53pIVgCSP+Db8n6i2m+EuwIYRsr
X-Gm-Gg: ASbGnctCQ6fXD/sK81yf20iipZe348jZmtFxMbHrrPd1rc0cK7P9PbHeLOQeKNy8Wv/
	4VfugK8Znod85N61CoJjdE8MvoIM43CaGUr8OOc07F6z504m2Wkxezt6MBgumpLlO9rWF0oUX8S
	Gpsy9NR6P5GgUqzqmJ7b/hm9nQEMNrxwMKSAyAU749y5A7VoEbgLyqBVNF2bFKUuYQyK+SDYfPT
	yiuCHI/HhE/Z8p65RILFkw065toYEgDmXr82GqjupLyYpiua/+6ySegBDvCL452wMEU5adLtQrv
	tbhOmhwRqA6wSm/pkfATq7woXvSfBKFUcP6ElqQLsR9XP/CzXODS3Ibz7n3JdsLbb0j+7lBgk4Z
	mq3cKQ5InkBWA1gnrig==
X-Google-Smtp-Source: AGHT+IGS04CA4uRCGjfoHnJSh4w9B1dOWMtvG+P9rrFOsMscOys6Vkwj4GFJ5qvKH1O+tSHxvpYVmQ==
X-Received: by 2002:a05:6000:250a:b0:3b6:d6d:dd2 with SMTP id ffacd0b85a97d-3b768eb0630mr2546202f8f.25.1753266279498;
        Wed, 23 Jul 2025 03:24:39 -0700 (PDT)
Received: from gmail.com ([2a02:c7c:f4f0:900:dbce:b6e:fb8b:9dcf])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b61ca487fdsm15906378f8f.48.2025.07.23.03.24.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jul 2025 03:24:39 -0700 (PDT)
Date: Wed, 23 Jul 2025 11:24:31 +0100
From: Qasim Ijaz <qasdev00@gmail.com>
To: Jiri Slaby <jirislaby@kernel.org>
Cc: jikos@kernel.org, bentiss@kernel.org, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	Dmitry Savin <envelsavinds@gmail.com>
Subject: Re: [PATCH RESEND] HID: multitouch: fix slab out-of-bounds access in
 mt_report_fixup()
Message-ID: <aIC4X_pDf6SFd55c@gmail.com>
References: <20250722080003.3605-1-qasdev00@gmail.com>
 <c90e88a4-7fff-49fa-8a6f-24f3671d9390@kernel.org>
 <aH9zl18IqvL7l9pX@gmail.com>
 <1a2d0220-5862-4cba-8d0f-2eb7556c9620@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1a2d0220-5862-4cba-8d0f-2eb7556c9620@kernel.org>

On Wed, Jul 23, 2025 at 06:40:52AM +0200, Jiri Slaby wrote:
> On 22. 07. 25, 13:19, Qasim Ijaz wrote:
> > On Tue, Jul 22, 2025 at 11:16:15AM +0200, Jiri Slaby wrote:
> > > On 22. 07. 25, 10:00, Qasim Ijaz wrote:
> > > > A malicious HID device can trigger a slab out-of-bounds during
> > > > mt_report_fixup() by passing in report descriptor smaller than
> > > > 607 bytes. mt_report_fixup() attempts to patch byte offset 607
> > > > of the descriptor with 0x25 by first checking if byte offset
> > > > 607 is 0x15 however it lacks bounds checks to verify if the
> > > > descriptor is big enough before conducting this check. Fix
> > > > this vulnerability by ensuring the descriptor size is
> > > > greater than or equal to 608 before accessing it.
> > > > 
> > > > Below is the KASAN splat after the out of bounds access happens:
> > > > 
> > > > [   13.671954] ==================================================================
> > > > [   13.672667] BUG: KASAN: slab-out-of-bounds in mt_report_fixup+0x103/0x110
> > > > [   13.673297] Read of size 1 at addr ffff888103df39df by task kworker/0:1/10
> > > > [   13.673297]
> > > > [   13.673297] CPU: 0 UID: 0 PID: 10 Comm: kworker/0:1 Not tainted 6.15.0-00005-gec5d573d83f4-dirty #3
> > > > [   13.673297] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/04
> > > > [   13.673297] Call Trace:
> > > > [   13.673297]  <TASK>
> > > > [   13.673297]  dump_stack_lvl+0x5f/0x80
> > > > [   13.673297]  print_report+0xd1/0x660
> > > > [   13.673297]  kasan_report+0xe5/0x120
> > > > [   13.673297]  __asan_report_load1_noabort+0x18/0x20
> > > > [   13.673297]  mt_report_fixup+0x103/0x110
> > > > [   13.673297]  hid_open_report+0x1ef/0x810
> > > > [   13.673297]  mt_probe+0x422/0x960
> > > > [   13.673297]  hid_device_probe+0x2e2/0x6f0
> > > > [   13.673297]  really_probe+0x1c6/0x6b0
> > > > [   13.673297]  __driver_probe_device+0x24f/0x310
> > > > [   13.673297]  driver_probe_device+0x4e/0x220
> > > > [   13.673297]  __device_attach_driver+0x169/0x320
> > > > [   13.673297]  bus_for_each_drv+0x11d/0x1b0
> > > > [   13.673297]  __device_attach+0x1b8/0x3e0
> > > > [   13.673297]  device_initial_probe+0x12/0x20
> > > > [   13.673297]  bus_probe_device+0x13d/0x180
> > > > [   13.673297]  device_add+0xe3a/0x1670
> > > > [   13.673297]  hid_add_device+0x31d/0xa40
> > > > [...]
> > > > 
> > > > Fixes: c8000deb6836 ("HID: multitouch: Add support for GT7868Q")
> > > > Cc: stable@vger.kernel.org
> > > > Signed-off-by: Qasim Ijaz <qasdev00@gmail.com>
> > > > Reviewed-by: Dmitry Savin <envelsavinds@gmail.com>
> > > > ---
> > > >    drivers/hid/hid-multitouch.c | 25 ++++++++++++++++---------
> > > >    1 file changed, 16 insertions(+), 9 deletions(-)
> > > > 
> > > > diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
> > > > index 7ac8e16e6158..af4abe3ba410 100644
> > > > --- a/drivers/hid/hid-multitouch.c
> > > > +++ b/drivers/hid/hid-multitouch.c
> > > > @@ -1461,18 +1461,25 @@ static const __u8 *mt_report_fixup(struct hid_device *hdev, __u8 *rdesc,
> > > >    	if (hdev->vendor == I2C_VENDOR_ID_GOODIX &&
> > > >    	    (hdev->product == I2C_DEVICE_ID_GOODIX_01E8 ||
> > > >    	     hdev->product == I2C_DEVICE_ID_GOODIX_01E9)) {
> > > > -		if (rdesc[607] == 0x15) {
> > > > -			rdesc[607] = 0x25;
> > > > -			dev_info(
> > > > -				&hdev->dev,
> > > > -				"GT7868Q report descriptor fixup is applied.\n");
> > > > +		if (*size >= 608) {
> > > > +			if (rdesc[607] == 0x15) {
> > > > +				rdesc[607] = 0x25;
> > > > +				dev_info(
> > > > +					&hdev->dev,
> > > > +					"GT7868Q report descriptor fixup is applied.\n");
> > > > +			} else {
> > > > +				dev_info(
> > > > +					&hdev->dev,
> > > > +					"The byte is not expected for fixing the report descriptor. \
> > > > +					It's possible that the touchpad firmware is not suitable for applying the fix. \
> > > > +					got: %x\n",
> > > 
> > > This is wrong. You have all the spaces/tabs in the string now. Drop all the
> > > backslashes, and open and close the string on every line.
> > > 
> > > > +					rdesc[607]);
> > > > +			}
> > > 
> > > As this is superlong and superindented, perhaps introduce a new function for
> > > these devices?
> > > 
> > > >    		} else {
> > > >    			dev_info(
> > > >    				&hdev->dev,
> > > > -				"The byte is not expected for fixing the report descriptor. \
> > > > -It's possible that the touchpad firmware is not suitable for applying the fix. \
> > > > -got: %x\n",
> > > 
> > > This was horrid too, yeah.
> > > 
> > > > -				rdesc[607]);
> > > > +				"GT7868Q fixup: report descriptor only %u bytes, skipping\n",
> > > 
> > > A predicate missing. Eg. "has only", or "is only".
> > > 
> > 
> > Thanks for the feedback Jiri, I took the advice on board, is something
> > like this better?
> 
> Definitely.
> 
> >   static const __u8 *mt_report_fixup(struct hid_device *hdev, __u8 *rdesc,
> > 				   unsigned int *size)
> >   {
> >            if (hdev->vendor == I2C_VENDOR_ID_GOODIX &&
> >                (hdev->product == I2C_DEVICE_ID_GOODIX_01E8 ||
> >                 hdev->product == I2C_DEVICE_ID_GOODIX_01E9)) {
> > 		 if (*size < 608) {
> > 			 dev_info(
> > 				 &hdev->dev,
> > 				 "GT7868Q fixup: report descriptor is only %u bytes, skipping\n",
> > 				 *size);
> >                            return rdesc;
> >                    }
> > 		 if (rdesc[607] == 0x15) {
> > 			 rdesc[607] = 0x25;
> > 			 dev_info(
> > 				 &hdev->dev,
> > 				 "GT7868Q fixup: report descriptor fixup is applied.\n");
> > 		 } else {
> > 			 dev_info(&hdev->dev,
> > 				 "GT7868Q fixup: offset 607 is %x (expected 0x15), "
> > 				 "descriptor may be malformed, skipping\n",
> > 				 rdesc[607]);
> > 		 }
> > 	  }
> >   	  return rdesc;
> >   }
> > 
> > the key changes I made are:
> > 
> > - Move size check to the top, this way the indentation level is decent
> > - get rid of message backslashes
> > - shorten the fixup failure message when rdesc[607] is not 0x15 and make
> >    it a bit clearer since this message was the longest - just a minor
> >    cleanup
> > - added "is only %u bytes" as you suggested
> > 
> > if this is all good I can send v2.
> 
> I would invert the conditions. So the code would look like:
> 
> static bool goodix_needs_fixup(hdev)
> {
>   if (hdev->vendor != I2C_VENDOR_ID_GOODIX)
>     return false;
> 
>  return hdev->product == I2C_DEVICE_ID_GOODIX_01E8 ||
>                  hdev->product == I2C_DEVICE_ID_GOODIX_01E9;
> }
> 
> static const __u8 *mt_report_fixup(struct hid_device *hdev, __u8 *rdesc,
>  				   unsigned int *size)
> {
>   if (!goodix_needs_fixup(hdev))
>     return rdesc;
> 
>   if (*size < 608) {
>     dev_info(&hdev->dev,
>              "GT7868Q fixup: report descriptor is only %u bytes,
> skipping\n",
>  	     *size);
>     return rdesc;
>   }
> 
>   if (rdesc[607] != 0x15) {
>     dev_info(&hdev->dev,
>  	 "GT7868Q fixup: offset 607 is %x (expected 0x15), descriptor may be
> malformed, skipping\n",
>          rdesc[607]);
>     return rdesc;
>   }
> 
>   rdesc[607] = 0x25;
>   dev_info(&hdev->dev,
>  	 "GT7868Q fixup: report descriptor fixup is applied.\n");
> 
>   return rdesc;
> }

Thanks Jiri, this looks good. I think Ill split this into 2 patches
one for fixing the OOB with a size check and the second for a general
function cleanup. Hope that sounds good.

Thanks
qasim
> 
> thanks,
> -- 
> js
> suse labs

