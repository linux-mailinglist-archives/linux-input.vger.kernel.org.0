Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E786D457890
	for <lists+linux-input@lfdr.de>; Fri, 19 Nov 2021 23:19:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235253AbhKSWWY (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 19 Nov 2021 17:22:24 -0500
Received: from smtp161.vfemail.net ([146.59.185.161]:34627 "EHLO
        smtp161.vfemail.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233130AbhKSWWY (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 19 Nov 2021 17:22:24 -0500
Received: (qmail 27228 invoked from network); 19 Nov 2021 22:19:20 +0000
Received: from localhost (HELO nl101-3.vfemail.net) ()
  by smtpout.vfemail.net with ESMTPS (ECDHE-RSA-AES256-GCM-SHA384 encrypted); 19 Nov 2021 22:19:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=vfemail.net; h=date:from
        :to:cc:subject:message-id:in-reply-to:references:mime-version
        :content-type; s=2018; bh=myT9eKrgls8cEoM0PPQ6MK9WBLOaXq1G6ir5qs
        GklFY=; b=SYNqFlwbMKvd6ek23r5XngIQOzkBgKJLPsKI+4y4iG9oHiYwCsTlyE
        RKJvD9MKPAeVaawT0ZWYj1tr4ZnO2rwlbR0PigNwTfwVG3s6sQGGKDg+B1hmNPMS
        HwUDpdXt9ObsIQM883ra1SIxm5bWPJBC+agndE8dIQeHp/cSN7xYY=
Received: (qmail 76383 invoked from network); 19 Nov 2021 22:18:50 -0000
Received: by simscan 1.4.0 ppid: 76362, pid: 76370, t: 0.3777s
         scanners:none
Received: from unknown (HELO bmwxMDEudmZlbWFpbC5uZXQ=) (aGdudGt3aXNAdmZlbWFpbC5uZXQ=@MTkyLjE2OC4xLjE5Mg==)
  by nl101.vfemail.net with ESMTPA; 19 Nov 2021 22:18:50 -0000
Date:   Fri, 19 Nov 2021 17:19:15 -0500
From:   David Niklas <Hgntkwis@vfemail.net>
To:     linux-kernel@vger.kernel.org
Cc:     Alan Stern <stern@rowland.harvard.edu>, linux-usb@vger.kernel.org,
        linux-input@vger.kernel.org
Subject: Re: I need advice with UPS connection. (ping)
Message-ID: <20211119171915.6a8cac47@Zen-II-x12.niklas.com>
In-Reply-To: <20211117170817.GD172151@rowland.harvard.edu>
References: <20201109220000.2ae98fa5@Phenom-II-x6.niklas.com>
        <20211114144842.72463ccc@Zen-II-x12.niklas.com>
        <20211114211435.GA87082@rowland.harvard.edu>
        <20211114220222.31755871@Zen-II-x12.niklas.com>
        <20211115160918.GB109771@rowland.harvard.edu>
        <20211117002359.03b36ec6@Zen-II-x12.niklas.com>
        <20211117170817.GD172151@rowland.harvard.edu>
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="MP_/a0+.=KjGjvaZMcuyW50M2nw"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

--MP_/a0+.=KjGjvaZMcuyW50M2nw
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Wed, 17 Nov 2021 12:08:17 -0500
Alan Stern <stern@rowland.harvard.edu> wrote:
> On Wed, Nov 17, 2021 at 12:23:59AM -0500, David Niklas wrote:
> > On Mon, 15 Nov 2021 11:09:18 -0500
> > stern@rowland.harvard.edu wrote:
> > <snip>  
> > > You can test the theory by patching the kernel, if you want.  The
> > > code to change is in the source file drivers/hid/usbhid/hid-core.c,
> > > and the function in question is hid_set_idle() located around line
> > > 659 in the file.  Just change the statement:
> > > 
> > > 	return usb_control_msg(dev, usb_sndctrlpipe(dev, 0),
> > > 		HID_REQ_SET_IDLE, USB_TYPE_CLASS |
> > > USB_RECIP_INTERFACE, (idle << 8) | report, ifnum, NULL, 0,
> > > USB_CTRL_SET_TIMEOUT);
> > > 
> > > to:
> > > 
> > > 	return 0;
> > >
> > > to prevent the Set-Idle request from being sent.  If the device
> > > still insists on disconnecting then we'll know that this wasn't the
> > > reason. 
> > 
> > Ok, so I changed out the line above with "__panic(2);" and now my PC
> > just reboots....    Teasing :D
> > That didn't seem to change anything. I'll attach another dump just in
> > case it reveals more.  
> 
> It doesn't.  :-(  The Set-Idle request does not appear to be related to 
> the problem.
> 
> > > Also, if you have another system (say, one running Windows) which
> > > the UPS does work properly with, you could try collecting the
> > > equivalent of a usbmon trace from that system for purposes of
> > > comparison.  (On Windows, I believe you can use Wireshark to trace
> > > USB communications.) 
> > 
> > Limitations of SW:
> > Wireshark works if you have windows in a virtual environment, but I
> > don't actually own... I mean license, any windowz products. I'm a
> > straight Luser.
> > So borrowed a windowz machine and plugged in the UPS. I then used
> > USBPcap to capture the data after installing the drivers. It has 4
> > things it can't detect:
> > 
> > Bus states (Suspended, Power ON, Power OFF, Reset, High Speed
> > Detection Handshake)
> > Packet ID (PID)
> > Split transactions (CSPLIT, SSPLIT)
> > Duration of bus state and time used to transfer packet over the wire
> > Transfer speed (Low Speed, Full Speed, High Speed)
> > 
> > I'm 100% certain the last 2 we don't care about. IDK about the
> > others.  
> 
> I don't think they matter.  In principle the time delays might be 
> important, but I rather doubt it.
> 
> > Notes:
> > Here's the product page of my UPS.
> > https://www.newegg.com/opti-ups-ts2250b/p/N82E16842107014
> > The main webpage for USBPcap is here:
> > https://desowin.org/usbpcap/index.html
> > I can also try and use SnoopyPro and busdog if the output is
> > undesirable. USBPcap spits out a pcap file which can be analyzed by
> > wireshark using dissectors -- somehow (I really should practice using
> > wireshark.)  
> 
> Wireshark on my system has no trouble reading your pcap file.

Misunderstanding then. I was thinking in terms of the USBPcap docs. I was
saying a dissector would need to be written. I'm glad it worked for you.
https://desowin.org/usbpcap/dissectors.html
"Writing USB class dissector"

> > Test and capture procedure:
> > When I installed the drivers it asked me where to look for the UPS. I
> > didn't tell it the USB port until after I started USBPcap and then
> > plugged in the UPS. Then the GUI opened up and I could see a lot of
> > cool controls like the battery power, loading, etc. The loading was
> > 132W and the battery was at 100%. Then I ran a self test (There's a
> > button in the GUI) and it worked fine. Then I unplugged the UPS and
> > it crashed. Then I plugged it back in. All --100%-- of this is in the
> > pcap file.  
> 
> I'm just concentrating on the first part, up to the point where the 
> unwanted disconnects occurred with Linux.  So far as I can see, there 
> are only two significant differences between the usbmon and wireshark 
> traces:
> 
> 	The Windows system doesn't transfer any of the string 
> 	descriptors during initial enumeration, whereas the Linux
> 	system does.  While this might be relevant, I don't think it is.
> 
> 	When the Windows system requests the HID report descriptor from 
> 	the device, it asks for 1060 bytes of data.  The Linux system
> 	asks for only 996 bytes.  (Note: The descriptor is exactly
> 	996 bytes long, and that's how much data the device sends in
> 	either case.)
> 
> It's entirely possible that this second discrepancy is somehow causing 
> the problem.  You can test this guess by applying the following patch:
> 
> --- usb-devel.orig/drivers/hid/usbhid/hid-core.c
> +++ usb-devel/drivers/hid/usbhid/hid-core.c
> @@ -667,13 +667,16 @@ static int hid_get_class_descriptor(stru
>  		unsigned char type, void *buf, int size)
>  {
>  	int result, retries = 4;
> +	int size2 = size;
>  
> +	if (size == 996)
> +		size2 = 1060;
>  	memset(buf, 0, size);
>  
>  	do {
>  		result = usb_control_msg(dev, usb_rcvctrlpipe(dev, 0),
>  				USB_REQ_GET_DESCRIPTOR,
> USB_RECIP_INTERFACE | USB_DIR_IN,
> -				(type << 8), ifnum, buf, size,
> USB_CTRL_GET_TIMEOUT);
> +				(type << 8), ifnum, buf, size2,
> USB_CTRL_GET_TIMEOUT); retries--;
>  	} while (result < size && retries);
>  	return result;
> 
> This will cause the kernel to ask for 1060 bytes rather than 996.
> (It's also potentially dangerous, because it asks for 1060 bytes to be
> stored into a 996-byte buffer; if the device sends more data than
> expected then the excess will be written beyond the end of the buffer.)
> 
> Please send a usbmon trace showing what happens with this patch
> applied. And you might as well put the Set-Idle request back in,
> because now we know Windows does send that request.
> 
<snip>

It still disconnects. I've attached the usbmon output.

Thanks,
David


--MP_/a0+.=KjGjvaZMcuyW50M2nw
Content-Type: application/x-bzip
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename=mon2.txt.bz2

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
A/oUB+gRP2DBQfSKn/i7kinChIX/0UBQ

--MP_/a0+.=KjGjvaZMcuyW50M2nw--
