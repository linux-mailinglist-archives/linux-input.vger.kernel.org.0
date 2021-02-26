Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7AB7732658B
	for <lists+linux-input@lfdr.de>; Fri, 26 Feb 2021 17:29:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229571AbhBZQ3K (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 26 Feb 2021 11:29:10 -0500
Received: from netrider.rowland.org ([192.131.102.5]:44689 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S229727AbhBZQ3I (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 26 Feb 2021 11:29:08 -0500
Received: (qmail 1393709 invoked by uid 1000); 26 Feb 2021 11:28:21 -0500
Date:   Fri, 26 Feb 2021 11:28:21 -0500
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Sabyrzhan Tasbolatov <snovitoll@gmail.com>
Cc:     benjamin.tissoires@redhat.com, jikos@kernel.org,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org,
        syzbot+ab02336a647181a886a6@syzkaller.appspotmail.com
Subject: Re: [PATCH] drivers/hid: fix for the big hid report length
Message-ID: <20210226162821.GA1392547@rowland.harvard.edu>
References: <20210225155914.GA1350993@rowland.harvard.edu>
 <20210226081336.3475085-1-snovitoll@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210226081336.3475085-1-snovitoll@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Feb 26, 2021 at 02:13:36PM +0600, Sabyrzhan Tasbolatov wrote:
> On Thu, 25 Feb 2021 10:59:14 -0500, Alan Stern wrote:
> > Won't this cause silent errors?
> 
> Agree. But there are already such as cases like in:
> 
> // net/bluetooth/hidp/core.c
> static void hidp_process_report(..)
> {
> 	..
> 	if (len > HID_MAX_BUFFER_SIZE)
> 		len = HID_MAX_BUFFER_SIZE;
> 	..
> 
> // drivers/hid/hid-core.c
> int hid_report_raw_event(..)
> {
> 	..
> 	rsize = hid_compute_report_size(report);
> 
> 	if (report_enum->numbered && rsize >= HID_MAX_BUFFER_SIZE)
> 		rsize = HID_MAX_BUFFER_SIZE - 1;
> 	else if (rsize > HID_MAX_BUFFER_SIZE)
> 		rsize = HID_MAX_BUFFER_SIZE;
> 	..
> 
> // drivers/staging/greybus/hid.c
> static int gb_hid_start(..)
> {
> 	..
> 	if (bufsize > HID_MAX_BUFFER_SIZE)
> 		bufsize = HID_MAX_BUFFER_SIZE;
> 	..
> 
> > How about instead just rejecting any device which includes a report 
> > whose length is too big (along with an line in the system log explaining 
> > what's wrong)?
> 
> Not everywhere, but there are already such as logs when > HID_MAX_BUFFER_SIZE
> 
> // drivers/hid/hidraw.c
> static ssize_t hidraw_send_report(..)
> {
> 	..
> 	if (count > HID_MAX_BUFFER_SIZE) {
> 		hid_warn(dev, "pid %d passed too large report\n",
> 			 task_pid_nr(current));
> 		ret = -EINVAL;
> 		goto out;
> 	}
> 
> 
> I've just noticed that hid_compute_report_size() doing the same thing as
> hid_report_len(). So I will replace it with latter one with length check.
> 
> So in [PATCH v2] I will do following:
> 
>  1. replace hid_compute_report_size() with hid_report_len()
> 
>  2. in hid_report_len() we can hid_warn() if length > HID_MAX_BUFFER_SIZE,
> and return HID_MAX_BUFFER_SIZE. Or we can return 0 in hid_report_len() to let
> functions like hid_hw_raw_request(), hid_hw_output_report() to validate
> invalid report length and return -EINVAL. Though I'll need to add !length
> missing checks in other places.
> 
> Please let me know what it's preferred way in 2nd step.

It's been too long since I worked on this stuff; you should check with 
the maintainers.

Another thing to consider: There probably are devices with multiple 
reports, where one of the reports is too big but people only want to use 
the other, smaller reports.  For situations like that, we don't want to 
reject the entire device.

I don't know if parsing a partiall part is a good thing to do.

Alan Stern
