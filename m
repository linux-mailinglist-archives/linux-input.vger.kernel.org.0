Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 50A8F44FB57
	for <lists+linux-input@lfdr.de>; Sun, 14 Nov 2021 20:51:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236257AbhKNTyg (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 14 Nov 2021 14:54:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236473AbhKNTyY (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 14 Nov 2021 14:54:24 -0500
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBB61C061746
        for <linux-input@vger.kernel.org>; Sun, 14 Nov 2021 11:51:26 -0800 (PST)
Received: by mail-ed1-x52a.google.com with SMTP id b15so61902113edd.7
        for <linux-input@vger.kernel.org>; Sun, 14 Nov 2021 11:51:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=I52xYCXQ5bgAIm/MKSl0lPEOsRdPwmhdh9rDl2mM00I=;
        b=GcHf2sVR3nuExRNU85LRoSx0NGtCfpfTGhcIaSIYqICA9Iuep0M+ZANJ/aa3wNUSeF
         nNHRPFbhJrJRdV2Fi8sz490I/HPoN4qLHTRLpuov8EndF0gQPg0hsxYQRm0urO/oMz3Z
         kuAo4DSL3WBQMT2LBJIBi/GOMvbdbIL9CN0d0NrmZi7wZk/TNJrF2MZuFoU3pk95UfuE
         r2XhUmFpx86rGOCMkfrnDwQIvbY1YAlT1t8dCrXao8rtY7hLxbY+yhjxSy9xViuvir1S
         FxPNvTkowIbcijZ11aDkCdsdtrLklAWt3Ung96v9tu0PmRLHEsYm1mSevDB4fVwZ23zc
         vEMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=I52xYCXQ5bgAIm/MKSl0lPEOsRdPwmhdh9rDl2mM00I=;
        b=nin1mQkrvi9FvhonTTF+u3oWokaOwJXkFN1BWFrnyvO3SQ5z6pixSYX89Hf3NFoT+x
         aQkumeYVrlt8uuFZyxr3G8suV0V3OfEgrTK7UCewzsyS+ID1jLz2Piz/6MLlXgFvHJYw
         632nPJ+yWHBVNLR1bBvDZrMbrbPLv9I/L0oL8SjfExOSaSjB3z0Y/O+EJNb4NzFrIgDh
         WKpVkpenOwza8S6xoAh0JIe8pirNn2xk9oZcPs89Pb3qxD0GyQ4mCYMIzY+ALT7DW3pH
         nMH2IXSHUnt4UeC8+0sdk/JM9KNIQ+5rOO8zoA3cLGRBOypj3EWMrpZsq5V/f6y5iANW
         mSKA==
X-Gm-Message-State: AOAM531n8xhqy18KMPNWBYDacXU0bMABhTonJtMk8eF7wXlSr98/pjbB
        pGwzqTAMr8lu5PqME34eNS4=
X-Google-Smtp-Source: ABdhPJz/WMA0u15/l0svrL6F0sMlcQA6uDXGso6GISCivsXZR6pv5yyw4i5JRKdAbpiPvCKdA4TT2w==
X-Received: by 2002:a05:6402:4316:: with SMTP id m22mr48408626edc.349.1636919485269;
        Sun, 14 Nov 2021 11:51:25 -0800 (PST)
Received: from rechenknecht2k11 (200116b8456c370014a1cb2603939609.dip.versatel-1u1.de. [2001:16b8:456c:3700:14a1:cb26:393:9609])
        by smtp.googlemail.com with ESMTPSA id k9sm6139608edo.87.2021.11.14.11.51.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Nov 2021 11:51:25 -0800 (PST)
Date:   Sun, 14 Nov 2021 20:51:22 +0100
From:   Benjamin Valentin <benpicco@googlemail.com>
To:     Cameron Gutman <aicommander@gmail.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org, Lee Jones <lee.jones@linaro.org>
Subject: Re: Input: xpad - add more Xbox one controller IDs
Message-ID: <20211114205122.575567c6@rechenknecht2k11>
In-Reply-To: <dd40fcf9-582f-d5fd-4eec-ef06a8ecdf3b@gmail.com>
References: <20211113131734.46fbc9bf@rechenknecht2k11>
        <dd40fcf9-582f-d5fd-4eec-ef06a8ecdf3b@gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sat, 13 Nov 2021 19:34:54 -0600
Cameron Gutman <aicommander@gmail.com> wrote:

> For 1, the way Windows does it is via the Microsoft OS descriptor [0].
> AFAIK, the specific OS descriptor strings are "XUSB20" for Xbox 360
> and "XGIP10" for Xbox One.
> 
> That functionality is handled by xpad_table[] and the
> bInterfaceProtocol detection logic in xpad_probe(). The xpad_device[]
> entry isn't required for detection or functionality of devices,
> unless those devices need special treatment like
> MAP_TRIGGERS_TO_BUTTONS or something.

The problem is that the gamepad then gets assigned the type
XTYPE_UNKNOWN which excludes it from all run-time code path switches.

E.g. if I comment out

//    { 0x045e, 0x028e, "Microsoft X-Box 360 pad", 0, XTYPE_XBOX360 },

my X-Box 360 pad will not only lose any LED or rumble support, it will
also not report any input events with jstest because
xpad360_process_packet() is no longer called.

I'll try to check on how to read out the OS descriptor string, maybe
that allows us to detect the type on init and provide a better default
experience.

Best,
Benjamin
