Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE0C5454BA0
	for <lists+linux-input@lfdr.de>; Wed, 17 Nov 2021 18:08:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232750AbhKQRLR (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 17 Nov 2021 12:11:17 -0500
Received: from netrider.rowland.org ([192.131.102.5]:54051 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S229585AbhKQRLR (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 17 Nov 2021 12:11:17 -0500
Received: (qmail 176265 invoked by uid 1000); 17 Nov 2021 12:08:17 -0500
Date:   Wed, 17 Nov 2021 12:08:17 -0500
From:   Alan Stern <stern@rowland.harvard.edu>
To:     David Niklas <Hgntkwis@vfemail.net>
Cc:     linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-input@vger.kernel.org
Subject: Re: I need advice with UPS connection. (ping)
Message-ID: <20211117170817.GD172151@rowland.harvard.edu>
References: <20201109220000.2ae98fa5@Phenom-II-x6.niklas.com>
 <20211114144842.72463ccc@Zen-II-x12.niklas.com>
 <20211114211435.GA87082@rowland.harvard.edu>
 <20211114220222.31755871@Zen-II-x12.niklas.com>
 <20211115160918.GB109771@rowland.harvard.edu>
 <20211117002359.03b36ec6@Zen-II-x12.niklas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211117002359.03b36ec6@Zen-II-x12.niklas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Nov 17, 2021 at 12:23:59AM -0500, David Niklas wrote:
> On Mon, 15 Nov 2021 11:09:18 -0500
> stern@rowland.harvard.edu wrote:
> <snip>
> > You can test the theory by patching the kernel, if you want.  The code 
> > to change is in the source file drivers/hid/usbhid/hid-core.c, and the 
> > function in question is hid_set_idle() located around line 659 in the 
> > file.  Just change the statement:
> > 
> > 	return usb_control_msg(dev, usb_sndctrlpipe(dev, 0),
> > 		HID_REQ_SET_IDLE, USB_TYPE_CLASS | USB_RECIP_INTERFACE,
> > (idle << 8) | report, ifnum, NULL, 0, USB_CTRL_SET_TIMEOUT);
> > 
> > to:
> > 
> > 	return 0;
> >
> > to prevent the Set-Idle request from being sent.  If the device still 
> > insists on disconnecting then we'll know that this wasn't the reason.
> > 
> 
> Ok, so I changed out the line above with "__panic(2);" and now my PC just
> reboots....    Teasing :D
> That didn't seem to change anything. I'll attach another dump just in
> case it reveals more.

It doesn't.  :-(  The Set-Idle request does not appear to be related to 
the problem.

> > Also, if you have another system (say, one running Windows) which the 
> > UPS does work properly with, you could try collecting the equivalent of 
> > a usbmon trace from that system for purposes of comparison.  (On 
> > Windows, I believe you can use Wireshark to trace USB communications.)
> > 
> 
> Limitations of SW:
> Wireshark works if you have windows in a virtual environment, but I don't
> actually own... I mean license, any windowz products. I'm a straight
> Luser.
> So borrowed a windowz machine and plugged in the UPS. I then used USBPcap
> to capture the data after installing the drivers. It has 4 things it can't
> detect:
> 
> Bus states (Suspended, Power ON, Power OFF, Reset, High Speed Detection
> Handshake)
> Packet ID (PID)
> Split transactions (CSPLIT, SSPLIT)
> Duration of bus state and time used to transfer packet over the wire
> Transfer speed (Low Speed, Full Speed, High Speed)
> 
> I'm 100% certain the last 2 we don't care about. IDK about the others.

I don't think they matter.  In principle the time delays might be 
important, but I rather doubt it.

> Notes:
> Here's the product page of my UPS.
> https://www.newegg.com/opti-ups-ts2250b/p/N82E16842107014
> The main webpage for USBPcap is here:
> https://desowin.org/usbpcap/index.html
> I can also try and use SnoopyPro and busdog if the output is undesirable.
> USBPcap spits out a pcap file which can be analyzed by wireshark
> using dissectors -- somehow (I really should practice using wireshark.)

Wireshark on my system has no trouble reading your pcap file.

> Test and capture procedure:
> When I installed the drivers it asked me where to look for the UPS. I
> didn't tell it the USB port until after I started USBPcap and then
> plugged in the UPS. Then the GUI opened up and I could see a lot of cool
> controls like the battery power, loading, etc. The loading was 132W and
> the battery was at 100%. Then I ran a self test (There's a button in the
> GUI) and it worked fine. Then I unplugged the UPS and it crashed. Then I
> plugged it back in. All --100%-- of this is in the pcap file.

I'm just concentrating on the first part, up to the point where the 
unwanted disconnects occurred with Linux.  So far as I can see, there 
are only two significant differences between the usbmon and wireshark 
traces:

	The Windows system doesn't transfer any of the string 
	descriptors during initial enumeration, whereas the Linux
	system does.  While this might be relevant, I don't think it is.

	When the Windows system requests the HID report descriptor from 
	the device, it asks for 1060 bytes of data.  The Linux system
	asks for only 996 bytes.  (Note: The descriptor is exactly
	996 bytes long, and that's how much data the device sends in
	either case.)

It's entirely possible that this second discrepancy is somehow causing 
the problem.  You can test this guess by applying the following patch:

--- usb-devel.orig/drivers/hid/usbhid/hid-core.c
+++ usb-devel/drivers/hid/usbhid/hid-core.c
@@ -667,13 +667,16 @@ static int hid_get_class_descriptor(stru
 		unsigned char type, void *buf, int size)
 {
 	int result, retries = 4;
+	int size2 = size;
 
+	if (size == 996)
+		size2 = 1060;
 	memset(buf, 0, size);
 
 	do {
 		result = usb_control_msg(dev, usb_rcvctrlpipe(dev, 0),
 				USB_REQ_GET_DESCRIPTOR, USB_RECIP_INTERFACE | USB_DIR_IN,
-				(type << 8), ifnum, buf, size, USB_CTRL_GET_TIMEOUT);
+				(type << 8), ifnum, buf, size2, USB_CTRL_GET_TIMEOUT);
 		retries--;
 	} while (result < size && retries);
 	return result;

This will cause the kernel to ask for 1060 bytes rather than 996.  (It's 
also potentially dangerous, because it asks for 1060 bytes to be stored 
into a 996-byte buffer; if the device sends more data than expected then 
the excess will be written beyond the end of the buffer.)

Please send a usbmon trace showing what happens with this patch applied.  
And you might as well put the Set-Idle request back in, because now we 
know Windows does send that request.

> Results of:
> After unplugging the UPS it's battery dropped to 22% and then it turned
> off. My UPS is 2y and 5m old. It has a 3Y parts warranty. I guess I'll
> see if they'll honor it.
> 
> 
> 
> 
> I'm still interested in talking to it via my Linux PC, of course.

Let's see if the patch will avert the disconnect.

Alan Stern
