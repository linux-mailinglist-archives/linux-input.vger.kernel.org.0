Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B9C2F1AF683
	for <lists+linux-input@lfdr.de>; Sun, 19 Apr 2020 06:09:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725914AbgDSEJs (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 19 Apr 2020 00:09:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725802AbgDSEJs (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 19 Apr 2020 00:09:48 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E727FC061A0C;
        Sat, 18 Apr 2020 21:09:47 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id g30so3256539pfr.3;
        Sat, 18 Apr 2020 21:09:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=p0eboCpYrIW7cZXRq3W9GXkR9ChXd+J6/t2MfQz3F8Y=;
        b=eKlYUCngzIFVT0MKRE11BHxe8+C3Ud2C7LZoCUArHZBEJUdX+42tOqfIo2b/kmy/Cl
         MElb0EEAG4reWnO6aSj7WGadRN1oGCylVnHNNBx7KSkvr07s4cXT/JTElbTDKAohNosN
         Ubo893WlHm3fq0wm1VGAIO8rxTzAAF+RQm93O8PYE1lHV+WfoOXvGdihdAuX3QUsBKDs
         fSMS+gar8CgQg4ShafZ2PVqQxJ6cVvzWti+QKeQTrZf+SOtOJp2Tfts8ojWJSg4KwUVd
         1U4dCmt8SKSEL6sigtm3oZJ2Jh9ptPH0nxMiC5TlZbSzsPWTL/REG1WBGl0o+ESCSOMW
         wpbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=p0eboCpYrIW7cZXRq3W9GXkR9ChXd+J6/t2MfQz3F8Y=;
        b=FMepXcWlCfejlBf7iJuJwkP6LnBArD6RZ7tq33AWiK8B1kUlAer8szI62hF9hMv67H
         O4G1S3zF0lx5K40IKsVXSWBtEyFP1kFYQzBxmuCxajLI6OUobGw+1hx98SfYSm+5431k
         etulvXbeVvKyVn1uV9RffkHScEWTOIYYWpFPsRCeD+xCuExd390/uOuaIRcCfIDCctpP
         E8b0uYYRfC0mH4eRrQh9duRj3uzSx5nX9eT93fDrc7UogYo3FCdFyRKBlyZ88aVMGwIb
         GOc42z9vWSjk1i6qLJril/s3OZY50PEdN1Ywq5Fl/P720BgK2OZX/6MQlhLMeyJQdhg0
         HG3w==
X-Gm-Message-State: AGi0PuZ6WMRQV+GQ4He3yqkHXNVYDggqMhSzbgywuucU138kaJ6WejOo
        tFpEH9opNvvQ69TZvUmYKv3vaHlW
X-Google-Smtp-Source: APiQypKOrqvpIGX1snWOQ7R01Vhdg9xU+aF/SAEyRLt45stMI5dRrOUqRd2a6Drmfba3dH7TciDekA==
X-Received: by 2002:a63:e56:: with SMTP id 22mr10504113pgo.173.1587269387161;
        Sat, 18 Apr 2020 21:09:47 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3c2a:73a9:c2cf:7f45])
        by smtp.gmail.com with ESMTPSA id u13sm10212710pjb.45.2020.04.18.21.09.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Apr 2020 21:09:46 -0700 (PDT)
Date:   Sat, 18 Apr 2020 21:09:44 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Julian Squires <julian@cipht.net>,
        Hans de Goede <hdegoede@redhat.com>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        syzbot <syzbot+7bf5a7b0f0a1f9446f4c@syzkaller.appspotmail.com>,
        linux-input@vger.kernel.org, andreyknvl@google.com,
        gregkh@linuxfoundation.org, ingrassia@epigenesys.com,
        Kernel development list <linux-kernel@vger.kernel.org>,
        USB list <linux-usb@vger.kernel.org>,
        syzkaller-bugs@googlegroups.com
Subject: Re: KASAN: use-after-free Read in usbhid_close (3)
Message-ID: <20200419040944.GB166864@dtor-ws>
References: <000000000000f610e805a39af1d0@google.com>
 <Pine.LNX.4.44L0.2004182158020.26218-100000@netrider.rowland.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44L0.2004182158020.26218-100000@netrider.rowland.org>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Alan,

On Sat, Apr 18, 2020 at 10:16:32PM -0400, Alan Stern wrote:
> linux-input people:
> 
> syzbot has found a bug related to USB/HID/input, and I have narrowed it
> down to the wacom driver.  As far as I can tell, the problem is caused
> the fact that drivers/hid/wacom_sys.c calls input_register_device()
> in several places, but it never calls input_unregister_device().
> 
> I know very little about the input subsystem, but this certainly seems 
> like a bug.

Wacom driver uses devm_input_allocate_device(), so unregister should
happen automatically on device removal once we exit wacom_probe().

> 
> When the device is unplugged, the disconnect pathway doesn't call
> hid_hw_close().  That routine doesn't get called until the user closes
> the device file (which can be long after the device is gone and
> hid_hw_stop() has run).  Then usbhid_close() gets a use-after-free
> error when it tries to access data structures that were deallocated by
> usbhid_stop().  No doubt there are other problems too, but this is
> the one that syzbot found.

Unregistering the input device should result in calling wacom_close()
(if device was previously opened), which, as far as I can tell, calls
hid_hw_close().

I wonder if it is valid to call hid_hw_stop() before hid_hw_close()?

It could be that we again get confused by the "easiness" of devm APIs
and completely screwing up unwind order.

Thanks.

-- 
Dmitry
