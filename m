Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E78D94592F3
	for <lists+linux-input@lfdr.de>; Mon, 22 Nov 2021 17:25:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239456AbhKVQ2l (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 22 Nov 2021 11:28:41 -0500
Received: from smtp161.vfemail.net ([146.59.185.161]:43089 "EHLO
        smtp161.vfemail.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239248AbhKVQ2k (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 22 Nov 2021 11:28:40 -0500
Received: (qmail 21760 invoked from network); 22 Nov 2021 16:25:32 +0000
Received: from localhost (HELO nl101-3.vfemail.net) ()
  by smtpout.vfemail.net with ESMTPS (ECDHE-RSA-AES256-GCM-SHA384 encrypted); 22 Nov 2021 16:25:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=vfemail.net; h=date:from
        :to:cc:subject:message-id:in-reply-to:references:mime-version
        :content-type; s=2018; bh=Yn36v4AiNxclx1tNvaBqtsHatQjdCBBOn8+d0S
        MzE0k=; b=r62HmeEJR74dDlcU/Q5QX6ZmMtBo3c6TlPigVDxj3aBuo9rbAFTl9W
        RP0MpZWXArDgZHghXHVL2GsCOkvpVavx148LsYzMQchOx37mvNnNSJ3ykBqbThRw
        CnCM33386dk2keS9cDArS4ZiNjtyd4/sS/3Mc6j5pk5Vy0itzJjoc=
Received: (qmail 2582 invoked from network); 22 Nov 2021 16:25:02 -0000
Received: by simscan 1.4.0 ppid: 2469, pid: 2549, t: 0.3627s
         scanners:none
Received: from unknown (HELO bmwxMDEudmZlbWFpbC5uZXQ=) (aGdudGt3aXNAdmZlbWFpbC5uZXQ=@MTkyLjE2OC4xLjE5Mg==)
  by nl101.vfemail.net with ESMTPA; 22 Nov 2021 16:25:02 -0000
Date:   Mon, 22 Nov 2021 11:25:26 -0500
From:   David Niklas <Hgntkwis@vfemail.net>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-input@vger.kernel.org
Subject: Re: I need advice with UPS connection. (ping)
Message-ID: <20211122112526.501c5f66@Zen-II-x12.niklas.com>
In-Reply-To: <YZm03KTcWOwtMtCN@rowland.harvard.edu>
References: <20201109220000.2ae98fa5@Phenom-II-x6.niklas.com>
        <20211114144842.72463ccc@Zen-II-x12.niklas.com>
        <20211114211435.GA87082@rowland.harvard.edu>
        <20211114220222.31755871@Zen-II-x12.niklas.com>
        <20211115160918.GB109771@rowland.harvard.edu>
        <20211117002359.03b36ec6@Zen-II-x12.niklas.com>
        <20211117170817.GD172151@rowland.harvard.edu>
        <20211119171915.6a8cac47@Zen-II-x12.niklas.com>
        <YZm03KTcWOwtMtCN@rowland.harvard.edu>
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="MP_/ykgYVuofXVEQ4xR9jXv_Yji"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

--MP_/ykgYVuofXVEQ4xR9jXv_Yji
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Sat, 20 Nov 2021 21:54:20 -0500
Alan Stern <stern@rowland.harvard.edu> wrote:
> On Fri, Nov 19, 2021 at 05:19:15PM -0500, David Niklas wrote:
> > On Wed, 17 Nov 2021 12:08:17 -0500
> > Alan Stern <stern@rowland.harvard.edu> wrote:  
<snip>
> > > This will cause the kernel to ask for 1060 bytes rather than 996.
> > > (It's also potentially dangerous, because it asks for 1060 bytes to
> > > be stored into a 996-byte buffer; if the device sends more data than
> > > expected then the excess will be written beyond the end of the
> > > buffer.)
> > > 
> > > Please send a usbmon trace showing what happens with this patch
> > > applied. And you might as well put the Set-Idle request back in,
> > > because now we know Windows does send that request.
> > >   
> > <snip>
> > 
> > It still disconnects. I've attached the usbmon output.  
> 
> The trace clearly shows the request for a 1060-byte HID report 
> descriptor and the device sending back a 996-byte reply, just like in 
> Windows.  And yet the disconnect still occurs.
> 
> The only remaining difference is the transfer of string descriptors.  
> You can prevent Linux from asking for them by editing usb_string() in 
> drivers/usb/core/message.c.  Just make the function return -ENOMEM 
> unconditionally.  That will stop the requests from going out.
> 
> Alan Stern
> 

Ok, I first edited the kernel to return -ENOMEM like you suggested but
the UPS still disconnected. I then edited it again to re-add the 1060
byte request and the UPS still disconnected.

I'm attaching the usbmon traces.
If you need any additional info I'll do my best to provide it.

Thanks,
David

--MP_/ykgYVuofXVEQ4xR9jXv_Yji
Content-Type: application/x-bzip
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename=mon3.txt.bz2

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
Ak/8CT9hJ/gUE9iJ/8XckU4UJC203/KA

--MP_/ykgYVuofXVEQ4xR9jXv_Yji
Content-Type: application/x-bzip
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename=mon4.txt.bz2

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

--MP_/ykgYVuofXVEQ4xR9jXv_Yji--
